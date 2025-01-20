@interface PXStoryTVWatchNextCellView
- (PXStoryTVWatchNextCellView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PXStoryTVWatchNextCellView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countdownRing, 0);
  objc_storeStrong((id *)&self->_countdownImage, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)PXStoryTVWatchNextCellView;
  [(PXGFocusEffectView *)&v50 layoutSubviews];
  v3 = [(PXGFocusEffectView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(PXGFocusableView *)self userData];
  -[PXGradientView setFrame:](self->_gradientView, "setFrame:", v5, v7, v9, v11);
  v13 = [v12 title];
  if (v13)
  {
    v14 = [v12 spec];
    v15 = [v12 title];
    v16 = [v14 attributedStringForTitle:v15];
    [(UILabel *)self->_titleLabel setAttributedText:v16];
  }
  else
  {
    [(UILabel *)self->_titleLabel setAttributedText:0];
  }

  v17 = [v12 subtitle];
  if (v17)
  {
    v18 = [v12 spec];
    v19 = [v12 subtitle];
    v20 = [v18 attributedStringForSubtitle:v19];
    [(UILabel *)self->_subtitleLabel setAttributedText:v20];
  }
  else
  {
    [(UILabel *)self->_subtitleLabel setAttributedText:0];
  }

  if (v12 && [v12 countdownValue] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!self->_countdownImage)
    {
      v30 = objc_alloc_init(_PXStoryShapeView);
      countdownRing = self->_countdownRing;
      self->_countdownRing = v30;

      -[_PXStoryShapeView setCenter:](self->_countdownRing, "setCenter:", 51.0, 51.0);
      -[_PXStoryShapeView setBounds:](self->_countdownRing, "setBounds:", 0.0, 0.0, 62.0, 62.0);
      v32 = [(PXGFocusEffectView *)self contentView];
      [v32 addSubview:self->_countdownRing];

      v33 = [MEMORY[0x1E4FB14C0] bezierPath];
      objc_msgSend(v33, "moveToPoint:", 31.0, 0.0);
      objc_msgSend(v33, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 31.0, 31.0, 31.0, 4.72238898, 4.70238898);
      [v33 closePath];
      v27 = [(_PXStoryShapeView *)self->_countdownRing layer];
      v28 = v33;
      [(_PXStoryShapeView *)v27 setPath:[(UIImageView *)v28 CGPath]];
      v34 = [MEMORY[0x1E4FB1618] blackColor];
      id v35 = [v34 colorWithAlphaComponent:0.5];
      -[_PXStoryShapeView setFillColor:](v27, "setFillColor:", [v35 CGColor]);

      id v36 = [MEMORY[0x1E4FB1618] whiteColor];
      -[_PXStoryShapeView setStrokeColor:](v27, "setStrokeColor:", [v36 CGColor]);

      [(_PXStoryShapeView *)v27 setLineWidth:4.0];
      [(_PXStoryShapeView *)v27 setLineCap:*MEMORY[0x1E4F3A458]];
      id v29 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
      v37 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
      [v29 setTimingFunction:v37];

      objc_msgSend(v29, "setDuration:", (double)objc_msgSend(v12, "countdownValue") + 1.0);
      [v29 setToValue:&unk_1F02D8AE8];
      [v29 setFromValue:&unk_1F02D8B00];
      [v29 setRemovedOnCompletion:0];
      [v29 setFillMode:*MEMORY[0x1E4F39FA8]];
      [(_PXStoryShapeView *)v27 addAnimation:v29 forKey:@"strokeEnd"];
      v38 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      countdownImage = self->_countdownImage;
      self->_countdownImage = v38;

      -[UIImageView setCenter:](self->_countdownImage, "setCenter:", 51.0, 51.0);
      -[UIImageView setBounds:](self->_countdownImage, "setBounds:", 0.0, 0.0, 25.0, 25.0);
      v40 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UIImageView *)self->_countdownImage setTintColor:v40];

      v41 = [MEMORY[0x1E4FB1818] systemImageNamed:@"play.fill"];
      [(UIImageView *)self->_countdownImage setImage:v41];

      v42 = [(PXGFocusEffectView *)self contentView];
      [v42 addSubview:self->_countdownImage];

      [(_PXStoryShapeView *)self->_countdownRing setAlpha:0.0];
      [(UIImageView *)self->_countdownImage setAlpha:0.0];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __44__PXStoryTVWatchNextCellView_layoutSubviews__block_invoke;
      v49[3] = &unk_1E5DD36F8;
      v49[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v49 animations:0.5];
      goto LABEL_13;
    }
  }
  else
  {
    v21 = self->_countdownImage;
    if (v21)
    {
      v22 = v21;
      v23 = self->_countdownRing;
      v24 = self->_countdownImage;
      self->_countdownImage = 0;

      v25 = self->_countdownRing;
      self->_countdownRing = 0;

      v26 = (void *)MEMORY[0x1E4FB1EB0];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __44__PXStoryTVWatchNextCellView_layoutSubviews__block_invoke_2;
      v46[3] = &unk_1E5DD32A8;
      v47 = v22;
      v48 = v23;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __44__PXStoryTVWatchNextCellView_layoutSubviews__block_invoke_3;
      v43[3] = &unk_1E5DD0058;
      v44 = v47;
      v45 = v48;
      v27 = v48;
      v28 = v47;
      [v26 animateWithDuration:v46 animations:v43 completion:0.5];

      id v29 = v47;
LABEL_13:
    }
  }
}

