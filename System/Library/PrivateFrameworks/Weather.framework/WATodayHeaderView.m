@interface WATodayHeaderView
+ (BOOL)requiresConstraintBasedLayout;
- (NSString)conditionsLine1;
- (NSString)conditionsLine2;
- (NSString)locationName;
- (NSString)temperature;
- (NSString)temperatureHigh;
- (NSString)temperatureLow;
- (UIImage)conditionsImage;
- (UIImageView)conditionsImageView;
- (UILabel)conditionsLabel1;
- (UILabel)conditionsLabel2;
- (UILabel)locationLabel;
- (UILabel)temperatureHighLowLabel;
- (UILabel)temperatureLabel;
- (UIVisualEffectView)weatherInformationVisualEffectView;
- (WATodayHeaderView)init;
- (double)pageBaselineOffset;
- (double)pageDegreeFontSize;
- (double)pageFontSize;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateContent;
- (void)setConditionsImage:(id)a3;
- (void)setConditionsImageView:(id)a3;
- (void)setConditionsLabel1:(id)a3;
- (void)setConditionsLabel2:(id)a3;
- (void)setConditionsLine1:(id)a3;
- (void)setConditionsLine2:(id)a3;
- (void)setLocationLabel:(id)a3;
- (void)setLocationName:(id)a3;
- (void)setPageBaselineOffset:(double)a3;
- (void)setPageDegreeFontSize:(double)a3;
- (void)setPageFontSize:(double)a3;
- (void)setTemperature:(id)a3;
- (void)setTemperatureHigh:(id)a3;
- (void)setTemperatureHighLowLabel:(id)a3;
- (void)setTemperatureLabel:(id)a3;
- (void)setTemperatureLow:(id)a3;
- (void)setWeatherInformationVisualEffectView:(id)a3;
@end

@implementation WATodayHeaderView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (WATodayHeaderView)init
{
  v5.receiver = self;
  v5.super_class = (Class)WATodayHeaderView;
  v2 = [(WATodayHeaderView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(WATodayHeaderView *)v2 _setupSubviews];
  }
  return v3;
}

- (void)setConditionsLine1:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_conditionsLine1, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    conditionsLine1 = self->_conditionsLine1;
    self->_conditionsLine1 = v4;

    [(WATodayHeaderView *)self _updateContent];
  }
}

- (void)setConditionsLine2:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_conditionsLine2, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    conditionsLine2 = self->_conditionsLine2;
    self->_conditionsLine2 = v4;

    [(WATodayHeaderView *)self _updateContent];
  }
}

- (void)setConditionsImage:(id)a3
{
  id v6 = a3;
  if ((-[UIImage isEqual:](self->_conditionsImage, "isEqual:") & 1) == 0)
  {
    v4 = (UIImage *)[v6 copy];
    conditionsImage = self->_conditionsImage;
    self->_conditionsImage = v4;

    [(WATodayHeaderView *)self _updateContent];
  }
}

- (void)setTemperature:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_temperature, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    temperature = self->_temperature;
    self->_temperature = v4;

    [(WATodayHeaderView *)self _updateContent];
  }
}

- (void)setTemperatureLow:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_temperatureLow, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    temperatureLow = self->_temperatureLow;
    self->_temperatureLow = v4;

    [(WATodayHeaderView *)self _updateContent];
  }
}

- (void)setTemperatureHigh:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_temperatureHigh, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    temperatureHigh = self->_temperatureHigh;
    self->_temperatureHigh = v4;

    [(WATodayHeaderView *)self _updateContent];
  }
}

- (void)setLocationName:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_locationName, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    locationName = self->_locationName;
    self->_locationName = v4;

    [(WATodayHeaderView *)self _updateContent];
  }
}

