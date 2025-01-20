@interface MTAUtilities
+ (BOOL)isLandscape;
+ (BOOL)shouldUseCompactLayoutForSizeClass:(int64_t)a3 windowWidth:(double)a4;
+ (MTControlButtonAttributes)controlButtonAttributesForView:(SEL)a3 buttonCircleSize:(id)a4;
+ (id)durationStringFromInterval:(double)a3;
+ (id)pillButtonWithTitle:(id)a3;
+ (id)sectionHeaderConfigurationWithTitle:(id)a3 isRTL:(BOOL)a4;
+ (id)startTimerShortcutItem;
+ (id)thinG2FontWithSize:(double)a3;
+ (id)thinG2MonospacedDigitFontWithSize:(double)a3;
+ (int64_t)estimatedSplitLayoutForWindowWidth:(double)a3;
+ (void)updateTimerAppShortcuts;
@end

@implementation MTAUtilities

+ (id)pillButtonWithTitle:(id)a3
{
  id v3 = a3;
  v4 = +[UIButton buttonWithType:1];
  [v4 setRole:1];
  v5 = +[UIButtonConfiguration grayButtonConfiguration];
  [v5 setTitle:v3];

  [v5 setButtonSize:2];
  [v5 setCornerStyle:4];
  v6 = +[UIColor mtui_tintColor];
  [v5 setBaseForegroundColor:v6];

  [v4 setConfiguration:v5];

  return v4;
}

+ (void)updateTimerAppShortcuts
{
  id v3 = +[UIApplication sharedApplication];
  v4 = [v3 shortcutItems];
  id v9 = [v4 mutableCopy];

  id v5 = [v9 indexOfObjectPassingTest:&stru_1000A1F30];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [v9 removeObjectAtIndex:v5];
  }
  id v6 = [v9 indexOfObjectPassingTest:&stru_1000A1F50];
  v7 = [a1 startTimerShortcutItem];
  if (v7)
  {
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
      [v9 addObject:v7];
    }
    else {
      [v9 replaceObjectAtIndex:v6 withObject:v7];
    }
    v8 = +[UIApplication sharedApplication];
    [v8 setShortcutItems:v9];
  }
}

+ (id)startTimerShortcutItem
{
  v2 = +[UIApplicationShortcutIcon iconWithSystemImageName:@"timer"];
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"START_TIMER_QUICK_ACTION_TITLE" value:&stru_1000A2560 table:@"Localizable-OrbHW"];

  id v5 = objc_alloc((Class)UIApplicationShortcutItem);
  id v6 = [v5 initWithType:kStartTimerActionID localizedTitle:v4 localizedSubtitle:0 icon:v2 userInfo:0];

  return v6;
}

+ (MTControlButtonAttributes)controlButtonAttributesForView:(SEL)a3 buttonCircleSize:(id)a4
{
  id v25 = a4;
  int v7 = MTUIShouldUseLargePadLayout();
  v8 = [v25 traitCollection];
  id v9 = [v8 horizontalSizeClass];

  if (v9 == (id)2) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v7;
  }
  [v25 bounds];
  double v12 = v11;
  double v14 = v13;
  v15 = +[UIScreen mainScreen];
  [v15 bounds];
  double Height = CGRectGetHeight(v27);

  if (v10)
  {
    +[MTACircleButton buttonWidthForSize:1];
    if (v17 >= 120.0) {
      double v18 = 120.0;
    }
    else {
      double v18 = v17;
    }
    double v19 = 24.0;
  }
  else
  {
    [v25 bounds];
    fmin(Height * 0.542, CGRectGetWidth(v28));
    [v25 safeAreaInsets];
    +[MTACircleButton buttonWidthForSize:0];
    [v25 bounds];
    double v18 = (v20 + -32.0) * 0.25;
    +[MTACircleButton buttonWidthForSize:a5];
    if (v21 < v18) {
      double v18 = v21;
    }
    double v19 = 16.0;
  }
  UIRoundToViewScale();
  *(void *)&retstr->var3 = 0;
  retstr->var0 = v22;
  retstr->var1 = v18;
  double v23 = 40.0;
  if (!v7) {
    double v23 = v19;
  }
  retstr->var2 = v23;
  retstr->var3 = v12 / v14 > 0.9;
  retstr->var4 = v10;
  retstr->var5 = v7;

  return result;
}

+ (id)thinG2FontWithSize:(double)a3
{
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x66u, a3, 0);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  CFRelease(UIFontForLanguage);

  return CopyOfSystemUIFontWithGrade;
}

+ (id)thinG2MonospacedDigitFontWithSize:(double)a3
{
  v4 = (const __CTFontDescriptor *)CTFontDescriptorCreateForUIType();
  CopyWithFeature = CTFontDescriptorCreateCopyWithFeature(v4, (CFNumberRef)&off_1000A4F58, (CFNumberRef)&off_1000A4F70);
  CFRelease(v4);
  CTFontRef v6 = CTFontCreateWithFontDescriptor(CopyWithFeature, a3, 0);
  CFRelease(CopyWithFeature);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  CFRelease(v6);

  return CopyOfSystemUIFontWithGrade;
}

+ (id)durationStringFromInterval:(double)a3
{
  if (qword_1000C7D30 != -1) {
    dispatch_once(&qword_1000C7D30, &stru_1000A1F10);
  }
  [(id)qword_1000C7D28 setAllowedUnits:224];
  [(id)qword_1000C7D28 setUnitsStyle:2];
  v4 = (void *)qword_1000C7D28;

  return [v4 stringFromTimeInterval:a3];
}

+ (BOOL)isLandscape
{
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 windows];
  v4 = [v3 firstObject];
  id v5 = [v4 windowScene];
  CTFontRef v6 = (char *)[v5 interfaceOrientation];

  return (unint64_t)(v6 - 3) < 2;
}

+ (id)sectionHeaderConfigurationWithTitle:(id)a3 isRTL:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  CTFontRef v6 = +[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration];
  int v7 = [v6 textProperties];
  v8 = [v7 font];

  id v9 = [v6 textProperties];
  BOOL v10 = [v9 color];

  id v11 = objc_alloc_init((Class)NSMutableParagraphStyle);
  double v12 = v11;
  if (v4) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 0;
  }
  [v11 setAlignment:v13];
  [v12 setLineBreakMode:0];
  double v14 = +[UIListContentConfiguration groupedHeaderConfiguration];
  id v15 = objc_alloc((Class)NSAttributedString);
  v19[0] = NSFontAttributeName;
  v19[1] = NSForegroundColorAttributeName;
  v20[0] = v8;
  v20[1] = v10;
  v19[2] = NSParagraphStyleAttributeName;
  v20[2] = v12;
  v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  id v17 = [v15 initWithString:v5 attributes:v16];

  [v14 setAttributedText:v17];

  return v14;
}

+ (int64_t)estimatedSplitLayoutForWindowWidth:(double)a3
{
  BOOL v4 = +[UIScreen mainScreen];
  [v4 bounds];
  double v6 = v5;

  double v7 = v6 * 0.5;
  if (v6 > a3 && v7 < a3) {
    return 1;
  }
  if (v7 + v6 / -3.0 * 0.25 > a3) {
    return 2;
  }
  if (v6 == a3) {
    return 0;
  }
  return 3;
}

+ (BOOL)shouldUseCompactLayoutForSizeClass:(int64_t)a3 windowWidth:(double)a4
{
  return a3 == 1 || [a1 estimatedSplitLayoutForWindowWidth:a4 v4, v5] == (id)3;
}

@end