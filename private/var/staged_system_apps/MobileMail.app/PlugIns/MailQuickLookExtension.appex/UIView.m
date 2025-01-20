@interface UIView
- (BOOL)mf_prefersRightToLeftInterfaceLayout;
- (void)mf_applyingConversationMessageShadow:(BOOL)a3 shouldRoundCorners:(BOOL)a4 cornerRadius:(double)a5;
- (void)mf_setAlpha:(double)a3;
@end

@implementation UIView

- (BOOL)mf_prefersRightToLeftInterfaceLayout
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EB84;
  block[3] = &unk_100038A48;
  block[4] = self;
  if (qword_100043DE8 != -1) {
    dispatch_once(&qword_100043DE8, block);
  }
  return byte_100043DE0;
}

- (void)mf_applyingConversationMessageShadow:(BOOL)a3 shouldRoundCorners:(BOOL)a4 cornerRadius:(double)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v15 = [(UIView *)self traitCollection];
  id v8 = [v15 userInterfaceStyle];

  if (v6 && v8 == (id)1)
  {
    id v16 = +[UIColor systemBlackColor];
    id v9 = [v16 CGColor];
    v10 = [(UIView *)self layer];
    [v10 setShadowColor:v9];

    v11 = [(UIView *)self layer];
    LODWORD(v12) = 1036831949;
    id v17 = v11;
    [v11 setShadowOpacity:v12];

    id v18 = [(UIView *)self layer];
    [v18 setShadowOffset:0.0, 2.0];

    id v19 = [(UIView *)self layer];
    [v19 setShadowRadius:8.0];

    id v20 = [(UIView *)self layer];
    [v20 setMasksToBounds:0];

    [(UIView *)self bounds];
    if (v5) {
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
    }
    else {
      +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
    }
    id v21 = objc_claimAutoreleasedReturnValue();
    id v13 = [v21 CGPath];
    v14 = [(UIView *)self layer];
    [v14 setShadowPath:v13];
  }
  else
  {
    id v21 = [(UIView *)self layer];
    [v21 setShadowOpacity:0.0];
  }
}

- (void)mf_setAlpha:(double)a3
{
  [(UIView *)self alpha];
  double v6 = v5 - a3;
  if (v6 < 0.0) {
    double v6 = -v6;
  }
  if (v6 >= 2.22044605e-16)
  {
    [(UIView *)self setAlpha:a3];
  }
}

@end