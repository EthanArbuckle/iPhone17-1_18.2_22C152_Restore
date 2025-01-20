@interface PGGraphLegacyLocationHelper
- (BOOL)_locationNodesRepresentSameCity:(id)a3;
- (BOOL)locationIsInSupersetCategoryForLocationNode:(id)a3;
- (CLLocationCoordinate2D)_approximateCoordinateForLocationNode:(id)a3;
- (id)_closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 remapMatchingDimensionBlock:(id)a5 reverse:(BOOL)a6;
- (id)_commonNodeForLocationNode:(id)a3 andLocationNode:(id)a4;
- (id)_mostVisitedLocationNodeForLocationNodes:(id)a3;
- (id)_validLocationNodeForLocationNode:(id)a3 withLocationMask:(unint64_t)a4;
- (id)cityNodeFromAddressNode:(id)a3;
- (id)closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 remapMatchingDimensionBlock:(id)a5;
- (id)closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 reverse:(BOOL)a5;
- (id)commonLocationNodeForRelevantLocationNodes:(id)a3 locationMask:(unint64_t)a4;
- (id)countryNodeFromAddressNode:(id)a3;
- (id)countyNodeFromCityNode:(id)a3;
- (id)densestCloseLocationNodeFromLocationNode:(id)a3 withDateInterval:(id)a4 locationMask:(unint64_t)a5;
- (id)districtNodeFromAddressNode:(id)a3;
- (id)locationNodeWithDimension:(unint64_t)a3 rootNode:(id)a4;
- (id)relevantAddressNodesForMomentNodes:(id)a3 applyDensestCloseLocationNode:(BOOL)a4;
- (id)relevantLocationNodesForMomentNodes:(id)a3 applyDensestCloseLocationNode:(BOOL)a4;
@end

@implementation PGGraphLegacyLocationHelper

- (id)countyNodeFromCityNode:(id)a3
{
  v3 = [a3 collection];
  v4 = [v3 countyNodes];

  return v4;
}

- (id)countryNodeFromAddressNode:(id)a3
{
  v3 = [a3 collection];
  v4 = [v3 countryNodes];

  return v4;
}

- (id)cityNodeFromAddressNode:(id)a3
{
  v3 = [a3 collection];
  v4 = [v3 cityNodes];

  return v4;
}

- (id)districtNodeFromAddressNode:(id)a3
{
  v3 = [a3 collection];
  v4 = [v3 districtNodes];

  return v4;
}

- (id)_validLocationNodeForLocationNode:(id)a3 withLocationMask:(unint64_t)a4
{
  id v5 = a3;
  if (([v5 locationMask] & a4) != 0)
  {
LABEL_7:
    id v5 = v5;
    v11 = v5;
    goto LABEL_8;
  }
  while (1)
  {
    uint64_t v6 = [v5 outEdgesCount];
    if (v6 == 1)
    {
      v8 = [v5 locationNodeCollection];
      v9 = [v8 parentLocationNodes];
      uint64_t v10 = [v9 anyNode];

      id v5 = (id)v10;
      goto LABEL_6;
    }
    if (!v6) {
      break;
    }
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__20853;
    v18 = __Block_byref_object_dispose__20854;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__PGGraphLegacyLocationHelper__validLocationNodeForLocationNode_withLocationMask___block_invoke;
    v13[3] = &unk_1E68E8C30;
    v13[4] = &v14;
    [v5 enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:v13];
    id v7 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    id v5 = v7;
LABEL_6:
    if (([v5 locationMask] & a4) != 0) {
      goto LABEL_7;
    }
  }
  v11 = 0;
LABEL_8:

  return v11;
}

