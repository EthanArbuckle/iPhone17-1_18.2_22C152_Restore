@interface NTKUpNextMatchupUpcomingView
- (BOOL)isPaused;
- (CLKMonochromeFilterProvider)filterProvider;
- (NTKUpNextMatchupUpcomingView)initWithFrame:(CGRect)a3;
- (void)configureWithMatchup:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKUpNextMatchupUpcomingView

- (NTKUpNextMatchupUpcomingView)initWithFrame:(CGRect)a3
{
  v105[20] = *MEMORY[0x1E4F143B8];
  v104.receiver = self;
  v104.super_class = (Class)NTKUpNextMatchupUpcomingView;
  v3 = -[NTKUpNextMatchupUpcomingView initWithFrame:](&v104, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CLKRenderingContext sharedRenderingContext];
    v5 = [v4 device];

    id v6 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_20);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_20);
    if (WeakRetained)
    {
      v8 = WeakRetained;
      id v9 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_20);
      if (v9 == v6)
      {
        uint64_t v10 = [v6 version];
        uint64_t v11 = _LayoutConstants___previousCLKDeviceVersion_20;

        if (v10 == v11)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_20);
          double v14 = *(double *)&_LayoutConstants_constants_0_2;
          double v15 = *(double *)&_LayoutConstants_constants_1_2;
          double v97 = *(double *)&_LayoutConstants_constants_2_2;
          double v16 = *(double *)&_LayoutConstants_constants_3_1;
          double v17 = *(double *)&_LayoutConstants_constants_4_1;

          v102 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.6];
          id v18 = objc_alloc(MEMORY[0x1E4FB1838]);
          double v19 = *MEMORY[0x1E4F1DB28];
          double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
          double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
          double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
          uint64_t v23 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], v20, v21, v22);
          homeLogoImageView = v3->_homeLogoImageView;
          v3->_homeLogoImageView = (UIImageView *)v23;

          [(UIImageView *)v3->_homeLogoImageView setTranslatesAutoresizingMaskIntoConstraints:0];
          [(UIImageView *)v3->_homeLogoImageView setContentMode:1];
          [(NTKUpNextMatchupUpcomingView *)v3 addSubview:v3->_homeLogoImageView];
          uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v19, v20, v21, v22);
          awayLogoImageView = v3->_awayLogoImageView;
          v3->_awayLogoImageView = (UIImageView *)v25;

          [(UIImageView *)v3->_awayLogoImageView setTranslatesAutoresizingMaskIntoConstraints:0];
          [(UIImageView *)v3->_awayLogoImageView setContentMode:1];
          [(NTKUpNextMatchupUpcomingView *)v3 addSubview:v3->_awayLogoImageView];
          v103 = NTKClockFaceLocalizedString(@"UP_NEXT_MATCHUP_VERSUS", @"vs");
          v100 = [MEMORY[0x1E4F19AB0] textProviderWithText:v103];
          [v100 finalize];
          v101 = [MEMORY[0x1E4F19A50] systemFontOfSize:v14];
          v27 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc((Class)off_1E62BDB58), "initWithFrame:", v19, v20, v21, v22);
          [(CLKUIColoringLabel *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
          [(CLKUIColoringLabel *)v27 setTextColor:v102];
          [(CLKUIColoringLabel *)v27 setFont:v101];
          [(CLKUIColoringLabel *)v27 setTextProvider:v100];
          [(NTKUpNextMatchupUpcomingView *)v3 addSubview:v27];
          v66 = v6;
          versusLabel = v3->_versusLabel;
          v3->_versusLabel = v27;
          v86 = v27;

          v99 = [MEMORY[0x1E4F19A50] systemFontOfSize:v15 weight:*MEMORY[0x1E4FB09B8]];
          v29 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc((Class)off_1E62BDB58), "initWithFrame:", v19, v20, v21, v22);
          [(CLKUIColoringLabel *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
          v30 = [MEMORY[0x1E4FB1618] whiteColor];
          [(CLKUIColoringLabel *)v29 setTextColor:v30];

          [(CLKUIColoringLabel *)v29 setFont:v99];
          [(NTKUpNextMatchupUpcomingView *)v3 addSubview:v29];
          descriptionLabel = v3->_descriptionLabel;
          v3->_descriptionLabel = v29;
          v78 = v29;

          v32 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
          homeLogoLayoutGuide = v3->_homeLogoLayoutGuide;
          v3->_homeLogoLayoutGuide = v32;

          [(UILayoutGuide *)v3->_homeLogoLayoutGuide setIdentifier:@"NTKUpNextUpcomingHomeLogoView"];
          [(NTKUpNextMatchupUpcomingView *)v3 addLayoutGuide:v3->_homeLogoLayoutGuide];
          v34 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
          awayLogoLayoutGuide = v3->_awayLogoLayoutGuide;
          v3->_awayLogoLayoutGuide = v34;

          [(UILayoutGuide *)v3->_awayLogoLayoutGuide setIdentifier:@"NTKUpNextUpcomingAwayLogoView"];
          [(NTKUpNextMatchupUpcomingView *)v3 addLayoutGuide:v3->_awayLogoLayoutGuide];
          v96 = [(UILayoutGuide *)v3->_homeLogoLayoutGuide leadingAnchor];
          v95 = [(NTKUpNextMatchupUpcomingView *)v3 leadingAnchor];
          v94 = [v96 constraintEqualToAnchor:v95];
          v105[0] = v94;
          v93 = [(UILayoutGuide *)v3->_homeLogoLayoutGuide widthAnchor];
          v92 = [v93 constraintEqualToConstant:v16];
          v105[1] = v92;
          v91 = [(UILayoutGuide *)v3->_homeLogoLayoutGuide heightAnchor];
          v90 = [v91 constraintEqualToConstant:v17];
          v105[2] = v90;
          v89 = [(UILayoutGuide *)v3->_homeLogoLayoutGuide centerYAnchor];
          v88 = [(CLKUIColoringLabel *)v3->_versusLabel centerYAnchor];
          v87 = [v89 constraintEqualToAnchor:v88];
          v105[3] = v87;
          v85 = [(UILayoutGuide *)v3->_awayLogoLayoutGuide trailingAnchor];
          v84 = [(NTKUpNextMatchupUpcomingView *)v3 trailingAnchor];
          v83 = [v85 constraintEqualToAnchor:v84];
          v105[4] = v83;
          v82 = [(UILayoutGuide *)v3->_awayLogoLayoutGuide widthAnchor];
          v81 = [v82 constraintEqualToConstant:v16];
          v105[5] = v81;
          v80 = [(UILayoutGuide *)v3->_awayLogoLayoutGuide heightAnchor];
          v79 = [v80 constraintEqualToConstant:v17];
          v105[6] = v79;
          v77 = [(UILayoutGuide *)v3->_awayLogoLayoutGuide centerYAnchor];
          v76 = [(CLKUIColoringLabel *)v3->_versusLabel centerYAnchor];
          v75 = [v77 constraintEqualToAnchor:v76];
          v105[7] = v75;
          v74 = [(UIImageView *)v3->_homeLogoImageView centerXAnchor];
          v73 = [(UILayoutGuide *)v3->_homeLogoLayoutGuide centerXAnchor];
          v72 = [v74 constraintEqualToAnchor:v73];
          v105[8] = v72;
          v71 = [(UIImageView *)v3->_homeLogoImageView centerYAnchor];
          v70 = [(UILayoutGuide *)v3->_homeLogoLayoutGuide centerYAnchor];
          v69 = [v71 constraintEqualToAnchor:v70];
          v105[9] = v69;
          v68 = [(UIImageView *)v3->_homeLogoImageView widthAnchor];
          v67 = [(UILayoutGuide *)v3->_homeLogoLayoutGuide widthAnchor];
          v65 = [v68 constraintEqualToAnchor:v67];
          v105[10] = v65;
          v64 = [(UIImageView *)v3->_homeLogoImageView heightAnchor];
          v63 = [(UILayoutGuide *)v3->_homeLogoLayoutGuide heightAnchor];
          v62 = [v64 constraintEqualToAnchor:v63];
          v105[11] = v62;
          v61 = [(UIImageView *)v3->_awayLogoImageView centerXAnchor];
          v60 = [(UILayoutGuide *)v3->_awayLogoLayoutGuide centerXAnchor];
          v59 = [v61 constraintEqualToAnchor:v60];
          v105[12] = v59;
          v58 = [(UIImageView *)v3->_awayLogoImageView centerYAnchor];
          v57 = [(UILayoutGuide *)v3->_awayLogoLayoutGuide centerYAnchor];
          v56 = [v58 constraintEqualToAnchor:v57];
          v105[13] = v56;
          v55 = [(UIImageView *)v3->_awayLogoImageView widthAnchor];
          v54 = [(UILayoutGuide *)v3->_awayLogoLayoutGuide widthAnchor];
          v53 = [v55 constraintEqualToAnchor:v54];
          v105[14] = v53;
          v52 = [(UIImageView *)v3->_awayLogoImageView heightAnchor];
          v51 = [(UILayoutGuide *)v3->_awayLogoLayoutGuide heightAnchor];
          v50 = [v52 constraintEqualToAnchor:v51];
          v105[15] = v50;
          v49 = [(CLKUIColoringLabel *)v3->_versusLabel centerXAnchor];
          v48 = [(NTKUpNextMatchupUpcomingView *)v3 centerXAnchor];
          v47 = [v49 constraintEqualToAnchor:v48];
          v105[16] = v47;
          v46 = [(CLKUIColoringLabel *)v3->_versusLabel centerYAnchor];
          v36 = [(NTKUpNextMatchupUpcomingView *)v3 centerYAnchor];
          v37 = [(CLKUIColoringLabel *)v3->_descriptionLabel font];
          [v37 lineHeight];
          CLKRoundForDevice();
          v38 = objc_msgSend(v46, "constraintEqualToAnchor:constant:", v36);
          v105[17] = v38;
          v39 = [(CLKUIColoringLabel *)v3->_descriptionLabel centerXAnchor];
          v40 = [(NTKUpNextMatchupUpcomingView *)v3 centerXAnchor];
          v41 = [v39 constraintEqualToAnchor:v40];
          v105[18] = v41;
          v42 = [(CLKUIColoringLabel *)v3->_descriptionLabel lastBaselineAnchor];
          v43 = [(CLKUIColoringLabel *)v3->_versusLabel lastBaselineAnchor];
          v44 = [v42 constraintEqualToAnchor:v43 constant:v97];
          v105[19] = v44;
          v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:20];

          [(NTKUpNextMatchupUpcomingView *)v3 addConstraints:v98];
          return v3;
        }
      }
      else
      {
      }
    }
    id v12 = objc_storeWeak(&_LayoutConstants___cachedDevice_20, v6);
    _LayoutConstants___previousCLKDeviceVersion_20 = [v6 version];

    ___LayoutConstants_block_invoke_17(v13, (uint64_t)v6);
    goto LABEL_7;
  }
  return v3;
}

