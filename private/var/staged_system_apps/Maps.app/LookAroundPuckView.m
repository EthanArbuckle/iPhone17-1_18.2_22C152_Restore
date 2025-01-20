@interface LookAroundPuckView
- (BOOL)isDimmed;
- (LookAroundPuckView)initWithFrame:(CGRect)a3;
- (double)heading;
- (double)pitch;
- (int64_t)state;
- (void)setDimmed:(BOOL)a3;
- (void)setHeading:(double)a3;
- (void)setNeedsUpdateSubviews;
- (void)setPitch:(double)a3;
- (void)setState:(int64_t)a3;
- (void)updateSubviewsAnimated:(BOOL)a3 completion:(id)a4;
- (void)updateSubviewsIfNeeded;
- (void)updateSubviewsIfNeededAnimated:(BOOL)a3;
- (void)updateSubviewsIfNeededAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation LookAroundPuckView

- (LookAroundPuckView)initWithFrame:(CGRect)a3
{
  v45.receiver = self;
  v45.super_class = (Class)LookAroundPuckView;
  v3 = -[LookAroundPuckView initWithFrame:](&v45, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
    coneContainerView = v3->_coneContainerView;
    v3->_coneContainerView = v8;

    [(UIView *)v3->_coneContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(LookAroundPuckView *)v3 addSubview:v3->_coneContainerView];
    v44 = +[UIImage imageNamed:@"Cone"];
    v10 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v44];
    puckConeView = v3->_puckConeView;
    v3->_puckConeView = v10;

    [(UIImageView *)v3->_puckConeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_coneContainerView addSubview:v3->_puckConeView];
    v43 = +[UIImage imageNamed:@"Puck"];
    v12 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v43];
    puckImageView = v3->_puckImageView;
    v3->_puckImageView = v12;

    [(UIImageView *)v3->_puckImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(LookAroundPuckView *)v3 addSubview:v3->_puckImageView];
    v14 = -[LookAroundPuckGlyphView initWithFrame:]([LookAroundPuckGlyphView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    glyphView = v3->_glyphView;
    v3->_glyphView = v14;

    [(LookAroundPuckGlyphView *)v3->_glyphView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(LookAroundPuckView *)v3 addSubview:v3->_glyphView];
    v42 = [(UIView *)v3->_coneContainerView centerXAnchor];
    v41 = [(LookAroundPuckView *)v3 centerXAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v46[0] = v40;
    v39 = [(UIView *)v3->_coneContainerView centerYAnchor];
    v38 = [(LookAroundPuckView *)v3 centerYAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v46[1] = v37;
    v36 = [(UIImageView *)v3->_puckConeView centerXAnchor];
    v35 = [(LookAroundPuckView *)v3 centerXAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v46[2] = v34;
    v33 = [(UIImageView *)v3->_puckConeView centerYAnchor];
    v32 = [(LookAroundPuckView *)v3 centerYAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v46[3] = v31;
    v30 = [(UIImageView *)v3->_puckImageView centerXAnchor];
    v29 = [(LookAroundPuckView *)v3 centerXAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v46[4] = v28;
    v27 = [(UIImageView *)v3->_puckImageView centerYAnchor];
    v16 = [(LookAroundPuckView *)v3 centerYAnchor];
    v17 = [v27 constraintEqualToAnchor:v16];
    v46[5] = v17;
    v18 = [(LookAroundPuckGlyphView *)v3->_glyphView centerXAnchor];
    v19 = [(LookAroundPuckView *)v3 centerXAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v46[6] = v20;
    v21 = [(LookAroundPuckGlyphView *)v3->_glyphView centerYAnchor];
    v22 = [(LookAroundPuckView *)v3 centerYAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v46[7] = v23;
    v24 = +[NSArray arrayWithObjects:v46 count:8];
    +[NSLayoutConstraint activateConstraints:v24];

    [(LookAroundPuckView *)v3 setNeedsUpdateSubviews];
    [(LookAroundPuckView *)v3 updateSubviewsIfNeeded];
    v25 = v3;
  }
  return v3;
}

- (void)updateSubviewsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unsigned int v35 = [(LookAroundPuckGlyphView *)self->_glyphView isTilted];
  double v36 = self->_heading + 3.14159265;
  double pitch = self->_pitch;
  double v8 = 1.0;
  if (self->_dimmed) {
    double v9 = 0.5;
  }
  else {
    double v9 = 1.0;
  }
  int64_t v10 = [(LookAroundPuckView *)self state];
  __asm { FMOV            V0.2D, #1.0 }
  *(double *)&_Q0 = v36;
  switch(v10)
  {
    case 0:
      long long v37 = _Q0;
      double v9 = 0.0;
      goto LABEL_8;
    case 1:
      -[LookAroundPuckGlyphView setTilted:animated:](self->_glyphView, "setTilted:animated:", 0, v4, v36);
      long long v37 = xmmword_100F6F790;
LABEL_8:
      double v16 = 0.0;
      break;
    case 2:
      long long v37 = _Q0;
      [(LookAroundPuckGlyphView *)self->_glyphView setTilted:1 animated:v4];
      if (self->_dimmed) {
        double v16 = 0.0;
      }
      else {
        double v16 = 1.0;
      }
      break;
    case 3:
      long long v37 = _Q0;
      [(LookAroundPuckGlyphView *)self->_glyphView setTilted:1 animated:v4];
      double v16 = 0.0;
      double v8 = 1.2;
      break;
    default:
      long long v37 = _Q0;
      double v16 = 1.0;
      break;
  }
  v17 = self;
  v18 = v17->_coneContainerView;
  v19 = v17->_puckConeView;
  v20 = v17->_puckImageView;
  v21 = self->_glyphView;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100BA2944;
  v50[3] = &unk_10131A430;
  double v56 = v8;
  uint64_t v57 = v37;
  v22 = v18;
  v51 = v22;
  v23 = v19;
  v52 = v23;
  long long v58 = v37;
  double v59 = v16;
  v24 = v20;
  v53 = v24;
  double v60 = v9;
  v25 = v21;
  v54 = v25;
  double v61 = pitch;
  v26 = v17;
  v55 = v26;
  v27 = objc_retainBlock(v50);
  v28 = v27;
  if (v4)
  {
    v38 = v6;
    if ((v35 & 1) == 0)
    {
      long long v34 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v48[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      long long v33 = v48[0];
      v48[1] = v34;
      long long v49 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      long long v32 = v49;
      [(UIView *)v22 setTransform:v48];
      v47[0] = v33;
      v47[1] = v34;
      v47[2] = v32;
      [(LookAroundPuckGlyphView *)v25 setTransform:v47];
    }
    unsigned int v29 = v35 ^ [(LookAroundPuckGlyphView *)self->_glyphView isTilted];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100BA2BE8;
    v44[3] = &unk_1012E9AD0;
    id v30 = v28;
    id v45 = v30;
    char v46 = v29;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100BA2C08;
    v41[3] = &unk_10131A458;
    char v43 = v29;
    id v31 = v38;
    id v42 = v31;
    +[UIView animateWithDuration:v44 animations:v41 completion:0.4];
    if (v29 == 1)
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100BA2C28;
      v39[3] = &unk_1012E6EA8;
      id v40 = v30;
      +[UIView animateWithDuration:0 delay:v39 options:v31 animations:0.3 completion:0.5];
    }
    id v6 = v38;
  }
  else
  {
    ((void (*)(void *, uint64_t))v27[2])(v27, 1);
    if (v6) {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  [(LookAroundPuckView *)self setNeedsUpdateSubviews];
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
  [(LookAroundPuckView *)self setNeedsUpdateSubviews];
}

- (void)setPitch:(double)a3
{
  self->_double pitch = a3;
  [(LookAroundPuckView *)self setNeedsUpdateSubviews];
}

- (void)setHeading:(double)a3
{
  self->_heading = a3;
  [(LookAroundPuckView *)self setNeedsUpdateSubviews];
}

- (void)setNeedsUpdateSubviews
{
  self->_subviewsNeedUpdate = 1;
}

- (void)updateSubviewsIfNeeded
{
}

- (void)updateSubviewsIfNeededAnimated:(BOOL)a3
{
}

- (void)updateSubviewsIfNeededAnimated:(BOOL)a3 completion:(id)a4
{
  if (self->_subviewsNeedUpdate)
  {
    self->_subviewsNeedUpdate = 0;
    [(LookAroundPuckView *)self updateSubviewsAnimated:a3 completion:a4];
  }
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (double)pitch
{
  return self->_pitch;
}

- (double)heading
{
  return self->_heading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_puckImageView, 0);
  objc_storeStrong((id *)&self->_puckConeView, 0);

  objc_storeStrong((id *)&self->_coneContainerView, 0);
}

@end