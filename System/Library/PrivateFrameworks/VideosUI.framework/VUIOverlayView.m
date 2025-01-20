@interface VUIOverlayView
+ (id)overlayViewFromMediaItem:(id)a3 overlayType:(int64_t)a4 existingView:(id)a5;
- (CALayer)gradientLayer;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSArray)badgeViewWrappers;
- (UIEdgeInsets)_overlayPadding;
- (UIEdgeInsets)padding;
- (VUIBaseView)gradientView;
- (VUILabel)titleLabel;
- (VUIProgressView)progressView;
- (VUITextBadgeView)textBadge;
- (int64_t)overlayType;
- (void)setBadgeViewWrappers:(id)a3;
- (void)setGradientLayer:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setOverlayType:(int64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setProgressView:(id)a3;
- (void)setTextBadge:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation VUIOverlayView

+ (id)overlayViewFromMediaItem:(id)a3 overlayType:(int64_t)a4 existingView:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (VUIOverlayView *)v7;
  }
  else
  {
    v10 = [VUIOverlayView alloc];
    v9 = -[VUIOverlayView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v11 = v9;
  [(VUIOverlayView *)v9 setOverlayType:a4];
  v12 = [v8 bookmark];
  [v12 floatValue];
  float v14 = v13;

  v15 = [v8 duration];
  [v15 floatValue];
  float v17 = v16;

  v18 = [v8 playedState];

  uint64_t v19 = [v18 integerValue];
  if (v19 == 3)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4FA9CE0]);
    v21 = +[VUIImageResourceMap imageForResourceName:@"watched-checkmark"];
    [v20 setImage:v21];

    [v20 setContentMode:12];
    if (!v20)
    {
LABEL_12:

      goto LABEL_13;
    }
    v22 = objc_opt_new();
    [v22 setBadgeView:v20];
    objc_msgSend(v22, "setBadgeSize:", 160.0, 160.0);
    [v22 setBadgeType:@"checkmark"];
    v29[0] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    [(VUIOverlayView *)v11 setBadgeViewWrappers:v23];

LABEL_11:
    goto LABEL_12;
  }
  if (v14 > 0.0 && v17 > 0.0)
  {
    double v24 = v14 / v17;
    if (v24 > 0.0)
    {
      id v20 = (id)objc_opt_new();
      v22 = +[VUIProgressBarLayout defaultProgressBarLayout];
      v25 = [v22 gradientStartColor];
      [v20 setGradientStartColor:v25];

      v26 = [v22 gradientEndColor];
      [v20 setGradientEndColor:v26];

      [v22 cornerRadius];
      objc_msgSend(v20, "setCornerRadius:");
      objc_msgSend(v20, "setShouldProgressBarUseRoundCorner:", objc_msgSend(v22, "shouldProgressBarUseRoundCorner"));
      v27 = [v22 fillColor];
      [v20 setCompleteTintColor:v27];

      [v20 setStyle:1];
      [v22 height];
      objc_msgSend(v20, "setHeight:");
      [v20 setProgress:v24];
      [(VUIOverlayView *)v11 setProgressView:v20];
      goto LABEL_11;
    }
  }
LABEL_13:
  [(VUIOverlayView *)v11 _overlayPadding];
  -[VUIOverlayView setPadding:](v11, "setPadding:");

  return v11;
}

- (void)setOverlayType:(int64_t)a3
{
  if (self->_overlayType != a3)
  {
    self->_overlayType = a3;
    [(VUIOverlayView *)self vui_setNeedsDisplay];
  }
}