void __82__PGGraphLegacyLocationHelper__validLocationNodeForLocationNode_withLocationMask___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([a2 domain] == 200)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (CLLocationCoordinate2D)_approximateCoordinateForLocationNode:(id)a3
{
  id v3 = a3;
  if ([v3 domain] != 200)
  {
    double v14 = *MEMORY[0x1E4F1E750];
    double v15 = *(double *)(MEMORY[0x1E4F1E750] + 8);
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v4 = [v3 locationMask];
  if (v3)
  {
    unint64_t v5 = v4;
    while (1)
    {
      uint64_t v6 = [v3 label];
      char v7 = [v6 isEqualToString:@"Address"];

      if (v7) {
        break;
      }
      if (v5 < 0x10)
      {
        v11 = [v3 locationNodeCollection];
        v12 = [v11 parentLocationNodes];
        uint64_t v13 = [v12 anyNode];

        id v3 = (id)v13;
        if (!v13) {
          goto LABEL_9;
        }
      }
      else
      {
        v27[0] = 0;
        v27[1] = v27;
        v27[2] = 0x2020000000;
        v27[3] = 0;
        uint64_t v21 = 0;
        v22 = &v21;
        uint64_t v23 = 0x3032000000;
        v24 = __Block_byref_object_copy__20853;
        v25 = __Block_byref_object_dispose__20854;
        id v26 = 0;
        id v8 = [v3 locationNodeCollection];
        v9 = [v8 childLocationNodes];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __69__PGGraphLegacyLocationHelper__approximateCoordinateForLocationNode___block_invoke;
        v20[3] = &unk_1E68E7230;
        v20[4] = v27;
        v20[5] = &v21;
        [v9 enumerateIdentifiersAsCollectionsWithBlock:v20];

        id v10 = (id)v22[5];
        v5 >>= 1;
        _Block_object_dispose(&v21, 8);

        _Block_object_dispose(v27, 8);
        id v3 = v10;
        if (!v10) {
          goto LABEL_9;
        }
      }
    }
    [v3 coordinate];
    double v14 = v16;
    double v15 = v17;
    goto LABEL_12;
  }
LABEL_9:
  double v14 = *MEMORY[0x1E4F1E750];
  double v15 = *(double *)(MEMORY[0x1E4F1E750] + 8);
LABEL_13:
  double v18 = v14;
  double v19 = v15;
  result.longitude = v19;
  result.latitude = v18;
  return result;
}

void __69__PGGraphLegacyLocationHelper__approximateCoordinateForLocationNode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  uint64_t v4 = [v11 addressNodes];
  unint64_t v5 = [v4 momentNodes];
  unint64_t v6 = [v5 count];

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6 > *(void *)(v7 + 24))
  {
    *(void *)(v7 + 24) = v6;
    uint64_t v8 = [v11 anyNode];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (id)_commonNodeForLocationNode:(id)a3 andLocationNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 == v6)
  {
    id v23 = v5;
  }
  else
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__20853;
    v37 = __Block_byref_object_dispose__20854;
    id v7 = v5;
    id v38 = v7;
    uint64_t v8 = [v7 label];
    int v9 = [v8 isEqualToString:@"Address"];

    if (v9)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __74__PGGraphLegacyLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke;
      v32[3] = &unk_1E68EB7E8;
      v32[4] = &v33;
      [v7 enumerateNeighborNodesThroughOutEdgesUsingBlock:v32];
    }
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__20853;
    v30 = __Block_byref_object_dispose__20854;
    id v10 = v6;
    id v31 = v10;
    id v11 = [v10 label];
    int v12 = [v11 isEqualToString:@"Address"];

    if (v12)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __74__PGGraphLegacyLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke_2;
      v25[3] = &unk_1E68EB7E8;
      v25[4] = &v26;
      [v10 enumerateNeighborNodesThroughOutEdgesUsingBlock:v25];
    }
    uint64_t v13 = (void *)v34[5];
    double v14 = (void *)v27[5];
    BOOL v15 = v13 == v14;
    if (v13 != v14 && v13 && v14)
    {
      do
      {
        unint64_t v16 = [v13 locationMask];
        if (v16 <= [(id)v27[5] locationMask])
        {
          double v17 = [(id)v34[5] locationNodeCollection];
          double v18 = [v17 parentLocationNodes];
          uint64_t v19 = [v18 anyNode];
          v20 = v34;
        }
        else
        {
          double v17 = [(id)v27[5] locationNodeCollection];
          double v18 = [v17 parentLocationNodes];
          uint64_t v19 = [v18 anyNode];
          v20 = v27;
        }
        uint64_t v21 = (void *)v20[5];
        v20[5] = v19;

        uint64_t v13 = (void *)v34[5];
        v22 = (void *)v27[5];
        BOOL v15 = v13 == v22;
      }
      while (v13 != v22 && v13 && v22);
    }
    if (v15) {
      id v23 = v13;
    }
    else {
      id v23 = 0;
    }
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v33, 8);
  }

  return v23;
}

void __74__PGGraphLegacyLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 domain] == 200)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __74__PGGraphLegacyLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 domain] == 200)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)_mostVisitedLocationNodeForLocationNodes:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 anyObject];
  if ((unint64_t)[v3 count] >= 2)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v21 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "locationNodeCollection", v21);
          int v12 = [v11 addressNodes];
          uint64_t v13 = [v12 momentNodes];
          unint64_t v14 = [v13 count];

          if (v14 <= v7)
          {
            if (v14 != v7) {
              continue;
            }
            unint64_t v16 = [v10 UUID];
            double v17 = [v4 UUID];
            uint64_t v18 = [v16 compare:v17];

            if (v18 != -1) {
              continue;
            }
          }
          id v15 = v10;

          uint64_t v4 = v15;
          unint64_t v7 = v14;
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v6);
    }

    id v3 = v21;
  }
  id v19 = v4;

  return v19;
}

