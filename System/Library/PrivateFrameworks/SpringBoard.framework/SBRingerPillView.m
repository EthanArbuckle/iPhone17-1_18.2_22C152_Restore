@interface SBRingerPillView
- (BOOL)isActivatedForPreviewing;
- (BSUICAPackageView)glyphView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTMaterialView)materialView;
- (MTShadowView)shadowView;
- (MTVisualStylingProvider)stylingProvider;
- (NSArray)glyphTintBackgroundLayers;
- (NSArray)glyphTintShapeLayers;
- (SBRingerPillView)initWithActivatedForPreviewing:(BOOL)a3;
- (SBRingerVolumeSliderView)slider;
- (UIColor)glyphTintColor;
- (UILabel)offLabel;
- (UILabel)onLabel;
- (UILabel)ringerLabel;
- (UILabel)silentModeLabel;
- (float)sliderValue;
- (id)_subtitleLabelColor;
- (id)_titleLabelColor;
- (id)_visibleViewsForState:(unint64_t)a3;
- (unint64_t)state;
- (void)_setGlyphTintColor:(id)a3 animationDuration:(double)a4;
- (void)_updateGlyphWithStaticColor:(id)a3 animationSettings:(id)a4;
- (void)layoutSubviews;
- (void)setActivatedForPreviewing:(BOOL)a3;
- (void)setGlyphTintBackgroundLayers:(id)a3;
- (void)setGlyphTintColor:(id)a3;
- (void)setGlyphTintShapeLayers:(id)a3;
- (void)setGlyphView:(id)a3;
- (void)setMaterialView:(id)a3;
- (void)setOffLabel:(id)a3;
- (void)setOnLabel:(id)a3;
- (void)setRingerLabel:(id)a3;
- (void)setShadowView:(id)a3;
- (void)setSilentModeLabel:(id)a3;
- (void)setSlider:(id)a3;
- (void)setSliderValue:(double)a3 animated:(BOOL)a4;
- (void)setSliderValue:(float)a3;
- (void)setState:(unint64_t)a3;
- (void)setStylingProvider:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SBRingerPillView

