@interface SUCompletionCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
- (SUCompletionCellConfiguration)init;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
@end

@implementation SUCompletionCellConfiguration

- (SUCompletionCellConfiguration)init
{
  return [(SUArrayCellConfiguration *)self initWithStringCount:1 imageCount:0];
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 44.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if (a4) {
    return (id)objc_msgSend(MEMORY[0x263F1C550], "whiteColor", a3);
  }
  if ((a4 & 2) != 0) {
    return (id)objc_msgSend(MEMORY[0x263F1C550], "grayColor", a3);
  }
  return (id)objc_msgSend(MEMORY[0x263F1C550], "blackColor", a3);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", a3, 18.0);
}

- (void)reloadLayoutInformation
{
  stringFrames = self->super._stringFrames;
  CGFloat v3 = self->super.super._layoutSize.width + -10.0 + -10.0;
  stringFrames->origin = (CGPoint)xmmword_227924070;
  stringFrames->size.width = v3;
  stringFrames->size.height = 20.0;
}

- (void)reloadStrings
{
  CGFloat v3 = (void *)[self->super.super._representedObject title];

  id v4 = (id)[v3 length];
  if (v4) {
    id v4 = v3;
  }
  *self->super._strings = v4;
}

@end