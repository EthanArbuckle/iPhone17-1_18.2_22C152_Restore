@interface PUCleanupOverlayView
- (NUMediaView)mediaView;
- (PUCleanupOverlayView)initWithMediaView:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setMediaView:(id)a3;
@end

@implementation PUCleanupOverlayView

- (void).cxx_destruct
{
}

- (void)setMediaView:(id)a3
{
}

- (NUMediaView)mediaView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  return (NUMediaView *)WeakRetained;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(PUCleanupOverlayView *)self mediaView];
  v9 = objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);

  return v9;
}

- (PUCleanupOverlayView)initWithMediaView:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUCleanupOverlayView.m", 26, @"Invalid parameter not satisfying: %@", @"mediaView != nil" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)PUCleanupOverlayView;
  v6 = -[PUCleanupOverlayView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_mediaView, v5);
    [(PUCleanupOverlayView *)v7 setBackgroundColor:0];
  }

  return v7;
}

@end