- (SBRingerPillView)initWithActivatedForPreviewing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  v80.receiver = self;
  v80.super_class = (Class)SBRingerPillView;
  v4 = [(SBRingerPillView *)&v80 init];
  v5 = v4;
  if (v4)
  {
    v4->_activatedForPreviewing = v3;
    if (v3) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
    [(SBRingerPillView *)v4 setOverrideUserInterfaceStyle:v6];
    uint64_t v77 = 1065353216;
    long long v78 = xmmword_1D8FD0690;
    uint64_t v79 = 0x4039000000000000;
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F743D0]) initWithShadowAttributes:&v77 maskCornerRadius:25.0];
    shadowView = v5->_shadowView;
    v5->_shadowView = (MTShadowView *)v7;

    [(SBRingerPillView *)v5 addSubview:v5->_shadowView];
    uint64_t v9 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:54 options:8];
    materialView = v5->_materialView;
    v5->_materialView = (MTMaterialView *)v9;

    [(MTMaterialView *)v5->_materialView _setContinuousCornerRadius:25.0];
    [(SBRingerPillView *)v5 addSubview:v5->_materialView];
    uint64_t v11 = [(MTMaterialView *)v5->_materialView visualStylingProviderForCategory:2];
    stylingProvider = v5->_stylingProvider;
    v5->_stylingProvider = (MTVisualStylingProvider *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F4F8A0]);
    v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v15 = [v13 initWithPackageName:@"Mute" inBundle:v14];
    glyphView = v5->_glyphView;
    v5->_glyphView = (BSUICAPackageView *)v15;

    [(SBRingerPillView *)v5 addSubview:v5->_glyphView];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v17 = v5;
    v18 = [(BSUICAPackageView *)v5->_glyphView publishedObjectNames];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v73 objects:v81 count:16];
    if (!v19)
    {
      v72 = 0;
      v21 = 0;
      goto LABEL_26;
    }
    uint64_t v20 = v19;
    v72 = 0;
    v21 = 0;
    uint64_t v22 = *(void *)v74;
    while (1)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v74 != v22) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        if ([v24 hasSuffix:@"-tint-shape"])
        {
          v25 = [(BSUICAPackageView *)v17->_glyphView publishedObjectWithName:v24];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v26 = v21;
            if (!v21) {
              id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            v21 = v26;
LABEL_20:
            [v26 addObject:v25];
          }
        }
        else
        {
          if (![v24 hasSuffix:@"-tint-bg"]) {
            continue;
          }
          v25 = [(BSUICAPackageView *)v17->_glyphView publishedObjectWithName:v24];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v26 = v72;
            if (!v72) {
              id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            v72 = v26;
            goto LABEL_20;
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v73 objects:v81 count:16];
      if (!v20)
      {
LABEL_26:

        uint64_t v27 = [v72 copy];
        v5 = v17;
        glyphTintBackgroundLayers = v17->_glyphTintBackgroundLayers;
        v17->_glyphTintBackgroundLayers = (NSArray *)v27;

        uint64_t v29 = [v21 copy];
        glyphTintShapeLayers = v17->_glyphTintShapeLayers;
        v17->_glyphTintShapeLayers = (NSArray *)v29;

        v31 = [(SBRingerPillView *)v17 _titleLabelColor];
        v32 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
        silentModeLabel = v5->_silentModeLabel;
        v5->_silentModeLabel = v32;

        v34 = v5->_silentModeLabel;
        v35 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
        uint64_t v36 = *MEMORY[0x1E4F43890];
        v37 = [v35 preferredFontForTextStyle:*MEMORY[0x1E4F43890] hiFontStyle:4];
        [(UILabel *)v34 setFont:v37];

        [(UILabel *)v5->_silentModeLabel setTextColor:v31];
        v38 = v5->_silentModeLabel;
        v39 = [MEMORY[0x1E4F28B50] mainBundle];
        v40 = [v39 localizedStringForKey:@"RINGER_SILENT" value:&stru_1F3084718 table:@"SpringBoard"];
        [(UILabel *)v38 setText:v40];

        [(SBRingerPillView *)v5 addSubview:v5->_silentModeLabel];
        v41 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
        ringerLabel = v5->_ringerLabel;
        v5->_ringerLabel = v41;

        v43 = v5->_ringerLabel;
        v44 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
        v45 = [v44 preferredFontForTextStyle:v36 hiFontStyle:4];
        [(UILabel *)v43 setFont:v45];

        [(UILabel *)v5->_ringerLabel setTextColor:v31];
        v46 = v5->_ringerLabel;
        v47 = [MEMORY[0x1E4F28B50] mainBundle];
        v48 = objc_msgSend(v47, "localizedStringForKey:value:table:", @"RINGER_VOLUME", &stru_1F3084718);
        [(UILabel *)v46 setText:v48];

        [(SBRingerPillView *)v5 addSubview:v5->_ringerLabel];
        v49 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
        onLabel = v5->_onLabel;
        v5->_onLabel = v49;

        v51 = v5->_onLabel;
        v52 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
        v53 = [v52 preferredFontForTextStyle:v36 hiFontStyle:4];
        [(UILabel *)v51 setFont:v53];

        v54 = v5->_onLabel;
        v55 = [(SBRingerPillView *)v5 _subtitleLabelColor];
        [(UILabel *)v54 setTextColor:v55];

        v56 = v5->_onLabel;
        v57 = [MEMORY[0x1E4F28B50] mainBundle];
        v58 = [v57 localizedStringForKey:@"RINGER_ON" value:&stru_1F3084718 table:@"SpringBoard"];
        [(UILabel *)v56 setText:v58];

        [(SBRingerPillView *)v5 addSubview:v5->_onLabel];
        v59 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
        offLabel = v5->_offLabel;
        v5->_offLabel = v59;

        v61 = v5->_offLabel;
        v62 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
        v63 = [v62 preferredFontForTextStyle:v36 hiFontStyle:4];
        [(UILabel *)v61 setFont:v63];

        v64 = v5->_offLabel;
        v65 = [(SBRingerPillView *)v5 _subtitleLabelColor];
        [(UILabel *)v64 setTextColor:v65];

        v66 = v5->_offLabel;
        v67 = [MEMORY[0x1E4F28B50] mainBundle];
        v68 = [v67 localizedStringForKey:@"RINGER_OFF" value:&stru_1F3084718 table:@"SpringBoard"];
        [(UILabel *)v66 setText:v68];

        [(SBRingerPillView *)v5 addSubview:v5->_offLabel];
        v69 = objc_alloc_init(SBRingerVolumeSliderView);
        slider = v5->_slider;
        v5->_slider = v69;

        [(SBRingerVolumeSliderView *)v5->_slider setValue:0.7];
        [(SBRingerPillView *)v5 addSubview:v5->_slider];

        return v5;
      }
    }
  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  ringerLabel = self->_ringerLabel;
  v22[0] = self->_silentModeLabel;
  v22[1] = ringerLabel;
  onLabel = self->_onLabel;
  offLabel = self->_offLabel;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v22[2] = onLabel;
  v22[3] = offLabel;
  v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 4, 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "sizeThatFits:", width, height);
        if (v14 >= v12) {
          double v12 = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
    double v15 = v12 + 100.0;
  }
  else
  {
    double v15 = 100.0;
  }

  double v16 = fmax(v15, 196.0);
  double v17 = 50.0;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  v104.receiver = self;
  v104.super_class = (Class)SBRingerPillView;
  [(SBRingerPillView *)&v104 layoutSubviews];
  [(SBRingerPillView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  UIRectGetCenter();
  uint64_t v11 = [(SBRingerPillView *)self traitCollection];
  [v11 displayScale];

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  ringerLabel = self->_ringerLabel;
  v108[0] = self->_silentModeLabel;
  v108[1] = ringerLabel;
  offLabel = self->_offLabel;
  v108[2] = self->_onLabel;
  v108[3] = offLabel;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:4];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v100 objects:v109 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v101;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v101 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v100 + 1) + 8 * i) sizeToFit];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v100 objects:v109 count:16];
    }
    while (v16);
  }

  -[SBRingerVolumeSliderView setSize:](self->_slider, "setSize:", v8 + -100.0 + 2.0, 5.0);
  -[BSUICAPackageView setSize:](self->_glyphView, "setSize:", 35.0, 35.0);
  double v90 = v6;
  double v91 = v4;
  double v88 = v10;
  double v89 = v8;
  switch(self->_state)
  {
    case 1uLL:
      uint64_t v19 = [MEMORY[0x1E4F428B8] systemRedColor];
      v71 = @"silent";
      double v70 = 0.25;
      break;
    case 2uLL:
      uint64_t v19 = [(SBRingerPillView *)self _titleLabelColor];
      v71 = @"ringer";
      double v70 = 0.2155;
      break;
    case 3uLL:
      uint64_t v19 = [(SBRingerPillView *)self _titleLabelColor];
      v71 = @"ringer";
      double v20 = 0.2155;
      goto LABEL_15;
    case 4uLL:
      uint64_t v19 = [MEMORY[0x1E4F428B8] systemRedColor];
      v71 = @"silent";
      double v20 = 0.25;
LABEL_15:
      double v70 = v20;
      break;
    default:
      uint64_t v19 = 0;
      v71 = 0;
      double v70 = 0.0;
      break;
  }
  [(UILabel *)self->_silentModeLabel frame];
  UIRectCenteredAboutPointScale();
  double v86 = v22;
  double v87 = v21;
  double v84 = v24;
  double v85 = v23;
  [(UILabel *)self->_ringerLabel frame];
  UIRectCenteredAboutPointScale();
  double v82 = v26;
  double v83 = v25;
  double v80 = v28;
  double v81 = v27;
  [(UILabel *)self->_onLabel frame];
  UIRectCenteredAboutPointScale();
  double v78 = v30;
  double v79 = v29;
  double v76 = v32;
  double v77 = v31;
  [(UILabel *)self->_offLabel frame];
  UIRectCenteredAboutPointScale();
  double v74 = v34;
  double v75 = v33;
  double v72 = v36;
  double v73 = v35;
  [(SBRingerVolumeSliderView *)self->_slider frame];
  UIRectCenteredAboutPointScale();
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  [(BSUICAPackageView *)self->_glyphView frame];
  UIRectCenteredAboutPointScale();
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  -[UILabel setFrame:](self->_silentModeLabel, "setFrame:", v87, v86, v85, v84);
  -[UILabel setFrame:](self->_ringerLabel, "setFrame:", v83, v82, v81, v80);
  -[UILabel setFrame:](self->_onLabel, "setFrame:", v79, v78, v77, v76);
  -[UILabel setFrame:](self->_offLabel, "setFrame:", v75, v74, v73, v72);
  -[SBRingerVolumeSliderView setFrame:](self->_slider, "setFrame:", v38, v40, v42, v44);
  -[BSUICAPackageView setFrame:](self->_glyphView, "setFrame:", v46, v48, v50, v52);
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", v91, v90, v89, v88);
  shadowView = self->_shadowView;
  -[MTShadowView frameWithContentWithFrame:](shadowView, "frameWithContentWithFrame:", v91, v90, v89, v88);
  -[MTShadowView setFrame:](shadowView, "setFrame:");
  v54 = (void *)v19;
  [(SBRingerPillView *)self _setGlyphTintColor:v19 animationDuration:v70];
  [(BSUICAPackageView *)self->_glyphView setState:v71];
  v55 = self->_ringerLabel;
  silentModeLabel = self->_silentModeLabel;
  v107[0] = self->_glyphView;
  v107[1] = v55;
  onLabel = self->_onLabel;
  v58 = self->_offLabel;
  v107[2] = silentModeLabel;
  v107[3] = onLabel;
  slider = self->_slider;
  v107[4] = v58;
  v107[5] = slider;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:6];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v60 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = [v60 countByEnumeratingWithState:&v96 objects:v106 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v97;
    do
    {
      for (uint64_t j = 0; j != v62; ++j)
      {
        if (*(void *)v97 != v63) {
          objc_enumerationMutation(v60);
        }
        [*(id *)(*((void *)&v96 + 1) + 8 * j) setAlpha:0.0];
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v96 objects:v106 count:16];
    }
    while (v62);
  }

  v65 = [(SBRingerPillView *)self _visibleViewsForState:self->_state];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v66 = [v65 countByEnumeratingWithState:&v92 objects:v105 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v93;
    do
    {
      for (uint64_t k = 0; k != v67; ++k)
      {
        if (*(void *)v93 != v68) {
          objc_enumerationMutation(v65);
        }
        [*(id *)(*((void *)&v92 + 1) + 8 * k) setAlpha:1.0];
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v92 objects:v105 count:16];
    }
    while (v67);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBRingerPillView;
  [(SBRingerPillView *)&v8 traitCollectionDidChange:a3];
  glyphTintColor = self->_glyphTintColor;
  if (glyphTintColor)
  {
    double v5 = [(SBRingerPillView *)self traitCollection];
    double v6 = [(UIColor *)glyphTintColor resolvedColorWithTraitCollection:v5];
    double v7 = [MEMORY[0x1E4F42FF0] _currentAnimationSettings];
    [(SBRingerPillView *)self _updateGlyphWithStaticColor:v6 animationSettings:v7];
  }
}

