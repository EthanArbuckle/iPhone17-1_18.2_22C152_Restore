@interface SBAppClipOverlayView
- (SBAppClipOverlayView)initWithCoder:(id)a3;
- (SBAppClipOverlayView)initWithFrame:(CGRect)a3;
- (SBAppClipOverlayView)initWithFrame:(CGRect)a3 delegate:(id)a4;
- (SBAppClipOverlayViewDelegate)delegate;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation SBAppClipOverlayView

- (SBAppClipOverlayView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBAppClipOverlayView;
  v10 = -[SBAppClipOverlayView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10) {
    objc_storeWeak((id *)&v10->_delegate, v9);
  }

  return v11;
}

- (SBAppClipOverlayView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2 object:self file:@"SBAppClipOverlayViewController.m" lineNumber:186 description:@"Use -initWithFrame:delegate:"];

  return -[SBAppClipOverlayView initWithFrame:delegate:](self, "initWithFrame:delegate:", 0, x, y, width, height);
}

- (SBAppClipOverlayView)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBAppClipOverlayViewController.m" lineNumber:191 description:@"Use -initWithFrame:delegate:"];

  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  return -[SBAppClipOverlayView initWithFrame:delegate:](self, "initWithFrame:delegate:", 0, v6, v7, v8, v9);
}

- (void)invalidate
{
  id v3 = [(SBAppClipOverlayView *)self delegate];
  [v3 appClipPlaceholderViewDidInvalidate:self];
}

- (SBAppClipOverlayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAppClipOverlayViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end