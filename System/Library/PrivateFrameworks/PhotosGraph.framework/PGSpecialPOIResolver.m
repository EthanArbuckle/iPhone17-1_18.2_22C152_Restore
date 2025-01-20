@interface PGSpecialPOIResolver
+ (BOOL)specialPOIContainsCoordinate:(CLLocationCoordinate2D)a3;
+ (BOOL)specialPOINameIsInString:(id)a3;
+ (id)_nameBySpecialPOI;
+ (id)_regionsBySpecialPOI;
+ (unint64_t)specialPOIsContainingCoordinate:(CLLocationCoordinate2D)a3;
+ (unint64_t)specialPOIsWithNameInString:(id)a3;
- (BOOL)anyMomentContainsSpecialPOI:(unint64_t)a3;
- (BOOL)anyMomentHasPOIAmusementPark;
- (BOOL)momentsContainSpecialPOI:(unint64_t)a3 withMomentRatio:(double)a4;
- (NSArray)momentNodes;
- (NSMutableDictionary)countBySpecialPOI;
- (PGSpecialPOIResolver)initWithMomentNodes:(id)a3;
- (unint64_t)_numberOfMomentsInRegions:(id)a3 containingAOIName:(id)a4;
- (unint64_t)_numberOfMomentsMatchingSpecialPOI:(unint64_t)a3;
- (unint64_t)specialPOIsInAnyMoment;
- (unint64_t)specialPOIsWithMomentRatio:(double)a3;
- (void)setCountBySpecialPOI:(id)a3;
@end

@implementation PGSpecialPOIResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countBySpecialPOI, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
}

- (void)setCountBySpecialPOI:(id)a3
{
}

- (NSMutableDictionary)countBySpecialPOI
{
  return self->_countBySpecialPOI;
}

- (NSArray)momentNodes
{
  return self->_momentNodes;
}

- (unint64_t)_numberOfMomentsInRegions:(id)a3 containingAOIName:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_momentNodes;
  uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = [*(id *)(*((void *)&v20 + 1) + 8 * v10) collection];
        v12 = [v11 addressNodes];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __68__PGSpecialPOIResolver__numberOfMomentsInRegions_containingAOIName___block_invoke;
        v16[3] = &unk_1E68EE498;
        id v17 = v7;
        id v18 = v6;
        v19 = &v24;
        [v12 enumerateNodesUsingBlock:v16];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }

  unint64_t v13 = v25[3];
  _Block_object_dispose(&v24, 8);

  return v13;
}

void __68__PGSpecialPOIResolver__numberOfMomentsInRegions_containingAOIName___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v6 = [v5 collection];
  id v7 = [v6 areaNodes];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__PGSpecialPOIResolver__numberOfMomentsInRegions_containingAOIName___block_invoke_2;
  v17[3] = &unk_1E68EE470;
  id v18 = *(id *)(a1 + 32);
  v19 = &v20;
  [v7 enumerateNodesUsingBlock:v17];

  if (*((unsigned char *)v21 + 24))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_msgSend(v5, "coordinate", (void)v13);
          if (objc_msgSend(v12, "containsCoordinate:"))
          {
            ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
            *a3 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  _Block_object_dispose(&v20, 8);
}

void __68__PGSpecialPOIResolver__numberOfMomentsInRegions_containingAOIName___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 name];
  id v6 = [v5 lowercaseString];
  int v7 = [v6 containsString:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (unint64_t)_numberOfMomentsMatchingSpecialPOI:(unint64_t)a3
{
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSMutableDictionary *)self->_countBySpecialPOI objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = +[PGSpecialPOIResolver _regionsBySpecialPOI];
    int v7 = [v6 objectForKeyedSubscript:v4];

    id v8 = +[PGSpecialPOIResolver _nameBySpecialPOI];
    uint64_t v9 = [v8 objectForKeyedSubscript:v4];

    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGSpecialPOIResolver _numberOfMomentsInRegions:containingAOIName:](self, "_numberOfMomentsInRegions:containingAOIName:", v7, v9));
    [(NSMutableDictionary *)self->_countBySpecialPOI setObject:v5 forKeyedSubscript:v4];
  }
  unint64_t v10 = [v5 unsignedIntegerValue];

  return v10;
}

- (BOOL)anyMomentHasPOIAmusementPark
{
  if ([(PGSpecialPOIResolver *)self anyMomentContainsSpecialPOI:1]) {
    return 1;
  }
  return [(PGSpecialPOIResolver *)self anyMomentContainsSpecialPOI:2];
}

- (unint64_t)specialPOIsWithMomentRatio:(double)a3
{
  unint64_t v5 = 0;
  unint64_t v6 = 1;
  do
  {
    if ([(PGSpecialPOIResolver *)self momentsContainSpecialPOI:v6 withMomentRatio:a3])
    {
      unint64_t v7 = v6;
    }
    else
    {
      unint64_t v7 = 0;
    }
    v5 |= v7;
    BOOL v8 = v6 >= 2;
    v6 *= 2;
  }
  while (!v8);
  return v5;
}

- (unint64_t)specialPOIsInAnyMoment
{
  unint64_t v3 = 0;
  unint64_t v4 = 1;
  do
  {
    if ([(PGSpecialPOIResolver *)self anyMomentContainsSpecialPOI:v4]) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    v3 |= v5;
    BOOL v6 = v4 >= 2;
    v4 *= 2;
  }
  while (!v6);
  return v3;
}

- (BOOL)momentsContainSpecialPOI:(unint64_t)a3 withMomentRatio:(double)a4
{
  double v6 = (double)[(PGSpecialPOIResolver *)self _numberOfMomentsMatchingSpecialPOI:a3];
  return v6 / (double)[(NSArray *)self->_momentNodes count] >= a4;
}