- (id)_visibleViewsForState:(unint64_t)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1uLL:
      v11[0] = self->_onLabel;
      double v3 = &OBJC_IVAR___SBRingerPillView__silentModeLabel;
      p_offLabel = (UILabel **)v11;
      goto LABEL_7;
    case 2uLL:
      offLabel = self->_offLabel;
      double v3 = &OBJC_IVAR___SBRingerPillView__silentModeLabel;
      p_offLabel = &offLabel;
      goto LABEL_7;
    case 3uLL:
      ringerLabel = self->_ringerLabel;
      double v3 = &OBJC_IVAR___SBRingerPillView__slider;
      p_offLabel = &ringerLabel;
      goto LABEL_7;
    case 4uLL:
      objc_super v8 = self->_ringerLabel;
      double v3 = &OBJC_IVAR___SBRingerPillView__slider;
      p_offLabel = &v8;
LABEL_7:
      glyphView = self->_glyphView;
      p_offLabel[1] = *(UILabel **)((char *)&self->super.super.super.isa + *v3);
      p_offLabel[2] = (UILabel *)glyphView;
      double v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
      break;
    default:
      double v5 = 0;
      break;
  }
  return v5;
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(SBRingerPillView *)self setNeedsLayout];
  }
}

- (void)setSliderValue:(float)a3
{
}