- (BOOL)_locationNodesRepresentSameCity:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 anyObject];
  uint64_t v6 = [v5 name];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v13 = [v12 name];
        if (![v13 isEqualToString:v6])
        {
          LOBYTE(v15) = 0;
          id v22 = v7;
          goto LABEL_33;
        }
        unint64_t v14 = [v12 label];
        int v15 = [v14 isEqualToString:@"City"];

        if (!v15)
        {
          id v22 = v7;
          goto LABEL_34;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  unint64_t v16 = (void *)[v7 mutableCopy];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v7;
  uint64_t v17 = [v13 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v37;
    while (2)
    {
      uint64_t v20 = 0;
      uint64_t v30 = v18;
      do
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = *(void *)(*((void *)&v36 + 1) + 8 * v20);
        v35.latitude = 0.0;
        v35.longitude = 0.0;
        [(PGGraphLegacyLocationHelper *)self _approximateCoordinateForLocationNode:v21];
        CLLocationCoordinate2D v35 = v48;
        if (!CLLocationCoordinate2DIsValid(v48))
        {
          LOBYTE(v15) = 0;
          goto LABEL_32;
        }
        [v16 removeObject:v21];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v22 = v16;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v44 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v32;
          uint64_t v29 = v19;
          while (2)
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v32 != v25) {
                objc_enumerationMutation(v22);
              }
              -[PGGraphLegacyLocationHelper _approximateCoordinateForLocationNode:](self, "_approximateCoordinateForLocationNode:", *(void *)(*((void *)&v31 + 1) + 8 * j), v29);
              if (CLLocationCoordinate2DIsValid(v49))
              {
                CLLocationCoordinate2DGetDistanceFrom();
                if (v27 <= 50000.0) {
                  continue;
                }
              }

              LOBYTE(v15) = 0;
              goto LABEL_33;
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v44 count:16];
            uint64_t v19 = v29;
            if (v24) {
              continue;
            }
            break;
          }
        }

        ++v20;
      }
      while (v20 != v30);
      uint64_t v18 = [v13 countByEnumeratingWithState:&v36 objects:v45 count:16];
      LOBYTE(v15) = 1;
      if (v18) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v15) = 1;
LABEL_32:
    id v22 = v16;
  }
LABEL_33:

LABEL_34:
  return v15;
}

- (id)commonLocationNodeForRelevantLocationNodes:(id)a3 locationMask:(unint64_t)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((unint64_t)[v6 count] <= 1)
  {
    id v7 = [v6 anyObject];
    goto LABEL_32;
  }
  if (![(PGGraphLegacyLocationHelper *)self _locationNodesRepresentSameCity:v6])
  {
    uint64_t v9 = [v6 anyObject];
    uint64_t v8 = [v9 graph];

    if ((unint64_t)[v6 count] >= 3)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        id v13 = 0;
        uint64_t v14 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v32 != v14) {
              objc_enumerationMutation(v10);
            }
            unint64_t v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (v13)
            {
              uint64_t v17 = -[PGGraphLegacyLocationHelper _commonNodeForLocationNode:andLocationNode:](self, "_commonNodeForLocationNode:andLocationNode:", v13, v16, (void)v31);

              id v13 = (id)v17;
              if (!v17) {
                goto LABEL_25;
              }
            }
            else
            {
              id v13 = v16;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v12);

        if (v13)
        {
          uint64_t v18 = [v13 label];
          if (([v18 isEqualToString:@"Country"] & 1) == 0)
          {

LABEL_38:
            id v7 = -[PGGraphLegacyLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v13, a4, (void)v31);
            goto LABEL_36;
          }
          uint64_t v19 = [v8 supersetCountryNodes];
          int v20 = [v19 containsNode:v13];

          if (!v20) {
            goto LABEL_38;
          }
        }
      }
      else
      {
LABEL_25:

        id v13 = 0;
      }
      goto LABEL_29;
    }
    if ([v6 count] != 2)
    {
LABEL_30:
      id v7 = 0;
      goto LABEL_31;
    }
    id v13 = [v6 allObjects];
    uint64_t v21 = [v13 firstObject];
    id v22 = [v13 lastObject];
    uint64_t v23 = [(PGGraphLegacyLocationHelper *)self _commonNodeForLocationNode:v21 andLocationNode:v22];

    uint64_t v24 = [v23 label];
    LODWORD(v22) = [v24 isEqualToString:@"State"];

    if (v22)
    {
      id v25 = v23;
      if (!v25) {
        goto LABEL_28;
      }
    }
    else
    {
      long long v26 = [v23 locationNodeCollection];
      double v27 = [v26 nearestDeepParentLocationNodesWithLabel:@"State"];
      id v25 = [v27 anyNode];

      if (!v25)
      {
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
    }
    uint64_t v28 = [v8 supersetStateNodes];
    int v29 = [v28 containsNode:v25];

    if (!v29)
    {
      id v7 = [(PGGraphLegacyLocationHelper *)self _validLocationNodeForLocationNode:v23 withLocationMask:a4];

LABEL_36:
      goto LABEL_31;
    }
    goto LABEL_28;
  }
  uint64_t v8 = [(PGGraphLegacyLocationHelper *)self _mostVisitedLocationNodeForLocationNodes:v6];
  id v7 = [(PGGraphLegacyLocationHelper *)self _validLocationNodeForLocationNode:v8 withLocationMask:a4];
