@interface GEOLPRRestrictionRegion(MNExtras)
- (id)plateTypeIndexesMatchingVehicle:()MNExtras error:;
@end

@implementation GEOLPRRestrictionRegion(MNExtras)

- (id)plateTypeIndexesMatchingVehicle:()MNExtras error:
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v8 = [a1 definedPlateTypes];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__GEOLPRRestrictionRegion_MNExtras__plateTypeIndexesMatchingVehicle_error___block_invoke;
  v14[3] = &unk_1E60F75B8;
  id v9 = v6;
  id v15 = v9;
  v17 = &v18;
  id v10 = v7;
  id v16 = v10;
  [v8 enumerateObjectsUsingBlock:v14];

  v11 = (void *)v19[5];
  if (v11)
  {
    id v12 = 0;
    if (a4) {
      *a4 = v11;
    }
  }
  else
  {
    id v12 = v10;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

@end