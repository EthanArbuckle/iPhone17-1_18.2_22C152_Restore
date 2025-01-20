@interface SCMLDetectionBox
- (CGRect)rect;
- (NSString)label;
- (SCMLDetectionBox)initWithScore:(float)a3 label:(id)a4 rect:(CGRect)a5;
- (float)score;
@end

@implementation SCMLDetectionBox

- (SCMLDetectionBox)initWithScore:(float)a3 label:(id)a4 rect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SCMLDetectionBox;
  v13 = [(SCMLDetectionBox *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_score = a3;
    objc_storeStrong((id *)&v13->_label, a4);
    v14->_rect.origin.CGFloat x = x;
    v14->_rect.origin.CGFloat y = y;
    v14->_rect.size.CGFloat width = width;
    v14->_rect.size.CGFloat height = height;
  }

  return v14;
}

- (float)score
{
  return self->_score;
}

- (NSString)label
{
  return self->_label;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end