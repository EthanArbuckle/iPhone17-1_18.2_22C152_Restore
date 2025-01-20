@interface PGGraphLocationHelper
+ (id)inefficientLocationHelper;
- (BOOL)_locationNodesRepresentSameCity:(id)a3;
- (BOOL)locationIsInSupersetCategoryForLocationNode:(id)a3;
- (CLLocationCoordinate2D)_approximateCoordinateForLocationNode:(id)a3;
- (PGGraphLocationHelper)initWithGraph:(id)a3;
- (id)_closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 remapMatchingDimensionBlock:(id)a5 reverse:(BOOL)a6;
- (id)_commonNodeForLocationNode:(id)a3 andLocationNode:(id)a4;
- (id)_mostVisitedLocationNodeForLocationNodes:(id)a3;
- (id)_parentLocationNodeForLocationNode:(id)a3;
- (id)_parentLocationNodeWithDimension:(unint64_t)a3 ofLocationNode:(id)a4;
- (id)_parentLocationNodeWithDimension:(unint64_t)a3 ofLocationNodeAsCollection:(id)a4;
- (id)_parentLocationNodeWithDimension:(unint64_t)a3 sourceLocationNodeAsCollection:(id)a4 sourceLabel:(id)a5;
- (id)_validLocationNodeForLocationNode:(id)a3 withLocationMask:(unint64_t)a4;
- (id)addressNodes;
- (id)addressNodesByAreaNode;
- (id)addressNodesByMomentNode;
- (id)addressNodesByMomentNodeAdjacency;
- (id)addressNodesFromAreaNodes:(id)a3;
- (id)addressNodesFromLocationNodes:(id)a3;
- (id)areaNodesByAddressNode;
- (id)areaNodesFromAddressNodes:(id)a3;
- (id)cityNodeFromAddressNode:(id)a3;
- (id)cityNodeFromDistrictNode:(id)a3;
- (id)cityNodesByLocationNode;
- (id)cityNodesFromAddressNodes:(id)a3;
- (id)closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 remapMatchingDimensionBlock:(id)a5;
- (id)closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 reverse:(BOOL)a5;
- (id)commonLocationNodeForRelevantLocationNodes:(id)a3 locationMask:(unint64_t)a4;
- (id)countryNodeFromAddressNode:(id)a3;
- (id)countryNodeFromAddressNodeAsCollection:(id)a3;
- (id)countryNodesByLocationNode;
- (id)countyNodeFromCityNode:(id)a3;
- (id)countyNodesByLocationNode;
- (id)densestCloseLocationNodeFromLocationNode:(id)a3 withDateInterval:(id)a4 locationMask:(unint64_t)a5;
- (id)districtNodeFromAddressNode:(id)a3;
- (id)districtNodesByLocationNode;
- (id)locationNodesByCityNode;
- (id)locationNodesByCountryNode;
- (id)locationNodesByCountyNode;
- (id)locationNodesByDistrictNode;
- (id)locationNodesByNumberNode;
- (id)locationNodesByStateNode;
- (id)locationNodesByStreetNode;
- (id)momentNodesByAddressNode;
- (id)momentNodesByAddressNodeIntersectingAddressNodes:(id)a3;
- (id)numberNodesByLocationNode;
- (id)relevantAddressNodesForMomentNodes:(id)a3 applyDensestCloseLocationNode:(BOOL)a4;
- (id)relevantLocationNodesForMomentNodes:(id)a3 applyDensestCloseLocationNode:(BOOL)a4;
- (id)stateNodeFromAddressNode:(id)a3;
- (id)stateNodeFromCityNodeAsCollection:(id)a3;
- (id)stateNodesByLocationNode;
- (id)stateNodesFromAddressNodes:(id)a3;
- (id)streetNodesByLocationNode;
- (void)_fetchAddressNodes;
- (void)_fetchLocationNodesByCityNode;
- (void)_fetchLocationNodesByCountryNode;
- (void)_fetchLocationNodesByCountyNode;
- (void)_fetchLocationNodesByDistrictNode;
- (void)_fetchLocationNodesByNumberNode;
- (void)_fetchLocationNodesByStateNode;
- (void)_fetchLocationNodesByStreetNode;
@end

