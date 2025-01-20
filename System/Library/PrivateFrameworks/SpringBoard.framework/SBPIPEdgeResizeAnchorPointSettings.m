@interface SBPIPEdgeResizeAnchorPointSettings
+ (id)settingsControllerModule;
- (double)dockLowerLeftResizeBottomEdgeAnchorPointX;
- (double)dockLowerLeftResizeBottomEdgeAnchorPointY;
- (double)dockLowerLeftResizeLeftEdgeAnchorPointX;
- (double)dockLowerLeftResizeLeftEdgeAnchorPointY;
- (double)dockLowerLeftResizeRightEdgeAnchorPointX;
- (double)dockLowerLeftResizeRightEdgeAnchorPointY;
- (double)dockLowerLeftResizeTopEdgeAnchorPointX;
- (double)dockLowerLeftResizeTopEdgeAnchorPointY;
- (double)dockLowerRightResizeBottomEdgeAnchorPointX;
- (double)dockLowerRightResizeBottomEdgeAnchorPointY;
- (double)dockLowerRightResizeLeftEdgeAnchorPointX;
- (double)dockLowerRightResizeLeftEdgeAnchorPointY;
- (double)dockLowerRightResizeRightEdgeAnchorPointX;
- (double)dockLowerRightResizeRightEdgeAnchorPointY;
- (double)dockLowerRightResizeTopEdgeAnchorPointX;
- (double)dockLowerRightResizeTopEdgeAnchorPointY;
- (double)dockUpperLeftResizeBottomEdgeAnchorPointX;
- (double)dockUpperLeftResizeBottomEdgeAnchorPointY;
- (double)dockUpperLeftResizeLeftEdgeAnchorPointX;
- (double)dockUpperLeftResizeLeftEdgeAnchorPointY;
- (double)dockUpperLeftResizeRightEdgeAnchorPointX;
- (double)dockUpperLeftResizeRightEdgeAnchorPointY;
- (double)dockUpperLeftResizeTopEdgeAnchorPointX;
- (double)dockUpperLeftResizeTopEdgeAnchorPointY;
- (double)dockUpperRightResizeBottomEdgeAnchorPointX;
- (double)dockUpperRightResizeBottomEdgeAnchorPointY;
- (double)dockUpperRightResizeLeftEdgeAnchorPointX;
- (double)dockUpperRightResizeLeftEdgeAnchorPointY;
- (double)dockUpperRightResizeRightEdgeAnchorPointX;
- (double)dockUpperRightResizeRightEdgeAnchorPointY;
- (double)dockUpperRightResizeTopEdgeAnchorPointX;
- (double)dockUpperRightResizeTopEdgeAnchorPointY;
- (unint64_t)anchorPointType;
- (void)_setAnchorPointForType:(unint64_t)a3;
- (void)setAnchorPointType:(unint64_t)a3;
- (void)setDefaultValues;
- (void)setDockLowerLeftResizeBottomEdgeAnchorPointX:(double)a3;
- (void)setDockLowerLeftResizeBottomEdgeAnchorPointY:(double)a3;
- (void)setDockLowerLeftResizeLeftEdgeAnchorPointX:(double)a3;
- (void)setDockLowerLeftResizeLeftEdgeAnchorPointY:(double)a3;
- (void)setDockLowerLeftResizeRightEdgeAnchorPointX:(double)a3;
- (void)setDockLowerLeftResizeRightEdgeAnchorPointY:(double)a3;
- (void)setDockLowerLeftResizeTopEdgeAnchorPointX:(double)a3;
- (void)setDockLowerLeftResizeTopEdgeAnchorPointY:(double)a3;
- (void)setDockLowerRightResizeBottomEdgeAnchorPointX:(double)a3;
- (void)setDockLowerRightResizeBottomEdgeAnchorPointY:(double)a3;
- (void)setDockLowerRightResizeLeftEdgeAnchorPointX:(double)a3;
- (void)setDockLowerRightResizeLeftEdgeAnchorPointY:(double)a3;
- (void)setDockLowerRightResizeRightEdgeAnchorPointX:(double)a3;
- (void)setDockLowerRightResizeRightEdgeAnchorPointY:(double)a3;
- (void)setDockLowerRightResizeTopEdgeAnchorPointX:(double)a3;
- (void)setDockLowerRightResizeTopEdgeAnchorPointY:(double)a3;
- (void)setDockUpperLeftResizeBottomEdgeAnchorPointX:(double)a3;
- (void)setDockUpperLeftResizeBottomEdgeAnchorPointY:(double)a3;
- (void)setDockUpperLeftResizeLeftEdgeAnchorPointX:(double)a3;
- (void)setDockUpperLeftResizeLeftEdgeAnchorPointY:(double)a3;
- (void)setDockUpperLeftResizeRightEdgeAnchorPointX:(double)a3;
- (void)setDockUpperLeftResizeRightEdgeAnchorPointY:(double)a3;
- (void)setDockUpperLeftResizeTopEdgeAnchorPointX:(double)a3;
- (void)setDockUpperLeftResizeTopEdgeAnchorPointY:(double)a3;
- (void)setDockUpperRightResizeBottomEdgeAnchorPointX:(double)a3;
- (void)setDockUpperRightResizeBottomEdgeAnchorPointY:(double)a3;
- (void)setDockUpperRightResizeLeftEdgeAnchorPointX:(double)a3;
- (void)setDockUpperRightResizeLeftEdgeAnchorPointY:(double)a3;
- (void)setDockUpperRightResizeRightEdgeAnchorPointX:(double)a3;
- (void)setDockUpperRightResizeRightEdgeAnchorPointY:(double)a3;
- (void)setDockUpperRightResizeTopEdgeAnchorPointX:(double)a3;
- (void)setDockUpperRightResizeTopEdgeAnchorPointY:(double)a3;
@end

