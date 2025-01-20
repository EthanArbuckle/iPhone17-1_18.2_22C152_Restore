@interface RTMapItemProviderBase
- (BOOL)mapItemCloseEnough:(id)a3 referenceLocation:(id)a4 distanceThreshold:(double)a5 error:(id *)a6;
- (RTDistanceCalculator)distanceCalculator;
- (RTMapItemProviderBase)init;
- (RTMapItemProviderBase)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4;
- (RTMapItemProviderBase)initWithDistanceCalculator:(id)a3 parameters:(id)a4;
- (RTMapItemProviderBaseParameters)baseParameters;
- (id)filter:(id)a3 byDistance:(double)a4 fromLocation:(id)a5 andAppendSource:(unint64_t)a6 error:(id *)a7;
- (id)filter:(id)a3 byDistance:(double)a4 fromLocation:(id)a5 error:(id *)a6;
- (id)filterInferredMapItems:(id)a3 byDistance:(double)a4 fromLocation:(id)a5 andAppendSource:(unint64_t)a6 error:(id *)a7;
- (id)filterInferredMapItems:(id)a3 byDistance:(double)a4 fromLocation:(id)a5 error:(id *)a6;
@end

@implementation RTMapItemProviderBase

- (id)filterInferredMapItems:(id)a3 byDistance:(double)a4 fromLocation:(id)a5 andAppendSource:(unint64_t)a6 error:(id *)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  if ([v11 count])
  {
    v35 = a7;
    [MEMORY[0x1E4F1CA48] array];
    v37 = id v36 = v11;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v41;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v40 + 1) + 8 * v17);
        v19 = [v18 mapItem];
        id v39 = 0;
        BOOL v20 = [(RTMapItemProviderBase *)self mapItemCloseEnough:v19 referenceLocation:v12 distanceThreshold:&v39 error:a4];
        id v21 = v39;

        if (v20)
        {
          v22 = [v18 mapItem];
          v23 = [v22 appendSource:a6];

          if (v23)
          {
            id v24 = objc_alloc(MEMORY[0x1E4F5CDF8]);
            [v18 confidence];
            uint64_t v26 = [v24 initWithMapItem:v23 confidence:[v18 source] source:v25];
            if (!v26)
            {
              v31 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v32 = *MEMORY[0x1E4F5CFE8];
              uint64_t v44 = *MEMORY[0x1E4F28568];
              v45 = @"filteredInferredMapItem was nil";
              v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
              id v28 = [v31 errorWithDomain:v32 code:0 userInfo:v33];

              if (!v35) {
                goto LABEL_16;
              }
              id v11 = v36;
              v29 = v37;
              if (v28)
              {
                id v28 = v28;
                id *v35 = v28;
              }
              goto LABEL_24;
            }
            v27 = (void *)v26;
            [v37 addObject:v26];
          }
        }
        else if (v21)
        {
          if (v35) {
            id *v35 = v21;
          }

          id v30 = 0;
          id v11 = v36;
          v29 = v37;
          goto LABEL_25;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
          if (v15) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v28 = 0;
LABEL_16:
    id v11 = v36;
    v29 = v37;
LABEL_24:
    id v30 = v29;
    id v13 = v28;
LABEL_25:
  }
  else
  {
    id v30 = v11;
  }

  return v30;
}

- (id)filterInferredMapItems:(id)a3 byDistance:(double)a4 fromLocation:(id)a5 error:(id *)a6
{
  return [(RTMapItemProviderBase *)self filterInferredMapItems:a3 byDistance:a5 fromLocation:0 andAppendSource:a6 error:a4];
}

- (RTMapItemProviderBase)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_);
}

- (RTMapItemProviderBase)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [[RTMapItemProviderBaseParameters alloc] initWithDefaultsManager:v6];
    self = [(RTMapItemProviderBase *)self initWithDistanceCalculator:v7 parameters:v8];

    v9 = self;
  }
  else
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (RTMapItemProviderBase)initWithDistanceCalculator:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      id v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = "Invalid parameter not satisfying: parameters";
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTMapItemProviderBase;
  v10 = [(RTMapItemProviderBase *)&v16 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_distanceCalculator, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  id v12 = self;
LABEL_10:

  return v12;
}

