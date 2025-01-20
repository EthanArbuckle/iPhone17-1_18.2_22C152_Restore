@interface TUICandidateBackdropView
- (TUICandidateBackdropView)initWithCoder:(id)a3;
- (TUICandidateBackdropView)initWithFrame:(CGRect)a3;
- (TUICandidateViewStyle)style;
- (UIKBBackdropView)backdropView;
- (int64_t)backdropViewStyle;
- (void)_setRenderConfig:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBackdropView:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation TUICandidateBackdropView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

- (void)setBackdropView:(id)a3
{
}

- (UIKBBackdropView)backdropView
{
  return self->_backdropView;
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (void)_setRenderConfig:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TUICandidateBackdropView;
  id v4 = a3;
  [(TUICandidateBackdropView *)&v7 _setRenderConfig:v4];
  int v5 = objc_msgSend(v4, "animatedBackground", v7.receiver, v7.super_class);

  if (v5)
  {
    v6 = [(TUICandidateBackdropView *)self backdropView];
    objc_msgSend(v6, "transitionToStyle:", -[TUICandidateBackdropView backdropViewStyle](self, "backdropViewStyle"));
  }
}

- (void)setStyle:(id)a3
{
  id v3 = a3;
  id v8 = a3;
  int v5 = self->_style;
  objc_storeStrong((id *)&self->_style, v3);
  LODWORD(v3) = [(TUICandidateViewStyle *)v5 darkBackdrop];
  if (v3 != [v8 darkBackdrop]
    || (uint64_t v6 = [v8 columnsCount], v6 != -[TUICandidateViewStyle columnsCount](v5, "columnsCount")))
  {
    objc_super v7 = [(TUICandidateBackdropView *)self backdropView];
    objc_msgSend(v7, "transitionToStyle:", -[TUICandidateBackdropView backdropViewStyle](self, "backdropViewStyle"));
  }
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)TUICandidateBackdropView;
  [(TUICandidateBackdropView *)&v5 didMoveToWindow];
  id v3 = [(TUICandidateBackdropView *)self _inheritedRenderConfig];

  if (v3)
  {
    id v4 = [(TUICandidateBackdropView *)self backdropView];
    objc_msgSend(v4, "transitionToStyle:", -[TUICandidateBackdropView backdropViewStyle](self, "backdropViewStyle"));
  }
}

- (int64_t)backdropViewStyle
{
  id v3 = [(TUICandidateBackdropView *)self style];
  if ([v3 darkBackdrop]) {
    int64_t v4 = 2030;
  }
  else {
    int64_t v4 = 3901;
  }

  objc_super v5 = [(TUICandidateBackdropView *)self _inheritedRenderConfig];

  if (v5)
  {
    uint64_t v6 = [(TUICandidateBackdropView *)self _inheritedRenderConfig];
    int64_t v4 = [v6 backdropStyle];

    if (v4 == 3904)
    {
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        objc_super v7 = [(TUICandidateBackdropView *)self style];
        uint64_t v8 = [v7 columnsCount];

        if (v8) {
          return 3905;
        }
        else {
          return 3903;
        }
      }
      else
      {
        return 3903;
      }
    }
  }
  return v4;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)TUICandidateBackdropView;
  [(TUICandidateBackdropView *)&v12 layoutSubviews];
  id v3 = [(TUICandidateBackdropView *)self backdropView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1878]);
    [(TUICandidateBackdropView *)self bounds];
    v9 = objc_msgSend(v4, "initWithFrame:style:", -[TUICandidateBackdropView backdropViewStyle](self, "backdropViewStyle"), v5, v6, v7, v8);
    [(TUICandidateBackdropView *)self setBackdropView:v9];

    v10 = [(TUICandidateBackdropView *)self backdropView];
    [(TUICandidateBackdropView *)self addSubview:v10];

    v11 = [(TUICandidateBackdropView *)self backdropView];
    [v11 setAutoresizingMask:18];
  }
}

- (TUICandidateBackdropView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateBackdropView;
  id v3 = [(TUICandidateBackdropView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(TUICandidateBackdropView *)v3 commonInit];
  }
  return v4;
}

- (TUICandidateBackdropView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateBackdropView;
  id v3 = -[TUICandidateBackdropView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(TUICandidateBackdropView *)v3 commonInit];
  }
  return v4;
}

@end