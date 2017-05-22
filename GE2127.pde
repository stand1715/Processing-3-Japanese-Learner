import ddf.minim.*;
import java.util.*;

// Declaration for Font
PFont Japanese_Font;
PFont word_Font;
PFont done_Font;
// Declaration and Initialization for Array of Japanese Words
String current_kana_mode = "hiragana";
String Japanese_50_hiragana = "わらやまはなたさかあ　り　みひにちしきいをるゆむふぬつすくう　れ　めへねてせけえんろよもほのとそこお";
String Japanese_50_katakana = "ワラヤマハナタサカア　リ　ミヒニチシキイヲルユムフヌツスクウ　レ　メヘネテセケエンロヨモホノトソコオ";
String Japanese_aiueo_hiragana = "あいうえお表";
String Japanese_aiueo_katakana = "アイウエオ表";
String current_Japanese_50 = Japanese_50_hiragana;
String current_Japanese_aiueo = Japanese_aiueo_hiragana;
String[] Japanese_words_hiragana = {"わなぐ","らいおん","やま","まめ","はち","なすび","たぬき","さる","かえる","あり","","りんご","","みかん","ひよこ","にんじん","ちーず","しんごう","きつね","いぬ","ほんをよむ","るびー","ゆきだるま","むしば","ふうせん","ぬりえ","つみき","すおか","くれよん","うさぎ","","れもん","","めがね","へび","ねこ","てんとうむし","せみ","けむし","えんぴつ","ぴんぎん","ろぼっと","よっと","もぐら","ほし","のこぎり","とけい","そら","こま","おさけ"}; 
String[] Japanese_words_katakana = {"ワナグ","ライオン","ヤマ","マメ","ハチ","ナスビ","タヌキ","サル","カエル","アリ","","リンゴ","","ミカン","ヒヨコ","ニンジン","チーズ","シンゴウ","キツネ","イヌ","ホンヲヨム","ルビー","ユキダルマ","ムシバ","フウセン","ヌリエ","ツミキ","スオカ","クレヨン","ウサギ","","レモン","","メガネ","ヘビ","ネコ","テントウムシ","セミ","ケムシ","エンピツ","ピンギン","ロボット","ヨット","モグラ","ホシ","ノコギリ","トケイ","ソラ","コマ","オサケ"};
String[] Japanese_words_romaji = {"wa","ra","ya","ma","ha","na","ta","sa","ka","a","","ri","","mi","hi","ni","chi","shi","ki","i","wo","ru","yu","mu","fu","nu","tsu","su","ku","u","","re","","me","he","ne","te","se","ke","e","n","ro","yo","mo","ho","no","to","so","ko","o"};
String[] current_Japanese_words = Japanese_words_hiragana;
String current_mode = "display";
String random_50_hiragana = "てとくけこさいつなにぬねむやよらめたちのはひうえれろわきふへほまみあもりせそるをんおかゆしす";
String random_50_katakara = "テトクケコサイツナニヌネムヤヨラメタチノハヒウエレロワキフヘホマミアモリセソルヲンオカユシス";
String current_random_50 = random_50_hiragana;
String[] Japanese_words_Chinese_meaning = {"投環遊戲","獅子","山","豆","蜜蜂","茄子","松鼠","猴子","青蛙","蟻","","蘋果","","橙","小雞","蘿白","芝士","紅綠燈","狐狸","狗","看書","寶石","雪人","蛀牙","氣球","上色遊戲","積木","西瓜","蠟筆","兔子","","檸檬","","眼鏡","蛇","貓","飄蟲","蟬","毛蟲","鉛筆","企鵝","機械人","帆船","鼠","星星","鋸","鐘","天空","陀螺","杓子"};

// Declaration and Initialization for Table
int origin_rect_x = 70;
int origin_rect_y = 100;
int rect_width = 60;
int rect_length = 72;
int distance_between_rect = 5;
int distance_frame = 18;
int background_circle_size = 110;

int kana_offset_x = 27;
int kana_offset_y = 32;
int kana_size = 34;

int kana_practice_offset_x = 10;
int kana_practice_offset_y = 55;
int kana_practice_size = 50;

int kana_romaji_offset_x = 5;
int kana_romaji_offset_y = 15;
int kana_romaji_size = 12;

int word_offset_x = 29;
int word_offset_y = 65;
int word_size = 8;

int kana_option_size = 26;
int kana_option_offset_x = 24;
int kana_option_offset_y = 30;
int kana_option_origin_x = 100;
int kana_option_origin_y = 570;
int option_selected = -1;

