@interface COSWristDetectionHUD
- (CALayer)d;
- (CALayer)invalid;
- (CALayer)ll;
- (CALayer)lr;
- (CALayer)none;
- (CALayer)p;
- (CALayer)rl;
- (CALayer)rr;
- (COSWristDetectionHUD)initWithFrame:(CGRect)a3;
- (UILabel)prediciton;
- (void)setD:(id)a3;
- (void)setInvalid:(id)a3;
- (void)setLl:(id)a3;
- (void)setLr:(id)a3;
- (void)setNone:(id)a3;
- (void)setP:(id)a3;
- (void)setPrediciton:(id)a3;
- (void)setRl:(id)a3;
- (void)setRr:(id)a3;
- (void)updateWithConfidences:(id)a3;
- (void)updateWithSummary:(id)a3;
@end

@implementation COSWristDetectionHUD

- (COSWristDetectionHUD)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v57.receiver = self;
  v57.super_class = (Class)COSWristDetectionHUD;
  v7 = -[COSWristDetectionHUD initWithFrame:](&v57, "initWithFrame:");
  if (v7)
  {
    uint64_t v8 = +[CALayer layer];
    none = v7->_none;
    v7->_none = (CALayer *)v8;

    -[CALayer setFrame:](v7->_none, "setFrame:", 0.0, 45.0, 0.0, 25.0);
    v10 = v7->_none;
    id v11 = +[UIColor whiteColor];
    -[CALayer setBackgroundColor:](v10, "setBackgroundColor:", [v11 CGColor]);

    v12 = [(COSWristDetectionHUD *)v7 layer];
    [v12 addSublayer:v7->_none];

    uint64_t v13 = +[CALayer layer];
    invalid = v7->_invalid;
    v7->_invalid = (CALayer *)v13;

    -[CALayer setFrame:](v7->_invalid, "setFrame:", 0.0, 70.0, 25.0, 25.0);
    v15 = v7->_invalid;
    id v16 = +[UIColor grayColor];
    -[CALayer setBackgroundColor:](v15, "setBackgroundColor:", [v16 CGColor]);

    v17 = [(COSWristDetectionHUD *)v7 layer];
    [v17 addSublayer:v7->_invalid];

    uint64_t v18 = +[CALayer layer];
    lr = v7->_lr;
    v7->_lr = (CALayer *)v18;

    -[CALayer setFrame:](v7->_lr, "setFrame:", 0.0, 95.0, 25.0, 25.0);
    v20 = v7->_lr;
    id v21 = +[UIColor redColor];
    -[CALayer setBackgroundColor:](v20, "setBackgroundColor:", [v21 CGColor]);

    v22 = [(COSWristDetectionHUD *)v7 layer];
    [v22 addSublayer:v7->_lr];

    uint64_t v23 = +[CALayer layer];
    ll = v7->_ll;
    v7->_ll = (CALayer *)v23;

    -[CALayer setFrame:](v7->_ll, "setFrame:", 0.0, 120.0, 25.0, 25.0);
    v25 = v7->_ll;
    id v26 = +[UIColor orangeColor];
    -[CALayer setBackgroundColor:](v25, "setBackgroundColor:", [v26 CGColor]);

    v27 = [(COSWristDetectionHUD *)v7 layer];
    [v27 addSublayer:v7->_ll];

    uint64_t v28 = +[CALayer layer];
    rr = v7->_rr;
    v7->_rr = (CALayer *)v28;

    -[CALayer setFrame:](v7->_rr, "setFrame:", 0.0, 145.0, 25.0, 25.0);
    v30 = v7->_rr;
    id v31 = +[UIColor blueColor];
    -[CALayer setBackgroundColor:](v30, "setBackgroundColor:", [v31 CGColor]);

    v32 = [(COSWristDetectionHUD *)v7 layer];
    [v32 addSublayer:v7->_rr];

    uint64_t v33 = +[CALayer layer];
    rl = v7->_rl;
    v7->_rl = (CALayer *)v33;

    -[CALayer setFrame:](v7->_rl, "setFrame:", 0.0, 170.0, 25.0, 25.0);
    v35 = v7->_rl;
    id v36 = +[UIColor yellowColor];
    -[CALayer setBackgroundColor:](v35, "setBackgroundColor:", [v36 CGColor]);

    v37 = [(COSWristDetectionHUD *)v7 layer];
    [v37 addSublayer:v7->_rl];

    uint64_t v38 = +[CALayer layer];
    p = v7->_p;
    v7->_p = (CALayer *)v38;

    -[CALayer setFrame:](v7->_p, "setFrame:", 0.0, 195.0, 25.0, 25.0);
    v40 = v7->_p;
    id v41 = +[UIColor systemPinkColor];
    -[CALayer setBackgroundColor:](v40, "setBackgroundColor:", [v41 CGColor]);

    v42 = [(COSWristDetectionHUD *)v7 layer];
    [v42 addSublayer:v7->_p];

    uint64_t v43 = +[CALayer layer];
    d = v7->_d;
    v7->_d = (CALayer *)v43;

    -[CALayer setFrame:](v7->_d, "setFrame:", 0.0, 220.0, 25.0, 25.0);
    v45 = v7->_d;
    id v46 = +[UIColor systemDarkPinkColor];
    -[CALayer setBackgroundColor:](v45, "setBackgroundColor:", [v46 CGColor]);

    v47 = [(COSWristDetectionHUD *)v7 layer];
    [v47 addSublayer:v7->_d];

    v48 = (UILabel *)objc_alloc_init((Class)UILabel);
    prediciton = v7->_prediciton;
    v7->_prediciton = v48;

    v50 = v7->_prediciton;
    v51 = +[UIFont systemFontOfSize:22.0];
    [(UILabel *)v50 setFont:v51];

    v52 = v7->_prediciton;
    v53 = +[UIColor whiteColor];
    [(UILabel *)v52 setTextColor:v53];

    [(UILabel *)v7->_prediciton setTextAlignment:1];
    v54 = v7->_prediciton;
    v55 = +[UIColor colorWithWhite:0.1 alpha:0.8];
    [(UILabel *)v54 setBackgroundColor:v55];

    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    v58.size.CGFloat height = height;
    -[UILabel setFrame:](v7->_prediciton, "setFrame:", 0.0, 0.0, CGRectGetWidth(v58), 45.0);
    [(COSWristDetectionHUD *)v7 addSubview:v7->_prediciton];
  }
  return v7;
}

