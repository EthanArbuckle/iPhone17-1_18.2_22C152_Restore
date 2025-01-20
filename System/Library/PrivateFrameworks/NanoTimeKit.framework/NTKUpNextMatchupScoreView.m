@interface NTKUpNextMatchupScoreView
+ (id)_timeStringForFetchDate:(id)a3;
- (BOOL)isPaused;
- (CLKMonochromeFilterProvider)filterProvider;
- (NTKUpNextMatchupScoreView)initWithFrame:(CGRect)a3;
- (void)configureWithMatchup:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
- (void)updateTimeLabel;
@end

@implementation NTKUpNextMatchupScoreView

- (NTKUpNextMatchupScoreView)initWithFrame:(CGRect)a3
{
  v202[2] = *MEMORY[0x1E4F143B8];
  v199.receiver = self;
  v199.super_class = (Class)NTKUpNextMatchupScoreView;
  v3 = -[NTKUpNextMatchupScoreView initWithFrame:](&v199, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v3) {
    return v3;
  }
  v4 = +[CLKRenderingContext sharedRenderingContext];
  v5 = [v4 device];

  id v6 = v5;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_1);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_1);
  if (!WeakRetained) {
    goto LABEL_6;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_1);
  if (v9 != v6)
  {

LABEL_6:
    id v12 = objc_storeWeak(&_LayoutConstants___cachedDevice_1, v6);
    _LayoutConstants___previousCLKDeviceVersion_1 = [v6 version];

    ___LayoutConstants_block_invoke_1(v13, (uint64_t)v6);
    goto LABEL_7;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _LayoutConstants___previousCLKDeviceVersion_1;

  if (v10 != v11) {
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_1);
  double v14 = *(double *)&_LayoutConstants_constants_0;
  double v15 = *(double *)&_LayoutConstants_constants_1;
  double v16 = *(double *)&_LayoutConstants_constants_2;
  double v17 = *(double *)&_LayoutConstants_constants_3;
  double v18 = *(double *)&_LayoutConstants_constants_4;
  double v170 = *(double *)&_LayoutConstants_constants_5;
  double v19 = *(double *)&_LayoutConstants_constants_6;
  double v20 = *(double *)&_LayoutConstants_constants_7;

  v21 = [MEMORY[0x1E4F19A50] systemFontOfSize:v15 weight:*MEMORY[0x1E4FB09D0]];
  v22 = [v21 fontDescriptor];

  v180 = v6;
  v179 = v22;
  if (CLKIsCurrentLocaleNonLatin())
  {
    id v23 = v22;
  }
  else
  {
    id v23 = [v22 fontDescriptorWithSymbolicTraits:1];
  }
  v178 = v23;
  v24 = [MEMORY[0x1E4F19A50] fontWithDescriptor:v23 size:v15];
  objc_storeStrong((id *)&v3->_statusFont, v24);
  v25 = [MEMORY[0x1E4F19A50] systemFontOfSize:v14 weight:*MEMORY[0x1E4FB09D8]];
  regularMatchupFont = v3->_regularMatchupFont;
  v3->_regularMatchupFont = v25;
  v187 = v25;

  v27 = [MEMORY[0x1E4F19A50] systemFontOfSize:v14 weight:*MEMORY[0x1E4FB09B8]];
  objc_storeStrong((id *)&v3->_boldMatchupFont, v27);
  v28 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.6];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__NTKUpNextMatchupScoreView_initWithFrame___block_invoke;
  aBlock[3] = &unk_1E62C0910;
  id v196 = v28;
  id v197 = v24;
  v29 = v3;
  v198 = v29;
  id v177 = v24;
  id v176 = v28;
  v30 = (void (**)(void))_Block_copy(aBlock);
  v31 = v30 + 2;
  v32 = v30;
  v175 = v30;
  uint64_t v33 = ((void (*)(void))v30[2])();
  statusLabel = v29->_statusLabel;
  v29->_statusLabel = (CLKUIColoringLabel *)v33;

  uint64_t v35 = (*v31)(v32);
  timeLabel = v29->_timeLabel;
  v29->_timeLabel = (CLKUIColoringLabel *)v35;
  v188 = v29;

  v192[0] = MEMORY[0x1E4F143A8];
  v192[1] = 3221225472;
  v192[2] = __43__NTKUpNextMatchupScoreView_initWithFrame___block_invoke_2;
  v192[3] = &unk_1E62C0938;
  id v193 = v27;
  v37 = v29;
  v194 = v37;
  id v174 = v27;
  v38 = (void (**)(void *))_Block_copy(v192);
  v39 = v38 + 2;
  v40 = v38;
  uint64_t v41 = ((void (*)(void))v38[2])();
  id v42 = v37[52];
  v37[52] = (id)v41;

  LODWORD(v43) = 1132068864;
  [v37[52] setContentCompressionResistancePriority:0 forAxis:v43];
  LODWORD(v44) = 1132068864;
  [v37[52] setContentHuggingPriority:0 forAxis:v44];
  uint64_t v45 = (*v39)(v40);
  id v46 = v37[53];
  v37[53] = (id)v45;

  LODWORD(v47) = 1148846080;
  [v37[53] setContentCompressionResistancePriority:0 forAxis:v47];
  LODWORD(v48) = 1148846080;
  [v37[53] setContentHuggingPriority:0 forAxis:v48];
  v173 = v40;
  uint64_t v49 = (*v39)(v40);
  id v50 = v37[55];
  v37[55] = (id)v49;

  LODWORD(v51) = 1132068864;
  [v37[55] setContentCompressionResistancePriority:0 forAxis:v51];
  LODWORD(v52) = 1132068864;
  [v37[55] setContentHuggingPriority:0 forAxis:v52];
  uint64_t v53 = (*v39)(v40);
  id v54 = v37[56];
  v37[56] = (id)v53;

  LODWORD(v55) = 1148846080;
  [v37[56] setContentCompressionResistancePriority:0 forAxis:v55];
  LODWORD(v56) = 1148846080;
  [v37[56] setContentHuggingPriority:0 forAxis:v56];
  v190[0] = MEMORY[0x1E4F143A8];
  v190[1] = 3221225472;
  v190[2] = __43__NTKUpNextMatchupScoreView_initWithFrame___block_invoke_3;
  v190[3] = &unk_1E62C0960;
  v57 = v37;
  v191 = v57;
  v58 = (void (**)(void))_Block_copy(v190);
  v59 = v58 + 2;
  v60 = v58;
  v172 = v58;
  uint64_t v61 = ((void (*)(void))v58[2])();
  id v62 = v57[51];
  v57[51] = (id)v61;

  uint64_t v63 = (*v59)(v60);
  id v64 = v57[54];
  v57[54] = (id)v63;

  id v65 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  id v66 = v57[63];
  v57[63] = v65;

  [v57 addLayoutGuide:v57[63]];
  [v57[63] setIdentifier:@"UpNextMatchupLogoLayoutGuide"];
  id v67 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  id v68 = v57[64];
  v57[64] = v67;

  [v57 addLayoutGuide:v57[64]];
  [v57[64] setIdentifier:@"UpNextMatchupDescriptionLayoutGuide"];
  v69 = [v37[52] leadingAnchor];
  v70 = [v57[63] trailingAnchor];
  v71 = [v69 constraintEqualToAnchor:v70 constant:v18];
  v202[0] = v71;
  [v37[55] leadingAnchor];
  v72 = v181 = v3;
  v73 = [v57[63] trailingAnchor];
  v74 = [v72 constraintEqualToAnchor:v73 constant:v18];
  v202[1] = v74;
  uint64_t v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v202 count:2];
  id v76 = v57[65];
  v57[65] = (id)v75;

  v77 = [v37[53] firstBaselineAnchor];
  v78 = [v57 topAnchor];
  v79 = [v77 constraintEqualToAnchor:v78 constant:v16 + v17];
  v201 = v79;
  uint64_t v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v201 count:1];
  id v81 = v57[66];
  v57[66] = (id)v80;

  v82 = [v57[64] leadingAnchor];
  v83 = [v37[53] leadingAnchor];
  v186 = [v82 constraintLessThanOrEqualToAnchor:v83];

  LODWORD(v84) = 1148846080;
  [v186 setPriority:v84];
  v85 = [v57[64] leadingAnchor];
  v86 = [v37[56] leadingAnchor];
  v185 = [v85 constraintLessThanOrEqualToAnchor:v86];

  LODWORD(v87) = 1148846080;
  [v185 setPriority:v87];
  v88 = [v57[64] leadingAnchor];
  v89 = [v37[53] leadingAnchor];
  v90 = [v88 constraintEqualToAnchor:v89];

  v169 = v90;
  LODWORD(v91) = 1144750080;
  [v90 setPriority:v91];
  v92 = [v57[64] leadingAnchor];
  v93 = [v37[56] leadingAnchor];
  v94 = [v92 constraintEqualToAnchor:v93];

  v167 = v94;
  LODWORD(v95) = 1144750080;
  [v94 setPriority:v95];
  LODWORD(v96) = 1148846080;
  [(CLKUIColoringLabel *)v188->_timeLabel setContentCompressionResistancePriority:0 forAxis:v96];
  LODWORD(v97) = 1144750080;
  [(CLKUIColoringLabel *)v188->_statusLabel setContentCompressionResistancePriority:0 forAxis:v97];
  v168 = [v37[53] trailingAnchor];
  v166 = [v57[64] trailingAnchor];
  v165 = [v168 constraintEqualToAnchor:v166];
  v200[0] = v165;
  v164 = [v37[56] trailingAnchor];
  v163 = [v57[64] trailingAnchor];
  v162 = [v164 constraintEqualToAnchor:v163];
  v200[1] = v162;
  v200[2] = v186;
  v200[3] = v185;
  v200[4] = v90;
  v200[5] = v94;
  v161 = [v37[52] trailingAnchor];
  v160 = [v57[64] leadingAnchor];
  double v98 = -v170;
  v171 = [v161 constraintEqualToAnchor:v160 constant:-v170];
  v200[6] = v171;
  v159 = [v37[55] trailingAnchor];
  v158 = [v57[64] leadingAnchor];
  v157 = [v159 constraintEqualToAnchor:v158 constant:v98];
  v200[7] = v157;
  v156 = [(CLKUIColoringLabel *)v188->_statusLabel trailingAnchor];
  v155 = [(CLKUIColoringLabel *)v188->_timeLabel leadingAnchor];
  v154 = [v156 constraintEqualToAnchor:v155 constant:v98];
  v200[8] = v154;
  v153 = [v57[51] centerXAnchor];
  v152 = [v57[63] centerXAnchor];
  v151 = [v153 constraintEqualToAnchor:v152];
  v200[9] = v151;
  v150 = [v57[51] centerYAnchor];
  v149 = [v37[53] firstBaselineAnchor];
  [(CLKFont *)v187 capHeight];
  v148 = [v150 constraintEqualToAnchor:v149 constant:v99 * -0.5];
  v200[10] = v148;
  v147 = [v57[51] widthAnchor];
  v145 = [v147 constraintLessThanOrEqualToConstant:v19];
  v200[11] = v145;
  v144 = [v57[51] heightAnchor];
  v143 = [v144 constraintLessThanOrEqualToConstant:v20];
  v200[12] = v143;
  v142 = [v57[54] centerXAnchor];
  v141 = [v57[63] centerXAnchor];
  v140 = [v142 constraintEqualToAnchor:v141];
  v200[13] = v140;
  v139 = [v57[54] centerYAnchor];
  v138 = [v37[56] firstBaselineAnchor];
  [(CLKFont *)v187 capHeight];
  v137 = [v139 constraintEqualToAnchor:v138 constant:v100 * -0.5];
  v200[14] = v137;
  v136 = [v57[54] widthAnchor];
  v135 = [v136 constraintLessThanOrEqualToConstant:v19];
  v200[15] = v135;
  v146 = [v57[54] heightAnchor];
  v134 = [v146 constraintLessThanOrEqualToConstant:v20];
  v200[16] = v134;
  v132 = [v57[63] topAnchor];
  v131 = [v57 topAnchor];
  v130 = [v132 constraintEqualToAnchor:v131];
  v200[17] = v130;
  v129 = [v57[63] leadingAnchor];
  v128 = [v57 leadingAnchor];
  v127 = [v129 constraintEqualToAnchor:v128];
  v200[18] = v127;
  v126 = [v57[63] bottomAnchor];
  v125 = [v57 bottomAnchor];
  v124 = [v126 constraintEqualToAnchor:v125];
  v200[19] = v124;
  v133 = [v57[63] widthAnchor];
  v123 = [v133 constraintEqualToConstant:v19];
  v200[20] = v123;
  v122 = [v57[64] trailingAnchor];
  v121 = [v57 trailingAnchor];
  v120 = [v122 constraintEqualToAnchor:v121];
  v200[21] = v120;
  v119 = [(CLKUIColoringLabel *)v188->_timeLabel trailingAnchor];
  v118 = [v57 trailingAnchor];
  v117 = [v119 constraintEqualToAnchor:v118];
  v200[22] = v117;
  v116 = [v37[53] firstBaselineAnchor];
  v182 = [v37[52] firstBaselineAnchor];
  v115 = [v116 constraintEqualToAnchor:v182];
  v200[23] = v115;
  v114 = [v37[56] firstBaselineAnchor];
  v183 = [v37[55] firstBaselineAnchor];
  v113 = [v114 constraintEqualToAnchor:v183];
  v200[24] = v113;
  v184 = [(CLKUIColoringLabel *)v188->_timeLabel firstBaselineAnchor];
  v112 = [(CLKUIColoringLabel *)v188->_statusLabel firstBaselineAnchor];
  v111 = [v184 constraintEqualToAnchor:v112];
  v200[25] = v111;
  v110 = [(CLKUIColoringLabel *)v188->_statusLabel leadingAnchor];
  v101 = [v57 leadingAnchor];
  v102 = [v110 constraintEqualToAnchor:v101];
  v200[26] = v102;
  v103 = [v37[56] firstBaselineAnchor];
  v104 = [v37[53] firstBaselineAnchor];
  v105 = [v103 constraintEqualToAnchor:v104 constant:v16];
  v200[27] = v105;
  v106 = [(CLKUIColoringLabel *)v188->_statusLabel firstBaselineAnchor];
  v107 = [v37[56] firstBaselineAnchor];
  v108 = [v106 constraintEqualToAnchor:v107 constant:v16];
  v200[28] = v108;
  v189 = [MEMORY[0x1E4F1C978] arrayWithObjects:v200 count:29];

  v3 = v181;
  [v57 addConstraints:v189];
  [v57 addConstraints:v57[65]];
  [v57 addConstraints:v57[66]];

  return v3;
}