LABEL_31:

LABEL_32:
  return v7;
}

- (id)densestCloseLocationNodeFromLocationNode:(id)a3 withDateInterval:(id)a4 locationMask:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 label];
  int v11 = [v10 isEqualToString:@"Address"];

  if (!v11)
  {
LABEL_4:
    int v15 = [v8 locationNodeCollection];
    unint64_t v16 = [v15 parentLocationNodes];
    uint64_t v17 = [v16 anyNode];

    if (!v17)
    {
      id v24 = v8;
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v18 = [v17 locationNodeCollection];
    uint64_t v19 = [v18 parentLocationNodes];
    int v20 = [v19 anyNode];

    if (v20)
    {
      [(PGGraphLegacyLocationHelper *)self _approximateCoordinateForLocationNode:v8];
      CLLocationDegrees latitude = v119.latitude;
      CLLocationDegrees longitude = v119.longitude;
      BOOL v23 = CLLocationCoordinate2DIsValid(v119);
      id v24 = v8;
      if (v23)
      {
        v56 = v20;
        id v25 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v26 = [MEMORY[0x1E4F1CA60] dictionary];
        v117[0] = 0;
        v117[1] = v117;
        v117[2] = 0x2020000000;
        v117[3] = 0;
        v116[0] = 0;
        v116[1] = v116;
        v116[2] = 0x2020000000;
        v116[3] = 0;
        v115[0] = 0;
        v115[1] = v115;
        v115[2] = 0x2020000000;
        v115[3] = 0;
        v114[0] = 0;
        v114[1] = v114;
        v114[2] = 0x2020000000;
        v114[3] = 0;
        v113[0] = 0;
        v113[1] = v113;
        v113[2] = 0x2020000000;
        v113[3] = 0;
        v101[0] = MEMORY[0x1E4F143A8];
        v101[1] = 3221225472;
        v101[2] = __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke;
        v101[3] = &unk_1E68E8B90;
        v101[4] = self;
        CLLocationDegrees v111 = latitude;
        CLLocationDegrees v112 = longitude;
        id v55 = v9;
        id v102 = v9;
        id v27 = v25;
        id v103 = v27;
        id v28 = v26;
        id v104 = v28;
        v106 = v116;
        v107 = v115;
        id v105 = v17;
        v108 = v117;
        v109 = v114;
        v110 = v113;
        [v20 enumerateNeighborNodesThroughInEdgesUsingBlock:v101];
        uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "identifier"));
        uint64_t v30 = [v27 objectForKeyedSubscript:v29];
        [v30 doubleValue];
        double v32 = v31;
        long long v33 = [v28 objectForKeyedSubscript:v29];
        [v33 doubleValue];
        double v35 = v34;
        v54 = (void *)v29;

        uint64_t v97 = 0;
        v98 = &v97;
        uint64_t v99 = 0x2020000000;
        uint64_t v100 = 0;
        uint64_t v93 = 0;
        v94 = (double *)&v93;
        uint64_t v95 = 0x2020000000;
        uint64_t v96 = 0;
        uint64_t v89 = 0;
        v90 = (double *)&v89;
        uint64_t v91 = 0x2020000000;
        uint64_t v92 = 0;
        uint64_t v36 = [v24 graph];
        uint64_t v83 = 0;
        v84 = &v83;
        uint64_t v85 = 0x3032000000;
        v86 = __Block_byref_object_copy__20853;
        v87 = __Block_byref_object_dispose__20854;
        id v37 = v24;
        id v88 = v37;
        uint64_t v79 = 0;
        v80 = (double *)&v79;
        uint64_t v81 = 0x2020000000;
        double v82 = v35 * 0.4 + v32 * 0.6;
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_240;
        v71[3] = &unk_1E68E8BB8;
        id v38 = v28;
        id v72 = v38;
        v74 = &v97;
        v75 = &v93;
        v76 = &v89;
        v77 = &v79;
        id v39 = v36;
        id v73 = v39;
        v78 = &v83;
        [v27 enumerateKeysAndObjectsUsingBlock:v71];
        id v51 = v39;
        unint64_t v40 = v98[3];
        double v41 = 0.0;
        if (v40 >= 2) {
          double v41 = v90[3] / (double)(v40 - 1);
        }
        v90[3] = v41;
        uint64_t v67 = 0;
        v68 = &v67;
        uint64_t v69 = 0x2020000000;
        uint64_t v70 = 0;
        uint64_t v63 = 0;
        v64 = &v63;
        uint64_t v65 = 0x2020000000;
        uint64_t v66 = 0;
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_2_242;
        v57[3] = &unk_1E68E8BE0;
        double v42 = sqrt(v41);
        id v53 = v38;
        id v58 = v53;
        v59 = &v93;
        double v62 = v42;
        v60 = &v63;
        v61 = &v67;
        [v27 enumerateKeysAndObjectsUsingBlock:v57];
        if ((unint64_t)v68[3] <= 1 && (unint64_t)v64[3] < 3)
        {
          if (v80[3] - v94[3] < v42 + v42)
          {
            id v46 = v37;
            goto LABEL_13;
          }
          id v46 = (id)v84[5];
          v45 = v37;
        }
        else
        {
          long long v43 = objc_msgSend((id)v84[5], "locationNodeCollection", v39);
          v44 = [v43 parentLocationNodes];
          v45 = [v44 anyNode];

          id v46 = [(PGGraphLegacyLocationHelper *)self _commonNodeForLocationNode:v37 andLocationNode:v45];
        }
LABEL_13:
        uint64_t v47 = -[PGGraphLegacyLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v46, a5, v51);
        CLLocationCoordinate2D v48 = (void *)v47;
        if (v47) {
          CLLocationCoordinate2D v49 = (void *)v47;
        }
        else {
          CLLocationCoordinate2D v49 = v37;
        }
        id v24 = v49;

        _Block_object_dispose(&v63, 8);
        _Block_object_dispose(&v67, 8);

        _Block_object_dispose(&v79, 8);
        _Block_object_dispose(&v83, 8);

        _Block_object_dispose(&v89, 8);
        _Block_object_dispose(&v93, 8);
        _Block_object_dispose(&v97, 8);

        _Block_object_dispose(v113, 8);
        _Block_object_dispose(v114, 8);
        _Block_object_dispose(v115, 8);
        _Block_object_dispose(v116, 8);
        _Block_object_dispose(v117, 8);

        id v9 = v55;
        int v20 = v56;
      }
    }
    else
    {
      id v24 = v8;
    }

    goto LABEL_20;
  }
  uint64_t v12 = [v8 locationNodeCollection];
  id v13 = [v12 parentLocationNodes];
  uint64_t v14 = [v13 anyNode];

  if (v14)
  {

    id v8 = (id)v14;
    goto LABEL_4;
  }
  id v24 = [(PGGraphLegacyLocationHelper *)self _validLocationNodeForLocationNode:v8 withLocationMask:a5];