@implementation SBPIPEdgeResizeAnchorPointSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBPIPEdgeResizeAnchorPointSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeTopEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeTopEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeBottomEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeBottomEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeLeftEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeLeftEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeRightEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeRightEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeTopEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeTopEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeBottomEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeBottomEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeLeftEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeLeftEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeRightEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeRightEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeTopEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeTopEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeBottomEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeBottomEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeLeftEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeLeftEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeRightEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeRightEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeTopEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeTopEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeBottomEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeBottomEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeLeftEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeLeftEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeRightEdgeAnchorPointX:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeRightEdgeAnchorPointY:0.5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setAnchorPointType:1];
}

- (void)setAnchorPointType:(unint64_t)a3
{
  self->_anchorPointType = a3;
  -[SBPIPEdgeResizeAnchorPointSettings _setAnchorPointForType:](self, "_setAnchorPointForType:");
}

+ (id)settingsControllerModule
{
  v124[1] = *MEMORY[0x1E4F143B8];
  v111 = [MEMORY[0x1E4F94110] rowWithTitle:@"Type" valueKeyPath:@"anchorPointType"];
  [v111 setPossibleTitles:&unk_1F3348960];
  [v111 setPossibleValues:&unk_1F3348978];
  v2 = (void *)MEMORY[0x1E4F94168];
  v124[0] = v111;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:1];
  v118 = [v2 sectionWithRows:v3 title:@"Type"];

  v4 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Top Edge Anchor Point X" valueKeyPath:@"dockUpperLeftResizeTopEdgeAnchorPointX"];
  v5 = [v4 between:0.0 and:1.0];
  v117 = [v5 precision:2];

  v6 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Top Edge Anchor Point Y" valueKeyPath:@"dockUpperLeftResizeBottomEdgeAnchorPointX"];
  v7 = [v6 between:0.0 and:1.0];
  v110 = [v7 precision:2];

  v8 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Bottom Edge Anchor Point X" valueKeyPath:@"dockUpperLeftResizeBottomEdgeAnchorPointX"];
  v9 = [v8 between:0.0 and:1.0];
  v109 = [v9 precision:2];

  v10 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Bottom Edge Anchor Point Y" valueKeyPath:@"dockUpperLeftResizeBottomEdgeAnchorPointY"];
  v11 = [v10 between:0.0 and:1.0];
  v108 = [v11 precision:2];

  v12 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Left Edge Anchor Point X" valueKeyPath:@"dockUpperLeftResizeLeftEdgeAnchorPointX"];
  v13 = [v12 between:0.0 and:1.0];
  v107 = [v13 precision:2];

  v14 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Left Edge Anchor Point Y" valueKeyPath:@"dockUpperLeftResizeLeftEdgeAnchorPointY"];
  v15 = [v14 between:0.0 and:1.0];
  v106 = [v15 precision:2];

  v16 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Right Edge Anchor Point X" valueKeyPath:@"dockUpperLeftResizeRightEdgeAnchorPointY"];
  v17 = [v16 between:0.0 and:1.0];
  v105 = [v17 precision:2];

  v18 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Right Edge Anchor Point Y" valueKeyPath:@"dockUpperLeftResizeRightEdgeAnchorPointY"];
  v19 = [v18 between:0.0 and:1.0];
  v104 = [v19 precision:2];

  v20 = (void *)MEMORY[0x1E4F94168];
  v123[0] = v117;
  v123[1] = v110;
  v123[2] = v109;
  v123[3] = v108;
  v123[4] = v107;
  v123[5] = v106;
  v123[6] = v105;
  v123[7] = v104;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:8];
  v116 = [v20 sectionWithRows:v21 title:@"PIP dock at upper left"];

  v22 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Top Edge Anchor Point X" valueKeyPath:@"dockLowerLeftResizeTopEdgeAnchorPointX"];
  v23 = [v22 between:0.0 and:1.0];
  v115 = [v23 precision:2];

  v24 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Top Edge Anchor Point Y" valueKeyPath:@"dockLowerLeftResizeTopEdgeAnchorPointY"];
  v25 = [v24 between:0.0 and:1.0];
  v103 = [v25 precision:2];

  v26 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Bottom Edge Anchor Point X" valueKeyPath:@"dockLowerLeftResizeBottomEdgeAnchorPointX"];
  v27 = [v26 between:0.0 and:1.0];
  v102 = [v27 precision:2];

  v28 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Bottom Edge Anchor Point Y" valueKeyPath:@"dockLowerLeftResizeBottomEdgeAnchorPointY"];
  v29 = [v28 between:0.0 and:1.0];
  v101 = [v29 precision:2];

  v30 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Left Edge Anchor Point X" valueKeyPath:@"dockLowerLeftResizeLeftEdgeAnchorPointX"];
  v31 = [v30 between:0.0 and:1.0];
  v100 = [v31 precision:2];

  v32 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Left Edge Anchor Point Y" valueKeyPath:@"dockLowerLeftResizeLeftEdgeAnchorPointY"];
  v33 = [v32 between:0.0 and:1.0];
  v99 = [v33 precision:2];

  v34 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Right Edge Anchor Point X" valueKeyPath:@"dockLowerLeftResizeRightEdgeAnchorPointX"];
  v35 = [v34 between:0.0 and:1.0];
  v98 = [v35 precision:2];

  v36 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Right Edge Anchor Point Y" valueKeyPath:@"dockLowerLeftResizeRightEdgeAnchorPointY"];
  v37 = [v36 between:0.0 and:1.0];
  v97 = [v37 precision:2];

  v38 = (void *)MEMORY[0x1E4F94168];
  v122[0] = v115;
  v122[1] = v103;
  v122[2] = v102;
  v122[3] = v101;
  v122[4] = v100;
  v122[5] = v99;
  v122[6] = v98;
  v122[7] = v97;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:8];
  v96 = [v38 sectionWithRows:v39 title:@"PIP dock at lower left"];

  v40 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Top Edge Anchor Point X" valueKeyPath:@"dockUpperRightResizeTopEdgeAnchorPointX"];
  v41 = [v40 between:0.0 and:1.0];
  v114 = [v41 precision:2];

  v42 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Top Edge Anchor Point Y" valueKeyPath:@"dockUpperRightResizeTopEdgeAnchorPointY"];
  v43 = [v42 between:0.0 and:1.0];
  v95 = [v43 precision:2];

  v44 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Bottom Edge Anchor Point X" valueKeyPath:@"dockUpperRightResizeBottomEdgeAnchorPointX"];
  v45 = [v44 between:0.0 and:1.0];
  v94 = [v45 precision:2];

  v46 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Bottom Edge Anchor Point Y" valueKeyPath:@"dockUpperRightResizeBottomEdgeAnchorPointY"];
  v47 = [v46 between:0.0 and:1.0];
  v93 = [v47 precision:2];

  v48 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Left Edge Anchor Point X" valueKeyPath:@"dockUpperRightResizeLeftEdgeAnchorPointX"];
  v49 = [v48 between:0.0 and:1.0];
  v92 = [v49 precision:2];

  v50 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Left Edge Anchor Point Y" valueKeyPath:@"dockUpperRightResizeLeftEdgeAnchorPointY"];
  v51 = [v50 between:0.0 and:1.0];
  v91 = [v51 precision:2];

  v52 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Right Edge Anchor Point X" valueKeyPath:@"dockUpperRightResizeRightEdgeAnchorPointX"];
  v53 = [v52 between:0.0 and:1.0];
  v90 = [v53 precision:2];

  v54 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Right Edge Anchor Point Y" valueKeyPath:@"dockUpperRightResizeRightEdgeAnchorPointY"];
  v55 = [v54 between:0.0 and:1.0];
  v89 = [v55 precision:2];

  v56 = (void *)MEMORY[0x1E4F94168];
  v121[0] = v114;
  v121[1] = v95;
  v121[2] = v94;
  v121[3] = v93;
  v121[4] = v92;
  v121[5] = v91;
  v121[6] = v90;
  v121[7] = v89;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:8];
  v88 = [v56 sectionWithRows:v57 title:@"PIP dock at upper right"];

  v58 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Top Edge Anchor Point X" valueKeyPath:@"dockLowerRightResizeTopEdgeAnchorPointX"];
  v59 = [v58 between:0.0 and:1.0];
  v113 = [v59 precision:2];

  v60 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Top Edge Anchor Point Y" valueKeyPath:@"dockLowerRightResizeTopEdgeAnchorPointY"];
  v61 = [v60 between:0.0 and:1.0];
  v112 = [v61 precision:2];

  v62 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Bottom Edge Anchor Point X" valueKeyPath:@"dockLowerRightResizeBottomEdgeAnchorPointX"];
  v63 = [v62 between:0.0 and:1.0];
  v87 = [v63 precision:2];

  v64 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Bottom Edge Anchor Point Y" valueKeyPath:@"dockLowerRightResizeBottomEdgeAnchorPointY"];
  v65 = [v64 between:0.0 and:1.0];
  v86 = [v65 precision:2];

  v66 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Left Edge Anchor Point X" valueKeyPath:@"dockLowerRightResizeLeftEdgeAnchorPointX"];
  v67 = [v66 between:0.0 and:1.0];
  uint64_t v68 = [v67 precision:2];

  v69 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Left Edge Anchor Point Y" valueKeyPath:@"dockLowerRightResizeLeftEdgeAnchorPointY"];
  v70 = [v69 between:0.0 and:1.0];
  v71 = [v70 precision:2];

  v72 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Right Edge Anchor Point X" valueKeyPath:@"dockLowerRightResizeRightEdgeAnchorPointX"];
  v73 = [v72 between:0.0 and:1.0];
  v74 = [v73 precision:2];

  v75 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Right Edge Anchor Point Y" valueKeyPath:@"dockLowerRightResizeRightEdgeAnchorPointY"];
  v76 = [v75 between:0.0 and:1.0];
  v77 = [v76 precision:2];

  v78 = (void *)MEMORY[0x1E4F94168];
  v120[0] = v113;
  v120[1] = v112;
  v120[2] = v87;
  v120[3] = v86;
  v79 = (void *)v68;
  v120[4] = v68;
  v120[5] = v71;
  v120[6] = v74;
  v120[7] = v77;
  v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:8];
  v81 = [v78 sectionWithRows:v80 title:@"PIP dock at lower right"];

  v82 = (void *)MEMORY[0x1E4F94168];
  v119[0] = v118;
  v119[1] = v116;
  v119[2] = v96;
  v119[3] = v88;
  v119[4] = v81;
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:5];
  v84 = [v82 moduleWithTitle:@"Edge Resize Anchor Point" contents:v83];

  return v84;
}

