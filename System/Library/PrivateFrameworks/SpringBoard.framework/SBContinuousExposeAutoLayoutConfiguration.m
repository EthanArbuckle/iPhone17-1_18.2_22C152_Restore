@interface SBContinuousExposeAutoLayoutConfiguration
- (CGRect)containerBounds;
- (SBContinuousExposeAutoLayoutConfiguration)initWithContainerBounds:(CGRect)a3 screenScale:(double)a4 dockHeightWithBottomEdgePadding:(double)a5 chamoisLayoutAttributes:(id)a6;
- (SBSwitcherChamoisLayoutAttributes)chamoisLayoutAttributes;
- (double)dockHeightWithBottomEdgePadding;
- (double)screenScale;
@end

@implementation SBContinuousExposeAutoLayoutConfiguration

- (SBContinuousExposeAutoLayoutConfiguration)initWithContainerBounds:(CGRect)a3 screenScale:(double)a4 dockHeightWithBottomEdgePadding:(double)a5 chamoisLayoutAttributes:(id)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SBContinuousExposeAutoLayoutConfiguration;
  v16 = [(SBContinuousExposeAutoLayoutConfiguration *)&v19 init];
  if (v16)
  {
    if (!v15)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v16, @"SBContinuousExposeAutoLayoutConfiguration.m", 16, @"Invalid parameter not satisfying: %@", @"chamoisLayoutAttributes" object file lineNumber description];
    }
    v16->_containerBounds.origin.CGFloat x = x;
    v16->_containerBounds.origin.CGFloat y = y;
    v16->_containerBounds.size.CGFloat width = width;
    v16->_containerBounds.size.CGFloat height = height;
    v16->_screenScale = a4;
    v16->_dockHeightWithBottomEdgePadding = a5;
    objc_storeStrong((id *)&v16->_chamoisLayoutAttributes, a6);
  }

  return v16;
}

- (CGRect)containerBounds
{
  double x = self->_containerBounds.origin.x;
  double y = self->_containerBounds.origin.y;
  double width = self->_containerBounds.size.width;
  double height = self->_containerBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (double)dockHeightWithBottomEdgePadding
{
  return self->_dockHeightWithBottomEdgePadding;
}

- (SBSwitcherChamoisLayoutAttributes)chamoisLayoutAttributes
{
  return self->_chamoisLayoutAttributes;
}

- (void).cxx_destruct
{
}

@end