id __43__NTKUpNextMatchupScoreView_initWithFrame___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)off_1E62BDB58);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setTextColor:*(void *)(a1 + 32)];
  [v3 setFont:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addSubview:v3];

  return v3;
}

id __43__NTKUpNextMatchupScoreView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc((Class)off_1E62BDB58);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setTextColor:v4];

  [v3 setFont:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addSubview:v3];

  return v3;
}

id __43__NTKUpNextMatchupScoreView_initWithFrame___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1838]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setContentMode:1];
  [*(id *)(a1 + 32) addSubview:v3];

  return v3;
}

- (void)configureWithMatchup:(id)a3
{
  id v60 = a3;
  homeLogoImageView = self->_homeLogoImageView;
  v5 = [v60 homeTeamImage];
  id v6 = [v5 image];
  [(UIImageView *)homeLogoImageView setImage:v6];

  awayLogoIamgeView = self->_awayLogoIamgeView;
  v8 = [v60 awayTeamImage];
  id v9 = [v8 image];
  [(UIImageView *)awayLogoIamgeView setImage:v9];

  homeNameLabel = self->_homeNameLabel;
  uint64_t v11 = [v60 homeTeamName];
  [(CLKUIColoringLabel *)homeNameLabel setText:v11];

  homeDescriptionLabel = self->_homeDescriptionLabel;
  uint64_t v13 = [v60 homeTeamDetail];
  [(CLKUIColoringLabel *)homeDescriptionLabel setText:v13];

  awayNameLabel = self->_awayNameLabel;
  double v15 = [v60 awayTeamName];
  [(CLKUIColoringLabel *)awayNameLabel setText:v15];

  awayDescriptionLabel = self->_awayDescriptionLabel;
  double v17 = [v60 awayTeamDetail];
  [(CLKUIColoringLabel *)awayDescriptionLabel setText:v17];

  timeForLabel = self->_timeForLabel;
  self->_timeForLabel = 0;

  switch([v60 status])
  {
    case 0:
    case 1:
      [(CLKUIColoringLabel *)self->_homeNameLabel setFont:self->_regularMatchupFont];
      [(CLKUIColoringLabel *)self->_awayNameLabel setFont:self->_regularMatchupFont];
      [(CLKUIColoringLabel *)self->_homeDescriptionLabel setFont:self->_regularMatchupFont];
      [(CLKUIColoringLabel *)self->_awayDescriptionLabel setFont:self->_regularMatchupFont];
      double v19 = self->_homeDescriptionLabel;
      double v20 = [(CLKUIColoringLabel *)self->_statusLabel textColor];
      [(CLKUIColoringLabel *)v19 setTextColor:v20];

      v21 = self->_awayDescriptionLabel;
      v22 = [(CLKUIColoringLabel *)self->_statusLabel textColor];
      [(CLKUIColoringLabel *)v21 setTextColor:v22];

      id v23 = (void *)MEMORY[0x1E4F19AE0];
      v24 = [v60 matchupStartDate];
      v25 = [v23 textProviderWithDate:v24];

      v26 = NTKClockFaceLocalizedString(@"UP_NEXT_MATCHUP_FORMAT", @"7:15PM Game");
      v27 = objc_msgSend(MEMORY[0x1E4F19AC0], "textProviderWithFormat:", v26, v25);
      [v27 finalize];
      [(CLKUIColoringLabel *)self->_statusLabel setTextProvider:v27];
      +[NTKUpNextBaseCell clearLabel:self->_timeLabel];

      goto LABEL_16;
    case 2:
      [(CLKUIColoringLabel *)self->_homeNameLabel setFont:self->_boldMatchupFont];
      [(CLKUIColoringLabel *)self->_awayNameLabel setFont:self->_boldMatchupFont];
      [(CLKUIColoringLabel *)self->_homeDescriptionLabel setFont:self->_regularMatchupFont];
      [(CLKUIColoringLabel *)self->_awayDescriptionLabel setFont:self->_regularMatchupFont];
      v28 = self->_homeDescriptionLabel;
      v29 = [(CLKUIColoringLabel *)self->_homeNameLabel textColor];
      [(CLKUIColoringLabel *)v28 setTextColor:v29];

      v30 = self->_awayDescriptionLabel;
      v31 = [(CLKUIColoringLabel *)self->_awayNameLabel textColor];
      [(CLKUIColoringLabel *)v30 setTextColor:v31];

      v32 = [v60 matchupDateFetched];
      uint64_t v33 = self->_timeForLabel;
      self->_timeForLabel = v32;

      [(NTKUpNextMatchupScoreView *)self updateTimeLabel];
      statusLabel = self->_statusLabel;
      uint64_t v35 = (void *)MEMORY[0x1E4F19AB0];
      uint64_t v36 = [v60 matchupProgress];
      v37 = (void *)v36;
      if (v36) {
        v38 = (__CFString *)v36;
      }
      else {
        v38 = &stru_1F1635E90;
      }
      v39 = [v35 textProviderWithText:v38];
      [(CLKUIColoringLabel *)statusLabel setTextProvider:v39];

      break;
    case 3:
      [(CLKUIColoringLabel *)self->_homeNameLabel setFont:self->_boldMatchupFont];
      [(CLKUIColoringLabel *)self->_awayNameLabel setFont:self->_boldMatchupFont];
      v40 = self->_homeDescriptionLabel;
      goto LABEL_9;
    case 4:
      [(CLKUIColoringLabel *)self->_homeNameLabel setFont:self->_regularMatchupFont];
      [(CLKUIColoringLabel *)self->_awayNameLabel setFont:self->_regularMatchupFont];
      v40 = self->_homeDescriptionLabel;
LABEL_9:
      [(CLKUIColoringLabel *)v40 setFont:self->_regularMatchupFont];
      [(CLKUIColoringLabel *)self->_awayDescriptionLabel setFont:self->_regularMatchupFont];
      uint64_t v41 = self->_homeDescriptionLabel;
      id v42 = [(CLKUIColoringLabel *)self->_statusLabel textColor];
      [(CLKUIColoringLabel *)v41 setTextColor:v42];

      double v43 = self->_awayDescriptionLabel;
      double v44 = [(CLKUIColoringLabel *)self->_statusLabel textColor];
      [(CLKUIColoringLabel *)v43 setTextColor:v44];

      uint64_t v45 = (void *)MEMORY[0x1E4F19AB0];
      id v46 = [v60 matchupProgress];
      v25 = [v45 textProviderWithText:v46];

      goto LABEL_15;
    case 5:
      [(CLKUIColoringLabel *)self->_homeNameLabel setFont:self->_boldMatchupFont];
      [(CLKUIColoringLabel *)self->_awayNameLabel setFont:self->_boldMatchupFont];
      [(CLKUIColoringLabel *)self->_homeDescriptionLabel setFont:self->_boldMatchupFont];
      double v47 = self->_awayDescriptionLabel;
      boldMatchupFont = self->_boldMatchupFont;
      goto LABEL_14;
    case 6:
      uint64_t v49 = 480;
      [(CLKUIColoringLabel *)self->_homeNameLabel setFont:self->_boldMatchupFont];
      id v50 = self->_awayNameLabel;
      uint64_t v51 = 488;
      goto LABEL_13;
    case 7:
      uint64_t v49 = 488;
      [(CLKUIColoringLabel *)self->_homeNameLabel setFont:self->_regularMatchupFont];
      id v50 = self->_awayNameLabel;
      uint64_t v51 = 480;
LABEL_13:
      [(CLKUIColoringLabel *)v50 setFont:*(Class *)((char *)&self->super.super.super.isa + v51)];
      [(CLKUIColoringLabel *)self->_homeDescriptionLabel setFont:*(Class *)((char *)&self->super.super.super.isa + v49)];
      double v47 = self->_awayDescriptionLabel;
      boldMatchupFont = *(CLKFont **)((char *)&self->super.super.super.isa + v51);
LABEL_14:
      [(CLKUIColoringLabel *)v47 setFont:boldMatchupFont];
      double v52 = self->_homeDescriptionLabel;
      uint64_t v53 = [(CLKUIColoringLabel *)self->_homeNameLabel textColor];
      [(CLKUIColoringLabel *)v52 setTextColor:v53];

      id v54 = self->_awayDescriptionLabel;
      double v55 = [(CLKUIColoringLabel *)self->_awayNameLabel textColor];
      [(CLKUIColoringLabel *)v54 setTextColor:v55];

      double v56 = (void *)MEMORY[0x1E4F19AB0];
      v57 = [v60 matchupProgress];
      v25 = [v56 textProviderWithText:v57];

LABEL_15:
      [(CLKUIColoringLabel *)self->_statusLabel setTextProvider:v25];
      +[NTKUpNextBaseCell clearLabel:self->_timeLabel];
LABEL_16:

      break;
    default:
      break;
  }
  v58 = [(CLKUIColoringLabel *)self->_statusLabel textProvider];
  objc_msgSend(v58, "setPaused:", -[NTKUpNextMatchupScoreView isPaused](self, "isPaused"));

  v59 = [(CLKUIColoringLabel *)self->_timeLabel textProvider];
  objc_msgSend(v59, "setPaused:", -[NTKUpNextMatchupScoreView isPaused](self, "isPaused"));
}