- (void)_setAnchorPointForType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    double v4 = 1.0;
    double v5 = 0.0;
  }
  else
  {
    double v5 = 0.5;
    double v4 = 0.5;
  }
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeTopEdgeAnchorPointX:v5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeTopEdgeAnchorPointY:1.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeBottomEdgeAnchorPointX:v5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeBottomEdgeAnchorPointY:0.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeLeftEdgeAnchorPointX:1.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeLeftEdgeAnchorPointY:v5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeRightEdgeAnchorPointX:0.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperLeftResizeRightEdgeAnchorPointY:v5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeTopEdgeAnchorPointX:v5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeTopEdgeAnchorPointY:1.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeBottomEdgeAnchorPointX:v5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeBottomEdgeAnchorPointY:0.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeLeftEdgeAnchorPointX:1.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeLeftEdgeAnchorPointY:v4];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeRightEdgeAnchorPointX:0.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerLeftResizeRightEdgeAnchorPointY:v4];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeTopEdgeAnchorPointX:v4];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeTopEdgeAnchorPointY:1.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeBottomEdgeAnchorPointX:v4];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeBottomEdgeAnchorPointY:0.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeLeftEdgeAnchorPointX:1.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeLeftEdgeAnchorPointY:v5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeRightEdgeAnchorPointX:0.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockUpperRightResizeRightEdgeAnchorPointY:v5];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeTopEdgeAnchorPointX:v4];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeTopEdgeAnchorPointY:1.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeBottomEdgeAnchorPointX:v4];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeBottomEdgeAnchorPointY:0.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeLeftEdgeAnchorPointX:1.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeLeftEdgeAnchorPointY:v4];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeRightEdgeAnchorPointX:0.0];
  [(SBPIPEdgeResizeAnchorPointSettings *)self setDockLowerRightResizeRightEdgeAnchorPointY:v4];
}