@implementation PGGraphLocationHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressNodes, 0);
  objc_storeStrong((id *)&self->_addressNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_momentNodesByAddressNode, 0);
  objc_storeStrong((id *)&self->_areaNodesByAddressNode, 0);
  objc_storeStrong((id *)&self->_addressNodesByAreaNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByNumberNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByStreetNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByDistrictNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByCityNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByCountyNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByStateNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByCountryNode, 0);
  objc_storeStrong((id *)&self->_numberNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_streetNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_districtNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_cityNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_countyNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_stateNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_countryNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (id)_validLocationNodeForLocationNode:(id)a3 withLocationMask:(unint64_t)a4
{
  id v6 = a3;
  if (([v6 locationMask] & a4) != 0)
  {
LABEL_7:
    id v6 = v6;
    v9 = v6;
    goto LABEL_8;
  }
  while (1)
  {
    uint64_t v7 = [v6 outEdgesCount];
    if (v7 == 1)
    {
      id v8 = [(PGGraphLocationHelper *)self _parentLocationNodeForLocationNode:v6];

      goto LABEL_6;
    }
    if (!v7) {
      break;
    }
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__31958;
    v16 = __Block_byref_object_dispose__31959;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__PGGraphLocationHelper__validLocationNodeForLocationNode_withLocationMask___block_invoke;
    v11[3] = &unk_1E68E8C30;
    v11[4] = &v12;
    [v6 enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:v11];
    id v8 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
LABEL_6:
    id v6 = v8;
    if (([v8 locationMask] & a4) != 0) {
      goto LABEL_7;
    }
  }
  v9 = 0;
LABEL_8:

  return v9;
}

void __76__PGGraphLocationHelper__validLocationNodeForLocationNode_withLocationMask___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
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
  id v4 = a3;
  if ([v4 domain] != 200)
  {
    double v12 = *MEMORY[0x1E4F1E750];
    double v13 = *(double *)(MEMORY[0x1E4F1E750] + 8);
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v5 = [v4 locationMask];
  if (v4)
  {
    unint64_t v6 = v5;
    while (1)
    {
      uint64_t v7 = [v4 label];
      char v8 = [v7 isEqualToString:@"Address"];

      if (v8) {
        break;
      }
      if (v6 < 0x10)
      {
        id v11 = [(PGGraphLocationHelper *)self _parentLocationNodeForLocationNode:v4];
      }
      else
      {
        v25[0] = 0;
        v25[1] = v25;
        v25[2] = 0x2020000000;
        v25[3] = 0;
        uint64_t v19 = 0;
        v20 = &v19;
        uint64_t v21 = 0x3032000000;
        v22 = __Block_byref_object_copy__31958;
        v23 = __Block_byref_object_dispose__31959;
        id v24 = 0;
        v9 = [v4 locationNodeCollection];
        v10 = [v9 childLocationNodes];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __63__PGGraphLocationHelper__approximateCoordinateForLocationNode___block_invoke;
        v18[3] = &unk_1E68E8C08;
        v18[4] = self;
        v18[5] = v25;
        v18[6] = &v19;
        [v10 enumerateIdentifiersAsCollectionsWithBlock:v18];

        id v11 = (id)v20[5];
        v6 >>= 1;
        _Block_object_dispose(&v19, 8);

        _Block_object_dispose(v25, 8);
      }
      id v4 = v11;
      if (!v11) {
        goto LABEL_9;
      }
    }
    [v4 coordinate];
    double v12 = v14;
    double v13 = v15;
    goto LABEL_12;
  }
LABEL_9:
  double v12 = *MEMORY[0x1E4F1E750];
  double v13 = *(double *)(MEMORY[0x1E4F1E750] + 8);
LABEL_13:
  double v16 = v12;
  double v17 = v13;
  result.longitude = v17;
  result.latitude = v16;
  return result;
}

void __63__PGGraphLocationHelper__approximateCoordinateForLocationNode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "addressNodesFromLocationNodes:");
  uint64_t v5 = [*(id *)(a1 + 32) momentNodesByAddressNode];
  unint64_t v6 = [v5 targetsForSources:v4];
  unint64_t v7 = [v6 count];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v7 > *(void *)(v8 + 24))
  {
    *(void *)(v8 + 24) = v7;
    uint64_t v9 = [v12 anyNode];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (id)_commonNodeForLocationNode:(id)a3 andLocationNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 == v7)
  {
    id v24 = v6;
  }
  else
  {
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__31958;
    v38 = __Block_byref_object_dispose__31959;
    id v8 = v6;
    id v39 = v8;
    uint64_t v9 = [v8 label];
    int v10 = [v9 isEqualToString:@"Address"];

    if (v10)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __68__PGGraphLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke;
      v33[3] = &unk_1E68EB7E8;
      v33[4] = &v34;
      [v8 enumerateNeighborNodesThroughOutEdgesUsingBlock:v33];
    }
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__31958;
    v31 = __Block_byref_object_dispose__31959;
    id v11 = v7;
    id v32 = v11;
    id v12 = [v11 label];
    int v13 = [v12 isEqualToString:@"Address"];

    if (v13)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __68__PGGraphLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke_2;
      v26[3] = &unk_1E68EB7E8;
      v26[4] = &v27;
      [v11 enumerateNeighborNodesThroughOutEdgesUsingBlock:v26];
    }
    double v14 = (void *)v35[5];
    double v15 = (void *)v28[5];
    BOOL v16 = v14 == v15;
    if (v14 != v15 && v14 && v15)
    {
      do
      {
        unint64_t v17 = [v14 locationMask];
        if (v17 <= [(id)v28[5] locationMask])
        {
          uint64_t v18 = [(PGGraphLocationHelper *)self _parentLocationNodeForLocationNode:v35[5]];
          uint64_t v19 = v35;
        }
        else
        {
          uint64_t v18 = [(PGGraphLocationHelper *)self _parentLocationNodeForLocationNode:v28[5]];
          uint64_t v19 = v28;
        }
        v20 = (void *)v19[5];
        v19[5] = v18;

        double v14 = (void *)v35[5];
        uint64_t v21 = (void *)v28[5];
        BOOL v16 = v14 == v21;
      }
      while (v14 != v21 && v14 != 0 && v21 != 0);
    }
    if (v16) {
      id v24 = v14;
    }
    else {
      id v24 = 0;
    }
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v34, 8);
  }

  return v24;
}

