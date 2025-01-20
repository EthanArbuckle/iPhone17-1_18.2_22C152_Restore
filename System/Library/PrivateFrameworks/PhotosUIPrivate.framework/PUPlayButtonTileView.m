@interface PUPlayButtonTileView
- (BOOL)showAsPause;
- (PUPlayButtonTileView)init;
- (PUPlayButtonTileView)initWithCoder:(id)a3;
- (PUPlayButtonTileView)initWithFrame:(CGRect)a3;
- (PUPlayButtonTileView)initWithStyle:(int64_t)a3;
- (PXVideoOverlayButton)button;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setShowAsPause:(BOOL)a3;
- (void)setTarget:(id)a3 selector:(SEL)a4;
@end

@implementation PUPlayButtonTileView

- (void).cxx_destruct
{
}

- (PXVideoOverlayButton)button
{
  return self->_button;
}

- (PUPlayButtonTileView)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPlayButtonTileView.m", 73, @"%s is not available as initializer", "-[PUPlayButtonTileView initWithCoder:]");

  abort();
}

- (PUPlayButtonTileView)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPlayButtonTileView.m", 69, @"%s is not available as initializer", "-[PUPlayButtonTileView init]");

  abort();
}

- (PUPlayButtonTileView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPlayButtonTileView.m", 65, @"%s is not available as initializer", "-[PUPlayButtonTileView initWithFrame:]");

  abort();
}

- (void)setTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  id v7 = [(PUPlayButtonTileView *)self button];
  [v7 setTarget:v6 action:a4];
}

- (BOOL)showAsPause
{
  v2 = [(PUPlayButtonTileView *)self button];
  char v3 = [v2 showAsPause];

  return v3;
}

- (void)setShowAsPause:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUPlayButtonTileView *)self button];
  [v4 setShowAsPause:v3];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUPlayButtonTileView;
  -[PUPlayButtonTileView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (PUPlayButtonTileView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    id v5 = 0;
  }
  return v5;
}

- (PUPlayButtonTileView)initWithStyle:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PUPlayButtonTileView;
  id v4 = -[PUPlayButtonTileView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v4)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1EB0], "px_videoOverlayButtonWithStyle:", 3);
        button = v4->_button;
        v4->_button = (PXVideoOverlayButton *)v5;

        objc_super v7 = [MEMORY[0x1E4FB1618] whiteColor];
        [(PXVideoOverlayButton *)v4->_button setTintColor:v7];
      }
    }
    else
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1EB0], "px_videoOverlayButtonWithStyle:", 0);
      v9 = v4->_button;
      v4->_button = (PXVideoOverlayButton *)v8;
    }
    [(PXVideoOverlayButton *)v4->_button setAutoresizingMask:45];
    [(PUPlayButtonTileView *)v4 bounds];
    PXRectGetCenter();
    -[PXVideoOverlayButton setCenter:](v4->_button, "setCenter:");
    [(PUPlayButtonTileView *)v4 addSubview:v4->_button];
  }
  return v4;
}

@end