@interface UIKeyboardEmojiGraphics
+ (BOOL)boldText;
+ (BOOL)isWildcatKeyboard;
+ (CGPoint)margin:(BOOL)a3;
+ (CGPoint)padding:(BOOL)a3;
+ (CGSize)emojiSize:(BOOL)a3;
+ (double)emojiPageControlYOffset:(BOOL)a3;
+ (double)optionalDescriptionPadding:(BOOL)a3;
+ (double)recentLableVerticalPadding:(BOOL)a3;
+ (id)emojiCategoryImageName:(id)a3 forRenderConfig:(id)a4;
+ (id)emojiCategoryImagePath:(id)a3 forRenderConfig:(id)a4;
+ (id)emojiFontAttributes;
+ (id)emojiFontAttributesForPortrait:(BOOL)a3;
+ (id)sharedInstance;
+ (unsigned)colCount:(BOOL)a3;
+ (unsigned)rowCount:(BOOL)a3;
- (UIKeyboardEmojiGraphics)init;
@end

@implementation UIKeyboardEmojiGraphics

- (UIKeyboardEmojiGraphics)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardEmojiGraphics;
  v2 = [(UIKeyboardEmojiGraphics *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (id)sharedInstance
{
  v2 = (void *)gSharedEmojiGraphics;
  if (!gSharedEmojiGraphics)
  {
    v3 = objc_alloc_init(UIKeyboardEmojiGraphics);
    v4 = (void *)gSharedEmojiGraphics;
    gSharedEmojiGraphics = (uint64_t)v3;

    v2 = (void *)gSharedEmojiGraphics;
  }
  return v2;
}

+ (id)emojiFontAttributesForPortrait:(BOOL)a3
{
  BOOL v3 = a3;
  +[UIKeyboardEmojiGraphics emojiSize:1];
  CTFontRef v6 = CTFontCreateWithName(@"AppleColorEmoji", v5, 0);
  v7 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v8 = *MEMORY[0x1E4F243F0];
  v9 = NSNumber;
  [a1 padding:v3];
  *(float *)&double v10 = v10;
  v11 = [v9 numberWithFloat:v10];
  v12 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v6, v8, v11, *MEMORY[0x1E4F24778], 0);

  CFRelease(v6);
  return v12;
}

+ (id)emojiFontAttributes
{
  BOOL v3 = +[UIKeyboard activeKeyboard];
  BOOL v4 = (unint64_t)([v3 interfaceOrientation] - 5) < 0xFFFFFFFFFFFFFFFELL;

  uint64_t v5 = [a1 emojiFontAttributesForPortrait:v4];
  CTFontRef v6 = (void *)emojiFontAttributes_attributes;
  emojiFontAttributes_attributes = v5;

  v7 = (void *)emojiFontAttributes_attributes;
  return v7;
}

+ (BOOL)isWildcatKeyboard
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return !+[UIKeyboardImpl isFloating];
  }
  else {
    return 0;
  }
}

+ (CGSize)emojiSize:(BOOL)a3
{
  int v3 = objc_msgSend(a1, "isWildcatKeyboard", a3);
  double v4 = 32.0;
  if (v3) {
    double v4 = 48.0;
  }
  double v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (unsigned)rowCount:(BOOL)a3
{
  if (a3) {
    return 3;
  }
  if (objc_msgSend(a1, "isWildcatKeyboard", v3, v4)) {
    return 3;
  }
  return 2;
}

+ (unsigned)colCount:(BOOL)a3
{
  if (objc_msgSend(a1, "isWildcatKeyboard", a3)) {
    return 11;
  }
  if (+[UIKeyboardImpl isFloating])
  {
    +[UIKeyboardImpl floatingWidth];
    double v5 = v4;
  }
  else
  {
    CTFontRef v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v7 = [v6 containerView];
    [v7 bounds];
    double v5 = v8;
  }
  double v9 = 50.0;
  if (v5 < 480.0) {
    double v9 = 45.0;
  }
  return llround(v5 / v9);
}

+ (CGPoint)margin:(BOOL)a3
{
  BOOL v3 = a3;
  if ([a1 isWildcatKeyboard])
  {
    if (v3) {
      double v4 = 20.0;
    }
    else {
      double v4 = 41.0;
    }
    double v5 = 33.0;
    if (v3) {
      double v5 = 20.0;
    }
  }
  else
  {
    unsigned int v6 = [(id)objc_opt_class() colCount:v3];
    double v4 = 22.0;
    double v5 = 16.0;
    if (v6 <= 0xE)
    {
      unsigned int v7 = [(id)objc_opt_class() colCount:v3];
      double v5 = 29.0;
      if (v7 <= 0xC)
      {
        double v4 = 20.0;
        if ([(id)objc_opt_class() colCount:v3] <= 0xA)
        {
          unsigned int v8 = [(id)objc_opt_class() colCount:v3];
          double v5 = 7.5;
          if (v8 <= 9)
          {
            if ([(id)objc_opt_class() colCount:v3] <= 8)
            {
              unsigned int v9 = [(id)objc_opt_class() colCount:v3];
              if (v9 <= 7) {
                double v4 = 20.0;
              }
              else {
                double v4 = 24.5;
              }
              double v5 = 8.5;
              if (v9 > 7) {
                double v5 = 13.5;
              }
            }
            else
            {
              double v4 = 28.0;
              double v5 = 11.0;
            }
          }
        }
        else
        {
          double v5 = 27.5;
        }
      }
    }
  }
  double v10 = v4;
  result.y = v10;
  result.x = v5;
  return result;
}

+ (double)recentLableVerticalPadding:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [a1 isWildcatKeyboard];
  double result = 0.0;
  if ((v4 & 1) == 0)
  {
    if ([(id)objc_opt_class() colCount:v3] > 0xE) {
      return 1.0;
    }
    unsigned int v6 = [(id)objc_opt_class() colCount:v3];
    double result = 2.0;
    if (v6 > 0xC) {
      return result;
    }
    if ([(id)objc_opt_class() colCount:v3] <= 0xA)
    {
      unsigned int v7 = [(id)objc_opt_class() colCount:v3];
      double result = 1.0;
      if (v7 <= 9)
      {
        unsigned int v8 = [(id)objc_opt_class() colCount:v3];
        double result = 5.0;
        if (v8 <= 8)
        {
          unsigned int v9 = [(id)objc_opt_class() colCount:v3];
          double result = 1.0;
          if (v9 > 7) {
            return 4.0;
          }
        }
      }
    }
    else
    {
      return 1.0;
    }
  }
  return result;
}