void __68__PGGraphLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 domain] == 200)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __68__PGGraphLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
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
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v24 = [v4 anyObject];
  if ((unint64_t)[v4 count] >= 2)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v21 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0;
      uint64_t v23 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          int v10 = objc_msgSend(v9, "locationNodeCollection", v21);
          id v11 = [(PGGraphLocationHelper *)self addressNodesFromLocationNodes:v10];

          id v12 = [(PGGraphLocationHelper *)self momentNodesByAddressNode];
          int v13 = [v12 targetsForSources:v11];
          unint64_t v14 = [v13 count];

          if (v14 > v7
            || v14 == v7
            && ([v9 UUID],
                BOOL v16 = objc_claimAutoreleasedReturnValue(),
                [v24 UUID],
                unint64_t v17 = objc_claimAutoreleasedReturnValue(),
                uint64_t v18 = [v16 compare:v17],
                v17,
                v16,
                v18 == -1))
          {
            id v15 = v9;

            unint64_t v7 = v14;
            id v24 = v15;
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v6);
    }

    id v4 = v21;
  }
  id v19 = v24;

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
        id v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
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

  BOOL v16 = (void *)[v7 mutableCopy];
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
        [(PGGraphLocationHelper *)self _approximateCoordinateForLocationNode:v21];
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
              -[PGGraphLocationHelper _approximateCoordinateForLocationNode:](self, "_approximateCoordinateForLocationNode:", *(void *)(*((void *)&v31 + 1) + 8 * j), v29);
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
  if (![(PGGraphLocationHelper *)self _locationNodesRepresentSameCity:v6])
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
            BOOL v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (v13)
            {
              uint64_t v17 = -[PGGraphLocationHelper _commonNodeForLocationNode:andLocationNode:](self, "_commonNodeForLocationNode:andLocationNode:", v13, v16, (void)v31);

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
            id v7 = -[PGGraphLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v13, a4, (void)v31);
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
    uint64_t v23 = [(PGGraphLocationHelper *)self _commonNodeForLocationNode:v21 andLocationNode:v22];

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
    long long v28 = [v8 supersetStateNodes];
    int v29 = [v28 containsNode:v25];

    if (!v29)
    {
      id v7 = [(PGGraphLocationHelper *)self _validLocationNodeForLocationNode:v23 withLocationMask:a4];

LABEL_36:
      goto LABEL_31;
    }
    goto LABEL_28;
  }
  uint64_t v8 = [(PGGraphLocationHelper *)self _mostVisitedLocationNodeForLocationNodes:v6];
  id v7 = [(PGGraphLocationHelper *)self _validLocationNodeForLocationNode:v8 withLocationMask:a4];
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
    uint64_t v14 = [(PGGraphLocationHelper *)self _parentLocationNodeForLocationNode:v8];
    if (!v14)
    {
      id v19 = v8;
LABEL_20:

      goto LABEL_21;
    }
    int v15 = [(PGGraphLocationHelper *)self _parentLocationNodeForLocationNode:v14];
    if (v15)
    {
      [(PGGraphLocationHelper *)self _approximateCoordinateForLocationNode:v8];
      CLLocationDegrees latitude = v113.latitude;
      CLLocationDegrees longitude = v113.longitude;
      BOOL v18 = CLLocationCoordinate2DIsValid(v113);
      id v19 = v8;
      if (v18)
      {
        unint64_t v49 = a5;
        int v20 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
        v111[0] = 0;
        v111[1] = v111;
        v111[2] = 0x2020000000;
        v111[3] = 0;
        v110[0] = 0;
        v110[1] = v110;
        v110[2] = 0x2020000000;
        v110[3] = 0;
        v109[0] = 0;
        v109[1] = v109;
        v109[2] = 0x2020000000;
        v109[3] = 0;
        v50 = v15;
        v108[0] = 0;
        v108[1] = v108;
        v108[2] = 0x2020000000;
        v108[3] = 0;
        v107[0] = 0;
        v107[1] = v107;
        v107[2] = 0x2020000000;
        v107[3] = 0;
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke;
        v95[3] = &unk_1E68E8B90;
        v95[4] = self;
        CLLocationDegrees v105 = latitude;
        CLLocationDegrees v106 = longitude;
        id v48 = v9;
        id v96 = v9;
        id v22 = v20;
        id v97 = v22;
        id v23 = v21;
        id v98 = v23;
        v100 = v110;
        v101 = v109;
        id v99 = v14;
        v102 = v111;
        v103 = v108;
        v104 = v107;
        [v15 enumerateNeighborNodesThroughInEdgesUsingBlock:v95];
        uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "identifier"));
        id v25 = [v22 objectForKeyedSubscript:v24];
        [v25 doubleValue];
        double v27 = v26;
        long long v28 = [v23 objectForKeyedSubscript:v24];
        [v28 doubleValue];
        double v30 = v29;
        uint64_t v46 = v24;

        uint64_t v91 = 0;
        v92 = &v91;
        uint64_t v93 = 0x2020000000;
        uint64_t v94 = 0;
        uint64_t v87 = 0;
        v88 = (double *)&v87;
        uint64_t v89 = 0x2020000000;
        uint64_t v90 = 0;
        uint64_t v83 = 0;
        v84 = (double *)&v83;
        uint64_t v85 = 0x2020000000;
        uint64_t v86 = 0;
        long long v31 = [v19 graph];
        uint64_t v77 = 0;
        v78 = &v77;
        uint64_t v79 = 0x3032000000;
        v80 = __Block_byref_object_copy__31958;
        v81 = __Block_byref_object_dispose__31959;
        id v32 = v19;
        id v82 = v32;
        uint64_t v73 = 0;
        v74 = (double *)&v73;
        uint64_t v75 = 0x2020000000;
        double v76 = v30 * 0.4 + v27 * 0.6;
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_3;
        v65[3] = &unk_1E68E8BB8;
        id v33 = v23;
        id v66 = v33;
        v68 = &v91;
        v69 = &v87;
        v70 = &v83;
        v71 = &v73;
        id v34 = v31;
        id v67 = v34;
        v72 = &v77;
        [v22 enumerateKeysAndObjectsUsingBlock:v65];
        unint64_t v35 = v92[3];
        double v36 = 0.0;
        if (v35 >= 2) {
          double v36 = v84[3] / (double)(v35 - 1);
        }
        v84[3] = v36;
        uint64_t v61 = 0;
        v62 = &v61;
        uint64_t v63 = 0x2020000000;
        uint64_t v64 = 0;
        uint64_t v57 = 0;
        v58 = &v57;
        uint64_t v59 = 0x2020000000;
        uint64_t v60 = 0;
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_4;
        v51[3] = &unk_1E68E8BE0;
        double v37 = sqrt(v36);
        id v38 = v33;
        id v52 = v38;
        v53 = &v87;
        double v56 = v37;
        v54 = &v57;
        v55 = &v61;
        [v22 enumerateKeysAndObjectsUsingBlock:v51];
        int v15 = v50;
        if ((unint64_t)v62[3] <= 1 && (unint64_t)v58[3] < 3)
        {
          if (v74[3] - v88[3] < v37 + v37)
          {
            id v41 = v32;
            goto LABEL_13;
          }
          id v39 = v38;
          id v41 = (id)v78[5];
          long long v40 = v32;
        }
        else
        {
          id v39 = v38;
          long long v40 = -[PGGraphLocationHelper _parentLocationNodeForLocationNode:](self, "_parentLocationNodeForLocationNode:", v78[5], v46);
          id v41 = [(PGGraphLocationHelper *)self _commonNodeForLocationNode:v32 andLocationNode:v40];
        }
        id v38 = v39;
LABEL_13:
        uint64_t v42 = -[PGGraphLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v41, v49, v46);
        long long v43 = (void *)v42;
        if (v42) {
          v44 = (void *)v42;
        }
        else {
          v44 = v32;
        }
        id v19 = v44;

        _Block_object_dispose(&v57, 8);
        _Block_object_dispose(&v61, 8);

        _Block_object_dispose(&v73, 8);
        _Block_object_dispose(&v77, 8);

        _Block_object_dispose(&v83, 8);
        _Block_object_dispose(&v87, 8);
        _Block_object_dispose(&v91, 8);

        _Block_object_dispose(v107, 8);
        _Block_object_dispose(v108, 8);
        _Block_object_dispose(v109, 8);
        _Block_object_dispose(v110, 8);
        _Block_object_dispose(v111, 8);

        id v9 = v48;
      }
    }
    else
    {
      id v19 = v8;
    }

    goto LABEL_20;
  }
  uint64_t v12 = [(PGGraphLocationHelper *)self _parentLocationNodeForLocationNode:v8];
  if (v12)
  {
    id v13 = (void *)v12;

    id v8 = v13;
    goto LABEL_4;
  }
  id v19 = [(PGGraphLocationHelper *)self _validLocationNodeForLocationNode:v8 withLocationMask:a5];
LABEL_21:

  return v19;
}

void __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_2;
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

void __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
    BOOL v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v14;
    uint64_t v14 = v18;
    goto LABEL_6;
  }
LABEL_7:
}

void __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
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

void __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) _approximateCoordinateForLocationNode:v3];
  CLLocationCoordinate2D v25 = v28;
  if (CLLocationCoordinate2DIsValid(v28))
  {
    CLLocationCoordinate2DGetDistanceFrom();
    if (v4 <= 20000.0)
    {
      double v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "identifier"));
      uint64_t v6 = [v3 inEdgesCount];
      id v7 = *(void **)(a1 + 32);
      double v8 = [v3 locationNodeCollection];
      double v9 = [v7 addressNodesFromLocationNodes:v8];

      long long v10 = [*(id *)(a1 + 32) momentNodesByAddressNode];
      double v11 = [v10 targetsForSources:v9];

      if (*(void *)(a1 + 40))
      {
        uint64_t v20 = v6;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        double v12 = [v11 universalDateIntervals];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = 0;
          uint64_t v16 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v12);
              }
              v15 += [*(id *)(a1 + 40) intersectsDateInterval:*(void *)(*((void *)&v21 + 1) + 8 * i)];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
          }
          while (v14);
        }
        else
        {
          uint64_t v15 = 0;
        }

        uint64_t v6 = v20;
      }
      else
      {
        uint64_t v15 = [v11 count];
      }
      BOOL v18 = [NSNumber numberWithUnsignedInteger:v6];
      [*(id *)(a1 + 48) setObject:v18 forKeyedSubscript:v5];

      id v19 = [NSNumber numberWithUnsignedInteger:v15];
      [*(id *)(a1 + 56) setObject:v19 forKeyedSubscript:v5];

      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += v6;
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += v15;
    }
  }
}