LABEL_21:

  return v24;
}

void __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_2;
  v5[3] = &unk_1E68E8B68;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 112);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = &v12;
  long long v10 = *(_OWORD *)(a1 + 72);
  [v3 enumerateNeighborNodesThroughInEdgesUsingBlock:v5];
  if (*(id *)(a1 + 64) == v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) += v13[3];
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) += *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                             + 24);
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) += *(void *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                              + 24);
  }

  _Block_object_dispose(&v12, 8);
}

void __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_240(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  [a3 doubleValue];
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v19];
  [v7 doubleValue];
  double v9 = v8;

  long long v10 = v19;
  double v11 = v9 * 0.4 + v6 * 0.6;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  double v13 = *(double *)(v12 + 24);
  *(double *)(v12 + 24) = v13
                        + (v11 - v13) / (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 24)
                                                              + (v11 - v13)
                                                              * (v11
                                                               - *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                           + 24));
  if (v11 >= *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v14 = objc_msgSend(*(id *)(a1 + 40), "nodeForIdentifier:", objc_msgSend(v19, "unsignedIntValue"));
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    if (v11 == *(double *)(v15 + 24))
    {
      unint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) locationMask];
      if ([v14 locationMask] >= v16)
      {
LABEL_6:

        long long v10 = v19;
        goto LABEL_7;
      }
      uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    }
    *(double *)(v15 + 24) = v11;
    uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v14;
    uint64_t v14 = v18;
    goto LABEL_6;
  }
LABEL_7:
}

