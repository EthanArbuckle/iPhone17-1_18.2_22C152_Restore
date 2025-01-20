@interface PLRevGeoPlace
+ (BOOL)supportsSecureCoding;
+ (id)_newFilterSortedPlaceInfos:(id)a3 usingPlaceAnnotation:(id)a4 outFoundOrderType:(unint64_t *)a5 outPreviousOrderType:(unint64_t *)a6;
+ (id)placeWithMapItem:(id)a3 placeAnnotation:(id)a4;
+ (unint64_t)_dominantOrderTypeForPlaceType:(id)a3 lastOrderType:(unint64_t)a4;
- (NSDictionary)placeInfosForOrderType;
- (PLRevGeoPlace)initWithCoder:(id)a3;
- (PLRevGeoPlace)initWithPlaceInfosForOrderType:(id)a3;
- (id)bestPlaceInfoForOrderType:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLRevGeoPlace

- (void).cxx_destruct
{
}

- (NSDictionary)placeInfosForOrderType
{
  return self->_placeInfosForOrderType;
}

- (PLRevGeoPlace)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:PLRevGeoPlacePlaceInfosMapKey];

  if (v8)
  {
    self = [(PLRevGeoPlace *)self initWithPlaceInfosForOrderType:v8];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)bestPlaceInfoForOrderType:(unint64_t)a3
{
  placeInfosForOrderType = self->_placeInfosForOrderType;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSDictionary *)placeInfosForOrderType objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 firstObject];

  return v6;
}

- (PLRevGeoPlace)initWithPlaceInfosForOrderType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLRevGeoPlace;
  uint64_t v6 = [(PLRevGeoPlace *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_placeInfosForOrderType, a3);
  }

  return v7;
}

+ (unint64_t)_dominantOrderTypeForPlaceType:(id)a3 lastOrderType:(unint64_t)a4
{
  int v5 = [a3 intValue];
  unint64_t result = 0;
  switch(v5)
  {
    case 1:
      unint64_t result = 12;
      break;
    case 2:
      unint64_t result = 10;
      break;
    case 3:
      unint64_t result = 7;
      break;
    case 4:
      unint64_t result = 5;
      break;
    case 6:
      unint64_t v7 = 3;
      unint64_t v8 = 6;
      if (a4 >= 7) {
        unint64_t v8 = 8 * (a4 < 0xA);
      }
      BOOL v11 = a4 >= 5;
      goto LABEL_17;
    case 7:
      unint64_t result = 14;
      break;
    case 8:
    case 9:
    case 10:
    case 11:
      unint64_t v7 = 1;
      unint64_t v8 = 4;
      uint64_t v9 = 9;
      uint64_t v10 = 14;
      if (a4 <= 0xB) {
        uint64_t v10 = 0;
      }
      if (a4 >= 0xA) {
        uint64_t v9 = v10;
      }
      if (a4 >= 5) {
        unint64_t v8 = v9;
      }
      BOOL v11 = a4 >= 3;
LABEL_17:
      if (v11) {
        unint64_t result = v8;
      }
      else {
        unint64_t result = v7;
      }
      break;
    case 12:
    case 15:
      unint64_t result = 2;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)placeWithMapItem:(id)a3 placeAnnotation:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v34 = a4;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__112556;
  v57 = __Block_byref_object_dispose__112557;
  id v58 = [MEMORY[0x1E4F1CA60] dictionary];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __50__PLRevGeoPlace_placeWithMapItem_placeAnnotation___block_invoke;
  v52[3] = &unk_1E5875260;
  v52[4] = &v53;
  uint64_t v6 = (void (**)(void, void, void))MEMORY[0x19F38D650](v52);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __50__PLRevGeoPlace_placeWithMapItem_placeAnnotation___block_invoke_2;
  v51[3] = &unk_1E5875288;
  v51[4] = &v53;
  v35 = (void (**)(void, void, void))MEMORY[0x19F38D650](v51);
  unint64_t v50 = 0;
  unint64_t v7 = [v36 sortedPlaceInfos];
  BOOL v8 = [v7 count] == 0;

  if (v8)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v19 = [v36 backupPlaceInfos];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v60 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          unint64_t v24 = v50;
          if (v24 <= [v23 dominantOrderType]) {
            ((void (**)(void, void *, uint64_t))v6)[2](v6, v23, [v23 dominantOrderType]);
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v60 count:16];
      }
      while (v20);
    }
  }
  else
  {
    uint64_t v49 = 0;
    uint64_t v9 = [v36 sortedPlaceInfos];
    id v10 = +[PLRevGeoPlace _newFilterSortedPlaceInfos:v9 usingPlaceAnnotation:v34 outFoundOrderType:&v50 outPreviousOrderType:&v49];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v61 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v46 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          v16 = [v15 placeType];
          uint64_t v17 = [a1 _dominantOrderTypeForPlaceType:v16 lastOrderType:v49];

          ((void (**)(void, void *, uint64_t))v6)[2](v6, v15, v17);
          uint64_t v49 = v17;
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v61 count:16];
      }
      while (v12);
    }

    v18 = [(id)v54[5] objectForKeyedSubscript:&unk_1EEBF0B90];
    ((void (**)(void, void *, uint64_t))v35)[2](v35, v18, 1);
    ((void (**)(void, void *, uint64_t))v35)[2](v35, v18, 3);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v25 = [v36 finalPlaceInfos];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v59 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v25);
        }
        v29 = *(void **)(*((void *)&v37 + 1) + 8 * k);
        unint64_t v30 = v50;
        if (v30 <= [v29 dominantOrderType]) {
          ((void (**)(void, void *, uint64_t))v6)[2](v6, v29, [v29 dominantOrderType]);
        }
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v59 count:16];
    }
    while (v26);
  }

  v31 = [PLRevGeoPlace alloc];
  v32 = [(PLRevGeoPlace *)v31 initWithPlaceInfosForOrderType:v54[5]];

  _Block_object_dispose(&v53, 8);
  return v32;
}