- (void)updateWithConfidences:(id)a3
{
  id v4 = a3;
  v5 = +[UIScreen mainScreen];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  none = self->_none;
  v42.origin.CGFloat x = v7;
  v42.origin.CGFloat y = v9;
  v42.size.CGFloat width = v11;
  v42.size.CGFloat height = v13;
  double Width = CGRectGetWidth(v42);
  [v4 none];
  -[CALayer setFrame:](none, "setFrame:", 0.0, 45.0, Width * v16, 10.0);
  invalid = self->_invalid;
  v43.origin.CGFloat x = v7;
  v43.origin.CGFloat y = v9;
  v43.size.CGFloat width = v11;
  v43.size.CGFloat height = v13;
  double v18 = CGRectGetWidth(v43);
  [v4 invalid];
  -[CALayer setFrame:](invalid, "setFrame:", 0.0, 70.0, v18 * v19, 10.0);
  lr = self->_lr;
  v44.origin.CGFloat x = v7;
  v44.origin.CGFloat y = v9;
  v44.size.CGFloat width = v11;
  v44.size.CGFloat height = v13;
  double v21 = CGRectGetWidth(v44);
  [v4 leftWristRightCrown];
  -[CALayer setFrame:](lr, "setFrame:", 0.0, 95.0, v21 * v22, 10.0);
  ll = self->_ll;
  v45.origin.CGFloat x = v7;
  v45.origin.CGFloat y = v9;
  v45.size.CGFloat width = v11;
  v45.size.CGFloat height = v13;
  double v24 = CGRectGetWidth(v45);
  [v4 leftWristLeftCrown];
  -[CALayer setFrame:](ll, "setFrame:", 0.0, 120.0, v24 * v25, 10.0);
  rr = self->_rr;
  v46.origin.CGFloat x = v7;
  v46.origin.CGFloat y = v9;
  v46.size.CGFloat width = v11;
  v46.size.CGFloat height = v13;
  double v27 = CGRectGetWidth(v46);
  [v4 rightWristRightCrown];
  -[CALayer setFrame:](rr, "setFrame:", 0.0, 145.0, v27 * v28, 10.0);
  rl = self->_rl;
  v47.origin.CGFloat x = v7;
  v47.origin.CGFloat y = v9;
  v47.size.CGFloat width = v11;
  v47.size.CGFloat height = v13;
  double v30 = CGRectGetWidth(v47);
  [v4 rightWristLeftCrown];
  -[CALayer setFrame:](rl, "setFrame:", 0.0, 170.0, v30 * v31, 10.0);
  p = self->_p;
  v48.origin.CGFloat x = v7;
  v48.origin.CGFloat y = v9;
  v48.size.CGFloat width = v11;
  v48.size.CGFloat height = v13;
  double v33 = CGRectGetWidth(v48);
  [v4 palm];
  -[CALayer setFrame:](p, "setFrame:", 0.0, 195.0, v33 * v34, 10.0);
  d = self->_d;
  v49.origin.CGFloat x = v7;
  v49.origin.CGFloat y = v9;
  v49.size.CGFloat width = v11;
  v49.size.CGFloat height = v13;
  double v36 = CGRectGetWidth(v49);
  [v4 dock];
  double v38 = v37;

  -[CALayer setFrame:](d, "setFrame:", 0.0, 220.0, v36 * v38, 10.0);
  prediciton = self->_prediciton;
  v50.origin.CGFloat x = v7;
  v50.origin.CGFloat y = v9;
  v50.size.CGFloat width = v11;
  v50.size.CGFloat height = v13;
  double v40 = CGRectGetWidth(v50);

  -[UILabel setFrame:](prediciton, "setFrame:", 0.0, 0.0, v40, 45.0);
}

