@interface VUIChannelBannerView
- (BOOL)_isSubscribed;
- (BOOL)isDescriptionPreferredOnPhoneSizeClass;
- (CGSize)_layoutSubviewsWithSize:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSArray)textLabels;
- (UIView)appleTVChannelLogoView;
- (UIView)bgColorView;
- (UIView)descriptionTextView;
- (UIView)subscribeButton;
- (VUIChannelBannerView)initWithFrame:(CGRect)a3;
- (VUILabel)disclaimerTextLabel;
- (VUIProductUberBackgroundView)bgImageView;
- (VUISeparatorView)separatorView;
- (double)_subscribeButtonHeight;
- (double)height;
- (double)logoHeight;
- (double)subscribeButtonHeight;
- (double)topThreshold;
- (void)_layoutLabels:(id)a3 withOrigin:(CGPoint)a4 maxWidth:(double)a5;
- (void)setAppleTVChannelLogoView:(id)a3;
- (void)setBgColorView:(id)a3;
- (void)setBgImageView:(id)a3;
- (void)setDescriptionTextView:(id)a3;
- (void)setDisclaimerTextLabel:(id)a3;
- (void)setHeight:(double)a3;
- (void)setIsDescriptionPreferredOnPhoneSizeClass:(BOOL)a3;
- (void)setLogoHeight:(double)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSubscribeButton:(id)a3;
- (void)setSubscribeButtonHeight:(double)a3;
- (void)setTextLabels:(id)a3;
- (void)setVuiBackgroundColor:(id)a3;
@end

@implementation VUIChannelBannerView

- (VUIChannelBannerView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VUIChannelBannerView;
  v3 = -[VUIChannelBannerView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUISeparatorView);
    v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 nativeScale];
    double v7 = 1.0 / v6;

    v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [(VUISeparatorView *)v4 setDarkColor:v8];

    [(VUISeparatorView *)v4 setLineHeight:v7];
    [(VUIChannelBannerView *)v3 setSeparatorView:v4];
    v9 = objc_opt_new();
    [(VUIChannelBannerView *)v3 setBgColorView:v9];
  }
  return v3;
}

- (void)setVuiBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUIChannelBannerView;
  id v4 = a3;
  [(VUIChannelBannerView *)&v5 setVuiBackgroundColor:v4];
  -[UIView setVuiBackgroundColor:](self->_bgColorView, "setVuiBackgroundColor:", v4, v5.receiver, v5.super_class);
}

- (void)setBgColorView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  bgColorView = self->_bgColorView;
  if (bgColorView != v5)
  {
    double v7 = v5;
    [(UIView *)bgColorView removeFromSuperview];
    if (v7 && ![(UIView *)v7 isDescendantOfView:self]) {
      [(VUIChannelBannerView *)self addSubview:v7];
    }
    objc_storeStrong((id *)&self->_bgColorView, a3);
    [(VUIChannelBannerView *)self setNeedsLayout];
    objc_super v5 = v7;
  }
}

- (void)setAppleTVChannelLogoView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  [(VUIChannelBannerView *)self vui_addSubview:v5 oldView:self->_appleTVChannelLogoView];
  if (self->_appleTVChannelLogoView != v5)
  {
    objc_storeStrong((id *)&self->_appleTVChannelLogoView, a3);
    [(VUIChannelBannerView *)self vui_setNeedsLayout];
  }
}

- (void)setSeparatorView:(id)a3
{
  objc_super v5 = (VUISeparatorView *)a3;
  [(VUIChannelBannerView *)self vui_addSubview:v5 oldView:self->_separatorView];
  if (self->_separatorView != v5)
  {
    objc_storeStrong((id *)&self->_separatorView, a3);
    [(VUIChannelBannerView *)self vui_setNeedsLayout];
  }
}

- (void)setTextLabels:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count] || -[NSArray count](self->_textLabels, "count"))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    p_textLabels = &self->_textLabels;
    double v7 = self->_textLabels;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v11++), "vui_removeFromSuperView");
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)p_textLabels, a3);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v12 = *p_textLabels;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          -[VUIChannelBannerView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), 0, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }

    [(VUIChannelBannerView *)self vui_setNeedsLayout];
  }
}

- (void)setDescriptionTextView:(id)a3
{
  id v5 = (UIView *)a3;
  [(VUIChannelBannerView *)self vui_addSubview:v5 oldView:self->_descriptionTextView];
  if (self->_descriptionTextView != v5)
  {
    objc_storeStrong((id *)&self->_descriptionTextView, a3);
    [(VUIChannelBannerView *)self vui_setNeedsLayout];
  }
}

- (void)setSubscribeButton:(id)a3
{
  id v5 = (UIView *)a3;
  [(VUIChannelBannerView *)self vui_addSubview:v5 oldView:self->_subscribeButton];
  if (self->_subscribeButton != v5)
  {
    objc_storeStrong((id *)&self->_subscribeButton, a3);
    [(VUIChannelBannerView *)self vui_setNeedsLayout];
  }
}

