@interface PLHighFidelityVideoOverlayButton
- (PLHighFidelityVideoOverlayButton)initWithStyle:(int64_t)a3;
- (int64_t)style;
- (void)_playButtonActivate:(id)a3;
- (void)_playButtonDeactivate:(id)a3;
- (void)_playButtonTapped:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setTarget:(id)a3 action:(SEL)a4;
@end

@implementation PLHighFidelityVideoOverlayButton

- (void)_playButtonTapped:(id)a3
{
  [(PLHighFidelityVideoOverlayButton *)self _playButtonDeactivate:a3];
  p_action = &self->_action;
  if (objc_opt_respondsToSelector())
  {
    id target = self->_target;
    if (*p_action) {
      SEL v6 = *p_action;
    }
    else {
      SEL v6 = 0;
    }
    [target performSelector:v6 withObject:self];
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
  self->_id target = a3;
  if (a4) {
    v4 = a4;
  }
  else {
    v4 = 0;
  }
  self->_action = v4;
}

- (int64_t)style
{
  return self->_style;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLHighFidelityVideoOverlayButton;
  [(PLHighFidelityVideoOverlayButton *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PLHighFidelityVideoOverlayButton;
  [(PLHighFidelityVideoOverlayButton *)&v11 layoutSubviews];
  [(PLHighFidelityVideoOverlayButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIButton setFrame:](self->_button, "setFrame:");
  -[UIImageView setFrame:](self->_overlayPlayBackground, "setFrame:", v4, v6, v8, v10);
}

- (PLHighFidelityVideoOverlayButton)initWithStyle:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [MEMORY[0x1E4F42A80] imageNamed:@"PLVideoOverlayGlyphMask" inBundle:v5];
  id v7 = objc_alloc(MEMORY[0x1E4F427E0]);
  double v8 = (UIButton *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIButton *)v8 setImage:v6 forState:0];
  [(UIButton *)v8 sizeToFit];
  [(UIButton *)v8 frame];
  v14.receiver = self;
  v14.super_class = (Class)PLHighFidelityVideoOverlayButton;
  double v9 = -[PLHighFidelityVideoOverlayButton initWithFrame:](&v14, sel_initWithFrame_);
  double v10 = v9;
  if (v9)
  {
    v9->_style = a3;
    v9->_button = v8;
    [(UIButton *)v8 addTarget:v9 action:sel__playButtonTapped_ forControlEvents:64];
    [(UIButton *)v8 addTarget:v10 action:sel__playButtonActivate_ forControlEvents:1];
    [(UIButton *)v8 addTarget:v10 action:sel__playButtonActivate_ forControlEvents:4];
    [(UIButton *)v8 addTarget:v10 action:sel__playButtonDeactivate_ forControlEvents:8];
    [(UIButton *)v8 setDeliversTouchesForGesturesToSuperview:0];
    [(PLHighFidelityVideoOverlayButton *)v10 addSubview:v10->_button];
    [(PLHighFidelityVideoOverlayButton *)v10 setAutoresizingMask:45];
    if (!a3)
    {
      uint64_t v11 = [MEMORY[0x1E4F42A80] imageNamed:@"PLVideoOverlayBackgroundMask" inBundle:v5];
      v10->_overlayPlayBackground = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v11];
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:2010];
      v10->_backdropView = (_UIBackdropView *)v12;
      [(PLHighFidelityVideoOverlayButton *)v10 insertSubview:v12 belowSubview:v10->_button];
      [(PLHighFidelityVideoOverlayButton *)v10 addSubview:v10->_overlayPlayBackground];
      [(UIImageView *)v10->_overlayPlayBackground _setBackdropMaskViewFlags:7];
      [(UIImageView *)v10->_overlayPlayBackground setAlpha:0.0];
      [(_UIBackdropView *)v10->_backdropView updateMaskViewsForView:v10->_overlayPlayBackground];
      [(UIButton *)v10->_button _setBackdropMaskViewFlags:3];
      [(_UIBackdropView *)v10->_backdropView updateMaskViewsForView:v10->_button];
    }
  }
  else
  {
  }
  [(PLHighFidelityVideoOverlayButton *)v10 _playButtonDeactivate:0];
  return v10;
}

@end