void __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_2_242(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  [a3 doubleValue];
  double v9 = v8;
  long long v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  [v10 doubleValue];
  double v12 = v11;

  double v13 = v12 * 0.4 + v9 * 0.6;
  double v14 = *(double *)(a1 + 64);
  if (v13 > *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + v14)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v13 > *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + v14 * 2.0) {
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) > 1uLL
      || *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 3uLL)
    {
      *a4 = 1;
    }
  }
}

void __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) _approximateCoordinateForLocationNode:v3];
  CLLocationCoordinate2D v42 = v45;
  if (CLLocationCoordinate2DIsValid(v45))
  {
    CLLocationCoordinate2DGetDistanceFrom();
    if (v4 <= 20000.0)
    {
      unint64_t v5 = 0x1E4F28000uLL;
      uint64_t v35 = a1;
      double v6 = NSNumber;
      uint64_t v7 = [v3 identifier];
      double v8 = v6;
      uint64_t v9 = a1;
      long long v10 = [v8 numberWithUnsignedInteger:v7];
      uint64_t v11 = [v3 inEdgesCount];
      uint64_t v12 = *(void *)(a1 + 40);
      double v13 = [v3 locationNodeCollection];
      id v14 = [v13 addressNodes];
      uint64_t v15 = [v14 momentNodes];
      unint64_t v16 = v15;
      if (v12)
      {
        uint64_t v17 = [v15 temporarySet];

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v14 = v17;
        uint64_t v18 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v32 = v11;
          long long v33 = v10;
          id v34 = v3;
          uint64_t v20 = 0;
          id obj = v14;
          uint64_t v37 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v39 != v37) {
                objc_enumerationMutation(obj);
              }
              id v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              id v23 = *(id *)(v9 + 40);
              id v24 = v22;
              id v25 = [v23 startDate];
              long long v26 = [v24 universalEndDate];
              if ([v25 compare:v26] == 1)
              {
                BOOL v27 = 0;
              }
              else
              {
                id v28 = [v23 endDate];
                uint64_t v29 = [v24 universalStartDate];
                BOOL v27 = [v28 compare:v29] != -1;

                uint64_t v9 = v35;
              }

              v20 += v27;
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
          }
          while (v19);
          id v14 = obj;
          double v13 = obj;
          long long v10 = v33;
          id v3 = v34;
          uint64_t v11 = v32;
          unint64_t v5 = 0x1E4F28000;
        }
        else
        {
          uint64_t v20 = 0;
          double v13 = v14;
        }
      }
      else
      {
        uint64_t v20 = [v15 count];
      }
      uint64_t v30 = [*(id *)(v5 + 3792) numberWithUnsignedInteger:v11];
      [*(id *)(v9 + 48) setObject:v30 forKeyedSubscript:v10];

      double v31 = [*(id *)(v5 + 3792) numberWithUnsignedInteger:v20];
      [*(id *)(v9 + 56) setObject:v31 forKeyedSubscript:v10];

      ++*(void *)(*(void *)(*(void *)(v9 + 64) + 8) + 24);
      *(void *)(*(void *)(*(void *)(v9 + 72) + 8) + 24) += v11;
      *(void *)(*(void *)(*(void *)(v9 + 80) + 8) + 24) += v20;
    }
  }
}

- (BOOL)locationIsInSupersetCategoryForLocationNode:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 label];
  unint64_t v6 = +[PGCommonTitleUtility dimensionForLabel:v5];

  uint64_t v7 = [v4 graph];
  double v8 = v7;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      uint64_t v9 = +[PGLogging sharedLogging];
      long long v10 = [v9 loggingConnection];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[PGGraphLegacyLocationHelper locationIsInSupersetCategoryForLocationNode:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v6;
        _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "%s called with unsupported dimension %lu", buf, 0x16u);
      }

      goto LABEL_5;
    case 6uLL:
      uint64_t v12 = [v7 supersetCityNodes];
      goto LABEL_10;
    case 7uLL:
      uint64_t v12 = [v7 supersetCountyNodes];
      goto LABEL_10;
    case 8uLL:
      uint64_t v12 = [v7 supersetStateNodes];
      goto LABEL_10;
    case 9uLL:
      uint64_t v12 = [v7 supersetCountryNodes];
LABEL_10:
      uint64_t v11 = (void *)v12;
      break;
    default:
LABEL_5:
      uint64_t v11 = 0;
      break;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v21 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__PGGraphLegacyLocationHelper_locationIsInSupersetCategoryForLocationNode___block_invoke;
  v16[3] = &unk_1E68E8B40;
  uint64_t v18 = buf;
  unint64_t v19 = v6;
  v16[4] = self;
  id v13 = v4;
  id v17 = v13;
  [v11 enumerateNodesUsingBlock:v16];
  BOOL v14 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v14;
}