- (void)setGradientLayer:(id)a3
{
  v5 = (CALayer *)a3;
  p_gradientLayer = &self->_gradientLayer;
  gradientLayer = self->_gradientLayer;
  v10 = v5;
  if (gradientLayer != v5)
  {
    [(CALayer *)gradientLayer removeFromSuperlayer];
    objc_storeStrong((id *)&self->_gradientLayer, a3);
    id v8 = *p_gradientLayer;
    [(VUIBaseView *)self->_gradientView bounds];
    -[CALayer setFrame:](v8, "setFrame:");
    v9 = [(VUIBaseView *)self->_gradientView layer];
    [v9 addSublayer:*p_gradientLayer];
  }
  [(VUIOverlayView *)self vui_setNeedsLayout];
}

- (void)setGradientView:(id)a3
{
  v5 = (VUIBaseView *)a3;
  gradientView = self->_gradientView;
  id v7 = v5;
  if (gradientView != v5)
  {
    [(VUIBaseView *)gradientView removeFromSuperview];
    [(VUIOverlayView *)self vui_insertSubview:v7 aboveSubview:0 oldView:self->_gradientView];
    objc_storeStrong((id *)&self->_gradientView, a3);
  }
  [(VUIOverlayView *)self vui_setNeedsLayout];
}

- (void)setTitleLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  titleLabel = self->_titleLabel;
  id v7 = v5;
  if (titleLabel != v5)
  {
    [(VUILabel *)titleLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_titleLabel, a3);
    if (self->_titleLabel) {
      -[VUIOverlayView addSubview:](self, "addSubview:");
    }
  }
  [(VUIOverlayView *)self vui_setNeedsLayout];
}

- (void)setTextBadge:(id)a3
{
  v5 = (VUITextBadgeView *)a3;
  [(VUIOverlayView *)self vui_addSubview:v5 oldView:self->_textBadge];
  if (self->_textBadge != v5) {
    objc_storeStrong((id *)&self->_textBadge, a3);
  }
  [(VUIOverlayView *)self vui_setNeedsLayout];
}

- (void)setBadgeViewWrappers:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count] || -[NSArray count](self->_badgeViewWrappers, "count"))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    p_badgeViewWrappers = &self->_badgeViewWrappers;
    id v7 = self->_badgeViewWrappers;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v23 + 1) + 8 * v11) badgeView];
          [v12 removeFromSuperview];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)p_badgeViewWrappers, a3);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    float v13 = *p_badgeViewWrappers;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17), "badgeView", (void)v19);
          [(VUIOverlayView *)self addSubview:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v15);
    }

    [(VUIOverlayView *)self vui_setNeedsLayout];
  }
}