- (void)setDisclaimerTextLabel:(id)a3
{
  id v5 = (VUILabel *)a3;
  [(VUIChannelBannerView *)self vui_addSubview:v5 oldView:self->_disclaimerTextLabel];
  if (self->_disclaimerTextLabel != v5)
  {
    objc_storeStrong((id *)&self->_disclaimerTextLabel, a3);
    [(VUIChannelBannerView *)self vui_setNeedsLayout];
  }
}

- (void)setBgImageView:(id)a3
{
  id v5 = (VUIProductUberBackgroundView *)a3;
  if (self->_bgImageView != v5)
  {
    double v6 = v5;
    -[VUIChannelBannerView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    if (self->_bgImageView != v6) {
      objc_storeStrong((id *)&self->_bgImageView, a3);
    }
    [(VUIChannelBannerView *)self vui_sendSubviewToBack:v6];
    [(VUIChannelBannerView *)self vui_setNeedsLayout];
    id v5 = v6;
  }
}

- (void)setHeight:(double)a3
{
  if (self->_height != a3)
  {
    self->_height = a3;
    [(VUIChannelBannerView *)self vui_setNeedsLayout];
  }
}

- (double)topThreshold
{
  [(UIView *)self->_appleTVChannelLogoView frame];
  return CGRectGetMinY(*(CGRect *)&v2);
}

- (CGSize)_layoutSubviewsWithSize:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v286 = *MEMORY[0x1E4F143B8];
  double v6 = [(VUIChannelBannerView *)self vuiTraitCollection];
  char v7 = [v6 isAXEnabled];

  unint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClassForWindowWidth:", width);
  int v9 = [MEMORY[0x1E4FB3C90] isMac];
  int v10 = v9;
  if (v8 < 3) {
    char v11 = 1;
  }
  else {
    char v11 = v7;
  }
  if (v9) {
    double v12 = 20.0;
  }
  else {
    double v12 = 16.0;
  }
  char v13 = v11 & ~(_BYTE)v9;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:", width);
  double v15 = v14;
  double v257 = v16;
  double v17 = width - v16;
  int v18 = [MEMORY[0x1E4FB3C90] isTV];
  int v19 = v18;
  double v20 = 36.0;
  if (v13) {
    double v20 = 40.0;
  }
  if (v18) {
    double v21 = 68.0;
  }
  else {
    double v21 = v20;
  }
  double v22 = 38.0;
  if (!v18) {
    double v22 = v12;
  }
  double v223 = v22;
  if (v10 | v18) {
    double v23 = 32.0;
  }
  else {
    double v23 = 28.0;
  }
  [(VUISeparatorView *)self->_separatorView lineHeight];
  double v255 = v24;
  if (v19)
  {
    BOOL v25 = [(VUIChannelBannerView *)self _isSubscribed];
    BOOL v26 = !v25;
    double v27 = 58.0;
    double v28 = 44.0;
    if (v25) {
      double v27 = 44.0;
    }
    double v264 = v27;
    double v29 = 50.0;
  }
  else
  {
    BOOL v26 = (v13 & 1) == 0;
    double v30 = 32.0;
    if (v13) {
      double v30 = 28.0;
    }
    double v264 = v30;
    double v29 = 80.0;
    double v28 = 115.0;
  }
  if (v26) {
    double v31 = v29;
  }
  else {
    double v31 = v28;
  }
  double v230 = v15;
  double v32 = v17 - v15;
  double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v244 = *MEMORY[0x1E4F1DB28];
  double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v254 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v225 = *MEMORY[0x1E4F1DAD8];
  double v237 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(VUIChannelBannerView *)self logoHeight];
  double v36 = v35;
  double v252 = v34;
  CGFloat v253 = v33;
  if ([(VUIChannelBannerView *)self _isSubscribed])
  {
    appleTVChannelLogoView = self->_appleTVChannelLogoView;
    double v38 = 0.0;
    if (appleTVChannelLogoView)
    {
      -[UIView vui_sizeThatFits:](appleTVChannelLogoView, "vui_sizeThatFits:", v32, v36);
      double v39 = v33;
      CGFloat v41 = v40;
      CGFloat rect = v42;
      double x = v257 + (v32 - v40) * 0.5;
      double v243 = v254;
      double v245 = v39;
      double v246 = v39;
      double v43 = v244;
      double v238 = v244;
      double v239 = v34;
      double v234 = v39;
      double v235 = v254;
      double v256 = v34;
      double v236 = v244;
      *(double *)&v231[16] = v34;
      *(double *)&v231[24] = v254;
      double v38 = v264 + v31 + v42;
      *(double *)v231 = v244;
      *(double *)&v231[8] = v39;
      double v240 = v34;
      double v241 = v254;
      double v248 = v244;
      double y = v31;
      double v32 = 0.0;
    }
    else
    {
      double v243 = v254;
      double v245 = v33;
      double v246 = v33;
      double v43 = v244;
      double v238 = v244;
      double v239 = v34;
      double v234 = v33;
      double v235 = v254;
      double v256 = v34;
      double v236 = v244;
      *(double *)&v231[16] = v34;
      *(double *)&v231[24] = v254;
      *(double *)v231 = v244;
      *(double *)&v231[8] = v33;
      double v240 = v34;
      double v241 = v254;
      CGFloat rect = v254;
      double v64 = v33;
      CGFloat v41 = v34;
      double v248 = v244;
      double y = v64;
      double v32 = 0.0;
      double x = v244;
    }
    BOOL v51 = a4;
    goto LABEL_151;
  }
  double v265 = v32;
  if (v13)
  {
    v44 = self->_appleTVChannelLogoView;
    if (v44)
    {
      -[UIView vui_sizeThatFits:](v44, "vui_sizeThatFits:", v32, v36);
      CGFloat v46 = v45;
      double v47 = v257 + (v32 - v45) * 0.5;
      CGFloat rect = v48;
      double v49 = v31 + v48;
      p_super = self->_appleTVChannelLogoView;
      BOOL v51 = a4;
      double v52 = v254;
    }
    else
    {
      p_super = 0;
      double v49 = 0.0;
      double v52 = v254;
      CGFloat rect = v254;
      CGFloat v46 = v252;
      double v31 = v33;
      double v47 = v244;
      BOOL v51 = a4;
    }
    separatorView = self->_separatorView;
    double y = v31;
    if (separatorView)
    {
      -[VUISeparatorView setHidden:](separatorView, "setHidden:", 0, v52);
      v288.origin.double x = v47;
      v288.origin.double y = v31;
      v288.size.double width = v46;
      v288.size.double height = rect;
      CGRectGetMaxY(v288);
      VUIRoundValue();
      double v67 = v66;
      v68 = self->_separatorView;

      p_super = &v68->super.super;
      CGFloat v258 = v257;
      CGFloat v260 = v32;
      double v49 = v23 + v255 + v49;
      double v240 = v32;
      double v241 = v255;
      CGFloat v262 = v67;
      double v246 = v67;
      double v248 = v257;
    }
    else
    {
      double v255 = rect;
      CGFloat v260 = v46;
      CGFloat v262 = v31;
      CGFloat v258 = v47;
      double v241 = v52;
      double v240 = v252;
      double v246 = v253;
      double v248 = v244;
    }
    double x = v47;
    double v227 = v46;
    if ([(VUIChannelBannerView *)self isDescriptionPreferredOnPhoneSizeClass]
      && (descriptionTextView = self->_descriptionTextView) != 0)
    {
      [(UIView *)descriptionTextView setHidden:0];
      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      v74 = self->_textLabels;
      uint64_t v75 = [(NSArray *)v74 countByEnumeratingWithState:&v279 objects:v285 count:16];
      CGFloat v76 = v253;
      if (v75)
      {
        uint64_t v77 = v75;
        uint64_t v78 = *(void *)v280;
        do
        {
          for (uint64_t i = 0; i != v77; ++i)
          {
            if (*(void *)v280 != v78) {
              objc_enumerationMutation(v74);
            }
            [*(id *)(*((void *)&v279 + 1) + 8 * i) setHidden:1];
          }
          uint64_t v77 = [(NSArray *)v74 countByEnumeratingWithState:&v279 objects:v285 count:16];
        }
        while (v77);
      }

      -[UIView vui_sizeThatFits:](self->_descriptionTextView, "vui_sizeThatFits:", v32, 1.79769313e308);
      CGFloat v81 = v80;
      CGFloat v83 = v82;
      [(UIView *)self->_descriptionTextView topMarginWithBaselineMargin:v21];
      double v85 = v84;
      v289.origin.double x = v258;
      v289.size.double width = v260;
      v289.origin.double y = v262;
      v289.size.double height = v255;
      CGRectGetMaxY(v289);
      VUIRoundValue();
      CGFloat v87 = v86;
      v88 = self->_descriptionTextView;

      double v89 = v257;
      v290.origin.double x = v257;
      v290.origin.double y = v87;
      v290.size.double width = v81;
      v290.size.double height = v83;
      double v90 = v85 + CGRectGetHeight(v290);
      double v32 = v265;
      p_super = v88;
      *(CGFloat *)&v231[16] = v81;
      *(CGFloat *)&v231[24] = v83;
      double v255 = v83;
      double v49 = v49 + v90;
      CGFloat v258 = v257;
      CGFloat v260 = v81;
      CGFloat v262 = v87;
      CGFloat v91 = v87;
      BOOL v51 = a4;
      double v43 = v244;
      double v92 = v254;
    }
    else if (self->_textLabels)
    {
      double v220 = width;
      double v93 = v225;
      double v94 = v237;
      [(UIView *)self->_descriptionTextView setHidden:1];
      long long v277 = 0u;
      long long v278 = 0u;
      long long v275 = 0u;
      long long v276 = 0u;
      obja = self->_textLabels;
      uint64_t v95 = [(NSArray *)obja countByEnumeratingWithState:&v275 objects:v284 count:16];
      if (v95)
      {
        uint64_t v96 = v95;
        v97 = 0;
        uint64_t v98 = *(void *)v276;
        double v99 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v96; ++j)
          {
            if (*(void *)v276 != v98) {
              objc_enumerationMutation(obja);
            }
            v101 = *(void **)(*((void *)&v275 + 1) + 8 * j);
            [v101 setHidden:0];
            v102 = [v101 textLayout];
            [v102 margin];
            double v104 = v103;
            v105 = [(NSArray *)self->_textLabels firstObject];

            if (v105 == v101) {
              double v106 = v21;
            }
            else {
              double v106 = v104;
            }
            [v101 topMarginToLabel:v97 withBaselineMargin:v106];
            double v108 = v107;
            double v32 = v265;
            objc_msgSend(v101, "sizeThatFits:", v265, 0.0);
            double v110 = v109;
            v111 = [(NSArray *)self->_textLabels firstObject];

            if (v111 == v101)
            {
              v291.origin.double x = v258;
              v291.size.double width = v260;
              v291.origin.double y = v262;
              v291.size.double height = v255;
              CGRectGetMaxY(v291);
              VUIRoundValue();
              double v94 = v112;
              double v49 = v49 + v108;
              double v93 = v257;
            }
            else
            {
              double v99 = v99 + v108;
            }
            id v113 = v101;

            double v99 = v110 + v99;
            v97 = (UIView *)v113;

            p_super = v97;
          }
          uint64_t v96 = [(NSArray *)obja countByEnumeratingWithState:&v275 objects:v284 count:16];
          p_super = v97;
        }
        while (v96);
      }
      else
      {
        v97 = 0;
        double v99 = 0.0;
      }

      double v49 = v99 + v49;
      double v255 = v99;
      CGFloat v260 = v32;
      CGFloat v262 = v94;
      double v237 = v94;
      double v225 = v93;
      CGFloat v258 = v93;
      CGFloat v76 = v253;
      double v92 = v254;
      *(double *)&v231[16] = v252;
      *(double *)&v231[24] = v254;
      CGFloat v91 = v253;
      double v43 = v244;
      double v89 = v244;
      double width = v220;
      BOOL v51 = a4;
    }
    else
    {
      CGFloat v76 = v253;
      double v92 = v254;
      *(double *)&v231[16] = v252;
      *(double *)&v231[24] = v254;
      CGFloat v91 = v253;
      double v43 = v244;
      double v89 = v244;
    }
    double objb = v49;
    *(double *)v231 = v89;
    *(CGFloat *)&v231[8] = v91;
    if (self->_subscribeButton)
    {
      [(VUIChannelBannerView *)self _subscribeButtonHeight];
      CGFloat v143 = v142;
      objc_opt_class();
      double v144 = v32;
      if (objc_opt_isKindOfClass())
      {
        [(UIView *)self->_subscribeButton width];
        if (v145 == 0.0) {
          double v144 = v32;
        }
        else {
          double v144 = v145;
        }
      }
      CGFloat v146 = v257 + (v32 - v144) * 0.5;
      [(UIView *)p_super bottomMarginWithBaselineMargin:30.0];
      double v148 = objb + v147;
      v301.origin.double x = v258;
      v301.size.double width = v260;
      v301.origin.double y = v262;
      v301.size.double height = v255;
      CGRectGetMaxY(v301);
      double v32 = v265;
      VUIRoundValue();
      CGFloat v150 = v149;
      v302.origin.double x = v146;
      v302.origin.double y = v150;
      v302.size.double width = v144;
      v302.size.double height = v143;
      double objb = v148 + CGRectGetHeight(v302);
      double v256 = v144;
      CGFloat v258 = v146;
      CGFloat v260 = v144;
      double v236 = v146;
      CGFloat v151 = v143;
      CGFloat v262 = v150;
      double v234 = v150;
      double v152 = v252;
      CGFloat v76 = v253;
      double v92 = v254;
    }
    else
    {
      CGFloat v143 = v255;
      CGFloat v151 = v92;
      double v152 = v252;
      double v256 = v252;
      double v234 = v76;
      double v236 = v43;
    }
    double v235 = v151;
    disclaimerTextLabel = self->_disclaimerTextLabel;
    double v243 = v92;
    double v245 = v76;
    double v154 = v43;
    if (disclaimerTextLabel)
    {
      -[VUILabel sizeThatFits:](disclaimerTextLabel, "sizeThatFits:", v32, 0.0);
      CGFloat v156 = v155;
      [(VUILabel *)self->_disclaimerTextLabel topMarginWithBaselineMargin:v223];
      double v158 = v157;
      v303.origin.double x = v258;
      v303.size.double width = v260;
      v303.origin.double y = v262;
      v303.size.double height = v143;
      CGRectGetMaxY(v303);
      VUIRoundValue();
      CGFloat v160 = v159;
      [(VUILabel *)self->_disclaimerTextLabel bottomMarginWithBaselineMargin:24.0];
      double v162 = v161;
      double v154 = v257;
      v304.origin.double x = v257;
      double v245 = v160;
      v304.origin.double y = v160;
      v304.size.double width = v265;
      double v243 = v156;
      v304.size.double height = v156;
      double v163 = v158 + CGRectGetHeight(v304);
      double v32 = v265;
      double v264 = v162 + v163;
      double v152 = v265;
    }
    double v238 = v154;
    double v239 = v152;
    double v38 = objb + v264;

    CGFloat v41 = v227;
    goto LABEL_151;
  }
  if (v8 == 3) {
    uint64_t v53 = 3;
  }
  else {
    uint64_t v53 = 5;
  }
  if (v8 == 3) {
    double v54 = 3.0;
  }
  else {
    double v54 = 4.0;
  }
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_collectionInteritemSpace:gridType:windowWidth:", v53, 0, width);
  obuint64_t j = floor((v265 - (v54 + -1.0) * v55) / v54);
  v56 = self->_appleTVChannelLogoView;
  double v232 = v265 - obj - v55;
  if (v56)
  {
    -[UIView vui_sizeThatFits:](v56, "vui_sizeThatFits:");
    double v58 = v57;
    double v60 = v59;
    double v61 = v31 + v59;
    double v62 = v31;
    double v63 = v257;
  }
  else
  {
    double v61 = 0.0;
    double v58 = v34;
    double v62 = v33;
    double v60 = v254;
    double v63 = v244;
  }
  double x = v63;
  double y = v62;
  double v69 = v58;
  double v70 = v60;
  CGRectGetMaxY(*(CGRect *)&v63);
  VUIRoundValue();
  double v263 = v71;
  if (self->_descriptionTextView) {
    BOOL v72 = 0;
  }
  else {
    BOOL v72 = self->_textLabels == 0;
  }
  double v222 = v23 + v61;
  [(VUISeparatorView *)self->_separatorView setHidden:v72];
  v114 = self->_separatorView;
  double v115 = 0.0;
  double v228 = v58;
  CGFloat rect = v60;
  double v233 = v23;
  if (v114 && ([(VUISeparatorView *)v114 isHidden] & 1) == 0)
  {
    v292.size.double height = 0.0;
    v292.origin.double x = v257;
    v292.origin.double y = v263;
    v292.size.double width = v265;
    CGFloat MaxY = CGRectGetMaxY(v292);
    v116 = self->_separatorView;
    double v115 = v233;
    double v119 = v255;
    double v222 = v255 + v222;
    CGFloat v261 = v255;
    double v263 = MaxY;
    double v120 = v265;
    CGFloat v118 = MaxY;
    double v121 = v257;
    double v117 = v254;
  }
  else
  {
    v116 = 0;
    CGFloat v261 = 0.0;
    CGFloat v118 = v253;
    double v117 = v254;
    double v119 = v254;
    double v120 = v34;
    double v121 = v244;
  }
  double v240 = v120;
  double v241 = v119;
  v123 = self->_disclaimerTextLabel;
  double v248 = v121;
  double v221 = width;
  if (v123)
  {
    double v124 = v118;
    -[VUILabel sizeThatFits:](v123, "sizeThatFits:", obj, 0.0);
    CGFloat v126 = v125;
    double v127 = width - obj - v230;
    double v128 = 50.0;
    if (!v10) {
      double v128 = v233;
    }
    [(VUILabel *)self->_disclaimerTextLabel bottomMarginWithBaselineMargin:v128];
    v293.origin.double x = v257;
    v293.size.double height = v261;
    v293.origin.double y = v263;
    v293.size.double width = v265;
    CGRectGetMinY(v293);
    v294.origin.double x = v127;
    v294.origin.double y = v253;
    v294.size.double width = obj;
    v294.size.double height = v126;
    CGRectGetHeight(v294);
    VUIRoundValue();
    double v130 = v129;
    v131 = self->_disclaimerTextLabel;

    CGFloat v118 = v124;
    double v132 = y;
    double v60 = rect;
    double v121 = v248;
    double v117 = v254;
    double v243 = v126;
    CGFloat v261 = v126;
    double v263 = v130;
    double v133 = v223;
    CGFloat v134 = obj;
    double v238 = v127;
    double v239 = obj;
    double v245 = v130;
    CGFloat v259 = v127;
  }
  else
  {
    double v133 = v115;
    CGFloat v259 = v257;
    double v243 = v117;
    double v245 = v253;
    double v238 = v244;
    double v239 = v34;
    CGFloat v134 = v265;
    double v132 = y;
    v131 = (VUILabel *)v116;
  }
  if (self->_subscribeButton)
  {
    double v247 = v118;
    [(VUIChannelBannerView *)self _subscribeButtonHeight];
    CGFloat v136 = v135;
    double width = v221;
    v295.origin.double y = v263;
    v295.size.double width = v134;
    v295.origin.double x = v259;
    v295.size.double height = v261;
    CGRectGetMinY(v295);
    [(VUILabel *)v131 topMarginWithBaselineMargin:v133];
    v296.origin.double x = v221 - obj - v230;
    v296.origin.double y = v253;
    v296.size.double width = obj;
    v296.size.double height = v136;
    CGRectGetHeight(v296);
    VUIRoundValue();
    double v138 = v137;
    double v235 = v136;
    double v236 = v221 - obj - v230;
    if (self->_subscribeButton
      && (v297.origin.double x = v221 - obj - v230,
          v297.origin.double y = v138,
          v297.size.double width = obj,
          v297.size.double height = v136,
          CGRectGetMinY(v297) < v31))
    {
      v298.origin.double x = v221 - obj - v230;
      v298.origin.double y = v138;
      v298.size.double width = obj;
      v298.size.double height = v136;
      double v139 = v31 - CGRectGetMinY(v298);
      v299.origin.double x = v221 - obj - v230;
      double v234 = v138 + v139;
      v299.origin.double y = v138 + v139;
      v299.size.double width = obj;
      v299.size.double height = v136;
      double v140 = CGRectGetMaxY(v299);
      if (self->_disclaimerTextLabel)
      {
        v300.origin.double x = v238;
        v300.origin.double y = v245 + v139;
        v300.size.double width = v239;
        v300.size.double height = v243;
        double v140 = CGRectGetMaxY(v300);
        CGFloat v259 = v238;
        CGFloat v261 = v243;
        CGFloat v134 = v239;
        double v263 = v245 + v139;
        double v141 = v245 + v139;
        double v58 = v228;
      }
      else
      {
        double v58 = v228;
        double v141 = v245;
      }
      double v245 = v141;
      double v222 = v233 + v140;
      v164 = self->_separatorView;
      if (v164 && ([(VUISeparatorView *)v164 isHidden] & 1) == 0)
      {
        v318.origin.double x = v259;
        v318.size.double height = v261;
        v318.origin.double y = v263;
        v318.size.double width = v134;
        CGRectGetMaxY(v318);
        VUIRoundValue();
        CGFloat v118 = v219;
        double v222 = v255 + v222;
        double v256 = obj;
        double v117 = v254;
        double v121 = v248;
        double v132 = y;
        goto LABEL_110;
      }
      double v256 = obj;
    }
    else
    {
      double v234 = v138;
      double v256 = obj;
      double v58 = v228;
    }
    double v117 = v254;
    double v121 = v248;
    double v132 = y;
    CGFloat v118 = v247;
LABEL_110:
    double v60 = rect;
    goto LABEL_111;
  }
  double v235 = v117;
  double v236 = v244;
  double v256 = v252;
  double v234 = v253;
  double width = v221;