- (void)updateTimeLabel
{
  if (self->_timeForLabel)
  {
    uint64_t v3 = [(id)objc_opt_class() _timeStringForFetchDate:self->_timeForLabel];
    v4 = (void *)v3;
    v5 = &stru_1F1635E90;
    if (v3) {
      v5 = (__CFString *)v3;
    }
    id v6 = v5;

    timeLabel = self->_timeLabel;
    id v8 = [MEMORY[0x1E4F19AB0] textProviderWithText:v6];

    [(CLKUIColoringLabel *)timeLabel setTextProvider:v8];
  }
}

+ (id)_timeStringForFetchDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = [v5 components:126 fromDate:v6];
  id v8 = [v5 components:126 fromDate:v4];

  id v9 = [v5 components:96 fromDateComponents:v7 toDateComponents:v8 options:0];
  uint64_t v10 = [v9 hour];
  uint64_t v11 = [v9 minute];
  uint64_t v12 = v11;
  if (v10 < 0 || v11 < 0)
  {
    if (v10)
    {
      if (v10 >= 0) {
        uint64_t v14 = v10;
      }
      else {
        uint64_t v14 = -v10;
      }
      double v15 = NTKClockFaceLocalizedString(@"COUNTDOWN_HOUR_SHORT", @"H");
      double v16 = [v15 localizedLowercaseString];

      uint64_t v10 = [NSString localizedStringWithFormat:@"%d%@", v14, v16];
    }
    if (v12)
    {
      double v17 = NTKClockFaceLocalizedString(@"COUNTDOWN_MINUTE_SHORT", @"M");
      double v18 = [v17 localizedLowercaseString];

      if (v12 >= 0) {
        uint64_t v19 = v12;
      }
      else {
        uint64_t v19 = -v12;
      }
      double v20 = [NSString localizedStringWithFormat:@"%ld%@", v19, v18];
      if ([(id)v10 length])
      {
        id v21 = [NSString stringWithFormat:@"%@ %@", v10, v20];
      }
      else
      {
        id v21 = v20;
      }
      uint64_t v22 = (uint64_t)v21;

      uint64_t v10 = v22;
    }
    id v23 = NSString;
    v24 = NTKClockFaceLocalizedString(@"UP_NEXT_SPORTS_TIME_SINCE", @"%@ ago");
    uint64_t v13 = objc_msgSend(v23, "stringWithFormat:", v24, v10);
  }
  else
  {
    uint64_t v13 = NTKClockFaceLocalizedString(@"COUNTDOWN_NOW", @"now");
  }

  return v13;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CLKUIColoringLabel *)self->_statusLabel textProvider];
  [v5 setPaused:v3];

  id v6 = [(CLKUIColoringLabel *)self->_timeLabel textProvider];
  [v6 setPaused:v3];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.6];
  id v19 = (id)v5;
  if (fabs(a3) >= 0.00000011920929)
  {
    uint64_t v10 = [MEMORY[0x1E4FB1618] whiteColor];
    id v9 = NTKInterpolateBetweenColors();

    [(CLKUIColoringLabel *)self->_statusLabel setTextColor:v9];
    [(CLKUIColoringLabel *)self->_timeLabel setTextColor:v9];
    uint64_t v11 = [(NTKUpNextMatchupScoreView *)self filterProvider];
    uint64_t v12 = [v11 filtersForView:self style:2 fraction:a3];

    if (v12)
    {
      uint64_t v13 = [(CLKUIColoringLabel *)self->_homeNameLabel layer];
      [v13 setFilters:v12];

      uint64_t v14 = [(CLKUIColoringLabel *)self->_awayNameLabel layer];
      [v14 setFilters:v12];
    }
    double v15 = [(NTKUpNextMatchupScoreView *)self filterProvider];
    double v16 = [v15 filtersForView:self style:1 fraction:a3];

    if (v16)
    {
      double v17 = [(UIImageView *)self->_homeLogoImageView layer];
      [v17 setFilters:v16];

      double v18 = [(UIImageView *)self->_awayLogoIamgeView layer];
      [v18 setFilters:v16];
    }
  }
  else
  {
    [(CLKUIColoringLabel *)self->_timeLabel setTextColor:v5];
    [(CLKUIColoringLabel *)self->_statusLabel setTextColor:v19];
    homeNameLabel = self->_homeNameLabel;
    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)homeNameLabel setTextColor:v7];

    awayNameLabel = self->_awayNameLabel;
    id v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)awayNameLabel setTextColor:v9];
  }
}

