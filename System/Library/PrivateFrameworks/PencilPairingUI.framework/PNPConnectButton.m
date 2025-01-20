@interface PNPConnectButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PNPConnectButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v7 = [(PNPConnectButton *)self superview];
  v8 = [(PNPConnectButton *)self superview];
  [v8 bounds];
  objc_msgSend(v7, "convertRect:toView:", self);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  uint64_t v17 = v10;
  uint64_t v18 = v12;
  uint64_t v19 = v14;
  uint64_t v20 = v16;
  CGFloat v21 = x;
  CGFloat v22 = y;
  return CGRectContainsPoint(*(CGRect *)&v17, *(CGPoint *)&v21);
}

@end