LABEL_111:
  if (self->_appleTVChannelLogoView)
  {
    v165 = self->_separatorView;
    if (v165) {
      double v166 = v241;
    }
    else {
      double v166 = v60;
    }
    if (v165) {
      CGFloat v134 = v240;
    }
    else {
      CGFloat v134 = v58;
    }
    if (v165) {
      double v132 = v118;
    }
    CGFloat v261 = v166;
    double v263 = v132;
    double v167 = x;
    if (v165) {
      double v167 = v121;
    }
    CGFloat v259 = v167;
  }
  double v246 = v118;
  v168 = self->_descriptionTextView;
  if (v168)
  {
    [(UIView *)v168 setHidden:0];
    -[UIView vui_sizeThatFits:](self->_descriptionTextView, "vui_sizeThatFits:", v232, 1.79769313e308);
    CGFloat v170 = v169;
    CGFloat v172 = v171;
    double v173 = 10.0;
    if (!+[VUIUtilities isSUIEnabled])
    {
      [(UIView *)self->_descriptionTextView topMarginWithBaselineMargin:v21];
      double v173 = v174;
    }
    v305.origin.double x = v259;
    v305.size.double height = v261;
    v305.origin.double y = v263;
    CGFloat v175 = v134;
    v305.size.double width = v134;
    CGRectGetMaxY(v305);
    VUIRoundValue();
    v306.origin.double y = v176;
    v306.origin.double x = v257;
    *(CGFloat *)&v231[8] = v306.origin.y;
    v306.size.double width = v170;
    *(CGFloat *)&v231[24] = v172;
    v306.size.double height = v172;
    double v177 = v173 + CGRectGetHeight(v306);
    [(UIView *)self->_descriptionTextView bottomMarginWithBaselineMargin:v264];
    double v222 = v222 + v177 + v178;
  }
  else
  {
    CGFloat v175 = v134;
    *(double *)&v231[24] = v117;
    CGFloat v170 = v252;
    *(CGFloat *)&v231[8] = v253;
    double v257 = v244;
  }
  *(CGFloat *)&v231[16] = v170;
  textLabels = self->_textLabels;
  if (textLabels)
  {
    v266 = v131;
    double v180 = width;
    double v181 = v225;
    double v182 = v237;
    long long v273 = 0u;
    long long v274 = 0u;
    long long v271 = 0u;
    long long v272 = 0u;
    v183 = textLabels;
    uint64_t v184 = [(NSArray *)v183 countByEnumeratingWithState:&v271 objects:v283 count:16];
    if (v184)
    {
      uint64_t v185 = v184;
      id v186 = 0;
      uint64_t v187 = *(void *)v272;
      double v188 = 0.0;
      double v189 = v180 - obj - v230;
      do
      {
        uint64_t v190 = 0;
        v191 = v186;
        do
        {
          if (*(void *)v272 != v187) {
            objc_enumerationMutation(v183);
          }
          v192 = *(void **)(*((void *)&v271 + 1) + 8 * v190);
          [v192 setHidden:0];
          v193 = [v192 textLayout];
          [v193 margin];
          double v195 = v194;
          v196 = [(NSArray *)self->_textLabels firstObject];

          if (v196 == v192) {
            double v197 = v21;
          }
          else {
            double v197 = v195;
          }
          [v192 topMarginToLabel:v191 withBaselineMargin:v197];
          double v199 = v198;
          objc_msgSend(v192, "sizeThatFits:", obj, 0.0);
          double v201 = v200;
          v202 = [(NSArray *)self->_textLabels firstObject];

          if (v202 == v192)
          {
            v307.origin.double x = v259;
            v307.size.double height = v261;
            v307.origin.double y = v263;
            v307.size.double width = v175;
            double v182 = v199 + CGRectGetMaxY(v307);
            double v181 = v189;
          }
          else
          {
            double v188 = v188 + v199;
          }
          id v186 = v192;

          double v188 = v201 + v188;
          id v203 = [(NSArray *)self->_textLabels lastObject];

          if (v203 == v186)
          {
            [v186 bottomMarginWithBaselineMargin:v264];
            double v188 = v188 + v204;
          }

          ++v190;
          v191 = v186;
        }
        while (v185 != v190);
        uint64_t v185 = [(NSArray *)v183 countByEnumeratingWithState:&v271 objects:v283 count:16];
      }
      while (v185);
    }
    else
    {
      id v186 = 0;
      double v188 = 0.0;
    }
    double v225 = v181;

    double v237 = v182;
    double v205 = v188 + v182;
    double v38 = v222;
    if (v222 < v205) {
      double v38 = v205;
    }

    double width = v221;
    v131 = v266;
  }
  else
  {
    double v38 = v222;
  }

  *(double *)v231 = v257;
  double v32 = obj;
  BOOL v51 = a4;
  CGFloat v41 = v228;
  double v43 = v244;
