@interface PGAssetLocationResolver
+ (id)closestAddressNodeFromMomentNodes:(id)a3 toLocation:(id)a4 withMaximumDistance:(double)a5 allowRemoteLocations:(BOOL)a6;
+ (id)closestAssetLocationForAsset:(id)a3 inAssetCollection:(id)a4;
@end

@implementation PGAssetLocationResolver

+ (id)closestAddressNodeFromMomentNodes:(id)a3 toLocation:(id)a4 withMaximumDistance:(double)a5 allowRemoteLocations:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v10)
  {
    [v10 coordinate];
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    *(double *)&v33[3] = a5;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__28096;
    v31 = __Block_byref_object_dispose__28097;
    id v32 = 0;
    v16 = [PGGraphMomentNodeCollection alloc];
    v17 = [v9 anyObject];
    v18 = [v17 graph];
    v19 = [(MAElementCollection *)v16 initWithSet:v9 graph:v18];

    v20 = +[PGGraphEdgeCollection edgesFromNodes:v19];
    if (v6)
    {
      v21 = +[PGGraphRemoteAddressEdge filter];
      v22 = +[MAEdgeCollection edgesFromNodes:v19 matchingFilter:v21];

      uint64_t v23 = [v20 collectionByFormingUnionWith:v22];

      v20 = (void *)v23;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __113__PGAssetLocationResolver_closestAddressNodeFromMomentNodes_toLocation_withMaximumDistance_allowRemoteLocations___block_invoke;
    v26[3] = &unk_1E68E8038;
    v26[6] = v13;
    v26[7] = v15;
    v26[4] = v33;
    v26[5] = &v27;
    [v20 enumerateEdgesUsingBlock:v26];
    v24 = [(id)v28[5] targetNode];

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(v33, 8);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __113__PGAssetLocationResolver_closestAddressNodeFromMomentNodes_toLocation_withMaximumDistance_allowRemoteLocations___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 photoCoordinate];
  if (CLLocationCoordinate2DIsValid(v7))
  {
    CLLocationCoordinate2DGetDistanceFrom();
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v5 < *(double *)(v6 + 24))
    {
      *(double *)(v6 + 24) = v5;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
  }
}

+ (id)closestAssetLocationForAsset:(id)a3 inAssetCollection:(id)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  CLLocationCoordinate2D v7 = [v5 clsLocation];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
    goto LABEL_34;
  }
  id v10 = [v6 photoLibrary];
  v11 = [v10 librarySpecificFetchOptions];

  [v11 setIncludeGuestAssets:1];
  uint64_t v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v46[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  [v11 setSortDescriptors:v13];

  uint64_t v14 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:v11];
  uint64_t v15 = [v14 indexOfObject:v5];
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = v15;
    v40 = v11;
    id v41 = v6;
    v17 = [v5 creationDate];
    [v17 timeIntervalSinceReferenceDate];
    uint64_t v19 = v18;

    uint64_t v20 = [v14 count] - 1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PGAssetLocationResolver_closestAssetLocationForAsset_inAssetCollection___block_invoke;
    aBlock[3] = &unk_1E68E8010;
    v39 = v14;
    id v21 = v14;
    id v44 = v21;
    uint64_t v45 = v19;
    v22 = _Block_copy(aBlock);
    uint64_t v23 = v20;
    v24 = (double (**)(void, void))v22;
    BOOL v25 = v16 < v20;
    BOOL v26 = v16 > 0;
    uint64_t v27 = v16 + 1;
    uint64_t v28 = v16 - 1;
    uint64_t v42 = v23;
    if (v16 < 1)
    {
      if (v16 >= v23)
      {
        id v9 = 0;
LABEL_32:

        v8 = 0;
        id v6 = v41;
        uint64_t v14 = v39;
        v11 = v40;
        goto LABEL_33;
      }
      id v38 = v5;
      double v30 = 1.79769313e308;
    }
    else
    {
      id v38 = v5;
      uint64_t v29 = v23;
      double v30 = (*((double (**)(void *, uint64_t))v22 + 2))(v22, v16 - 1);
      if (v16 >= v29)
      {
        double v31 = 1.79769313e308;
LABEL_11:
        while (1)
        {
          BOOL v32 = v25 && v26 ? v30 < v31 : !v25;
          uint64_t v33 = v32 ? v28 : v27;
          v34 = objc_msgSend(v21, "objectAtIndexedSubscript:", v33, v38);
          uint64_t v35 = [v34 clsLocation];
          if (v35) {
            break;
          }
          if (v32)
          {
            if (v28-- < 1)
            {
              BOOL v26 = 0;
            }
            else
            {
              double v30 = v24[2](v24, v28);
              BOOL v26 = 1;
            }
          }
          else
          {
            if (v27 >= v42)
            {
              BOOL v25 = 0;
            }
            else
            {
              double v31 = v24[2](v24, v27 + 1);
              BOOL v25 = 1;
            }
            ++v27;
          }

          if (!v25 && !v26)
          {
            id v9 = 0;
            goto LABEL_31;
          }
        }
        id v9 = (id)v35;

LABEL_31:
        id v5 = v38;
        goto LABEL_32;
      }
    }
    double v31 = v24[2](v24, v16 + 1);
    goto LABEL_11;
  }
  id v9 = 0;
LABEL_33:

LABEL_34:
  return v9;
}

double __74__PGAssetLocationResolver_closestAssetLocationForAsset_inAssetCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v4 = [v3 creationDate];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;

  double v7 = vabdd_f64(*(double *)(a1 + 40), v6);
  return v7;
}

@end