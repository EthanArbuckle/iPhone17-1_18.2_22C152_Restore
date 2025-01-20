@interface STUIStatusBarVisualProvider_CarPlayDualPassenger
+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3;
- (NSDictionary)orderedDisplayItemPlacements;
- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3;
- (id)setupInContainerView:(id)a3;
- (void)itemCreated:(id)a3;
- (void)setOrderedDisplayItemPlacements:(id)a3;
@end

@implementation STUIStatusBarVisualProvider_CarPlayDualPassenger

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
  v92[4] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v6 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"signal"];
  v90 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v91 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  [(STUIStatusBarRegionAxisCenteringLayout *)v91 setInterspace:3.0];
  [(STUIStatusBarRegionAxesLayout *)v90 setHorizontalLayout:v91];
  v7 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:5];
  [(STUIStatusBarRegionAxesLayout *)v90 setVerticalLayout:v7];

  [(STUIStatusBarRegion *)v6 setLayout:v90];
  v8 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"etc"];
  v9 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v10 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:1];
  v89 = v9;
  [(STUIStatusBarRegionAxesLayout *)v9 setHorizontalLayout:v10];

  v11 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:3];
  [(STUIStatusBarRegionAxesLayout *)v9 setVerticalLayout:v11];

  [(STUIStatusBarRegion *)v8 setLayout:v9];
  v86 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"bottom"];
  v12 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v13 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:1];
  v88 = v12;
  [(STUIStatusBarRegionAxesLayout *)v12 setHorizontalLayout:v13];

  v14 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v14 setAlignment:4];
  [(STUIStatusBarRegionAxisStackingLayout *)v14 setInterspace:8.0];
  [(STUIStatusBarRegionAxesLayout *)v12 setVerticalLayout:v14];

  [(STUIStatusBarRegion *)v86 setLayout:v12];
  v15 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"battery"];
  v16 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v17 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:1];
  v87 = v16;
  [(STUIStatusBarRegionAxesLayout *)v16 setHorizontalLayout:v17];

  v18 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:4];
  [(STUIStatusBarRegionAxesLayout *)v16 setVerticalLayout:v18];

  [(STUIStatusBarRegion *)v15 setLayout:v16];
  v19 = [(STUIStatusBarRegion *)v6 layoutItem];
  v20 = [v19 topAnchor];
  v21 = [v4 topAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:7.0];
  [v5 addObject:v22];

  v23 = [(STUIStatusBarRegion *)v6 layoutItem];
  v24 = [v23 heightAnchor];
  v25 = [v24 constraintEqualToConstant:14.0];
  [v5 addObject:v25];

  v26 = [(STUIStatusBarRegion *)v6 layoutItem];
  v27 = [v26 leadingAnchor];
  v28 = [v4 leadingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v5 addObject:v29];

  v30 = [(STUIStatusBarRegion *)v6 layoutItem];
  v31 = [v30 trailingAnchor];
  v32 = [v4 trailingAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  [v5 addObject:v33];

  v34 = [(STUIStatusBarRegion *)v6 layoutItem];
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v34);

  v35 = [(STUIStatusBarRegion *)v8 layoutItem];
  v36 = [v35 topAnchor];
  v37 = [(STUIStatusBarRegion *)v6 layoutItem];
  v38 = [v37 bottomAnchor];
  v39 = [v36 constraintEqualToAnchor:v38 constant:47.0];
  [v5 addObject:v39];

  v40 = [(STUIStatusBarRegion *)v8 layoutItem];
  v41 = [v40 leadingAnchor];
  v42 = [v4 leadingAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  [v5 addObject:v43];

  v44 = [(STUIStatusBarRegion *)v8 layoutItem];
  v45 = [v44 trailingAnchor];
  v46 = [v4 trailingAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];
  [v5 addObject:v47];

  v48 = [(STUIStatusBarRegion *)v8 layoutItem];
  v49 = [v48 heightAnchor];
  v50 = [v49 constraintEqualToConstant:20.0];
  [v5 addObject:v50];

  v51 = [(STUIStatusBarRegion *)v8 layoutItem];
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v51);

  v52 = [(STUIStatusBarRegion *)v86 layoutItem];
  v53 = [v52 topAnchor];
  v54 = [(STUIStatusBarRegion *)v8 layoutItem];
  v55 = [v54 bottomAnchor];
  v56 = [v53 constraintEqualToAnchor:v55];
  [v5 addObject:v56];

  v57 = [(STUIStatusBarRegion *)v86 layoutItem];
  v58 = [v57 bottomAnchor];
  v59 = [(STUIStatusBarRegion *)v15 layoutItem];
  v60 = [v59 lastBaselineAnchor];
  v61 = [v58 constraintEqualToAnchor:v60 constant:-22.0];
  [v5 addObject:v61];

  v62 = [(STUIStatusBarRegion *)v86 layoutItem];
  v63 = [v62 leadingAnchor];
  v64 = [v4 leadingAnchor];
  v65 = [v63 constraintEqualToAnchor:v64];
  [v5 addObject:v65];

  v66 = [(STUIStatusBarRegion *)v86 layoutItem];
  v67 = [v66 trailingAnchor];
  v68 = [v4 trailingAnchor];
  v69 = [v67 constraintEqualToAnchor:v68];
  [v5 addObject:v69];

  v70 = [(STUIStatusBarRegion *)v86 layoutItem];
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v70);

  v71 = [(STUIStatusBarRegion *)v15 layoutItem];
  v72 = [v71 bottomAnchor];
  v73 = [v4 bottomAnchor];
  v74 = [v72 constraintEqualToAnchor:v73 constant:-15.0];
  [v5 addObject:v74];

  v75 = [(STUIStatusBarRegion *)v15 layoutItem];
  v76 = [v75 leadingAnchor];
  v77 = [v4 leadingAnchor];
  v78 = [v76 constraintEqualToAnchor:v77];
  [v5 addObject:v78];

  v79 = [(STUIStatusBarRegion *)v15 layoutItem];
  v80 = [v79 trailingAnchor];
  v81 = [v4 trailingAnchor];
  v82 = [v80 constraintEqualToAnchor:v81];
  [v5 addObject:v82];

  v83 = [(STUIStatusBarRegion *)v15 layoutItem];
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v83);

  [MEMORY[0x1E4F28DC8] activateConstraints:v5];
  v92[0] = v6;
  v92[1] = v8;
  v92[2] = v86;
  v92[3] = v15;
  v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:4];

  return v84;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    id v43 = v4;
    v6 = +[STUIStatusBarCellularItem signalStrengthDisplayIdentifier];
    uint64_t v7 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v6 priority:350];

    v8 = +[STUIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier];
    v9 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v8 priority:375];
    v57[0] = v7;
    uint64_t v10 = v7;
    v47 = (void *)v7;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
    v44 = [v9 excludingPlacements:v11];

    v12 = +[STUIStatusBarCellularItem typeDisplayIdentifier];
    v13 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v12 priority:250];

    v14 = +[STUIStatusBarWifiItem signalStrengthDisplayIdentifier];
    v15 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v14 priority:300];
    v56 = v13;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
    uint64_t v17 = [v15 excludingPlacements:v16];

    v18 = +[STUIStatusBarWifiItem iconDisplayIdentifier];
    v19 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v18 priority:301];
    v55[0] = v17;
    v55[1] = v13;
    v46 = (void *)v17;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    v45 = [v19 excludingPlacements:v20];

    v21 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v22 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v21 priority:1200];
    v54[0] = v10;
    v54[1] = v44;
    v54[2] = v17;
    v54[3] = v45;
    v54[4] = v13;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:5];
    v42 = [v22 excludingPlacements:v23];

    v24 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v40 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v24 priority:150];

    v25 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v41 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v25 priority:600];

    v26 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v27 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v26 priority:85];

    v28 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v29 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v28 priority:84];

    v30 = +[STUIStatusBarBatteryItem iconDisplayIdentifier];
    v31 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v30 priority:50];

    v51[5] = v42;
    v52[0] = @"signal";
    v51[0] = v47;
    v51[1] = v44;
    v51[2] = v13;
    v51[3] = v17;
    v51[4] = v45;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:6];
    v53[0] = v32;
    v52[1] = @"etc";
    v50 = v40;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    v53[1] = v33;
    v52[2] = @"bottom";
    v49[0] = v41;
    v49[1] = v29;
    v49[2] = v27;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
    v53[2] = v34;
    v52[3] = @"battery";
    v48 = v31;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    v53[3] = v35;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:4];
    v37 = self->_orderedDisplayItemPlacements;
    self->_orderedDisplayItemPlacements = v36;

    id v4 = v43;
    orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  }
  v38 = [(NSDictionary *)orderedDisplayItemPlacements objectForKeyedSubscript:v4];

  return v38;
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