- (void)setProgressView:(id)a3
{
  id v5 = (VUIProgressView *)a3;
  progressView = self->_progressView;
  id v7 = v5;
  if (progressView != v5)
  {
    [(VUIProgressView *)progressView removeFromSuperview];
    objc_storeStrong((id *)&self->_progressView, a3);
    if (self->_progressView) {
      -[VUIOverlayView addSubview:](self, "addSubview:");
    }
  }
  [(VUIOverlayView *)self setNeedsLayout];
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  v126.receiver = self;
  v126.super_class = (Class)VUIOverlayView;
  -[VUIOverlayView vui_layoutSubviews:computationOnly:](&v126, sel_vui_layoutSubviews_computationOnly_, a4);
  int v5 = [(VUIOverlayView *)self vuiIsRTL];
  [(VUIOverlayView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double top = self->_padding.top;
  double left = self->_padding.left;
  double right = self->_padding.right;
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v108 = *MEMORY[0x1E4F1DB28];
  double v109 = v11;
  double v110 = v13;
  double v111 = v11;
  double v102 = v11;
  double v103 = v12;
  double v14 = v13;
  double v115 = v12;
  double v116 = v12;
  double v113 = *MEMORY[0x1E4F1DB28];
  double v117 = *MEMORY[0x1E4F1DB28];
  if (self->_titleLabel)
  {
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    uint64_t v16 = [(VUIOverlayView *)self titleLabel];
    uint64_t v17 = [v16 textLayout];
    [v17 margin];
    double v19 = v18;
    double v112 = v20;
    double v22 = v21;

    double v23 = v7 - v19 - v22;
    -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v23, 0.0);
    double v14 = v24;
    double v115 = v23;
    VUIRoundValue();
    double v113 = v25;
    double v11 = v15;
    switch(self->_overlayType)
    {
      case 1:
        VUIRoundValue();
        double v110 = v13;
        double v111 = v27;
        double v12 = v116;
        double v10 = v117;
        double v108 = v117;
        double v109 = v11;
        double v102 = v11;
        double v103 = v116;
        break;
      case 2:
      case 4:
        [(VUILabel *)self->_titleLabel bottomMarginWithBaselineMargin:v112];
        VUIRoundValue();
        double v111 = v26;
        double v102 = v9 - v9 * 0.28;
        double v108 = *MEMORY[0x1E4F1DAD8];
        double v109 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        double v110 = v9 * 0.28;
        [(VUIOverlayView *)self vui_sendSubviewToBack:self->_gradientView];
        double v103 = v7;
        double v12 = v116;
        double v10 = v117;
        break;
      case 3:
        -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v115, 0.0);
        double v14 = v28;
        [(VUILabel *)self->_titleLabel bottomMarginWithBaselineMargin:v112];
        double v10 = v117;
        VUIRoundValue();
        double v111 = v29;
        double v102 = v9 + -145.0;
        double v108 = *MEMORY[0x1E4F1DAD8];
        double v109 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        [(VUIOverlayView *)self vui_sendSubviewToBack:self->_gradientView];
        double v110 = 145.0;
        double v103 = v7;
        double v12 = v116;
        break;
      default:
        double v11 = v15;
        double v109 = v15;
        double v110 = v13;
        double v12 = v116;
        double v10 = v117;
        double v108 = v117;
        double v102 = v11;
        double v103 = v116;
        double v111 = v11;
        break;
    }
  }
  double v101 = v14;
  textBadge = self->_textBadge;
  double v106 = v12;
  double v107 = v13;
  double v104 = v10;
  double v105 = v11;
  if (textBadge)
  {
    -[UIView vui_sizeThatFits:](textBadge, "vui_sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v106 = v31;
    double v107 = v32;
    if (self->_overlayType == 3) {
      double v33 = 40.0;
    }
    else {
      double v33 = top;
    }
    double v34 = 30.0;
    if (self->_overlayType != 3) {
      double v34 = left;
    }
    double v104 = v34;
    double v105 = v33;
  }
  badgeViewWrappers = self->_badgeViewWrappers;
  if (badgeViewWrappers)
  {
    double v97 = v11;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    v36 = badgeViewWrappers;
    uint64_t v37 = [(NSArray *)v36 countByEnumeratingWithState:&v122 objects:v128 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v123;
      double v40 = top + *MEMORY[0x1E4FB2848];
      double v41 = left + *(double *)(MEMORY[0x1E4FB2848] + 8);
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v123 != v39) {
            objc_enumerationMutation(v36);
          }
          v43 = *(void **)(*((void *)&v122 + 1) + 8 * i);
          [v43 badgeSize];
          double v45 = v44;
          double v47 = v46;
          v48 = [v43 badgeType];
          v49 = v48;
          double v50 = v41;
          double v51 = v40;
          if (v48)
          {
            int v52 = objc_msgSend(v48, "isEqualToString:", @"checkmark", v41, v40);
            double v50 = v7 - v45;
            double v51 = v9 - v47;
            if (!v52)
            {
              double v50 = v41;
              double v51 = v40;
            }
          }
          if (v5)
          {
            VUIRectWithFlippedOriginRelativeToBoundingRect();
            double v45 = v53;
            double v47 = v54;
          }
          objc_msgSend(v43, "setBadgeFrame:", v50, v51, v45, v47);
        }
        uint64_t v38 = [(NSArray *)v36 countByEnumeratingWithState:&v122 objects:v128 count:16];
      }
      while (v38);
    }

    double v10 = v117;
    double v11 = v97;
  }
  double v55 = v10;
  if (self->_progressView)
  {
    v56 = [MEMORY[0x1E4FB16C8] currentDevice];
    [v56 userInterfaceIdiom];

    -[VUIProgressView sizeThatFits:](self->_progressView, "sizeThatFits:", v7 - left - right, 0.0);
    VUIRoundValue();
    double v11 = v57;
    double v55 = left;
    double v10 = v117;
  }
  if (v5)
  {
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v55 = v58;
    double v60 = v59;
    v61 = [(VUIProgressView *)self->_progressView layer];
    [v61 setFlipsHorizontalAxis:1];

    double v11 = v60;
    double v10 = v117;
  }
  -[VUIProgressView setFrame:](self->_progressView, "setFrame:", v55, v11);
  -[VUIBaseView setFrame:](self->_gradientView, "setFrame:", v10, v102, v103, v110);
  -[CALayer setFrame:](self->_gradientLayer, "setFrame:", v108, v109, v103, v110);
  gradientLayer = self->_gradientLayer;
  if (gradientLayer)
  {
    v63 = [(CALayer *)gradientLayer mask];

    if (v63)
    {
      v64 = [(CALayer *)self->_gradientLayer mask];
      objc_msgSend(v64, "setFrame:", v108, v109, v103, v110);
    }
  }
  double v65 = v101;
  double v66 = v115;
  if (v5)
  {
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v68 = v67;
    double v70 = v69;
    double v66 = v71;
    double v65 = v72;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v74 = v73;
    double v75 = v68;
    double v77 = v76;
    double v78 = v70;
    double v80 = v79;
    double v82 = v81;
  }
  else
  {
    double v78 = v111;
    double v75 = v113;
    double v80 = v106;
    double v82 = v107;
    double v74 = v104;
    double v77 = v105;
  }
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v75, v78, v66, v65);
  -[VUITextBadgeView setFrame:](self->_textBadge, "setFrame:", v74, v77, v80, v82);
  if (self->_overlayType == 3)
  {
    v83 = [(VUITextBadgeView *)self->_textBadge layer];
    [v83 removeAllAnimations];
  }
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  v84 = self->_badgeViewWrappers;
  uint64_t v85 = [(NSArray *)v84 countByEnumeratingWithState:&v118 objects:v127 count:16];
  if (v85)
  {
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v119;
    do
    {
      for (uint64_t j = 0; j != v86; ++j)
      {
        if (*(void *)v119 != v87) {
          objc_enumerationMutation(v84);
        }
        v89 = *(void **)(*((void *)&v118 + 1) + 8 * j);
        v90 = [v89 badgeView];
        [v89 badgeFrame];
        objc_msgSend(v90, "setFrame:");
      }
      uint64_t v86 = [(NSArray *)v84 countByEnumeratingWithState:&v118 objects:v127 count:16];
    }
    while (v86);
  }

  v91 = [(VUIOverlayView *)self layer];
  [v91 cornerRadius];
  double v93 = v92;

  v94 = [(VUIOverlayView *)self layer];
  [v94 setMasksToBounds:v93 > 0.0];

  double width = a3.width;
  double height = a3.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)_overlayPadding
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if (self->_overlayType == 4)
  {
    double v5 = 8.0;
    double v4 = 8.0;
    double v3 = 8.0;
    double v2 = 8.0;
  }
  result.double right = v5;
  result.bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUITextBadgeView)textBadge
{
  return self->_textBadge;
}

- (VUIProgressView)progressView
{
  return self->_progressView;
}

- (VUIBaseView)gradientView
{
  return self->_gradientView;
}

- (CALayer)gradientLayer
{
  return self->_gradientLayer;
}

- (NSArray)badgeViewWrappers
{
  return self->_badgeViewWrappers;
}

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeViewWrappers, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_textBadge, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end