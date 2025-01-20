@interface SULoadMoreCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
- (SULoadMoreCellConfiguration)init;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
@end

@implementation SULoadMoreCellConfiguration

- (SULoadMoreCellConfiguration)init
{
  return [(SUArrayCellConfiguration *)self initWithStringCount:1 imageCount:0];
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 55.0;
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
  return (id)objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", a3, 16.0);
}

- (void)reloadLayoutInformation
{
  p_layoutSize = &self->super.super.super.super._layoutSize;
  CGFloat v4 = self->super.super.super.super._layoutSize.width + -10.0 + -10.0;
  objc_msgSend(self->super.super.super.super._context, "sizeForString:font:constrainedToSize:", *self->super.super.super._strings, -[SULoadMoreCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 0), v4, 20.0);
  stringFrames = self->super.super.super._stringFrames;
  CGFloat v8 = floor((p_layoutSize->height - v7) * 0.5);
  stringFrames->origin.x = floor((v4 - v5) * 0.5) + 10.0;
  stringFrames->origin.y = v8;
  stringFrames->size.width = v5;
  stringFrames->size.height = v7;
}

- (void)reloadStrings
{
  v3 = (void *)[self->super.super.super.super._representedObject title];

  id v4 = (id)[v3 length];
  if (v4) {
    id v4 = v3;
  }
  *self->super.super.super._strings = v4;
}

@end