- (void)setSliderValue:(double)a3 animated:(BOOL)a4
{
}

- (void)_setGlyphTintColor:(id)a3 animationDuration:(double)a4
{
  double v7 = (UIColor *)a3;
  glyphTintColor = self->_glyphTintColor;
  if (glyphTintColor != v7)
  {
    uint64_t v16 = v7;
    char v9 = [(UIColor *)glyphTintColor isEqual:v7];
    double v7 = v16;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_glyphTintColor, a3);
      double v10 = (void *)MEMORY[0x1E4F4F680];
      uint64_t v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
      double v12 = [v10 settingsWithDuration:v11 timingFunction:a4];

      id v13 = self->_glyphTintColor;
      double v14 = [(SBRingerPillView *)self traitCollection];
      uint64_t v15 = [(UIColor *)v13 resolvedColorWithTraitCollection:v14];
      [(SBRingerPillView *)self _updateGlyphWithStaticColor:v15 animationSettings:v12];

      double v7 = v16;
    }
  }
}

- (void)_updateGlyphWithStaticColor:(id)a3 animationSettings:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v30 = v7;
  if (v7)
  {
    objc_super v8 = [MEMORY[0x1E4F4F898] factoryWithSettings:v7];
  }
  else
  {
    objc_super v8 = 0;
  }
  id v29 = v6;
  uint64_t v9 = [v29 CGColor];
  double v10 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = [v10 UUIDString];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  double v28 = self;
  double v12 = self->_glyphTintShapeLayers;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v18 = [v8 _basicAnimationForView:0 withKeyPath:@"fillColor"];
        uint64_t v19 = v18;
        if (v18)
        {
          [v18 setToValue:v9];
          [v17 addAnimation:v19 forKey:v11];
        }
        [v17 setFillColor:v9];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v20 = v28->_glyphTintBackgroundLayers;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        double v25 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        double v26 = [v8 _basicAnimationForView:0 withKeyPath:@"backgroundColor"];
        double v27 = v26;
        if (v26)
        {
          [v26 setToValue:v9];
          [v25 addAnimation:v27 forKey:v11];
        }
        [v25 setBackgroundColor:v9];
      }
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v22);
  }
}

