@interface TFBetaAppLaunchScreenViewSpecification
- (CGSize)headerIconViewSize;
- (TFBetaAppLaunchScreenViewSpecification)initWithTraitCollection:(id)a3;
- (UIColor)backgroundColor;
- (UIColor)buttonTintColor;
- (UIColor)overButtonTintTextColor;
- (UIColor)textColor;
- (UIEdgeInsets)buttonModuleContentLayoutInsets;
- (UIEdgeInsets)scrollViewContentLayoutInsets;
- (UIFont)bodyTextFont;
- (UIFont)bodyTitleFont;
- (UIFont)primaryButtonTextFont;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (UIFontMetrics)bodyTextFontMetrics;
- (UIFontMetrics)bodyTitleFontMetrics;
- (UIFontMetrics)primaryButtonTextFontMetrics;
- (UIFontMetrics)subtitleFontMetrics;
- (UIFontMetrics)titleFontMetrics;
- (double)bodyTitleLabelLastBaselineToBodyTextLabelFirstBaseline;
- (double)bottommostLabelLastBaselineToImageTopEdge;
- (double)bottommostLabelLastBaselineToLockupTopEdge;
- (double)buttonBackgroundTopEdgeToPrimaryButtonTopEdge;
- (double)buttonHeight;
- (double)interButtonPadding;
- (double)lockupBottomEdgeToBodyTitleLabelFirstBaseline;
- (double)primaryButtonCornerRadius;
- (double)titleLabelLastBaselineToSubtitleLabelFirstBaseline;
- (double)viewTopMarginAdditionalPaddingAsFractionOfTotalHeight;
- (double)viewTopMarginToTitleLabelFirstBaseline;
- (id)_bodyTextFontStyle;
- (id)_bodyTitleFontStyle;
- (id)_createBodyTextFontForTraitCollection:(id)a3;
- (id)_createBodyTitleFontForTraitCollection:(id)a3;
- (id)_createPrimaryButtonTextFontForTraitCollection:(id)a3;
- (id)_createSubtitleFontForTraitCollection:(id)a3;
- (id)_createTitleFontForTraitCollection:(id)a3;
- (id)_primaryButtonTextFontStyle;
- (id)_subtitleFontStyle;
- (id)_titleFontStyle;
@end

@implementation TFBetaAppLaunchScreenViewSpecification