- (unint64_t)anchorPointType
{
  return self->_anchorPointType;
}

- (double)dockUpperLeftResizeTopEdgeAnchorPointX
{
  return self->_dockUpperLeftResizeTopEdgeAnchorPointX;
}

- (void)setDockUpperLeftResizeTopEdgeAnchorPointX:(double)a3
{
  self->_dockUpperLeftResizeTopEdgeAnchorPointX = a3;
}

- (double)dockUpperLeftResizeTopEdgeAnchorPointY
{
  return self->_dockUpperLeftResizeTopEdgeAnchorPointY;
}

- (void)setDockUpperLeftResizeTopEdgeAnchorPointY:(double)a3
{
  self->_dockUpperLeftResizeTopEdgeAnchorPointY = a3;
}

- (double)dockUpperLeftResizeBottomEdgeAnchorPointX
{
  return self->_dockUpperLeftResizeBottomEdgeAnchorPointX;
}

- (void)setDockUpperLeftResizeBottomEdgeAnchorPointX:(double)a3
{
  self->_dockUpperLeftResizeBottomEdgeAnchorPointX = a3;
}

- (double)dockUpperLeftResizeBottomEdgeAnchorPointY
{
  return self->_dockUpperLeftResizeBottomEdgeAnchorPointY;
}

