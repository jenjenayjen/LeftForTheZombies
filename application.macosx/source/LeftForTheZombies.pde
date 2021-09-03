int x=620;
int y=20;

//scenes
boolean scene1=true;
boolean scene2=false;
boolean scene3=false;
boolean scene4=false;

int t= 3600+(60*15);


//backgrounds
PImage bedroom;
PImage doorway;
PImage policePill;
PImage policeNoPill;
PImage policeGun;
PImage policeShotgun;
PImage helicopter;
PImage handgunPill;

SceneOne one;
SceneTwo two;
SceneThree three;
SceneFour four;

void setup()
{
  size(800, 600);
  background(0);
  textAlign(CENTER);
  textSize(15);
  one = new SceneOne();
  two = new SceneTwo();
  three = new SceneThree();
  four = new SceneFour();

  frameRate(60);
  bedroom=loadImage("bedroom.jpg");
  doorway=loadImage("doorwayToHideout.jpg");
  policePill=loadImage("PoliceWpills.jpg");
  policeNoPill = loadImage("policeWgun.jpg");
  policeGun=loadImage("policeHandgun.jpg");
  policeShotgun = loadImage("policeShotgun.jpg");
  helicopter = loadImage("helicopter.jpg");
  handgunPill=loadImage("policeHandgunPill.jpg");
}