LABEL_151:
  [(VUIChannelBannerView *)self height];
  if (v206 <= 0.0)
  {
    double v207 = v38;
  }
  else
  {
    double v207 = v206;
    if (!v51)
    {
      CGFloat v208 = v206 - v38;
      v308.origin.double x = x;
      v308.origin.double y = y;
      v308.size.double height = rect;
      v308.size.double width = v41;
      CGRect v309 = CGRectOffset(v308, 0.0, v208);
      double x = v309.origin.x;
      double y = v309.origin.y;
      CGFloat rect = v309.size.height;
      CGFloat v41 = v309.size.width;
      v309.size.double height = v235;
      v309.origin.double x = v236;
      v309.origin.double y = v234;
      v309.size.double width = v256;
      CGRect v310 = CGRectOffset(v309, 0.0, v208);
      double v235 = v310.size.height;
      double v236 = v310.origin.x;
      double v234 = v310.origin.y;
      double v256 = v310.size.width;
      v310.origin.double x = v238;
      v310.size.double width = v239;
      v310.origin.double y = v245;
      v310.size.double height = v243;
      CGRect v311 = CGRectOffset(v310, 0.0, v208);
      double v238 = v311.origin.x;
      double v239 = v311.size.width;
      double v245 = v311.origin.y;
      double v243 = v311.size.height;
      v311.origin.double y = v246;
      v311.origin.double x = v248;
      v311.size.double width = v240;
      v311.size.double height = v241;
      CGRect v312 = CGRectOffset(v311, 0.0, v208);
      double v246 = v312.origin.y;
      double v248 = v312.origin.x;
      double v240 = v312.size.width;
      double v241 = v312.size.height;
      double v237 = v237 + v208;
      *(CGRect *)v231 = CGRectOffset(*(CGRect *)v231, 0.0, v208);
    }
  }
  bgImageView = self->_bgImageView;
  if (v207 >= height) {
    double v210 = v207;
  }
  else {
    double v210 = height;
  }
  if (bgImageView) {
    double v211 = 0.0;
  }
  else {
    double v211 = v43;
  }
  if (bgImageView) {
    double v212 = 0.0;
  }
  else {
    double v212 = v253;
  }
  double v213 = width;
  if (bgImageView)
  {
    double v214 = v210;
  }
  else
  {
    double width = v252;
    double v214 = v254;
  }
  if (!v51)
  {
    if (v207 >= height)
    {
      double v229 = v41;
      double v215 = v237;
      double v216 = rect;
    }
    else
    {
      double objc = v214;
      v313.origin.double x = x;
      v313.origin.double y = y;
      v313.size.double height = rect;
      v313.size.double width = v41;
      CGRect v314 = CGRectOffset(v313, 0.0, height - v207);
      double x = v314.origin.x;
      double y = v314.origin.y;
      CGFloat recta = v314.size.height;
      double v229 = v314.size.width;
      v314.size.double height = v235;
      v314.origin.double x = v236;
      v314.origin.double y = v234;
      v314.size.double width = v256;
      CGRect v315 = CGRectOffset(v314, 0.0, height - v207);
      double v235 = v315.size.height;
      double v236 = v315.origin.x;
      double v234 = v315.origin.y;
      double v256 = v315.size.width;
      v315.origin.double x = v238;
      v315.size.double width = v239;
      v315.origin.double y = v245;
      v315.size.double height = v243;
      CGRect v316 = CGRectOffset(v315, 0.0, height - v207);
      double v238 = v316.origin.x;
      double v239 = v316.size.width;
      double v245 = v316.origin.y;
      double v243 = v316.size.height;
      v316.origin.double y = v246;
      v316.origin.double x = v248;
      v316.size.double width = v240;
      v316.size.double height = v241;
      CGRect v317 = CGRectOffset(v316, 0.0, height - v207);
      double v246 = v317.origin.y;
      double v248 = v317.origin.x;
      double v240 = v317.size.width;
      double v241 = v317.size.height;
      double v215 = v237 + height - v207;
      double v216 = recta;
      *(CGRect *)v231 = CGRectOffset(*(CGRect *)v231, 0.0, height - v207);
      double v214 = objc;
      bgImageView = self->_bgImageView;
    }
    -[VUIProductUberBackgroundView setFrame:](bgImageView, "setFrame:", v211, v212, width, v214);
    -[UIView setFrame:](self->_appleTVChannelLogoView, "setFrame:", x, y, v229, v216);
    -[UIView setFrame:](self->_subscribeButton, "setFrame:", v236, v234, v256, v235);
    -[VUILabel setFrame:](self->_disclaimerTextLabel, "setFrame:", v238, v245, v239, v243);
    -[VUISeparatorView setFrame:](self->_separatorView, "setFrame:", v248, v246, v240, v241);
    -[VUIChannelBannerView _layoutLabels:withOrigin:maxWidth:](self, "_layoutLabels:withOrigin:maxWidth:", self->_textLabels, v225, v215, v32);
    -[UIView setFrame:](self->_descriptionTextView, "setFrame:", *(double *)v231, *(double *)&v231[8], *(double *)&v231[16], *(double *)&v231[24]);
  }
  double v217 = v213;
  double v218 = v207;
  result.double height = v218;
  result.double width = v217;
  return result;
}

