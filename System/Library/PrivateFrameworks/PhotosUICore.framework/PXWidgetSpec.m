@interface PXWidgetSpec
- (CGSize)interWidgetSpacing;
- (PXWidgetSpec)init;
- (PXWidgetSpec)initWithExtendedTraitCollection:(id)a3 detailsOptions:(unint64_t)a4;
- (PXWidgetSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXWidgetSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5;
- (UIEdgeInsets)contentGuideInsets;
- (double)distanceBetweenFooterBaselineAndBottom;
- (double)distanceBetweenFooterBaselineAndFooterBottom;
- (double)distanceBetweenFooterTopAndFooterBaseline;
- (double)distanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline;
- (double)distanceBetweenFooteredWidgetContentBottomAndNextHeaderlessWidgetContentTop;
- (double)distanceBetweenFooterlessWidgetContentBottomAndBottom;
- (double)distanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline;
- (double)distanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop;
- (double)distanceBetweenHeaderBaselineAndHeaderBottom;
- (double)distanceBetweenHeaderBaselineAndWidgetContentTop;
- (double)distanceBetweenHeaderTopAndHeaderBaseline;
- (double)distanceBetweenMainContentBottomAndCaptionBaseline;
- (double)distanceBetweenMapViewAndAddressTop;
- (double)distanceBetweenTopAndFirstHeaderBaseline;
- (double)distanceBetweenTopAndHeaderlessWidgetContentTop;
- (double)distanceBetweenWidgetContentBottomAndFooterBaseline;
- (unint64_t)detailsOptions;
- (void)setContentGuideInsets:(UIEdgeInsets)a3;
- (void)setDistanceBetweenFooterBaselineAndBottom:(double)a3;
- (void)setDistanceBetweenFooterBaselineAndFooterBottom:(double)a3;
- (void)setDistanceBetweenFooterTopAndFooterBaseline:(double)a3;
- (void)setDistanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline:(double)a3;
- (void)setDistanceBetweenFooteredWidgetContentBottomAndNextHeaderlessWidgetContentTop:(double)a3;
- (void)setDistanceBetweenFooterlessWidgetContentBottomAndBottom:(double)a3;
- (void)setDistanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline:(double)a3;
- (void)setDistanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop:(double)a3;
- (void)setDistanceBetweenHeaderBaselineAndHeaderBottom:(double)a3;
- (void)setDistanceBetweenHeaderBaselineAndWidgetContentTop:(double)a3;
- (void)setDistanceBetweenHeaderTopAndHeaderBaseline:(double)a3;
- (void)setDistanceBetweenTopAndFirstHeaderBaseline:(double)a3;
- (void)setDistanceBetweenTopAndHeaderlessWidgetContentTop:(double)a3;
- (void)setDistanceBetweenWidgetContentBottomAndFooterBaseline:(double)a3;
@end

@implementation PXWidgetSpec

- (void)setDistanceBetweenFooterBaselineAndFooterBottom:(double)a3
{
  self->_distanceBetweenFooterBaselineAndFooterBottom = a3;
}

- (double)distanceBetweenFooterBaselineAndFooterBottom
{
  return self->_distanceBetweenFooterBaselineAndFooterBottom;
}

- (void)setDistanceBetweenFooterTopAndFooterBaseline:(double)a3
{
  self->_distanceBetweenFooterTopAndFooterBaseline = a3;
}

- (double)distanceBetweenFooterTopAndFooterBaseline
{
  return self->_distanceBetweenFooterTopAndFooterBaseline;
}

- (void)setDistanceBetweenHeaderBaselineAndHeaderBottom:(double)a3
{
  self->_distanceBetweenHeaderBaselineAndHeaderBottom = a3;
}

- (double)distanceBetweenHeaderBaselineAndHeaderBottom
{
  return self->_distanceBetweenHeaderBaselineAndHeaderBottom;
}

- (void)setDistanceBetweenHeaderTopAndHeaderBaseline:(double)a3
{
  self->_distanceBetweenHeaderTopAndHeaderBaseline = a3;
}

- (double)distanceBetweenHeaderTopAndHeaderBaseline
{
  return self->_distanceBetweenHeaderTopAndHeaderBaseline;
}

- (void)setDistanceBetweenFooterlessWidgetContentBottomAndBottom:(double)a3
{
  self->_distanceBetweenFooterlessWidgetContentBottomAndBottom = a3;
}

- (double)distanceBetweenFooterlessWidgetContentBottomAndBottom
{
  return self->_distanceBetweenFooterlessWidgetContentBottomAndBottom;
}

- (void)setDistanceBetweenFooterBaselineAndBottom:(double)a3
{
  self->_distanceBetweenFooterBaselineAndBottom = a3;
}

- (double)distanceBetweenFooterBaselineAndBottom
{
  return self->_distanceBetweenFooterBaselineAndBottom;
}

- (void)setDistanceBetweenWidgetContentBottomAndFooterBaseline:(double)a3
{
  self->_distanceBetweenWidgetContentBottomAndFooterBaseline = a3;
}

- (double)distanceBetweenWidgetContentBottomAndFooterBaseline
{
  return self->_distanceBetweenWidgetContentBottomAndFooterBaseline;
}

- (void)setDistanceBetweenFooteredWidgetContentBottomAndNextHeaderlessWidgetContentTop:(double)a3
{
  self->_distanceBetweenFooteredWidgetContentBottomAndNextHeaderlessWidgetContentTop = a3;
}

- (double)distanceBetweenFooteredWidgetContentBottomAndNextHeaderlessWidgetContentTop
{
  return self->_distanceBetweenFooteredWidgetContentBottomAndNextHeaderlessWidgetContentTop;
}

- (void)setDistanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline:(double)a3
{
  self->_distanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline = a3;
}

- (double)distanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline
{
  return self->_distanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline;
}

- (void)setDistanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop:(double)a3
{
  self->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop = a3;
}

- (double)distanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop
{
  return self->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop;
}

- (void)setDistanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline:(double)a3
{
  self->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline = a3;
}

- (double)distanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline
{
  return self->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline;
}

- (void)setDistanceBetweenHeaderBaselineAndWidgetContentTop:(double)a3
{
  self->_distanceBetweenHeaderBaselineAndWidgetContentTop = a3;
}

- (double)distanceBetweenHeaderBaselineAndWidgetContentTop
{
  return self->_distanceBetweenHeaderBaselineAndWidgetContentTop;
}

- (void)setDistanceBetweenTopAndHeaderlessWidgetContentTop:(double)a3
{
  self->_distanceBetweenTopAndHeaderlessWidgetContentTop = a3;
}

- (double)distanceBetweenTopAndHeaderlessWidgetContentTop
{
  return self->_distanceBetweenTopAndHeaderlessWidgetContentTop;
}

- (void)setDistanceBetweenTopAndFirstHeaderBaseline:(double)a3
{
  self->_distanceBetweenTopAndFirstHeaderBaseline = a3;
}

- (double)distanceBetweenTopAndFirstHeaderBaseline
{
  return self->_distanceBetweenTopAndFirstHeaderBaseline;
}

- (unint64_t)detailsOptions
{
  return self->_detailsOptions;
}

- (CGSize)interWidgetSpacing
{
  double width = self->_interWidgetSpacing.width;
  double height = self->_interWidgetSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)distanceBetweenMapViewAndAddressTop
{
  return self->_distanceBetweenMapViewAndAddressTop;
}

- (double)distanceBetweenMainContentBottomAndCaptionBaseline
{
  return self->_distanceBetweenMainContentBottomAndCaptionBaseline;
}

- (void)setContentGuideInsets:(UIEdgeInsets)a3
{
  self->_contentGuideInsets = a3;
}

- (UIEdgeInsets)contentGuideInsets
{
  double top = self->_contentGuideInsets.top;
  double left = self->_contentGuideInsets.left;
  double bottom = self->_contentGuideInsets.bottom;
  double right = self->_contentGuideInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PXWidgetSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PXWidgetSpec;
  v6 = [(PXFeatureSpec *)&v8 initWithExtendedTraitCollection:a3 options:a4];
  if (v6)
  {
    v6->_detailsOptions = a5;
    PXFontScaleForTextStyle();
  }
  return 0;
}

- (PXWidgetSpec)initWithExtendedTraitCollection:(id)a3 detailsOptions:(unint64_t)a4
{
  return [(PXWidgetSpec *)self initWithExtendedTraitCollection:a3 options:0 detailsOptions:a4];
}

- (PXWidgetSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXWidgetSpec *)self initWithExtendedTraitCollection:a3 options:a4 detailsOptions:0];
}

- (PXWidgetSpec)init
{
  return [(PXFeatureSpec *)self initWithExtendedTraitCollection:0];
}

@end