+ (CGPoint)padding:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [a1 isWildcatKeyboard];
  double v5 = 9.0;
  if (!v3) {
    double v5 = 28.0;
  }
  double v6 = 43.0;
  if (v3) {
    double v6 = 20.0;
  }
  double v7 = 19.0;
  double v8 = 13.0;
  if (v3) {
    double v7 = 13.0;
  }
  else {
    double v8 = 16.0;
  }
  if (!v4)
  {
    double v6 = v8;
    double v5 = v7;
  }
  result.y = v5;
  result.x = v6;
  return result;
}

+ (double)optionalDescriptionPadding:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [a1 isWildcatKeyboard];
  double result = 24.0;
  if (v3) {
    double result = 8.0;
  }
  if (!v4) {
    return 9.0;
  }
  return result;
}

+ (double)emojiPageControlYOffset:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [a1 isWildcatKeyboard];
  double result = 8.0;
  if (v3) {
    double result = 4.0;
  }
  if (!v4) {
    return 4.0;
  }
  return result;
}

+ (id)emojiCategoryImagePath:(id)a3 forRenderConfig:(id)a4
{
  id v5 = a3;
  int v6 = [a4 lightKeyboard];
  uint64_t v7 = [v5 categoryType];

  double v8 = 0;
  switch(v7)
  {
    case 0:
      double v8 = @"emoji_recents.png";
      break;
    case 1:
      unsigned int v9 = @"emoji_people_dark.png";
      double v10 = @"emoji_people.png";
      goto LABEL_12;
    case 2:
      unsigned int v9 = @"emoji_nature_dark.png";
      double v10 = @"emoji_nature.png";
      goto LABEL_12;
    case 3:
      unsigned int v9 = @"emoji_food-and-drink_dark.png";
      double v10 = @"emoji_food-and-drink.png";
      goto LABEL_12;
    case 4:
      double v8 = @"emoji_celebration.png";
      break;
    case 5:
      unsigned int v9 = @"emoji_activity_dark.png";
      double v10 = @"emoji_activity.png";
      goto LABEL_12;
    case 6:
      unsigned int v9 = @"emoji_travel-and-places_dark.png";
      double v10 = @"emoji_travel-and-places.png";
      goto LABEL_12;
    case 7:
      unsigned int v9 = @"emoji_flags_dark.png";
      double v10 = @"emoji_flags.png";
      goto LABEL_12;
    case 8:
    case 11:
      double v8 = @"emoji_symbols.png";
      break;
    case 10:
      unsigned int v9 = @"emoji_objects_dark.png";
      double v10 = @"emoji_objects.png";
LABEL_12:
      if (v6) {
        unsigned int v9 = v10;
      }
      double v8 = v9;
      break;
    default:
      break;
  }
  return v8;
}

+ (id)emojiCategoryImageName:(id)a3 forRenderConfig:(id)a4
{
  id v5 = a3;
  [a4 lightKeyboard];
  unint64_t v6 = [v5 categoryType];

  if (v6 > 0xB) {
    return 0;
  }
  else {
    return off_1E52FBBA0[v6];
  }
}

+ (BOOL)boldText
{
  return _AXSEnhanceTextLegibilityEnabled() != 0;
}

@end