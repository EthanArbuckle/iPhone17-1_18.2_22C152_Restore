@interface PXPortraitFocusView
- (NUMediaView)mediaView;
- (PXPortraitFocusView)initWithMediaView:(id)a3 isHDR:(BOOL)a4;
- (PXPortraitFocusViewDelegate)focusViewDelegate;
- (void)focusPointChanged:(CGPoint)a3;
- (void)setFocusViewDelegate:(id)a3;
@end

@implementation PXPortraitFocusView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_destroyWeak((id *)&self->_focusViewDelegate);
}

- (NUMediaView)mediaView
{
  return self->_mediaView;
}

- (void)setFocusViewDelegate:(id)a3
{
}

- (PXPortraitFocusViewDelegate)focusViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusViewDelegate);
  return (PXPortraitFocusViewDelegate *)WeakRetained;
}

- (void)focusPointChanged:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(PXPortraitFocusView *)self focusViewDelegate];
  objc_msgSend(v5, "focusPointChanged:", x, y);
}

- (PXPortraitFocusView)initWithMediaView:(id)a3 isHDR:(BOOL)a4
{
  id v7 = a3;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXPortraitFocusView.m", 19, @"Invalid parameter not satisfying: %@", @"mediaView != nil" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PXPortraitFocusView;
  v8 = -[PXPortraitFocusView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_mediaView, a3);
  }

  return v9;
}

@end