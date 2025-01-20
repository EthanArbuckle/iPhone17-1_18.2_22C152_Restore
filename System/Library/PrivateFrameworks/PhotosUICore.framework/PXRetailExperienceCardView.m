@interface PXRetailExperienceCardView
- (NSString)message;
- (NSString)title;
- (UIImage)image;
- (void)_didMoveToWindow;
- (void)addActionWithTitle:(id)a3 action:(id)a4;
- (void)didMoveToWindow;
- (void)setImage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXRetailExperienceCardView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)_didMoveToWindow
{
  v180[7] = *MEMORY[0x1E4F143B8];
  if (!self->_didLoad)
  {
    self->_didLoad = 1;
    v166 = self->_actions;
    v3 = [(PXRetailExperienceCardView *)self window];
    v4 = [v3 screen];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;

    v9 = self;
    v10 = [(PXRetailExperienceCardView *)v9 layer];
    [v10 setCornerRadius:45.0];
    LODWORD(v11) = 1050253722;
    [v10 setShadowOpacity:v11];
    [v10 setShadowRadius:10.0];
    v108 = v10;
    objc_msgSend(v10, "setShadowOffset:", 3.0, 3.0);
    v12 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
    [(PXRetailExperienceCardView *)v9 setBackgroundColor:v12];

    [(PXRetailExperienceCardView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXRetailExperienceCardView *)v9 setClipsToBounds:1];
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithContentsOfFile:@"/System/Library/Photos/Resources/Media/RetailExperienceCard.jpg"];
    [v13 setImage:v14];
    [v13 setContentMode:2];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v112 = v13;
    [(PXRetailExperienceCardView *)v9 addSubview:v13];
    id v15 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    v16 = (void *)MEMORY[0x1E4FB1818];
    id v107 = v14;
    v106 = objc_msgSend(v16, "imageWithCGImage:scale:orientation:", objc_msgSend(v107, "CGImage"), 5, 1.0);
    objc_msgSend(v15, "setImage:");
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 setClipsToBounds:1];
    v111 = v15;
    [(PXRetailExperienceCardView *)v9 addSubview:v15];
    id v17 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v18 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
    v19 = (void *)[v17 initWithEffect:v18];

    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXRetailExperienceCardView *)v9 addSubview:v19];
    id v20 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [v19 contentView];
    [v21 addSubview:v20];

    id v22 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v23 = [MEMORY[0x1E4FB1618] separatorColor];
    [v22 setBackgroundColor:v23];

    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    v129 = v19;
    v24 = [v19 contentView];
    v110 = v22;
    [v24 addSubview:v22];

    id v25 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v26 = [(PXRetailExperienceCardView *)v9 title];
    [v25 setText:v26];

    v27 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2990] weight:*MEMORY[0x1E4FB09B8]];
    [v25 setFont:v27];

    [v25 setNumberOfLines:0];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20 addSubview:v25];
    id v28 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v109 = v9;
    v29 = [(PXRetailExperienceCardView *)v9 message];
    [v28 setText:v29];

    v30 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [v28 setFont:v30];

    [v28 setNumberOfLines:0];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20 addSubview:v28];
    v124 = (void *)MEMORY[0x1E4F28DC8];
    v162 = [v25 topAnchor];
    v158 = [v20 topAnchor];
    v154 = [v162 constraintEqualToAnchor:v158];
    v180[0] = v154;
    v150 = [v25 leadingAnchor];
    v146 = [v20 leadingAnchor];
    v142 = [v150 constraintEqualToAnchor:v146];
    v180[1] = v142;
    v138 = [v25 trailingAnchor];
    v134 = [v20 trailingAnchor];
    v130 = [v138 constraintEqualToAnchor:v134];
    v180[2] = v130;
    v120 = [v28 topAnchor];
    v105 = v25;
    v116 = [v25 bottomAnchor];
    v114 = [v120 constraintEqualToAnchor:v116 constant:8.0];
    v180[3] = v114;
    v31 = [v28 leadingAnchor];
    v32 = [v20 leadingAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v180[4] = v33;
    v34 = [v28 trailingAnchor];
    v35 = [v20 trailingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v180[5] = v36;
    v104 = v28;
    v37 = [v28 bottomAnchor];
    v128 = v20;
    v38 = [v20 bottomAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v180[6] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:7];
    [v124 activateConstraints:v40];

    long long v172 = 0u;
    long long v173 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    obj = v166;
    uint64_t v131 = [(NSMutableArray *)obj countByEnumeratingWithState:&v170 objects:v179 count:16];
    v41 = 0;
    if (v131)
    {
      uint64_t v125 = *(void *)v171;
      uint64_t v121 = *MEMORY[0x1E4FB28C8];
      double v42 = *MEMORY[0x1E4FB09E0];
      uint64_t v117 = *MEMORY[0x1E4FB06F8];
      do
      {
        uint64_t v43 = 0;
        v44 = v41;
        do
        {
          v163 = v44;
          if (*(void *)v171 != v125) {
            objc_enumerationMutation(obj);
          }
          v45 = *(void **)(*((void *)&v170 + 1) + 8 * v43);
          v46 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
          [v46 setButtonSize:3];
          [v46 setCornerStyle:4];
          v159 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v121 weight:v42];
          uint64_t v167 = v43;
          id v47 = objc_alloc(MEMORY[0x1E4F28B18]);
          v48 = [v45 title];
          uint64_t v177 = v117;
          v178 = v159;
          v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v178 forKeys:&v177 count:1];
          v155 = (void *)[v47 initWithString:v48 attributes:v49];

          v151 = v46;
          [v46 setAttributedTitle:v155];
          v50 = (void *)MEMORY[0x1E4FB14D0];
          v169[0] = MEMORY[0x1E4F143A8];
          v169[1] = 3221225472;
          v169[2] = __46__PXRetailExperienceCardView__didMoveToWindow__block_invoke;
          v169[3] = &unk_1E5DC9A58;
          v169[4] = v45;
          v51 = [MEMORY[0x1E4FB13F0] actionWithTitle:&stru_1F00B0030 image:0 identifier:0 handler:v169];
          v41 = [v50 buttonWithConfiguration:v46 primaryAction:v51];

          [v41 setTranslatesAutoresizingMaskIntoConstraints:0];
          v52 = [v129 contentView];
          [v52 addSubview:v41];

          v135 = (void *)MEMORY[0x1E4F28DC8];
          v147 = [v41 trailingAnchor];
          v143 = [v129 trailingAnchor];
          v139 = [v147 constraintEqualToAnchor:v143 constant:-24.0];
          v176[0] = v139;
          v53 = [v41 centerYAnchor];
          v54 = [v128 centerYAnchor];
          v55 = [v53 constraintEqualToAnchor:v54];
          v176[1] = v55;
          v56 = [v41 widthAnchor];
          [v41 intrinsicContentSize];
          v58 = [v56 constraintGreaterThanOrEqualToConstant:v57 + 12.0];
          v176[2] = v58;
          v59 = [v41 heightAnchor];
          v60 = [v129 heightAnchor];
          v61 = [v59 constraintLessThanOrEqualToAnchor:v60 constant:-48.0];
          v176[3] = v61;
          v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v176 count:4];
          [v135 activateConstraints:v62];

          uint64_t v43 = v167 + 1;
          v44 = v41;
        }
        while (v131 != v167 + 1);
        uint64_t v131 = [(NSMutableArray *)obj countByEnumeratingWithState:&v170 objects:v179 count:16];
      }
      while (v131);
    }
    v168 = v41;

    if (v6 >= v8) {
      double v63 = v8;
    }
    else {
      double v63 = v6;
    }
    double v64 = v63 + -10.0;
    double v65 = v8 * 0.5;
    v132 = (void *)MEMORY[0x1E4F28DC8];
    v164 = [v110 centerYAnchor];
    v160 = [v129 bottomAnchor];
    v156 = [v164 constraintEqualToAnchor:v160 constant:-24.0];
    v175[0] = v156;
    v152 = [v110 leadingAnchor];
    v148 = [v129 leadingAnchor];
    v144 = [v152 constraintEqualToAnchor:v148 constant:24.0];
    v175[1] = v144;
    v140 = [v110 trailingAnchor];
    v136 = [v129 trailingAnchor];
    v126 = [v140 constraintEqualToAnchor:v136 constant:-24.0];
    v175[2] = v126;
    v122 = [v110 heightAnchor];
    v118 = [v122 constraintEqualToConstant:0.5];
    v175[3] = v118;
    v66 = [v128 bottomAnchor];
    v67 = [v110 centerYAnchor];
    v68 = [v66 constraintEqualToAnchor:v67 constant:-24.0];
    v175[4] = v68;
    v69 = [v128 leadingAnchor];
    v70 = [v129 leadingAnchor];
    v71 = [v69 constraintEqualToAnchor:v70 constant:24.0];
    v175[5] = v71;
    v72 = [v128 trailingAnchor];
    v73 = [v41 leadingAnchor];
    v74 = [v72 constraintEqualToAnchor:v73 constant:-24.0];
    v175[6] = v74;
    v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:7];
    [v132 activateConstraints:v75];

    v101 = (void *)MEMORY[0x1E4F28DC8];
    v165 = [(PXRetailExperienceCardView *)v109 heightAnchor];
    v161 = [v165 constraintEqualToConstant:v65];
    v174[0] = v161;
    v157 = [(PXRetailExperienceCardView *)v109 widthAnchor];
    v153 = [v157 constraintEqualToConstant:v64];
    v174[1] = v153;
    v149 = [v112 topAnchor];
    v145 = [(PXRetailExperienceCardView *)v109 topAnchor];
    v141 = [v149 constraintEqualToAnchor:v145];
    v174[2] = v141;
    v137 = [v112 leadingAnchor];
    v133 = [(PXRetailExperienceCardView *)v109 leadingAnchor];
    v127 = [v137 constraintEqualToAnchor:v133];
    v174[3] = v127;
    v123 = [v112 trailingAnchor];
    v119 = [(PXRetailExperienceCardView *)v109 trailingAnchor];
    v115 = [v123 constraintEqualToAnchor:v119];
    v174[4] = v115;
    v103 = [v112 heightAnchor];
    v102 = [v103 constraintEqualToConstant:v65 * 0.6];
    v174[5] = v102;
    v100 = [v129 topAnchor];
    v99 = [v112 bottomAnchor];
    v98 = [v100 constraintEqualToAnchor:v99];
    v174[6] = v98;
    v97 = [v129 bottomAnchor];
    v96 = [(PXRetailExperienceCardView *)v109 bottomAnchor];
    v95 = [v97 constraintEqualToAnchor:v96];
    v174[7] = v95;
    v94 = [v129 leadingAnchor];
    v93 = [(PXRetailExperienceCardView *)v109 leadingAnchor];
    v92 = [v94 constraintEqualToAnchor:v93];
    v174[8] = v92;
    v91 = [v129 trailingAnchor];
    v90 = [(PXRetailExperienceCardView *)v109 trailingAnchor];
    v89 = [v91 constraintEqualToAnchor:v90];
    v174[9] = v89;
    v88 = [v111 topAnchor];
    v87 = [v112 bottomAnchor];
    v86 = [v88 constraintEqualToAnchor:v87];
    v174[10] = v86;
    v85 = [v111 leadingAnchor];
    v76 = [(PXRetailExperienceCardView *)v109 leadingAnchor];
    v77 = [v85 constraintEqualToAnchor:v76];
    v174[11] = v77;
    v78 = [v111 trailingAnchor];
    v79 = [(PXRetailExperienceCardView *)v109 trailingAnchor];
    v80 = [v78 constraintEqualToAnchor:v79];
    v174[12] = v80;
    v81 = [v111 heightAnchor];
    v82 = [v112 heightAnchor];
    v83 = [v81 constraintEqualToAnchor:v82];
    v174[13] = v83;
    v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v174 count:14];
    [v101 activateConstraints:v84];
  }
}

void __46__PXRetailExperienceCardView__didMoveToWindow__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) action];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) action];
    v3[2]();
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PXRetailExperienceCardView;
  [(PXRetailExperienceCardView *)&v3 didMoveToWindow];
  [(PXRetailExperienceCardView *)self _didMoveToWindow];
}

- (void)addActionWithTitle:(id)a3 action:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  actions = self->_actions;
  if (!actions)
  {
    double v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = self->_actions;
    self->_actions = v8;

    actions = self->_actions;
  }
  v10 = [[_PXCardAction alloc] initWithTitle:v11 action:v6];
  [(NSMutableArray *)actions addObject:v10];
}

@end