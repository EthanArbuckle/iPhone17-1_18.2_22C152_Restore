@interface STUIStatusBarVisualProvider_CarPlayDualDriver
+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3;
- (NSDictionary)orderedDisplayItemPlacements;
- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3;
- (id)setupInContainerView:(id)a3;
- (void)itemCreated:(id)a3;
- (void)setOrderedDisplayItemPlacements:(id)a3;
@end

@implementation STUIStatusBarVisualProvider_CarPlayDualDriver

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
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v4;
    [v3 setItemSpacing:3.0];
    [v3 setAdditionRemovalScale:0.25];
    [v3 setAdditionRemovalDuration:0.25];
  }
}

- (id)setupInContainerView:(id)a3
{
  v122[4] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v114 = a3;
  v5 = [v4 array];
  v6 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"time"];
  v7 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v8 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  v120 = v7;
  [(STUIStatusBarRegionAxesLayout *)v7 setHorizontalLayout:v8];

  v9 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v7 setVerticalLayout:v9];

  [(STUIStatusBarRegion *)v6 setLayout:v7];
  [(STUIStatusBarVisualProvider_CarPlay *)self setTimeRegion:v6];
  v10 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"pill"];
  v11 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v12 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  v119 = v11;
  [(STUIStatusBarRegionAxesLayout *)v11 setHorizontalLayout:v12];

  v13 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v11 setVerticalLayout:v13];

  [(STUIStatusBarRegion *)v10 setLayout:v11];
  v121 = v10;
  -[STUIStatusBarRegion setActionInsets:](v10, "setActionInsets:", 0.0, -3.0, -13.0, -3.0);
  v14 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
  [v14 setPillRegion:v10];

  v15 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"pillContent"];
  v16 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
  v17 = [v16 pillRegion];
  [(STUIStatusBarRegion *)v15 setEnabilityRegion:v17];

  v18 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v19 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  v118 = v18;
  [(STUIStatusBarRegionAxesLayout *)v18 setHorizontalLayout:v19];

  v20 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v18 setVerticalLayout:v20];

  [(STUIStatusBarRegion *)v15 setLayout:v18];
  v21 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"bottom"];
  v22 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v23 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:1];
  v117 = v22;
  [(STUIStatusBarRegionAxesLayout *)v22 setHorizontalLayout:v23];

  v24 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v24 setAlignment:1];
  [(STUIStatusBarRegionAxesLayout *)v22 setVerticalLayout:v24];

  v116 = v21;
  [(STUIStatusBarRegion *)v21 setLayout:v22];
  -[STUIStatusBarRegion setActionInsets:](v21, "setActionInsets:", 0.0, -3.0, -10.0, -10.0);
  [(STUIStatusBarVisualProvider_CarPlay *)self setRadarRegion:v21];
  id v25 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [v114 addLayoutGuide:v25];
  v26 = [v25 heightAnchor];
  v27 = [v26 constraintEqualToConstant:103.0];
  [v5 addObject:v27];

  v28 = [v25 leadingAnchor];
  v29 = [v114 leadingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v5 addObject:v30];

  v115 = v25;
  v31 = [v25 trailingAnchor];
  v32 = [v114 trailingAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  [v5 addObject:v33];

  v34 = [v25 centerYAnchor];
  v35 = [v114 centerYAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v5 addObject:v36];

  v37 = [(STUIStatusBarRegion *)v6 layoutItem];
  v38 = [v37 topAnchor];
  v39 = [v114 topAnchor];
  v40 = [v38 constraintEqualToAnchor:v39 constant:7.0];
  [v5 addObject:v40];

  v41 = [(STUIStatusBarRegion *)v6 layoutItem];
  v42 = [v41 heightAnchor];
  v43 = [v42 constraintEqualToConstant:18.0];
  [v5 addObject:v43];

  v44 = [(STUIStatusBarRegion *)v6 layoutItem];
  v45 = [v44 widthAnchor];
  v46 = [v45 constraintEqualToConstant:39.0];
  [v5 addObject:v46];

  v47 = [(STUIStatusBarRegion *)v6 layoutItem];
  v48 = [v47 centerXAnchor];
  v49 = [v114 centerXAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  [v5 addObject:v50];

  v51 = [(STUIStatusBarRegion *)v6 layoutItem];
  objc_msgSend(v114, "_ui_addSubLayoutItem:", v51);

  v52 = [(STUIStatusBarRegion *)v121 layoutItem];
  v53 = [v52 topAnchor];
  v54 = [(STUIStatusBarRegion *)v6 layoutItem];
  v55 = [v54 topAnchor];
  v56 = [v53 constraintEqualToAnchor:v55];
  [v5 addObject:v56];

  v57 = [(STUIStatusBarRegion *)v121 layoutItem];
  v58 = [v57 bottomAnchor];
  v59 = [(STUIStatusBarRegion *)v6 layoutItem];
  v60 = [v59 bottomAnchor];
  v61 = [v58 constraintEqualToAnchor:v60];
  [v5 addObject:v61];

  v62 = [(STUIStatusBarRegion *)v121 layoutItem];
  v63 = [v62 leadingAnchor];
  v64 = [(STUIStatusBarRegion *)v6 layoutItem];
  v65 = [v64 leadingAnchor];
  v66 = [v63 constraintEqualToAnchor:v65];
  [v5 addObject:v66];

  v67 = [(STUIStatusBarRegion *)v121 layoutItem];
  v68 = [v67 trailingAnchor];
  v69 = [(STUIStatusBarRegion *)v6 layoutItem];
  v70 = [v69 trailingAnchor];
  v71 = [v68 constraintEqualToAnchor:v70];
  [v5 addObject:v71];

  v72 = [(STUIStatusBarRegion *)v121 layoutItem];
  objc_msgSend(v114, "_ui_addSubLayoutItem:", v72);

  v73 = [(STUIStatusBarRegion *)v15 layoutItem];
  v74 = [v73 topAnchor];
  v75 = [(STUIStatusBarRegion *)v121 layoutItem];
  v76 = [v75 topAnchor];
  v77 = [v74 constraintEqualToAnchor:v76];
  [v5 addObject:v77];

  v78 = [(STUIStatusBarRegion *)v15 layoutItem];
  v79 = [v78 bottomAnchor];
  v80 = [(STUIStatusBarRegion *)v121 layoutItem];
  v81 = [v80 bottomAnchor];
  v82 = [v79 constraintEqualToAnchor:v81];
  [v5 addObject:v82];

  v83 = [(STUIStatusBarRegion *)v15 layoutItem];
  v84 = [v83 leadingAnchor];
  v85 = [(STUIStatusBarRegion *)v121 layoutItem];
  v86 = [v85 leadingAnchor];
  v87 = [v84 constraintEqualToAnchor:v86];
  [v5 addObject:v87];

  v88 = [(STUIStatusBarRegion *)v15 layoutItem];
  v89 = [v88 trailingAnchor];
  v90 = [(STUIStatusBarRegion *)v121 layoutItem];
  v91 = [v90 trailingAnchor];
  v92 = [v89 constraintEqualToAnchor:v91];
  [v5 addObject:v92];

  v93 = [(STUIStatusBarRegion *)v15 layoutItem];
  objc_msgSend(v114, "_ui_addSubLayoutItem:", v93);

  v94 = [(STUIStatusBarRegion *)v116 layoutItem];
  v95 = [v94 topAnchor];
  v96 = [v115 bottomAnchor];
  v97 = [v95 constraintEqualToAnchor:v96 constant:4.0];
  [v5 addObject:v97];

  v98 = [(STUIStatusBarRegion *)v116 layoutItem];
  v99 = [v98 bottomAnchor];
  v100 = [v114 safeAreaLayoutGuide];
  v101 = [v100 bottomAnchor];
  v102 = [v99 constraintEqualToAnchor:v101 constant:-34.0];
  [v5 addObject:v102];

  v103 = [(STUIStatusBarRegion *)v116 layoutItem];
  v104 = [v103 leadingAnchor];
  v105 = [v114 leadingAnchor];
  v106 = [v104 constraintEqualToAnchor:v105];
  [v5 addObject:v106];

  v107 = [(STUIStatusBarRegion *)v116 layoutItem];
  v108 = [v107 trailingAnchor];
  v109 = [v114 trailingAnchor];
  v110 = [v108 constraintEqualToAnchor:v109];
  [v5 addObject:v110];

  v111 = [(STUIStatusBarRegion *)v116 layoutItem];
  objc_msgSend(v114, "_ui_addSubLayoutItem:", v111);

  [MEMORY[0x1E4F28DC8] activateConstraints:v5];
  v122[0] = v15;
  v122[1] = v121;
  v122[2] = v6;
  v122[3] = v116;
  v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:4];

  return v112;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    id v34 = v4;
    v6 = +[STUIStatusBarTimeItem shortTimeDisplayIdentifier];
    uint64_t v7 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v6 priority:400];

    v8 = +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];
    v9 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v8 priority:500];
    v43[0] = v7;
    v31 = (void *)v7;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    v33 = [v9 excludingPlacements:v10];

    v11 = +[STUIStatusBarTimeItem pillTimeDisplayIdentifier];
    v32 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v11 priority:450];

    v12 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v13 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v12 priority:475];
    v42 = v32;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
    v15 = [v13 excludingPlacements:v14];

    v16 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
    [v16 setPillIconPlacement:v15];

    v17 = +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
    v18 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v17 priority:474];
    v41 = v15;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    v30 = [v18 requiringAllPlacements:v19];

    v20 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v21 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v20 priority:155];

    uint64_t v38 = v7;
    v39[0] = @"time";
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    v40[0] = v22;
    v39[1] = @"pill";
    v37 = v33;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    v40[1] = v23;
    v39[2] = @"pillContent";
    v36[0] = v15;
    v36[1] = v30;
    v36[2] = v32;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
    v40[2] = v24;
    v39[3] = @"bottom";
    v35 = v21;
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    v40[3] = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];
    v27 = self->_orderedDisplayItemPlacements;
    self->_orderedDisplayItemPlacements = v26;

    id v4 = v34;
    orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  }
  v28 = -[NSDictionary objectForKeyedSubscript:](orderedDisplayItemPlacements, "objectForKeyedSubscript:", v4, v30);

  return v28;
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