void __75__PGGraphLegacyLocationHelper_locationIsInSupersetCategoryForLocationNode___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = [*(id *)(a1 + 32) closestLocationNodeFromLocationNode:a2 withDimension:*(void *)(a1 + 56) reverse:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 isSameNodeAsNode:*(void *)(a1 + 40)];
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (id)relevantAddressNodesForMomentNodes:(id)a3 applyDensestCloseLocationNode:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v47 = [MEMORY[0x1E4F1CA80] set];
  id v51 = [MEMORY[0x1E4F1CA80] set];
  v50 = [MEMORY[0x1E4F1CA80] set];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v67 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v12 = [v11 bestAddressNode];
        if (v12) {
          [v51 addObject:v12];
        }
        id v13 = [v11 collection];
        BOOL v14 = [v13 addressNodes];
        uint64_t v15 = [v14 temporarySet];
        [v50 unionSet:v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v8);
  }

  [(PGGraphLegacyLocationHelper *)self relevantLocationNodesForMomentNodes:obj applyDensestCloseLocationNode:v4];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v49 = [v45 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v63;
    *(void *)&long long v16 = 138412290;
    long long v44 = v16;
    do
    {
      for (uint64_t j = 0; j != v49; uint64_t j = v40 + 1)
      {
        if (*(void *)v63 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v52 = j;
        uint64_t v18 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v19 = v51;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v58 objects:v73 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v59;
          while (2)
          {
            for (uint64_t k = 0; k != v21; ++k)
            {
              if (*(void *)v59 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = *(void **)(*((void *)&v58 + 1) + 8 * k);
              id v25 = objc_msgSend(v24, "collection", v44);
              long long v26 = [v18 label];
              BOOL v27 = [v25 nearestDeepParentLocationNodesWithLabel:v26];
              id v28 = [v27 anyNode];

              if (v28 == v18)
              {
                [v47 addObject:v24];

                goto LABEL_36;
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v58 objects:v73 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v53 = v50;
        uint64_t v29 = [v53 countByEnumeratingWithState:&v54 objects:v72 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v55;
          while (2)
          {
            for (uint64_t m = 0; m != v30; ++m)
            {
              if (*(void *)v55 != v31) {
                objc_enumerationMutation(v53);
              }
              long long v33 = *(void **)(*((void *)&v54 + 1) + 8 * m);
              if ((objc_msgSend(v19, "containsObject:", v33, v44) & 1) == 0)
              {
                id v34 = [v33 collection];
                uint64_t v35 = [v18 label];
                uint64_t v36 = [v34 nearestDeepParentLocationNodesWithLabel:v35];
                uint64_t v37 = [v36 anyNode];

                if (v37 == v18)
                {
                  [v47 addObject:v33];

                  uint64_t v40 = v52;
                  id v19 = v53;
                  goto LABEL_41;
                }
              }
            }
            uint64_t v30 = [v53 countByEnumeratingWithState:&v54 objects:v72 count:16];
            if (v30) {
              continue;
            }
            break;
          }
        }

        long long v38 = [v18 locationNodeCollection];
        long long v39 = [v38 addressNodes];
        id v19 = [v39 anyNode];

        if (v19)
        {
          [v47 addObject:v19];
LABEL_36:
          uint64_t v40 = v52;
        }
        else
        {
          long long v41 = +[PGLogging sharedLogging];
          CLLocationCoordinate2D v42 = [v41 loggingConnection];

          uint64_t v40 = v52;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v44;
            v71 = v18;
            _os_log_error_impl(&dword_1D1805000, v42, OS_LOG_TYPE_ERROR, "No address node from location node: %@", buf, 0xCu);
          }

          id v19 = 0;
        }
LABEL_41:
      }
      uint64_t v49 = [v45 countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v49);
  }

  return v47;
}

- (id)relevantLocationNodesForMomentNodes:(id)a3 applyDensestCloseLocationNode:(BOOL)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 firstObject];
  uint64_t v8 = [v7 graph];

  if (v8)
  {
    uint64_t v9 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithArray:v6 graph:v8];
    long long v10 = [(PGGraphMomentNodeCollection *)v9 addressNodes];
    uint64_t v11 = [v10 temporarySet];

    if ([v11 count])
    {
      uint64_t v12 = [[PGIncompleteLocationResolver alloc] initWithAddressNodes:v11 locationHelper:self];
      id v13 = [[PGLocationsResolver alloc] initWithSortedMomentNodes:v6 incompleteLocationResolver:v12 locationHelper:self];
      BOOL v14 = [(PGLocationsResolver *)v13 resolvedMomentNodes];
      long long v38 = [(PGLocationsResolver *)v13 resolvedLocationNodes];
      uint64_t v37 = [[PGLocationsFilterer alloc] initWithSortedMomentNodes:v14 locationNodes:v38 incompleteLocationResolver:v12];
      uint64_t v15 = [(PGLocationsFilterer *)v37 filteredLocationNodes];
      if (a4)
      {
        uint64_t v30 = v14;
        uint64_t v31 = v13;
        uint64_t v32 = v12;
        long long v33 = v11;
        id v34 = v9;
        uint64_t v35 = v8;
        id v36 = v6;
        long long v16 = (void *)v15;
        id v17 = [MEMORY[0x1E4F1CA80] set];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v29 = v16;
        id v18 = v16;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v40 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v39 + 1) + 8 * i);
              id v24 = -[PGGraphLegacyLocationHelper densestCloseLocationNodeFromLocationNode:withDateInterval:locationMask:](self, "densestCloseLocationNodeFromLocationNode:withDateInterval:locationMask:", v23, 0, -1, v29);
              if (v24)
              {
                [v17 addObject:v24];
              }
              else
              {
                id v25 = +[PGLogging sharedLogging];
                long long v26 = [v25 loggingConnection];

                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v44 = v23;
                  _os_log_error_impl(&dword_1D1805000, v26, OS_LOG_TYPE_ERROR, "No densestLocationNode for locationNode %@", buf, 0xCu);
                }
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v45 count:16];
          }
          while (v20);
        }

        uint64_t v8 = v35;
        id v6 = v36;
        uint64_t v11 = v33;
        uint64_t v9 = v34;
        id v13 = v31;
        uint64_t v12 = v32;
        BOOL v27 = v29;
        BOOL v14 = v30;
      }
      else
      {
        BOOL v27 = (void *)v15;
        id v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
      }
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v17;
}

