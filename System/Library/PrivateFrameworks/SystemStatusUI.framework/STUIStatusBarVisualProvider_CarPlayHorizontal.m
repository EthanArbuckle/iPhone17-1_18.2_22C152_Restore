@interface STUIStatusBarVisualProvider_CarPlayHorizontal
+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3;
- (NSDictionary)orderedDisplayItemPlacements;
- (NSLayoutConstraint)driverSideConstraint;
- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3;
- (id)setupInContainerView:(id)a3;
- (void)setDriverSideConstraint:(id)a3;
- (void)setOrderedDisplayItemPlacements:(id)a3;
@end

@implementation STUIStatusBarVisualProvider_CarPlayHorizontal

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4FB30D8];
  double v4 = 45.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)setupInContainerView:(id)a3
{
  v203[18] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v197 = [MEMORY[0x1E4F1CA48] array];
  v5 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"time"];
  v6 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v7 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v6 setHorizontalLayout:v7];

  v8 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v6 setVerticalLayout:v8];

  v196 = v6;
  [(STUIStatusBarRegion *)v5 setLayout:v6];
  [(STUIStatusBarVisualProvider_CarPlay *)self setTimeRegion:v5];
  v9 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"pill"];
  v10 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v11 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v10 setHorizontalLayout:v11];

  v12 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v10 setVerticalLayout:v12];

  v194 = v10;
  [(STUIStatusBarRegion *)v9 setLayout:v10];
  -[STUIStatusBarRegion setActionInsets:](v9, "setActionInsets:", -10.0, -10.0, -10.0, -10.0);
  v13 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
  v195 = v9;
  [v13 setPillRegion:v9];

  v14 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"pillContent"];
  v15 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
  v16 = [v15 pillRegion];
  [(STUIStatusBarRegion *)v14 setEnabilityRegion:v16];

  v17 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v18 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v17 setHorizontalLayout:v18];

  v19 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v17 setVerticalLayout:v19];

  v193 = v14;
  v192 = v17;
  [(STUIStatusBarRegion *)v14 setLayout:v17];
  v20 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"sensorActivity"];
  v21 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v22 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v21 setHorizontalLayout:v22];

  v23 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v21 setVerticalLayout:v23];

  v200 = v20;
  v191 = v21;
  [(STUIStatusBarRegion *)v20 setLayout:v21];
  v24 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"oppositeDriver"];
  v25 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v26 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  [(STUIStatusBarRegionAxisCenteringLayout *)v26 setInterspace:4.0];
  v188 = v26;
  [(STUIStatusBarRegionAxesLayout *)v25 setHorizontalLayout:v26];
  v27 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:1];
  [(STUIStatusBarRegionAxesLayout *)v25 setVerticalLayout:v27];

  v189 = v25;
  [(STUIStatusBarRegion *)v24 setLayout:v25];
  -[STUIStatusBarRegion setActionInsets:](v24, "setActionInsets:", -10.0, -10.0, -10.0, -10.0);
  [(STUIStatusBarVisualProvider_CarPlay *)self setRadarRegion:v24];
  v28 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"driver"];
  v29 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v30 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v30 setAlignment:1];
  [(STUIStatusBarRegionAxisStackingLayout *)v30 setInterspace:4.0];
  [(STUIStatusBarRegionAxesLayout *)v29 setHorizontalLayout:v30];

  v31 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:1];
  [(STUIStatusBarRegionAxesLayout *)v29 setVerticalLayout:v31];

  v186 = v29;
  [(STUIStatusBarRegion *)v28 setLayout:v29];
  -[STUIStatusBarRegion setActionInsets:](v28, "setActionInsets:", -10.0, -10.0, -10.0, -10.0);
  v32 = v4;
  id v199 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  objc_msgSend(v4, "addLayoutGuide:");
  v33 = self;
  v34 = [(STUIStatusBarVisualProvider_CarPlay *)self statusBar];
  v35 = [v34 targetScreen];
  LODWORD(v29) = [v35 _isRightHandDrive];

  v198 = v32;
  v190 = v24;
  v187 = v28;
  if (v29)
  {
    v36 = [(STUIStatusBarRegion *)v5 layoutItem];
    v37 = [v36 leftAnchor];
    v38 = [(STUIStatusBarRegion *)v28 layoutItem];
    v39 = [v38 rightAnchor];
    [v37 constraintEqualToAnchor:v39 constant:0.0];
    v41 = v40 = v28;
    [(STUIStatusBarVisualProvider_CarPlayHorizontal *)v33 setDriverSideConstraint:v41];

    v185 = [v199 widthAnchor];
    v184 = [v185 constraintEqualToConstant:103.0];
    v203[0] = v184;
    v42 = [v199 topAnchor];
    v182 = [v32 topAnchor];
    v183 = v42;
    v181 = [v42 constraintEqualToAnchor:v182];
    v203[1] = v181;
    v43 = [v199 bottomAnchor];
    v179 = [v32 bottomAnchor];
    v180 = v43;
    v178 = [v43 constraintEqualToAnchor:v179];
    v203[2] = v178;
    v44 = [v199 centerXAnchor];
    v176 = [v32 centerXAnchor];
    v177 = v44;
    v175 = [v44 constraintEqualToAnchor:v176];
    v203[3] = v175;
    v174 = [(STUIStatusBarRegion *)v5 layoutItem];
    v45 = [v174 centerYAnchor];
    v172 = [v32 safeAreaLayoutGuide];
    [v172 centerYAnchor];
    v171 = v173 = v45;
    v170 = objc_msgSend(v45, "constraintEqualToAnchor:");
    v203[4] = v170;
    v169 = [(STUIStatusBarRegion *)v5 layoutItem];
    v168 = [v169 heightAnchor];
    v167 = [v168 constraintEqualToConstant:18.0];
    v203[5] = v167;
    v166 = [(STUIStatusBarRegion *)v5 layoutItem];
    v165 = [v166 widthAnchor];
    v164 = [v165 constraintEqualToConstant:39.0];
    v203[6] = v164;
    v163 = [(STUIStatusBarRegion *)v5 layoutItem];
    v46 = [v163 rightAnchor];
    v161 = [v32 safeAreaLayoutGuide];
    [v161 rightAnchor];
    v160 = v162 = v46;
    v159 = objc_msgSend(v46, "constraintEqualToAnchor:constant:", -8.0);
    v203[7] = v159;
    v158 = [(STUIStatusBarRegion *)v200 layoutItem];
    v47 = [v158 centerYAnchor];
    v156 = [v32 safeAreaLayoutGuide];
    [v156 centerYAnchor];
    v155 = v157 = v47;
    v154 = objc_msgSend(v47, "constraintEqualToAnchor:");
    v203[8] = v154;
    v153 = [(STUIStatusBarRegion *)v200 layoutItem];
    v48 = [v153 rightAnchor];
    v151 = [(STUIStatusBarRegion *)v5 layoutItem];
    [v151 leftAnchor];
    v150 = v152 = v48;
    v149 = objc_msgSend(v48, "constraintEqualToAnchor:constant:", -4.0);
    v203[9] = v149;
    v148 = [(STUIStatusBarRegion *)v24 layoutItem];
    v147 = [v148 heightAnchor];
    v146 = [v147 constraintEqualToConstant:10.0];
    v203[10] = v146;
    v145 = [(STUIStatusBarRegion *)v24 layoutItem];
    v49 = [v145 leftAnchor];
    v143 = [v32 safeAreaLayoutGuide];
    [v143 leftAnchor];
    v142 = v144 = v49;
    v141 = objc_msgSend(v49, "constraintEqualToAnchor:constant:", 10.0);
    v203[11] = v141;
    v140 = [(STUIStatusBarRegion *)v24 layoutItem];
    v50 = [v140 rightAnchor];
    v138 = [v199 leftAnchor];
    v139 = v50;
    v137 = [v50 constraintLessThanOrEqualToAnchor:v138];
    v203[12] = v137;
    v136 = [(STUIStatusBarRegion *)v24 layoutItem];
    v51 = [v136 centerYAnchor];
    v134 = [v32 safeAreaLayoutGuide];
    [v134 centerYAnchor];
    v133 = v135 = v51;
    v132 = objc_msgSend(v51, "constraintEqualToAnchor:");
    v203[13] = v132;
    v131 = [(STUIStatusBarRegion *)v40 layoutItem];
    v52 = [v131 centerYAnchor];
    v129 = [v32 safeAreaLayoutGuide];
    [v129 centerYAnchor];
    v128 = v130 = v52;
    v127 = objc_msgSend(v52, "constraintEqualToAnchor:");
    v203[14] = v127;
    v53 = [(STUIStatusBarRegion *)v40 layoutItem];
    v54 = [v53 heightAnchor];
    v55 = [v54 constraintEqualToConstant:45.0];
    v203[15] = v55;
    v56 = [(STUIStatusBarVisualProvider_CarPlayHorizontal *)v33 driverSideConstraint];
    v203[16] = v56;
    v57 = [(STUIStatusBarRegion *)v40 layoutItem];
    v58 = [v57 leftAnchor];
    v59 = [v199 rightAnchor];
    v60 = [v58 constraintEqualToAnchor:v59 constant:7.0];
    v203[17] = v60;
    v61 = v203;
  }
  else
  {
    v62 = [(STUIStatusBarRegion *)v28 layoutItem];
    v63 = [v62 leftAnchor];
    v64 = [(STUIStatusBarRegion *)v5 layoutItem];
    v65 = [v64 rightAnchor];
    [v63 constraintEqualToAnchor:v65 constant:0.0];
    v67 = v66 = v28;
    [(STUIStatusBarVisualProvider_CarPlayHorizontal *)v33 setDriverSideConstraint:v67];

    v185 = [v199 widthAnchor];
    v184 = [v185 constraintEqualToConstant:103.0];
    v202[0] = v184;
    v68 = [v199 topAnchor];
    v182 = [v32 topAnchor];
    v183 = v68;
    v181 = [v68 constraintEqualToAnchor:v182];
    v202[1] = v181;
    v69 = [v199 bottomAnchor];
    v179 = [v32 bottomAnchor];
    v180 = v69;
    v178 = [v69 constraintEqualToAnchor:v179];
    v202[2] = v178;
    v70 = [v199 centerXAnchor];
    v176 = [v32 centerXAnchor];
    v177 = v70;
    v175 = [v70 constraintEqualToAnchor:v176];
    v202[3] = v175;
    v174 = [(STUIStatusBarRegion *)v5 layoutItem];
    v71 = [v174 centerYAnchor];
    v172 = [v32 safeAreaLayoutGuide];
    [v172 centerYAnchor];
    v171 = v173 = v71;
    v170 = objc_msgSend(v71, "constraintEqualToAnchor:");
    v202[4] = v170;
    v169 = [(STUIStatusBarRegion *)v5 layoutItem];
    v168 = [v169 heightAnchor];
    v167 = [v168 constraintEqualToConstant:18.0];
    v202[5] = v167;
    v166 = [(STUIStatusBarRegion *)v5 layoutItem];
    v165 = [v166 widthAnchor];
    v164 = [v165 constraintEqualToConstant:39.0];
    v202[6] = v164;
    v163 = [(STUIStatusBarRegion *)v5 layoutItem];
    v72 = [v163 leftAnchor];
    v161 = [v32 safeAreaLayoutGuide];
    [v161 leftAnchor];
    v160 = v162 = v72;
    v159 = objc_msgSend(v72, "constraintEqualToAnchor:constant:", 8.0);
    v202[7] = v159;
    v158 = [(STUIStatusBarRegion *)v200 layoutItem];
    v73 = [v158 centerYAnchor];
    v156 = [v32 safeAreaLayoutGuide];
    [v156 centerYAnchor];
    v155 = v157 = v73;
    v154 = objc_msgSend(v73, "constraintEqualToAnchor:");
    v202[8] = v154;
    v153 = [(STUIStatusBarRegion *)v200 layoutItem];
    v74 = [v153 leftAnchor];
    v151 = [(STUIStatusBarRegion *)v5 layoutItem];
    [v151 rightAnchor];
    v150 = v152 = v74;
    v149 = objc_msgSend(v74, "constraintEqualToAnchor:constant:", 4.0);
    v202[9] = v149;
    v148 = [(STUIStatusBarRegion *)v24 layoutItem];
    v147 = [v148 heightAnchor];
    v146 = [v147 constraintEqualToConstant:45.0];
    v202[10] = v146;
    v145 = [(STUIStatusBarRegion *)v24 layoutItem];
    v75 = [v145 leftAnchor];
    v143 = [v199 rightAnchor];
    v144 = v75;
    v142 = [v75 constraintGreaterThanOrEqualToAnchor:v143];
    v202[11] = v142;
    v141 = [(STUIStatusBarRegion *)v24 layoutItem];
    v76 = [v141 rightAnchor];
    v139 = [v32 safeAreaLayoutGuide];
    [v139 rightAnchor];
    v138 = v140 = v76;
    v137 = objc_msgSend(v76, "constraintEqualToAnchor:constant:", -10.0);
    v202[12] = v137;
    v136 = [(STUIStatusBarRegion *)v24 layoutItem];
    v77 = [v136 centerYAnchor];
    v134 = [v32 safeAreaLayoutGuide];
    [v134 centerYAnchor];
    v133 = v135 = v77;
    v132 = objc_msgSend(v77, "constraintEqualToAnchor:");
    v202[13] = v132;
    v131 = [(STUIStatusBarVisualProvider_CarPlayHorizontal *)v33 driverSideConstraint];
    v202[14] = v131;
    v130 = [(STUIStatusBarRegion *)v66 layoutItem];
    v129 = [v130 heightAnchor];
    v128 = [v129 constraintEqualToConstant:45.0];
    v202[15] = v128;
    v127 = [(STUIStatusBarRegion *)v66 layoutItem];
    v53 = [v127 centerYAnchor];
    v54 = [v32 safeAreaLayoutGuide];
    v55 = [v54 centerYAnchor];
    v56 = [v53 constraintEqualToAnchor:v55];
    v202[16] = v56;
    v57 = [(STUIStatusBarRegion *)v66 layoutItem];
    v58 = [v57 rightAnchor];
    v59 = [v199 leftAnchor];
    v60 = [v58 constraintEqualToAnchor:v59 constant:-7.0];
    v202[17] = v60;
    v61 = v202;
  }
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:18];
  [v197 addObjectsFromArray:v78];

  v79 = [(STUIStatusBarRegion *)v195 layoutItem];
  v80 = [v79 topAnchor];
  v81 = [(STUIStatusBarRegion *)v5 layoutItem];
  v82 = [v81 topAnchor];
  v83 = [v80 constraintEqualToAnchor:v82];
  [v197 addObject:v83];

  v84 = [(STUIStatusBarRegion *)v195 layoutItem];
  v85 = [v84 bottomAnchor];
  v86 = [(STUIStatusBarRegion *)v5 layoutItem];
  v87 = [v86 bottomAnchor];
  v88 = [v85 constraintEqualToAnchor:v87];
  [v197 addObject:v88];

  v89 = [(STUIStatusBarRegion *)v195 layoutItem];
  v90 = [v89 leadingAnchor];
  v91 = [(STUIStatusBarRegion *)v5 layoutItem];
  v92 = [v91 leadingAnchor];
  v93 = [v90 constraintEqualToAnchor:v92];
  [v197 addObject:v93];

  v94 = [(STUIStatusBarRegion *)v195 layoutItem];
  v95 = [v94 trailingAnchor];
  v96 = [(STUIStatusBarRegion *)v5 layoutItem];
  v97 = [v96 trailingAnchor];
  v98 = [v95 constraintEqualToAnchor:v97];
  [v197 addObject:v98];

  v99 = [(STUIStatusBarRegion *)v193 layoutItem];
  v100 = [v99 topAnchor];
  v101 = [(STUIStatusBarRegion *)v195 layoutItem];
  v102 = [v101 topAnchor];
  v103 = [v100 constraintEqualToAnchor:v102];
  [v197 addObject:v103];

  v104 = [(STUIStatusBarRegion *)v193 layoutItem];
  v105 = [v104 bottomAnchor];
  v106 = [(STUIStatusBarRegion *)v195 layoutItem];
  v107 = [v106 bottomAnchor];
  v108 = [v105 constraintEqualToAnchor:v107];
  [v197 addObject:v108];

  v109 = [(STUIStatusBarRegion *)v193 layoutItem];
  v110 = [v109 leadingAnchor];
  v111 = [(STUIStatusBarRegion *)v195 layoutItem];
  v112 = [v111 leadingAnchor];
  v113 = [v110 constraintEqualToAnchor:v112];
  [v197 addObject:v113];

  v114 = [(STUIStatusBarRegion *)v193 layoutItem];
  v115 = [v114 trailingAnchor];
  v116 = [(STUIStatusBarRegion *)v195 layoutItem];
  v117 = [v116 trailingAnchor];
  v118 = [v115 constraintEqualToAnchor:v117];
  [v197 addObject:v118];

  v119 = [(STUIStatusBarRegion *)v5 layoutItem];
  objc_msgSend(v198, "_ui_addSubLayoutItem:", v119);

  v120 = [(STUIStatusBarRegion *)v200 layoutItem];
  objc_msgSend(v198, "_ui_addSubLayoutItem:", v120);

  v121 = [(STUIStatusBarRegion *)v190 layoutItem];
  objc_msgSend(v198, "_ui_addSubLayoutItem:", v121);

  v122 = [(STUIStatusBarRegion *)v187 layoutItem];
  objc_msgSend(v198, "_ui_addSubLayoutItem:", v122);

  v123 = [(STUIStatusBarRegion *)v195 layoutItem];
  objc_msgSend(v198, "_ui_addSubLayoutItem:", v123);

  v124 = [(STUIStatusBarRegion *)v193 layoutItem];
  objc_msgSend(v198, "_ui_addSubLayoutItem:", v124);

  [MEMORY[0x1E4F28DC8] activateConstraints:v197];
  v201[0] = v193;
  v201[1] = v195;
  v201[2] = v5;
  v201[3] = v200;
  v201[4] = v187;
  v201[5] = v190;
  v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:v201 count:6];

  return v125;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  v103[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    id v65 = v4;
    v6 = +[STUIStatusBarTimeItem shortTimeDisplayIdentifier];
    uint64_t v7 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v6 priority:400];

    v8 = +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];
    v9 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v8 priority:500];
    v80 = (void *)v7;
    v103[0] = v7;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:1];
    v79 = [v9 excludingPlacements:v10];

    v11 = +[STUIStatusBarTimeItem pillTimeDisplayIdentifier];
    uint64_t v12 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v11 priority:450];

    v13 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v14 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v13 priority:475];
    v78 = (void *)v12;
    uint64_t v102 = v12;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
    uint64_t v16 = [v14 excludingPlacements:v15];

    v17 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
    [v17 setPillIconPlacement:v16];

    v18 = +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
    v19 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v18 priority:474];
    v77 = (void *)v16;
    uint64_t v101 = v16;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
    v76 = [v19 requiringAllPlacements:v20];

    v21 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v75 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v21 priority:600];

    v22 = +[STUIStatusBarCellularItem signalStrengthDisplayIdentifier];
    uint64_t v23 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v22 priority:350];

    v24 = +[STUIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier];
    v25 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v24 priority:375];
    uint64_t v100 = v23;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
    uint64_t v27 = [v25 excludingPlacements:v26];

    v28 = +[STUIStatusBarCellularItem typeDisplayIdentifier];
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v28 priority:250];
    v29 = v64 = self;

    v30 = +[STUIStatusBarWifiItem signalStrengthDisplayIdentifier];
    v31 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v30 priority:300];
    v99 = v29;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
    v33 = [v31 excludingPlacements:v32];

    v34 = +[STUIStatusBarWifiItem iconDisplayIdentifier];
    v35 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v34 priority:301];
    v98[0] = v33;
    v98[1] = v29;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:2];
    v72 = [v35 excludingPlacements:v36];

    v37 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v38 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v37 priority:1200];
    v73 = (void *)v27;
    v74 = (void *)v23;
    v97[0] = v23;
    v97[1] = v27;
    v97[2] = v33;
    v97[3] = v29;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:4];
    v71 = [v38 excludingPlacements:v39];

    v40 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v70 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v40 priority:550];

    v41 = +[STUIStatusBarBatteryItem iconDisplayIdentifier];
    v69 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v41 priority:100];

    v42 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v68 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v42 priority:85];

    v43 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v67 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v43 priority:90];

    v44 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v66 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v44 priority:155];

    v45 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v46 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v45 priority:150];

    v47 = v64;
    v48 = [(STUIStatusBarVisualProvider_CarPlay *)v64 statusBar];
    v49 = [v48 targetScreen];
    int v50 = [v49 _isRightHandDrive];

    if (v50)
    {
      v95[0] = @"time";
      v94 = v80;
      v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
      v96[0] = v51;
      v95[1] = @"pill";
      v93 = v79;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
      v96[1] = v52;
      v95[2] = @"pillContent";
      v92[0] = v77;
      v92[1] = v76;
      v92[2] = v78;
      v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:3];
      v96[2] = v53;
      v95[3] = @"sensorActivity";
      v91 = v75;
      v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
      v96[3] = v54;
      v95[4] = @"driver";
      v90 = v46;
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
      v96[4] = v55;
      v95[5] = @"oppositeDriver";
      v89[0] = v70;
      v89[1] = v69;
      v89[2] = v73;
      v89[3] = v74;
      v89[4] = v29;
      v89[5] = v33;
      v89[6] = v72;
      v89[7] = v71;
      v89[8] = v67;
      v89[9] = v68;
      v89[10] = v66;
      v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:11];
      v96[5] = v56;
      v57 = (void *)MEMORY[0x1E4F1C9E8];
      v58 = v96;
      v59 = v95;
    }
    else
    {
      v87[0] = @"time";
      v86 = v80;
      v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
      v88[0] = v51;
      v87[1] = @"pill";
      v85 = v79;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
      v88[1] = v52;
      v87[2] = @"pillContent";
      v84[0] = v77;
      v84[1] = v76;
      v84[2] = v78;
      v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
      v88[2] = v53;
      v87[3] = @"sensorActivity";
      v83 = v75;
      v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
      v88[3] = v54;
      v87[4] = @"driver";
      v82 = v46;
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
      v88[4] = v55;
      v87[5] = @"oppositeDriver";
      v81[0] = v67;
      v81[1] = v68;
      v81[2] = v73;
      v81[3] = v74;
      v81[4] = v29;
      v81[5] = v33;
      v81[6] = v72;
      v81[7] = v71;
      v81[8] = v70;
      v81[9] = v69;
      v81[10] = v66;
      v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:11];
      v88[5] = v56;
      v57 = (void *)MEMORY[0x1E4F1C9E8];
      v58 = v88;
      v59 = v87;
    }
    uint64_t v60 = objc_msgSend(v57, "dictionaryWithObjects:forKeys:count:", v58, v59, 6, v64);
    v61 = v47->_orderedDisplayItemPlacements;
    v47->_orderedDisplayItemPlacements = (NSDictionary *)v60;

    orderedDisplayItemPlacements = v47->_orderedDisplayItemPlacements;
    id v4 = v65;
  }
  v62 = [(NSDictionary *)orderedDisplayItemPlacements objectForKeyedSubscript:v4];

  return v62;
}

- (NSDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
}

- (NSLayoutConstraint)driverSideConstraint
{
  return self->_driverSideConstraint;
}

- (void)setDriverSideConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverSideConstraint, 0);
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
}

@end