- (void)configureWithMatchup:(id)a3
{
  id v23 = a3;
  v4 = [v23 homeTeamImage];
  v5 = [v4 image];

  [(UIImageView *)self->_homeLogoImageView setImage:v5];
  id v6 = [v23 awayTeamImage];
  v7 = [v6 image];

  [(UIImageView *)self->_awayLogoImageView setImage:v7];
  v8 = [v23 matchupStartDate];
  uint64_t v9 = [v23 status];
  if (v9 == 4 || v9 == 3)
  {
    double v17 = (void *)MEMORY[0x1E4F19AB0];
    uint64_t v10 = [v23 matchupProgress];
    id v16 = [v17 textProviderWithText:v10];
  }
  else
  {
    if (v9 != 1)
    {
      id v16 = 0;
      goto LABEL_11;
    }
    uint64_t v10 = [MEMORY[0x1E4F19AE0] textProviderWithDate:v8];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    id v12 = NTKStartOfDayForDate(v11);
    uint64_t v13 = NTKStartOfNextDayForDate(v11);
    double v14 = NTKEndOfDayForDate(v13);

    double v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v12 endDate:v14];
    if ([v15 containsDate:v8])
    {
      id v16 = v10;
    }
    else
    {
      [MEMORY[0x1E4F19A28] textProviderWithDate:v8 units:24];
      id v18 = v22 = v12;
      NTKClockFaceLocalizedString(@"UP_NEXT_MATCHUP_TIME_FORMAT", @"%@, %@");
      double v19 = v21 = v14;
      objc_msgSend(MEMORY[0x1E4F19AC0], "textProviderWithFormat:", v19, v10, v18);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      double v14 = v21;
      id v12 = v22;
    }
  }