- (TFBetaAppLaunchScreenViewSpecification)initWithTraitCollection:(id)a3
{
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)TFBetaAppLaunchScreenViewSpecification;
  v5 = [(TFBetaAppLaunchScreenViewSpecification *)&v77 init];
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x263F1C668];
    v8 = [(TFBetaAppLaunchScreenViewSpecification *)v5 _titleFontStyle];
    uint64_t v9 = [v7 metricsForTextStyle:v8];
    titleFontMetrics = v6->_titleFontMetrics;
    v6->_titleFontMetrics = (UIFontMetrics *)v9;

    v11 = (void *)MEMORY[0x263F1C668];
    v12 = [(TFBetaAppLaunchScreenViewSpecification *)v6 _subtitleFontStyle];
    uint64_t v13 = [v11 metricsForTextStyle:v12];
    subtitleFontMetrics = v6->_subtitleFontMetrics;
    v6->_subtitleFontMetrics = (UIFontMetrics *)v13;

    v15 = (void *)MEMORY[0x263F1C668];
    v16 = [(TFBetaAppLaunchScreenViewSpecification *)v6 _bodyTitleFontStyle];
    uint64_t v17 = [v15 metricsForTextStyle:v16];
    bodyTitleFontMetrics = v6->_bodyTitleFontMetrics;
    v6->_bodyTitleFontMetrics = (UIFontMetrics *)v17;

    v19 = (void *)MEMORY[0x263F1C668];
    v20 = [(TFBetaAppLaunchScreenViewSpecification *)v6 _bodyTextFontStyle];
    uint64_t v21 = [v19 metricsForTextStyle:v20];
    bodyTextFontMetrics = v6->_bodyTextFontMetrics;
    v6->_bodyTextFontMetrics = (UIFontMetrics *)v21;

    v23 = (void *)MEMORY[0x263F1C668];
    v24 = [(TFBetaAppLaunchScreenViewSpecification *)v6 _primaryButtonTextFontStyle];
    uint64_t v25 = [v23 metricsForTextStyle:v24];
    primaryButtonTextFontMetrics = v6->_primaryButtonTextFontMetrics;
    v6->_primaryButtonTextFontMetrics = (UIFontMetrics *)v25;

    uint64_t v27 = [(TFBetaAppLaunchScreenViewSpecification *)v6 _createTitleFontForTraitCollection:v4];
    titleFont = v6->_titleFont;
    v6->_titleFont = (UIFont *)v27;

    uint64_t v29 = [(TFBetaAppLaunchScreenViewSpecification *)v6 _createSubtitleFontForTraitCollection:v4];
    subtitleFont = v6->_subtitleFont;
    v6->_subtitleFont = (UIFont *)v29;

    uint64_t v31 = [(TFBetaAppLaunchScreenViewSpecification *)v6 _createBodyTitleFontForTraitCollection:v4];
    bodyTitleFont = v6->_bodyTitleFont;
    v6->_bodyTitleFont = (UIFont *)v31;

    uint64_t v33 = [(TFBetaAppLaunchScreenViewSpecification *)v6 _createBodyTextFontForTraitCollection:v4];
    bodyTextFont = v6->_bodyTextFont;
    v6->_bodyTextFont = (UIFont *)v33;

    uint64_t v35 = [(TFBetaAppLaunchScreenViewSpecification *)v6 _createPrimaryButtonTextFontForTraitCollection:v4];
    primaryButtonTextFont = v6->_primaryButtonTextFont;
    v6->_primaryButtonTextFont = (UIFont *)v35;

    v6->_viewTopMarginAdditionalPaddingAsFractionOfTotalHeight = 0.05;
    v37 = v6->_titleFontMetrics;
    v38.n128_u64[0] = 24.0;
    PPMScaledFloatValue(v39, v40, v38);
    uint64_t v41 = -[UIFontMetrics scaledValueForValue:](v37, "scaledValueForValue:");
    v6->_viewTopMarginToTitleLabelFirstBaseline = v42;
    v43 = v6->_subtitleFontMetrics;
    v44.n128_u64[0] = 0x4044000000000000;
    PPMScaledFloatValue(v41, v45, v44);
    uint64_t v46 = -[UIFontMetrics scaledValueForValue:](v43, "scaledValueForValue:");
    v6->_titleLabelLastBaselineToSubtitleLabelFirstBaseline = v47;
    v6->_bottommostLabelLastBaselineToLockupTopEdge = 44.0;
    v48.n128_u64[0] = 0x4040000000000000;
    uint64_t v50 = PPMScaledFloatValue(v46, v49, v48);
    v6->_bottommostLabelLastBaselineToImageTopEdge = v51;
    v52 = v6->_bodyTitleFontMetrics;
    v53.n128_u64[0] = 0x4044000000000000;
    PPMScaledFloatValue(v50, v54, v53);
    uint64_t v55 = -[UIFontMetrics scaledValueForValue:](v52, "scaledValueForValue:");
    v6->_lockupBottomEdgeToBodyTitleLabelFirstBaseline = v56;
    v57 = v6->_bodyTextFontMetrics;
    v58.n128_u64[0] = 28.0;
    PPMScaledFloatValue(v55, v59, v58);
    uint64_t v60 = -[UIFontMetrics scaledValueForValue:](v57, "scaledValueForValue:");
    v6->_bodyTitleLabelLastBaselineToBodyTextLabelFirstBaseline = v61;
    v62.n128_u64[0] = 20.0;
    uint64_t v64 = PPMScaledFloatValue(v60, v63, v62);
    v6->_buttonBackgroundTopEdgeToPrimaryButtonTopEdge = v65;
    v66.n128_u64[0] = 0x4049000000000000;
    uint64_t v68 = PPMScaledFloatValue(v64, v67, v66);
    v6->_buttonHeight = v69;
    v70.n128_u64[0] = 8.0;
    PPMScaledFloatValue(v68, v71, v70);
    v6->_interButtonPadding = v72;
    uint64_t v73 = [v4 horizontalSizeClass];
    v6->_scrollViewContentLayoutInsets.top = 0.0;
    double v74 = 34.0;
    if (v73 == 2) {
      double v74 = 140.0;
    }
    double v75 = 130.0;
    v6->_scrollViewContentLayoutInsets.left = v74;
    if (v73 != 2) {
      double v75 = 24.0;
    }
    v6->_scrollViewContentLayoutInsets.bottom = 0.0;
    v6->_scrollViewContentLayoutInsets.right = v74;
    v6->_buttonModuleContentLayoutInsets.top = 0.0;
    v6->_buttonModuleContentLayoutInsets.left = v75;
    v6->_buttonModuleContentLayoutInsets.bottom = 10.0;
    v6->_buttonModuleContentLayoutInsets.right = v75;
  }

  return v6;
}

