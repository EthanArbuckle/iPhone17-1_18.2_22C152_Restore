@interface SUNowPlayingTrackCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
+ (id)copyDefaultContext;
- (BOOL)showContentRating;
- (SUNowPlayingTrackCellConfiguration)init;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (int64_t)mediaIconType;
- (void)reloadImages;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
@end

@implementation SUNowPlayingTrackCellConfiguration

- (SUNowPlayingTrackCellConfiguration)init
{
  return [(SUMediaItemCellConfiguration *)self initWithStringCount:3 imageCount:0];
}

+ (id)copyDefaultContext
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___SUNowPlayingTrackCellConfiguration;
  id v2 = objc_msgSendSuper2(&v15, sel_copyDefaultContext);
  v3 = objc_alloc_init(SUImageDataProvider);
  -[SUImageDataProvider setFillColor:](v3, "setFillColor:", [MEMORY[0x263F1C550] clearColor]);
  -[SUImageDataProvider setFinalSize:](v3, "setFinalSize:", 88.0, 88.0);
  uint64_t v19 = 0;
  long long v20 = 0u;
  long long v16 = 0u;
  uint64_t v17 = 0;
  long long v18 = xmmword_227924420;
  __asm { FMOV            V0.2D, #1.0 }
  long long v21 = _Q0;
  v9 = (void *)[objc_alloc(MEMORY[0x263F1C678]) initVerticalWithValues:&v16];
  v10 = objc_alloc_init(SUReflectionImageModifier);
  [(SUReflectionImageModifier *)v10 setReflectionHeight:8.0];
  [(SUReflectionImageModifier *)v10 setGradient:v9];

  v11 = objc_alloc_init(SUStrokeEdgesImageModifier);
  -[SUStrokeEdgesImageModifier setEdgeInsets:](v11, "setEdgeInsets:", 1.0, 1.0, 1.0, 1.0);
  [(SUStrokeEdgesImageModifier *)v11 setFitToImage:1];
  -[SUStrokeEdgesImageModifier setStrokeColor:](v11, "setStrokeColor:", [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.150000006]);
  v12 = objc_alloc_init(SUArrayImageModifier);
  -[SUArrayImageModifier setModifiers:](v12, "setModifiers:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v10, v11, 0));
  [(SUImageDataProvider *)v3 setModifier:v12];

  [v2 setImageProvider:v3];
  id v13 = -[SUImageDataProvider newImageFromImage:](v3, "newImageFromImage:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"PlaceholderBig.png", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class())));
  [v2 setPlaceholderImage:v13];

  return v2;
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 104.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if ((a4 & 2) != 0) {
    return (id)objc_msgSend(MEMORY[0x263F1C550], "grayColor", a3);
  }
  if (a4) {
    return (id)objc_msgSend(MEMORY[0x263F1C550], "whiteColor", a3);
  }
  if (a3 == 2) {
    return (id)[MEMORY[0x263F1C550] colorWithWhite:0.2 alpha:1.0];
  }
  return (id)[MEMORY[0x263F1C550] blackColor];
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  double v3 = 10.0;
  if (a3 == 3) {
    double v3 = 20.0;
  }
  if (a3 == 1) {
    double v3 = 15.0;
  }
  return (id)[MEMORY[0x263F1C658] boldSystemFontOfSize:v3];
}

- (void)reloadImages
{
  v3.receiver = self;
  v3.super_class = (Class)SUNowPlayingTrackCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v3 reloadImages];
  if (!*self->super.super.super.super._images) {
    *self->super.super.super.super._images = (id)[self->super.super.super.super.super._context placeholderImage];
  }
}

- (void)reloadLayoutInformation
{
  v15.receiver = self;
  v15.super_class = (Class)SUNowPlayingTrackCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v15 reloadLayoutInformation];
  imageFrames = self->super.super.super.super._imageFrames;
  __asm { FMOV            V0.2D, #7.0 }
  imageFrames->origin = _Q0;
  imageFrames->size = (CGSize)xmmword_227924430;
  stringFrames = self->super.super.super.super._stringFrames;
  double v10 = self->super.super.super.super.super._layoutSize.width + -5.0 + -102.0;
  stringFrames[1].origin = (CGPoint)xmmword_227924440;
  stringFrames[1].size.width = v10;
  *(_OWORD *)&stringFrames[1].size.height = xmmword_227924450;
  stringFrames[2].origin.y = 6.0;
  stringFrames[2].size.width = v10;
  stringFrames[2].size.height = 14.0;
  strings = self->super.super.super.super._strings;
  if (strings[1])
  {
    stringFrames[3].origin = (CGPoint)xmmword_227924460;
    stringFrames[3].size.width = v10;
    stringFrames[3].size.height = 25.0;
  }
  else
  {
    objc_msgSend(self->super.super.super.super.super._context, "sizeForString:font:constrainedToSize:", strings[3], -[SUNowPlayingTrackCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 3), v10, 50.0);
    v12 = self->super.super.super.super._stringFrames;
    v12[3].size.width = v13;
    v12[3].size.height = v14;
    *(float *)&CGFloat v13 = (self->super.super.super.super.super._layoutSize.height - v14) * 0.5;
    v12[3].origin.x = 102.0;
    v12[3].origin.y = floorf(*(float *)&v13);
  }
}

- (void)reloadStrings
{
  v7.receiver = self;
  v7.super_class = (Class)SUNowPlayingTrackCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v7 reloadStrings];
  objc_super v3 = (void *)[self->super.super.super.super.super._representedObject title];

  id v4 = (id)[v3 length];
  if (v4) {
    id v4 = v3;
  }
  *((void *)self->super.super.super.super._strings + 3) = v4;
  v5 = (void *)[self->super.super.super.super.super._representedObject artistName];

  id v6 = (id)[v5 length];
  if (v6) {
    id v6 = v5;
  }
  *((void *)self->super.super.super.super._strings + 1) = v6;
  if (!*((void *)self->super.super.super.super._strings + 2)) {
    *((void *)self->super.super.super.super._strings + 2) = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PARTNER_NOW_PLAYING", &stru_26DB8C5F8, 0);
  }
}

- (BOOL)showContentRating
{
  return 0;
}

- (int64_t)mediaIconType
{
  return 0;
}

@end