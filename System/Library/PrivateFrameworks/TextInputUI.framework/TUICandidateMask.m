@interface TUICandidateMask
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSLayoutConstraint)leftEdgeWidthConstraint;
- (NSLayoutConstraint)rightEdgeWidthConstraint;
- (TUICandidateMask)initWithFrame:(CGRect)a3;
- (TUICandidateViewStyle)style;
- (UIImageView)leftEdgeImageView;
- (UIImageView)rightEdgeImageView;
- (UIView)centerView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_updateLayout;
- (void)setCenterView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLeftEdgeImageView:(id)a3;
- (void)setLeftEdgeWidthConstraint:(id)a3;
- (void)setRightEdgeImageView:(id)a3;
- (void)setRightEdgeWidthConstraint:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation TUICandidateMask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerView, 0);
  objc_storeStrong((id *)&self->_rightEdgeWidthConstraint, 0);
  objc_storeStrong((id *)&self->_rightEdgeImageView, 0);
  objc_storeStrong((id *)&self->_leftEdgeWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leftEdgeImageView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

- (void)setCenterView:(id)a3
{
}

- (UIView)centerView
{
  return self->_centerView;
}

- (void)setRightEdgeWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)rightEdgeWidthConstraint
{
  return self->_rightEdgeWidthConstraint;
}

- (void)setRightEdgeImageView:(id)a3
{
}

- (UIImageView)rightEdgeImageView
{
  return self->_rightEdgeImageView;
}

- (void)setLeftEdgeWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)leftEdgeWidthConstraint
{
  return self->_leftEdgeWidthConstraint;
}

- (void)setLeftEdgeImageView:(id)a3
{
}

- (UIImageView)leftEdgeImageView
{
  return self->_leftEdgeImageView;
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (void)_updateLayout
{
  [(TUICandidateMask *)self frame];
  double v4 = v3;
  double v6 = v5;
  v7 = [(TUICandidateMask *)self leftEdgeImageView];
  v8 = [v7 image];
  [v8 size];
  double v10 = v9;

  v11 = [(TUICandidateMask *)self rightEdgeImageView];
  v12 = [v11 image];
  [v12 size];
  double v14 = v13;

  v15 = [(TUICandidateMask *)self leftEdgeImageView];
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, v10, v6);

  v16 = [(TUICandidateMask *)self centerView];
  objc_msgSend(v16, "setFrame:", v10, 0.0, v4 - v10 - v14, v6);

  id v17 = [(TUICandidateMask *)self rightEdgeImageView];
  objc_msgSend(v17, "setFrame:", v4 - v14, 0.0, v14, v6);
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUICandidateMask;
  -[TUICandidateMask setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TUICandidateMask *)self _updateLayout];
}

- (void)setStyle:(id)a3
{
  id v4 = a3;
  double v5 = [v4 leftEdgeMaskImage];
  double v6 = [(TUICandidateMask *)self leftEdgeImageView];
  [v6 setImage:v5];

  v7 = [v4 rightEdgeMaskImage];

  v8 = [(TUICandidateMask *)self rightEdgeImageView];
  [v8 setImage:v7];

  [(TUICandidateMask *)self _updateLayout];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (TUICandidateMask)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)TUICandidateMask;
  double v3 = -[TUICandidateMask initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    [(TUICandidateMask *)v3 setCenterView:v9];

    double v10 = [MEMORY[0x1E4FB1618] blackColor];
    v11 = [(TUICandidateMask *)v3 centerView];
    [v11 setBackgroundColor:v10];

    v12 = [(TUICandidateMask *)v3 centerView];
    [(TUICandidateMask *)v3 addSubview:v12];

    double v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v5, v6, v7, v8);
    [(TUICandidateMask *)v3 setLeftEdgeImageView:v13];

    double v14 = [(TUICandidateMask *)v3 leftEdgeImageView];
    [(TUICandidateMask *)v3 addSubview:v14];

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v5, v6, v7, v8);
    [(TUICandidateMask *)v3 setRightEdgeImageView:v15];

    v16 = [(TUICandidateMask *)v3 rightEdgeImageView];
    [(TUICandidateMask *)v3 addSubview:v16];
  }
  return v3;
}

@end