- (BOOL)locationIsInSupersetCategoryForLocationNode:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 label];
  unint64_t v6 = +[PGCommonTitleUtility dimensionForLabel:v5];

  id v7 = [v4 graph];
  double v8 = v7;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      double v9 = +[PGLogging sharedLogging];
      long long v10 = [v9 loggingConnection];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[PGGraphLocationHelper locationIsInSupersetCategoryForLocationNode:]";
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
      double v11 = (void *)v12;
      break;
    default:
LABEL_5:
      double v11 = 0;
      break;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v21 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__PGGraphLocationHelper_locationIsInSupersetCategoryForLocationNode___block_invoke;
  v16[3] = &unk_1E68E8B40;
  BOOL v18 = buf;
  unint64_t v19 = v6;
  v16[4] = self;
  id v13 = v4;
  id v17 = v13;
  [v11 enumerateNodesUsingBlock:v16];
  BOOL v14 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v14;
}

void __69__PGGraphLocationHelper_locationIsInSupersetCategoryForLocationNode___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = [*(id *)(a1 + 32) closestLocationNodeFromLocationNode:a2 withDimension:*(void *)(a1 + 56) reverse:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 isSameNodeAsNode:*(void *)(a1 + 40)];
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (id)relevantAddressNodesForMomentNodes:(id)a3 applyDensestCloseLocationNode:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  if ([v35 count])
  {
    id v39 = [MEMORY[0x1E4F1CA80] set];
    long long v43 = [MEMORY[0x1E4F1CA80] set];
    id v42 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v5 = v35;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v63 != v7) {
            objc_enumerationMutation(v5);
          }
          double v9 = [*(id *)(*((void *)&v62 + 1) + 8 * i) bestAddressNode];
          long long v10 = v9;
          if (v9)
          {
            objc_msgSend(v42, "addIdentifier:", objc_msgSend(v9, "identifier"));
            [v43 addObject:v10];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v6);
    }

    double v11 = [PGGraphMomentNodeCollection alloc];
    uint64_t v12 = [v5 firstObject];
    id v13 = [v12 graph];
    id v34 = [(MAElementCollection *)v11 initWithArray:v5 graph:v13];

    BOOL v14 = [(PGGraphLocationHelper *)self addressNodesByMomentNode];
    double v37 = [v14 targetsForSources:v34];

    [(PGGraphLocationHelper *)self relevantLocationNodesForMomentNodes:v5 applyDensestCloseLocationNode:v4];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v41 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (v41)
    {
      uint64_t v40 = *(void *)v59;
      *(void *)&long long v15 = 138412290;
      long long v33 = v15;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v59 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          uint64_t v54 = 0;
          v55 = &v54;
          uint64_t v56 = 0x2020000000;
          char v57 = 0;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v17 = v43;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v50 objects:v68 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v51;
            while (2)
            {
              for (uint64_t k = 0; k != v18; ++k)
              {
                if (*(void *)v51 != v19) {
                  objc_enumerationMutation(v17);
                }
                char v21 = *(void **)(*((void *)&v50 + 1) + 8 * k);
                uint64_t v22 = objc_msgSend(v21, "collection", v33);
                long long v23 = [v16 label];
                long long v24 = [v22 nearestDeepParentLocationNodesWithLabel:v23];
                CLLocationCoordinate2D v25 = [v24 anyNode];

                if (v25 == v16)
                {
                  [v39 addObject:v21];
                  *((unsigned char *)v55 + 24) = 1;

                  goto LABEL_26;
                }
              }
              uint64_t v18 = [v17 countByEnumeratingWithState:&v50 objects:v68 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }
LABEL_26:

          if (!*((unsigned char *)v55 + 24))
          {
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __90__PGGraphLocationHelper_relevantAddressNodesForMomentNodes_applyDensestCloseLocationNode___block_invoke;
            v45[3] = &unk_1E68E8B18;
            id v46 = v42;
            uint64_t v47 = v16;
            id v26 = v39;
            id v48 = v26;
            unint64_t v49 = &v54;
            [v37 enumerateIdentifiersAsCollectionsWithBlock:v45];

            if (!*((unsigned char *)v55 + 24))
            {
              uint64_t v27 = [v16 locationNodeCollection];
              CLLocationCoordinate2D v28 = [(PGGraphLocationHelper *)self addressNodesFromLocationNodes:v27];
              double v29 = [v28 anyNode];

              if (v29)
              {
                [v26 addObject:v29];
              }
              else
              {
                double v30 = +[PGLogging sharedLogging];
                long long v31 = [v30 loggingConnection];

                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v33;
                  id v67 = v16;
                  _os_log_error_impl(&dword_1D1805000, v31, OS_LOG_TYPE_ERROR, "No address node from location node: %@", buf, 0xCu);
                }
              }
            }
          }
          _Block_object_dispose(&v54, 8);
        }
        uint64_t v41 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
      }
      while (v41);
    }
  }
  else
  {
    id v39 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v39;
}

void __90__PGGraphLocationHelper_relevantAddressNodesForMomentNodes_applyDensestCloseLocationNode___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v12 = a3;
  if (([*(id *)(a1 + 32) containsIdentifier:a2] & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 40) label];
    double v8 = [v12 nearestDeepParentLocationNodesWithLabel:v7];
    double v9 = [v8 anyNode];

    if (v9 == *(void **)(a1 + 40))
    {
      long long v10 = *(void **)(a1 + 48);
      double v11 = [v12 anyNode];
      [v10 addObject:v11];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (id)relevantLocationNodesForMomentNodes:(id)a3 applyDensestCloseLocationNode:(BOOL)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 firstObject];
  double v8 = [v7 graph];

  if (v8)
  {
    double v9 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithArray:v6 graph:v8];
    long long v10 = [(PGGraphLocationHelper *)self addressNodesByMomentNode];
    double v11 = [v10 targetsForSources:v9];
    id v12 = [v11 temporarySet];

    if ([v12 count])
    {
      id v13 = [[PGIncompleteLocationResolver alloc] initWithAddressNodes:v12 locationHelper:self];
      BOOL v14 = [[PGLocationsResolver alloc] initWithSortedMomentNodes:v6 incompleteLocationResolver:v13 locationHelper:self];
      long long v15 = [(PGLocationsResolver *)v14 resolvedMomentNodes];
      id v39 = [(PGLocationsResolver *)v14 resolvedLocationNodes];
      id v38 = [[PGLocationsFilterer alloc] initWithSortedMomentNodes:v15 locationNodes:v39 incompleteLocationResolver:v13];
      uint64_t v16 = [(PGLocationsFilterer *)v38 filteredLocationNodes];
      if (a4)
      {
        long long v31 = v15;
        id v32 = v14;
        long long v33 = v13;
        id v34 = v12;
        id v35 = v9;
        double v36 = v8;
        id v37 = v6;
        id v17 = (void *)v16;
        uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        double v30 = v17;
        id v19 = v17;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v46 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v41 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              CLLocationCoordinate2D v25 = -[PGGraphLocationHelper densestCloseLocationNodeFromLocationNode:withDateInterval:locationMask:](self, "densestCloseLocationNodeFromLocationNode:withDateInterval:locationMask:", v24, 0, -1, v30);
              if (v25)
              {
                [v18 addObject:v25];
              }
              else
              {
                id v26 = +[PGLogging sharedLogging];
                uint64_t v27 = [v26 loggingConnection];

                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v45 = v24;
                  _os_log_error_impl(&dword_1D1805000, v27, OS_LOG_TYPE_ERROR, "No densestLocationNode for locationNode %@", buf, 0xCu);
                }
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v46 count:16];
          }
          while (v21);
        }

        double v8 = v36;
        id v6 = v37;
        id v12 = v34;
        double v9 = v35;
        BOOL v14 = v32;
        id v13 = v33;
        CLLocationCoordinate2D v28 = v30;
        long long v15 = v31;
      }
      else
      {
        CLLocationCoordinate2D v28 = (void *)v16;
        uint64_t v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
      }
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v18;
}

