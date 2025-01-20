@interface SUThreeLineTrackCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
+ (id)copyDefaultContext;
- (SUThreeLineTrackCellConfiguration)init;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (unint64_t)indexOfLabelForPurchaseAnimation;
- (void)reloadImages;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
@end

@implementation SUThreeLineTrackCellConfiguration

- (SUThreeLineTrackCellConfiguration)init
{
  return [(SUMediaItemCellConfiguration *)self initWithStringCount:3 imageCount:0];
}

+ (id)copyDefaultContext
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SUThreeLineTrackCellConfiguration;
  id v2 = objc_msgSendSuper2(&v6, sel_copyDefaultContext);
  v3 = SUTableCellCopyImageProviderForSize(55.0, 55.0);
  [v2 setImageProvider:v3];

  id v4 = -[SUImageDataProvider newImageFromImage:](v3, "newImageFromImage:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"PlaceholderNormal.png", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class())));
  [v2 setPlaceholderImage:v4];

  return v2;
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 56.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if ((a4 & 2) != 0)
  {
LABEL_13:
    v9 = (void *)MEMORY[0x263F1C550];
    return (id)objc_msgSend(v9, "grayColor", a3);
  }
  if (a4)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "defaultStoreOffer"), "offerMedia"), "URL"))
    {
      if (a3 == 3)
      {
        return (id)SUTableCellGetHighlightedTextColor();
      }
      else
      {
        return [(SUThreeLineTrackCellConfiguration *)self colorForLabelAtIndex:a3 withModifiers:a4 & 0xFFFFFFFFFFFFFFFELL];
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x263F1C550];
      return (id)[v10 whiteColor];
    }
  }
  else
  {
    if (a3 == 3)
    {
      v7 = (void *)MEMORY[0x263F1C550];
      return (id)[v7 blackColor];
    }
    if (a3 - 1 <= 1) {
      goto LABEL_13;
    }
    if (objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "contentRating"), "isExplicitContent"))
    {
      return (id)SUTableCellGetExplicitColor();
    }
    else
    {
      return (id)SUTableCellGetCleanColor();
    }
  }
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  if (a3 - 1 >= 2)
  {
    if (a3 == 3)
    {
      v5 = (void *)MEMORY[0x263F1C658];
      return (id)[v5 boldSystemFontOfSize:14.0];
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)SUThreeLineTrackCellConfiguration;
      return -[SUMediaItemCellConfiguration fontForLabelAtIndex:](&v6, sel_fontForLabelAtIndex_);
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x263F1C658];
    return (id)[v3 systemFontOfSize:13.0];
  }
}

- (unint64_t)indexOfLabelForPurchaseAnimation
{
  return 3;
}

- (void)reloadImages
{
  v3.receiver = self;
  v3.super_class = (Class)SUThreeLineTrackCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v3 reloadImages];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "defaultStoreOffer"), "offerMedia"), "URL"))
  {

    *((void *)self->super.super.super.super._selectedImages + 1) = 0;
  }
}

- (void)reloadLayoutInformation
{
  v23.receiver = self;
  v23.super_class = (Class)SUThreeLineTrackCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v23 reloadLayoutInformation];
  [(SUMediaItemCellConfiguration *)self artworkSize];
  images = self->super.super.super.super._images;
  if (*images)
  {
    double v5 = v3;
    [*images size];
    imageFrames = self->super.super.super.super._imageFrames;
    float v8 = (v5 - v7) * 0.5;
    imageFrames->origin.x = floorf(v8);
    imageFrames->origin.y = 0.0;
    imageFrames->size.width = v7;
    imageFrames->size.height = 55.0;
    images = self->super.super.super.super._images;
    p_layoutSize = &self->super.super.super.super.super._layoutSize;
    double v10 = self->super.super.super.super.super._layoutSize.width + -5.0;
    if (*images)
    {
      double v11 = v5 + -2.0 + 10.0;
      goto LABEL_6;
    }
  }
  else
  {
    p_layoutSize = &self->super.super.super.super.super._layoutSize;
    double v10 = self->super.super.super.super.super._layoutSize.width + -5.0;
  }
  double v11 = 10.0;