- (double)primaryButtonCornerRadius
{
  v2.n128_u64[0] = 15.0;
  PPMScaledFloatValue(self, a2, v2);
  return result;
}

- (CGSize)headerIconViewSize
{
  v2.n128_u64[0] = 0x4044000000000000;
  PPMScaledFloatValue(self, a2, v2);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_createTitleFontForTraitCollection:(id)a3
{
  double v4 = (void *)MEMORY[0x263F1C660];
  id v5 = a3;
  v6 = [(TFBetaAppLaunchScreenViewSpecification *)self _titleFontStyle];
  v7 = objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x263F1D318]);

  return v7;
}

- (id)_titleFontStyle
{
  return (id)*MEMORY[0x263F1D2F8];
}

- (id)_createSubtitleFontForTraitCollection:(id)a3
{
  double v4 = (void *)MEMORY[0x263F1C660];
  id v5 = a3;
  v6 = [(TFBetaAppLaunchScreenViewSpecification *)self _subtitleFontStyle];
  v7 = objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x263F1D338]);

  return v7;
}

- (id)_subtitleFontStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_createBodyTitleFontForTraitCollection:(id)a3
{
  double v4 = (void *)MEMORY[0x263F1C660];
  id v5 = a3;
  v6 = [(TFBetaAppLaunchScreenViewSpecification *)self _bodyTitleFontStyle];
  v7 = objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x263F1D340]);

  return v7;
}

- (id)_bodyTitleFontStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_createBodyTextFontForTraitCollection:(id)a3
{
  double v4 = (void *)MEMORY[0x263F1C660];
  id v5 = a3;
  v6 = [(TFBetaAppLaunchScreenViewSpecification *)self _bodyTextFontStyle];
  v7 = objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x263F1D338]);

  return v7;
}

- (id)_bodyTextFontStyle
{
  return (id)*MEMORY[0x263F1D2C0];
}

- (id)_createPrimaryButtonTextFontForTraitCollection:(id)a3
{
  double v4 = (void *)MEMORY[0x263F1C660];
  id v5 = a3;
  v6 = [(TFBetaAppLaunchScreenViewSpecification *)self _primaryButtonTextFontStyle];
  v7 = objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x263F1D338]);

  return v7;
}

- (id)_primaryButtonTextFontStyle
{
  return (id)*MEMORY[0x263F1D308];
}

- (UIColor)backgroundColor
{
  return (UIColor *)[MEMORY[0x263F1C550] systemBackgroundColor];
}