- (void)setDockUpperLeftResizeBottomEdgeAnchorPointY:(double)a3
{
  self->_dockUpperLeftResizeBottomEdgeAnchorPointY = a3;
}

- (double)dockUpperLeftResizeLeftEdgeAnchorPointX
{
  return self->_dockUpperLeftResizeLeftEdgeAnchorPointX;
}

- (void)setDockUpperLeftResizeLeftEdgeAnchorPointX:(double)a3
{
  self->_dockUpperLeftResizeLeftEdgeAnchorPointX = a3;
}

- (double)dockUpperLeftResizeLeftEdgeAnchorPointY
{
  return self->_dockUpperLeftResizeLeftEdgeAnchorPointY;
}

- (void)setDockUpperLeftResizeLeftEdgeAnchorPointY:(double)a3
{
  self->_dockUpperLeftResizeLeftEdgeAnchorPointY = a3;
}

- (double)dockUpperLeftResizeRightEdgeAnchorPointX
{
  return self->_dockUpperLeftResizeRightEdgeAnchorPointX;
}

- (void)setDockUpperLeftResizeRightEdgeAnchorPointX:(double)a3
{
  self->_dockUpperLeftResizeRightEdgeAnchorPointX = a3;
}

- (double)dockUpperLeftResizeRightEdgeAnchorPointY
{
  return self->_dockUpperLeftResizeRightEdgeAnchorPointY;
}