- (void)updateMonochromeColor
{
  statusLabel = self->_statusLabel;
  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)statusLabel setTextColor:v4];

  timeLabel = self->_timeLabel;
  id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)timeLabel setTextColor:v6];

  homeNameLabel = self->_homeNameLabel;
  id v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)homeNameLabel setTextColor:v8];

  awayNameLabel = self->_awayNameLabel;
  uint64_t v10 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)awayNameLabel setTextColor:v10];

  uint64_t v11 = [(NTKUpNextMatchupScoreView *)self filterProvider];
  id v18 = [v11 filtersForView:self style:2];

  if (v18)
  {
    uint64_t v12 = [(CLKUIColoringLabel *)self->_homeNameLabel layer];
    [v12 setFilters:v18];

    uint64_t v13 = [(CLKUIColoringLabel *)self->_awayNameLabel layer];
    [v13 setFilters:v18];
  }
  uint64_t v14 = [(NTKUpNextMatchupScoreView *)self filterProvider];
  double v15 = [v14 filtersForView:self style:1];

  if (v15)
  {
    double v16 = [(UIImageView *)self->_homeLogoImageView layer];
    [v16 setFilters:v15];

    double v17 = [(UIImageView *)self->_awayLogoIamgeView layer];
    [v17 setFilters:v15];
  }
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_withoutDateLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_withLogoLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_descriptionLayoutGuide, 0);
  objc_storeStrong((id *)&self->_logoLayoutGuide, 0);
  objc_storeStrong((id *)&self->_statusFont, 0);
  objc_storeStrong((id *)&self->_regularMatchupFont, 0);
  objc_storeStrong((id *)&self->_boldMatchupFont, 0);
  objc_storeStrong((id *)&self->_timeForLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_awayDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_awayNameLabel, 0);
  objc_storeStrong((id *)&self->_awayLogoIamgeView, 0);
  objc_storeStrong((id *)&self->_homeDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_homeNameLabel, 0);

  objc_storeStrong((id *)&self->_homeLogoImageView, 0);
}

@end