- (void)updateWithSummary:(id)a3
{
  id v4 = a3;
  v5 = +[UIScreen mainScreen];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  prediciton = self->_prediciton;
  v15 = [v4 description];

  [(UILabel *)prediciton setText:v15];
  double v16 = self->_prediciton;
  v19.origin.CGFloat x = v7;
  v19.origin.CGFloat y = v9;
  v19.size.CGFloat width = v11;
  v19.size.CGFloat height = v13;
  double Width = CGRectGetWidth(v19);

  -[UILabel setFrame:](v16, "setFrame:", 0.0, 0.0, Width, 45.0);
}

- (CALayer)none
{
  return self->_none;
}

- (void)setNone:(id)a3
{
}

- (CALayer)invalid
{
  return self->_invalid;
}

- (void)setInvalid:(id)a3
{
}

- (CALayer)lr
{
  return self->_lr;
}

- (void)setLr:(id)a3
{
}

- (CALayer)ll
{
  return self->_ll;
}

- (void)setLl:(id)a3
{
}

- (CALayer)rr
{
  return self->_rr;
}

- (void)setRr:(id)a3
{
}

- (CALayer)rl
{
  return self->_rl;
}

- (void)setRl:(id)a3
{
}

- (CALayer)p
{
  return self->_p;
}

- (void)setP:(id)a3
{
}

- (CALayer)d
{
  return self->_d;
}

- (void)setD:(id)a3
{
}

- (UILabel)prediciton
{
  return self->_prediciton;
}

- (void)setPrediciton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prediciton, 0);
  objc_storeStrong((id *)&self->_d, 0);
  objc_storeStrong((id *)&self->_p, 0);
  objc_storeStrong((id *)&self->_rl, 0);
  objc_storeStrong((id *)&self->_rr, 0);
  objc_storeStrong((id *)&self->_ll, 0);
  objc_storeStrong((id *)&self->_lr, 0);
  objc_storeStrong((id *)&self->_invalid, 0);

  objc_storeStrong((id *)&self->_none, 0);
}

@end