@interface THImagerWPShapeLayout
- (CGRect)frameForCulling;
@end

@implementation THImagerWPShapeLayout

- (CGRect)frameForCulling
{
  v15.receiver = self;
  v15.super_class = (Class)THImagerWPShapeLayout;
  [(THImagerWPShapeLayout *)&v15 frameForCulling];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if ([(THImagerWPShapeLayout *)self containedLayout]
    && objc_msgSend(objc_msgSend(-[THImagerWPShapeLayout info](self, "info"), "containedStorage"), "length"))
  {
    [self containedLayout].frameForCulling;
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGRect v17 = CGRectUnion(v16, v19);
    CGFloat x = v17.origin.x;
    CGFloat y = v17.origin.y;
    CGFloat width = v17.size.width;
    CGFloat height = v17.size.height;
  }
  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

@end