LABEL_11:
  [(CLKUIColoringLabel *)self->_descriptionLabel setTextProvider:0];
  [(CLKUIColoringLabel *)self->_descriptionLabel setText:0];
  [v16 finalize];
  [(CLKUIColoringLabel *)self->_descriptionLabel setTextProvider:v16];
  double v20 = [(CLKUIColoringLabel *)self->_descriptionLabel textProvider];
  objc_msgSend(v20, "setPaused:", -[NTKUpNextMatchupUpcomingView isPaused](self, "isPaused"));
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CLKUIColoringLabel *)self->_descriptionLabel textProvider];
  [v4 setPaused:v3];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.6];
  id v16 = (id)v5;
  if (fabs(a3) >= 0.00000011920929)
  {
    v8 = [MEMORY[0x1E4FB1618] whiteColor];
    v7 = NTKInterpolateBetweenColors();

    [(CLKUIColoringLabel *)self->_versusLabel setTextColor:v7];
    uint64_t v9 = [(NTKUpNextMatchupUpcomingView *)self filterProvider];
    uint64_t v10 = [v9 filtersForView:self style:2 fraction:a3];

    if (v10)
    {
      uint64_t v11 = [(CLKUIColoringLabel *)self->_descriptionLabel layer];
      [v11 setFilters:v10];
    }
    id v12 = [(NTKUpNextMatchupUpcomingView *)self filterProvider];
    uint64_t v13 = [v12 filtersForView:self style:1 fraction:a3];

    if (v13)
    {
      double v14 = [(UIImageView *)self->_awayLogoImageView layer];
      [v14 setFilters:v13];

      double v15 = [(UIImageView *)self->_homeLogoImageView layer];
      [v15 setFilters:v13];
    }
  }
  else
  {
    [(CLKUIColoringLabel *)self->_versusLabel setTextColor:v5];
    descriptionLabel = self->_descriptionLabel;
    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)descriptionLabel setTextColor:v7];
  }
}