Boolean option_holding = false;
Boolean[] correct_selected = new Boolean[50];

int[] writting_point_x = new int[1];
int[] writting_point_y = new int[1];

// Declaration and Initialization for Picture
int image_offset_x = 3;
int image_offset_y = 42;
int picture_size = 24;
Boolean[] picture_selected = new Boolean[50];

// Declaration and Initialization for Detail Page
int detailed_picture_bg_size = 600;

int detailed_picture_size = 250;
int detailed_picture_x = 280;
int detailed_picture_y = 285;

int detailed_kana_size = 155;
int detailed_kana_x = 380;
int detailed_kana_y = 250;

int detailed_kana_romaji_size = 50;
int detailed_kana_romaji_x = 530;
int detailed_kana_romaji_y = 255;
 
int detailed_word_size = 38;
int detailed_word_x = 550;
int detailed_word_y = 470;

int chinese_size = 35;
int chinese_x = 555;
int chinese_y = 410;

int img_close_size = 100;
int img_close_x = 660;
int img_close_y = 110;

int img_sound_size = 70;
int img_sound_x = 280;
int img_sound_y = 185;

Boolean detail_picture_show = false;
        
// Declaration and Initialization for Title
int title_origin = origin_rect_x + 160;
int title_circle_size = 55;
int title_font_size = 42;
int title_circle_offset_y = 50;
int title_font_offset_y = 38;
int distance_between_title_circle = 10;

// Declaration and Initialization for Buttons
int button_offset = 30;
int button_size = 80;
int font_offset_x = 40;
int font_offset_y = 60;

// Declaration and Initialization for Images
PImage[] img = new PImage[50];
PImage img_lion;
int img_lion_x = 650;
int img_lion_y = 450;
int img_lion_width = 300;
int img_lion_height = 200;
PImage img_book;
PImage img_practice;
int img_practice_offset = 16;
int img_practice_width = 50;
int img_practice_height = 50;
PImage img_game;
PImage img_close;
PImage img_sound;
PImage img_sound_play;
PImage img_yes;
PImage img_no;
PImage img_bg;
PImage img_done;
PImage img_pencil;
int img_pencil_offset = 16;
int img_pencil_width = 50;
int img_pencil_height = 50;
PImage img_eraser;
int img_eraser_offset = 16;
int img_eraser_width = 50;
int img_eraser_height = 50;

float el_y = 0;
float el_x = 0;


int img_yes_x = 320;
int img_no_x = 550;
int img_yes_y = 415;
int img_no_y = 415;
int yes_size_x=100;
int yes_size_y=50;
int no_size_x=100;
int no_size_y=50;
int second = 0;
int minute = 0;
int startTime = 0;
int game_done_size_x=500;
int game_done_size_y=500;
boolean game_done_show = false;
boolean reset = false;
int done = 0;

Minim mnm;
AudioPlayer[] m2 = new AudioPlayer[50];
boolean hold_sound = false;
int holdsecond=second();
int sound_duration = 3;
int x1,x2,y1,y2;
ArrayList<Line> lines_hiragana = new ArrayList<Line>();
ArrayList<Line> lines_katakana = new ArrayList<Line>();
ArrayList<Eraser> erasers_hiragana = new ArrayList<Eraser>();
ArrayList<Eraser> erasers_katakana = new ArrayList<Eraser>();
boolean pencil = false;
boolean eraser = false;

class Eraser {
  float x1,x2,y1,y2;
  
  Eraser() {
    x1=0;x2=0;y1=0;y2=0;
  }
  
  Eraser(float new_x1,float new_y1, float new_x2, float new_y2) {
    x1=new_x1;x2=new_x2;y1=new_y1;y2=new_y2;
  }
  
  void display(){
    stroke(255);
    line(x1,y1,x2,y2);
  } 
  
}

class Line {
  float x1,x2,y1,y2;
  
  Line() {
    x1=0;x2=0;y1=0;y2=0;
  }
  
  Line(float new_x1,float new_y1, float new_x2, float new_y2) {
    x1=new_x1;x2=new_x2;y1=new_y1;y2=new_y2;
  }
  
  void display(){
    stroke(1);
    line(x1,y1,x2,y2);
  } 
}


