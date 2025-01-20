@interface SUTallLinkCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
+ (id)copyDefaultContext;
- (BOOL)showContentRating;
- (SUTallLinkCellConfiguration)init;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)copyImageDataProvider;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (void)reloadImages;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
@end

@implementation SUTallLinkCellConfiguration

- (SUTallLinkCellConfiguration)init
{
  return [(SUMediaItemCellConfiguration *)self initWithStringCount:4 imageCount:1];
}

+ (id)copyDefaultContext
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SUTallLinkCellConfiguration;
  id v2 = objc_msgSendSuper2(&v6, sel_copyDefaultContext);
  v3 = SUTableCellCopyImageProviderForSize(88.0, 88.0);
  [v2 setImageProvider:v3];

  id v4 = -[SUImageDataProvider newImageFromImage:](v3, "newImageFromImage:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"PlaceholderBig.png", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class())));
  [v2 setPlaceholderImage:v4];

  return v2;
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 89.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if (a4) {
    return (id)objc_msgSend(MEMORY[0x263F1C550], "whiteColor", a3);
  }
  if ((a4 & 2) != 0)
  {
    id v4 = (void *)MEMORY[0x263F1C550];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263F1C550];
    if (a3 == 4) {
      return (id)[MEMORY[0x263F1C550] blackColor];
    }
  }
  return (id)objc_msgSend(v4, "grayColor", a3);
}

- (id)copyImageDataProvider
{
  v5.receiver = self;
  v5.super_class = (Class)SUTallLinkCellConfiguration;
  id v3 = [(SUMediaItemCellConfiguration *)&v5 copyImageDataProvider];
  if (SUItemTypeIsVideoType([self->super.super.super.super.super._representedObject itemType])) {
    objc_msgSend(v3, "setFillColor:", objc_msgSend(MEMORY[0x263F1C550], "blackColor"));
  }
  return v3;
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  if (a3 != 3)
  {
    if (a3 == 4)
    {
      id v3 = (void *)MEMORY[0x263F1C658];
      double v4 = 15.0;
LABEL_10:
      return (id)[v3 boldSystemFontOfSize:v4];
    }
    id v3 = (void *)MEMORY[0x263F1C658];
LABEL_9:
    double v4 = 13.0;
    goto LABEL_10;
  }
  uint64_t v5 = [self->super.super.super.super.super._representedObject itemType];
  id v3 = (void *)MEMORY[0x263F1C658];
  if (v5 == 1009) {
    goto LABEL_9;
  }

  return (id)[v3 systemFontOfSize:13.0];
}

- (void)reloadImages
{
  v6.receiver = self;
  v6.super_class = (Class)SUTallLinkCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v6 reloadImages];
  if (!*self->super.super.super.super._images) {
    *self->super.super.super.super._images = (id)[self->super.super.super.super.super._context placeholderImage];
  }
  id v3 = (void *)[self->super.super.super.super.super._representedObject reviewStatistics];
  if ([v3 numberOfUserRatings] < 1)
  {
    id v5 = 0;
  }
  else
  {
    id context = self->super.super.super.super.super._context;
    [v3 averageUserRating];
    id v5 = (id)objc_msgSend(context, "ratingImageForRating:style:", 1);
  }

  *((void *)self->super.super.super.super._images + 2) = v5;
}

