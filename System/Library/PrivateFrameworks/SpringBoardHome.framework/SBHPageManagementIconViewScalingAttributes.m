@interface SBHPageManagementIconViewScalingAttributes
- (BOOL)allowsEdgeAntialiasing;
- (BOOL)shouldRasterize;
- (NSString)minificationFilter;
- (SBHPageManagementIconViewScalingAttributes)initWithMinificationFilter:(id)a3 shouldRasterize:(BOOL)a4 rasterizationScale:(double)a5 allowsEdgeAntialiasing:(BOOL)a6;
- (double)rasterizationScale;
@end

@implementation SBHPageManagementIconViewScalingAttributes

- (SBHPageManagementIconViewScalingAttributes)initWithMinificationFilter:(id)a3 shouldRasterize:(BOOL)a4 rasterizationScale:(double)a5 allowsEdgeAntialiasing:(BOOL)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBHPageManagementIconViewScalingAttributes;
  v11 = [(SBHPageManagementIconViewScalingAttributes *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    minificationFilter = v11->_minificationFilter;
    v11->_minificationFilter = (NSString *)v12;

    v11->_shouldRasterize = a4;
    v11->_rasterizationScale = a5;
    v11->_allowsEdgeAntialiasing = a6;
  }

  return v11;
}

- (NSString)minificationFilter
{
  return self->_minificationFilter;
}

- (BOOL)shouldRasterize
{
  return self->_shouldRasterize;
}

- (double)rasterizationScale
{
  return self->_rasterizationScale;
}

- (BOOL)allowsEdgeAntialiasing
{
  return self->_allowsEdgeAntialiasing;
}

- (void).cxx_destruct
{
}

@end