- (id)_titleLabelColor
{
  if (self->_activatedForPreviewing) {
    [MEMORY[0x1E4F428B8] labelColor];
  }
  else {
  v2 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  }
  return v2;
}

- (id)_subtitleLabelColor
{
  if (self->_activatedForPreviewing) {
    [MEMORY[0x1E4F428B8] secondaryLabelColor];
  }
  else {
  v2 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
  }
  return v2;
}

- (unint64_t)state
{
  return self->_state;
}

- (float)sliderValue
{
  return self->_sliderValue;
}

- (MTShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
}

- (MTVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (void)setStylingProvider:(id)a3
{
}

- (BSUICAPackageView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
}

- (UILabel)silentModeLabel
{
  return self->_silentModeLabel;
}

- (void)setSilentModeLabel:(id)a3
{
}

- (UILabel)ringerLabel
{
  return self->_ringerLabel;
}

- (void)setRingerLabel:(id)a3
{
}

- (UILabel)onLabel
{
  return self->_onLabel;
}

- (void)setOnLabel:(id)a3
{
}

- (UILabel)offLabel
{
  return self->_offLabel;
}

- (void)setOffLabel:(id)a3
{
}

- (SBRingerVolumeSliderView)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
}

- (UIColor)glyphTintColor
{
  return self->_glyphTintColor;
}

- (void)setGlyphTintColor:(id)a3
{
}

- (NSArray)glyphTintBackgroundLayers
{
  return self->_glyphTintBackgroundLayers;
}

- (void)setGlyphTintBackgroundLayers:(id)a3
{
}

- (NSArray)glyphTintShapeLayers
{
  return self->_glyphTintShapeLayers;
}

- (void)setGlyphTintShapeLayers:(id)a3
{
}

- (BOOL)isActivatedForPreviewing
{
  return self->_activatedForPreviewing;
}

- (void)setActivatedForPreviewing:(BOOL)a3
{
  self->_activatedForPreviewing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphTintShapeLayers, 0);
  objc_storeStrong((id *)&self->_glyphTintBackgroundLayers, 0);
  objc_storeStrong((id *)&self->_glyphTintColor, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_offLabel, 0);
  objc_storeStrong((id *)&self->_onLabel, 0);
  objc_storeStrong((id *)&self->_ringerLabel, 0);
  objc_storeStrong((id *)&self->_silentModeLabel, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end