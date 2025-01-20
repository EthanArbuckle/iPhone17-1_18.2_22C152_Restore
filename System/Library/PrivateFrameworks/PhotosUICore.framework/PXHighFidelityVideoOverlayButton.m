@interface PXHighFidelityVideoOverlayButton
- (BOOL)_didConfigureForPause;
- (BOOL)showAsPause;
- (PXHighFidelityVideoOverlayButton)initWithConfiguration:(id)a3;
- (void)_playButtonActivate:(id)a3;
- (void)_playButtonDeactivate:(id)a3;
- (void)_playButtonTapped:(id)a3;
- (void)_setDidConfigureForPause:(BOOL)a3;
- (void)layoutSubviews;
- (void)setShowAsPause:(BOOL)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
@end

@implementation PXHighFidelityVideoOverlayButton

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_overlayConfiguration, 0);
  objc_storeStrong((id *)&self->_overlayPlayBackground, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

- (void)_setDidConfigureForPause:(BOOL)a3
{
  self->__didConfigureForPause = a3;
}

- (BOOL)_didConfigureForPause
{
  return self->__didConfigureForPause;
}

- (BOOL)showAsPause
{
  return self->_showAsPause;
}

- (void)setShowAsPause:(BOOL)a3
{
  if (self->_showAsPause != a3)
  {
    BOOL v3 = a3;
    self->_showAsPause = a3;
    if (a3 && ![(PXHighFidelityVideoOverlayButton *)self _didConfigureForPause])
    {
      v5 = objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 5);
      [(UIButton *)self->_button setImage:v5 forState:4];
      [(UIButton *)self->_button setImage:v5 forState:5];
      [(PXHighFidelityVideoOverlayButton *)self _setDidConfigureForPause:1];
    }
    [(UIButton *)self->_button setSelected:v3];
    backdropView = self->_backdropView;
    button = self->_button;
    [(_UIBackdropView *)backdropView updateMaskViewsForView:button];
  }
}

- (void)_playButtonTapped:(id)a3
{
  id v10 = a3;
  -[PXHighFidelityVideoOverlayButton _playButtonDeactivate:](self, "_playButtonDeactivate:");
  p_target = &self->_target;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  p_action = &self->_action;
  LOBYTE(self) = objc_opt_respondsToSelector();

  if (self)
  {
    id v7 = objc_loadWeakRetained(p_target);
    v8 = v7;
    if (*p_action) {
      SEL v9 = *p_action;
    }
    else {
      SEL v9 = 0;
    }
    [v7 performSelector:v9 withObject:v10];
  }
}

- (void)_playButtonDeactivate:(id)a3
{
}

- (void)_playButtonActivate:(id)a3
{
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_target, a3);
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = 0;
  }
  self->_action = v6;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PXHighFidelityVideoOverlayButton;
  [(PXHighFidelityVideoOverlayButton *)&v11 layoutSubviews];
  [(PXHighFidelityVideoOverlayButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIButton setFrame:](self->_button, "setFrame:");
  -[UIImageView setFrame:](self->_overlayPlayBackground, "setFrame:", v4, v6, v8, v10);
}

- (PXHighFidelityVideoOverlayButton)initWithConfiguration:(id)a3
{
  id v5 = a3;
  double v6 = objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 0);
  id v7 = objc_alloc(MEMORY[0x1E4FB14D0]);
  double v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v8 setImage:v6 forState:0];
  [v8 sizeToFit];
  [v8 frame];
  v18.receiver = self;
  v18.super_class = (Class)PXHighFidelityVideoOverlayButton;
  double v9 = -[PXHighFidelityVideoOverlayButton initWithFrame:](&v18, sel_initWithFrame_);
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_overlayConfiguration, a3);
    p_button = (id *)&v10->_button;
    objc_storeStrong((id *)&v10->_button, v8);
    [v8 addTarget:v10 action:sel__playButtonTapped_ forControlEvents:64];
    [v8 addTarget:v10 action:sel__playButtonActivate_ forControlEvents:1];
    [v8 addTarget:v10 action:sel__playButtonActivate_ forControlEvents:4];
    [v8 addTarget:v10 action:sel__playButtonDeactivate_ forControlEvents:8];
    [v8 setDeliversTouchesForGesturesToSuperview:0];
    [(PXHighFidelityVideoOverlayButton *)v10 addSubview:v10->_button];
    [(PXHighFidelityVideoOverlayButton *)v10 setAutoresizingMask:45];
    if ((unint64_t)[v5 style] <= 1)
    {
      v12 = objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 1);
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12];
      overlayPlayBackground = v10->_overlayPlayBackground;
      v10->_overlayPlayBackground = (UIImageView *)v13;

      uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2010];
      backdropView = v10->_backdropView;
      v10->_backdropView = (_UIBackdropView *)v15;

      [(PXHighFidelityVideoOverlayButton *)v10 insertSubview:v10->_backdropView belowSubview:*p_button];
      [(PXHighFidelityVideoOverlayButton *)v10 addSubview:v10->_overlayPlayBackground];
      [(UIImageView *)v10->_overlayPlayBackground _setBackdropMaskViewFlags:7];
      [(UIImageView *)v10->_overlayPlayBackground setAlpha:0.0];
      [(_UIBackdropView *)v10->_backdropView updateMaskViewsForView:v10->_overlayPlayBackground];
      [*p_button _setBackdropMaskViewFlags:3];
      [(_UIBackdropView *)v10->_backdropView updateMaskViewsForView:*p_button];
    }
  }
  [(PXHighFidelityVideoOverlayButton *)v10 _playButtonDeactivate:0];

  return v10;
}

@end