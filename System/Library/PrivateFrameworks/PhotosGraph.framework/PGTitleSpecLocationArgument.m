@interface PGTitleSpecLocationArgument
+ (id)argumentWithLocationType:(unint64_t)a3 filterLocations:(BOOL)a4;
+ (id)argumentWithLocationTypeLocationForLocationName:(id)a3;
- (BOOL)filterLocations;
- (NSSet)usedLocationNodes;
- (NSString)locationName;
- (PGTitleSpecLocationArgument)initWithLocationType:(unint64_t)a3 filterLocations:(BOOL)a4;
- (id)_generateBusinessItemTitleWithMomentNodes:(id)a3 locationHelper:(id)a4 serviceManager:(id)a5;
- (id)_generateLocationTitleWithOptions:(id)a3 locationHelper:(id)a4 serviceManager:(id)a5;
- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4;
- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5;
- (unint64_t)lineBreakBehavior;
- (unint64_t)type;
- (void)setLineBreakBehavior:(unint64_t)a3;
- (void)setLocationName:(id)a3;
- (void)setUsedLocationNodes:(id)a3;
@end

@implementation PGTitleSpecLocationArgument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_usedLocationNodes, 0);
}

- (void)setLocationName:(id)a3
{
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void)setLineBreakBehavior:(unint64_t)a3
{
  self->_lineBreakBehavior = a3;
}

- (unint64_t)lineBreakBehavior
{
  return self->_lineBreakBehavior;
}

- (void)setUsedLocationNodes:(id)a3
{
}

- (NSSet)usedLocationNodes
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)filterLocations
{
  return self->_filterLocations;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)_generateLocationTitleWithOptions:(id)a3 locationHelper:(id)a4 serviceManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7575;
  v18 = __Block_byref_object_dispose__7576;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__PGTitleSpecLocationArgument__generateLocationTitleWithOptions_locationHelper_serviceManager___block_invoke;
  v13[3] = &unk_1E68EE790;
  v13[4] = self;
  v13[5] = &v14;
  +[PGLocationTitleUtility generateLocationTitleWithOptions:v8 locationHelper:v9 serviceManager:v10 result:v13];
  if ([(id)v15[5] length]) {
    id v11 = (id)v15[5];
  }
  else {
    id v11 = 0;
  }
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __95__PGTitleSpecLocationArgument__generateLocationTitleWithOptions_locationHelper_serviceManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  [*(id *)(a1 + 32) setUsedLocationNodes:v7];
}

- (id)_generateBusinessItemTitleWithMomentNodes:(id)a3 locationHelper:(id)a4 serviceManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(PGLocationTitleOptions);
  [(PGLocationTitleOptions *)v11 setUseBusinessItems:1];
  [(PGLocationTitleOptions *)v11 setAoiDisplayType:0];
  [(PGLocationTitleOptions *)v11 setUseCities:0];
  [(PGLocationTitleOptions *)v11 setPeopleDisplayType:0];
  [(PGLocationTitleOptions *)v11 setLineBreakBehavior:self->_lineBreakBehavior];
  [(PGLocationTitleOptions *)v11 setMomentNodes:v10];

  v12 = [(PGTitleSpecLocationArgument *)self _generateLocationTitleWithOptions:v11 locationHelper:v9 serviceManager:v8];

  return v12;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v32 = a4;
  v36 = v8;
  id v37 = a5;
  unint64_t type = self->_type;
  if (type == 512)
  {
    if ([(NSString *)self->_locationName length])
    {
      id v10 = self->_locationName;
      goto LABEL_43;
    }
    unint64_t type = self->_type;
  }
  v34 = self;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__7575;
  v49 = __Block_byref_object_dispose__7576;
  id v50 = 0;
  id v11 = [v8 anyObject];
  v33 = [v11 graph];

  v12 = [v37 locationHelper];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v32;
  uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (!v13) {
    goto LABEL_42;
  }
  uint64_t v14 = *(void *)v42;
  v31 = v39;
  char v15 = 1;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v42 != v14) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      uint64_t v18 = objc_msgSend(v17, "type", v31);
      if ((type & 2) != 0 && v18 == 17)
      {
        id v19 = [v37 serviceManager];
        uint64_t v20 = [(PGTitleSpecLocationArgument *)v34 _generateBusinessItemTitleWithMomentNodes:v36 locationHelper:v12 serviceManager:v19];
        v21 = (void *)v46[5];
        v46[5] = v20;

        goto LABEL_38;
      }
      if ((type & 4) != 0 && v18 == 8)
      {
        id v19 = [v17 nodeInGraph:v33];
        uint64_t v22 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v19 locationHelper:v12];
        v23 = (void *)v46[5];
        v46[5] = v22;

        goto LABEL_38;
      }
      if (type)
      {
        if (v18 == 8 || v18 == 4)
        {
          id v19 = [v17 nodeInGraph:v33];
          uint64_t v25 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v19 locationHelper:v12];
          v26 = (void *)v46[5];
          v46[5] = v25;

          if ([(id)v46[5] length]) {
            BOOL v27 = (type & 4) == 0;
          }
          else {
            BOOL v27 = 1;
          }
          char v15 = v27;
        }
        else
        {
LABEL_30:
          if ([v17 type] != 7) {
            goto LABEL_39;
          }
          id v19 = +[PGLocationTitleOptions onlyPeopleLocationTitleOptions];
          [v19 setLineBreakBehavior:v34->_lineBreakBehavior];
          [v19 setMomentNodes:v36];
          if ((type & 0x30) != 0)
          {
            if ((type & 0x20) != 0) {
              [v19 setAllowFamilyHome:0];
            }
            v28 = [v37 serviceManager];
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __97__PGTitleSpecLocationArgument__resolvedStringWithMomentNodes_features_argumentEvaluationContext___block_invoke;
            v40[3] = &unk_1E68E5880;
            v40[4] = &v45;
            +[PGLocationTitleUtility generateLocationTitleWithOptions:v19 locationHelper:v12 serviceManager:v28 result:v40];
          }
          if (!v46[5] && (type & 1) != 0)
          {
            [v19 setPeopleDisplayType:0];
            [v19 setUseCities:1];
            [v19 setAoiDisplayType:(type & 4) >> 2];
            v29 = [v37 serviceManager];
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v39[0] = __97__PGTitleSpecLocationArgument__resolvedStringWithMomentNodes_features_argumentEvaluationContext___block_invoke_2;
            v39[1] = &unk_1E68E5880;
            v39[2] = &v45;
            +[PGLocationTitleUtility generateLocationTitleWithOptions:v19 locationHelper:v12 serviceManager:v29 result:v38];
          }
        }
