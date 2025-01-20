@interface SUShortLinkCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
+ (id)copyDefaultContext;
- (BOOL)showContentRating;
- (SUShortLinkCellConfiguration)init;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)copyImageDataProvider;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
@end

@implementation SUShortLinkCellConfiguration

- (SUShortLinkCellConfiguration)init
{
  return [(SUMediaItemCellConfiguration *)self initWithStringCount:3 imageCount:0];
}

+ (id)copyDefaultContext
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SUShortLinkCellConfiguration;
  id v2 = objc_msgSendSuper2(&v6, sel_copyDefaultContext);
  v3 = SUTableCellCopyImageProviderForSize(55.0, 55.0);
  [v2 setImageProvider:v3];

  id v4 = -[SUImageDataProvider newImageFromImage:](v3, "newImageFromImage:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"PlaceholderNormal.png", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class())));
  [v2 setPlaceholderImage:v4];

  return v2;
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  if ([a4 secondaryTitle] || objc_msgSend(a4, "artistName"))
  {
    BOOL v6 = 1;
    if (a3) {
      goto LABEL_4;
    }
    return 56.0;
  }
  BOOL v6 = [a4 containerName] != 0;
  if (!a3) {
    return 56.0;
  }
LABEL_4:
  int v7 = [a3 itemsHaveArtwork];
  double result = 45.0;
  if (v7 | v6) {
    return 56.0;
  }
  return result;
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
    if (a3 == 2) {
      return (id)[MEMORY[0x263F1C550] blackColor];
    }
  }
  return (id)objc_msgSend(v4, "grayColor", a3);
}

- (id)copyImageDataProvider
{
  v5.receiver = self;
  v5.super_class = (Class)SUShortLinkCellConfiguration;
  id v3 = [(SUMediaItemCellConfiguration *)&v5 copyImageDataProvider];
  if (SUItemTypeIsVideoType([self->super.super.super.super.super._representedObject itemType])) {
    objc_msgSend(v3, "setFillColor:", objc_msgSend(MEMORY[0x263F1C550], "blackColor"));
  }
  return v3;
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  if (a3 == 3)
  {
LABEL_4:
    id v3 = (void *)MEMORY[0x263F1C658];
    return (id)[v3 systemFontOfSize:13.0];
  }
  if (a3 != 2)
  {
    if (a3 != 1) {
      return 0;
    }
    goto LABEL_4;
  }
  if ([self->super.super.super.super._strings[1] length]
    || [self->super.super.super.super._strings[3] length])
  {
    BOOL v6 = (void *)MEMORY[0x263F1C658];
    double v7 = 14.0;
  }
  else
  {
    BOOL v6 = (void *)MEMORY[0x263F1C658];
    double v7 = 17.0;
  }

  return (id)[v6 boldSystemFontOfSize:v7];
}

- (void)reloadLayoutInformation
{
  v23.receiver = self;
  v23.super_class = (Class)SUShortLinkCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v23 reloadLayoutInformation];
  [(SUMediaItemCellConfiguration *)self artworkSize];
  double v4 = v3;
  id v5 = *self->super.super.super.super._images;
  if (!v5)
  {
    p_layoutSize = &self->super.super.super.super.super._layoutSize;
    double width = self->super.super.super.super.super._layoutSize.width;
    goto LABEL_5;
  }
  [v5 size];
  imageFrames = self->super.super.super.super._imageFrames;
  float v8 = (v4 - v7) * 0.5;
  imageFrames->origin.x = floorf(v8);
  imageFrames->origin.y = 0.0;
  imageFrames->size.double width = v7;
  imageFrames->size.height = 55.0;
  p_layoutSize = &self->super.super.super.super.super._layoutSize;
  double width = self->super.super.super.super.super._layoutSize.width;
  if (!*self->super.super.super.super._images)
  {
LABEL_5:
    double v11 = 10.0;
    if ([self->super.super.super.super.super._representedObject itemDisplayType] == 1) {
      goto LABEL_7;
    }
  }
  double v11 = v4 + -2.0 + 10.0;
LABEL_7:
  v12 = (void *)*((void *)self->super.super.super.super._images + 1);
  if (v12)
  {
    [v12 size];
    v24.size.double width = v13;
    v24.size.height = v14;
    v15 = self->super.super.super.super._imageFrames;
    v15[1].size.double width = v13;
    v15[1].size.height = v14;
    v24.origin.x = p_layoutSize->width - v13 + -5.0;
    v15[1].origin.x = v24.origin.x;
    v15[1].origin.y = 21.0;
    v24.origin.y = 21.0;
    double width = CGRectGetMinX(v24);
  }
  double v16 = width + -5.0;
  strings = self->super.super.super.super._strings;
  if (strings[3])
  {
    stringFrames = self->super.super.super.super._stringFrames;
    stringFrames[2].origin.x = v11;
    stringFrames[2].origin.y = 19.0;
    stringFrames[2].size.double width = v16 - v11;
    stringFrames[2].size.height = 18.0;
    stringFrames[1].origin.x = v11;
    stringFrames[1].origin.y = 2.0;
    stringFrames[1].size.double width = v16 - v11;
    stringFrames[1].size.height = 16.0;
    stringFrames[3].origin.x = v11;
    stringFrames[3].origin.y = 37.0;
    stringFrames[3].size.double width = v16 - v11;
    stringFrames[3].size.height = 16.0;
  }
  else if (strings[1])
  {
    v19 = self->super.super.super.super._stringFrames;
    v19[2].origin.x = v11;
    v19[2].origin.y = 27.0;
    v19[2].size.double width = v16 - v11;
    v19[2].size.height = 18.0;
    v19[1].origin.x = v11;
    v19[1].origin.y = 10.0;
    v19[1].size.double width = v16 - v11;
    v19[1].size.height = 16.0;
  }
  else
  {
    char v20 = [self->super.super.super.super.super._context itemsHaveArtwork];
    v21 = self->super.super.super.super._stringFrames;
    v21[2].origin.x = v11;
    if (v20) {
      uint64_t v22 = 0x4030000000000000;
    }
    else {
      uint64_t v22 = 0x4028000000000000;
    }
    *(void *)&v21[2].origin.y = v22;
    v21[2].size.double width = v16 - v11;
    v21[2].size.height = 20.0;
  }
}

- (void)reloadStrings
{
  v9.receiver = self;
  v9.super_class = (Class)SUShortLinkCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v9 reloadStrings];
  double v3 = (void *)[self->super.super.super.super.super._representedObject title];

  id v4 = (id)[v3 length];
  if (v4) {
    id v4 = v3;
  }
  *((void *)self->super.super.super.super._strings + 2) = v4;
  id v5 = (void *)[self->super.super.super.super.super._representedObject containerName];
  if (![v5 length]) {
    id v5 = (void *)[self->super.super.super.super.super._representedObject artistName];
  }

  id v6 = (id)[v5 length];
  if (v6) {
    id v6 = v5;
  }
  *((void *)self->super.super.super.super._strings + 1) = v6;
  CGFloat v7 = (void *)[self->super.super.super.super.super._representedObject secondaryTitle];

  id v8 = (id)[v7 length];
  if (v8) {
    id v8 = v7;
  }
  *((void *)self->super.super.super.super._strings + 3) = v8;
}

- (BOOL)showContentRating
{
  return 0;
}

@end