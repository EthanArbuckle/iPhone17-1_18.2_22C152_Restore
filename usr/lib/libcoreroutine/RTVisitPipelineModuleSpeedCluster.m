@interface RTVisitPipelineModuleSpeedCluster
- (NSString)description;
- (RTVisitPipelineModuleSpeedCluster)init;
- (RTVisitPipelineModuleSpeedCluster)initWithHyperParameter:(id)a3;
- (id)process:(id)a3;
- (void)clearAndAddForcedExitSignalToClusters:(id)a3;
- (void)clearWorkingVisit;
@end

@implementation RTVisitPipelineModuleSpeedCluster

- (RTVisitPipelineModuleSpeedCluster)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithHyperParameter_);
}

- (RTVisitPipelineModuleSpeedCluster)initWithHyperParameter:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTVisitPipelineModuleSpeedCluster;
    v6 = [(RTVisitPipelineModuleSpeedCluster *)&v11 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_hyperParameter, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hyperParameter", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"SpeedCluster"];
  if (self->_workingVisit)
  {
    v4 = [NSString stringWithFormat:@"working visit, %@", self->_workingVisit];
    [v3 appendString:v4];
  }

  return (NSString *)v3;
}

- (void)clearWorkingVisit
{
  lastPoint = self->_lastPoint;
  self->_lastPoint = 0;

  workingVisit = self->_workingVisit;
  self->_workingVisit = 0;
}

- (void)clearAndAddForcedExitSignalToClusters:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_workingVisit)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      v8 = "-[RTVisitPipelineModuleSpeedCluster clearAndAddForcedExitSignalToClusters:]";
      __int16 v9 = 1024;
      int v10 = 63;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "cannot create exit signal without working visit (in %s:%d)", (uint8_t *)&v7, 0x12u);
    }
  }
  v6 = [[RTVisitCluster alloc] initWithPoints:0 visit:self->_workingVisit];
  if (v6) {
    [v4 addObject:v6];
  }
  [(RTVisitPipelineModuleSpeedCluster *)self clearWorkingVisit];
}

- (id)process:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    id v5 = v4;
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[RTVisitPipelineModuleSpeedCluster process:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 73;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inClusters.count (in %s:%d)", buf, 0x12u);
    }

    id v4 = v5;
  }
  v43 = v4;
  if ([v4 count])
  {
    id v46 = (id)objc_opt_new();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:v66 count:16];
    if (v7)
    {
      uint64_t v45 = *(void *)v52;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v52 != v45) {
            objc_enumerationMutation(obj);
          }
          __int16 v9 = *(void **)(*((void *)&v51 + 1) + 8 * v8);
          int v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            v35 = (objc_class *)objc_opt_class();
            v36 = NSStringFromClass(v35);
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v9;
            _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@ working on cluster, %@", buf, 0x16u);
          }
          uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v37 = (objc_class *)objc_opt_class();
            v38 = NSStringFromClass(v37);
            workingVisit = self->_workingVisit;
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v38;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = workingVisit;
            _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@ working visit, %@", buf, 0x16u);
          }
          v12 = [v9 points];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          v63 = __Block_byref_object_copy__143;
          v64 = __Block_byref_object_dispose__143;
          id v65 = 0;
          v13 = [v12 locations];
          BOOL v14 = [v13 count] == 0;

          if (v14)
          {
            v23 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v56 = 0;
              _os_log_debug_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEBUG, "received forced exit signal", v56, 2u);
            }

            [(RTVisitPipelineModuleSpeedCluster *)self clearAndAddForcedExitSignalToClusters:v46];
          }
          else
          {
            v15 = self->_workingVisit;
            if (v15)
            {
              if (!self->_lastPoint)
              {
                v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  v41 = self->_workingVisit;
                  *(_DWORD *)v56 = 138412802;
                  v57 = (const char *)v41;
                  __int16 v58 = 2080;
                  v59 = "-[RTVisitPipelineModuleSpeedCluster process:]";
                  __int16 v60 = 1024;
                  int v61 = 93;
                  _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "no last point in working visit, %@ (in %s:%d)", v56, 0x1Cu);
                }

                v15 = self->_workingVisit;
              }
              v17 = [(RTVisit *)v15 entry];
              int v18 = [v9 isDateInside:v17];

              if (v18)
              {
                v19 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                {
                  lastPoint = self->_lastPoint;
                  *(_DWORD *)v56 = 138412290;
                  v57 = (const char *)lastPoint;
                  _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "working visit is inside and use last point, %@", v56, 0xCu);
                }

                objc_storeStrong((id *)(*(void *)&buf[8] + 40), self->_lastPoint);
                v20 = [*(id *)(*(void *)&buf[8] + 40) date];
                char v21 = [v9 isDateInside:v20];

                if ((v21 & 1) == 0)
                {
                  v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v56 = 136315394;
                    v57 = "-[RTVisitPipelineModuleSpeedCluster process:]";
                    __int16 v58 = 1024;
                    LODWORD(v59) = 98;
                    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "working visit is inside but last point is not (in %s:%d)", v56, 0x12u);
                  }
                }
              }
              else
              {
                v24 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)v56 = 0;
                  _os_log_debug_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEBUG, "working visit is outside. send forced exit signal", v56, 2u);
                }

                [(RTVisitPipelineModuleSpeedCluster *)self clearAndAddForcedExitSignalToClusters:v46];
              }
            }
            if (*(void *)(*(void *)&buf[8] + 40))
            {
              uint64_t v55 = *(void *)(*(void *)&buf[8] + 40);
              v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
              v26 = [RTVisitLocationPoints alloc];
              v27 = [v12 locations];
              v28 = [v25 arrayByAddingObjectsFromArray:v27];
              uint64_t v29 = [(RTVisitLocationPoints *)v26 initWithLocations:v28];

              v12 = (void *)v29;
            }
            hyperParameter = self->_hyperParameter;
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __45__RTVisitPipelineModuleSpeedCluster_process___block_invoke;
            v47[3] = &unk_1E6B9B8C8;
            v50 = buf;
            v47[4] = self;
            id v31 = v46;
            id v48 = v31;
            v49 = v9;
            [v12 enumerateLowSpeedSegementsUsingBlock:hyperParameter block:v47];
            if (self->_workingVisit)
            {
              v32 = [v9 visit];
              v33 = [v32 exit];
              BOOL v34 = v33 == 0;

              if (!v34) {
                [(RTVisitPipelineModuleSpeedCluster *)self clearAndAddForcedExitSignalToClusters:v31];
              }
            }
          }
          _Block_object_dispose(buf, 8);

          ++v8;
        }
        while (v7 != v8);
        uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:v66 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v46 = 0;
  }

  return v46;
}