- (void)setDockUpperLeftResizeRightEdgeAnchorPointY:(double)a3
{
  self->_dockUpperLeftResizeRightEdgeAnchorPointY = a3;
}

- (double)dockLowerLeftResizeTopEdgeAnchorPointX
{
  return self->_dockLowerLeftResizeTopEdgeAnchorPointX;
}

- (void)setDockLowerLeftResizeTopEdgeAnchorPointX:(double)a3
{
  self->_dockLowerLeftResizeTopEdgeAnchorPointX = a3;
}

- (double)dockLowerLeftResizeTopEdgeAnchorPointY
{
  return self->_dockLowerLeftResizeTopEdgeAnchorPointY;
}

- (void)setDockLowerLeftResizeTopEdgeAnchorPointY:(double)a3
{
  self->_dockLowerLeftResizeTopEdgeAnchorPointY = a3;
}

- (double)dockLowerLeftResizeBottomEdgeAnchorPointX
{
  return self->_dockLowerLeftResizeBottomEdgeAnchorPointX;
}

- (void)setDockLowerLeftResizeBottomEdgeAnchorPointX:(double)a3
{
  self->_dockLowerLeftResizeBottomEdgeAnchorPointX = a3;
}

- (double)dockLowerLeftResizeBottomEdgeAnchorPointY
{
  return self->_dockLowerLeftResizeBottomEdgeAnchorPointY;
}

- (void)setDockLowerLeftResizeBottomEdgeAnchorPointY:(double)a3
{
  self->_dockLowerLeftResizeBottomEdgeAnchorPointY = a3;
}

- (double)dockLowerLeftResizeLeftEdgeAnchorPointX
{
  return self->_dockLowerLeftResizeLeftEdgeAnchorPointX;
}

- (void)setDockLowerLeftResizeLeftEdgeAnchorPointX:(double)a3
{
  self->_dockLowerLeftResizeLeftEdgeAnchorPointX = a3;
}

- (double)dockLowerLeftResizeLeftEdgeAnchorPointY
{
  return self->_dockLowerLeftResizeLeftEdgeAnchorPointY;
}

- (void)setDockLowerLeftResizeLeftEdgeAnchorPointY:(double)a3
{
  self->_dockLowerLeftResizeLeftEdgeAnchorPointY = a3;
}

- (double)dockLowerLeftResizeRightEdgeAnchorPointX
{
  return self->_dockLowerLeftResizeRightEdgeAnchorPointX;
}

- (void)setDockLowerLeftResizeRightEdgeAnchorPointX:(double)a3
{
  self->_dockLowerLeftResizeRightEdgeAnchorPointX = a3;
}

- (double)dockLowerLeftResizeRightEdgeAnchorPointY
{
  return self->_dockLowerLeftResizeRightEdgeAnchorPointY;
}

- (void)setDockLowerLeftResizeRightEdgeAnchorPointY:(double)a3
{
  self->_dockLowerLeftResizeRightEdgeAnchorPointY = a3;
}

- (double)dockUpperRightResizeTopEdgeAnchorPointX
{
  return self->_dockUpperRightResizeTopEdgeAnchorPointX;
}

- (void)setDockUpperRightResizeTopEdgeAnchorPointX:(double)a3
{
  self->_dockUpperRightResizeTopEdgeAnchorPointX = a3;
}

- (double)dockUpperRightResizeTopEdgeAnchorPointY
{
  return self->_dockUpperRightResizeTopEdgeAnchorPointY;
}

- (void)setDockUpperRightResizeTopEdgeAnchorPointY:(double)a3
{
  self->_dockUpperRightResizeTopEdgeAnchorPointY = a3;
}

- (double)dockUpperRightResizeBottomEdgeAnchorPointX
{
  return self->_dockUpperRightResizeBottomEdgeAnchorPointX;
}

- (void)setDockUpperRightResizeBottomEdgeAnchorPointX:(double)a3
{
  self->_dockUpperRightResizeBottomEdgeAnchorPointX = a3;
}

- (double)dockUpperRightResizeBottomEdgeAnchorPointY
{
  return self->_dockUpperRightResizeBottomEdgeAnchorPointY;
}