- (UIColor)buttonTintColor
{
  return (UIColor *)[MEMORY[0x263F1C550] systemBlueColor];
}

- (UIColor)overButtonTintTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] whiteColor];
}

- (UIColor)textColor
{
  return (UIColor *)[MEMORY[0x263F1C550] labelColor];
}

- (UIEdgeInsets)scrollViewContentLayoutInsets
{
  double top = self->_scrollViewContentLayoutInsets.top;
  double left = self->_scrollViewContentLayoutInsets.left;
  double bottom = self->_scrollViewContentLayoutInsets.bottom;
  double right = self->_scrollViewContentLayoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)viewTopMarginAdditionalPaddingAsFractionOfTotalHeight
{
  return self->_viewTopMarginAdditionalPaddingAsFractionOfTotalHeight;
}

- (double)bottommostLabelLastBaselineToLockupTopEdge
{
  return self->_bottommostLabelLastBaselineToLockupTopEdge;
}

- (double)bottommostLabelLastBaselineToImageTopEdge
{
  return self->_bottommostLabelLastBaselineToImageTopEdge;
}

- (UIEdgeInsets)buttonModuleContentLayoutInsets
{
  double top = self->_buttonModuleContentLayoutInsets.top;
  double left = self->_buttonModuleContentLayoutInsets.left;
  double bottom = self->_buttonModuleContentLayoutInsets.bottom;
  double right = self->_buttonModuleContentLayoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)buttonBackgroundTopEdgeToPrimaryButtonTopEdge
{
  return self->_buttonBackgroundTopEdgeToPrimaryButtonTopEdge;
}

- (double)buttonHeight
{
  return self->_buttonHeight;
}

- (double)interButtonPadding
{
  return self->_interButtonPadding;
}

- (double)viewTopMarginToTitleLabelFirstBaseline
{
  return self->_viewTopMarginToTitleLabelFirstBaseline;
}

- (double)titleLabelLastBaselineToSubtitleLabelFirstBaseline
{
  return self->_titleLabelLastBaselineToSubtitleLabelFirstBaseline;
}

- (double)lockupBottomEdgeToBodyTitleLabelFirstBaseline
{
  return self->_lockupBottomEdgeToBodyTitleLabelFirstBaseline;
}

- (double)bodyTitleLabelLastBaselineToBodyTextLabelFirstBaseline
{
  return self->_bodyTitleLabelLastBaselineToBodyTextLabelFirstBaseline;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIFont)bodyTitleFont
{
  return self->_bodyTitleFont;
}

- (UIFont)bodyTextFont
{
  return self->_bodyTextFont;
}

- (UIFont)primaryButtonTextFont
{
  return self->_primaryButtonTextFont;
}

- (UIFontMetrics)titleFontMetrics
{
  return self->_titleFontMetrics;
}

- (UIFontMetrics)subtitleFontMetrics
{
  return self->_subtitleFontMetrics;
}

- (UIFontMetrics)bodyTitleFontMetrics
{
  return self->_bodyTitleFontMetrics;
}

- (UIFontMetrics)bodyTextFontMetrics
{
  return self->_bodyTextFontMetrics;
}

- (UIFontMetrics)primaryButtonTextFontMetrics
{
  return self->_primaryButtonTextFontMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryButtonTextFontMetrics, 0);
  objc_storeStrong((id *)&self->_bodyTextFontMetrics, 0);
  objc_storeStrong((id *)&self->_bodyTitleFontMetrics, 0);
  objc_storeStrong((id *)&self->_subtitleFontMetrics, 0);
  objc_storeStrong((id *)&self->_titleFontMetrics, 0);
  objc_storeStrong((id *)&self->_primaryButtonTextFont, 0);
  objc_storeStrong((id *)&self->_bodyTextFont, 0);
  objc_storeStrong((id *)&self->_bodyTitleFont, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);

  objc_storeStrong((id *)&self->_titleFont, 0);
}

@end