void setup()
{
  size(960,670);
  smooth(8);
  img_bg = loadImage("pictures/background.jpg");
  img_bg.resize(960,670);
  
  background(img_bg);
  
  Japanese_Font = createFont( "AppleSDGothicNeo-Heavy", kana_size, true);
  word_Font = createFont( "AppleSDGothicNeo-Regular", word_size, true);
  done_Font = loadFont("data/Noteworthy-Bold-36.vlw");
  //done_Font = createFont( "AppleSDGothicNeo-Heavy", kana_size, true);
  mnm = new Minim(this);
  
  
  
  // Image load
  for (int i = 0; i < 50; i++){
    if (i+1 == 11 || i+1 == 13 || i+1 == 31 || i+1 == 33) continue;
    img[i] = loadImage("pictures/" + str(i+1) + ".png");
  }
  img_lion = loadImage("pictures/2.png");
  img_practice = loadImage("button/practice.png");
  img_book = loadImage("button/book.png");
  img_game = loadImage("button/game.png");
  img_close = loadImage("button/close.png");
  img_sound = loadImage("button/sound.png");
  img_sound_play = loadImage("button/sound_play.png");
  img_yes = loadImage("button/img_yes.png");
  img_no = loadImage("button/img_no.png");
  img_done = loadImage("pictures/test.png");
  img_pencil = loadImage("button/pencil.png");
  img_eraser = loadImage("button/eraser.png");

  el_y = random(-5,5);
  el_x = random(-5,5);
  
  // initialize Boolean false
  for(int i=0; i < 50; i++){
    correct_selected[i] = false;
    picture_selected[i] = false;
  }
  
  // random 50 kana for game TODO
  //for(int i=0; i < 50; i++){
  //random_50_hiragana[i] = Japanese_50_hiragana[random[]]
  //}
}
void draw() {
  
  // Refresh
  background(img_bg);
  // Table Circle Background
  fill(#67AD00);
  noStroke();
  int offset_y = 0;
  
    for(int i=0; i<6; i++){  
    for(int j=0; j<10; j++){
      if ( i==0 && 9>j && j>0){ offset_y = -35;}
      if ( i==5 && 9>j && j>0){ offset_y = 10;}
      ellipse(16 + origin_rect_x + 68*j + el_y , offset_y + 10 + origin_rect_y + 70*i + el_x , background_circle_size, background_circle_size);
      offset_y = 0;
    }
  }

  // Table Yellow Background
  fill(#EAA91A);
  stroke(#EAA91A);
  strokeWeight(distance_frame);
  strokeJoin(ROUND);
  rect(origin_rect_x ,origin_rect_y, rect_width*10 + distance_between_rect*9, rect_length*5 + distance_between_rect*4);
  
  // Title
  fill(#EAA91A);
  noStroke();
  ellipse(title_origin, origin_rect_y - 50 , title_circle_size -5, title_circle_size);
  ellipse(title_origin + (title_circle_size + distance_between_title_circle)*1 , origin_rect_y - title_circle_offset_y -1, title_circle_size, title_circle_size);
  ellipse(title_origin + (title_circle_size + distance_between_title_circle)*2 , origin_rect_y - title_circle_offset_y -7, title_circle_size, title_circle_size);
  ellipse(title_origin + (title_circle_size + distance_between_title_circle)*3 , origin_rect_y - title_circle_offset_y +3, title_circle_size, title_circle_size);
  ellipse(title_origin + (title_circle_size + distance_between_title_circle)*4 , origin_rect_y - title_circle_offset_y -2, title_circle_size, title_circle_size);
  ellipse(title_origin + (title_circle_size + distance_between_title_circle)*5 , origin_rect_y - title_circle_offset_y -0, title_circle_size, title_circle_size);
  fill (#ffffff);
  textFont(Japanese_Font, title_font_size);
  textAlign(CENTER);
  text(current_Japanese_aiueo.charAt(0), title_origin , origin_rect_y - title_font_offset_y);
  text(current_Japanese_aiueo.charAt(1), title_origin + (title_circle_size + distance_between_title_circle)*1, origin_rect_y - title_font_offset_y -1);
  text(current_Japanese_aiueo.charAt(2), title_origin + (title_circle_size + distance_between_title_circle)*2, origin_rect_y - title_font_offset_y -7);
  text(current_Japanese_aiueo.charAt(3), title_origin + (title_circle_size + distance_between_title_circle)*3, origin_rect_y - title_font_offset_y +3);
  text(current_Japanese_aiueo.charAt(4), title_origin + (title_circle_size + distance_between_title_circle)*4, origin_rect_y - title_font_offset_y -2);
  text(current_Japanese_aiueo.charAt(5), title_origin + (title_circle_size + distance_between_title_circle)*5, origin_rect_y - title_font_offset_y -0);
  
  if(current_mode !="practice") {
    pencil = false;
    eraser = false;
  }
  // Display - Table Content
  if(current_mode == "display"){
    int num_count = 0;
    noStroke();
    for(int j=0; j<5; j++){  
      for(int i=0; i<10; i++){
        if (mouseX > origin_rect_x + (distance_between_rect + rect_width)*i && mouseX < origin_rect_x + (distance_between_rect + rect_width)*i + rect_width && mouseY > origin_rect_y + (distance_between_rect + rect_length)*j && mouseY < origin_rect_y + (distance_between_rect + rect_length)*j + rect_length){
          // Orange Box
          fill(#FFE134);
          rect(origin_rect_x + (distance_between_rect + rect_width)*i, origin_rect_y + (distance_between_rect + rect_length)*j, rect_width, rect_length);
          // Japanese Kana White
          fill(#ffffff);
          textFont(Japanese_Font, kana_size);
          textAlign(LEFT);
          text(current_Japanese_50.charAt(num_count), origin_rect_x + (distance_between_rect + rect_width)*i + kana_offset_x, origin_rect_y + (distance_between_rect + rect_length)*j + kana_offset_y);
          
          textFont(word_Font, word_size);
        text(current_Japanese_words[num_count], origin_rect_x + (distance_between_rect + rect_width)*i + word_offset_x, origin_rect_y + (distance_between_rect + rect_length)*j + word_offset_y);
        }else{
        // White Box
        fill(#ffffff);
        rect(origin_rect_x + (distance_between_rect + rect_width)*i, origin_rect_y + (distance_between_rect + rect_length)*j, rect_width, rect_length);
        
        // Japanese Kana Black
        fill(0);
        textFont(Japanese_Font, kana_size);
        textAlign(LEFT);
        text(current_Japanese_50.charAt(num_count), origin_rect_x + (distance_between_rect + rect_width)*i + kana_offset_x, origin_rect_y + (distance_between_rect + rect_length)*j + kana_offset_y);
        
        textFont(word_Font, word_size);
        text(current_Japanese_words[num_count], origin_rect_x + (distance_between_rect + rect_width)*i + word_offset_x, origin_rect_y + (distance_between_rect + rect_length)*j + word_offset_y);
        }
        
        // Japanese Romaji Red
        fill(#e5193b);
        textFont(Japanese_Font, kana_romaji_size);
        text(Japanese_words_romaji[num_count], origin_rect_x + (distance_between_rect + rect_width)*i + kana_romaji_offset_x, origin_rect_y + (distance_between_rect + rect_length)*j + kana_romaji_offset_y);
         
        // number count
        if (num_count+1 == 11 || num_count+1 == 13 || num_count+1 == 31 || num_count+1 == 33) {num_count++; continue;}
           
        // Image
        image(img[num_count], origin_rect_x + (distance_between_rect + rect_width)*i + image_offset_x, origin_rect_y + (distance_between_rect + rect_length)*j + image_offset_y,picture_size,picture_size);
      
        num_count++; 
      }
    }
    
    // picture detail
    if (detail_picture_show == true){
    int num_count_picture_detail = 0;
    for(int j=0; j<5; j++){  
     for(int i=0; i<10; i++){
        if (num_count_picture_detail+1 == 11 || num_count_picture_detail+1 == 13 || num_count_picture_detail+1 == 31 || num_count_picture_detail+1 == 33) 
          {
            num_count_picture_detail++; continue;
          }
        if (picture_selected[num_count_picture_detail] == true){
          picture_detail(num_count_picture_detail);
          break;
        }
        num_count_picture_detail++;
       }
      }
    }

  }
  // Practice mode
  else if (current_mode == "practice"){
    strokeWeight(3);
    int num_count = 0;
    noStroke();
    for(int j=0; j<5; j++){  
      for(int i=0; i<10; i++){
        // White Box
        fill(#ffffff);
        rect(origin_rect_x + (distance_between_rect + rect_width)*i, origin_rect_y + (distance_between_rect + rect_length)*j, rect_width, rect_length);
        if (num_count+1 == 11 || num_count+1 == 13 || num_count+1 == 31 || num_count+1 == 33) {num_count++; continue;}
          
        // Japanese Kana
        fill (#f2f2f2);
        textFont(Japanese_Font, kana_practice_size);
        textAlign(LEFT);
        text(current_Japanese_50.charAt(num_count), origin_rect_x + (distance_between_rect + rect_width)*i + kana_practice_offset_x, origin_rect_y + (distance_between_rect + rect_length)*j + kana_practice_offset_y);
        
        // Japanese Romaji Red
        fill(#ffb7c3);
        textFont(Japanese_Font, kana_romaji_size);
        text(Japanese_words_romaji[num_count], origin_rect_x + (distance_between_rect + rect_width)*i + kana_romaji_offset_x, origin_rect_y + (distance_between_rect + rect_length)*j + kana_romaji_offset_y);
        num_count++;
      }
    }
    Line li_k, li_h;
    if ( current_kana_mode == "katakana") {
      
      for (int i = 0; i<lines_katakana.size();i++) {
        li_k =lines_katakana.get(i); 
        li_k.display();
      }
     
    }
    else {
      for (int i = 0; i<lines_hiragana.size();i++) {
        li_h =lines_hiragana.get(i); 
        li_h.display();
      }
      
    }
   
    
  } 
  // game mode
  else {
    int num_count = 0;
    noStroke();
    for(int j=0; j<5; j++){  
      for(int i=0; i<10; i++){
        // White Box
        fill(#ffffff);
        rect(origin_rect_x + (distance_between_rect + rect_width)*i, origin_rect_y + (distance_between_rect + rect_length)*j, rect_width, rect_length);
        
        if (num_count+1 == 11 || num_count+1 == 13 || num_count+1 == 31 || num_count+1 == 33) {num_count++; continue;}
        
        // Japanese Romaji Red
        fill(#ffb7c3);
        textFont(Japanese_Font, kana_romaji_size);
        text(Japanese_words_romaji[num_count], origin_rect_x + (distance_between_rect + rect_width)*i + kana_romaji_offset_x, origin_rect_y + (distance_between_rect + rect_length)*j + kana_romaji_offset_y);
        
        // Japanese Kana
        if ( option_selected != -1 && correct_selected[num_count] == true){
          fill (0);
        }else{    
          fill (#ffffff);
        }
        textFont(Japanese_Font, kana_practice_size);
        textAlign(LEFT);
        text(current_Japanese_50.charAt(num_count), origin_rect_x + (distance_between_rect + rect_width)*i + kana_practice_offset_x, origin_rect_y + (distance_between_rect + rect_length)*j + kana_practice_offset_y);
           
        num_count++;  
        
      }
    }
  }
  
  // Game - random options 
  if ( current_mode == "game"){
    fill(#ffffff);
    stroke(#F6B51D);
    strokeWeight(10);
    
    rect(kana_option_origin_x - 10, kana_option_origin_y -30, kana_option_offset_x*16 +15, kana_option_offset_y*3 +10 );
    int num_count_game = 0;
    for(int i=0; i < 3; i++){
      for(int j=0; j < 16 ; j++){
        // check for if there is no kana. If yes, continue it.
        //if (current_random_50.charAt(num_count_game) == '　') {num_count_game++; continue; } 
        
        // space
        if (num_count_game == option_selected) {
            text('　', kana_option_origin_x + kana_option_offset_x*j , kana_option_origin_y + kana_option_offset_y*i);
            num_count_game++;
            continue;
        };
        if (num_count_game >= 46) break;
        fill(0);
        for(int k = 0; k < 50; k++){
          if (current_random_50.charAt(num_count_game) == current_Japanese_50.charAt(k) && correct_selected[k] == true){
            fill(#ffffff); 
            break;
          }
        }
        textFont(Japanese_Font, kana_option_size);
        text(current_random_50.charAt(num_count_game), kana_option_origin_x + kana_option_offset_x*j , kana_option_origin_y + kana_option_offset_y*i);
        num_count_game++;
      }
    }
    if (reset == true){
      reset();
    }
    if (done!=46) {
        second = (millis() - startTime)/1000;
        if(second >59) {
          startTime=millis();
          minute+=1;
        }
    }
    fill(0);
    textAlign(CENTER);
    textFont(Japanese_Font, 24);
    text("Game time ",width/2+120,height/2+230);
    text(nf(minute,2) +":"+ nf(second,2) ,width/2+92,height/2+250);
    
    if (game_done_show==true)
      game_done();
  }
  
  // Button1 - Switch Kana
  if (width - button_offset > mouseX && mouseX > width - button_offset - button_size && mouseY > button_offset && mouseY < button_offset + button_size)
  {
     fill(#F6B51D);
  }else {
     fill(#ffffff);
  }
  stroke(#FFE134);
  strokeWeight(10);
  rect(width - button_offset - button_size, button_offset, button_size, button_size);
  if (width - button_offset > mouseX && mouseX > width - button_offset - button_size && mouseY > button_offset && mouseY < button_offset + button_size)
  {
     fill(#ffffff);
  }else {
     fill(#F6B51D);
  }
  textFont(Japanese_Font, 50);
  textAlign(CENTER);
  if( current_kana_mode == "hiragana"){
    // hiragana
    text("平",width - button_offset - button_size + font_offset_x, button_offset + font_offset_y);
  }else{
    // katakana
    text("片",width - button_offset - button_size + font_offset_x, button_offset + font_offset_y);
  }
  
  // Button2 - Writing Practice 
  if (width - button_offset > mouseX && mouseX > width - button_offset - button_size && mouseY > button_offset*2 + button_size && mouseY < button_offset*2 + button_size + button_size)
  {
     fill(#F6B51D);
  }else {
     fill(#ffffff);
  }
  stroke(#FFE134);
  strokeWeight(10);
  rect(width - button_offset - button_size, button_offset*2 + button_size, button_size, button_size);
  if( current_mode == "display" || current_mode == "game"){
    image(img_practice, width - button_offset - button_size + img_practice_offset, button_offset*2 + button_size + img_practice_offset, img_practice_width, img_practice_height);
  }else{
    image(img_book, width - button_offset - button_size + img_practice_offset, button_offset*2 + button_size + img_practice_offset, img_practice_width, img_practice_height);
  }
  
  // Button3 - grab & drag game
  if (width - button_offset > mouseX && mouseX > width - button_offset - button_size && mouseY > button_offset*3 + button_size*2 && mouseY < button_offset*3 + button_size*2 + button_size)
  {
     fill(#F6B51D);
  }else {
     fill(#ffffff);
  }
  stroke(#FFE134);
  strokeWeight(10);
  rect(width - button_offset - button_size, button_offset*3 + button_size*2, button_size, button_size);
  if( current_mode == "display" || current_mode == "practice"){
    image(img_game, width - button_offset - button_size + img_practice_offset, button_offset*3 + button_size*2 + img_practice_offset, img_practice_width, img_practice_height);
  }else{
    image(img_book, width - button_offset - button_size + img_practice_offset, button_offset*3 + button_size*2 + img_practice_offset, img_practice_width, img_practice_height);
  }
  
  
  image(img_lion, img_lion_x, img_lion_y, img_lion_width, img_lion_height);
  
  // cursor  
  if(current_mode == "practice"){
    image(img_eraser, width - button_offset - 70 - button_size + img_eraser_offset, button_offset*4 + button_size*3 + img_eraser_offset, img_eraser_width, img_eraser_height);
    image(img_pencil, width - button_offset - button_size + img_pencil_offset, button_offset*4 + button_size*3 + img_pencil_offset, img_pencil_width, img_pencil_height);
      boolean show = pencil;
      if (width - button_offset > mouseX && mouseX > width - button_offset - button_size && mouseY > button_offset*2 + button_size && mouseY < button_offset*2 + button_size + button_size){ 
          show = false;
          cursor(HAND);
        } else if (width - button_offset > mouseX && mouseX > width - button_offset - button_size && mouseY > button_offset && mouseY < button_offset + button_size){
          show = false;
          cursor(HAND); 
        } else if (width - button_offset > mouseX && mouseX > width - button_offset - button_size && mouseY > button_offset*3 + button_size*2 && mouseY < button_offset*3 + button_size*2 + button_size){
          show = false;
          cursor(HAND); 
        } else if (width - button_offset - 70 > mouseX && mouseX > width - button_offset -70 - button_size && mouseY > button_offset*4 + button_size*3 && mouseY < button_offset*4 + button_size*3 + button_size){
          show = false;
          cursor(HAND); 
        }
        if(pencil==true && show==true) { 
          image(img_pencil,mouseX,mouseY-28,30,30);
          noCursor(); 
        }
        
    if (mousePressed == true){
      if ( current_kana_mode == "katakana") {
        if (pencil == true) {
            lines_katakana.add(new Line(mouseX,mouseY,pmouseX,pmouseY));
        } 
          //else if (eraser ==true) {
          //  erasers_katakana.add(new Eraser(mouseX,mouseY,pmouseX,pmouseY));
          //  Line li_k, li_h;
          //  Eraser er_k;
          //  if(erasers_katakana.size()!=0) {
          //    for (int j = 0; j<erasers_katakana.size();j++) {
          //      er_k =erasers_katakana.get(j);
          //      for (int i = 0; i<lines_katakana.size();i++) {
          //        li_k =lines_katakana.get(i);
          //        if (li_k.x1==er_k.x1 && li_k.x2==er_k.x2 && li_k.y1==er_k.y1 && li_k.y2==er_k.y2) {
          //          lines_katakana.remove(i);
          //        }
          //      }
          //    }
          //  }
          //}
      }
      else if ( current_kana_mode == "hiragana") {
        if (pencil == true) {
            lines_hiragana.add(new Line(mouseX,mouseY,pmouseX,pmouseY));
        }
      }
    }
    
    }else if (current_mode == "game") {
       if(option_holding == false){
        cursor(HAND);
       }else{
        fill(0);
        text(current_random_50.charAt(option_selected), mouseX, mouseY);
       }
     }else {
      cursor();
     }
}



void mousePressed(){
  if ( current_mode == "game"){ 
    if (done!=46) { 
    int num_count_option_selected = 0;
    for(int i=0; i < 3; i++){
      for(int j=0; j < 16 ; j++){
        if ( num_count_option_selected >= 46) break;
        if (mouseX > kana_option_origin_x + kana_option_offset_x*j && mouseX < kana_option_origin_x + kana_option_offset_x*(j+1) && mouseY > kana_option_origin_y + kana_option_offset_y*i -20 && mouseY < kana_option_origin_y + kana_option_offset_y*(i+1) -20)
        {
          option_selected = num_count_option_selected;
          option_holding = true;
          break;
        }
        num_count_option_selected++;
      }
    }
    
    if (option_selected != -1){
      int num_count = 0;
      for(int j=0; j<5; j++){
          for(int i=0; i<10; i++){
             if (current_Japanese_50.charAt(num_count) == current_random_50.charAt(option_selected) && mouseX > origin_rect_x + (distance_between_rect + rect_width)*i && mouseX < origin_rect_x + (distance_between_rect + rect_width)*i + rect_width && mouseY > origin_rect_y + (distance_between_rect + rect_length)*j && mouseY < origin_rect_y + (distance_between_rect + rect_length)*j + rect_length){
                 correct_selected[num_count] = true;
                 option_holding = false;
                 done += 23;
             } 
             num_count++;
          }
      }
    }
  }
    if(done==46) {
      game_done_show=true;
    }
  }
}

void mouseClicked(){
  if ( current_mode == "practice"){
      if (width - button_offset > mouseX && mouseX > width - button_offset - button_size && mouseY > button_offset*4 + button_size*3 && mouseY < button_offset*4 + button_size*3 + button_size){
         pencil = true;
         //noCursor();
        } else if (width - button_offset -70 > mouseX && mouseX > width - button_offset - 70 - button_size && mouseY > button_offset*4 + button_size*3 && mouseY < button_offset*4 + button_size*3 + button_size){
         pencil = false;
         if ( current_kana_mode == "hiragana") {
         lines_hiragana.clear();
         }
         if ( current_kana_mode == "katakana") {
           lines_katakana.clear();
         }
      }
  }
  
  if (width - button_offset > mouseX && mouseX > width - button_offset - button_size && mouseY > button_offset && mouseY < button_offset + button_size){
      if ( current_kana_mode == "katakana") {
        startTime = millis();
        current_kana_mode = "hiragana";
        current_Japanese_50 = Japanese_50_hiragana;
        current_Japanese_aiueo = Japanese_aiueo_hiragana;
        current_Japanese_words = Japanese_words_hiragana;
      }
      else {
        startTime = millis();
        current_kana_mode = "katakana";
        current_Japanese_50 = Japanese_50_katakana;
        current_Japanese_aiueo = Japanese_aiueo_katakana;
        current_Japanese_words = Japanese_words_katakana;
      }
  }
  if (width - button_offset > mouseX && mouseX > width - button_offset - button_size && mouseY > button_offset*2 + button_size && mouseY < button_offset*2 + button_size + button_size){ 
    if ( current_mode == "display" || current_mode == "game") {
        current_mode = "practice";
      }
      else{
        current_mode = "display";
      }
  }
   if (width - button_offset > mouseX && mouseX > width - button_offset - button_size && mouseY > button_offset*3 + button_size*2 && mouseY < button_offset*3 + button_size*2 + button_size){
     if ( current_mode == "display" || current_mode == "practice") {
        current_mode = "game";
        startTime = millis();
      }
      else {
        current_mode = "display";
      }
  }
  
  if ( current_mode =="game" && game_done_show == true && mouseX > img_yes_x && mouseX < img_yes_x + yes_size_x 
  && mouseY > img_yes_y && mouseY < img_yes_y + yes_size_y){
    for(int i = 0; i<50;i++) {
        correct_selected[i] = false;
        }
        option_selected=-1;
    game_done_show = false;
    reset = true;
    reset();
  }
  
  if ( current_mode =="game" && game_done_show == true && mouseX > img_no_x && mouseX < img_no_x + no_size_x 
  && mouseY > img_no_y && mouseY < img_no_y + no_size_y){
    game_done_show = false;
  }
  
  
  
  if ( current_mode == "display" && detail_picture_show == false ){
    int num_count_picture =0;
    for(int j=0; j<5; j++){  
      for(int i=0; i<10; i++){
        if (mouseX > origin_rect_x + (distance_between_rect + rect_width)*i && mouseX < origin_rect_x + (distance_between_rect + rect_width)*i + rect_width && mouseY > origin_rect_y + (distance_between_rect + rect_length)*j && mouseY < origin_rect_y + (distance_between_rect + rect_length)*j + rect_length){
             picture_selected[num_count_picture] = true;
             detail_picture_show = true;
             break;
        }
        num_count_picture++;
      }
    }
  }
  


  
  else if ( current_mode == "display" && detail_picture_show == true && mouseX > img_sound_x && mouseX < img_sound_x + img_sound_size && mouseY > img_sound_y && mouseY < img_sound_y + img_sound_size){
    hold_sound = true;
    if (second() >59 - sound_duration) {
      holdsecond = sound_duration+second()-60;}
      else
      holdsecond = second()+ sound_duration;
    for (int i = 0; i<50;i++) {
      if(picture_selected[i] == true) { 
      m2[i] = mnm.loadFile("mp3/" +(i+1) +".mp3");
      m2[i].play();
    }
    }
  }
  
  // close function
  else if ( current_mode == "display" && detail_picture_show == true && mouseX > img_close_x && mouseX < img_close_x + img_close_size && mouseY > img_close_y && mouseY < img_close_y + img_close_size){
    detail_picture_show = false;
    for(int i=0; i < 50; i++){
      picture_selected[i] = false;
    }
  }

}

void reset() {
  done = 0;
  minute = 0;
  second = 0;
  reset = false;
  startTime = millis();
}

void game_done(){
  
  fill(#FAF3D1);
        stroke(#F6B51D);
        strokeWeight(10);
        ellipseMode(CENTER);
        ellipse(width/2, height/2, game_done_size_x, game_done_size_y);
        fill(0);
        textAlign(CENTER);
        textFont(done_Font);
        image(img_done, width/2-100, height/2-170,200,150);
        text("Congratulations!!",width/2,height/2);
        text("You've finish the game in " + nf(minute,2) +":" + nf(second,2),width/2,height/2+36);
        text("RESTART?",width/2+12,height/2+80);
        image(img_yes, img_yes_x, img_yes_y, yes_size_x, yes_size_y);
        image(img_no, img_no_x, img_no_y, no_size_x, no_size_y);
}

void picture_detail(int num_count){
        // White Box
        fill(#ffffff);
        stroke(#F6B51D);
        strokeWeight(10);
        ellipseMode(CENTER);
        ellipse(width/2, height/2, detailed_picture_bg_size, detailed_picture_bg_size);
        
        // Japanese Kana Black
        fill(0);
        textFont(Japanese_Font, detailed_kana_size);
        textAlign(LEFT);
        text(current_Japanese_50.charAt(num_count), detailed_kana_x, detailed_kana_y);
        
        textFont(word_Font, detailed_word_size);
        text(current_Japanese_words[num_count], detailed_word_x, detailed_word_y);

        // Japanese Romaji Red
        fill(#E5193b);
        textMode(CENTER);
        textFont(Japanese_Font, detailed_kana_romaji_size);
        text(Japanese_words_romaji[num_count], detailed_kana_romaji_x, detailed_kana_romaji_y);
        
        // Chinese meaning
        fill(0);
        textFont(Japanese_Font, chinese_size);
        text(Japanese_words_Chinese_meaning[num_count],chinese_x,chinese_y);
        
        // Image
        imageMode(CORNER);
        image(img[num_count], detailed_picture_x, detailed_picture_y, detailed_picture_size, detailed_picture_size);
        
        // sound
        if (hold_sound==true)
        image(img_sound_play, img_sound_x, img_sound_y, img_sound_size, img_sound_size);
        if (second()==holdsecond)
        hold_sound=false;
        if (hold_sound==false)
        image(img_sound, img_sound_x, img_sound_y, img_sound_size, img_sound_size);
        // close button   
        image(img_close, img_close_x, img_close_y, img_close_size, img_close_size);
        
        // reset
        imageMode(CORNER);
}