- (BOOL)_isSubscribed
{
  return !self->_descriptionTextView
      && ((textLabels = self->_textLabels) == 0 || ![(NSArray *)textLabels count])
      && !self->_subscribeButton
      && self->_disclaimerTextLabel == 0;
}

- (double)_subscribeButtonHeight
{
  if (!+[VUIUtilities isSUIEnabled])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = self->_subscribeButton;
      id v5 = [(UIView *)v4 textContentView];
      double v6 = v5;
      if (v5)
      {
        char v7 = [v5 textLayout];
        uint64_t v8 = [v7 maximumContentSizeCategory];

LABEL_10:
        int v9 = (void *)MEMORY[0x1E4FB3C70];
        [(UIView *)v4 height];
        double v11 = v10;
        double v12 = [(VUIChannelBannerView *)self vuiTraitCollection];
        [v9 scaleContentSizeValue:v12 forTraitCollection:v8 maximumContentSizeCategory:v11];
        double v14 = v13;

        return v14;
      }
    }
    else
    {
      id v4 = 0;
      double v6 = 0;
    }
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  [(VUIChannelBannerView *)self subscribeButtonHeight];
  return result;
}

- (void)_layoutLabels:(id)a3 withOrigin:(CGPoint)a4 maxWidth:(double)a5
{
  CGFloat y = a4.y;
  double x = a4.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v27;
    double v13 = y;
    do
    {
      uint64_t v14 = 0;
      double v15 = v11;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v8);
        }
        double v16 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        double v17 = [v16 textLayout];
        [v17 margin];
        double v19 = v18;
        objc_msgSend(v16, "vui_sizeThatFits:", a5, 0.0);
        double v21 = v20;
        double v22 = [v8 firstObject];

        if (v22 == v16)
        {
          double v24 = y;
        }
        else
        {
          if (v15) {
            [v16 topMarginToLabel:v15 withBaselineMargin:v19];
          }
          else {
            [v16 topMarginWithBaselineMargin:v19];
          }
          double v13 = v13 + v23;
          VUIRoundValue();
          double v24 = v25;
        }
        objc_msgSend(v16, "setFrame:", x, v24, a5, v21);
        id v11 = v16;

        double v13 = v21 + v13;
        ++v14;
        double v15 = v11;
      }
      while (v10 != v14);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }
}

