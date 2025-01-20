@interface SPUIResilientView
- (void)setFrame:(CGRect)a3;
@end

@implementation SPUIResilientView

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  memset(&v12, 0, sizeof(v12));
  [(SPUIResilientView *)self transform];
  CGAffineTransform v11 = v12;
  if (CGAffineTransformIsIdentity(&v11))
  {
    v10.receiver = self;
    v10.super_class = (Class)SPUIResilientView;
    -[SPUIResilientView setFrame:](&v10, sel_setFrame_, x, y, width, height, v8.receiver, v8.super_class);
  }
  else
  {
    memset(&v11, 0, sizeof(v11));
    CGAffineTransform v9 = v12;
    CGAffineTransformInvert(&v11, &v9);
    [(SPUIResilientView *)self frame];
    CGAffineTransform v9 = v11;
    CGRect v15 = CGRectApplyAffineTransform(v13, &v9);
    v14.origin.double x = x;
    v14.origin.double y = y;
    v14.size.double width = width;
    v14.size.double height = height;
    if (!CGRectEqualToRect(v14, v15)) {
      -[SPUIResilientView setFrame:](&v8, sel_setFrame_, x, y, width, height, self, SPUIResilientView);
    }
  }
}

@end