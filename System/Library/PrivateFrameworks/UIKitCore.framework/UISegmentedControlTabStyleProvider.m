@interface UISegmentedControlTabStyleProvider
- (BOOL)apportionsSegmentWidthsByContentByDefault;
- (double)cornerRadiusForControlSize:(int)a3;
- (double)defaultContentPaddingWidth;
- (double)defaultHeightForControlSize:(int)a3 traitCollection:(id)a4;
- (double)selectionIndicatorInsetForControlSize:(int)a3;
- (id)backgroundBlurEffect;
- (id)fontColorForSegment:(id)a3 enabled:(BOOL)a4 selected:(BOOL)a5 state:(unint64_t)a6;
- (id)fontForControlSize:(int)a3 selected:(BOOL)a4;
@end

@implementation UISegmentedControlTabStyleProvider

- (double)cornerRadiusForControlSize:(int)a3
{
  return 19.0;
}

- (double)selectionIndicatorInsetForControlSize:(int)a3
{
  return 4.0;
}

- (double)defaultHeightForControlSize:(int)a3 traitCollection:(id)a4
{
  return 38.0;
}

- (double)defaultContentPaddingWidth
{
  return 16.0;
}

- (BOOL)apportionsSegmentWidthsByContentByDefault
{
  return 1;
}

- (id)backgroundBlurEffect
{
  return +[UIBlurEffect effectWithStyle:10];
}

- (id)fontForControlSize:(int)a3 selected:(BOOL)a4
{
  return (id)objc_msgSend(off_1E52D39B8, "_preferredFontForTextStyle:weight:", @"UICTFontTextStyleSubhead", a4, *(double *)off_1E52D6BF0);
}

- (id)fontColorForSegment:(id)a3 enabled:(BOOL)a4 selected:(BOOL)a5 state:(unint64_t)a6
{
  if (a5)
  {
    v6 = [a3 traitCollection];
    if ([v6 userInterfaceStyle] == 1) {
      +[UIColor tintColor];
    }
    else {
    v7 = +[UIColor labelColor];
    }
  }
  else
  {
    v7 = +[UIColor secondaryLabelColor];
  }
  return v7;
}

@end