- (void)_updateContent
{
  v3 = [(WATodayHeaderView *)self locationName];
  v4 = [(WATodayHeaderView *)self locationLabel];
  [v4 setText:v3];

  objc_super v5 = [(WATodayHeaderView *)self temperature];
  id v6 = WATodayHeaderViewDegreeAttributedStringWithTemperatureObject(0, v5);
  v7 = [(WATodayHeaderView *)self temperatureLabel];
  [v7 setAttributedText:v6];

  uint64_t v8 = [(WATodayHeaderView *)self temperatureHigh];
  if (v8
    && (v9 = (void *)v8,
        [(WATodayHeaderView *)self temperatureLow],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v11 = NSString;
    v12 = [(WATodayHeaderView *)self temperatureHigh];
    v13 = [(WATodayHeaderView *)self temperatureLow];
    v14 = [v11 stringWithFormat:@"%@ / %@", v12, v13];
    v15 = [(WATodayHeaderView *)self temperatureHighLowLabel];
    [v15 setText:v14];
  }
  else
  {
    v12 = [(WATodayHeaderView *)self temperatureHighLowLabel];
    [v12 setText:&stru_26DADC2F0];
  }

  v16 = [(WATodayHeaderView *)self conditionsLine1];
  v17 = [(WATodayHeaderView *)self conditionsLabel1];
  [v17 setText:v16];

  v18 = [(WATodayHeaderView *)self conditionsLine2];
  v19 = [(WATodayHeaderView *)self conditionsLabel2];
  [v19 setText:v18];

  id v21 = [(WATodayHeaderView *)self conditionsImage];
  v20 = [(WATodayHeaderView *)self conditionsImageView];
  [v20 setImage:v21];
}

- (void)_setupSubviews
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  v51 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2A0] addingSymbolicTraits:0x8000 options:2];
  uint64_t v3 = objc_msgSend(MEMORY[0x263F1C658], "fontWithDescriptor:size:", 0.0);
  v49 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D280] addingSymbolicTraits:0x8000 options:2];
  v4 = objc_msgSend(MEMORY[0x263F1C658], "fontWithDescriptor:size:", 0.0);
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v53 = (void *)v6;
  v54 = (void *)v5;
  v85[0] = v5;
  v85[1] = v6;
  v85[2] = v7;
  v55 = objc_opt_new();
  v56 = (void *)v8;
  v85[3] = v8;
  v85[4] = v55;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v73 objects:v86 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v74 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        [v14 setAdjustsFontForContentSizeCategory:1];
        [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v73 objects:v86 count:16];
    }
    while (v11);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v52 = (void *)v7;
  v83[0] = v7;
  v83[1] = v56;
  v83[2] = v55;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:3];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v69 objects:v84 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v70 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v69 + 1) + 8 * j);
        id v21 = WADetailColor();
        [v20 setTextColor:v21];

        [v20 setFont:v4];
        [v20 setNumberOfLines:1];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v69 objects:v84 count:16];
    }
    while (v17);
  }

  [v54 setFont:v3];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v81[0] = v54;
  v81[1] = v52;
  v81[2] = v56;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:3];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v65 objects:v82 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v66;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v66 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v65 + 1) + 8 * k);
        [v27 setAdjustsFontSizeToFitWidth:1];
        [v27 setMinimumScaleFactor:0.4];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v65 objects:v82 count:16];
    }
    while (v24);
  }
  v50 = (void *)v3;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v79[0] = v53;
  v79[1] = v55;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:2];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v80 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v62;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v62 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v61 + 1) + 8 * m);
        [v33 setAdjustsFontSizeToFitWidth:1];
        [v33 setMinimumScaleFactor:0.2];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v61 objects:v80 count:16];
    }
    while (v30);
  }

  v34 = WAContentColor();
  [v53 setTextColor:v34];

  [v53 setTextAlignment:2];
  [v55 setTextAlignment:1];
  v35 = WAContentColor();
  [v55 setTextColor:v35];

  v36 = objc_opt_new();
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v36 setContentMode:1];
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WATodayHeaderView *)self addSubview:v36];
  v48 = [MEMORY[0x263F1CB58] widgetEffectForVibrancyStyle:101];
  v37 = (void *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v48];
  [(WATodayHeaderView *)self setWeatherInformationVisualEffectView:v37];

  v38 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

  v39 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  [(WATodayHeaderView *)self addSubview:v39];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v77[0] = v54;
  v77[1] = v53;
  v77[2] = v52;
  v77[3] = v56;
  v77[4] = v55;
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:5];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v57 objects:v78 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v58;
    do
    {
      for (uint64_t n = 0; n != v42; ++n)
      {
        if (*(void *)v58 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void *)(*((void *)&v57 + 1) + 8 * n);
        v46 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
        v47 = [v46 contentView];
        [v47 addSubview:v45];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v57 objects:v78 count:16];
    }
    while (v42);
  }

  [(WATodayHeaderView *)self setLocationLabel:v54];
  [(WATodayHeaderView *)self setConditionsLabel1:v52];
  [(WATodayHeaderView *)self setConditionsLabel2:v56];
  [(WATodayHeaderView *)self setTemperatureHighLowLabel:v55];
  [(WATodayHeaderView *)self setTemperatureLabel:v53];
  [(WATodayHeaderView *)self setConditionsImageView:v36];
  [(WATodayHeaderView *)self _setupConstraints];
}

