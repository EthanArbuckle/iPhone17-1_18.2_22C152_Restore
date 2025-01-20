@interface NotesBarBackgroundView
- (BOOL)hasBlur;
- (NotesBarBackgroundView)initWithCoder:(id)a3;
- (NotesBarBackgroundView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (UIVisualEffectView)blurView;
- (void)_setOverrideUserInterfaceStyle:(int64_t)a3;
- (void)commonInit;
- (void)registerForTraitChanges;
- (void)setBlurView:(id)a3;
- (void)setColor:(id)a3;
- (void)setHasBlur:(BOOL)a3;
- (void)updateColor;
@end

@implementation NotesBarBackgroundView

- (NotesBarBackgroundView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NotesBarBackgroundView;
  v3 = -[NotesBarBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NotesBarBackgroundView *)v3 commonInit];
  }
  return v4;
}

- (NotesBarBackgroundView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NotesBarBackgroundView;
  v3 = [(NotesBarBackgroundView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(NotesBarBackgroundView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  [(NotesBarBackgroundView *)self setUserInteractionEnabled:0];
  v3 = [(NotesBarBackgroundView *)self layer];
  [v3 setAllowsGroupOpacity:0];

  [(NotesBarBackgroundView *)self setClipsToBounds:1];
  [(NotesBarBackgroundView *)self registerForTraitChanges];
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  [(NotesBarBackgroundView *)self updateColor];
}

- (void)setHasBlur:(BOOL)a3
{
  self->_hasBlur = a3;
  [(NotesBarBackgroundView *)self updateColor];
}

- (void)updateColor
{
  if (![(NotesBarBackgroundView *)self hasBlur])
  {
    if ([(NotesBarBackgroundView *)self _overrideUserInterfaceStyle] == 1) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    id v22 = [(NotesBarBackgroundView *)self color];
    }
    v19 = [(UIView *)self ic_appearanceInfo];
    [v19 navigationBarAlpha];
    v20 = objc_msgSend(v22, "colorWithAlphaComponent:");
    [(NotesBarBackgroundView *)self setBackgroundColor:v20];

    v21 = [(NotesBarBackgroundView *)self blurView];
    [v21 removeFromSuperview];

    goto LABEL_11;
  }
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  [(NotesBarBackgroundView *)self setBackgroundColor:v3];

  v4 = [(NotesBarBackgroundView *)self blurView];

  if (!v4)
  {
    v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v5];
    [(NotesBarBackgroundView *)self setBlurView:v6];

    [(NotesBarBackgroundView *)self frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v15 = [(NotesBarBackgroundView *)self blurView];
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    v16 = [(NotesBarBackgroundView *)self blurView];
    [v16 setAutoresizingMask:18];
  }
  v17 = [(NotesBarBackgroundView *)self blurView];
  v18 = [v17 superview];

  if (!v18)
  {
    id v22 = [(NotesBarBackgroundView *)self blurView];
    -[NotesBarBackgroundView addSubview:](self, "addSubview:");
LABEL_11:
  }
}

- (void)_setOverrideUserInterfaceStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NotesBarBackgroundView;
  [(NotesBarBackgroundView *)&v4 _setOverrideUserInterfaceStyle:a3];
  [(NotesBarBackgroundView *)self updateColor];
}

- (void)registerForTraitChanges
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  id v4 = (id)[(NotesBarBackgroundView *)self registerForTraitChanges:v3 withAction:sel_updateColor];
}

- (UIColor)color
{
  return self->_color;
}

- (BOOL)hasBlur
{
  return self->_hasBlur;
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end