- (BOOL)anyMomentContainsSpecialPOI:(unint64_t)a3
{
  return [(PGSpecialPOIResolver *)self _numberOfMomentsMatchingSpecialPOI:a3] != 0;
}

- (PGSpecialPOIResolver)initWithMomentNodes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSpecialPOIResolver;
  double v6 = [(PGSpecialPOIResolver *)&v9 init];
  unint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_momentNodes, a3);
  }

  return v7;
}

+ (id)_nameBySpecialPOI
{
  if (_nameBySpecialPOI_onceToken != -1) {
    dispatch_once(&_nameBySpecialPOI_onceToken, &__block_literal_global_262_63399);
  }
  v2 = (void *)_nameBySpecialPOI_nameBySpecialPOI;
  return v2;
}

void __41__PGSpecialPOIResolver__nameBySpecialPOI__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F28D2AD8;
  v2[1] = &unk_1F28D2AF0;
  v3[0] = @"disney";
  v3[1] = @"universal";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)_nameBySpecialPOI_nameBySpecialPOI;
  _nameBySpecialPOI_nameBySpecialPOI = v0;
}

+ (id)_regionsBySpecialPOI
{
  if (_regionsBySpecialPOI_onceToken != -1) {
    dispatch_once(&_regionsBySpecialPOI_onceToken, &__block_literal_global_63413);
  }
  v2 = (void *)_regionsBySpecialPOI_regionsBySpecialPOI;
  return v2;
}

void __44__PGSpecialPOIResolver__regionsBySpecialPOI__block_invoke()
{
  v31[6] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  CLLocationCoordinate2D v1 = CLLocationCoordinate2DMake(28.3826407, -81.5640857);
  v2 = objc_msgSend(v0, "initWithCenter:radius:identifier:", @"DisneyOrlando", v1.latitude, v1.longitude, 5740.0);
  v31[0] = v2;
  id v3 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(33.8103178, -117.922078);
  id v5 = objc_msgSend(v3, "initWithCenter:radius:identifier:", @"DisneyAnaheim", v4.latitude, v4.longitude, 820.0);
  v31[1] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  CLLocationCoordinate2D v7 = CLLocationCoordinate2DMake(48.8687234, 2.7833537);
  BOOL v8 = objc_msgSend(v6, "initWithCenter:radius:identifier:", @"DisneyParis", v7.latitude, v7.longitude, 1110.0);
  v31[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(35.6296051, 139.881228);
  v11 = objc_msgSend(v9, "initWithCenter:radius:identifier:", @"DisneyTokyo", v10.latitude, v10.longitude, 1050.0);
  v31[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(22.3143489, 114.040808);
  long long v14 = objc_msgSend(v12, "initWithCenter:radius:identifier:", @"DisneyHongkong", v13.latitude, v13.longitude, 1090.0);
  v31[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(31.1416439, 121.664522);
  id v17 = objc_msgSend(v15, "initWithCenter:radius:identifier:", @"DisneyShanghai", v16.latitude, v16.longitude, 1290.0);
  v31[5] = v17;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:6];

  id v19 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  CLLocationCoordinate2D v20 = CLLocationCoordinate2DMake(28.4712567, -81.4676208);
  long long v21 = objc_msgSend(v19, "initWithCenter:radius:identifier:", @"UniversalOrlando", v20.latitude, v20.longitude, 1440.0);
  v30[0] = v21;
  id v22 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  CLLocationCoordinate2D v23 = CLLocationCoordinate2DMake(34.1391594, -118.353077);
  uint64_t v24 = objc_msgSend(v22, "initWithCenter:radius:identifier:", @"UniversalHolywood", v23.latitude, v23.longitude, 780.0);
  v30[1] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];

  v28[0] = &unk_1F28D2AD8;
  v28[1] = &unk_1F28D2AF0;
  v29[0] = v18;
  v29[1] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  uint64_t v27 = (void *)_regionsBySpecialPOI_regionsBySpecialPOI;
  _regionsBySpecialPOI_regionsBySpecialPOI = v26;
}

+ (unint64_t)specialPOIsWithNameInString:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  CLLocationCoordinate2D v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = [a1 _nameBySpecialPOI];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PGSpecialPOIResolver_specialPOIsWithNameInString___block_invoke;
  v9[3] = &unk_1E68EE448;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__PGSpecialPOIResolver_specialPOIsWithNameInString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsString:a3]) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v5 unsignedIntegerValue];
  }
}

+ (BOOL)specialPOINameIsInString:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(a1, "_nameBySpecialPOI", 0);
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if ([v4 containsString:*(void *)(*((void *)&v11 + 1) + 8 * i)])
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (unint64_t)specialPOIsContainingCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v5 = [a1 _regionsBySpecialPOI];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PGSpecialPOIResolver_specialPOIsContainingCoordinate___block_invoke;
  v8[3] = &unk_1E68EE420;
  *(CLLocationDegrees *)&v8[5] = latitude;
  *(CLLocationDegrees *)&v8[6] = longitude;
  v8[4] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __56__PGSpecialPOIResolver_specialPOIsContainingCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "containsCoordinate:", *(double *)(a1 + 40), *(double *)(a1 + 48), (void)v11))
        {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= [v5 unsignedIntegerValue];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

+ (BOOL)specialPOIContainsCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [a1 _regionsBySpecialPOI];
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              if (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "containsCoordinate:", latitude, longitude))
              {

                BOOL v17 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      BOOL v17 = 0;
    }
    while (v8);
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_19:

  return v17;
}

@end