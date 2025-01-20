@interface PGIncompleteLocationResolver
+ (double)_maxDistanceForDimension:(unint64_t)a3;
- (NSMutableDictionary)resolvedLocationNodesCache;
- (NSSet)addressNodes;
- (PGIncompleteLocationResolver)initWithAddressNodes:(id)a3 locationHelper:(id)a4;
- (id)_resolveIdentifierForIncompleteAddressNode:(id)a3 withTargetDimension:(unint64_t)a4;
- (id)_resolvedAddressForIncompleteAddress:(id)a3 withTargetDimension:(unint64_t)a4 resolvedDimension:(unint64_t *)a5 resolvedLocation:(id *)a6 addresses:(id)a7;
- (id)_resolvedAddressForIncompleteAddress:(id)a3 withTargetDimension:(unint64_t)a4 resolvedDimension:(unint64_t *)a5 resolvedLocation:(id *)a6 sortedAddresses:(id)a7;
- (id)_resolvedLocationNodeForIncompleteAddressNode:(id)a3 withTargetDimension:(unint64_t)a4 resolvedDimension:(unint64_t *)a5 continueResolvingHigherDimensions:(BOOL)a6;
- (id)resolvedLocationNodeForIncompleteAddressNode:(id)a3 withPreferredTargetDimension:(unint64_t)a4 resolvedDimension:(unint64_t *)a5;
- (id)resolvedLocationNodeForIncompleteAddressNode:(id)a3 withTargetDimension:(unint64_t)a4;
- (void)setAddressNodes:(id)a3;
- (void)setResolvedLocationNodesCache:(id)a3;
@end

@implementation PGIncompleteLocationResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedLocationNodesCache, 0);
  objc_storeStrong((id *)&self->_addressNodes, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
}

- (void)setResolvedLocationNodesCache:(id)a3
{
}

- (NSMutableDictionary)resolvedLocationNodesCache
{
  return self->_resolvedLocationNodesCache;
}

- (void)setAddressNodes:(id)a3
{
}

- (NSSet)addressNodes
{
  return self->_addressNodes;
}

- (id)_resolvedAddressForIncompleteAddress:(id)a3 withTargetDimension:(unint64_t)a4 resolvedDimension:(unint64_t *)a5 resolvedLocation:(id *)a6 addresses:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  v34 = self;
  [(id)objc_opt_class() _maxDistanceForDimension:a4];
  double v15 = v14;
  [v12 coordinate];
  uint64_t v39 = v16;
  uint64_t v40 = v17;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v18 = v13;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    v31 = a6;
    v32 = a5;
    uint64_t v21 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ((objc_msgSend(v23, "isSameNodeAsNode:", v12, v31) & 1) == 0)
        {
          [v23 coordinate];
          if (CLLocationCoordinate2DIsValid(v44))
          {
            CLLocationCoordinate2DGetDistanceFrom();
            if (v24 <= v15)
            {
              v25 = [(PGGraphLocationHelper *)v34->_locationHelper closestLocationNodeFromLocationNode:v23 withDimension:a4 reverse:0];
              v26 = [v25 label];
              unint64_t v27 = +[PGCommonTitleUtility dimensionForLabel:v26];

              if (v27 == a4)
              {
                id v28 = v23;
                id v29 = v25;
                id *v31 = v29;
                if (v32) {
                  unint64_t *v32 = a4;
                }

                goto LABEL_19;
              }
            }
            else if (isKindOfClass)
            {
              goto LABEL_15;
            }
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_15:
  id v28 = 0;
LABEL_19:

  return v28;
}

- (id)_resolvedAddressForIncompleteAddress:(id)a3 withTargetDimension:(unint64_t)a4 resolvedDimension:(unint64_t *)a5 resolvedLocation:(id *)a6 sortedAddresses:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  double v14 = [(PGIncompleteLocationResolver *)self _resolvedAddressForIncompleteAddress:v12 withTargetDimension:a4 resolvedDimension:a5 resolvedLocation:a6 addresses:v13];
  if (!v14)
  {
    double v15 = [v12 graph];
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v17 = [v15 nodesForLabel:@"Address" domain:200];
    id v18 = [v16 setWithSet:v17];

    if (v13 && [v13 count])
    {
      uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
      [v18 minusSet:v19];
    }
    double v14 = [(PGIncompleteLocationResolver *)self _resolvedAddressForIncompleteAddress:v12 withTargetDimension:a4 resolvedDimension:a5 resolvedLocation:a6 addresses:v18];
  }
  return v14;
}

- (id)_resolvedLocationNodeForIncompleteAddressNode:(id)a3 withTargetDimension:(unint64_t)a4 resolvedDimension:(unint64_t *)a5 continueResolvingHigherDimensions:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = [(PGIncompleteLocationResolver *)self _resolveIdentifierForIncompleteAddressNode:v10 withTargetDimension:a4];
  uint64_t v12 = [(NSMutableDictionary *)self->_resolvedLocationNodesCache objectForKeyedSubscript:v11];
  if (v12)
  {
    id v13 = (void *)v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      id v13 = 0;
    }
    uint64_t v14 = [v13 label];
    double v15 = (void *)v14;
    if (a5 && v14) {
      *a5 = +[PGCommonTitleUtility dimensionForLabel:v14];
    }
    id v16 = v13;