- (id)_closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 remapMatchingDimensionBlock:(id)a5 reverse:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (uint64_t (**)(void, void))v11;
  if (v11) {
    a4 = (*((uint64_t (**)(id, unint64_t))v11 + 2))(v11, a4);
  }
  id v13 = +[PGCommonTitleUtility locationLabelForDimension:a4];
  BOOL v14 = [v10 label];
  int v15 = [v13 isEqualToString:v14];

  if (v15) {
    id v16 = v10;
  }
  else {
    id v16 = 0;
  }
  if (v6) {
    unint64_t v17 = 4;
  }
  else {
    unint64_t v17 = 9;
  }
  if (!v16 && a4)
  {
    if (v6) {
      uint64_t v18 = -1;
    }
    else {
      uint64_t v18 = 1;
    }
    while (1)
    {
      if (v6) {
        BOOL v19 = a4 >= v17;
      }
      else {
        BOOL v19 = a4 <= v17;
      }
      if (!v19)
      {
LABEL_25:
        id v16 = 0;
        goto LABEL_27;
      }
      uint64_t v20 = [(PGGraphLegacyLocationHelper *)self locationNodeWithDimension:a4 rootNode:v10];
      if (v20) {
        break;
      }
      a4 += v18;
      if (v12)
      {
        BOOL v21 = a4 > v17;
        if (v6) {
          BOOL v21 = a4 < v17;
        }
        if (!v21) {
          a4 = v12[2](v12, a4);
        }
      }
      if (!a4) {
        goto LABEL_25;
      }
    }
    id v16 = (id)v20;
  }
LABEL_27:

  return v16;
}

- (id)locationNodeWithDimension:(unint64_t)a3 rootNode:(id)a4
{
  id v5 = a4;
  BOOL v6 = v5;
  if (a3 == 1)
  {
    uint64_t v7 = [v5 locationNodeCollection];
    uint64_t v8 = [v7 addressNodes];
    uint64_t v9 = [v8 areaNodes];
  }
  else
  {
    uint64_t v7 = +[PGCommonTitleUtility locationLabelForDimension:a3];
    if (!v7)
    {
      id v12 = 0;
      goto LABEL_9;
    }
    id v10 = [v6 label];
    int v11 = [v10 isEqualToString:v7];

    if (v11)
    {
      id v12 = v6;
      goto LABEL_9;
    }
    uint64_t v8 = [v6 locationNodeCollection];
    uint64_t v9 = [v8 nearestDeepParentLocationNodesWithLabel:v7];
  }
  id v13 = v9;
  id v12 = [v9 anyNode];

LABEL_9:
  return v12;
}

- (id)closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 reverse:(BOOL)a5
{
  return [(PGGraphLegacyLocationHelper *)self _closestLocationNodeFromLocationNode:a3 withDimension:a4 remapMatchingDimensionBlock:0 reverse:a5];
}

- (id)closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 remapMatchingDimensionBlock:(id)a5
{
  return [(PGGraphLegacyLocationHelper *)self _closestLocationNodeFromLocationNode:a3 withDimension:a4 remapMatchingDimensionBlock:a5 reverse:0];
}

@end