- (void)reloadLayoutInformation
{
  v34.receiver = self;
  v34.super_class = (Class)SUTallLinkCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v34 reloadLayoutInformation];
  [(SUMediaItemCellConfiguration *)self artworkSize];
  imageFrames = self->super.super.super.super._imageFrames;
  imageFrames->origin.x = 0.0;
  imageFrames->origin.y = 0.0;
  imageFrames->size.width = v4;
  imageFrames->size.height = v5;
  images = self->super.super.super.super._images;
  double v7 = v4 + -4.0 + 10.0;
  id v8 = images[1];
  if (*images) {
    double v9 = v7;
  }
  else {
    double v9 = 10.0;
  }
  if (v8)
  {
    [v8 size];
    v35.size.width = v10;
    v35.size.height = v11;
    v12 = self->super.super.super.super._imageFrames;
    v12[1].size.width = v10;
    v12[1].size.height = v11;
    v35.origin.x = self->super.super.super.super.super._layoutSize.width - v10 + -5.0;
    v12[1].origin.x = v35.origin.x;
    v12[1].origin.y = 38.0;
    v35.origin.y = 38.0;
    double MinX = CGRectGetMinX(v35);
  }
  else
  {
    double MinX = self->super.super.super.super.super._layoutSize.width;
  }
  double v14 = MinX + -5.0;
  double v15 = MinX + -5.0 - v9;
  strings = self->super.super.super.super._strings;
  id v17 = strings[2];
  if (v17)
  {
    objc_msgSend(self->super.super.super.super.super._context, "sizeForString:font:constrainedToSize:", v17, -[SUTallLinkCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 2), 1.79769313e308, 1.79769313e308);
    v36.size.width = v18;
    v36.size.height = v19;
    v36.origin.x = v14 - v18;
    stringFrames = self->super.super.super.super._stringFrames;
    stringFrames[2].origin.x = v36.origin.x;
    stringFrames[2].size.width = v36.size.width;
    stringFrames[2].size.height = v19;
    v36.origin.y = stringFrames[2].origin.y;
    double v21 = CGRectGetMinX(v36) + -10.0 - v9;
    strings = self->super.super.super.super._strings;
  }
  else
  {
    double v21 = MinX + -5.0 - v9;
  }
  objc_msgSend(self->super.super.super.super.super._context, "sizeForString:font:constrainedToSize:", strings[4], -[SUTallLinkCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 4), v21, 34.0);
  v23 = self->super.super.super.super._stringFrames;
  double v24 = 24.0;
  if (v22 < 33.0) {
    double v24 = 34.0;
  }
  double v25 = 6.0;
  if (v22 < 33.0) {
    double v25 = 15.0;
  }
  double v26 = 63.0;
  if (v22 < 33.0) {
    double v26 = 56.0;
  }
  double v27 = 64.0;
  if (v22 < 33.0) {
    double v27 = 57.0;
  }
  v23[4].origin.x = v9;
  v23[4].origin.y = v24;
  v23[4].size.width = v21;
  v23[4].size.height = v22;
  v23[1].origin.x = v9;
  v23[1].origin.y = v25;
  v23[1].size.width = v15;
  v23[1].size.height = 16.0;
  v23[3].origin.x = v9;
  v23[3].origin.y = v26;
  v23[3].size.width = v15;
  v23[3].size.height = 16.0;
  v28 = self->super.super.super.super._imageFrames;
  v28[2].origin.x = v9;
  v28[2].origin.y = v27;
  v23[2].origin.y = 35.0;
  v29 = (void *)*((void *)self->super.super.super.super._images + 2);
  if (v29)
  {
    [v29 size];
    v28[2].size.width = v30;
    v28[2].size.height = v31;
    CGFloat v32 = CGRectGetMaxX(self->super.super.super.super._imageFrames[2]) + 5.0;
    v33 = self->super.super.super.super._stringFrames;
    v33[3].origin.x = v32;
    v33[3].size.width = v14 - v32;
  }
}

- (void)reloadStrings
{
  v15.receiver = self;
  v15.super_class = (Class)SUTallLinkCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v15 reloadStrings];
  id v3 = (void *)[self->super.super.super.super.super._representedObject title];

  id v4 = (id)[v3 length];
  if (v4) {
    id v4 = v3;
  }
  *((void *)self->super.super.super.super._strings + 4) = v4;
  CGFloat v5 = (void *)[self->super.super.super.super.super._representedObject containerName];
  if (![v5 length]) {
    CGFloat v5 = (void *)[self->super.super.super.super.super._representedObject artistName];
  }

  id v6 = (id)[v5 length];
  if (v6) {
    id v6 = v5;
  }
  *((void *)self->super.super.super.super._strings + 1) = v6;
  if ([self->super.super.super.super.super._representedObject itemType] == 3000) {
    double v7 = objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "defaultStoreOffer"), "priceDisplay");
  }
  else {
    double v7 = 0;
  }

  id v8 = (id)[v7 length];
  if (v8) {
    id v8 = v7;
  }
  *((void *)self->super.super.super.super._strings + 2) = v8;
  uint64_t v9 = objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "reviewStatistics"), "numberOfUserRatings");
  double v10 = (void *)[self->super.super.super.super.super._representedObject secondaryTitle];

  if (v9 == 1)
  {
    if (![v10 length])
    {
      CGFloat v11 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = @"ONE_REVIEW";
      goto LABEL_18;
    }
  }
  else if (v9)
  {
    if (![v10 length])
    {
      id v14 = [NSString alloc];
      id v13 = (id)objc_msgSend(v14, "initWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"REVIEW_COUNT", &stru_26DB8C5F8, 0), v9);
      goto LABEL_21;
    }
  }
  else if (![v10 length])
  {
    CGFloat v11 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = @"NO_REVIEWS";
LABEL_18:
    double v10 = (void *)[v11 localizedStringForKey:v12 value:&stru_26DB8C5F8 table:0];
  }
  id v13 = v10;
LABEL_21:
  *((void *)self->super.super.super.super._strings + 3) = v13;
}

- (BOOL)showContentRating
{
  return 0;
}

@end