- (void)setDockUpperRightResizeBottomEdgeAnchorPointY:(double)a3
{
  self->_dockUpperRightResizeBottomEdgeAnchorPointY = a3;
}

- (double)dockUpperRightResizeLeftEdgeAnchorPointX
{
  return self->_dockUpperRightResizeLeftEdgeAnchorPointX;
}

- (void)setDockUpperRightResizeLeftEdgeAnchorPointX:(double)a3
{
  self->_dockUpperRightResizeLeftEdgeAnchorPointX = a3;
}

- (double)dockUpperRightResizeLeftEdgeAnchorPointY
{
  return self->_dockUpperRightResizeLeftEdgeAnchorPointY;
}

- (void)setDockUpperRightResizeLeftEdgeAnchorPointY:(double)a3
{
  self->_dockUpperRightResizeLeftEdgeAnchorPointY = a3;
}

- (double)dockUpperRightResizeRightEdgeAnchorPointX
{
  return self->_dockUpperRightResizeRightEdgeAnchorPointX;
}

- (void)setDockUpperRightResizeRightEdgeAnchorPointX:(double)a3
{
  self->_dockUpperRightResizeRightEdgeAnchorPointX = a3;
}

- (double)dockUpperRightResizeRightEdgeAnchorPointY
{
  return self->_dockUpperRightResizeRightEdgeAnchorPointY;
}

- (void)setDockUpperRightResizeRightEdgeAnchorPointY:(double)a3
{
  self->_dockUpperRightResizeRightEdgeAnchorPointY = a3;
}

- (double)dockLowerRightResizeTopEdgeAnchorPointX
{
  return self->_dockLowerRightResizeTopEdgeAnchorPointX;
}

- (void)setDockLowerRightResizeTopEdgeAnchorPointX:(double)a3
{
  self->_dockLowerRightResizeTopEdgeAnchorPointX = a3;
}

- (double)dockLowerRightResizeTopEdgeAnchorPointY
{
  return self->_dockLowerRightResizeTopEdgeAnchorPointY;
}

- (void)setDockLowerRightResizeTopEdgeAnchorPointY:(double)a3
{
  self->_dockLowerRightResizeTopEdgeAnchorPointY = a3;
}

- (double)dockLowerRightResizeBottomEdgeAnchorPointX
{
  return self->_dockLowerRightResizeBottomEdgeAnchorPointX;
}

- (void)setDockLowerRightResizeBottomEdgeAnchorPointX:(double)a3
{
  self->_dockLowerRightResizeBottomEdgeAnchorPointX = a3;
}

- (double)dockLowerRightResizeBottomEdgeAnchorPointY
{
  return self->_dockLowerRightResizeBottomEdgeAnchorPointY;
}

- (void)setDockLowerRightResizeBottomEdgeAnchorPointY:(double)a3
{
  self->_dockLowerRightResizeBottomEdgeAnchorPointY = a3;
}

- (double)dockLowerRightResizeLeftEdgeAnchorPointX
{
  return self->_dockLowerRightResizeLeftEdgeAnchorPointX;
}

- (void)setDockLowerRightResizeLeftEdgeAnchorPointX:(double)a3
{
  self->_dockLowerRightResizeLeftEdgeAnchorPointX = a3;
}

- (double)dockLowerRightResizeLeftEdgeAnchorPointY
{
  return self->_dockLowerRightResizeLeftEdgeAnchorPointY;
}

- (void)setDockLowerRightResizeLeftEdgeAnchorPointY:(double)a3
{
  self->_dockLowerRightResizeLeftEdgeAnchorPointY = a3;
}

- (double)dockLowerRightResizeRightEdgeAnchorPointX
{
  return self->_dockLowerRightResizeRightEdgeAnchorPointX;
}

- (void)setDockLowerRightResizeRightEdgeAnchorPointX:(double)a3
{
  self->_dockLowerRightResizeRightEdgeAnchorPointX = a3;
}

- (double)dockLowerRightResizeRightEdgeAnchorPointY
{
  return self->_dockLowerRightResizeRightEdgeAnchorPointY;
}

- (void)setDockLowerRightResizeRightEdgeAnchorPointY:(double)a3
{
  self->_dockLowerRightResizeRightEdgeAnchorPointY = a3;
}

@end