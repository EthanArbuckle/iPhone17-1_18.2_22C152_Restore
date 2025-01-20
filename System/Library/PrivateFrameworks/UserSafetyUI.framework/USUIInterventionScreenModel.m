@interface USUIInterventionScreenModel
+ (id)actionsForScreen:(int64_t)a3 workflow:(int64_t)a4 type:(int64_t)a5 options:(int64_t)a6;
+ (id)actionsForScreenOne:(int64_t)a3 type:(int64_t)a4 options:(int64_t)a5;
+ (id)actionsForScreenTwo:(int64_t)a3 type:(int64_t)a4;
+ (id)bulletsForScreen:(int64_t)a3 workflow:(int64_t)a4 type:(int64_t)a5;
+ (id)bulletsForScreenOneOver13:(int64_t)a3;
+ (id)bulletsForScreenOneUnder13:(int64_t)a3;
+ (id)bulletsForScreenTwoOver13:(int64_t)a3;
+ (id)bulletsForScreenTwoUnder13:(int64_t)a3;
+ (id)emojiForScreen:(int64_t)a3;
+ (id)imageNameForScreen:(int64_t)a3;
+ (id)modelForScreen:(int64_t)a3 workflow:(int64_t)a4 type:(int64_t)a5;
+ (id)modelForScreen:(int64_t)a3 workflow:(int64_t)a4 type:(int64_t)a5 options:(int64_t)a6;
+ (id)titleForScreen:(int64_t)a3 workflow:(int64_t)a4;
- (NSArray)actions;
- (NSArray)bullets;
- (NSString)emoji;
- (NSString)imageName;
- (NSString)title;
- (void)setActions:(id)a3;
- (void)setBullets:(id)a3;
- (void)setEmoji:(id)a3;
- (void)setImageName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation USUIInterventionScreenModel

+ (id)modelForScreen:(int64_t)a3 workflow:(int64_t)a4 type:(int64_t)a5
{
  return (id)[a1 modelForScreen:a3 workflow:a4 type:a5 options:0];
}

+ (id)modelForScreen:(int64_t)a3 workflow:(int64_t)a4 type:(int64_t)a5 options:(int64_t)a6
{
  v11 = objc_opt_new();
  v12 = [a1 titleForScreen:a3 workflow:a4];
  [v11 setTitle:v12];

  v13 = [a1 imageNameForScreen:a3];
  [v11 setImageName:v13];

  v14 = [a1 emojiForScreen:a3];
  [v11 setEmoji:v14];

  v15 = [a1 bulletsForScreen:a3 workflow:a4 type:a5];
  [v11 setBullets:v15];

  v16 = [a1 actionsForScreen:a3 workflow:a4 type:a5 options:a6];
  [v11 setActions:v16];

  return v11;
}

+ (id)titleForScreen:(int64_t)a3 workflow:(int64_t)a4
{
  if (a3 == 1)
  {
    v4 = (void *)MEMORY[0x263F67DD8];
    v5 = @"RECEIVE_SECOND_EDU_SCREEN_TITLE";
    v6 = @"SEND_SECOND_EDU_SCREEN_TITLE";
    goto LABEL_5;
  }
  if (!a3)
  {
    v4 = (void *)MEMORY[0x263F67DD8];
    v5 = @"RECEIVE_FIRST_EDU_SCREEN_TITLE";
    v6 = @"SEND_FIRST_EDU_SCREEN_TITLE";
LABEL_5:
    if (a4 == 1) {
      v7 = v6;
    }
    else {
      v7 = v5;
    }
    a1 = [v4 localizedStringForKey:v7];
  }
  return a1;
}

+ (id)imageNameForScreen:(int64_t)a3
{
  if (a3) {
    return @"header-monocle";
  }
  else {
    return @"header-thinking";
  }
}

+ (id)emojiForScreen:(int64_t)a3
{
  if (a3) {
    return @"🧐";
  }
  else {
    return @"🤔";
  }
}