- (id)cityNodeFromDistrictNode:(id)a3
{
  return [(PGGraphLocationHelper *)self _parentLocationNodeWithDimension:6 ofLocationNode:a3];
}

- (id)stateNodesFromAddressNodes:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F71E60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __52__PGGraphLocationHelper_stateNodesFromAddressNodes___block_invoke;
  BOOL v14 = &unk_1E68EBC20;
  long long v15 = self;
  id v16 = v6;
  id v7 = v6;
  [v5 enumerateNodesUsingBlock:&v11];

  double v8 = [PGGraphLocationStateNodeCollection alloc];
  double v9 = -[MAElementCollection initWithGraph:elementIdentifiers:](v8, "initWithGraph:elementIdentifiers:", self->_graph, v7, v11, v12, v13, v14, v15);

  return v9;
}

void __52__PGGraphLocationHelper_stateNodesFromAddressNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) stateNodeFromAddressNode:a2];
  id v3 = *(void **)(a1 + 40);
  BOOL v4 = [v5 elementIdentifiers];
  [v3 unionWithIdentifierSet:v4];
}

- (id)stateNodeFromCityNodeAsCollection:(id)a3
{
  return [(PGGraphLocationHelper *)self _parentLocationNodeWithDimension:8 ofLocationNodeAsCollection:a3];
}

- (id)countyNodeFromCityNode:(id)a3
{
  return [(PGGraphLocationHelper *)self _parentLocationNodeWithDimension:7 ofLocationNode:a3];
}

- (id)countryNodeFromAddressNodeAsCollection:(id)a3
{
  return [(PGGraphLocationHelper *)self _parentLocationNodeWithDimension:9 ofLocationNodeAsCollection:a3];
}

- (id)countryNodeFromAddressNode:(id)a3
{
  return [(PGGraphLocationHelper *)self _parentLocationNodeWithDimension:9 ofLocationNode:a3];
}

- (id)cityNodeFromAddressNode:(id)a3
{
  return [(PGGraphLocationHelper *)self _parentLocationNodeWithDimension:6 ofLocationNode:a3];
}

- (id)cityNodesFromAddressNodes:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F71E60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __51__PGGraphLocationHelper_cityNodesFromAddressNodes___block_invoke;
  BOOL v14 = &unk_1E68EBC20;
  long long v15 = self;
  id v16 = v6;
  id v7 = v6;
  [v5 enumerateNodesUsingBlock:&v11];

  double v8 = [PGGraphLocationCityNodeCollection alloc];
  double v9 = -[MAElementCollection initWithGraph:elementIdentifiers:](v8, "initWithGraph:elementIdentifiers:", self->_graph, v7, v11, v12, v13, v14, v15);

  return v9;
}

void __51__PGGraphLocationHelper_cityNodesFromAddressNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) cityNodeFromAddressNode:a2];
  id v3 = *(void **)(a1 + 40);
  BOOL v4 = [v5 elementIdentifiers];
  [v3 unionWithIdentifierSet:v4];
}

- (id)districtNodeFromAddressNode:(id)a3
{
  return [(PGGraphLocationHelper *)self _parentLocationNodeWithDimension:5 ofLocationNode:a3];
}

- (id)momentNodesByAddressNodeIntersectingAddressNodes:(id)a3
{
  id v4 = a3;
  id v5 = [(PGGraphLocationHelper *)self momentNodesByAddressNode];
  id v6 = [v5 intersectingSourcesWith:v4];

  return v6;
}

- (id)addressNodesFromLocationNodes:(id)a3
{
  id v4 = a3;
  id v5 = [(PGGraphLocationHelper *)self locationNodesByCountryNode];
  id v6 = [v5 sources];
  unint64_t v49 = [v6 collectionByIntersecting:v4];

  id v7 = [(PGGraphLocationHelper *)self locationNodesByCountryNode];
  double v8 = [v7 targetsForSources:v49];
  double v9 = [v4 collectionByFormingUnionWith:v8];

  long long v10 = [(PGGraphLocationHelper *)self locationNodesByStateNode];
  uint64_t v11 = [v10 sources];
  id v48 = [v11 collectionByIntersecting:v9];

  uint64_t v12 = [(PGGraphLocationHelper *)self locationNodesByStateNode];
  id v13 = [v12 targetsForSources:v48];
  BOOL v14 = [v9 collectionByFormingUnionWith:v13];

  long long v15 = [(PGGraphLocationHelper *)self locationNodesByCountyNode];
  id v16 = [v15 sources];
  id v17 = [v16 collectionByIntersecting:v14];

  uint64_t v18 = [(PGGraphLocationHelper *)self locationNodesByCountyNode];
  id v19 = [v18 targetsForSources:v17];
  uint64_t v20 = [v14 collectionByFormingUnionWith:v19];

  uint64_t v21 = [(PGGraphLocationHelper *)self locationNodesByCityNode];
  uint64_t v22 = [v21 sources];
  long long v23 = [v22 collectionByIntersecting:v20];

  uint64_t v24 = [(PGGraphLocationHelper *)self locationNodesByCityNode];
  CLLocationCoordinate2D v25 = [v24 targetsForSources:v23];
  id v26 = [v20 collectionByFormingUnionWith:v25];

  uint64_t v27 = [(PGGraphLocationHelper *)self locationNodesByDistrictNode];
  CLLocationCoordinate2D v28 = [v27 sources];
  double v29 = [v28 collectionByIntersecting:v26];

  double v30 = [(PGGraphLocationHelper *)self locationNodesByDistrictNode];
  long long v31 = [v30 targetsForSources:v29];
  id v32 = [v26 collectionByFormingUnionWith:v31];

  long long v33 = [(PGGraphLocationHelper *)self locationNodesByStreetNode];
  id v34 = [v33 sources];
  id v35 = [v34 collectionByIntersecting:v32];

  double v36 = [(PGGraphLocationHelper *)self locationNodesByStreetNode];
  id v37 = [v36 targetsForSources:v35];
  id v38 = [v32 collectionByFormingUnionWith:v37];

  id v39 = [(PGGraphLocationHelper *)self locationNodesByNumberNode];
  long long v40 = [v39 sources];
  long long v41 = [v40 collectionByIntersecting:v38];

  long long v42 = [(PGGraphLocationHelper *)self locationNodesByNumberNode];
  long long v43 = [v42 targetsForSources:v41];
  v44 = [v38 collectionByFormingUnionWith:v43];

  uint64_t v45 = [(PGGraphLocationHelper *)self addressNodes];
  id v46 = [v45 collectionByIntersecting:v44];

  return v46;
}

