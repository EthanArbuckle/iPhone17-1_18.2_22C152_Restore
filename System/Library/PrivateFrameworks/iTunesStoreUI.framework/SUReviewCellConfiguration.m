@interface SUReviewCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
- (BOOL)getShadowColor:(id *)a3 offset:(CGSize *)a4 forLabelAtIndex:(unint64_t)a5 withModifiers:(unint64_t)a6;
- (SUReviewCellConfiguration)init;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (void)reloadImages;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
@end

@implementation SUReviewCellConfiguration

- (SUReviewCellConfiguration)init
{
  return [(SUArrayCellConfiguration *)self initWithStringCount:3 imageCount:1];
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
  double v7 = v6 + -8.0 + -8.0;
  uint64_t v8 = [a4 humanReadableDescription];
  objc_msgSend(a3, "sizeForString:font:constrainedToSize:", v8, objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:", 13.0), v7, 1.79769313e308);
  return v9 + 43.0 + 7.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if (a3 == 2) {
    return (id)objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", 2, a4, 0.392156863, 0.396078431, 0.4, 1.0);
  }
  else {
    return (id)objc_msgSend(MEMORY[0x263F1C550], "blackColor", a3, a4);
  }
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      v3 = (void *)MEMORY[0x263F1C658];
      double v4 = 14.0;
      return (id)[v3 systemFontOfSize:v4];
    case 1uLL:
      return (id)[MEMORY[0x263F1C658] boldSystemFontOfSize:14.0];
    case 0uLL:
      v3 = (void *)MEMORY[0x263F1C658];
      double v4 = 13.0;
      return (id)[v3 systemFontOfSize:v4];
  }
  return 0;
}

- (BOOL)getShadowColor:(id *)a3 offset:(CGSize *)a4 forLabelAtIndex:(unint64_t)a5 withModifiers:(unint64_t)a6
{
  if (a5 == 1)
  {
    *a3 = (id)objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", a3, a4, 1, a6, 0.760784314, 1.0);
    *a4 = (CGSize)xmmword_2279241C0;
  }
  return a5 == 1;
}

- (void)reloadImages
{
  id context = self->super.super.super.super._context;
  objc_msgSend((id)objc_msgSend(self->super.super.super.super._representedObject, "reviewStatistics"), "averageUserRating");
  *self->super.super.super._images = (id)objc_msgSend(context, "ratingImageForRating:style:", 0);
}

- (void)reloadLayoutInformation
{
  double width = self->super.super.super.super._layoutSize.width;
  images = self->super.super.super._images;
  if (*images)
  {
    imageFrames = self->super.super.super._imageFrames;
    imageFrames->origin = (CGPoint)xmmword_2279241D0;
    [*images size];
    imageFrames->size.double width = v6;
    imageFrames->size.height = v7;
  }
  objc_msgSend(self->super.super.super.super._context, "sizeForString:font:constrainedToSize:", *self->super.super.super._strings, -[SUReviewCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 0), width + -8.0 + -8.0, 1.79769313e308);
  stringFrames = self->super.super.super._stringFrames;
  stringFrames->origin = (CGPoint)xmmword_2279241E0;
  stringFrames->size.double width = width + -8.0 + -8.0;
  stringFrames->size.height = v9;
  stringFrames[1].origin = (CGPoint)xmmword_2279241F0;
  stringFrames[1].size.double width = width + -8.0 + -8.0;
  *(_OWORD *)&stringFrames[1].size.height = xmmword_227924200;
  stringFrames[2].origin.y = 22.0;
  stringFrames[2].size.double width = width + -8.0 + -80.0;
  stringFrames[2].size.height = 17.0;
}

- (void)reloadStrings
{
  v3 = (void *)[self->super.super.super.super._representedObject title];

  id v4 = (id)[v3 length];
  if (v4) {
    id v4 = v3;
  }
  *((void *)self->super.super.super._strings + 1) = v4;
  v5 = (void *)[self->super.super.super.super._representedObject humanReadableDescription];

  id v6 = (id)[v5 length];
  if (v6) {
    id v6 = v5;
  }
  *self->super.super.super._strings = v6;
  CGFloat v7 = (void *)[self->super.super.super.super._representedObject stringValueForProperty:@"user-name"];

  uint64_t v8 = [v7 length];
  if (v8)
  {
    id v9 = [NSString alloc];
    uint64_t v8 = objc_msgSend(v9, "initWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"USER_NAME_FORMAT", &stru_26DB8C5F8, 0), v7);
  }
  *((void *)self->super.super.super._strings + 2) = v8;
}

@end