void __50__PLRevGeoPlace_placeWithMapItem_placeAnnotation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v18 = v5;
    uint64_t v6 = [v5 name];
    uint64_t v7 = [v6 length];

    id v5 = v18;
    if (v7)
    {
      BOOL v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
      id v10 = [v8 objectForKeyedSubscript:v9];

      if (!v10)
      {
        id v10 = [MEMORY[0x1E4F1CA48] array];
        id v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        uint64_t v12 = [NSNumber numberWithUnsignedInteger:a3];
        [v11 setObject:v10 forKeyedSubscript:v12];
      }
      uint64_t v13 = [v18 name];
      uint64_t v14 = _placeInfosIndexOfPlaceInfoWithName(v10, v13);

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = [PLRevGeoPlaceInfo alloc];
        v16 = [v18 name];
        uint64_t v17 = [(PLRevGeoPlaceInfo *)v15 initWithPlaceName:v16];

        [v10 addObject:v17];
      }
      else
      {
        uint64_t v17 = [v10 objectAtIndex:v14];
      }
      [v18 areaInSquareMeters];
      -[PLRevGeoPlaceInfo addPlaceInfoArea:](v17, "addPlaceInfoArea:");

      id v5 = v18;
    }
  }
}

void __50__PLRevGeoPlace_placeWithMapItem_placeAnnotation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  BOOL v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "placeName", (void)v16);
          uint64_t v15 = _placeInfosIndexOfPlaceInfoWithName(v8, v14);
          if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
            [v8 removeObjectAtIndex:v15];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

+ (id)_newFilterSortedPlaceInfos:(id)a3 usingPlaceAnnotation:(id)a4 outFoundOrderType:(unint64_t *)a5 outPreviousOrderType:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  int v12 = [v11 placeLevel];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __104__PLRevGeoPlace__newFilterSortedPlaceInfos_usingPlaceAnnotation_outFoundOrderType_outPreviousOrderType___block_invoke;
  v19[3] = &unk_1E5875238;
  v19[4] = &v21;
  v19[5] = a1;
  int v20 = v12;
  v19[6] = a5;
  uint64_t v13 = [v10 indexOfObjectPassingTest:v19];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = v10;
  }
  else
  {
    uint64_t v15 = [v10 count];
    id v16 = objc_alloc(MEMORY[0x1E4F1C978]);
    long long v17 = objc_msgSend(v10, "subarrayWithRange:", v13, v15 - v13);
    id v14 = (id)[v16 initWithArray:v17];

    if (a6) {
      *a6 = v22[3];
    }
  }
  _Block_object_dispose(&v21, 8);

  return v14;
}

BOOL __104__PLRevGeoPlace__newFilterSortedPlaceInfos_usingPlaceAnnotation_outFoundOrderType_outPreviousOrderType___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = a2;
  BOOL v8 = [v7 placeType];
  uint64_t v9 = [v6 _dominantOrderTypeForPlaceType:v8 lastOrderType:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

  id v10 = [v7 placeType];

  int v11 = [v10 intValue];
  int v12 = *(_DWORD *)(a1 + 56);

  if (v11 == v12)
  {
    uint64_t v13 = *(uint64_t **)(a1 + 48);
    if (v13) {
      *uint64_t v13 = v9;
    }
    *a4 = 1;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9;
  }
  return v11 == v12;
}

@end