+ (id)bulletsForScreen:(int64_t)a3 workflow:(int64_t)a4 type:(int64_t)a5
{
  if (a3 == 1)
  {
    if (a5 == 1)
    {
      uint64_t v6 = [a1 bulletsForScreenTwoOver13:a4];
      goto LABEL_12;
    }
    if (!a5)
    {
      uint64_t v6 = [a1 bulletsForScreenTwoUnder13:a4];
      goto LABEL_12;
    }
LABEL_9:
    v5 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_13;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a5 == 1)
  {
    uint64_t v6 = [a1 bulletsForScreenOneOver13:a4];
    goto LABEL_12;
  }
  if (a5) {
    goto LABEL_9;
  }
  uint64_t v6 = [a1 bulletsForScreenOneUnder13:a4];
LABEL_12:
  v5 = (void *)v6;
LABEL_13:
  return v5;
}

+ (id)bulletsForScreenOneUnder13:(int64_t)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  BOOL v3 = a3 == 1;
  if (a3 == 1) {
    v4 = @"SEND_FIRST_EDU_SCREEN_POINT_1";
  }
  else {
    v4 = @"RECEIVE_FIRST_EDU_SCREEN_POINT_1";
  }
  if (v3) {
    v5 = @"SEND_FIRST_EDU_SCREEN_POINT_2";
  }
  else {
    v5 = @"RECEIVE_FIRST_EDU_SCREEN_POINT_2";
  }
  if (v3) {
    uint64_t v6 = @"SEND_FIRST_EDU_SCREEN_POINT_3";
  }
  else {
    uint64_t v6 = @"RECEIVE_FIRST_EDU_SCREEN_POINT_3";
  }
  v7 = [MEMORY[0x263F67DD8] localizedStringForKey:v4];
  v8 = +[USUIInterventionScreenBullet bullet:v7 imageName:@"bullet-bathing-suit" emoji:0];
  v9 = objc_msgSend(MEMORY[0x263F67DD8], "localizedStringForKey:", v5, v8);
  v10 = +[USUIInterventionScreenBullet bullet:v9 imageName:@"bullet-sad" emoji:@"😔"];
  v15[1] = v10;
  v11 = [MEMORY[0x263F67DD8] localizedStringForKey:v6];
  v12 = +[USUIInterventionScreenBullet bullet:v11 imageName:@"bullet-window-shocked" emoji:0];
  v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  return v13;
}