- (BOOL)mapItemCloseEnough:(id)a3 referenceLocation:(id)a4 distanceThreshold:(double)a5 error:(id *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (a6)
  {
    if (v10)
    {
      if (v11)
      {
        id v13 = [(RTMapItemProviderBase *)self distanceCalculator];
        uint64_t v14 = [v10 location];
        id v35 = 0;
        [v13 distanceFromLocation:v12 toLocation:v14 error:&v35];
        double v16 = v15;
        id v17 = v35;

        if (v17)
        {
          BOOL v18 = 0;
          *a6 = v17;
        }
        else
        {
          [v12 horizontalUncertainty];
          double v24 = v23;
          [(RTMapItemProviderBaseParameters *)self->_baseParameters locationUncertaintyMax];
          if (v24 >= v25) {
            double v24 = v25;
          }
          [(RTMapItemProviderBaseParameters *)self->_baseParameters locationUncertaintyMin];
          if (v24 >= v26) {
            double v26 = v24;
          }
          double v27 = v26 + a5;
          id v28 = [v10 location];
          [v28 horizontalUncertainty];
          double v30 = v29;

          [(RTMapItemProviderBaseParameters *)self->_baseParameters mapItemUncertaintyMin];
          if (v30 < v31) {
            double v30 = v31;
          }
          [(RTMapItemProviderBaseParameters *)self->_baseParameters mapItemUncertaintyMax];
          if (v30 < v32) {
            double v32 = v30;
          }
          if (v16 > v27 + v32)
          {
            v33 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              id v37 = v10;
              __int16 v38 = 2048;
              double v39 = a5;
              __int16 v40 = 2048;
              double v41 = v16;
              __int16 v42 = 2112;
              long long v43 = v12;
              _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "mapItem didn't survive distance filter, %@, distance threshold, %lf, actual distance, %lf, location, %@", buf, 0x2Au);
            }

            BOOL v18 = 0;
          }
          else
          {
            BOOL v18 = 1;
          }
        }

        goto LABEL_30;
      }
      v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
      }

      id v21 = @"referenceLocation";
    }
    else
    {
      BOOL v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem", buf, 2u);
      }

      id v21 = @"mapItem";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v21);
    BOOL v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  BOOL v18 = 0;
LABEL_30:

  return v18;
}

- (id)filter:(id)a3 byDistance:(double)a4 fromLocation:(id)a5 andAppendSource:(unint64_t)a6 error:(id *)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  if ([v12 count])
  {
    double v27 = a7;
    [MEMORY[0x1E4F1CA48] array];
    v29 = id v28 = v12;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v30 = 0;
          BOOL v20 = [(RTMapItemProviderBase *)self mapItemCloseEnough:v19 referenceLocation:v13 distanceThreshold:&v30 error:a4];
          id v21 = v30;
          v22 = v21;
          if (v20)
          {
            double v23 = [v19 appendSource:a6];
            if (v23) {
              [v29 addObject:v23];
            }
          }
          else if (v21)
          {
            if (v27) {
              id *v27 = v21;
            }

            id v25 = 0;
            id v12 = v28;
            double v24 = v29;
            goto LABEL_19;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    double v24 = v29;
    id v25 = v29;
    id v12 = v28;
LABEL_19:
  }
  else
  {
    id v25 = v12;
  }

  return v25;
}

- (id)filter:(id)a3 byDistance:(double)a4 fromLocation:(id)a5 error:(id *)a6
{
  return [(RTMapItemProviderBase *)self filter:a3 byDistance:a5 fromLocation:0 andAppendSource:a6 error:a4];
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTMapItemProviderBaseParameters)baseParameters
{
  return self->_baseParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseParameters, 0);

  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end