uint64_t __44__PXStoryTVWatchNextCellView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 544) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 536);
  return [v2 setAlpha:1.0];
}

uint64_t __44__PXStoryTVWatchNextCellView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __44__PXStoryTVWatchNextCellView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

- (PXStoryTVWatchNextCellView)initWithFrame:(CGRect)a3
{
  v49[2] = *MEMORY[0x1E4F143B8];
  v47.receiver = self;
  v47.super_class = (Class)PXStoryTVWatchNextCellView;
  v3 = -[PXGFocusEffectView initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    double v5 = [(PXGFocusEffectView *)v3 contentView];
    [v5 bounds];
    double v10 = -[PXGradientView initWithFrame:]([PXGradientView alloc], "initWithFrame:", v6, v7, v8, v9);
    gradientView = v4->_gradientView;
    v4->_gradientView = v10;

    [v5 addSubview:v4->_gradientView];
    v12 = [MEMORY[0x1E4FB1618] blackColor];
    v46 = [v12 colorWithAlphaComponent:0.0];

    v13 = [MEMORY[0x1E4FB1618] blackColor];
    v45 = [v13 colorWithAlphaComponent:0.5];

    v49[0] = v46;
    v49[1] = v45;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    [(PXGradientView *)v4->_gradientView setColors:v14];

    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v15;

    v17 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v4->_titleLabel setTextColor:v17];

    [(UILabel *)v4->_titleLabel setNumberOfLines:2];
    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v4->_titleLabel];
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v18;

    v20 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v4->_subtitleLabel setTextColor:v20];

    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = v5;
    [v5 addSubview:v4->_subtitleLabel];
    v38 = (void *)MEMORY[0x1E4F28DC8];
    v44 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v43 = [v5 leadingAnchor];
    v42 = [v44 constraintEqualToAnchor:v43 constant:20.0];
    v48[0] = v42;
    v41 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v40 = [v5 trailingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40 constant:-20.0];
    v48[1] = v39;
    v37 = [(UILabel *)v4->_titleLabel lastBaselineAnchor];
    id v36 = [(UILabel *)v4->_subtitleLabel firstBaselineAnchor];
    id v35 = [v37 constraintEqualToAnchor:v36 constant:-23.0];
    v48[2] = v35;
    v33 = [(UILabel *)v4->_subtitleLabel leadingAnchor];
    v22 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v23 = [v33 constraintEqualToAnchor:v22];
    v48[3] = v23;
    v24 = [(UILabel *)v4->_subtitleLabel trailingAnchor];
    v25 = v21;
    v34 = v21;
    v26 = [v21 trailingAnchor];
    v27 = [v24 constraintEqualToAnchor:v26 constant:-20.0];
    v48[4] = v27;
    v28 = [(UILabel *)v4->_subtitleLabel lastBaselineAnchor];
    id v29 = [v25 bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:-20.0];
    v48[5] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:6];
    [v38 activateConstraints:v31];
  }
  return v4;
}

@end