+ (id)bulletsForScreenOneOver13:(int64_t)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  BOOL v3 = a3 == 1;
  if (a3 == 1) {
    v4 = @"SEND_FIRST_EDU_SCREEN_POINT_1_OVER_13";
  }
  else {
    v4 = @"RECEIVE_FIRST_EDU_SCREEN_POINT_1_OVER_13";
  }
  if (v3) {
    v5 = @"SEND_FIRST_EDU_SCREEN_POINT_2_OVER_13";
  }
  else {
    v5 = @"RECEIVE_FIRST_EDU_SCREEN_POINT_2_OVER_13";
  }
  uint64_t v6 = [MEMORY[0x263F67DD8] localizedStringForKey:v4];
  v7 = +[USUIInterventionScreenBullet bullet:v6 imageName:@"bullet-monkey-hiding" emoji:@"🙈"];
  v12[0] = v7;
  v8 = [MEMORY[0x263F67DD8] localizedStringForKey:v5];
  v9 = +[USUIInterventionScreenBullet bullet:v8 imageName:@"bullet-window-shocked" emoji:0];
  v12[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

+ (id)bulletsForScreenTwoUnder13:(int64_t)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  BOOL v3 = a3 == 1;
  if (a3 == 1) {
    v4 = @"SEND_SECOND_EDU_SCREEN_POINT_1";
  }
  else {
    v4 = @"RECEIVE_SECOND_EDU_SCREEN_POINT_1";
  }
  if (v3) {
    v5 = @"SEND_SECOND_EDU_SCREEN_POINT_2";
  }
  else {
    v5 = @"RECEIVE_SECOND_EDU_SCREEN_POINT_2";
  }
  uint64_t v6 = [MEMORY[0x263F67DD8] localizedStringForKey:v4];
  v7 = +[USUIInterventionScreenBullet bullet:v6 imageName:@"bullet-family" emoji:@"👨‍👩‍👧‍👦"];
  v12[0] = v7;
  v8 = [MEMORY[0x263F67DD8] localizedStringForKey:v5];
  v9 = +[USUIInterventionScreenBullet bullet:v8 imageName:@"bullet-teacher" emoji:0];
  v12[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

+ (id)bulletsForScreenTwoOver13:(int64_t)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  BOOL v3 = a3 == 1;
  if (a3 == 1) {
    v4 = @"SEND_SECOND_EDU_SCREEN_POINT_1_OVER_13";
  }
  else {
    v4 = @"RECEIVE_SECOND_EDU_SCREEN_POINT_1_OVER_13";
  }
  if (v3) {
    v5 = @"SEND_SECOND_EDU_SCREEN_POINT_2_OVER_13";
  }
  else {
    v5 = @"RECEIVE_SECOND_EDU_SCREEN_POINT_2_OVER_13";
  }
  uint64_t v6 = [MEMORY[0x263F67DD8] localizedStringForKey:v4];
  v7 = +[USUIInterventionScreenBullet bullet:v6 imageName:@"bullet-dancers" emoji:@"👯"];
  v12[0] = v7;
  v8 = [MEMORY[0x263F67DD8] localizedStringForKey:v5];
  v9 = +[USUIInterventionScreenBullet bullet:v8 imageName:@"bullet-monkey-covering-mouth" emoji:@"🙊"];
  v12[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

+ (id)actionsForScreen:(int64_t)a3 workflow:(int64_t)a4 type:(int64_t)a5 options:(int64_t)a6
{
  if (a3 == 1)
  {
    uint64_t v6 = [a1 actionsForScreenTwo:a4 type:a5];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    uint64_t v6 = [a1 actionsForScreenOne:a4 type:a5 options:a6];
  }
  a2 = v6;
LABEL_6:
  return (id)(id)a2;
}

+ (id)actionsForScreenOne:(int64_t)a3 type:(int64_t)a4 options:(int64_t)a5
{
  char v5 = a5;
  v15[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend(MEMORY[0x263F67DD8], "localizedStringForKey:", @"NOT_NOW", a4);
  v7 = +[USUIInterventionScreenAction action:v6 primary:1 actionID:1];

  v8 = [MEMORY[0x263F67DD8] localizedStringForKey:@"IM_SURE"];
  v9 = +[USUIInterventionScreenAction action:v8 primary:0 actionID:3];

  if (v5)
  {
    v11 = [MEMORY[0x263F67DD8] localizedStringForKey:@"MORE_HELP"];
    v12 = +[USUIInterventionScreenAction action:v11 primary:0 actionID:2];

    v15[0] = v7;
    v15[1] = v12;
    v15[2] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  }
  else
  {
    v14[0] = v7;
    v14[1] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  }

  return v10;
}

+ (id)actionsForScreenTwo:(int64_t)a3 type:(int64_t)a4
{
  v17[3] = *MEMORY[0x263EF8340];
  BOOL v5 = a3 == 1;
  if (a3 == 1) {
    uint64_t v6 = @"CANCEL_TEXT";
  }
  else {
    uint64_t v6 = @"DONT_VIEW_PHOTO_EDU";
  }
  if (v5) {
    v7 = @"CONTINUE_TEXT";
  }
  else {
    v7 = @"VIEW_PHOTO_EDU";
  }
  v8 = [MEMORY[0x263F67DD8] localizedStringForKey:v6];
  v9 = +[USUIInterventionScreenAction action:v8 primary:1 actionID:4];

  if (a4) {
    v10 = @"MESSAGE_SOMEONE";
  }
  else {
    v10 = @"MESSAGE_GROWNUP";
  }
  v11 = [MEMORY[0x263F67DD8] localizedStringForKey:v10];
  v12 = +[USUIInterventionScreenAction action:v11 primary:0 actionID:5];

  v13 = [MEMORY[0x263F67DD8] localizedStringForKey:v7];
  v14 = +[USUIInterventionScreenAction action:v13 primary:0 actionID:6];

  v17[0] = v9;
  v17[1] = v12;
  v17[2] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];

  return v15;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (NSString)emoji
{
  return self->_emoji;
}

- (void)setEmoji:(id)a3
{
}

- (NSArray)bullets
{
  return self->_bullets;
}

- (void)setBullets:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_bullets, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end