@interface STUIStatusBarVisualProvider_CarPlayVertical
+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3;
- (NSDictionary)orderedDisplayItemPlacements;
- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3;
- (id)setupInContainerView:(id)a3;
- (void)itemCreated:(id)a3;
- (void)setOrderedDisplayItemPlacements:(id)a3;
@end

@implementation STUIStatusBarVisualProvider_CarPlayVertical

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4FB30D8];
  double v4 = 45.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)itemCreated:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v7;
    [v3 setItemSpacing:3.0];
    [v3 setAdditionRemovalScale:0.25];
    [v3 setAdditionRemovalDuration:0.25];
  }
  else
  {
    double v4 = [v7 identifier];
    v5 = +[STUIStatusBarItem identifier];

    if (v4 != v5) {
      goto LABEL_6;
    }
    id v6 = v7;
    objc_msgSend(v6, "setPillSize:", 15.0, 15.0);
    [v6 setPillPadding:3.0];
  }

LABEL_6:
}

- (id)setupInContainerView:(id)a3
{
  v167[6] = *MEMORY[0x1E4F143B8];
  double v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 array];
  id v7 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"time"];
  v8 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v9 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  v162 = v8;
  [(STUIStatusBarRegionAxesLayout *)v8 setHorizontalLayout:v9];

  v10 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v8 setVerticalLayout:v10];

  v163 = v7;
  [(STUIStatusBarRegion *)v7 setLayout:v8];
  [(STUIStatusBarVisualProvider_CarPlay *)self setTimeRegion:v7];
  v11 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"pill"];
  v12 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v13 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  v161 = v12;
  [(STUIStatusBarRegionAxesLayout *)v12 setHorizontalLayout:v13];

  v14 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v12 setVerticalLayout:v14];

  [(STUIStatusBarRegion *)v11 setLayout:v12];
  v164 = v11;
  -[STUIStatusBarRegion setActionInsets:](v11, "setActionInsets:", 0.0, -3.0, -13.0, -3.0);
  v15 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
  [v15 setPillRegion:v11];

  v16 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"pillContent"];
  v17 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
  v18 = [v17 pillRegion];
  v165 = v16;
  [(STUIStatusBarRegion *)v16 setEnabilityRegion:v18];

  v19 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v20 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  v160 = v19;
  [(STUIStatusBarRegionAxesLayout *)v19 setHorizontalLayout:v20];

  v21 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v19 setVerticalLayout:v21];

  [(STUIStatusBarRegion *)v16 setLayout:v19];
  v166 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"signal"];
  v158 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v159 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  [(STUIStatusBarRegionAxisCenteringLayout *)v159 setInterspace:3.0];
  [(STUIStatusBarRegionAxesLayout *)v158 setHorizontalLayout:v159];
  v22 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:1];
  [(STUIStatusBarRegionAxesLayout *)v158 setVerticalLayout:v22];

  [(STUIStatusBarRegion *)v166 setLayout:v158];
  v155 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"top"];
  v23 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v24 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:1];
  v157 = v23;
  [(STUIStatusBarRegionAxesLayout *)v23 setHorizontalLayout:v24];

  v25 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v25 setAlignment:3];
  [(STUIStatusBarRegionAxisStackingLayout *)v25 setInterspace:8.0];
  [(STUIStatusBarRegionAxesLayout *)v23 setVerticalLayout:v25];

  [(STUIStatusBarRegion *)v155 setLayout:v23];
  v26 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"bottom"];
  v27 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v28 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:1];
  v156 = v27;
  [(STUIStatusBarRegionAxesLayout *)v27 setHorizontalLayout:v28];

  v29 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v29 setAlignment:1];
  [(STUIStatusBarRegionAxisStackingLayout *)v29 setInterspace:8.0];
  [(STUIStatusBarRegionAxesLayout *)v27 setVerticalLayout:v29];

  [(STUIStatusBarRegion *)v26 setLayout:v27];
  -[STUIStatusBarRegion setActionInsets:](v26, "setActionInsets:", 0.0, -3.0, -10.0, -10.0);
  [(STUIStatusBarVisualProvider_CarPlay *)self setRadarRegion:v26];
  id v30 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [v5 addLayoutGuide:v30];
  v31 = [v30 heightAnchor];
  v32 = [v31 constraintEqualToConstant:103.0];
  [v6 addObject:v32];

  v33 = [v30 leadingAnchor];
  v34 = [v5 leadingAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v6 addObject:v35];

  v36 = [v30 trailingAnchor];
  v37 = [v5 trailingAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  [v6 addObject:v38];

  v39 = [v30 centerYAnchor];
  v40 = [v5 centerYAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  [v6 addObject:v41];

  v42 = [(STUIStatusBarRegion *)v163 layoutItem];
  v43 = [v42 topAnchor];
  v44 = [v5 safeAreaLayoutGuide];
  v45 = [v44 topAnchor];
  v46 = [v43 constraintEqualToAnchor:v45];
  [v6 addObject:v46];

  v47 = [(STUIStatusBarRegion *)v163 layoutItem];
  v48 = [v47 heightAnchor];
  v49 = [v48 constraintEqualToConstant:18.0];
  [v6 addObject:v49];

  v50 = [(STUIStatusBarRegion *)v163 layoutItem];
  v51 = [v50 widthAnchor];
  v52 = [v51 constraintEqualToConstant:39.0];
  [v6 addObject:v52];

  v53 = [(STUIStatusBarRegion *)v163 layoutItem];
  v54 = [v53 centerXAnchor];
  v55 = [v5 centerXAnchor];
  v56 = [v54 constraintEqualToAnchor:v55];
  [v6 addObject:v56];

  v57 = [(STUIStatusBarRegion *)v163 layoutItem];
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v57);

  v58 = [(STUIStatusBarRegion *)v164 layoutItem];
  v59 = [v58 topAnchor];
  v60 = [(STUIStatusBarRegion *)v163 layoutItem];
  v61 = [v60 topAnchor];
  v62 = [v59 constraintEqualToAnchor:v61];
  [v6 addObject:v62];

  v63 = [(STUIStatusBarRegion *)v164 layoutItem];
  v64 = [v63 bottomAnchor];
  v65 = [(STUIStatusBarRegion *)v163 layoutItem];
  v66 = [v65 bottomAnchor];
  v67 = [v64 constraintEqualToAnchor:v66];
  [v6 addObject:v67];

  v68 = [(STUIStatusBarRegion *)v164 layoutItem];
  v69 = [v68 leadingAnchor];
  v70 = [(STUIStatusBarRegion *)v163 layoutItem];
  v71 = [v70 leadingAnchor];
  v72 = [v69 constraintEqualToAnchor:v71];
  [v6 addObject:v72];

  v73 = [(STUIStatusBarRegion *)v164 layoutItem];
  v74 = [v73 trailingAnchor];
  v75 = [(STUIStatusBarRegion *)v163 layoutItem];
  v76 = [v75 trailingAnchor];
  v77 = [v74 constraintEqualToAnchor:v76];
  [v6 addObject:v77];

  v78 = [(STUIStatusBarRegion *)v164 layoutItem];
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v78);

  v79 = [(STUIStatusBarRegion *)v165 layoutItem];
  v80 = [v79 topAnchor];
  v81 = [(STUIStatusBarRegion *)v164 layoutItem];
  v82 = [v81 topAnchor];
  v83 = [v80 constraintEqualToAnchor:v82];
  [v6 addObject:v83];

  v84 = [(STUIStatusBarRegion *)v165 layoutItem];
  v85 = [v84 bottomAnchor];
  v86 = [(STUIStatusBarRegion *)v164 layoutItem];
  v87 = [v86 bottomAnchor];
  v88 = [v85 constraintEqualToAnchor:v87];
  [v6 addObject:v88];

  v89 = [(STUIStatusBarRegion *)v165 layoutItem];
  v90 = [v89 leadingAnchor];
  v91 = [(STUIStatusBarRegion *)v164 layoutItem];
  v92 = [v91 leadingAnchor];
  v93 = [v90 constraintEqualToAnchor:v92];
  [v6 addObject:v93];

  v94 = [(STUIStatusBarRegion *)v165 layoutItem];
  v95 = [v94 trailingAnchor];
  v96 = [(STUIStatusBarRegion *)v164 layoutItem];
  v97 = [v96 trailingAnchor];
  v98 = [v95 constraintEqualToAnchor:v97];
  [v6 addObject:v98];

  v99 = [(STUIStatusBarRegion *)v165 layoutItem];
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v99);

  v100 = [(STUIStatusBarRegion *)v166 layoutItem];
  v101 = [v100 topAnchor];
  v102 = [(STUIStatusBarRegion *)v163 layoutItem];
  v103 = [v102 bottomAnchor];
  v104 = [v101 constraintEqualToAnchor:v103 constant:3.0];
  [v6 addObject:v104];

  v105 = [(STUIStatusBarRegion *)v166 layoutItem];
  v106 = [v105 heightAnchor];
  v107 = [v106 constraintEqualToConstant:10.0];
  [v6 addObject:v107];

  v108 = [(STUIStatusBarRegion *)v166 layoutItem];
  v109 = [v108 leadingAnchor];
  v110 = [v5 leadingAnchor];
  v111 = [v109 constraintEqualToAnchor:v110];
  [v6 addObject:v111];

  v112 = [(STUIStatusBarRegion *)v166 layoutItem];
  v113 = [v112 trailingAnchor];
  v114 = [v5 trailingAnchor];
  v115 = [v113 constraintEqualToAnchor:v114];
  [v6 addObject:v115];

  v116 = [(STUIStatusBarRegion *)v166 layoutItem];
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v116);

  v117 = [(STUIStatusBarRegion *)v155 layoutItem];
  v118 = [v117 topAnchor];
  v119 = [(STUIStatusBarRegion *)v166 layoutItem];
  v120 = [v119 bottomAnchor];
  v121 = [v118 constraintEqualToAnchor:v120 constant:8.0];
  [v6 addObject:v121];

  v122 = [(STUIStatusBarRegion *)v155 layoutItem];
  v123 = [v122 bottomAnchor];
  v124 = [v30 topAnchor];
  v125 = [v123 constraintEqualToAnchor:v124 constant:-5.0];
  [v6 addObject:v125];

  v126 = [(STUIStatusBarRegion *)v155 layoutItem];
  v127 = [v126 leadingAnchor];
  v128 = [v5 leadingAnchor];
  v129 = [v127 constraintEqualToAnchor:v128];
  [v6 addObject:v129];

  v130 = [(STUIStatusBarRegion *)v155 layoutItem];
  v131 = [v130 trailingAnchor];
  v132 = [v5 trailingAnchor];
  v133 = [v131 constraintEqualToAnchor:v132];
  [v6 addObject:v133];

  v134 = [(STUIStatusBarRegion *)v155 layoutItem];
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v134);

  v135 = [(STUIStatusBarRegion *)v26 layoutItem];
  v136 = [v135 topAnchor];
  v137 = [v30 bottomAnchor];
  v138 = [v136 constraintEqualToAnchor:v137 constant:5.0];
  [v6 addObject:v138];

  v139 = [(STUIStatusBarRegion *)v26 layoutItem];
  v140 = [v139 bottomAnchor];
  v141 = [v5 safeAreaLayoutGuide];
  v142 = [v141 bottomAnchor];
  v143 = [v140 constraintEqualToAnchor:v142 constant:-5.0];
  [v6 addObject:v143];

  v144 = [(STUIStatusBarRegion *)v26 layoutItem];
  v145 = [v144 leadingAnchor];
  v146 = [v5 leadingAnchor];
  v147 = [v145 constraintEqualToAnchor:v146];
  [v6 addObject:v147];

  v148 = [(STUIStatusBarRegion *)v26 layoutItem];
  v149 = [v148 trailingAnchor];
  v150 = [v5 trailingAnchor];
  v151 = [v149 constraintEqualToAnchor:v150];
  [v6 addObject:v151];

  v152 = [(STUIStatusBarRegion *)v26 layoutItem];
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v152);

  [MEMORY[0x1E4F28DC8] activateConstraints:v6];
  v167[0] = v165;
  v167[1] = v164;
  v167[2] = v163;
  v167[3] = v166;
  v167[4] = v155;
  v167[5] = v26;
  v153 = [MEMORY[0x1E4F1C978] arrayWithObjects:v167 count:6];

  return v153;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    id v6 = self;
    +[STUIStatusBarTimeItem shortTimeDisplayIdentifier];
    id v7 = v67 = v4;
    v80 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v7 priority:400];

    v8 = +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];
    v9 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v8 priority:500];
    v95[0] = v80;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:1];
    v79 = [v9 excludingPlacements:v10];

    v11 = +[STUIStatusBarTimeItem pillTimeDisplayIdentifier];
    v78 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v11 priority:450];

    v12 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v13 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v12 priority:475];
    v94 = v78;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
    uint64_t v15 = [v13 excludingPlacements:v14];

    v73 = v6;
    v16 = [(STUIStatusBarVisualProvider_CarPlay *)v6 pillRegionCoordinator];
    v77 = (void *)v15;
    [v16 setPillIconPlacement:v15];

    v17 = +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
    v18 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v17 priority:474];
    uint64_t v93 = v15;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
    v74 = [v18 requiringAllPlacements:v19];

    v20 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v76 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v20 priority:600];

    v21 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v75 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v21 priority:599];

    v22 = +[STUIStatusBarCellularItem signalStrengthDisplayIdentifier];
    uint64_t v23 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v22 priority:350];

    v24 = +[STUIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier];
    v25 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v24 priority:375];
    uint64_t v92 = v23;
    uint64_t v26 = v23;
    v72 = (void *)v23;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
    v68 = [v25 excludingPlacements:v27];

    v28 = +[STUIStatusBarCellularItem typeDisplayIdentifier];
    uint64_t v29 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v28 priority:250];

    id v30 = +[STUIStatusBarWifiItem signalStrengthDisplayIdentifier];
    v31 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v30 priority:300];
    uint64_t v91 = v29;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
    uint64_t v33 = [v31 excludingPlacements:v32];

    v34 = +[STUIStatusBarWifiItem iconDisplayIdentifier];
    v35 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v34 priority:301];
    v90[0] = v33;
    v90[1] = v29;
    v71 = (void *)v33;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
    v70 = [v35 excludingPlacements:v36];

    v37 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v38 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v37 priority:1200];
    v89[0] = v26;
    v89[1] = v68;
    v89[2] = v33;
    v89[3] = v70;
    v89[4] = v29;
    v63 = (void *)v29;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:5];
    v69 = [v38 excludingPlacements:v39];

    v40 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v66 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v40 priority:601];

    v41 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v65 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v41 priority:598];

    v42 = +[STUIStatusBarBatteryItem iconDisplayIdentifier];
    v59 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v42 priority:100];

    v43 = +[STUIStatusBarBatteryItem iconDisplayIdentifier];
    v64 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v43 priority:50];

    v44 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v58 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v44 priority:90];

    v45 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v57 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v45 priority:85];

    v46 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v61 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v46 priority:155];

    v47 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v48 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v47 priority:150];

    v86 = v80;
    v87[0] = @"time";
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
    v88[0] = v62;
    v87[1] = @"pill";
    v85 = v79;
    v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
    v88[1] = v60;
    v87[2] = @"pillContent";
    v84[0] = v77;
    v84[1] = v74;
    v84[2] = v78;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
    v88[2] = v49;
    v87[3] = @"signal";
    v83[0] = v72;
    v83[1] = v68;
    v83[2] = v29;
    v83[3] = v33;
    v83[4] = v70;
    v83[5] = v69;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:6];
    v88[3] = v50;
    v87[4] = @"top";
    v82[0] = v58;
    v82[1] = v59;
    v82[2] = v66;
    v82[3] = v76;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:4];
    v88[4] = v51;
    v87[5] = @"bottom";
    v81[0] = v48;
    v81[1] = v57;
    v81[2] = v64;
    v81[3] = v65;
    v81[4] = v61;
    v81[5] = v75;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:6];
    v88[5] = v52;
    uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:6];
    v54 = v73->_orderedDisplayItemPlacements;
    v73->_orderedDisplayItemPlacements = (NSDictionary *)v53;

    id v4 = v67;
    orderedDisplayItemPlacements = v73->_orderedDisplayItemPlacements;
  }
  v55 = -[NSDictionary objectForKeyedSubscript:](orderedDisplayItemPlacements, "objectForKeyedSubscript:", v4, v57);

  return v55;
}

- (NSDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end