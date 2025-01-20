@interface SUTwoLineTrackCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
+ (id)copyDefaultContext;
- (SUTwoLineTrackCellConfiguration)init;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (unint64_t)indexOfLabelForPurchaseAnimation;
- (void)reloadImages;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
@end

@implementation SUTwoLineTrackCellConfiguration

- (SUTwoLineTrackCellConfiguration)init
{
  return [(SUMediaItemCellConfiguration *)self initWithStringCount:2 imageCount:0];
}

+ (id)copyDefaultContext
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SUTwoLineTrackCellConfiguration;
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
LABEL_8:
    v9 = (void *)MEMORY[0x263F1C550];
    return (id)objc_msgSend(v9, "grayColor", a3);
  }
  if ((a4 & 1) == 0)
  {
    if (a3 != 1)
    {
      if (a3 == 2)
      {
        v7 = (void *)MEMORY[0x263F1C550];
        return (id)[v7 blackColor];
      }
      else if (objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "contentRating"), "isExplicitContent"))
      {
        return (id)SUTableCellGetExplicitColor();
      }
      else
      {
        return (id)SUTableCellGetCleanColor();
      }
    }
    goto LABEL_8;
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "defaultStoreOffer"), "offerMedia"), "URL"))
  {
    if (a3 == 2)
    {
      return (id)SUTableCellGetHighlightedTextColor();
    }
    else
    {
      return [(SUTwoLineTrackCellConfiguration *)self colorForLabelAtIndex:a3 withModifiers:a4 & 0xFFFFFFFFFFFFFFFELL];
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x263F1C550];
    return (id)[v10 whiteColor];
  }
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = (void *)MEMORY[0x263F1C658];
    return (id)[v5 boldSystemFontOfSize:14.0];
  }
  else if (a3 == 1)
  {
    v3 = (void *)MEMORY[0x263F1C658];
    return (id)[v3 systemFontOfSize:13.0];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SUTwoLineTrackCellConfiguration;
    return -[SUMediaItemCellConfiguration fontForLabelAtIndex:](&v6, sel_fontForLabelAtIndex_);
  }
}

- (unint64_t)indexOfLabelForPurchaseAnimation
{
  return 2;
}

- (void)reloadLayoutInformation
{
  v18.receiver = self;
  v18.super_class = (Class)SUTwoLineTrackCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v18 reloadLayoutInformation];
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
      double v11 = v5 + -3.0 + 10.0;
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
    v19.size.width = v14;
    v19.size.height = v15;
    v16 = self->super.super.super.super._imageFrames;
    v16[1].size.width = v14;
    v16[1].size.height = v15;
    v19.origin.x = v10 - v14;
    v19.origin.y = floor((p_layoutSize->height - v15) * 0.5);
    v16[1].origin.x = v19.origin.x;
    v16[1].origin.y = v19.origin.y;
    double v13 = CGRectGetMinX(v19) + -5.0;
  }
  stringFrames = self->super.super.super.super._stringFrames;
  stringFrames[2].origin.x = v11;
  stringFrames[2].origin.y = 10.0;
  stringFrames[2].size.width = v13 - v11;
  stringFrames[2].size.height = 18.0;
  stringFrames[1].origin.x = v11 + 1.0;
  stringFrames[1].origin.y = 27.0;
  stringFrames[1].size.width = v13 - v11 + -1.0;
  stringFrames[1].size.height = 16.0;
  if (*self->super.super.super.super._strings)
  {
    v20.origin.x = v13 + stringFrames->origin.x - v10;
    v20.origin.y = stringFrames->origin.y + 30.0;
    stringFrames->origin.x = v20.origin.x;
    stringFrames->origin.y = v20.origin.y;
    v20.size.width = stringFrames->size.width;
    v20.size.height = stringFrames->size.height;
    self->super.super.super.super._stringFrames[1].size.width = CGRectGetMinX(v20)
                                                              + -6.0
                                                              - self->super.super.super.super._stringFrames[1].origin.x;
  }
}

- (void)reloadImages
{
  v3.receiver = self;
  v3.super_class = (Class)SUTwoLineTrackCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v3 reloadImages];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "defaultStoreOffer"), "offerMedia"), "URL"))
  {

    *((void *)self->super.super.super.super._selectedImages + 1) = 0;
  }
}

- (void)reloadStrings
{
  v7.receiver = self;
  v7.super_class = (Class)SUTwoLineTrackCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v7 reloadStrings];
  objc_super v3 = (void *)[self->super.super.super.super.super._representedObject title];

  id v4 = (id)[v3 length];
  if (v4) {
    id v4 = v3;
  }
  *((void *)self->super.super.super.super._strings + 2) = v4;
  double v5 = (void *)[self->super.super.super.super.super._representedObject artistName];

  id v6 = (id)[v5 length];
  if (v6) {
    id v6 = v5;
  }
  *((void *)self->super.super.super.super._strings + 1) = v6;
}

@end