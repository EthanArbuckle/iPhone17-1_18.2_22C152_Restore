@interface _MFTiltedTabItemView
+ (id)_newContentShadowView;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)autoresizesContentView;
- (BOOL)contentViewNeedsRemoval;
- (BOOL)isClosing;
- (BOOL)isEditing;
- (BOOL)isFinishedClosing;
- (BOOL)isReordering;
- (BOOL)topBackdropScaled;
- (CATransform3D)contentTransform;
- (CGRect)closeButtonHitRect;
- (ComposePlaceholderView)composePlaceholderView;
- (UIButton)closeButton;
- (UIEdgeInsets)contentClippingInsets;
- (UIView)borrowedContentView;
- (UIView)closeButtonWrapperView;
- (UIView)contentClipperView;
- (UIView)maskCutoutView;
- (_MFTiltedTabItemView)init;
- (_TabGradientView)contentShadowView;
- (double)borrowedContentScale;
- (double)topBackdropHeight;
- (double)verticalScrollAdjustment;
- (int64_t)capturedInterfaceOrientation;
- (unint64_t)contentViewType;
- (unint64_t)countForLayout;
- (unint64_t)indexForLayout;
- (void)installMaskCutoutView:(id)a3;
- (void)layoutHeaderViewAnimated:(BOOL)a3 closeButton:(BOOL)a4;
- (void)layoutSubviews;
- (void)setAutoresizesContentView:(BOOL)a3;
- (void)setBorrowedContentScale:(double)a3;
- (void)setBorrowedContentView:(id)a3;
- (void)setCapturedInterfaceOrientation:(int64_t)a3;
- (void)setCloseButtonHitRect:(CGRect)a3;
- (void)setClosing:(BOOL)a3;
- (void)setContentClippingInsets:(UIEdgeInsets)a3;
- (void)setContentTransform:(CATransform3D *)a3;
- (void)setContentViewNeedsRemoval:(BOOL)a3;
- (void)setContentViewType:(unint64_t)a3;
- (void)setCountForLayout:(unint64_t)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFinishedClosing:(BOOL)a3;
- (void)setIndexForLayout:(unint64_t)a3;
- (void)setMaskCutoutView:(id)a3;
- (void)setReordering:(BOOL)a3;
- (void)setTopBackdropHeight:(double)a3;
- (void)setTopBackdropScaled:(BOOL)a3;
- (void)setVerticalScrollAdjustment:(double)a3;
- (void)uninstallMaskCutoutView;
@end

