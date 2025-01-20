@interface UISegmentedControlTVStyleProvider
+ (id)_tvDefaultTextColorDisabledSelected;
+ (id)_tvDefaultTextColorDisabledUserInterfaceStyleDark;
+ (id)_tvDefaultTextColorDisabledUserInterfaceStyleLight;
+ (id)_tvDefaultTextColorFocused;
+ (id)_tvDefaultTextColorNormalUserInterfaceStyleDark;
+ (id)_tvDefaultTextColorNormalUserInterfaceStyleLight;
+ (id)_tvDefaultTextColorSelected;
- (BOOL)useGeneratedImages;
- (BOOL)useTVStyleFocusSelection;
- (double)cornerRadiusForControlSize:(int)a3;
- (double)defaultHeightForControlSize:(int)a3 traitCollection:(id)a4;
- (double)dividerWidthForControlSize:(int)a3;
- (double)selectionIndicatorOverflowForControlSize:(int)a3;
- (id)fontColorForSegment:(id)a3 enabled:(BOOL)a4 selected:(BOOL)a5 state:(unint64_t)a6;
- (id)fontForControlSize:(int)a3 selected:(BOOL)a4;
@end

@implementation UISegmentedControlTVStyleProvider

- (BOOL)useGeneratedImages
{
  return 0;
}

- (BOOL)useTVStyleFocusSelection
{
  return 1;
}

- (double)selectionIndicatorOverflowForControlSize:(int)a3
{
  return 0.0;
}

- (double)dividerWidthForControlSize:(int)a3
{
  return 0.0;
}

- (double)cornerRadiusForControlSize:(int)a3
{
  return 6.0;
}

- (double)defaultHeightForControlSize:(int)a3 traitCollection:(id)a4
{
  if (a3 != 1) {
    return 70.0;
  }
  v5.receiver = self;
  v5.super_class = (Class)UISegmentedControlTVStyleProvider;
  [(UISegmentedControlDefaultStyleProvider *)&v5 defaultHeightForControlSize:*(void *)&a3 traitCollection:a4];
  return result;
}

- (id)fontForControlSize:(int)a3 selected:(BOOL)a4
{
  return (id)objc_msgSend(off_1E52D39B8, "preferredFontForTextStyle:", @"UICTFontTextStyleHeadline", a4);
}

- (id)fontColorForSegment:(id)a3 enabled:(BOOL)a4 selected:(BOOL)a5 state:(unint64_t)a6
{
  id v7 = a3;
  v8 = [v7 traitCollection];
  uint64_t v9 = [v8 userInterfaceStyle];

  switch(a6)
  {
    case 0uLL:
      v11 = objc_opt_class();
      if (v9 == 2) {
        [v11 _tvDefaultTextColorNormalUserInterfaceStyleDark];
      }
      else {
        [v11 _tvDefaultTextColorNormalUserInterfaceStyleLight];
      }
      goto LABEL_5;
    case 1uLL:
    case 8uLL:
      uint64_t v10 = [(id)objc_opt_class() _tvDefaultTextColorFocused];
      goto LABEL_14;
    case 2uLL:
      v12 = objc_opt_class();
      if (v9 == 2) {
        [v12 _tvDefaultTextColorDisabledUserInterfaceStyleDark];
      }
      else {
        [v12 _tvDefaultTextColorDisabledUserInterfaceStyleLight];
      }
      uint64_t v10 = LABEL_5:;
      goto LABEL_14;
    case 4uLL:
      v13 = [v7 tintColor];
      v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v15 = [(id)objc_opt_class() _tvDefaultTextColorSelected];
      }
      v16 = v15;

      goto LABEL_15;
    case 6uLL:
      uint64_t v10 = [(id)objc_opt_class() _tvDefaultTextColorDisabledSelected];
      goto LABEL_14;
    default:
      uint64_t v10 = [v7 _disabledColor];
LABEL_14:
      v16 = (void *)v10;
LABEL_15:

      return v16;
  }
}

+ (id)_tvDefaultTextColorSelected
{
  return +[UIColor whiteColor];
}

+ (id)_tvDefaultTextColorFocused
{
  return +[UIColor blackColor];
}

+ (id)_tvDefaultTextColorDisabledSelected
{
  return +[UIColor whiteColor];
}

+ (id)_tvDefaultTextColorNormalUserInterfaceStyleLight
{
  return +[UIColor colorWithWhite:0.0 alpha:0.5];
}

+ (id)_tvDefaultTextColorDisabledUserInterfaceStyleLight
{
  return +[UIColor colorWithWhite:0.0 alpha:0.1];
}

+ (id)_tvDefaultTextColorNormalUserInterfaceStyleDark
{
  return +[UIColor colorWithWhite:1.0 alpha:0.3];
}

+ (id)_tvDefaultTextColorDisabledUserInterfaceStyleDark
{
  return +[UIColor colorWithWhite:0.0 alpha:0.2];
}

@end