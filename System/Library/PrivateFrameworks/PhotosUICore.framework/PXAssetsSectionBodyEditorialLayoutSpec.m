@interface PXAssetsSectionBodyEditorialLayoutSpec
- (PXAssetsSectionBodyEditorialLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
@end

@implementation PXAssetsSectionBodyEditorialLayoutSpec

- (PXAssetsSectionBodyEditorialLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PXAssetsSectionBodyEditorialLayoutSpec;
  v4 = [(PXDayAssetsSectionBodyLayoutSpec *)&v8 initWithExtendedTraitCollection:a3 options:a4];
  if (v4)
  {
    v5 = +[PXCuratedLibrarySettings sharedInstance];
    [v5 cornerRadiusForDays];
    *(float *)&double v6 = v6;
    v4->super._bodyCornerRadius = ($E57FD295544FE3DD2B3C272D7C23EB59)vdupq_lane_s32(*(int32x2_t *)&v6, 0);
  }
  return v4;
}

@end