- (UIView)appleTVChannelLogoView
{
  return self->_appleTVChannelLogoView;
}

- (UIView)subscribeButton
{
  return self->_subscribeButton;
}

- (VUILabel)disclaimerTextLabel
{
  return self->_disclaimerTextLabel;
}

- (UIView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (NSArray)textLabels
{
  return self->_textLabels;
}

- (VUIProductUberBackgroundView)bgImageView
{
  return self->_bgImageView;
}

- (UIView)bgColorView
{
  return self->_bgColorView;
}

- (double)logoHeight
{
  return self->_logoHeight;
}

- (void)setLogoHeight:(double)a3
{
  self->_logoHeight = a3;
}

- (BOOL)isDescriptionPreferredOnPhoneSizeClass
{
  return self->_isDescriptionPreferredOnPhoneSizeClass;
}

- (void)setIsDescriptionPreferredOnPhoneSizeClass:(BOOL)a3
{
  self->_isDescriptionPreferredOnPhoneSizeClass = a3;
}

- (double)height
{
  return self->_height;
}

- (double)subscribeButtonHeight
{
  return self->_subscribeButtonHeight;
}

- (void)setSubscribeButtonHeight:(double)a3
{
  self->_subscribeButtonHeight = a3;
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_bgColorView, 0);
  objc_storeStrong((id *)&self->_bgImageView, 0);
  objc_storeStrong((id *)&self->_textLabels, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong((id *)&self->_disclaimerTextLabel, 0);
  objc_storeStrong((id *)&self->_subscribeButton, 0);
  objc_storeStrong((id *)&self->_appleTVChannelLogoView, 0);
}

@end