@interface STUIStatusBarDisplayItemPlacementIndicatorsGroup
+ (STUIStatusBarIdentifier)activityItemDisplayIdentifier;
+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 bluetoothPaddingInset:(double)a5;
- (NSArray)stablePlacements;
- (NSArray)unstablePlacements;
- (STUIStatusBarDisplayItemPlacement)bluetoothInsetPaddingItem;
@end

@implementation STUIStatusBarDisplayItemPlacementIndicatorsGroup

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 bluetoothPaddingInset:(double)a5
{
  v54[1] = *MEMORY[0x1E4F143B8];
  int64_t v6 = a3 - a4;
  v7 = +[STUIStatusBarItem defaultDisplayIdentifier];
  uint64_t v8 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v7 priority:3];

  v9 = +[STUIStatusBarBluetoothItem batteryDisplayIdentifier];
  v10 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v9 priority:2];
  v54[0] = v8;
  v50 = (void *)v8;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  v49 = [v10 requiringAllPlacements:v11];

  v12 = +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", 1, -a5, 0.0);
  v53[0] = v8;
  v53[1] = v49;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  uint64_t v48 = [v12 requiringAllPlacements:v13];

  v45 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v44 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v45 priority:v6 + 3];
  v52[0] = v44;
  v43 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v42 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v43 priority:v6 + 1];
  v52[1] = v42;
  v41 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v40 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v41 priority:7];
  v52[2] = v40;
  v39 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v38 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v39 priority:8];
  v52[3] = v38;
  v37 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v36 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v37 priority:6];
  v52[4] = v36;
  v35 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v14 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v35 priority:v6 + 2];
  v52[5] = v14;
  v15 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v16 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v15 priority:5];
  v52[6] = v16;
  v17 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v18 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v17 priority:9];
  v52[7] = v18;
  v19 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v20 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v19 priority:4];
  v52[8] = v20;
  v21 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v22 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v21 priority:10];
  v52[9] = v22;
  v52[10] = v50;
  v52[11] = v48;
  v52[12] = v49;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:13];

  v24 = [(id)objc_opt_class() activityItemDisplayIdentifier];
  v25 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v24 priority:11];
  v51 = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];

  v27 = [v26 arrayByAddingObjectsFromArray:v23];
  v28 = [a1 groupWithPriority:a4 placements:v27];
  v29 = (void *)v28[4];
  v28[4] = v23;
  id v30 = v23;

  v31 = (void *)v28[5];
  v28[5] = v26;
  id v32 = v26;

  v33 = (void *)v28[6];
  v28[6] = v48;

  return v28;
}

+ (STUIStatusBarIdentifier)activityItemDisplayIdentifier
{
  return +[STUIStatusBarItem defaultDisplayIdentifier];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothInsetPaddingItem, 0);
  objc_storeStrong((id *)&self->_unstablePlacements, 0);
  objc_storeStrong((id *)&self->_stablePlacements, 0);
}

- (NSArray)stablePlacements
{
  return self->_stablePlacements;
}

- (NSArray)unstablePlacements
{
  return self->_unstablePlacements;
}

- (STUIStatusBarDisplayItemPlacement)bluetoothInsetPaddingItem
{
  return self->_bluetoothInsetPaddingItem;
}

@end