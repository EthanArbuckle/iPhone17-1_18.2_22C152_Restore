@interface NTKUpNextMatchupCell
- (NTKUpNextMatchupCell)initWithFrame:(CGRect)a3;
- (void)configureWithContent:(id)a3;
- (void)prepareForReuse;
- (void)setFilterProvider:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
- (void)updateTimeLabel;
@end

@implementation NTKUpNextMatchupCell

- (NTKUpNextMatchupCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v93[16] = *MEMORY[0x1E4F143B8];
  v92.receiver = self;
  v92.super_class = (Class)NTKUpNextMatchupCell;
  v7 = -[NTKUpNextBaseCell initWithFrame:](&v92, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    id v9 = [(NTKUpNextBaseCell *)v7 device];
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_62);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_62);
    if (WeakRetained)
    {
      v11 = WeakRetained;
      id v12 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_62);
      if (v12 == v9)
      {
        uint64_t v13 = [v9 version];
        uint64_t v14 = _LayoutConstants___previousCLKDeviceVersion_62;

        if (v13 == v14)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_62);
          double v17 = *(double *)&_LayoutConstants_constants_1_7;
          double v18 = *(double *)&_LayoutConstants_constants_3_5;
          double v19 = *(double *)&_LayoutConstants_constants_5_2;
          double v20 = *(double *)&_LayoutConstants_constants_7_2;

          v21 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
          scoreLayoutGuide = v8->_scoreLayoutGuide;
          v8->_scoreLayoutGuide = v21;

          [(UILayoutGuide *)v8->_scoreLayoutGuide setIdentifier:@"NTKUpNextMatchupCellScoreGuide"];
          v23 = [(NTKUpNextMatchupCell *)v8 contentView];
          [v23 addLayoutGuide:v8->_scoreLayoutGuide];

          v24 = -[NTKUpNextMatchupScoreView initWithFrame:]([NTKUpNextMatchupScoreView alloc], "initWithFrame:", x, y, width, height);
          scoreView = v8->_scoreView;
          v8->_scoreView = v24;

          [(NTKUpNextMatchupScoreView *)v8->_scoreView setTranslatesAutoresizingMaskIntoConstraints:0];
          v26 = [(NTKUpNextMatchupCell *)v8 contentView];
          [v26 addSubview:v8->_scoreView];

          v27 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
          upcomingLayoutGuide = v8->_upcomingLayoutGuide;
          v8->_upcomingLayoutGuide = v27;

          [(UILayoutGuide *)v8->_upcomingLayoutGuide setIdentifier:@"NTKUpNextMatchupCellUpcomingGuide"];
          v29 = [(NTKUpNextMatchupCell *)v8 contentView];
          [v29 addLayoutGuide:v8->_upcomingLayoutGuide];

          v30 = -[NTKUpNextMatchupUpcomingView initWithFrame:]([NTKUpNextMatchupUpcomingView alloc], "initWithFrame:", x, y, width, height);
          upcomingView = v8->_upcomingView;
          v8->_upcomingView = v30;

          [(NTKUpNextMatchupUpcomingView *)v8->_upcomingView setTranslatesAutoresizingMaskIntoConstraints:0];
          v32 = [(NTKUpNextMatchupCell *)v8 contentView];
          [v32 addSubview:v8->_upcomingView];

          v90 = [(UILayoutGuide *)v8->_scoreLayoutGuide topAnchor];
          v91 = [(NTKUpNextMatchupCell *)v8 contentView];
          v89 = [v91 topAnchor];
          v88 = [v90 constraintEqualToAnchor:v89 constant:0.0];
          v93[0] = v88;
          v86 = [(UILayoutGuide *)v8->_scoreLayoutGuide bottomAnchor];
          v87 = [(NTKUpNextMatchupCell *)v8 contentView];
          v85 = [v87 bottomAnchor];
          v84 = [v86 constraintEqualToAnchor:v85 constant:-0.0];
          v93[1] = v84;
          v82 = [(UILayoutGuide *)v8->_scoreLayoutGuide leadingAnchor];
          v83 = [(NTKUpNextMatchupCell *)v8 contentView];
          v81 = [v83 leadingAnchor];
          v80 = [v82 constraintEqualToAnchor:v81 constant:v17];
          v93[2] = v80;
          v78 = [(UILayoutGuide *)v8->_scoreLayoutGuide trailingAnchor];
          v79 = [(NTKUpNextMatchupCell *)v8 contentView];
          v77 = [v79 trailingAnchor];
          v76 = [v78 constraintEqualToAnchor:v77 constant:-v18];
          v93[3] = v76;
          v75 = [(NTKUpNextMatchupScoreView *)v8->_scoreView topAnchor];
          v74 = [(UILayoutGuide *)v8->_scoreLayoutGuide topAnchor];
          v73 = [v75 constraintEqualToAnchor:v74];
          v93[4] = v73;
          v72 = [(NTKUpNextMatchupScoreView *)v8->_scoreView bottomAnchor];
          v71 = [(UILayoutGuide *)v8->_scoreLayoutGuide bottomAnchor];
          v70 = [v72 constraintEqualToAnchor:v71];
          v93[5] = v70;
          v69 = [(NTKUpNextMatchupScoreView *)v8->_scoreView leadingAnchor];
          v68 = [(UILayoutGuide *)v8->_scoreLayoutGuide leadingAnchor];
          v67 = [v69 constraintEqualToAnchor:v68];
          v93[6] = v67;
          v66 = [(NTKUpNextMatchupScoreView *)v8->_scoreView trailingAnchor];
          v65 = [(UILayoutGuide *)v8->_scoreLayoutGuide trailingAnchor];
          v64 = [v66 constraintEqualToAnchor:v65];
          v93[7] = v64;
          v62 = [(UILayoutGuide *)v8->_upcomingLayoutGuide topAnchor];
          v63 = [(NTKUpNextMatchupCell *)v8 contentView];
          v61 = [v63 topAnchor];
          v60 = [v62 constraintEqualToAnchor:v61 constant:0.0];
          v93[8] = v60;
          v58 = [(UILayoutGuide *)v8->_upcomingLayoutGuide bottomAnchor];
          v59 = [(NTKUpNextMatchupCell *)v8 contentView];
          v56 = [v59 bottomAnchor];
          v55 = [v58 constraintEqualToAnchor:v56 constant:-0.0];
          v93[9] = v55;
          v53 = [(UILayoutGuide *)v8->_upcomingLayoutGuide leadingAnchor];
          v54 = [(NTKUpNextMatchupCell *)v8 contentView];
          v52 = [v54 leadingAnchor];
          v51 = [v53 constraintEqualToAnchor:v52 constant:v19];
          v93[10] = v51;
          v49 = [(UILayoutGuide *)v8->_upcomingLayoutGuide trailingAnchor];
          v50 = [(NTKUpNextMatchupCell *)v8 contentView];
          v48 = [v50 trailingAnchor];
          v47 = [v49 constraintEqualToAnchor:v48 constant:-v20];
          v93[11] = v47;
          v46 = [(NTKUpNextMatchupUpcomingView *)v8->_upcomingView topAnchor];
          v45 = [(UILayoutGuide *)v8->_upcomingLayoutGuide topAnchor];
          v44 = [v46 constraintEqualToAnchor:v45];
          v93[12] = v44;
          v33 = [(NTKUpNextMatchupUpcomingView *)v8->_upcomingView bottomAnchor];
          v34 = [(UILayoutGuide *)v8->_upcomingLayoutGuide bottomAnchor];
          v35 = [v33 constraintEqualToAnchor:v34];
          v93[13] = v35;
          v36 = [(NTKUpNextMatchupUpcomingView *)v8->_upcomingView leadingAnchor];
          v37 = [(UILayoutGuide *)v8->_upcomingLayoutGuide leadingAnchor];
          v38 = [v36 constraintEqualToAnchor:v37];
          v93[14] = v38;
          v39 = [(NTKUpNextMatchupUpcomingView *)v8->_upcomingView trailingAnchor];
          v40 = [(UILayoutGuide *)v8->_upcomingLayoutGuide trailingAnchor];
          v41 = [v39 constraintEqualToAnchor:v40];
          v93[15] = v41;
          v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:16];

          v42 = [(NTKUpNextMatchupCell *)v8 contentView];
          [v42 addConstraints:v57];

          return v8;
        }
      }
      else
      {
      }
    }
    id v15 = objc_storeWeak(&_LayoutConstants___cachedDevice_62, v9);
    _LayoutConstants___previousCLKDeviceVersion_62 = [v9 version];

    ___LayoutConstants_block_invoke_59(v16, (uint64_t)v9);
    goto LABEL_7;
  }
  return v8;
}

