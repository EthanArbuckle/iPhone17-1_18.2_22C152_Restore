@interface PXStoryMemoryFeedItemExtendedTraitCollection
- (BOOL)isFullscreen;
- (PXStoryMemoryFeedItemExtendedTraitCollection)initWithSpecManager:(id)a3 initialReferenceSize:(CGSize)a4 isFullscreen:(BOOL)a5;
- (double)bottomTitleContentOffset;
- (double)viewportCornerRadius;
- (id)viewportShadow;
- (int64_t)userInterfaceFeature;
@end

@implementation PXStoryMemoryFeedItemExtendedTraitCollection

- (void).cxx_destruct
{
}

- (BOOL)isFullscreen
{
  return self->_isFullscreen;
}

- (double)bottomTitleContentOffset
{
  return self->_bottomTitleContentOffset;
}

- (int64_t)userInterfaceFeature
{
  return self->_userInterfaceFeature;
}

- (id)viewportShadow
{
  return self->_viewportShadow;
}

- (double)viewportCornerRadius
{
  return self->_viewportCornerRadius;
}

- (PXStoryMemoryFeedItemExtendedTraitCollection)initWithSpecManager:(id)a3 initialReferenceSize:(CGSize)a4 isFullscreen:(BOOL)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryMemoryFeedItemExtendedTraitCollection;
  v10 = -[PXStoryExtendedTraitCollection initWithLayoutReferenceSize:](&v18, sel_initWithLayoutReferenceSize_, width, height);
  if (v10)
  {
    v11 = [v9 spec];
    v12 = v11;
    if (a5)
    {
      [v11 overlayFeedPeekDistance];
      v10->_bottomTitleContentOffset = v13;
    }
    else
    {
      [v11 itemCornerRadius];
      v10->_viewportCornerRadius = v14;
      uint64_t v15 = [v12 itemShadow];
      viewportShadow = v10->_viewportShadow;
      v10->_viewportShadow = (NSShadow *)v15;
    }
    v10->_isFullscreen = a5;
    v10->_userInterfaceFeature = 1;
  }
  return v10;
}

@end