@implementation _MFTiltedTabItemView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"zPosition"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_MFTiltedTabItemView;
    BOOL v5 = [(_MFTiltedTabItemView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (_MFTiltedTabItemView)init
{
  v20.receiver = self;
  v20.super_class = (Class)_MFTiltedTabItemView;
  v2 = [(_MFTiltedTabItemView *)&v20 init];
  v3 = v2;
  if (v2)
  {
    [(_MFTiltedTabItemView *)v2 setPreservesSuperviewLayoutMargins:1];
    v3->_borrowedContentScale = 1.0;
    v3->_indexForLayout = 0x7FFFFFFFFFFFFFFFLL;
    v3->_countForLayout = 0x7FFFFFFFFFFFFFFFLL;
    id v4 = (UIView *)objc_alloc_init((Class)UIView);
    closeButtonWrapperView = v3->_closeButtonWrapperView;
    v3->_closeButtonWrapperView = v4;

    v6 = [(UIView *)v3->_closeButtonWrapperView layer];
    [v6 setAnchorPoint:0.5, 0.0];

    objc_super v7 = [(_MFTiltedTabItemView *)v3 layer];
    [v7 setAnchorPoint:0.5, 0.0];

    v8 = [(_MFTiltedTabItemView *)v3 layer];
    [v8 setAllowsGroupOpacity:0];

    id v9 = objc_alloc((Class)UIView);
    [(_MFTiltedTabItemView *)v3 bounds];
    v10 = [v9 initWithFrame:];
    contentClipperView = v3->_contentClipperView;
    v3->_contentClipperView = v10;

    v12 = [(UIView *)v3->_contentClipperView layer];
    [v12 setAnchorPoint:CGPointZero.x, CGPointZero.y];

    [(UIView *)v3->_contentClipperView _setContinuousCornerRadius:10.0];
    [(UIView *)v3->_contentClipperView setPreservesSuperviewLayoutMargins:1];
    [(UIView *)v3->_contentClipperView setClipsToBounds:1];
    [(_MFTiltedTabItemView *)v3 addSubview:v3->_contentClipperView];
    v13 = (_TabGradientView *)[(id)objc_opt_class() _newContentShadowView];
    contentShadowView = v3->_contentShadowView;
    v3->_contentShadowView = v13;

    [(_MFTiltedTabItemView *)v3 addSubview:v3->_contentShadowView];
    if ((sub_1001DB2F8() & 1) == 0) {
      [(_TabGradientView *)v3->_contentShadowView setHidden:1];
    }
    v15 = +[UIImage systemImageNamed:MFImageGlyphXMark];
    uint64_t v16 = +[UIButton systemButtonWithImage:v15 target:0 action:0];
    closeButton = v3->_closeButton;
    v3->_closeButton = (UIButton *)v16;

    [(UIView *)v3->_closeButtonWrapperView addSubview:v3->_closeButton];
    CGSize size = CGRectNull.size;
    v3->_closeButtonHitRect.origin = CGRectNull.origin;
    v3->_closeButtonHitRect.CGSize size = size;
    [(_MFTiltedTabItemView *)v3 addSubview:v3->_closeButtonWrapperView];
  }
  return v3;
}

+ (id)_newContentShadowView
{
  v2 = objc_alloc_init(_TabGradientView);
  v3 = [(_TabGradientView *)v2 gradientLayer];
  +[MFSafariTabsClassConstants configureTabContentGradientLayer:v3];

  return v2;
}

- (void)layoutHeaderViewAnimated:(BOOL)a3 closeButton:(BOOL)a4
{
  BOOL v5 = a3;
  double v7 = (double)a4;
  [(UIButton *)self->_closeButton alpha];
  if (v8 != v7)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001EBA30;
    v20[3] = &unk_1006058A8;
    v20[4] = self;
    BOOL v21 = a4;
    id v9 = objc_retainBlock(v20);
    v10 = v9;
    if (v5) {
      +[UIView animateWithDuration:327680 delay:v9 options:0 animations:0.22 completion:0.0];
    }
    else {
      ((void (*)(void *))v9[2])(v9);
    }
  }
  v11 = [(_MFTiltedTabItemView *)self composePlaceholderView];
  v12 = v11;
  if (v11)
  {
    [v11 layoutIfNeeded];
    [(UIView *)self->_closeButtonWrapperView frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = [v12 navigationBar];
    [v19 bounds];
    [v19 convertRect:self->_closeButtonWrapperView toView:];
    -[UIView setFrame:](self->_closeButtonWrapperView, "setFrame:", v14, v16, v18);
  }
}

- (CATransform3D)contentTransform
{
  id v4 = [(UIView *)self->_contentClipperView layer];
  id v6 = v4;
  if (v4)
  {
    [v4 transform];
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

- (void)setContentTransform:(CATransform3D *)a3
{
  v3 = [(UIView *)self->_contentClipperView layer];
  [v3 setTransform:&v4];
}

- (void)setBorrowedContentScale:(double)a3
{
  if (self->_borrowedContentScale != a3)
  {
    self->_borrowedContentScale = a3;
    borrowedContentView = self->_borrowedContentView;
    CGAffineTransformMakeScale(&v4, a3, a3);
    [(UIView *)borrowedContentView setTransform:&v4];
  }
}

- (void)setBorrowedContentView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  borrowedContentView = self->_borrowedContentView;
  double v14 = v5;
  if (borrowedContentView != v5)
  {
    double v7 = [(UIView *)borrowedContentView superview];
    contentClipperView = self->_contentClipperView;

    if (v7 == contentClipperView) {
      [(UIView *)self->_borrowedContentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_borrowedContentView, a3);
    if (v14)
    {
      [(UIView *)self->_contentClipperView insertSubview:v14 belowSubview:self->_contentShadowView];
      [(UIView *)v14 bounds];
      double MidX = CGRectGetMidX(v16);
      [(UIView *)v14 bounds];
      double MidY = CGRectGetMidY(v17);
      [(_MFTiltedTabItemView *)self contentClippingInsets];
      double v12 = v11;
      [(_MFTiltedTabItemView *)self contentClippingInsets];
      -[UIView setCenter:](v14, "setCenter:", MidX - v12, MidY - v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[UIView configureLeadingPlaceholderWithSize:](v14, "configureLeadingPlaceholderWithSize:", 13.0, 13.0);
      }
    }
  }
}

- (void)layoutSubviews
{
  [(UIView *)self->_contentClipperView frame];
  if (self->_autoresizesContentView)
  {
    [(_MFTiltedTabItemView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    [(_MFTiltedTabItemView *)self contentClippingInsets];
    double v10 = v9;
    double v3 = v6 - (v11 + v12);
    double v4 = v8 - (v13 + v10);
  }
  -[UIView setFrame:](self->_contentClipperView, "setFrame:", CGPointZero.x, CGPointZero.y, v3, v4);
  if ((sub_1001DB2F8() & 1) == 0)
  {
    contentShadowView = self->_contentShadowView;
    BOOL v15 = self->_borrowedContentView == 0;
    [(_TabGradientView *)contentShadowView setHidden:v15];
  }
}

- (void)installMaskCutoutView:(id)a3
{
  id v4 = a3;
  [(_MFTiltedTabItemView *)self setMaskCutoutView:"setMaskCutoutView:"];
  [(UIView *)self->_contentClipperView frame];
  [v4 setFrame:];
  [(_MFTiltedTabItemView *)self addSubview:v4];
}

- (void)uninstallMaskCutoutView
{
  [(_MFTiltedTabItemView *)self setMaskCutoutView:0];
  id v3 = [(_MFTiltedTabItemView *)self maskCutoutView];
  [v3 removeFromSuperview];
}

- (ComposePlaceholderView)composePlaceholderView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = self->_borrowedContentView;
  }
  else {
    id v3 = 0;
  }

  return (ComposePlaceholderView *)v3;
}

- (UIView)closeButtonWrapperView
{
  return self->_closeButtonWrapperView;
}

- (UIView)contentClipperView
{
  return self->_contentClipperView;
}

- (UIView)maskCutoutView
{
  return self->_maskCutoutView;
}

- (void)setMaskCutoutView:(id)a3
{
}

- (UIView)borrowedContentView
{
  return self->_borrowedContentView;
}

- (_TabGradientView)contentShadowView
{
  return self->_contentShadowView;
}

- (BOOL)topBackdropScaled
{
  return self->_topBackdropScaled;
}

- (void)setTopBackdropScaled:(BOOL)a3
{
  self->_topBackdropScaled = a3;
}

- (double)topBackdropHeight
{
  return self->_topBackdropHeight;
}

- (void)setTopBackdropHeight:(double)a3
{
  self->_topBackdropHeight = a3;
}

- (CGRect)closeButtonHitRect
{
  double x = self->_closeButtonHitRect.origin.x;
  double y = self->_closeButtonHitRect.origin.y;
  double width = self->_closeButtonHitRect.size.width;
  double height = self->_closeButtonHitRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCloseButtonHitRect:(CGRect)a3
{
  self->_closeButtonHitRect = a3;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (double)borrowedContentScale
{
  return self->_borrowedContentScale;
}

- (unint64_t)contentViewType
{
  return self->_contentViewType;
}

- (void)setContentViewType:(unint64_t)a3
{
  self->_contentViewType = a3;
}

- (int64_t)capturedInterfaceOrientation
{
  return self->_capturedInterfaceOrientation;
}

- (void)setCapturedInterfaceOrientation:(int64_t)a3
{
  self->_capturedInterfaceOrientation = a3;
}

- (UIEdgeInsets)contentClippingInsets
{
  double top = self->_contentClippingInsets.top;
  double left = self->_contentClippingInsets.left;
  double bottom = self->_contentClippingInsets.bottom;
  double right = self->_contentClippingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentClippingInsets:(UIEdgeInsets)a3
{
  self->_contentClippingInsets = a3;
}

- (BOOL)contentViewNeedsRemoval
{
  return self->_contentViewNeedsRemoval;
}

- (void)setContentViewNeedsRemoval:(BOOL)a3
{
  self->_contentViewNeedsRemoval = a3;
}

- (BOOL)autoresizesContentView
{
  return self->_autoresizesContentView;
}

- (void)setAutoresizesContentView:(BOOL)a3
{
  self->_autoresizesContentView = a3;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (BOOL)isReordering
{
  return self->_reordering;
}

- (void)setReordering:(BOOL)a3
{
  self->_reordering = a3;
}

- (BOOL)isClosing
{
  return self->_closing;
}

- (void)setClosing:(BOOL)a3
{
  self->_closing = a3;
}

- (BOOL)isFinishedClosing
{
  return self->_finishedClosing;
}

- (void)setFinishedClosing:(BOOL)a3
{
  self->_finishedClosing = a3;
}

- (unint64_t)indexForLayout
{
  return self->_indexForLayout;
}

- (void)setIndexForLayout:(unint64_t)a3
{
  self->_indexForLayout = a3;
}

- (unint64_t)countForLayout
{
  return self->_countForLayout;
}

- (void)setCountForLayout:(unint64_t)a3
{
  self->_countForLayout = a3;
}

- (double)verticalScrollAdjustment
{
  return self->_verticalScrollAdjustment;
}

- (void)setVerticalScrollAdjustment:(double)a3
{
  self->_verticalScrollAdjustment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_contentShadowView, 0);
  objc_storeStrong((id *)&self->_borrowedContentView, 0);
  objc_storeStrong((id *)&self->_maskCutoutView, 0);
  objc_storeStrong((id *)&self->_contentClipperView, 0);

  objc_storeStrong((id *)&self->_closeButtonWrapperView, 0);
}

@end