LABEL_38:

        goto LABEL_39;
      }
      if ((type & 0x30) != 0) {
        goto LABEL_30;
      }
LABEL_39:
      if ((([(id)v46[5] length] != 0) & v15) != 0) {
        goto LABEL_42;
      }
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  }
  while (v13);
LABEL_42:

  id v10 = (NSString *)(id)v46[5];
  _Block_object_dispose(&v45, 8);

LABEL_43:
  return v10;
}

void __97__PGTitleSpecLocationArgument__resolvedStringWithMomentNodes_features_argumentEvaluationContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __97__PGTitleSpecLocationArgument__resolvedStringWithMomentNodes_features_argumentEvaluationContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t type = self->_type;
  if (type == 512)
  {
    if ([(NSString *)self->_locationName length])
    {
      id v9 = self->_locationName;
      goto LABEL_28;
    }
    unint64_t type = self->_type;
  }
  id v10 = (PGLocationTitleOptions *)(type & 0x30);
  if ((type & 0x30) == 0 || (type & 2) == 0)
  {
    v12 = [v7 locationHelper];
    if ((type & 0x30) == 0) {
      goto LABEL_14;
    }
    id v10 = +[PGLocationTitleOptions onlyPeopleLocationTitleOptions];
    [(PGLocationTitleOptions *)v10 setLineBreakBehavior:self->_lineBreakBehavior];
    [(PGLocationTitleOptions *)v10 setMomentNodes:v6];
    [(PGLocationTitleOptions *)v10 setFilterSignificantLocationsType:1];
    if ((type & 0x20) != 0) {
      [(PGLocationTitleOptions *)v10 setAllowFamilyHome:0];
    }
    uint64_t v13 = [v7 serviceManager];
    uint64_t v14 = [(PGTitleSpecLocationArgument *)self _generateLocationTitleWithOptions:v10 locationHelper:v12 serviceManager:v13];

    if (!v14)
    {
LABEL_14:
      char v15 = v10;
      uint64_t v23 = (type >> 6) & 1;
      id v10 = objc_alloc_init(PGLocationTitleOptions);

      [(PGLocationTitleOptions *)v10 setUseBusinessItems:(type >> 1) & 1];
      [(PGLocationTitleOptions *)v10 setMomentNodes:v6];
      [(PGLocationTitleOptions *)v10 setUseCities:type & 1];
      [(PGLocationTitleOptions *)v10 setShowAllCities:(type >> 7) & 1];
      [(PGLocationTitleOptions *)v10 setUseDistrict:v23];
      if ((type & 8) != 0)
      {
        unint64_t v16 = 4;
      }
      else if ((type & 0xC) != 0)
      {
        unint64_t v16 = 3;
      }
      else
      {
        unint64_t v16 = (self->_type >> 8) & 1;
      }
      -[PGLocationTitleOptions setAoiDisplayType:](v10, "setAoiDisplayType:", v16, v23);
      [(PGLocationTitleOptions *)v10 setPeopleDisplayType:0];
      [(PGLocationTitleOptions *)v10 setLineBreakBehavior:self->_lineBreakBehavior];
      if (self->_filterLocations) {
        uint64_t v20 = 3;
      }
      else {
        uint64_t v20 = 0;
      }
      [(PGLocationTitleOptions *)v10 setFilterSignificantLocationsType:v20];
      v21 = [v7 serviceManager];
      uint64_t v14 = [(PGTitleSpecLocationArgument *)self _generateLocationTitleWithOptions:v10 locationHelper:v12 serviceManager:v21];
    }
    uint64_t v18 = v14;

    id v9 = (NSString *)v18;
  }
  else
  {
    v17 = +[PGLogging sharedLogging];
    uint64_t v18 = [v17 loggingConnection];

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "Cannot allow business item and people home at the same time.", buf, 2u);
    }
    id v9 = 0;
  }

LABEL_28:
  return v9;
}

- (PGTitleSpecLocationArgument)initWithLocationType:(unint64_t)a3 filterLocations:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PGTitleSpecLocationArgument;
  result = [(PGTitleSpecLocationArgument *)&v7 init];
  if (result)
  {
    result->_unint64_t type = a3;
    result->_filterLocations = a4;
  }
  return result;
}

+ (id)argumentWithLocationTypeLocationForLocationName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[PGTitleSpecLocationArgument alloc] initWithLocationType:512 filterLocations:0];
  [(PGTitleSpecLocationArgument *)v4 setLocationName:v3];

  return v4;
}

+ (id)argumentWithLocationType:(unint64_t)a3 filterLocations:(BOOL)a4
{
  uint64_t v4 = [[PGTitleSpecLocationArgument alloc] initWithLocationType:a3 filterLocations:a4];
  return v4;
}

@end