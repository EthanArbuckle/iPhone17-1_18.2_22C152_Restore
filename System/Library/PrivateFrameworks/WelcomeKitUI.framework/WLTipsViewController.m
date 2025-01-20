@interface WLTipsViewController
- (WLTips)tips;
- (WLTipsViewController)initWithTips:(id)a3;
- (void)setTips:(id)a3;
- (void)viewDidLoad;
@end

@implementation WLTipsViewController

- (WLTipsViewController)initWithTips:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLTipsViewController;
  v5 = [(WLTipsViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(WLTipsViewController *)v5 setTips:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v141[3] = *MEMORY[0x263EF8340];
  v135.receiver = self;
  v135.super_class = (Class)WLTipsViewController;
  [(WLTipsViewController *)&v135 viewDidLoad];
  v3 = [(WLTips *)self->_tips title];
  [(WLTipsViewController *)self setTitle:v3];

  id v4 = objc_alloc_init(MEMORY[0x263F82B88]);
  v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setAlwaysBounceVertical:1];
  v6 = [(WLTipsViewController *)self view];
  [v6 addSubview:v4];

  v7 = (void *)MEMORY[0x263F827E8];
  objc_super v8 = [(WLTips *)self->_tips image];
  v9 = [v8 light];
  v10 = [v9 localFile];
  v11 = [v7 imageNamed:v10];

  v12 = [(WLTipsViewController *)self view];
  [v12 frame];
  double v14 = v13;

  v15 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16 == 1)
  {
    v17 = [(WLTipsViewController *)self navigationController];
    v18 = [v17 view];
    [v18 frame];
    double v14 = v19;
    double v21 = v20;

    if (v14 == 0.0 || v21 == 0.0)
    {
      v22 = [(WLTipsViewController *)self view];
      [v22 frame];
      double v14 = v23;
    }
  }
  [v11 size];
  double v24 = 0.0;
  if (v25 > 0.0)
  {
    [v11 size];
    double v27 = v14 * v26;
    [v11 size];
    double v24 = v27 / v28;
  }
  v133 = [[WLTipsVideoView alloc] initWithTips:self->_tips];
  id v29 = objc_alloc(MEMORY[0x263F828E0]);
  double v30 = *MEMORY[0x263F001A8];
  double v31 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v32 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v33 = *(double *)(MEMORY[0x263F001A8] + 24);
  v34 = objc_msgSend(v29, "initWithFrame:", *MEMORY[0x263F001A8], v31, v32, v33);
  v35 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  [v34 setFont:v35];

  v36 = [MEMORY[0x263F825C8] labelColor];
  [v34 setTextColor:v36];

  v37 = [(WLTips *)self->_tips title];
  [v34 setText:v37];

  [v34 setNumberOfLines:0];
  [v34 sizeToFit];
  v131 = v34;
  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
  v38 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v30, v31, v32, v33);
  v39 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [v38 setFont:v39];

  v40 = [MEMORY[0x263F825C8] labelColor];
  [v38 setTextColor:v40];

  v41 = [(WLTips *)self->_tips desc];
  [v38 setText:v41];

  [v38 setNumberOfLines:0];
  [v38 sizeToFit];
  v132 = v38;
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v42 = objc_alloc(MEMORY[0x263F82BF8]);
  v141[0] = v133;
  v141[1] = v34;
  v141[2] = v38;
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v141 count:3];
  v44 = (void *)[v42 initWithArrangedSubviews:v43];

  v130 = v44;
  [v44 setAxis:1];
  [v44 setAlignment:3];
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v44, "setLayoutMargins:", 0.0, 0.0, 50.0, 0.0);
  [v44 setLayoutMarginsRelativeArrangement:1];
  [v4 addSubview:v44];
  v94 = (void *)MEMORY[0x263F08938];
  v119 = [v4 topAnchor];
  v124 = [(WLTipsViewController *)self view];
  v114 = [v124 topAnchor];
  v109 = [v119 constraintEqualToAnchor:v114];
  v140[0] = v109;
  v100 = [v4 leadingAnchor];
  v104 = [(WLTipsViewController *)self view];
  v97 = [v104 leadingAnchor];
  [v100 constraintEqualToAnchor:v97];
  v46 = v45 = v4;
  v140[1] = v46;
  v134 = v45;
  [v45 trailingAnchor];
  v47 = v129 = v11;
  v48 = [(WLTipsViewController *)self view];
  v49 = [v48 trailingAnchor];
  v50 = [v47 constraintEqualToAnchor:v49];
  v140[2] = v50;
  v51 = [v45 bottomAnchor];
  v52 = [(WLTipsViewController *)self view];
  v53 = [v52 bottomAnchor];
  +[WLProgressBar height];
  v55 = [v51 constraintEqualToAnchor:v53 constant:-v54];
  v140[3] = v55;
  v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v140 count:4];
  [v94 activateConstraints:v56];

  v105 = (void *)MEMORY[0x263F08938];
  v125 = [v130 topAnchor];
  v120 = [v134 topAnchor];
  v115 = [v125 constraintEqualToAnchor:v120];
  v139[0] = v115;
  v110 = [v130 leadingAnchor];
  v57 = [v134 leadingAnchor];
  v58 = [v110 constraintEqualToAnchor:v57];
  v139[1] = v58;
  v59 = [v130 trailingAnchor];
  v60 = [v134 trailingAnchor];
  v61 = [v59 constraintEqualToAnchor:v60];
  v139[2] = v61;
  v62 = [v130 bottomAnchor];
  v63 = [v134 bottomAnchor];
  v64 = [v62 constraintEqualToAnchor:v63];
  v139[3] = v64;
  v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:4];
  [v105 activateConstraints:v65];

  v95 = (void *)MEMORY[0x263F08938];
  v126 = [(WLTipsVideoView *)v133 topAnchor];
  v121 = [v130 topAnchor];
  v116 = [v126 constraintEqualToAnchor:v121];
  v138[0] = v116;
  v111 = [(WLTipsVideoView *)v133 leadingAnchor];
  v106 = [v130 leadingAnchor];
  v101 = [v111 constraintEqualToAnchor:v106];
  v138[1] = v101;
  v98 = [(WLTipsVideoView *)v133 trailingAnchor];
  v93 = [v130 trailingAnchor];
  v66 = [v98 constraintEqualToAnchor:v93];
  v138[2] = v66;
  v67 = [(WLTipsVideoView *)v133 widthAnchor];
  v68 = [v134 widthAnchor];
  v69 = [v67 constraintEqualToAnchor:v68];
  v138[3] = v69;
  v70 = [(WLTipsVideoView *)v133 heightAnchor];
  v71 = [v70 constraintEqualToConstant:v24];
  v138[4] = v71;
  v72 = [(WLTipsVideoView *)v133 bottomAnchor];
  v73 = [v131 topAnchor];
  v74 = [v72 constraintEqualToAnchor:v73 constant:-25.0];
  v138[5] = v74;
  v75 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:6];
  [v95 activateConstraints:v75];

  v99 = (void *)MEMORY[0x263F08938];
  v127 = [v131 topAnchor];
  v122 = [(WLTipsVideoView *)v133 bottomAnchor];
  v117 = [v127 constraintEqualToAnchor:v122 constant:25.0];
  v137[0] = v117;
  v112 = [v131 leadingAnchor];
  v107 = [v134 leadingAnchor];
  v102 = [v112 constraintEqualToAnchor:v107 constant:25.0];
  v137[1] = v102;
  v96 = [v131 trailingAnchor];
  v76 = [v134 trailingAnchor];
  v77 = [v96 constraintEqualToAnchor:v76 constant:-25.0];
  v137[2] = v77;
  v78 = [v131 widthAnchor];
  v79 = [v134 widthAnchor];
  v80 = [v78 constraintEqualToAnchor:v79 constant:-50.0];
  v137[3] = v80;
  v81 = [v131 bottomAnchor];
  v82 = [v132 topAnchor];
  v83 = [v81 constraintEqualToAnchor:v82 constant:-10.0];
  v137[4] = v83;
  v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:v137 count:5];
  [v99 activateConstraints:v84];

  v103 = (void *)MEMORY[0x263F08938];
  v128 = [v132 topAnchor];
  v123 = [v131 bottomAnchor];
  v118 = [v128 constraintEqualToAnchor:v123 constant:10.0];
  v136[0] = v118;
  v113 = [v132 leadingAnchor];
  v108 = [v131 leadingAnchor];
  v85 = [v113 constraintEqualToAnchor:v108];
  v136[1] = v85;
  v86 = [v132 trailingAnchor];
  v87 = [v131 trailingAnchor];
  v88 = [v86 constraintEqualToAnchor:v87];
  v136[2] = v88;
  v89 = [v132 widthAnchor];
  v90 = [v131 widthAnchor];
  v91 = [v89 constraintEqualToAnchor:v90];
  v136[3] = v91;
  v92 = [MEMORY[0x263EFF8C0] arrayWithObjects:v136 count:4];
  [v103 activateConstraints:v92];
}

- (WLTips)tips
{
  return self->_tips;
}

- (void)setTips:(id)a3
{
}

- (void).cxx_destruct
{
}

@end