- (void)_setupConstraints
{
  uint64_t v169 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  v4 = (void *)MEMORY[0x263F08938];
  uint64_t v5 = [(WATodayHeaderView *)self conditionsImageView];
  uint64_t v6 = [(WATodayHeaderView *)self conditionsImageView];
  uint64_t v7 = [v4 constraintWithItem:v5 attribute:8 relatedBy:0 toItem:v6 attribute:7 multiplier:1.0 constant:0.0];
  [v3 addObject:v7];

  uint64_t v8 = [(WATodayHeaderView *)self conditionsImageView];
  LODWORD(v9) = 1132068864;
  [v8 setContentCompressionResistancePriority:0 forAxis:v9];

  uint64_t v10 = [(WATodayHeaderView *)self conditionsImageView];
  LODWORD(v11) = 1132068864;
  [v10 setContentCompressionResistancePriority:1 forAxis:v11];

  uint64_t v12 = [(WATodayHeaderView *)self locationLabel];
  LODWORD(v13) = 1132068864;
  [v12 setContentCompressionResistancePriority:0 forAxis:v13];

  v14 = [(WATodayHeaderView *)self conditionsLabel1];
  LODWORD(v15) = 1144750080;
  [v14 setContentCompressionResistancePriority:0 forAxis:v15];

  uint64_t v16 = [(WATodayHeaderView *)self conditionsLabel2];
  LODWORD(v17) = 1144750080;
  [v16 setContentCompressionResistancePriority:0 forAxis:v17];

  uint64_t v18 = [(WATodayHeaderView *)self temperatureLabel];
  LODWORD(v19) = 1144750080;
  [v18 setContentCompressionResistancePriority:0 forAxis:v19];

  v20 = [(WATodayHeaderView *)self temperatureHighLowLabel];
  LODWORD(v21) = 1144750080;
  [v20 setContentCompressionResistancePriority:0 forAxis:v21];

  v22 = [(WATodayHeaderView *)self conditionsImageView];
  uint64_t v23 = [v22 widthAnchor];
  uint64_t v24 = [v23 constraintGreaterThanOrEqualToConstant:30.0];
  [v3 addObject:v24];

  uint64_t v25 = [(WATodayHeaderView *)self conditionsImageView];
  v26 = [v25 heightAnchor];
  v27 = [v26 constraintGreaterThanOrEqualToConstant:30.0];
  [v3 addObject:v27];

  v28 = [(WATodayHeaderView *)self conditionsImageView];
  uint64_t v29 = [v28 leadingAnchor];
  uint64_t v30 = [(WATodayHeaderView *)self leadingAnchor];
  uint64_t v31 = [v29 constraintEqualToAnchor:v30 constant:2.0];
  [v3 addObject:v31];

  v32 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  v33 = [v32 leadingAnchor];
  v34 = [(WATodayHeaderView *)self conditionsImageView];
  v35 = [v34 trailingAnchor];
  v36 = [v33 constraintEqualToAnchor:v35 constant:5.0];
  [v3 addObject:v36];

  v37 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  v38 = [v37 trailingAnchor];
  v39 = [(WATodayHeaderView *)self trailingAnchor];
  v40 = [v38 constraintEqualToAnchor:v39 constant:-16.0];
  [v3 addObject:v40];

  uint64_t v41 = [(WATodayHeaderView *)self locationLabel];
  uint64_t v42 = [v41 leadingAnchor];
  uint64_t v43 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  v44 = [v43 leadingAnchor];
  uint64_t v45 = [v42 constraintEqualToAnchor:v44];
  [v3 addObject:v45];

  v46 = [(WATodayHeaderView *)self conditionsLabel1];
  v47 = [v46 leadingAnchor];
  v48 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  v49 = [v48 leadingAnchor];
  v50 = [v47 constraintEqualToAnchor:v49];
  [v3 addObject:v50];

  v51 = [(WATodayHeaderView *)self conditionsLabel2];
  v52 = [v51 leadingAnchor];
  v53 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  v54 = [v53 leadingAnchor];
  v55 = [v52 constraintEqualToAnchor:v54];
  [v3 addObject:v55];

  v56 = [(WATodayHeaderView *)self locationLabel];
  long long v57 = [v56 widthAnchor];
  long long v58 = [v57 constraintGreaterThanOrEqualToConstant:140.0];
  [v3 addObject:v58];

  long long v59 = [(WATodayHeaderView *)self conditionsLabel1];
  long long v60 = [v59 widthAnchor];
  long long v61 = [v60 constraintGreaterThanOrEqualToConstant:140.0];
  [v3 addObject:v61];

  long long v62 = [(WATodayHeaderView *)self conditionsLabel2];
  long long v63 = [v62 widthAnchor];
  long long v64 = [v63 constraintGreaterThanOrEqualToConstant:140.0];
  [v3 addObject:v64];

  long long v65 = [(WATodayHeaderView *)self locationLabel];
  long long v66 = [v65 trailingAnchor];
  long long v67 = [(WATodayHeaderView *)self temperatureLabel];
  long long v68 = [v67 leadingAnchor];
  long long v69 = [v66 constraintEqualToAnchor:v68 constant:-7.0];
  [v3 addObject:v69];

  long long v70 = [(WATodayHeaderView *)self temperatureLabel];
  long long v71 = [v70 leadingAnchor];
  long long v72 = [(WATodayHeaderView *)self temperatureHighLowLabel];
  long long v73 = [v72 leadingAnchor];
  long long v74 = [v71 constraintEqualToAnchor:v73];
  [v3 addObject:v74];

  long long v75 = [(WATodayHeaderView *)self temperatureLabel];
  long long v76 = [v75 trailingAnchor];
  v77 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  v78 = [v77 trailingAnchor];
  v79 = [v76 constraintEqualToAnchor:v78];
  [v3 addObject:v79];

  v80 = [(WATodayHeaderView *)self temperatureHighLowLabel];
  v81 = [v80 trailingAnchor];
  v82 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  v83 = [v82 trailingAnchor];
  v84 = [v81 constraintEqualToAnchor:v83];
  [v3 addObject:v84];

  v85 = [(WATodayHeaderView *)self temperatureLabel];
  v86 = [v85 widthAnchor];
  uint64_t v87 = [v86 constraintGreaterThanOrEqualToConstant:60.0];
  [v3 addObject:v87];

  v88 = [(WATodayHeaderView *)self temperatureHighLowLabel];
  v89 = [v88 widthAnchor];
  v90 = [v89 constraintGreaterThanOrEqualToConstant:60.0];
  [v3 addObject:v90];

  v91 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  v92 = [v91 topAnchor];
  v93 = [(WATodayHeaderView *)self topAnchor];
  v94 = [v92 constraintEqualToAnchor:v93];
  [v3 addObject:v94];

  v95 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  v96 = [v95 bottomAnchor];
  v97 = [(WATodayHeaderView *)self bottomAnchor];
  v98 = [v96 constraintEqualToAnchor:v97];
  [v3 addObject:v98];

  v99 = (void *)MEMORY[0x263F08938];
  v100 = [(WATodayHeaderView *)self conditionsImageView];
  v101 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  v102 = [v99 constraintWithItem:v100 attribute:10 relatedBy:0 toItem:v101 attribute:10 multiplier:1.0 constant:0.0];
  [v3 addObject:v102];

  v103 = [(WATodayHeaderView *)self locationLabel];
  v104 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  v105 = [(WATodayHeaderView *)self locationLabel];
  v106 = [v105 font];
  uint64_t v107 = [v106 _scaledValueForValue:32.0];
  __38__WATodayHeaderView__setupConstraints__block_invoke_2(v109, v107, (uint64_t)v103, v108, (uint64_t)v104, 3, v3);

  v110 = [(WATodayHeaderView *)self conditionsLabel1];
  v111 = [(WATodayHeaderView *)self locationLabel];
  v112 = [(WATodayHeaderView *)self conditionsLabel1];
  v113 = [v112 font];
  uint64_t v114 = [v113 _scaledValueForValue:20.0];
  __38__WATodayHeaderView__setupConstraints__block_invoke_2(v116, v114, (uint64_t)v110, v115, (uint64_t)v111, 11, v3);

  v117 = [(WATodayHeaderView *)self conditionsLabel2];
  v118 = [(WATodayHeaderView *)self conditionsLabel1];
  v119 = [(WATodayHeaderView *)self conditionsLabel2];
  v120 = [v119 font];
  uint64_t v121 = [v120 _scaledValueForValue:16.0];
  __38__WATodayHeaderView__setupConstraints__block_invoke_2(v123, v121, (uint64_t)v117, v122, (uint64_t)v118, 11, v3);

  v124 = [(WATodayHeaderView *)self conditionsLabel2];
  v125 = [v124 lastBaselineAnchor];
  v126 = [(WATodayHeaderView *)self temperatureHighLowLabel];
  v127 = [v126 lastBaselineAnchor];
  __38__WATodayHeaderView__setupConstraints__block_invoke(0.0, (uint64_t)v127, v125, (uint64_t)v127, v3);

  v128 = [(WATodayHeaderView *)self temperatureHighLowLabel];
  v129 = [v128 widthAnchor];
  v130 = [(WATodayHeaderView *)self temperatureLabel];
  v131 = [v130 widthAnchor];
  v132 = [v129 constraintEqualToAnchor:v131];
  [v3 addObject:v132];

  v133 = [(WATodayHeaderView *)self conditionsLabel1];
  v134 = [(WATodayHeaderView *)self temperatureLabel];
  __38__WATodayHeaderView__setupConstraints__block_invoke_2(0.0, (uint64_t)v134, (uint64_t)v133, v135, (uint64_t)v134, 11, v3);

  v136 = [(WATodayHeaderView *)self conditionsLabel2];
  v137 = [(WATodayHeaderView *)self weatherInformationVisualEffectView];
  v138 = [(WATodayHeaderView *)self conditionsLabel1];
  v139 = [v138 font];
  uint64_t v140 = [v139 _scaledValueForValue:20.0];
  __38__WATodayHeaderView__setupConstraints__block_invoke_2(-v141, v140, (uint64_t)v136, v142, (uint64_t)v137, 4, v3);

  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  v143 = [(WATodayHeaderView *)self locationLabel];
  v167[0] = v143;
  v144 = [(WATodayHeaderView *)self conditionsLabel1];
  v167[1] = v144;
  v145 = [(WATodayHeaderView *)self conditionsLabel2];
  v167[2] = v145;
  v146 = [MEMORY[0x263EFF8C0] arrayWithObjects:v167 count:3];

  uint64_t v147 = [v146 countByEnumeratingWithState:&v163 objects:v168 count:16];
  if (v147)
  {
    uint64_t v148 = v147;
    uint64_t v149 = *(void *)v164;
    do
    {
      uint64_t v150 = 0;
      do
      {
        if (*(void *)v164 != v149) {
          objc_enumerationMutation(v146);
        }
        v151 = [*(id *)(*((void *)&v163 + 1) + 8 * v150) trailingAnchor];
        v152 = [(WATodayHeaderView *)self temperatureLabel];
        v153 = [v152 leadingAnchor];
        v154 = [v151 constraintLessThanOrEqualToAnchor:v153 constant:-8.0];
        [v3 addObject:v154];

        ++v150;
      }
      while (v148 != v150);
      uint64_t v148 = [v146 countByEnumeratingWithState:&v163 objects:v168 count:16];
    }
    while (v148);
  }

  v155 = [(WATodayHeaderView *)self conditionsImageView];
  v156 = [v155 widthAnchor];
  v157 = [(WATodayHeaderView *)self conditionsImageView];
  v158 = [v157 heightAnchor];
  v159 = [v156 constraintEqualToAnchor:v158];
  [v3 addObject:v159];

  v160 = [(WATodayHeaderView *)self conditionsImageView];
  v161 = [v160 widthAnchor];
  v162 = [v161 constraintEqualToConstant:100.0];
  [v3 addObject:v162];

  [MEMORY[0x263F08938] activateConstraints:v3];
}

