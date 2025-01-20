@interface PXCuratedLibraryCardSectionBodyLayoutSpec
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius;
- (BOOL)allowsVideoPlaybackAtAnySize;
- (PXCuratedLibraryCardSectionBodyLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXGGradient)skimmingHintGradient;
- (UIEdgeInsets)padding;
- (double)aspectRatio;
- (double)distanceToNextLayout;
- (double)horizontalMargin;
- (void)setAspectRatio:(double)a3;
- (void)setCornerRadius:(id)a3;
- (void)setDistanceToNextLayout:(double)a3;
- (void)setHorizontalMargin:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
@end

@implementation PXCuratedLibraryCardSectionBodyLayoutSpec

- (void)setCornerRadius:(id)a3
{
  self->_cornerRadius.var0.var0.topLeft = v3;
  self->_cornerRadius.var0.var0.topRight = v4;
  self->_cornerRadius.var0.var0.bottomLeft = v5;
  self->_cornerRadius.var0.var0.bottomRight = v6;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (PXCuratedLibraryCardSectionBodyLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PXCuratedLibraryCardSectionBodyLayoutSpec;
  float v4 = [(PXFeatureSpec *)&v14 initWithExtendedTraitCollection:a3 options:a4];
  if (v4)
  {
    float v5 = +[PXCuratedLibrarySettings sharedInstance];
    v4->_aspectRatio = 1.0;
    long long v6 = *((_OWORD *)off_1E5DAAF10 + 1);
    *(_OWORD *)&v4->_padding.top = *(_OWORD *)off_1E5DAAF10;
    *(_OWORD *)&v4->_padding.bottom = v6;
    if ([(PXFeatureSpec *)v4 userInterfaceIdiom] == 4) {
      uint64_t v7 = 0x404A000000000000;
    }
    else {
      [(PXFeatureSpec *)v4 contentGuideInsetsForScrollAxis:1];
    }
    *(void *)&v4->_horizontalMargin = v7;
    if ([v5 exaggerateContrast]) {
      [MEMORY[0x1E4FB1618] orangeColor];
    }
    else {
    v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    }
    id v9 = objc_alloc((Class)off_1E5DA6868);
    v10 = [v8 colorWithAlphaComponent:0.0];
    uint64_t v11 = [v9 initWithStartingColor:v10 endingColor:v8 direction:0];
    skimmingHintGradient = v4->_skimmingHintGradient;
    v4->_skimmingHintGradient = (PXGGradient *)v11;

    v4->_allowsVideoPlaybackAtAnySize = 0;
  }
  return v4;
}

- (void)setDistanceToNextLayout:(double)a3
{
  self->_distanceToNextLayout = a3;
}

- (void).cxx_destruct
{
}

- (double)horizontalMargin
{
  return self->_horizontalMargin;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)allowsVideoPlaybackAtAnySize
{
  return self->_allowsVideoPlaybackAtAnySize;
}

- (double)distanceToNextLayout
{
  return self->_distanceToNextLayout;
}

- (PXGGradient)skimmingHintGradient
{
  return self->_skimmingHintGradient;
}

- (void)setHorizontalMargin:(double)a3
{
  self->_horizontalMargin = a3;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

@end