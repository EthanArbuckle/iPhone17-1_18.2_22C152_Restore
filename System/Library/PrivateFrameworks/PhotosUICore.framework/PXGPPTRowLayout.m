@interface PXGPPTRowLayout
- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result;
- (PXGPPTRowLayout)init;
- (PXGPPTRowLayout)initWithNumberOfItems:(int64_t)a3 hue:(double)a4;
- (double)hue;
- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4;
- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4;
- (int64_t)numberOfItems;
@end

@implementation PXGPPTRowLayout

- (double)hue
{
  return self->_hue;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  cos((double)a4 * 0.5);
  v5 = [PXGPPTRowItemLayout alloc];
  v6 = (void *)MEMORY[0x1E4FB1618];
  [(PXGPPTRowLayout *)self hue];
  v7 = objc_msgSend(v6, "colorWithHue:saturation:brightness:alpha:");
  v8 = [(PXGPPTRowItemLayout *)v5 initWithColor:v7];

  return v8;
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result
{
  double height = result.height;
  result.width = height;
  return result;
}

- (PXGPPTRowLayout)initWithNumberOfItems:(int64_t)a3 hue:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PXGPPTRowLayout;
  v6 = [(PXGStackLayout *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_numberOfItems = a3;
    v6->_hue = a4;
    [(PXGStackLayout *)v6 setAxis:2];
    [(PXGStackLayout *)v7 setInterlayoutSpacing:1.0];
    -[PXGStackLayout insertSublayoutProvider:inRange:](v7, "insertSublayoutProvider:inRange:", v7, 0, v7->_numberOfItems);
  }
  return v7;
}

- (PXGPPTRowLayout)init
{
  return [(PXGPPTRowLayout *)self initWithNumberOfItems:0 hue:0.0];
}

@end