@interface SUPlainTextCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
- (BOOL)getShadowColor:(id *)a3 offset:(CGSize *)a4 forLabelAtIndex:(unint64_t)a5 withModifiers:(unint64_t)a6;
- (SUPlainTextCellConfiguration)init;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (int64_t)textAlignmentForLabelAtIndex:(unint64_t)a3;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
@end

@implementation SUPlainTextCellConfiguration

- (SUPlainTextCellConfiguration)init
{
  return [(SUArrayCellConfiguration *)self initWithStringCount:1 imageCount:0];
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  uint64_t v5 = [a4 humanReadableDescription];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
  objc_msgSend(a3, "sizeForString:font:constrainedToSize:", v5, objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:", 15.0), v6 + -20.0, 3.40282347e38);
  return v7;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", a3, a4, 0.294117647, 0.333333333, 0.419607843, 1.0);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:", a3, 15.0);
}

- (BOOL)getShadowColor:(id *)a3 offset:(CGSize *)a4 forLabelAtIndex:(unint64_t)a5 withModifiers:(unint64_t)a6
{
  *a3 = (id)objc_msgSend(MEMORY[0x263F1C550], "whiteColor", a3, a4, a5, a6);
  *a4 = (CGSize)xmmword_2279241C0;
  return 1;
}

- (void)reloadLayoutInformation
{
  stringFrames = self->super.super.super._stringFrames;
  CGSize layoutSize = self->super.super.super.super._layoutSize;
  stringFrames->origin.x = 0.0;
  stringFrames->origin.y = 0.0;
  stringFrames->size = layoutSize;
}

- (void)reloadStrings
{
  v3 = (void *)[self->super.super.super.super._representedObject humanReadableDescription];

  id v4 = (id)[v3 length];
  if (v4) {
    id v4 = v3;
  }
  *self->super.super.super._strings = v4;
}

- (int64_t)textAlignmentForLabelAtIndex:(unint64_t)a3
{
  return 1;
}

@end