void __38__WATodayHeaderView__setupConstraints__block_invoke(double a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  id v9 = [a3 constraintEqualToAnchor:a4 constant:a1];
  [v8 addObject:v9];
}

void __38__WATodayHeaderView__setupConstraints__block_invoke_2(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  double v11 = (void *)MEMORY[0x263F08938];
  id v12 = a7;
  id v13 = [v11 constraintWithItem:a3 attribute:11 relatedBy:0 toItem:a5 attribute:a6 multiplier:1.0 constant:a1];
  [v12 addObject:v13];
}

- (NSString)conditionsLine1
{
  return self->_conditionsLine1;
}

- (NSString)conditionsLine2
{
  return self->_conditionsLine2;
}

- (UIImage)conditionsImage
{
  return self->_conditionsImage;
}

- (NSString)temperature
{
  return self->_temperature;
}

- (NSString)temperatureHigh
{
  return self->_temperatureHigh;
}

- (NSString)temperatureLow
{
  return self->_temperatureLow;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (UIVisualEffectView)weatherInformationVisualEffectView
{
  return self->_weatherInformationVisualEffectView;
}

- (void)setWeatherInformationVisualEffectView:(id)a3
{
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
}

- (UILabel)conditionsLabel1
{
  return self->_conditionsLabel1;
}

- (void)setConditionsLabel1:(id)a3
{
}

- (UILabel)conditionsLabel2
{
  return self->_conditionsLabel2;
}

- (void)setConditionsLabel2:(id)a3
{
}

- (UIImageView)conditionsImageView
{
  return self->_conditionsImageView;
}

- (void)setConditionsImageView:(id)a3
{
}

- (UILabel)temperatureLabel
{
  return self->_temperatureLabel;
}

- (void)setTemperatureLabel:(id)a3
{
}

- (UILabel)temperatureHighLowLabel
{
  return self->_temperatureHighLowLabel;
}

- (void)setTemperatureHighLowLabel:(id)a3
{
}

- (double)pageFontSize
{
  return self->_pageFontSize;
}

- (void)setPageFontSize:(double)a3
{
  self->_pageFontSize = a3;
}

- (double)pageDegreeFontSize
{
  return self->_pageDegreeFontSize;
}

- (void)setPageDegreeFontSize:(double)a3
{
  self->_pageDegreeFontSize = a3;
}

- (double)pageBaselineOffset
{
  return self->_pageBaselineOffset;
}

- (void)setPageBaselineOffset:(double)a3
{
  self->_pageBaselineOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temperatureHighLowLabel, 0);
  objc_storeStrong((id *)&self->_temperatureLabel, 0);
  objc_storeStrong((id *)&self->_conditionsImageView, 0);
  objc_storeStrong((id *)&self->_conditionsLabel2, 0);
  objc_storeStrong((id *)&self->_conditionsLabel1, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_weatherInformationVisualEffectView, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_temperatureLow, 0);
  objc_storeStrong((id *)&self->_temperatureHigh, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_conditionsImage, 0);
  objc_storeStrong((id *)&self->_conditionsLine2, 0);
  objc_storeStrong((id *)&self->_conditionsLine1, 0);
}

@end