void __45__RTVisitPipelineModuleSpeedCluster_process___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = v6;
  if (a4)
  {
    if (![v6 count])
    {
      uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v46 = "-[RTVisitPipelineModuleSpeedCluster process:]_block_invoke";
        __int16 v47 = 1024;
        LODWORD(v48) = 114;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations.count (in %s:%d)", buf, 0x12u);
      }
    }
    __int16 v9 = [v7 firstObject];
    int v10 = [v9 date];

    uint64_t v11 = [v7 lastObject];
    v12 = [v11 date];

    v13 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) date];
    int v14 = [v13 isEqualToDate:v10];

    if (v14)
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = 0;

      if ([v7 count] == 1)
      {
        v17 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "only last point is in this segment.  send force exit signal", buf, 2u);
        }

        [*(id *)(a1 + 32) clearAndAddForcedExitSignalToClusters:*(void *)(a1 + 40)];
        goto LABEL_22;
      }
      uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 8) entry];

      uint64_t v20 = [v7 subarrayWithRange:1, [v7 count] - 1];

      int v10 = v19;
      uint64_t v7 = (void *)v20;
    }
    else if (*(void *)(*(void *)(a1 + 32) + 8))
    {
      int v18 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = (const char *)v10;
        _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "working visit is terminated as last point of low speed segment is, %@", buf, 0xCu);
      }

      [*(id *)(a1 + 32) clearAndAddForcedExitSignalToClusters:*(void *)(a1 + 40)];
    }
    if ([*(id *)(a1 + 48) isPartialAndExitDateIsEqualToDate:v12])
    {
      uint64_t v21 = [v7 lastObject];
      uint64_t v22 = *(void *)(a1 + 32);
      v23 = *(void **)(v22 + 16);
      *(void *)(v22 + 16) = v21;

      v24 = [MEMORY[0x1E4F1C9C8] date];
      id v25 = objc_alloc(MEMORY[0x1E4F5CFC8]);
      v26 = [v7 firstObject];
      double v27 = *MEMORY[0x1E4F5D010];
      uint64_t v28 = [v25 initWithDate:v24 type:1 location:v26 entry:v10 exit:v12 dataPointCount:0 confidence:*MEMORY[0x1E4F5D010] placeInference:0];
      uint64_t v29 = *(void *)(a1 + 32);
      v30 = *(void **)(v29 + 8);
      *(void *)(v29 + 8) = v28;

      id v31 = objc_alloc(MEMORY[0x1E4F5CFC8]);
      v32 = [*(id *)(*(void *)(a1 + 32) + 8) location];
      uint64_t v33 = [v31 initWithDate:v24 type:1 location:v32 entry:v10 exit:0 dataPointCount:0 confidence:v27 placeInference:0];
LABEL_27:
      v39 = (void *)v33;

      v40 = [[RTVisitLocationPoints alloc] initWithLocations:v7];
      v41 = [[RTVisitCluster alloc] initWithPoints:v40 visit:v39];
      if (v41) {
        [*(id *)(a1 + 40) addObject:v41];
      }
      v42 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v46 = v44;
        __int16 v47 = 2112;
        id v48 = v41;
        _os_log_debug_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_DEBUG, "%@ adding to output clusters, %@", buf, 0x16u);
      }
      *a4 = 0;

      goto LABEL_32;
    }
    BOOL v34 = [*(id *)(*(void *)(a1 + 32) + 8) entry];
    v35 = [v7 lastObject];
    v36 = [v35 date];
    if ([v34 isEqualToDate:v36])
    {

LABEL_22:
      *a4 = 0;
LABEL_32:

      goto LABEL_33;
    }
    if (*(void *)(*(void *)(a1 + 32) + 8))
    {
    }
    else
    {
      uint64_t v37 = [v7 count];

      if (v37 == 1) {
        goto LABEL_22;
      }
    }
    [*(id *)(a1 + 32) clearWorkingVisit];
    id v38 = objc_alloc(MEMORY[0x1E4F5CFC8]);
    v24 = [MEMORY[0x1E4F1C9C8] date];
    v32 = [v7 firstObject];
    uint64_t v33 = [v38 initWithDate:v24 type:3 location:v32 entry:v10 exit:v12 dataPointCount:0 confidence:*MEMORY[0x1E4F5D010] placeInference:0];
    goto LABEL_27;
  }
  int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v46 = "-[RTVisitPipelineModuleSpeedCluster process:]_block_invoke";
    __int16 v47 = 1024;
    LODWORD(v48) = 110;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: stop (in %s:%d)", buf, 0x12u);
  }
LABEL_33:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameter, 0);
  objc_storeStrong((id *)&self->_lastPoint, 0);

  objc_storeStrong((id *)&self->_workingVisit, 0);
}

@end