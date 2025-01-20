@interface UIButton
- (void)cos_setTitle:(id)a3 pillButtonWidth:(double)a4;
@end

@implementation UIButton

- (void)cos_setTitle:(id)a3 pillButtonWidth:(double)a4
{
  id v5 = a3;
  v6 = BPSPillButtonImage();
  [(UIButton *)self setBackgroundImage:v6 forState:0];
  [(UIButton *)self setTitle:v5 forState:0];

  v7 = [(UIButton *)self titleLabel];
  [v7 setAdjustsFontSizeToFitWidth:1];

  v8 = [(UIButton *)self titleLabel];
  [v8 setTextAlignment:1];

  -[UIButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 0.0, 4.0, 0.0, 4.0);
  v28 = &off_10025BE78;
  v29 = &off_10025C390;
  v9 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  __asm { FMOV            V1.2D, #16.0 }
  long long v25 = _Q1;
  long long v26 = _Q1;
  long long v27 = _Q1;
  BPSScreenValueGetRelevantZoomValue();
  double v16 = v15;

  v17 = [(UIButton *)self titleLabel];
  v18 = +[UIFont systemFontOfSize:UIFontSystemFontDesignAlternate weight:v16 design:UIFontWeightMedium];
  [v17 setFont:v18];

  [(UIButton *)self frame];
  double v20 = v19;
  double v22 = v21;
  [v6 size];
  -[UIButton setFrame:](self, "setFrame:", v20, v22, v23, v24);
}

@end