- (id)areaNodesFromAddressNodes:(id)a3
{
  id v4 = a3;
  id v5 = [(PGGraphLocationHelper *)self areaNodesByAddressNode];
  id v6 = [v5 targetsForSources:v4];

  return v6;
}

- (id)addressNodesFromAreaNodes:(id)a3
{
  id v4 = a3;
  id v5 = [(PGGraphLocationHelper *)self addressNodesByAreaNode];
  id v6 = [v5 targetsForSources:v4];

  return v6;
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

  id v26 = v13;
  if (v15)
  {
    id v16 = v10;
  }
  else
  {
    id v16 = 0;
    if (v6) {
      unint64_t v18 = 4;
    }
    else {
      unint64_t v18 = 9;
    }
    BOOL v19 = a4 < v18 && v6;
    if (a4 && !v19)
    {
      if (v6) {
        uint64_t v20 = -1;
      }
      else {
        uint64_t v20 = 1;
      }
      CLLocationCoordinate2D v25 = v12 + 2;
      while (a4 <= v18 || v6)
      {
        uint64_t v21 = -[PGGraphLocationHelper _parentLocationNodeWithDimension:ofLocationNode:](self, "_parentLocationNodeWithDimension:ofLocationNode:", a4, v10, v25, v26);
        id v16 = [v21 anyNode];

        if (!v16)
        {
          a4 += v20;
          if (v12)
          {
            BOOL v22 = !v6;
            char v23 = a4 < v18 || !v6;
            if (a4 > v18) {
              BOOL v22 = 0;
            }
            if (v22 || (v23 & 1) == 0) {
              a4 = v12[2](v12, a4);
            }
          }
          id v16 = 0;
          BOOL v24 = a4 < v18 && v6;
          if (a4 && !v24) {
            continue;
          }
        }
        goto LABEL_5;
      }
      id v16 = 0;
    }
  }
LABEL_5:

  return v16;
}

- (id)_parentLocationNodeForLocationNode:(id)a3
{
  v27[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGGraphLocationHelper *)self numberNodesByLocationNode];
  v27[0] = v5;
  BOOL v6 = [(PGGraphLocationHelper *)self streetNodesByLocationNode];
  v27[1] = v6;
  id v7 = [(PGGraphLocationHelper *)self districtNodesByLocationNode];
  v27[2] = v7;
  double v8 = [(PGGraphLocationHelper *)self cityNodesByLocationNode];
  v27[3] = v8;
  double v9 = [(PGGraphLocationHelper *)self countyNodesByLocationNode];
  v27[4] = v9;
  id v10 = [(PGGraphLocationHelper *)self stateNodesByLocationNode];
  v27[5] = v10;
  id v11 = [(PGGraphLocationHelper *)self countryNodesByLocationNode];
  v27[6] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:7];

  id v13 = [v4 locationNodeCollection];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
LABEL_3:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v23 != v17) {
        objc_enumerationMutation(v14);
      }
      BOOL v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v18), "targetsForSources:", v13, (void)v22);
      if ([v19 count]) {
        break;
      }

      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v16) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    BOOL v19 = 0;
  }

  uint64_t v20 = [v19 anyNode];

  return v20;
}

- (id)_parentLocationNodeWithDimension:(unint64_t)a3 sourceLocationNodeAsCollection:(id)a4 sourceLabel:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    uint64_t v12 = [v8 labels];
    id v11 = [v12 anyObject];
  }
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  unint64_t v34 = 0;
  unint64_t v34 = +[PGCommonTitleUtility dimensionForLabel:v11];
  unint64_t v13 = v32[3];
  if (v13 == a3)
  {
    id v14 = v8;
  }
  else if (v13 >= a3)
  {
    id v14 = 0;
  }
  else
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    CLLocationCoordinate2D v28 = __Block_byref_object_copy__31958;
    double v29 = __Block_byref_object_dispose__31959;
    id v30 = v8;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __101__PGGraphLocationHelper__parentLocationNodeWithDimension_sourceLocationNodeAsCollection_sourceLabel___block_invoke;
    aBlock[3] = &unk_1E68E8AF0;
    aBlock[5] = &v25;
    aBlock[6] = a3;
    aBlock[4] = &v31;
    uint64_t v15 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
    uint64_t v16 = [(PGGraphLocationHelper *)self numberNodesByLocationNode];
    v15[2](v15, 3, v16);

    uint64_t v17 = [(PGGraphLocationHelper *)self streetNodesByLocationNode];
    v15[2](v15, 4, v17);

    uint64_t v18 = [(PGGraphLocationHelper *)self districtNodesByLocationNode];
    v15[2](v15, 5, v18);

    BOOL v19 = [(PGGraphLocationHelper *)self cityNodesByLocationNode];
    v15[2](v15, 6, v19);

    uint64_t v20 = [(PGGraphLocationHelper *)self countyNodesByLocationNode];
    v15[2](v15, 7, v20);

    uint64_t v21 = [(PGGraphLocationHelper *)self stateNodesByLocationNode];
    v15[2](v15, 8, v21);

    long long v22 = [(PGGraphLocationHelper *)self countryNodesByLocationNode];
    v15[2](v15, 9, v22);

    if (v32[3] == a3) {
      id v14 = (id)v26[5];
    }
    else {
      id v14 = 0;
    }

    _Block_object_dispose(&v25, 8);
  }
  _Block_object_dispose(&v31, 8);

  return v14;
}

void __101__PGGraphLocationHelper__parentLocationNodeWithDimension_sourceLocationNodeAsCollection_sourceLabel___block_invoke(void *a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(*(void *)(a1[4] + 8) + 24) < a2 && a1[6] >= a2)
  {
    id v7 = v5;
    BOOL v6 = [v5 targetsForSources:*(void *)(*(void *)(a1[5] + 8) + 40)];
    if ([v6 count] || a1[6] == a2)
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v6);
      *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
    }

    id v5 = v7;
  }
}

- (id)_parentLocationNodeWithDimension:(unint64_t)a3 ofLocationNodeAsCollection:(id)a4
{
  return [(PGGraphLocationHelper *)self _parentLocationNodeWithDimension:a3 sourceLocationNodeAsCollection:a4 sourceLabel:0];
}

