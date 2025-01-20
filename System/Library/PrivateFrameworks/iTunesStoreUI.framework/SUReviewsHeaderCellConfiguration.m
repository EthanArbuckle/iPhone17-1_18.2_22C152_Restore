@interface SUReviewsHeaderCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
- (BOOL)getShadowColor:(id *)a3 offset:(CGSize *)a4 forLabelAtIndex:(unint64_t)a5 withModifiers:(unint64_t)a6;
- (SUReviewsHeaderCellConfiguration)init;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (void)reloadImages;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
@end

@implementation SUReviewsHeaderCellConfiguration

- (SUReviewsHeaderCellConfiguration)init
{
  return [(SUArrayCellConfiguration *)self initWithStringCount:2 imageCount:1];
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 51.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if (a3) {
    return (id)objc_msgSend(MEMORY[0x263F1C550], "blackColor", a3, a4);
  }
  else {
    return (id)objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", 0, a4, 0.392156863, 0.396078431, 0.4, 1.0);
  }
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  if (a3 == 1) {
    return (id)[MEMORY[0x263F1C658] boldSystemFontOfSize:14.0];
  }
  if (a3) {
    return 0;
  }
  return (id)[MEMORY[0x263F1C658] systemFontOfSize:14.0];
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
    imageFrames->origin = (CGPoint)xmmword_227924220;
    [*images size];
    imageFrames->size.double width = v6;
    imageFrames->size.height = v7;
  }
  stringFrames = self->super.super.super._stringFrames;
  stringFrames->origin = (CGPoint)xmmword_227924230;
  stringFrames->size.double width = width + -8.0 + -80.0;
  *(_OWORD *)&stringFrames->size.height = xmmword_227924240;
  stringFrames[1].origin.y = 6.0;
  stringFrames[1].size.double width = width + -8.0 + -8.0;
  stringFrames[1].size.height = 17.0;
}

- (void)reloadStrings
{
  v3 = (void *)[self->super.super.super.super._representedObject title];

  id v4 = (id)[v3 length];
  if (v4) {
    id v4 = v3;
  }
  *((void *)self->super.super.super._strings + 1) = v4;
  CFDateRef v5 = (const __CFDate *)[self->super.super.super.super._representedObject dateValueForProperty:@"last-review-date"];
  if (v5)
  {
    CFDateRef v6 = SUCopyDateStringForDate(v5, kCFDateFormatterLongStyle);
    if (v6) {
      CGFloat v7 = objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"LAST_REVIEW_DATE_FORMAT", &stru_26DB8C5F8, 0), v6);
    }
    else {
      CGFloat v7 = 0;
    }
  }
  else
  {
    CGFloat v7 = 0;
  }

  id v8 = (id)[v7 length];
  if (v8) {
    id v8 = v7;
  }
  *self->super.super.super._strings = v8;
}

@end