LABEL_35:
    goto LABEL_36;
  }
  [v10 coordinate];
  CLLocationDegrees latitude = v44.latitude;
  CLLocationDegrees longitude = v44.longitude;
  if (CLLocationCoordinate2DIsValid(v44))
  {
    v34 = a5;
    uint64_t v19 = [(NSSet *)self->_addressNodes allObjects];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __150__PGIncompleteLocationResolver__resolvedLocationNodeForIncompleteAddressNode_withTargetDimension_resolvedDimension_continueResolvingHigherDimensions___block_invoke;
    v37[3] = &__block_descriptor_48_e51_q24__0__PGGraphAddressNode_8__PGGraphAddressNode_16l;
    *(CLLocationDegrees *)&v37[4] = latitude;
    *(CLLocationDegrees *)&v37[5] = longitude;
    uint64_t v20 = [v19 sortedArrayUsingComparator:v37];

    id v21 = 0;
    unint64_t v36 = 0;
    int v22 = !v6;
    unint64_t v23 = a4;
    do
    {
      unint64_t v24 = v23;
      v25 = v21;
      id v35 = v21;
      v26 = [(PGIncompleteLocationResolver *)self _resolvedAddressForIncompleteAddress:v10 withTargetDimension:v23 resolvedDimension:&v36 resolvedLocation:&v35 sortedAddresses:v20];
      id v21 = v35;

      unint64_t v23 = v24 + 1;
      if (v24 + 1 <= 9 && v26 == 0) {
        int v28 = v22;
      }
      else {
        int v28 = 1;
      }
    }
    while (v28 != 1);
    if ([v26 isSameNodeAsNode:v10])
    {
    }
    else if (v21)
    {
LABEL_23:
      if (v24 >= a4)
      {
        v30 = MEMORY[0x1E4F14500];
        do
        {
          v31 = v11;
          v11 = [(PGIncompleteLocationResolver *)self _resolveIdentifierForIncompleteAddressNode:v10 withTargetDimension:v24];

          if (v21 && v24 == v36)
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138478083;
              id v39 = v10;
              __int16 v40 = 2113;
              id v41 = v21;
              _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "Resolved incomplete address %{private}@ to location %{private}@", buf, 0x16u);
            }
            [(NSMutableDictionary *)self->_resolvedLocationNodesCache setObject:v21 forKeyedSubscript:v11];
          }
          else
          {
            v32 = [MEMORY[0x1E4F1CA98] null];
            [(NSMutableDictionary *)self->_resolvedLocationNodesCache setObject:v32 forKeyedSubscript:v11];
          }
          --v24;
        }
        while (v24 >= a4);
      }
      if (v34) {
        unint64_t *v34 = v36;
      }
      id v16 = v21;

      goto LABEL_35;
    }
    id v21 = 0;
    unint64_t v36 = 0;
    goto LABEL_23;
  }
  id v29 = [MEMORY[0x1E4F1CA98] null];
  [(NSMutableDictionary *)self->_resolvedLocationNodesCache setObject:v29 forKeyedSubscript:v11];

  id v16 = 0;
  if (a5) {
    *a5 = 0;
  }
LABEL_36:

  return v16;
}

uint64_t __150__PGIncompleteLocationResolver__resolvedLocationNodeForIncompleteAddressNode_withTargetDimension_resolvedDimension_continueResolvingHigherDimensions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 coordinate];
  CLLocationDegrees v6 = v5;
  CLLocationDegrees v8 = v7;
  [v4 coordinate];
  CLLocationDegrees v10 = v9;
  CLLocationDegrees v12 = v11;

  v20.CLLocationDegrees latitude = v6;
  v20.CLLocationDegrees longitude = v8;
  BOOL v13 = CLLocationCoordinate2DIsValid(v20);
  v21.CLLocationDegrees latitude = v10;
  v21.CLLocationDegrees longitude = v12;
  BOOL v14 = CLLocationCoordinate2DIsValid(v21);
  if (!v13 && !v14) {
    return 0;
  }
  if (!v13 && v14) {
    return 1;
  }
  if (v13 && !v14) {
    return -1;
  }
  CLLocationCoordinate2DGetDistanceFrom();
  double v17 = v16;
  CLLocationCoordinate2DGetDistanceFrom();
  if (v18 <= v17) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = -1;
  }
  if (v17 > v18) {
    return 1;
  }
  else {
    return v19;
  }
}

- (id)resolvedLocationNodeForIncompleteAddressNode:(id)a3 withPreferredTargetDimension:(unint64_t)a4 resolvedDimension:(unint64_t *)a5
{
  return [(PGIncompleteLocationResolver *)self _resolvedLocationNodeForIncompleteAddressNode:a3 withTargetDimension:a4 resolvedDimension:a5 continueResolvingHigherDimensions:1];
}

- (id)resolvedLocationNodeForIncompleteAddressNode:(id)a3 withTargetDimension:(unint64_t)a4
{
  return [(PGIncompleteLocationResolver *)self _resolvedLocationNodeForIncompleteAddressNode:a3 withTargetDimension:a4 resolvedDimension:0 continueResolvingHigherDimensions:0];
}

- (id)_resolveIdentifierForIncompleteAddressNode:(id)a3 withTargetDimension:(unint64_t)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu-%lu", objc_msgSend(a3, "identifier"), a4);
}

- (PGIncompleteLocationResolver)initWithAddressNodes:(id)a3 locationHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGIncompleteLocationResolver;
  double v9 = [(PGIncompleteLocationResolver *)&v14 init];
  CLLocationDegrees v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_addressNodes, a3);
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    resolvedLocationNodesCache = v10->_resolvedLocationNodesCache;
    v10->_resolvedLocationNodesCache = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v10->_locationHelper, a4);
  }

  return v10;
}

+ (double)_maxDistanceForDimension:(unint64_t)a3
{
  double result = 0.0;
  if (a3 - 6 <= 3) {
    return dbl_1D1F4F8A0[a3 - 6];
  }
  return result;
}

@end