- (id)_parentLocationNodeWithDimension:(unint64_t)a3 ofLocationNode:(id)a4
{
  id v6 = a4;
  id v7 = [v6 locationNodeCollection];
  id v8 = [v6 label];

  id v9 = [(PGGraphLocationHelper *)self _parentLocationNodeWithDimension:a3 sourceLocationNodeAsCollection:v7 sourceLabel:v8];

  return v9;
}

- (id)closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 reverse:(BOOL)a5
{
  return [(PGGraphLocationHelper *)self _closestLocationNodeFromLocationNode:a3 withDimension:a4 remapMatchingDimensionBlock:0 reverse:a5];
}

- (id)closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 remapMatchingDimensionBlock:(id)a5
{
  return [(PGGraphLocationHelper *)self _closestLocationNodeFromLocationNode:a3 withDimension:a4 remapMatchingDimensionBlock:a5 reverse:0];
}

- (id)addressNodesByMomentNodeAdjacency
{
  v2 = [(PGGraphLocationHelper *)self addressNodesByMomentNode];
  id v3 = [v2 adjacency];

  return v3;
}

- (id)addressNodesByMomentNode
{
  id v3 = [(PGGraphLocationHelper *)self momentNodesByAddressNode];
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_addressNodes) {
    [(PGGraphLocationHelper *)self _fetchAddressNodes];
  }
  addressNodesByMomentNode = self->_addressNodesByMomentNode;
  if (!addressNodesByMomentNode)
  {
    id v6 = [v3 transposed];
    id v7 = self->_addressNodesByMomentNode;
    self->_addressNodesByMomentNode = v6;

    addressNodesByMomentNode = self->_addressNodesByMomentNode;
  }
  id v8 = addressNodesByMomentNode;
  os_unfair_lock_unlock(p_locationHelperLock);

  return v8;
}

- (id)momentNodesByAddressNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_addressNodes) {
    [(PGGraphLocationHelper *)self _fetchAddressNodes];
  }
  momentNodesByAddressNode = self->_momentNodesByAddressNode;
  if (!momentNodesByAddressNode)
  {
    id v5 = (void *)MEMORY[0x1E4F71E88];
    addressNodes = self->_addressNodes;
    id v7 = +[PGGraphAddressNode momentOfAddress];
    id v8 = [v5 adjacencyWithSources:addressNodes relation:v7 targetsClass:objc_opt_class()];
    id v9 = self->_momentNodesByAddressNode;
    self->_momentNodesByAddressNode = v8;

    momentNodesByAddressNode = self->_momentNodesByAddressNode;
  }
  id v10 = momentNodesByAddressNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v10;
}

- (id)areaNodesByAddressNode
{
  id v3 = [(PGGraphLocationHelper *)self addressNodesByAreaNode];
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_addressNodes) {
    [(PGGraphLocationHelper *)self _fetchAddressNodes];
  }
  areaNodesByAddressNode = self->_areaNodesByAddressNode;
  if (!areaNodesByAddressNode)
  {
    id v6 = [v3 transposed];
    id v7 = self->_areaNodesByAddressNode;
    self->_areaNodesByAddressNode = v6;

    areaNodesByAddressNode = self->_areaNodesByAddressNode;
  }
  id v8 = areaNodesByAddressNode;
  os_unfair_lock_unlock(p_locationHelperLock);

  return v8;
}

- (id)addressNodesByAreaNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_addressNodes) {
    [(PGGraphLocationHelper *)self _fetchAddressNodes];
  }
  addressNodesByAreaNode = self->_addressNodesByAreaNode;
  if (!addressNodesByAreaNode)
  {
    id v5 = (void *)MEMORY[0x1E4F71E88];
    addressNodes = self->_addressNodes;
    id v7 = +[PGGraphAddressNode areaOfAddress];
    id v8 = [v5 adjacencyWithSources:addressNodes relation:v7 targetsClass:objc_opt_class()];
    id v9 = [v8 transposed];
    id v10 = self->_addressNodesByAreaNode;
    self->_addressNodesByAreaNode = v9;

    addressNodesByAreaNode = self->_addressNodesByAreaNode;
  }
  id v11 = addressNodesByAreaNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v11;
}

- (id)addressNodes
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  addressNodes = self->_addressNodes;
  if (!addressNodes)
  {
    [(PGGraphLocationHelper *)self _fetchAddressNodes];
    addressNodes = self->_addressNodes;
  }
  id v5 = addressNodes;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (void)_fetchAddressNodes
{
  id v3 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  addressNodes = self->_addressNodes;
  self->_addressNodes = v3;
}

- (id)numberNodesByLocationNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByNumberNode) {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByNumberNode];
  }
  numberNodesByLocationNode = self->_numberNodesByLocationNode;
  if (!numberNodesByLocationNode)
  {
    id v5 = [(MABinaryAdjacency *)self->_locationNodesByNumberNode transposed];
    id v6 = self->_numberNodesByLocationNode;
    self->_numberNodesByLocationNode = v5;

    numberNodesByLocationNode = self->_numberNodesByLocationNode;
  }
  id v7 = numberNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (id)locationNodesByNumberNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByNumberNode = self->_locationNodesByNumberNode;
  if (!locationNodesByNumberNode)
  {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByNumberNode];
    locationNodesByNumberNode = self->_locationNodesByNumberNode;
  }
  id v5 = locationNodesByNumberNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (void)_fetchLocationNodesByNumberNode
{
  id v3 = (void *)MEMORY[0x1E4F71E88];
  id v8 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  id v4 = +[PGGraphLocationNumberEdge filter];
  id v5 = [v4 inRelation];
  id v6 = [v3 adjacencyWithSources:v8 relation:v5 targetsClass:objc_opt_class()];
  locationNodesByNumberNode = self->_locationNodesByNumberNode;
  self->_locationNodesByNumberNode = v6;
}

- (id)streetNodesByLocationNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByStreetNode) {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByStreetNode];
  }
  streetNodesByLocationNode = self->_streetNodesByLocationNode;
  if (!streetNodesByLocationNode)
  {
    id v5 = [(MABinaryAdjacency *)self->_locationNodesByStreetNode transposed];
    id v6 = self->_streetNodesByLocationNode;
    self->_streetNodesByLocationNode = v5;

    streetNodesByLocationNode = self->_streetNodesByLocationNode;
  }
  id v7 = streetNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (id)locationNodesByStreetNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByStreetNode = self->_locationNodesByStreetNode;
  if (!locationNodesByStreetNode)
  {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByStreetNode];
    locationNodesByStreetNode = self->_locationNodesByStreetNode;
  }
  id v5 = locationNodesByStreetNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (void)_fetchLocationNodesByStreetNode
{
  id v3 = (void *)MEMORY[0x1E4F71E88];
  id v8 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  id v4 = +[PGGraphLocationStreetEdge filter];
  id v5 = [v4 inRelation];
  id v6 = [v3 adjacencyWithSources:v8 relation:v5 targetsClass:objc_opt_class()];
  locationNodesByStreetNode = self->_locationNodesByStreetNode;
  self->_locationNodesByStreetNode = v6;
}

