@interface MSTrackListLinkCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
- (MSTrackListLinkCellConfiguration)init;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (void)reloadImages;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
@end

@implementation MSTrackListLinkCellConfiguration

- (MSTrackListLinkCellConfiguration)init
{
  return [(SUArrayCellConfiguration *)self initWithStringCount:1 imageCount:1];
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 44.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if ((a4 & 2) != 0) {
    return (id)objc_msgSend(MEMORY[0x263F1C550], "grayColor", a3);
  }
  if (a4) {
    return (id)objc_msgSend(MEMORY[0x263F1C550], "whiteColor", a3);
  }
  return (id)objc_msgSend(MEMORY[0x263F1C550], "blackColor", a3);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", a3, 14.0);
}

- (void)reloadImages
{
  uint64_t v3 = (int)*MEMORY[0x263F89710];
  if ([*(id *)((char *)&self->super.super.super.super.super.isa + v3) itemDisplayType] == 10000
    && (v4 = (void *)[*(id *)((char *)&self->super.super.super.super.super.isa + v3) reviewStatistics],
        [v4 numberOfUserRatings] >= 1))
  {
    v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F89700]);
    [v4 averageUserRating];
    v6 = objc_msgSend(v5, "ratingImageForRating:style:", 1);
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = (int)*MEMORY[0x263F896E0];

  **(void **)((char *)&self->super.super.super.super.super.isa + v7) = v6;
}

- (void)reloadLayoutInformation
{
  double v3 = *(double *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F89708]) + -5.0;
  v4 = **(void ***)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F896E0]);
  v5 = (int *)MEMORY[0x263F896D8];
  if (v4)
  {
    uint64_t v6 = (int)*MEMORY[0x263F896D8];
    uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v6);
    [v4 size];
    *(void *)(v7 + 16) = v8;
    *(void *)(v7 + 24) = v9;
    double v3 = v3 - ((*(double **)((char *)&self->super.super.super.super.super.isa + v6))[2] + 6.0);
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F89700]), "sizeForString:font:constrainedToSize:", **(void **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F896F8]), -[MSTrackListLinkCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 0), v3 + -48.0, 18.0);
  v14.size.width = v10;
  v14.size.height = v11;
  uint64_t v12 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F896F0]);
  *(_OWORD *)uint64_t v12 = xmmword_23791B200;
  *(CGFloat *)(v12 + 16) = v10;
  *(CGFloat *)(v12 + 24) = v11;
  uint64_t v13 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + *v5);
  v14.origin.x = 48.0;
  v14.origin.y = 13.0;
  *(CGFloat *)uint64_t v13 = CGRectGetMaxX(v14) + 6.0;
  *(void *)(v13 + 8) = 0x402C000000000000;
}

- (void)reloadStrings
{
  uint64_t v3 = (int)*MEMORY[0x263F89710];
  uint64_t v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + v3) itemDisplayType];
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4 == 10000)
  {
    uint64_t v6 = (void *)[v5 reviewStatistics];
    uint64_t v7 = (void *)[v6 numberOfUserRatingsString];
    if ([v7 length]) {
      goto LABEL_6;
    }
    [v6 numberOfUserRatings];
    id v8 = (id)SUCopyLocalizedReviewsStringForCount();
  }
  else
  {
    id v8 = (id)[v5 title];
  }
  uint64_t v7 = v8;
LABEL_6:
  uint64_t v9 = (int)*MEMORY[0x263F896F8];

  id v10 = (id)[v7 length];
  if (v10) {
    id v10 = v7;
  }
  **(void **)((char *)&self->super.super.super.super.super.isa + v9) = v10;
}

@end