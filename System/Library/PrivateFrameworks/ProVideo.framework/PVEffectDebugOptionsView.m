@interface PVEffectDebugOptionsView
- (PVEffectDebugOptionsView)initWithFrame:(CGRect)a3 options:(id)a4;
- (PVEffectDebugViewOptions)options;
- (UIButton)closeButton;
- (UIStackView)rowsStackView;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setOptions:(id)a3;
- (void)setRowsStackView:(id)a3;
- (void)updateWithOptions:(id)a3;
@end

@implementation PVEffectDebugOptionsView

- (void)dealloc
{
  v3 = [(PVEffectDebugOptionsView *)self options];
  [v3 removeObserver:self forKeyPath:@"enabled"];

  v4.receiver = self;
  v4.super_class = (Class)PVEffectDebugOptionsView;
  [(PVEffectDebugOptionsView *)&v4 dealloc];
}

- (PVEffectDebugOptionsView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v225[4] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v208.receiver = self;
  v208.super_class = (Class)PVEffectDebugOptionsView;
  v10 = -[PVEffectDebugOptionsView initWithFrame:](&v208, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(PVEffectDebugOptionsView *)v10 setOptions:v9];
    id v12 = objc_alloc(MEMORY[0x1E4F42E20]);
    [(PVEffectDebugOptionsView *)v11 bounds];
    v13 = objc_msgSend(v12, "initWithFrame:");
    [(PVEffectDebugOptionsView *)v11 setRowsStackView:v13];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 setAlignment:1];
    [v13 setAxis:1];
    [v13 setDistribution:3];
    [v13 setSpacing:10.0];
    [v13 setLayoutMarginsRelativeArrangement:1];
    [(PVEffectDebugOptionsView *)v11 addSubview:v13];
    v170 = (void *)MEMORY[0x1E4F28DC8];
    v179 = [(PVEffectDebugOptionsView *)v11 layoutMarginsGuide];
    v176 = [v179 leadingAnchor];
    v175 = [v13 leadingAnchor];
    v174 = [v176 constraintEqualToAnchor:v175];
    v225[0] = v174;
    v173 = [(PVEffectDebugOptionsView *)v11 layoutMarginsGuide];
    v172 = [v173 trailingAnchor];
    v171 = [v13 trailingAnchor];
    [v172 constraintEqualToAnchor:v171];
    v169 = v178 = v9;
    v225[1] = v169;
    v14 = [(PVEffectDebugOptionsView *)v11 layoutMarginsGuide];
    v15 = [v14 topAnchor];
    v16 = [v13 topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v225[2] = v17;
    v177 = v11;
    v18 = [(PVEffectDebugOptionsView *)v11 layoutMarginsGuide];
    v19 = [v18 bottomAnchor];
    v20 = [v13 bottomAnchor];
    v21 = [v19 constraintGreaterThanOrEqualToAnchor:v20];
    v225[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v225 count:4];
    [v170 activateConstraints:v22];

    id v23 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v24 = [MEMORY[0x1E4F42A80] systemImageNamed:@"rectangle.3.offgrid"];
    v25 = (void *)[v23 initWithImage:v24];

    objc_msgSend(v25, "setFrame:", 0.0, 0.0, 30.0, 30.0);
    v26 = [PVEffectDebugKeyRowView alloc];
    v223[0] = @"title";
    v223[1] = @"icon";
    v224[0] = @"Enable Debug View";
    v224[1] = v25;
    v223[2] = @"on";
    v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v178, "isEnabled"));
    v224[2] = v27;
    v223[3] = @"action";
    v28 = (void *)MEMORY[0x1E4F426E8];
    v205[0] = MEMORY[0x1E4F143A8];
    v205[1] = *(void *)"";
    v205[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke;
    v205[3] = &unk_1E6168788;
    id v29 = v178;
    id v206 = v29;
    v207 = @"Enable Debug View";
    v30 = [v28 actionWithHandler:v205];
    v224[3] = v30;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v224 forKeys:v223 count:4];
    double v32 = *MEMORY[0x1E4F1DB28];
    double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v36 = -[PVEffectDebugKeyRowView initWithFrame:config:](v26, "initWithFrame:config:", v31, *MEMORY[0x1E4F1DB28], v33, v34, v35);

    v180 = v13;
    [v13 addArrangedSubview:v36];

    v37 = +[PVEffectDebugView documentBoundsLayerWithFrame:options:](PVEffectDebugView, "documentBoundsLayerWithFrame:options:", v29, 0.0, 0.0, 30.0, 30.0);
    v38 = [PVEffectDebugKeyRowView alloc];
    v222[0] = @"Document Bounds / Origin";
    v221[0] = @"title";
    v221[1] = @"icon";
    id v39 = objc_alloc(MEMORY[0x1E4F42AA0]);
    id v40 = v37;
    [v40 frame];
    CGFloat v42 = v41;
    [v40 frame];
    CGFloat v44 = v43;
    v45 = [MEMORY[0x1E4F42D90] mainScreen];
    [v45 scale];
    CGFloat v47 = v46;
    v226.double width = v42;
    v226.double height = v44;
    UIGraphicsBeginImageContextWithOptions(v226, 0, v47);

    [v40 renderInContext:UIGraphicsGetCurrentContext()];
    v48 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v49 = (void *)[v39 initWithImage:v48];
    v222[1] = v49;
    v221[2] = @"on";
    v50 = NSNumber;
    int v51 = [v29 showDocumentBoundingBox];
    uint64_t v52 = 0;
    if (v51) {
      uint64_t v52 = objc_msgSend(v29, "showOrigin", 0);
    }
    v53 = [v50 numberWithInt:v52];
    v222[2] = v53;
    v221[3] = @"action";
    v54 = (void *)MEMORY[0x1E4F426E8];
    v202[0] = MEMORY[0x1E4F143A8];
    v202[1] = *(void *)"";
    v202[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_2;
    v202[3] = &unk_1E6168788;
    id v55 = v29;
    id v203 = v55;
    v204 = @"Document Bounds / Origin";
    v56 = [v54 actionWithHandler:v202];
    v222[3] = v56;
    v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v222 forKeys:v221 count:4];
    v58 = -[PVEffectDebugKeyRowView initWithFrame:config:](v38, "initWithFrame:config:", v57, v32, v33, v34, v35);

    [v180 addArrangedSubview:v58];
    v59 = +[PVEffectDebugView outputROILayerWithFrame:options:](PVEffectDebugView, "outputROILayerWithFrame:options:", v55, 0.0, 0.0, 30.0, 30.0);
    v60 = [PVEffectDebugKeyRowView alloc];
    v220[0] = @"Output ROI";
    v219[0] = @"title";
    v219[1] = @"icon";
    id v61 = objc_alloc(MEMORY[0x1E4F42AA0]);
    id v62 = v59;
    [v62 frame];
    CGFloat v64 = v63;
    [v62 frame];
    CGFloat v66 = v65;
    v67 = [MEMORY[0x1E4F42D90] mainScreen];
    [v67 scale];
    CGFloat v69 = v68;
    v227.double width = v64;
    v227.double height = v66;
    UIGraphicsBeginImageContextWithOptions(v227, 0, v69);

    [v62 renderInContext:UIGraphicsGetCurrentContext()];
    v70 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v71 = (void *)[v61 initWithImage:v70];
    v220[1] = v71;
    v219[2] = @"on";
    v72 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v55, "showOutputROI"));
    v220[2] = v72;
    v219[3] = @"action";
    v73 = (void *)MEMORY[0x1E4F426E8];
    v199[0] = MEMORY[0x1E4F143A8];
    v199[1] = *(void *)"";
    v199[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_3;
    v199[3] = &unk_1E6168788;
    id v74 = v55;
    id v200 = v74;
    v201 = @"Output ROI";
    v75 = [v73 actionWithHandler:v199];
    v220[3] = v75;
    v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v220 forKeys:v219 count:4];
    v77 = -[PVEffectDebugKeyRowView initWithFrame:config:](v60, "initWithFrame:config:", v76, v32, v33, v34, v35);

    [v180 addArrangedSubview:v77];
    v78 = +[PVEffectDebugView objectBoundsLayerWithFrame:options:](PVEffectDebugView, "objectBoundsLayerWithFrame:options:", v74, 0.0, 0.0, 30.0, 30.0);
    v79 = [PVEffectDebugKeyRowView alloc];
    v218[0] = @"Object Bounds / Midpoint";
    v217[0] = @"title";
    v217[1] = @"icon";
    id v80 = objc_alloc(MEMORY[0x1E4F42AA0]);
    id v81 = v78;
    [v81 frame];
    CGFloat v83 = v82;
    [v81 frame];
    CGFloat v85 = v84;
    v86 = [MEMORY[0x1E4F42D90] mainScreen];
    [v86 scale];
    CGFloat v88 = v87;
    v228.double width = v83;
    v228.double height = v85;
    UIGraphicsBeginImageContextWithOptions(v228, 0, v88);

    [v81 renderInContext:UIGraphicsGetCurrentContext()];
    v89 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v90 = (void *)[v80 initWithImage:v89];
    v218[1] = v90;
    v217[2] = @"on";
    v91 = NSNumber;
    int v92 = [v74 showObjectAlignedBoundingBox];
    uint64_t v93 = 0;
    if (v92)
    {
      if (objc_msgSend(v74, "showMidpoint", 0)) {
        uint64_t v93 = [v74 showCornerPoints];
      }
      else {
        uint64_t v93 = 0;
      }
    }
    v94 = [v91 numberWithInt:v93];
    v218[2] = v94;
    v217[3] = @"action";
    v95 = (void *)MEMORY[0x1E4F426E8];
    v196[0] = MEMORY[0x1E4F143A8];
    v196[1] = *(void *)"";
    v196[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_4;
    v196[3] = &unk_1E6168788;
    id v96 = v74;
    id v197 = v96;
    v198 = @"Object Bounds / Midpoint";
    v97 = [v95 actionWithHandler:v196];
    v218[3] = v97;
    v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v218 forKeys:v217 count:4];
    v99 = -[PVEffectDebugKeyRowView initWithFrame:config:](v79, "initWithFrame:config:", v98, v32, v33, v34, v35);

    [v180 addArrangedSubview:v99];
    v100 = +[PVEffectDebugView textBoundsLayerWithFrame:options:](PVEffectDebugView, "textBoundsLayerWithFrame:options:", v96, 0.0, 0.0, 30.0, 30.0);
    v101 = [PVEffectDebugKeyRowView alloc];
    v216[0] = @"Text Bounds";
    v215[0] = @"title";
    v215[1] = @"icon";
    id v102 = objc_alloc(MEMORY[0x1E4F42AA0]);
    id v103 = v100;
    [v103 frame];
    CGFloat v105 = v104;
    [v103 frame];
    CGFloat v107 = v106;
    v108 = [MEMORY[0x1E4F42D90] mainScreen];
    [v108 scale];
    CGFloat v110 = v109;
    v229.double width = v105;
    v229.double height = v107;
    UIGraphicsBeginImageContextWithOptions(v229, 0, v110);

    [v103 renderInContext:UIGraphicsGetCurrentContext()];
    v111 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v112 = (void *)[v102 initWithImage:v111];
    v216[1] = v112;
    v215[2] = @"on";
    v113 = NSNumber;
    int v114 = [v96 showTextBoundingBoxes];
    uint64_t v115 = 0;
    if (v114) {
      uint64_t v115 = objc_msgSend(v96, "showTextCornerPoints", 0);
    }
    v116 = [v113 numberWithInt:v115];
    v216[2] = v116;
    v215[3] = @"action";
    v117 = (void *)MEMORY[0x1E4F426E8];
    v193[0] = MEMORY[0x1E4F143A8];
    v193[1] = *(void *)"";
    v193[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_5;
    v193[3] = &unk_1E6168788;
    id v118 = v96;
    id v194 = v118;
    v195 = @"Text Bounds";
    v119 = [v117 actionWithHandler:v193];
    v216[3] = v119;
    v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v216 forKeys:v215 count:4];
    v121 = -[PVEffectDebugKeyRowView initWithFrame:config:](v101, "initWithFrame:config:", v120, v32, v33, v34, v35);

    [v180 addArrangedSubview:v121];
    v122 = +[PVEffectDebugView hitAreaShapeLayerWithFrame:options:](PVEffectDebugView, "hitAreaShapeLayerWithFrame:options:", v118, 0.0, 0.0, 30.0, 30.0);
    v123 = [PVEffectDebugKeyRowView alloc];
    v214[0] = @"Hit Shape";
    v213[0] = @"title";
    v213[1] = @"icon";
    id v124 = objc_alloc(MEMORY[0x1E4F42AA0]);
    id v125 = v122;
    [v125 frame];
    CGFloat v127 = v126;
    [v125 frame];
    CGFloat v129 = v128;
    v130 = [MEMORY[0x1E4F42D90] mainScreen];
    [v130 scale];
    CGFloat v132 = v131;
    v230.double width = v127;
    v230.double height = v129;
    UIGraphicsBeginImageContextWithOptions(v230, 0, v132);

    [v125 renderInContext:UIGraphicsGetCurrentContext()];
    v133 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v134 = (void *)[v124 initWithImage:v133];
    v214[1] = v134;
    v213[2] = @"on";
    v135 = NSNumber;
    int v136 = [v118 showHitAreaShape];
    uint64_t v137 = 0;
    if (v136) {
      uint64_t v137 = objc_msgSend(v118, "showHitAreaPoints", 0);
    }
    v138 = [v135 numberWithInt:v137];
    v214[2] = v138;
    v213[3] = @"action";
    v139 = (void *)MEMORY[0x1E4F426E8];
    v190[0] = MEMORY[0x1E4F143A8];
    v190[1] = *(void *)"";
    v190[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_6;
    v190[3] = &unk_1E6168788;
    id v140 = v118;
    id v191 = v140;
    v192 = @"Hit Shape";
    v141 = [v139 actionWithHandler:v190];
    v214[3] = v141;
    v142 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v214 forKeys:v213 count:4];
    v143 = -[PVEffectDebugKeyRowView initWithFrame:config:](v123, "initWithFrame:config:", v142, v32, v33, v34, v35);

    [v180 addArrangedSubview:v143];
    id v144 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v145 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.fill"];
    v146 = (void *)[v144 initWithImage:v145];

    objc_msgSend(v146, "setFrame:", 0.0, 0.0, 30.0, 30.0);
    v147 = [PVEffectDebugKeyRowView alloc];
    v211[0] = @"title";
    v211[1] = @"icon";
    v212[0] = @"User Rects";
    v212[1] = v146;
    v211[2] = @"on";
    v148 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v140, "showUserRects"));
    v212[2] = v148;
    v211[3] = @"action";
    v149 = (void *)MEMORY[0x1E4F426E8];
    v187[0] = MEMORY[0x1E4F143A8];
    v187[1] = *(void *)"";
    v187[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_7;
    v187[3] = &unk_1E6168788;
    id v150 = v140;
    id v188 = v150;
    v189 = @"User Rects";
    v151 = [v149 actionWithHandler:v187];
    v212[3] = v151;
    v152 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v212 forKeys:v211 count:4];
    v153 = -[PVEffectDebugKeyRowView initWithFrame:config:](v147, "initWithFrame:config:", v152, v32, v33, v34, v35);

    [v180 addArrangedSubview:v153];
    id v154 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v155 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.fill"];
    v156 = (void *)[v154 initWithImage:v155];

    objc_msgSend(v156, "setFrame:", 0.0, 0.0, 30.0, 30.0);
    v157 = [PVEffectDebugKeyRowView alloc];
    v209[0] = @"title";
    v209[1] = @"icon";
    v210[0] = @"User Points";
    v210[1] = v156;
    v209[2] = @"on";
    v158 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v150, "showUserPoints"));
    v210[2] = v158;
    v209[3] = @"action";
    v159 = (void *)MEMORY[0x1E4F426E8];
    v184[0] = MEMORY[0x1E4F143A8];
    v184[1] = *(void *)"";
    v184[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_8;
    v184[3] = &unk_1E6168788;
    id v160 = v150;
    id v185 = v160;
    v186 = @"User Points";
    v161 = [v159 actionWithHandler:v184];
    v210[3] = v161;
    v162 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v210 forKeys:v209 count:4];
    v163 = -[PVEffectDebugKeyRowView initWithFrame:config:](v157, "initWithFrame:config:", v162, v32, v33, v34, v35);

    [v180 addArrangedSubview:v163];
    v164 = [MEMORY[0x1E4F1CA48] array];
    v165 = [v180 arrangedSubviews];
    v181[0] = MEMORY[0x1E4F143A8];
    v181[1] = *(void *)"";
    v181[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_9;
    v181[3] = &unk_1E61687B0;
    id v182 = v164;
    id v183 = v180;
    id v166 = v180;
    id v167 = v164;
    [v165 enumerateObjectsUsingBlock:v181];

    [MEMORY[0x1E4F28DC8] activateConstraints:v167];
    v11 = v177;
    [(PVEffectDebugOptionsView *)v177 updateWithOptions:v160];
    [v160 addObserver:v177 forKeyPath:@"enabled" options:1 context:0];

    id v9 = v178;
  }

  return v11;
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isEnabled];
  [*(id *)(a1 + 32) setEnabled:v2 ^ 1u];
  v3 = @"On";
  if (v2) {
    v3 = @"Off";
  }
  NSLog(&cfstr_Switched.isa, v3, *(void *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) showDocumentBoundingBox];
  uint64_t v3 = v2 ^ 1u;
  [*(id *)(a1 + 32) setShowDocumentBoundingBox:v3];
  [*(id *)(a1 + 32) setShowOrigin:v3];
  objc_super v4 = @"On";
  if (v2) {
    objc_super v4 = @"Off";
  }
  NSLog(&cfstr_Switched.isa, v4, *(void *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_3(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) showOutputROI];
  [*(id *)(a1 + 32) setShowOutputROI:v2 ^ 1u];
  uint64_t v3 = @"On";
  if (v2) {
    uint64_t v3 = @"Off";
  }
  NSLog(&cfstr_Switched.isa, v3, *(void *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_4(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) showObjectAlignedBoundingBox];
  uint64_t v3 = v2 ^ 1u;
  [*(id *)(a1 + 32) setShowObjectAlignedBoundingBox:v3];
  [*(id *)(a1 + 32) setShowMidpoint:v3];
  [*(id *)(a1 + 32) setShowCornerPoints:v3];
  objc_super v4 = @"On";
  if (v2) {
    objc_super v4 = @"Off";
  }
  NSLog(&cfstr_Switched.isa, v4, *(void *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_5(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) showTextBoundingBoxes];
  uint64_t v3 = v2 ^ 1u;
  [*(id *)(a1 + 32) setShowTextBoundingBoxes:v3];
  [*(id *)(a1 + 32) setShowTextCornerPoints:v3];
  objc_super v4 = @"On";
  if (v2) {
    objc_super v4 = @"Off";
  }
  NSLog(&cfstr_Switched.isa, v4, *(void *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_6(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) showHitAreaShape];
  uint64_t v3 = v2 ^ 1u;
  [*(id *)(a1 + 32) setShowHitAreaShape:v3];
  [*(id *)(a1 + 32) setShowHitAreaPoints:v3];
  objc_super v4 = @"On";
  if (v2) {
    objc_super v4 = @"Off";
  }
  NSLog(&cfstr_Switched.isa, v4, *(void *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_7(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) showUserRects];
  [*(id *)(a1 + 32) setShowUserRects:v2 ^ 1u];
  uint64_t v3 = @"On";
  if (v2) {
    uint64_t v3 = @"Off";
  }
  NSLog(&cfstr_Switched.isa, v3, *(void *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_8(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) showUserPoints];
  [*(id *)(a1 + 32) setShowUserPoints:v2 ^ 1u];
  uint64_t v3 = @"On";
  if (v2) {
    uint64_t v3 = @"Off";
  }
  NSLog(&cfstr_Switched.isa, v3, *(void *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v9 = [a2 subviews];
  objc_super v4 = [v9 lastObject];
  v5 = [v4 trailingAnchor];
  v6 = [*(id *)(a1 + 40) layoutMarginsGuide];
  v7 = [v6 trailingAnchor];
  v8 = [v5 constraintEqualToAnchor:v7];
  [v3 addObject:v8];
}

- (void)updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(PVEffectDebugOptionsView *)self rowsStackView];
  v6 = [v5 arrangedSubviews];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __46__PVEffectDebugOptionsView_updateWithOptions___block_invoke;
  v8[3] = &unk_1E61687D8;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __46__PVEffectDebugOptionsView_updateWithOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = v8;
  if (isKindOfClass)
  {
    id v7 = v8;
    if (a3) {
      objc_msgSend(v7, "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "isEnabled"));
    }

    v6 = v8;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v14 isEqualToString:@"enabled"])
  {
    v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    uint64_t v12 = [v11 BOOLValue];

    v13 = [NSNumber numberWithBool:v12];
    NSLog(&cfstr_UpdatedFor.isa, v13, v14);

    [(PVEffectDebugOptionsView *)self updateWithOptions:v9];
  }
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (PVEffectDebugViewOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (UIStackView)rowsStackView
{
  return self->_rowsStackView;
}

- (void)setRowsStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowsStackView, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_closeButton, 0);
}

@end