- (void)updateMonochromeColor
{
  versusLabel = self->_versusLabel;
  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)versusLabel setTextColor:v4];

  descriptionLabel = self->_descriptionLabel;
  id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)descriptionLabel setTextColor:v6];

  v7 = [(NTKUpNextMatchupUpcomingView *)self filterProvider];
  id v13 = [v7 filtersForView:self style:2];

  if (v13)
  {
    v8 = [(CLKUIColoringLabel *)self->_descriptionLabel layer];
    [v8 setFilters:v13];
  }
  uint64_t v9 = [(NTKUpNextMatchupUpcomingView *)self filterProvider];
  uint64_t v10 = [v9 filtersForView:self style:1];

  if (v10)
  {
    uint64_t v11 = [(UIImageView *)self->_awayLogoImageView layer];
    [v11 setFilters:v10];

    id v12 = [(UIImageView *)self->_homeLogoImageView layer];
    [v12 setFilters:v10];
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
  objc_storeStrong((id *)&self->_awayLogoLayoutGuide, 0);
  objc_storeStrong((id *)&self->_homeLogoLayoutGuide, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_versusLabel, 0);
  objc_storeStrong((id *)&self->_awayLogoImageView, 0);
  objc_storeStrong((id *)&self->_homeLogoImageView, 0);
}

@end