LABEL_6:
  id v12 = images[1];
  double v13 = v10;
  if (v12)
  {
    objc_msgSend(v12, "size", v10);
    v24.size.width = v14;
    v24.size.height = v15;
    v16 = self->super.super.super.super._imageFrames;
    v16[1].size.width = v14;
    v16[1].size.height = v15;
    v24.origin.x = v10 - v14;
    v24.origin.y = floor((p_layoutSize->height - v15) * 0.5);
    v16[1].origin.x = v24.origin.x;
    v16[1].origin.y = v24.origin.y;
    double v13 = CGRectGetMinX(v24) + -5.0;
  }
  strings = self->super.super.super.super._strings;
  id v18 = strings[1];
  if (strings[2])
  {
    if (v18)
    {
      stringFrames = self->super.super.super.super._stringFrames;
      stringFrames[3].origin.x = v11;
      stringFrames[3].origin.y = 18.0;
      stringFrames[3].size.width = v13 - v11;
      stringFrames[3].size.height = 18.0;
      stringFrames[2].origin.x = v11 + 1.0;
      stringFrames[2].origin.y = 2.0;
      stringFrames[2].size.width = v13 - v11 + -1.0;
      stringFrames[2].size.height = 16.0;
      stringFrames[1].origin.x = v11;
      stringFrames[1].origin.y = 36.0;
      stringFrames[1].size.width = v13 - v11;
      p_height = (void *)&stringFrames[1].size.height;
      double v21 = 37.0;
      uint64_t v22 = 1;
      goto LABEL_14;
    }
  }
  else if (v18)
  {
    stringFrames = self->super.super.super.super._stringFrames;
    stringFrames[3].origin.x = v11;
    stringFrames[3].origin.y = 27.0;
    stringFrames[3].size.width = v13 - v11;
    stringFrames[3].size.height = 18.0;
    stringFrames[1].origin.x = v11;
    stringFrames[1].origin.y = 10.0;
    stringFrames[1].size.width = v13 - v11;
    p_height = (void *)&stringFrames[1].size.height;
    double v21 = 30.0;
    uint64_t v22 = 3;
    goto LABEL_14;
  }
  stringFrames = self->super.super.super.super._stringFrames;
  stringFrames[3].origin.x = v11;
  stringFrames[3].origin.y = 27.0;
  stringFrames[3].size.width = v13 - v11;
  stringFrames[3].size.height = 18.0;
  stringFrames[2].origin.x = v11 + 1.0;
  stringFrames[2].origin.y = 10.0;
  stringFrames[2].size.width = v13 - v11 + -1.0;
  p_height = (void *)&stringFrames[2].size.height;
  double v21 = 30.0;
  uint64_t v22 = 3;
LABEL_14:
  void *p_height = 0x4030000000000000;
  if (*strings)
  {
    v25.origin.x = v13 + stringFrames->origin.x - v10;
    v25.origin.y = v21 + stringFrames->origin.y;
    stringFrames->origin.x = v25.origin.x;
    stringFrames->origin.y = v25.origin.y;
    v25.size.width = stringFrames->size.width;
    v25.size.height = stringFrames->size.height;
    self->super.super.super.super._stringFrames[v22].size.width = CGRectGetMinX(v25)
                                                                + -6.0
                                                                - self->super.super.super.super._stringFrames[v22].origin.x;
  }
}

- (void)reloadStrings
{
  v14.receiver = self;
  v14.super_class = (Class)SUThreeLineTrackCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v14 reloadStrings];
  double v3 = (void *)[self->super.super.super.super.super._representedObject artistName];
  id v4 = (void *)[self->super.super.super.super.super._representedObject title];
  if ([self->super.super.super.super.super._representedObject itemType] == 1009)
  {
    uint64_t v5 = [self->super.super.super.super.super._representedObject containerName];
    if (v5) {
      double v3 = (void *)v5;
    }
    p_strings = &self->super.super.super.super._strings;

    id v7 = (id)[v3 length];
    if (v7) {
      id v7 = v3;
    }
    (*p_strings)[2] = v7;

    id v8 = (id)[v4 length];
    if (v8) {
      id v8 = v4;
    }
    (*p_strings)[3] = v8;
    uint64_t v9 = [self->super.super.super.super.super._representedObject secondaryTitle];
  }
  else
  {
    p_strings = &self->super.super.super.super._strings;

    id v10 = (id)[v3 length];
    if (v10) {
      id v10 = v3;
    }
    (*p_strings)[2] = v10;

    id v11 = (id)[v4 length];
    if (v11) {
      id v11 = v4;
    }
    (*p_strings)[3] = v11;
    uint64_t v9 = [self->super.super.super.super.super._representedObject collectionName];
  }
  id v12 = (void *)v9;

  id v13 = (id)[v12 length];
  if (v13) {
    id v13 = v12;
  }
  (*p_strings)[1] = v13;
}

@end