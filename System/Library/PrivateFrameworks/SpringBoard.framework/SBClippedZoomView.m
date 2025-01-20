@interface SBClippedZoomView
- (SBClippedZoomView)initWithClippingFrame:(CGRect)a3 fullscreenZoomView:(id)a4;
@end

@implementation SBClippedZoomView

- (SBClippedZoomView)initWithClippingFrame:(CGRect)a3 fullscreenZoomView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  if (!v11)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBZoomView.m", 216, @"%s requires a fullscreenZoomViewToClip", "-[SBClippedZoomView initWithClippingFrame:fullscreenZoomView:]");
  }
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  v21.receiver = self;
  v21.super_class = (Class)SBClippedZoomView;
  v16 = -[SBZoomView _initWithFrame:](&v21, sel__initWithFrame_);
  if (v16)
  {
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", x, y, width, height);
    clippingView = v16->_clippingView;
    v16->_clippingView = (UIView *)v17;

    [(UIView *)v16->_clippingView setClipsToBounds:1];
    [(SBClippedZoomView *)v16 addSubview:v16->_clippingView];
    objc_storeStrong((id *)&v16->_fullscreenZoomViewToClip, a4);
    -[SBFullscreenZoomView setFrame:](v16->_fullscreenZoomViewToClip, "setFrame:", -x, -y, v13, v15);
    [(UIView *)v16->_clippingView addSubview:v16->_fullscreenZoomViewToClip];
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_fullscreenZoomViewToClip, 0);
}

@end