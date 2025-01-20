@interface BCCardStackTransitioningPlaceholderCoverSource
- (BCCardStackTransitioningPlaceholderCoverSource)initWithCoverFrame:(CGRect)a3 referenceView:(id)a4;
- (BOOL)isInNonHorizontalLayout;
- (CGRect)frame;
- (UIImage)cardStackTransitioningCoverSourceImage;
- (UIView)referenceView;
- (double)cardStackTransitioningCoverSourceExtraXOffset;
- (id)cardStackTransitioningCoverSourceHide;
- (void)cardStackTransitioningCoverSourceReplaceReferenceView:(id)a3;
- (void)setCardStackTransitioningCoverSourceExtraXOffset:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setReferenceView:(id)a3;
@end

@implementation BCCardStackTransitioningPlaceholderCoverSource

- (BCCardStackTransitioningPlaceholderCoverSource)initWithCoverFrame:(CGRect)a3 referenceView:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BCCardStackTransitioningPlaceholderCoverSource;
  v11 = [(BCCardStackTransitioningPlaceholderCoverSource *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_frame.origin.CGFloat x = x;
    v11->_frame.origin.CGFloat y = y;
    v11->_frame.size.CGFloat width = width;
    v11->_frame.size.CGFloat height = height;
    objc_storeStrong((id *)&v11->_referenceView, a4);
  }

  return v12;
}

- (UIImage)cardStackTransitioningCoverSourceImage
{
  return 0;
}

- (id)cardStackTransitioningCoverSourceHide
{
  return &stru_2C3D88;
}

- (BOOL)isInNonHorizontalLayout
{
  return 0;
}

- (void)cardStackTransitioningCoverSourceReplaceReferenceView:(id)a3
{
  id v13 = a3;
  [(BCCardStackTransitioningPlaceholderCoverSource *)self frame];
  if (!CGRectIsEmpty(v15))
  {
    [(BCCardStackTransitioningPlaceholderCoverSource *)self frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(BCCardStackTransitioningPlaceholderCoverSource *)self referenceView];
    [v13 convertRect:v12 fromView:v5];
    -[BCCardStackTransitioningPlaceholderCoverSource setFrame:](self, "setFrame:");

    [(BCCardStackTransitioningPlaceholderCoverSource *)self setReferenceView:v13];
  }
}

- (double)cardStackTransitioningCoverSourceExtraXOffset
{
  return self->cardStackTransitioningCoverSourceExtraXOffset;
}

- (void)setCardStackTransitioningCoverSourceExtraXOffset:(double)a3
{
  self->cardStackTransitioningCoverSourceExtraXOffset = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end