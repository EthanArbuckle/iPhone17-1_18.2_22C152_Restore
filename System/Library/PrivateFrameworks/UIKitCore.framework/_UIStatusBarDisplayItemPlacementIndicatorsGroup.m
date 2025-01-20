@interface _UIStatusBarDisplayItemPlacementIndicatorsGroup
+ (_UIStatusBarIdentifier)activityItemDisplayIdentifier;
+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 bluetoothPaddingInset:(double)a5;
- (NSArray)stablePlacements;
- (NSArray)unstablePlacements;
- (_UIStatusBarDisplayItemPlacement)bluetoothInsetPaddingItem;
@end

@implementation _UIStatusBarDisplayItemPlacementIndicatorsGroup

+ (_UIStatusBarIdentifier)activityItemDisplayIdentifier
{
  return +[_UIStatusBarItem defaultDisplayIdentifier];
}

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 bluetoothPaddingInset:(double)a5
{
  v57[1] = *MEMORY[0x1E4F143B8];
  int64_t v7 = a3 - a4;
  if (a3 <= a4)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:a1 file:@"_UIStatusBarDisplayItemPlacementIndicatorsGroup.m" lineNumber:31 description:@"The lowPriority should be smaller than the highPriority"];
  }
  id v49 = a1;
  v8 = +[_UIStatusBarItem defaultDisplayIdentifier];
  uint64_t v9 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v8 priority:3];

  v10 = +[_UIStatusBarBluetoothItem batteryDisplayIdentifier];
  v11 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v10 priority:2];
  v57[0] = v9;
  v53 = (void *)v9;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
  v52 = [v11 requiringAllPlacements:v12];

  v13 = +[_UIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](_UIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", 1, -a5, 0.0);
  v56[0] = v9;
  v56[1] = v52;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  uint64_t v51 = [v13 requiringAllPlacements:v14];

  v48 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v47 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v48 priority:v7 + 3];
  v55[0] = v47;
  v46 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v45 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v46 priority:v7 + 1];
  v55[1] = v45;
  v44 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v43 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v44 priority:7];
  v55[2] = v43;
  v42 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v41 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v42 priority:8];
  v55[3] = v41;
  v40 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v39 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v40 priority:6];
  v55[4] = v39;
  v38 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v15 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v38 priority:v7 + 2];
  v55[5] = v15;
  v16 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v17 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v16 priority:5];
  v55[6] = v17;
  v18 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v19 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v18 priority:9];
  v55[7] = v19;
  v20 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v21 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v20 priority:4];
  v55[8] = v21;
  v22 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v23 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v22 priority:10];
  v55[9] = v23;
  v55[10] = v53;
  v55[11] = v51;
  v55[12] = v52;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:13];

  v25 = [(id)objc_opt_class() activityItemDisplayIdentifier];
  v26 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v25 priority:11];
  v54 = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];

  v28 = [v27 arrayByAddingObjectsFromArray:v24];
  v29 = [v49 groupWithPriority:a4 placements:v28];
  v30 = (void *)v29[4];
  v29[4] = v24;
  id v31 = v24;

  v32 = (void *)v29[5];
  v29[5] = v27;
  id v33 = v27;

  v34 = (void *)v29[6];
  v29[6] = v51;

  return v29;
}

- (NSArray)stablePlacements
{
  return self->_stablePlacements;
}

- (NSArray)unstablePlacements
{
  return self->_unstablePlacements;
}

- (_UIStatusBarDisplayItemPlacement)bluetoothInsetPaddingItem
{
  return self->_bluetoothInsetPaddingItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothInsetPaddingItem, 0);
  objc_storeStrong((id *)&self->_unstablePlacements, 0);
  objc_storeStrong((id *)&self->_stablePlacements, 0);
}

@end