void draw()
{
  background(0);

  if (scene1==true)
  {
    one.show();
  }
  if (t>3600)
  {
    intro();
  }
  if (scene2 == true && scene1 == false)

  {
    two.show();
  }
  if (scene3 == true && scene2 == false)
  { 
    three.show();
  }
  if (scene4 == true && scene3 == false)
  {
    four.show();
  }
  if (key =='z')
  {
    scene1=true;
    scene2=false;
    scene3=false;
    scene4=false;
    t=3600;
    one.mj=false;
    one.gameOver=false;
    one.searchweapon=false;
    one.keepweapon=false;
    one.zombieAttackScene1=false;
    one.backdoor=false;
    two.deathSleep=false;
    two.run=false;
    two.sneak=false;
    two.runNgun=false;
    three.upgrade=false;
    three.roof=false;
    three.door=false;
    three.fight=false;
    three.takeShotgun=false;
    three.takePistol=false;
    four.pilotKill = false;
    four.waitForIt = false;
    four.shoot = false;
    four.jump = false;
    
  }
}
  void intro()
  {
    background(0);
    textSize(50);
    text("Left for the Zombies", 400, 200);
    textSize(15);
    text("In a Few moments you will be plunged into\n a zombie survival simulator.\n Press the letter of your survival choice. \n when you are presented with two options, click with the mouse.", 400, 350);
    text((t-3600)/60, 400, 550);
  }

  class SceneOne
  {
    boolean mj;
    boolean gameOver;
    boolean searchweapon;
    boolean keepweapon;
    boolean zombieAttackScene1;
    boolean backdoor;
    SceneOne()
    {
      gameOver=false;
      mj=false;
      searchweapon=false;
      keepweapon=false;
      zombieAttackScene1=false;
      backdoor=false;
    }

    void show()
    {
      image(bedroom, 0, 0, 800, 600);
      x=630;
      y=100;
      fill(255);
      textSize(15);
      text("You wake up in the morning to \n see a ZOMBIE APOCALYPSE \n outside your bedroom window \n What do you do?", x, y);
      fill(0, 0, 0, 225);
      stroke(255);
      rect(0, 550, 799, 50);

      fill(1);
      rect(400, 575, 799, 50);

      line(400, 550, 400, 600);
      line(0, 575, 800, 575);
      line(0, 599, 800, 599);
      fill(225);
      text("(a)Go back to sleep...", 200, 567);
      if (keepweapon==true)
      {
        fill(0);
        rect(400, 550, 400, 25);
      }
      text("(b)Find a weapon.", 600, 567);
      if (searchweapon==true&&zombieAttackScene1==false&&keepweapon==false)
      {
        text("You find a butter knife \n Do you keep it?", 630, 200);
        text("YES", 600, 250);
        text("NO", 660, 250);
      }
      if (backdoor==true)
      {
        fill(225);
        text("You lock the back door \n giving you more time to think... \n Which you just wasted reading this", 630, 275);
        fill(0);
        rect(0, 575, 400, 24);
      }
      else
      {
        fill(225);
      }
      text("(c)Lock the backdoor.", 200, 592);
      fill(225);
      text("(d)Watch TV.", 600, 592);
      if (t<60)
      {
        background(0);
        fill(225);
        textSize(50);
        text("GAME OVER", 400, 150);
        textSize(25);
        if (mj==true)
        {

          text("You go back to sleep only to wake up with a \n Zombified Michael Jackson in your bed as well...", 400, 300);
        }
        if (zombieAttackScene1==true)
        {
          text("You toss the knife behind you to look for a better weapon, \n but unfortunately break you own window in the process, \n attracting all the zombies.", 400, 300);
        }
      }
      else
      {
        text(t/60, 780, 535);
      }
      t--;
      if (scene2 == true)
      {
        two.show();
      }
      if (keyPressed)
      {
        if (key=='a')
        {
          t=0;
          mj=true;
        }

        if (key == 'b')
        {
          searchweapon=true;
        }


        if (key == 'c')
        {
          backdoor=true;
          t=t+15;
        }

        if (key == 'd')
        {
          scene1=false;
          scene2=true;
          t=3600;
          mj=false;
          searchweapon=false;
          keepweapon=false;
          zombieAttackScene1=false;
          backdoor=false;
        }
      }
      if (mousePressed)
      {
        if (searchweapon==true&&mouseX>585 && mouseX<615 && mouseY>235 && mouseY< 265)
        {
          keepweapon=true;
        }
        if (searchweapon==true&&mouseX>645 && mouseX<675 && mouseY>235 && mouseY< 265)
        {
          t=0;
          zombieAttackScene1=true;
        }
      }
    }
  }

  class SceneTwo
  {
    boolean deathSleep;
    boolean run;
    boolean sneak;
    boolean runNgun;
    SceneTwo()
    {
      deathSleep=false;
      run=false;
      sneak=false;
      runNgun=false;
    }


    void show()
    {
      image(doorway, 0, 0, 800, 600);
      x=100;
      y=50;
      fill(255);
      text("Watching TV, \nyou learn that the \n survivors  are hiding \n out at the Police Station. \n How will you get there?", x, y);
      fill(0, 0, 0, 225);
      stroke(255);
      rect(0, 550, 799, 50);

      fill(2);
      rect(400, 575, 799, 50);

      //rect(button1.posX, button1.posY, button1.endX - button1.posX, button1.endX - button1.endX);

      line(400, 550, 400, 600);
      line(0, 575, 800, 575);
      line(0, 599, 800, 599);
      fill(225);
      text("(e)Go back to sleep...", 200, 567);
      text("(f)Make a run for it!", 600, 567);
      text("(g)Sneak by the Zombies.", 200, 592);
      fill(225);
      text("(h)GO RAMBO!", 600, 592);
      if (t<60)
      {
        background(0);
        fill(225);
        textSize(50);
        text("GAME OVER", 400, 150);
        textSize(25);
        if (deathSleep==true)
        {
          text("You decide the ZOMBIE APOCALYPSE isn't worth your time, \n and goe back to sleep... Unfortunately, \n you realize that there is a \n Zombified Michael Jackson in your bed...", 400, 300);
        }
        if (run==true)
        {
          text("You make a break for the Police Station,\n  but run into a hoard of zombies on the way, \n which promptly eat you.", 400, 300);
        }
        if (runNgun==true)
        {
          text("You try to kill as many zombies as you can, \n but then realize that a butter knife was completely useless, \n and the zombies devour you.", 400, 300);
        }
      }
      else
      {
        text(t/60, 780, 535);
      }    
      t--;
      if (scene3 == true)
      {
        three.show();
      }
      if (keyPressed ==true)
      {

        if (key == 'e')
        {
          t=0;
          deathSleep=true;
          println(mouseX+" "+mouseY);
        }

        if (key == 'f')
        {
          run=true;
          t=0;
        }


        if (key == 'g')
        {
          scene3=true;
        }

        if (key == 'h')
        {
          runNgun=true;
          t=0;
        }
      }
    }
  }

  class SceneThree
  {
    boolean upgrade;
    boolean roof;
    boolean door;
    boolean fight;
    boolean takePistol;
    boolean takeShotgun;

    SceneThree()
    {
      upgrade=false;
      roof=false;
      door=false;
      fight=false;
      takeShotgun=false;
      takePistol=false;
    }

    void show()
    {
      if (takePistol==false||takeShotgun==false)
      {
        image(policePill, 0, 0, 800, 600);
      }
      if (takeShotgun==true)
      {
        image(policeShotgun, 0, 0, 800, 600);
      }
      if (takePistol==true)
      {
        image(handgunPill, 0, 0, 800, 600);
      }
      x=400;
      y=50;
      fill(0);
      text("You stealthly snuck past the zombies \n and made your way to the police station. \n You see a survivior and supplies. \n What do you do?", x, y);
      fill(0, 0, 0, 225);
      stroke(255);
      rect(0, 550, 799, 50);


      line(400, 550, 400, 600);
      line(0, 575, 800, 575);
      line(0, 599, 800, 599);

      if (upgrade==true)
      { 
        fill(0);
        text("ShotGun or Pistol?", 150, 50);
      }

      fill(225);
      text("(i)Get a better weapon.", 200, 567);
      fill(225);
      text("(j)Make your way to the roof.", 600, 567);
      if (door==true)
      {
        fill(0);
        text("You lock the door behind you to hold off \n the zombies for a little while longer", x, y+100);
        fill(0);
        //rect(400, 550, 400, 25);
      }
      textSize(15);
      text("(k)Lock the door behind you.", 200, 592);
      fill(225);
      text("(l)Team up to fight zombies.", 600, 592);
      if (t<0)
      {
        background(0);
        fill(225);
        textSize(50);
        text("GAME OVER", 400, 150);
        textSize(25);
        if (fight==true)
        {
          t=0;
          text("You decided to make your final stand in the Police Station, \n but in vain, you and your comrades fall \n one by one as you are overwhelmed by the \n zombies greater numbers.", 400, 300);
        }
      }
      else
      {
        fill(0);
        text(t/60, 780, 535);
      }    
      t--;

      if (keyPressed ==true)
      {
        if (key == 'i')
        {
          upgrade=true;
        }
        if (key == 'j')
        {
          roof=true;
          scene4=true;
          scene3=false;
        }
        if (key == 'k')
        {
          door=true;
          t=t+(15*60);
        }
        if (key == 'l')
        {
          fight=true;
          t=0;
        }
      }
      if (mousePressed)
      {
        if (mouseX<150&&mouseX>90&&mouseY<60&&mouseY>40)
        {
          takeShotgun=true;
          takePistol=false;
          println(mouseX);
        }
        if (mouseX<210&&mouseX>150&&mouseY<60&&mouseY>40)
        {
          takePistol=true;
          takeShotgun=false;
          println(mouseX);
        }
      }
    }
  }




  class SceneFour
  {
    boolean pilotKill;
    boolean waitForIt;
    boolean shoot;
    boolean jump;
    SceneFour()
    {
      pilotKill = false;
      waitForIt = false;
      shoot = false;
      jump = false;
    }
    void show()
    {
      image(helicopter, 0, 0, 800, 600);
      x=400;
      y=400;
      fill(0);
      text("You get on the helicopter as fast as you can,\n narrowly dodging the zombies on the roof.\n Now that you are safe in the air, \n what do you do?", x, y);
      fill(0, 0, 0, 225);
      stroke(255);
      rect(0, 550, 799, 50);

      fill(2);
      rect(400, 575, 799, 50);

      line(400, 550, 400, 600);
      line(0, 575, 800, 575);
      line(0, 599, 800, 599);
      fill(225);
      text("(m)Kill the pilot.", 200, 567);
      text("(n)Wait.", 600, 567);
      text("(o)Shoot at zombies below.", 200, 592);
      fill(225);
      text("(p)Jump out!", 600, 592);
      if (t<60)
      {
        background(0);
        fill(225);
        textSize(50);
        text("GAME OVER", 400, 150);
        textSize(25);
        if (pilotKill==true)
        {
          text("In a moment of sheer impule and stupidity, \n you shoot the pilot, \n causing the helicopter to plummet into the ground with you in it.", 400, 300);
        }
        if (waitForIt==true)
        {
          text("While you enjoy your moment of \n relaxation safely away from zombies,\n you did not notice the pilot becoming a \n zombie himself while he knawed on your leg.", 400, 300);
        }
        if (shoot==true)
        {
          text("You fired into zombies below, but at this distance,\n you cause more property damage than zombie damage. \n Plus the recoil from your gun sends you flying off the helicopter.", 400, 300);
        }
        if (jump == true)
        {
          text("Remembering your incredible fear of heights, \n you jump out of the helicopter only to realize that \n falling several hundred feet is even more dangerous.", 400, 300);
        }
      }

      else
      {
        fill(0);
        text(t/60, 780, 535);
      }    
      t--;

      if (keyPressed ==true)
      {
        if (key == 'm')
        {
          t=0;
          pilotKill=true;
        }

        if (key == 'n')
        {
          waitForIt=true;
          t=0;
        }
        if (key == 'o')
        {
          t=0;
          shoot=true;
        }
        if (key == 'p')
        {
          jump=true;
          t=0;
        }
      }
    }
  }

