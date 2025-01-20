@interface PXLabelAnimationContext
- (CGRect)destinationRect;
- (PXLabelAnimationContext)initWithLabel:(id)a3 andDestinationRect:(CGRect)a4;
- (UILabel)label;
- (void)setDestinationRect:(CGRect)a3;
- (void)setLabel:(id)a3;
@end

@implementation PXLabelAnimationContext

- (void).cxx_destruct
{
}

- (void)setDestinationRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_destinationRect, &v3, 32, 1, 0);
}

- (CGRect)destinationRect
{
  objc_copyStruct(v6, &self->_destinationRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 8, 1);
}

- (PXLabelAnimationContext)initWithLabel:(id)a3 andDestinationRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXLabelAnimationContext;
  v11 = [(PXLabelAnimationContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_label, a3);
    v12->_destinationRect.origin.CGFloat x = x;
    v12->_destinationRect.origin.CGFloat y = y;
    v12->_destinationRect.size.CGFloat width = width;
    v12->_destinationRect.size.CGFloat height = height;
  }

  return v12;
}

@end