- (id)districtNodesByLocationNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByDistrictNode) {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByDistrictNode];
  }
  districtNodesByLocationNode = self->_districtNodesByLocationNode;
  if (!districtNodesByLocationNode)
  {
    id v5 = [(MABinaryAdjacency *)self->_locationNodesByDistrictNode transposed];
    id v6 = self->_districtNodesByLocationNode;
    self->_districtNodesByLocationNode = v5;

    districtNodesByLocationNode = self->_districtNodesByLocationNode;
  }
  id v7 = districtNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (id)locationNodesByDistrictNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByDistrictNode = self->_locationNodesByDistrictNode;
  if (!locationNodesByDistrictNode)
  {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByDistrictNode];
    locationNodesByDistrictNode = self->_locationNodesByDistrictNode;
  }
  id v5 = locationNodesByDistrictNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (void)_fetchLocationNodesByDistrictNode
{
  id v3 = (void *)MEMORY[0x1E4F71E88];
  id v8 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  id v4 = +[PGGraphLocationDistrictEdge filter];
  id v5 = [v4 inRelation];
  id v6 = [v3 adjacencyWithSources:v8 relation:v5 targetsClass:objc_opt_class()];
  locationNodesByDistrictNode = self->_locationNodesByDistrictNode;
  self->_locationNodesByDistrictNode = v6;
}

- (id)cityNodesByLocationNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByCityNode) {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByCityNode];
  }
  cityNodesByLocationNode = self->_cityNodesByLocationNode;
  if (!cityNodesByLocationNode)
  {
    id v5 = [(MABinaryAdjacency *)self->_locationNodesByCityNode transposed];
    id v6 = self->_cityNodesByLocationNode;
    self->_cityNodesByLocationNode = v5;

    cityNodesByLocationNode = self->_cityNodesByLocationNode;
  }
  id v7 = cityNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (id)locationNodesByCityNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByCityNode = self->_locationNodesByCityNode;
  if (!locationNodesByCityNode)
  {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByCityNode];
    locationNodesByCityNode = self->_locationNodesByCityNode;
  }
  id v5 = locationNodesByCityNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (void)_fetchLocationNodesByCityNode
{
  id v3 = (void *)MEMORY[0x1E4F71E88];
  id v8 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  id v4 = +[PGGraphLocationCityEdge filter];
  id v5 = [v4 inRelation];
  id v6 = [v3 adjacencyWithSources:v8 relation:v5 targetsClass:objc_opt_class()];
  locationNodesByCityNode = self->_locationNodesByCityNode;
  self->_locationNodesByCityNode = v6;
}

- (id)countyNodesByLocationNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByCountyNode) {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByCountyNode];
  }
  countyNodesByLocationNode = self->_countyNodesByLocationNode;
  if (!countyNodesByLocationNode)
  {
    id v5 = [(MABinaryAdjacency *)self->_locationNodesByCountyNode transposed];
    id v6 = self->_countyNodesByLocationNode;
    self->_countyNodesByLocationNode = v5;

    countyNodesByLocationNode = self->_countyNodesByLocationNode;
  }
  id v7 = countyNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (id)locationNodesByCountyNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByCountyNode = self->_locationNodesByCountyNode;
  if (!locationNodesByCountyNode)
  {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByCountyNode];
    locationNodesByCountyNode = self->_locationNodesByCountyNode;
  }
  id v5 = locationNodesByCountyNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (void)_fetchLocationNodesByCountyNode
{
  id v3 = (void *)MEMORY[0x1E4F71E88];
  id v8 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  id v4 = +[PGGraphLocationCountyEdge filter];
  id v5 = [v4 inRelation];
  id v6 = [v3 adjacencyWithSources:v8 relation:v5 targetsClass:objc_opt_class()];
  locationNodesByCountyNode = self->_locationNodesByCountyNode;
  self->_locationNodesByCountyNode = v6;
}

- (id)stateNodeFromAddressNode:(id)a3
{
  return [(PGGraphLocationHelper *)self _parentLocationNodeWithDimension:8 ofLocationNode:a3];
}

- (id)stateNodesByLocationNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByStateNode) {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByStateNode];
  }
  stateNodesByLocationNode = self->_stateNodesByLocationNode;
  if (!stateNodesByLocationNode)
  {
    id v5 = [(MABinaryAdjacency *)self->_locationNodesByStateNode transposed];
    id v6 = self->_stateNodesByLocationNode;
    self->_stateNodesByLocationNode = v5;

    stateNodesByLocationNode = self->_stateNodesByLocationNode;
  }
  id v7 = stateNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (id)locationNodesByStateNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByStateNode = self->_locationNodesByStateNode;
  if (!locationNodesByStateNode)
  {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByStateNode];
    locationNodesByStateNode = self->_locationNodesByStateNode;
  }
  id v5 = locationNodesByStateNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (void)_fetchLocationNodesByStateNode
{
  id v3 = (void *)MEMORY[0x1E4F71E88];
  id v8 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  id v4 = +[PGGraphLocationStateEdge filter];
  id v5 = [v4 inRelation];
  id v6 = [v3 adjacencyWithSources:v8 relation:v5 targetsClass:objc_opt_class()];
  locationNodesByStateNode = self->_locationNodesByStateNode;
  self->_locationNodesByStateNode = v6;
}

- (id)countryNodesByLocationNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByCountryNode) {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByCountryNode];
  }
  countryNodesByLocationNode = self->_countryNodesByLocationNode;
  if (!countryNodesByLocationNode)
  {
    id v5 = [(MABinaryAdjacency *)self->_locationNodesByCountryNode transposed];
    id v6 = self->_countryNodesByLocationNode;
    self->_countryNodesByLocationNode = v5;

    countryNodesByLocationNode = self->_countryNodesByLocationNode;
  }
  id v7 = countryNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (id)locationNodesByCountryNode
{
  p_locationHelperLocuint64_t k = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByCountryNode = self->_locationNodesByCountryNode;
  if (!locationNodesByCountryNode)
  {
    [(PGGraphLocationHelper *)self _fetchLocationNodesByCountryNode];
    locationNodesByCountryNode = self->_locationNodesByCountryNode;
  }
  id v5 = locationNodesByCountryNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (void)_fetchLocationNodesByCountryNode
{
  id v3 = (void *)MEMORY[0x1E4F71E88];
  id v8 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  id v4 = +[PGGraphLocationCountryEdge filter];
  id v5 = [v4 inRelation];
  id v6 = [v3 adjacencyWithSources:v8 relation:v5 targetsClass:objc_opt_class()];
  locationNodesByCountryNode = self->_locationNodesByCountryNode;
  self->_locationNodesByCountryNode = v6;
}

- (PGGraphLocationHelper)initWithGraph:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphLocationHelper;
  id v6 = [(PGGraphLocationHelper *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graph, a3);
    v7->_locationHelperLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (id)inefficientLocationHelper
{
  v2 = objc_alloc_init(PGGraphLegacyLocationHelper);
  return v2;
}

@end