- (void)configureWithContent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKUpNextMatchupCell;
  id v4 = a3;
  [(NTKUpNextBaseCell *)&v8 configureWithContent:v4];
  v5 = objc_msgSend(v4, "matchupAccessory", v8.receiver, v8.super_class);

  [(NTKUpNextMatchupScoreView *)self->_scoreView configureWithMatchup:v5];
  [(NTKUpNextMatchupUpcomingView *)self->_upcomingView configureWithMatchup:v5];
  unint64_t v6 = [v5 status];
  uint64_t v7 = (v6 < 8) & (0xECu >> v6);
  [(NTKUpNextMatchupScoreView *)self->_scoreView setHidden:!((v6 < 8) & (0xECu >> v6))];
  [(NTKUpNextMatchupUpcomingView *)self->_upcomingView setHidden:v7];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)NTKUpNextMatchupCell;
  [(NTKUpNextBaseCell *)&v3 prepareForReuse];
  [(NTKUpNextMatchupScoreView *)self->_scoreView transitionToMonochromeWithFraction:0.0];
  [(NTKUpNextMatchupUpcomingView *)self->_upcomingView transitionToMonochromeWithFraction:0.0];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[NTKUpNextMatchupScoreView transitionToMonochromeWithFraction:](self->_scoreView, "transitionToMonochromeWithFraction:");
  upcomingView = self->_upcomingView;

  [(NTKUpNextMatchupUpcomingView *)upcomingView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  [(NTKUpNextMatchupScoreView *)self->_scoreView updateMonochromeColor];
  upcomingView = self->_upcomingView;

  [(NTKUpNextMatchupUpcomingView *)upcomingView updateMonochromeColor];
}

- (void)setFilterProvider:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextMatchupCell;
  id v4 = a3;
  [(NTKUpNextBaseCell *)&v5 setFilterProvider:v4];
  -[NTKUpNextMatchupScoreView setFilterProvider:](self->_scoreView, "setFilterProvider:", v4, v5.receiver, v5.super_class);
  [(NTKUpNextMatchupUpcomingView *)self->_upcomingView setFilterProvider:v4];
}

- (void)updateTimeLabel
{
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextMatchupCell;
  -[NTKUpNextBaseCell setPaused:](&v5, sel_setPaused_);
  [(NTKUpNextMatchupScoreView *)self->_scoreView setPaused:v3];
  [(NTKUpNextMatchupUpcomingView *)self->_upcomingView setPaused:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upcomingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_scoreLayoutGuide, 0);
  objc_storeStrong((id *)&self->_upcomingView, 0);

  objc_storeStrong((id *)&self->_scoreView, 0);
}

@end