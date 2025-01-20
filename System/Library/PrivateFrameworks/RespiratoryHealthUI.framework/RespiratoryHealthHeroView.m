@interface RespiratoryHealthHeroView
- (CGSize)intrinsicContentSize;
- (RespiratoryHealthHeroView)init;
- (double)preferredWidth;
- (double)validScaleFactorForCandidate:(double)result;
- (void)_updateHeroUIWithScaleFactor:(double)a3;
- (void)setPreferredWidth:(double)a3;
@end

@implementation RespiratoryHealthHeroView

- (RespiratoryHealthHeroView)init
{
  v46.receiver = self;
  v46.super_class = (Class)RespiratoryHealthHeroView;
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  v6 = -[RespiratoryHealthHeroView initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x263F001A8], v3, v4, v5);
  if (v6)
  {
    v7 = (void *)MEMORY[0x263F1C6B0];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v7 imageNamed:@"setup-watch" inBundle:v8 withConfiguration:0];

    v10 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v9];
    [(UIImageView *)v10 frame];
    v6->_watchImageMediumFrame.origin.x = v11;
    v6->_watchImageMediumFrame.origin.y = v12;
    v6->_watchImageMediumFrame.size.width = v13;
    v6->_watchImageMediumFrame.size.height = v14;
    watchImageView = v6->_watchImageView;
    v6->_watchImageView = v10;
    v16 = v10;

    v17 = (void *)MEMORY[0x263F1C6B0];
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = [v17 imageNamed:@"setup-hero" inBundle:v18 withConfiguration:0];

    v20 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v19];
    v6->_heroImageMediumFrame.origin = (CGPoint)xmmword_2352E3860;
    v6->_heroImageMediumFrame.size = (CGSize)xmmword_2352E3870;
    heroImageView = v6->_heroImageView;
    v6->_heroImageView = v20;
    v22 = v20;

    -[UIImageView setFrame:](v22, "setFrame:", v6->_heroImageMediumFrame.origin.x, v6->_heroImageMediumFrame.origin.y, v6->_heroImageMediumFrame.size.width, v6->_heroImageMediumFrame.size.height);
    v23 = -[RespiratoryHealthHeroCountdownLabel initWithFrame:]([RespiratoryHealthHeroCountdownLabel alloc], "initWithFrame:", v2, v3, v4, v5);
    countdownLabel = v6->_countdownLabel;
    v6->_countdownLabel = v23;
    v25 = v23;

    [(UIImageView *)v22 frame];
    -[RespiratoryHealthHeroCountdownLabel sizeThatFits:](v25, "sizeThatFits:", v26, v27);
    double v29 = v28;
    double v31 = v30;
    [(UIImageView *)v22 frame];
    double v33 = v32;
    [(UIImageView *)v22 frame];
    double v35 = v33 + v34 - v31;
    [(UIImageView *)v22 frame];
    -[RespiratoryHealthHeroCountdownLabel setFrame:](v25, "setFrame:", v36 + 4.0, v35, v29, v31);
    [(RespiratoryHealthHeroCountdownLabel *)v25 frame];
    v6->_countdownLabelMediumFrame.origin.x = v37;
    v6->_countdownLabelMediumFrame.origin.y = v38;
    v6->_countdownLabelMediumFrame.size.width = v39;
    v6->_countdownLabelMediumFrame.size.height = v40;
    [(RespiratoryHealthHeroView *)v6 addSubview:v16];
    [(RespiratoryHealthHeroView *)v6 addSubview:v22];

    [(RespiratoryHealthHeroView *)v6 addSubview:v25];
    [(UIImageView *)v16 frame];
    -[RespiratoryHealthHeroView setFrame:](v6, "setFrame:");
    [(UIImageView *)v16 frame];
    CGFloat v42 = v41;
    CGFloat v44 = v43;

    v6->_watchImageSize.width = v42;
    v6->_watchImageSize.height = v44;
    v6->_preferredWidth = v42;
  }
  return v6;
}

- (CGSize)intrinsicContentSize
{
  double width = self->_watchImageSize.width;
  double height = self->_watchImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)validScaleFactorForCandidate:(double)result
{
  if (result > 3.0 || result < 0.75) {
    return 1.0;
  }
  return result;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
  [(RespiratoryHealthHeroView *)self validScaleFactorForCandidate:a3 / self->_watchImageMediumFrame.size.width];
  -[RespiratoryHealthHeroView _updateHeroUIWithScaleFactor:](self, "_updateHeroUIWithScaleFactor:");
}

- (void)_updateHeroUIWithScaleFactor:(double)a3
{
  if (a3 == 1.0)
  {
    -[UIImageView setFrame:](self->_heroImageView, "setFrame:", self->_heroImageMediumFrame.origin.x, self->_heroImageMediumFrame.origin.y, self->_heroImageMediumFrame.size.width, self->_heroImageMediumFrame.size.height);
    -[UIImageView setFrame:](self->_watchImageView, "setFrame:", self->_watchImageMediumFrame.origin.x, self->_watchImageMediumFrame.origin.y, self->_watchImageMediumFrame.size.width, self->_watchImageMediumFrame.size.height);
    -[RespiratoryHealthHeroCountdownLabel setFrame:](self->_countdownLabel, "setFrame:", self->_countdownLabelMediumFrame.origin.x, self->_countdownLabelMediumFrame.origin.y, self->_countdownLabelMediumFrame.size.width, self->_countdownLabelMediumFrame.size.height);
    self->_watchImageSize = self->_watchImageMediumFrame.size;
  }
  else
  {
    double width = self->_watchImageMediumFrame.size.width;
    CGFloat v6 = width * a3;
    CGFloat v7 = self->_watchImageMediumFrame.size.height * a3;
    double v8 = -(width - width * a3) * 0.5;
    -[UIImageView setFrame:](self->_watchImageView, "setFrame:", self->_watchImageMediumFrame.origin.x, self->_watchImageMediumFrame.origin.y, width * a3, v7);
    double v9 = self->_heroImageMediumFrame.size.width;
    CGFloat v10 = self->_heroImageMediumFrame.origin.x + v8 - -(v9 - v9 * a3) * 0.5;
    double v11 = (a3 + -1.0) * 8.0 + self->_heroImageMediumFrame.origin.y * a3;
    CGFloat v12 = self->_heroImageMediumFrame.size.height * a3;
    -[UIImageView setFrame:](self->_heroImageView, "setFrame:", v10, v11, v9 * a3, v12);
    -[RespiratoryHealthHeroCountdownLabel setFrame:](self->_countdownLabel, "setFrame:", v10 + 4.0, v11 + v12 - self->_countdownLabelMediumFrame.size.height * a3, self->_countdownLabelMediumFrame.size.width * a3);
    self->_watchImageSize.double width = v6;
    self->_watchImageSize.double height = v7;
  }
  [(RespiratoryHealthHeroCountdownLabel *)self->_countdownLabel setScaleFactor:a3];
  [(RespiratoryHealthHeroView *)self frame];
  -[RespiratoryHealthHeroView setFrame:](self, "setFrame:");
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countdownLabel, 0);
  objc_storeStrong((id *)&self->_heroImageView, 0);
  objc_storeStrong((id *)&self->_watchImageView, 0);
}

@end