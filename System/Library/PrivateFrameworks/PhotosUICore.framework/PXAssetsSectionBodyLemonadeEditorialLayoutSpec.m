@interface PXAssetsSectionBodyLemonadeEditorialLayoutSpec
- (PXAssetsSectionBodyLemonadeEditorialLayoutSpec)initWithExtendedTraitCollection:(id)a3 bodyCornerRadius:(id)a4;
@end

@implementation PXAssetsSectionBodyLemonadeEditorialLayoutSpec

- (PXAssetsSectionBodyLemonadeEditorialLayoutSpec)initWithExtendedTraitCollection:(id)a3 bodyCornerRadius:(id)a4
{
  float v8 = v7;
  float v9 = v6;
  float v10 = v5;
  float v11 = v4;
  id v13 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXAssetsSectionBodyLemonadeEditorialLayoutSpec;
  v14 = [(PXFeatureSpec *)&v24 initWithExtendedTraitCollection:v13];
  v15 = v14;
  if (v14)
  {
    v14->super._bodyCornerRadius.var0.var0.topLeft = v11;
    v14->super._bodyCornerRadius.var0.var0.topRight = v10;
    v14->super._bodyCornerRadius.var0.var0.bottomLeft = v9;
    v14->super._bodyCornerRadius.var0.var0.bottomRight = v8;
    uint64_t v16 = [v13 userInterfaceIdiom];
    if (v16 == 5)
    {
      uint64_t v17 = 240;
      uint64_t v18 = 0x4010000000000000;
      goto LABEL_6;
    }
    if (v16 == 4)
    {
      uint64_t v17 = 248;
      uint64_t v18 = 0x402A000000000000;
LABEL_6:
      *(Class *)((char *)&v15->super.super.super.isa + v17) = (Class)v18;
      goto LABEL_12;
    }
    if ([v13 userInterfaceStyle] == 2
      || (+[PXLemonadeSettings sharedInstance],
          v19 = objc_claimAutoreleasedReturnValue(),
          char v20 = [v19 forceDarkDetailsView],
          v19,
          (v20 & 1) != 0))
    {
      v21 = +[PXZoomablePhotosSettings sharedInstance];
      [v21 darkModeInteritemSpacing];
    }
    else
    {
      v21 = +[PXZoomablePhotosSettings sharedInstance];
      [v21 interitemSpacing];
    }
    v15->super._interitemSpacing = v22;
  }
LABEL_12:

  return v15;
}

@end