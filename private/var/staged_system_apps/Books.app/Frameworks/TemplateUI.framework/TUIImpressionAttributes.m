@interface TUIImpressionAttributes
- (TUIImpressionAttributes)initWithData:(id)a3 size:(CGSize)a4 center:(CGPoint)a5 transform:(CGAffineTransform *)a6;
- (TUIImpressionData)data;
@end

@implementation TUIImpressionAttributes

- (TUIImpressionAttributes)initWithData:(id)a3 size:(CGSize)a4 center:(CGPoint)a5 transform:(CGAffineTransform *)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUIImpressionAttributes;
  long long v14 = *(_OWORD *)&a6->c;
  v18[0] = *(_OWORD *)&a6->a;
  v18[1] = v14;
  v18[2] = *(_OWORD *)&a6->tx;
  v15 = -[TUIGeometryAttributes initWithSize:center:transform:](&v19, "initWithSize:center:transform:", v18, width, height, x, y);
  v16 = v15;
  if (v15) {
    objc_storeStrong((id *)&v15->_data, a3);
  }

  return v16;
}

- (TUIImpressionData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end