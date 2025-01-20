@interface RTRelabeler
+ (BOOL)placeholderCandidate:(id)a3 knownPlaceTypeThreshold:(double)a4;
- (BOOL)dedupeRelabelingCandidate:(id)a3 nonRevGeoCandidates:(id)a4 deduper:(id)a5 inferredMapItemDeduperState:(id *)a6 dedupedRelabelingCandidate:(id *)a7 dedupedNonRevGeoCandidates:(id *)a8 error:(id *)a9;
- (BOOL)loggingEnabled;
- (BOOL)partitionCandidates:(id)a3 intoNonRevGeoCandidates:(id *)a4 revGeoCandidates:(id *)a5 error:(id *)a6;
- (BOOL)placeholderCandidate:(id)a3;
- (NSArray)hallucinatedUUIDs;
- (NSUUID)placeholderUUID;
- (RTDistanceCalculator)distanceCalculator;
- (RTInferredMapItemDeduper)deduper;
- (RTRelabeler)init;
- (RTRelabeler)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4;
- (RTRelabeler)initWithDistanceCalculator:(id)a3 parameters:(id)a4;
- (RTRelabelerParameters)parameters;
- (double)contextDistanceThreshold;
- (id)combineProbabilityVector:(id)a3 prior:(id)a4 error:(id *)a5;
- (id)convertAndNormalizeLogProbMap:(id)a3 error:(id *)a4;
- (id)convertLowConfidenceCandidates:(id)a3 error:(id *)a4;
- (id)createProbabilityVectorForCandidate:(id)a3 uniqueNonRevGeoMapItems:(id)a4 hallucinatedUUIDs:(id)a5 error:(id *)a6;
- (id)createProbabilityVectorForNonRevGeoCandidate:(id)a3 uniqueNonRevGeoMapItems:(id)a4 hallucinatedUUIDs:(id)a5 placeholderUUID:(id)a6 placeholderWeight:(double)a7 error:(id *)a8;
- (id)createProbabilityVectorForRevGeoCandidate:(id)a3 uniqueNonRevGeoMapItems:(id)a4 hallucinatedUUIDs:(id)a5 placeholderUUID:(id)a6 revGeoConfidence:(double)a7 clippingRadius:(double)a8 sigma:(double)a9 error:(id *)a10;
- (id)createUUIDToPriorMapForContextNonRevGeoCandidates:(id)a3 contextRevGeoCandidates:(id)a4 uniqueNonRevGeoMapItems:(id)a5 hallucinatedUUIDs:(id)a6 baseCount:(double)a7 error:(id *)a8;
- (id)filterAoiCandidates:(id)a3 error:(id *)a4;
- (id)filterFarCandidates:(id)a3 referenceLocation:(id)a4 error:(id *)a5;
- (id)filterOldCandidates:(id)a3 referenceDate:(id)a4 error:(id *)a5;
- (id)generateRelabeledInferredMapItemsFromProbMap:(id)a3 inferredMapItemDeduperState:(id)a4 hallucinatedUUIDs:(id)a5 originalCandidate:(id)a6 referenceLocation:(id)a7 error:(id *)a8;
- (id)preprocessContextCandidates:(id)a3 relabelingCandidate:(id)a4 error:(id *)a5;
- (id)relabelCandidate:(id)a3 usingContextCandidates:(id)a4 metrics:(id)a5 outPriorVector:(id *)a6 outObservationVector:(id *)a7 outPosteriorVector:(id *)a8 error:(id *)a9;
- (id)relabeledInferredMapItemFromProbVector:(id)a3 error:(id *)a4;
- (id)relabeledProbVectorForCandidate:(id)a3 usingContextNonRevGeoCandidates:(id)a4 contextRevGeoCandidates:(id)a5 inferredMapItemDeduperState:(id)a6 referenceLocation:(id)a7 outPriorVector:(id *)a8 outObservationVector:(id *)a9 outPosteriorVector:(id *)a10 error:(id *)a11;
- (void)enableLogging:(BOOL)a3;
- (void)setDeduper:(id)a3;
- (void)setLoggingEnabled:(BOOL)a3;
@end

@implementation RTRelabeler

- (RTRelabeler)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_);
}

- (RTRelabeler)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[RTRelabelerParameters alloc] initWithDefaultsManager:v7];

  v9 = [(RTRelabeler *)self initWithDistanceCalculator:v6 parameters:v8];
  return v9;
}

- (RTRelabeler)initWithDistanceCalculator:(id)a3 parameters:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      v26 = 0;
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_14;
  }
  if (!v8)
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: parameters";
    goto LABEL_17;
  }
  v30.receiver = self;
  v30.super_class = (Class)RTRelabeler;
  v10 = [(RTRelabeler *)&v30 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_distanceCalculator, a3);
    v12 = [RTInferredMapItemDeduper alloc];
    uint64_t v13 = [(RTInferredMapItemDeduper *)v12 initWithDeduperFunction:deduperFunctionGroupedLabelType];
    deduper = v11->_deduper;
    v11->_deduper = (RTInferredMapItemDeduper *)v13;

    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    placeholderUUID = v11->_placeholderUUID;
    v11->_placeholderUUID = (NSUUID *)v15;

    objc_storeStrong((id *)&v11->_parameters, a4);
    v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:-[RTRelabelerParameters minimumNumberPOIs](v11->_parameters, "minimumNumberPOIs")];
    if ([(RTRelabelerParameters *)v11->_parameters minimumNumberPOIs])
    {
      unint64_t v18 = 0;
      do
      {
        v19 = [MEMORY[0x1E4F29128] UUID];
        [v17 addObject:v19];

        ++v18;
      }
      while (v18 < [(RTRelabelerParameters *)v11->_parameters minimumNumberPOIs]);
    }
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithArray:v17];
    hallucinatedUUIDs = v11->_hallucinatedUUIDs;
    v11->_hallucinatedUUIDs = (NSArray *)v20;

    v11->_loggingEnabled = 0;
    v22 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      parameters = v11->_parameters;
      v24 = v11->_placeholderUUID;
      v25 = v11->_hallucinatedUUIDs;
      *(_DWORD *)buf = 138412802;
      v32 = parameters;
      __int16 v33 = 2112;
      v34 = v24;
      __int16 v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "created relabeler with parameters, %@, placeholderUUID, %@, hallucinatedUUIDs, %@", buf, 0x20u);
    }
  }
  self = v11;
  v26 = self;
LABEL_15:

  return v26;
}

- (double)contextDistanceThreshold
{
  [(RTRelabelerParameters *)self->_parameters contextDistanceThreshold];
  return result;
}

- (void)enableLogging:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  self->_loggingEnabled = a3;
  if (a3) {
    v3 = @"enabling";
  }
  else {
    v3 = @"disabling";
  }
  v4 = [(__CFString *)v3 stringByAppendingString:@" logging for the relabeler"];
  v5 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v6, 0xCu);
  }
}

+ (BOOL)placeholderCandidate:(id)a3 knownPlaceTypeThreshold:(double)a4
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      BOOL v11 = 0;
      goto LABEL_17;
    }
    __int16 v22 = 0;
    v9 = "Invalid parameter not satisfying: candidate";
    v10 = (uint8_t *)&v22;
LABEL_19:
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, v9, v10, 2u);
    goto LABEL_8;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    __int16 v21 = 0;
    v9 = "Invalid parameter not satisfying: RTCommonValidConfidence(knownPlaceTypeThreshold)";
    v10 = (uint8_t *)&v21;
    goto LABEL_19;
  }
  int v6 = [v5 firstObject];
  if ([v6 placeSource] == 1)
  {
    BOOL v7 = 1;
  }
  else
  {
    v12 = [v5 firstObject];
    BOOL v7 = [v12 placeSource] == 0;
  }
  uint64_t v13 = [v5 firstObject];
  if ([v13 placeSource] == 0x2000)
  {
    v14 = [v5 secondObject];
    BOOL v15 = ([v14 source] & 0xFDFDE) == 0;
  }
  else
  {
    BOOL v15 = 0;
  }

  v16 = [v5 firstObject];
  if ([v16 placeSource] == 0x2000)
  {
    v17 = [v5 firstObject];
    [v17 placeConfidence];
    BOOL v19 = v18 < a4;
  }
  else
  {
    BOOL v19 = 0;
  }

  BOOL v11 = v7 || v15 && v19;
LABEL_17:

  return v11;
}

- (BOOL)placeholderCandidate:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  [(RTRelabelerParameters *)self->_parameters passthroughThreshold];
  LOBYTE(self) = [v5 placeholderCandidate:v4];

  return (char)self;
}

- (id)filterOldCandidates:(id)a3 referenceDate:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a5)
    {
      v23 = @"candidates";
LABEL_21:
      _RTErrorInvalidParameterCreate((uint64_t)v23);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  if (!v9)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", buf, 2u);
    }

    if (a5)
    {
      v23 = @"referenceDate";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  id v26 = v9;
  BOOL v11 = [v9 dateByAddingTimeInterval:-[RTRelabelerParameters weekThreshold](self->_parameters, "weekThreshold") * -604800.0];
  v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v8 count]];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v27 = v8;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        BOOL v19 = [v18 firstObject];
        uint64_t v20 = [v19 entryDate];
        uint64_t v21 = [v20 compare:v11];

        if (v21 != -1) {
          [v12 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v15);
  }

  v10 = v26;
  id v8 = v27;
LABEL_23:

  return v12;
}

- (id)filterAoiCandidates:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = v5;
  if (v5)
  {
    BOOL v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v5 count]];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v14 = [v13 secondObject:v19];
          uint64_t v15 = [v14 extendedAttributes];
          uint64_t v16 = [v15 wifiFingerprintLabelType];

          if (v16 != 2) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"candidates");
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)filterFarCandidates:(id)a3 referenceLocation:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (!v9)
  {
    id v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a5)
    {
      long long v28 = @"candidates";
LABEL_28:
      _RTErrorInvalidParameterCreate((uint64_t)v28);
      id v26 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
LABEL_29:
    id v26 = 0;
    goto LABEL_30;
  }
  if (!v10)
  {
    __int16 v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (a5)
    {
      long long v28 = @"referenceLocation";
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  aSelector = a2;
  uint64_t v37 = a5;
  [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v9 count]];
  v39 = id v38 = v9;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        distanceCalculator = self->_distanceCalculator;
        double v18 = [v16 firstObject];
        long long v19 = [v18 location];
        long long v20 = [v19 location];
        id v41 = 0;
        [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v20 toLocation:v11 error:&v41];
        double v22 = v21;
        id v23 = v41;

        if (v23)
        {
          long long v29 = (void *)MEMORY[0x1E4F28C58];
          long long v30 = [v23 userInfo];
          long long v31 = [v29 errorWithDomain:@"RTRelabelerErrorDomain" code:1 userInfo:v30];

          v32 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            __int16 v35 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412546;
            v47 = v35;
            __int16 v48 = 2112;
            v49 = v31;
            _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
          }
          uint64_t v25 = v39;
          if (v37) {
            *uint64_t v37 = v31;
          }

          id v26 = 0;
          goto LABEL_23;
        }
        [(RTRelabelerParameters *)self->_parameters contextDistanceThreshold];
        if (v22 <= v24) {
          [v39 addObject:v16];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  uint64_t v25 = v39;
  id v26 = v39;
LABEL_23:
  id v9 = v38;

LABEL_30:

  return v26;
}

- (id)convertLowConfidenceCandidates:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    aSelector = a2;
    long long v43 = a4;
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v7 count]];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v44 = v8;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v52;
      long long v45 = self;
      v46 = v9;
      while (2)
      {
        uint64_t v13 = 0;
        uint64_t v47 = v11;
        do
        {
          if (*(void *)v52 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v51 + 1) + 8 * v13);
          uint64_t v15 = [v14 firstObject];
          uint64_t v16 = [v14 firstObject];
          [v16 placeConfidence];
          double v18 = v17;
          [(RTRelabelerParameters *)self->_parameters confidenceThreshold];
          double v20 = v19;

          if (v18 < v20)
          {
            v50 = [RTLearnedVisit alloc];
            v49 = [v15 identifier];
            double v21 = [v15 location];
            double v22 = [v15 entryDate];
            id v23 = [v15 exitDate];
            double v24 = [v15 creationDate];
            [v15 expirationDate];
            id v26 = v25 = v12;
            [v15 placeConfidence];
            uint64_t v27 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v50, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v49, v21, v22, v23, v24, v26, 1);

            uint64_t v12 = v25;
            uint64_t v11 = v47;

            id v9 = v46;
            self = v45;

            uint64_t v15 = (void *)v27;
          }
          id v28 = objc_alloc(MEMORY[0x1E4F5CE58]);
          long long v29 = [v14 secondObject];
          long long v30 = (void *)[v28 initWithFirstObject:v15 secondObject:v29];

          if (!v30)
          {
            v32 = NSString;
            __int16 v33 = [v14 firstObject];
            uint64_t v34 = [v32 stringWithFormat:@"could not create convertedCandidate for visit, %@", v33];

            __int16 v35 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v59 = *MEMORY[0x1E4F28568];
            v60 = v34;
            v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
            uint64_t v37 = [v35 errorWithDomain:@"RTRelabelerErrorDomain" code:2 userInfo:v36];

            id v38 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              id v41 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412546;
              v56 = v41;
              __int16 v57 = 2112;
              v58 = v37;
              _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
            }
            id v8 = v44;
            if (v43) {
              *long long v43 = v37;
            }

            id v31 = 0;
            goto LABEL_18;
          }
          [v9 addObject:v30];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v31 = v9;
    id v8 = v44;
LABEL_18:
  }
  else
  {
    v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"candidates");
      id v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v31 = 0;
    }
  }

  return v31;
}

- (id)preprocessContextCandidates:(id)a3 relabelingCandidate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contextCandidates", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"contextCandidates");
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = 0;
LABEL_14:
      id v15 = 0;
      *a5 = v17;
      goto LABEL_29;
    }
    id v8 = 0;
LABEL_19:
    id v15 = 0;
    goto LABEL_29;
  }
  if (!v9)
  {
    double v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabelingCandidate", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"relabelingCandidate");
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_19;
  }
  uint64_t v11 = [v9 firstObject];
  uint64_t v12 = [v11 entryDate];
  id v25 = 0;
  uint64_t v13 = [(RTRelabeler *)self filterOldCandidates:v8 referenceDate:v12 error:&v25];
  id v14 = v25;

  if (v14)
  {
    id v15 = 0;
    if (a5) {
      *a5 = v14;
    }
  }
  else
  {
    id v24 = 0;
    double v19 = [(RTRelabeler *)self filterAoiCandidates:v13 error:&v24];
    id v20 = v24;

    if (v20)
    {
      id v15 = 0;
      if (a5) {
        *a5 = v20;
      }
      uint64_t v13 = v19;
    }
    else
    {
      id v23 = 0;
      uint64_t v13 = [(RTRelabeler *)self convertLowConfidenceCandidates:v19 error:&v23];
      id v21 = v23;

      if (v21)
      {
        id v15 = 0;
        if (a5) {
          *a5 = v21;
        }
      }
      else
      {
        id v15 = v13;
      }
    }
  }

  id v8 = v13;
LABEL_29:

  return v15;
}

- (BOOL)partitionCandidates:(id)a3 intoNonRevGeoCandidates:(id *)a4 revGeoCandidates:(id *)a5 error:(id *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10)
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (!a6) {
      goto LABEL_28;
    }
    id v24 = @"candidates";
    goto LABEL_27;
  }
  if (!a4)
  {
    id v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outNonRevGeoCandidates", buf, 2u);
    }

    if (!a6) {
      goto LABEL_28;
    }
    id v24 = @"outNonRevGeoCandidates";
LABEL_27:
    _RTErrorInvalidParameterCreate((uint64_t)v24);
    BOOL v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (!a5)
  {
    id v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outRevGeoCandidates", buf, 2u);
    }

    if (a6)
    {
      id v24 = @"outRevGeoCandidates";
      goto LABEL_27;
    }
LABEL_28:
    BOOL v22 = 0;
    goto LABEL_29;
  }
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v28 = v10;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if ([(RTRelabeler *)self placeholderCandidate:v18]) {
          double v19 = v11;
        }
        else {
          double v19 = v12;
        }
        [v19 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v15);
  }

  id v20 = v12;
  *a4 = v20;
  id v21 = v11;
  *a5 = v21;

  BOOL v22 = 1;
  id v10 = v28;
LABEL_29:

  return v22;
}

- (BOOL)dedupeRelabelingCandidate:(id)a3 nonRevGeoCandidates:(id)a4 deduper:(id)a5 inferredMapItemDeduperState:(id *)a6 dedupedRelabelingCandidate:(id *)a7 dedupedNonRevGeoCandidates:(id *)a8 error:(id *)a9
{
  uint64_t v16 = a9;
  v108[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = v19;
  if (v17)
  {
    if (v18)
    {
      if (v19)
      {
        if (a6)
        {
          if (a7)
          {
            if (a8)
            {
              aSelector = a2;
              id v21 = [[_RTMap alloc] initWithInput:v18];
              uint64_t v22 = [(_RTMap *)v21 withBlock:&__block_literal_global_48];

              id v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:objc_msgSend(v18, "count") + 1];
              v95 = v17;
              v96 = (void *)v22;
              if (![(RTRelabeler *)self placeholderCandidate:v17])
              {
                v86 = v20;
                v88 = v23;
                id v24 = v18;
                id v25 = objc_alloc(MEMORY[0x1E4F5CDF8]);
                id v26 = [v17 secondObject];
                uint64_t v27 = [v17 firstObject];
                [v27 placeConfidence];
                double v29 = v28;
                long long v30 = [v17 firstObject];
                long long v31 = [v25 initWithMapItem:v26 confidence:objc_msgSend(v30, "placeSource") source:v29];

                if (!v31)
                {
                  long long v51 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v107 = *MEMORY[0x1E4F28568];
                  v108[0] = @"could not convert candidate to RTInferredMapItem";
                  long long v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:&v107 count:1];
                  id v34 = [v51 errorWithDomain:@"RTRelabelerErrorDomain" code:3 userInfo:v52];

                  long long v53 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                  {
                    v78 = NSStringFromSelector(aSelector);
                    *(_DWORD *)buf = 138412546;
                    v104 = v78;
                    __int16 v105 = 2112;
                    id v106 = v34;
                    _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
                  }
                  id v18 = v24;
                  id v23 = v88;
                  if (a9)
                  {
                    id v34 = v34;
                    BOOL v40 = 0;
                    *a9 = v34;
                  }
                  else
                  {
                    BOOL v40 = 0;
                  }
                  id v20 = v86;
                  v39 = v96;
                  goto LABEL_55;
                }
                [v88 addObject:v31];

                id v23 = v88;
                id v18 = v24;
                uint64_t v16 = a9;
                id v20 = v86;
                uint64_t v22 = (uint64_t)v96;
              }
              [v23 addObjectsFromArray:v22];
              v90 = objc_alloc_init(RTInferredMapItemDeduperState);
              long long v32 = [v20 dedupeInferredMapItems:v23];
              id v33 = 0;
              id v34 = v33;
              v91 = v32;
              if (v33)
              {
                uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
                v36 = [v33 userInfo];
                id v37 = [v35 errorWithDomain:@"RTRelabelerErrorDomain" code:5 userInfo:v36];

                id v38 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  v74 = NSStringFromSelector(aSelector);
                  *(_DWORD *)buf = 138412546;
                  v104 = v74;
                  __int16 v105 = 2112;
                  id v106 = v37;
                  _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
                }
                v39 = v96;
                if (v16) {
                  goto LABEL_14;
                }
              }
              else
              {
                uint64_t v49 = [v32 count];
                v89 = v23;
                if (v49 == [v23 count])
                {
                  v85 = v16;
                  v50 = v95;
                  if ([(RTRelabeler *)self placeholderCandidate:v95])
                  {
                    v87 = v20;
                    *a7 = v95;
                  }
                  else
                  {
                    id v92 = objc_alloc(MEMORY[0x1E4F5CE58]);
                    v58 = [v95 firstObject];
                    uint64_t v59 = [v32 firstObject];
                    v60 = [v59 mapItem];
                    id v93 = (id)[v92 initWithFirstObject:v58 secondObject:v60];

                    if (!v93)
                    {
                      v75 = (void *)MEMORY[0x1E4F28C58];
                      uint64_t v99 = *MEMORY[0x1E4F28568];
                      v100 = @"dedupedRelabelingCandidate was nil";
                      v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
                      id v37 = [v75 errorWithDomain:@"RTRelabelerErrorDomain" code:2 userInfo:v76];

                      v77 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                      {
                        v81 = NSStringFromSelector(aSelector);
                        *(_DWORD *)buf = 138412546;
                        v104 = v81;
                        __int16 v105 = 2112;
                        id v106 = v37;
                        _os_log_error_impl(&dword_1D9BFA000, v77, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
                      }
                      id v34 = 0;
                      if (v85)
                      {
                        id v37 = v37;
                        BOOL v40 = 0;
                        id *v85 = v37;
                      }
                      else
                      {
                        BOOL v40 = 0;
                      }
                      v39 = v96;
                      id v23 = v89;
                      __int16 v57 = v90;
                      goto LABEL_54;
                    }
                    v87 = v20;
                    id v61 = v93;
                    *a7 = v61;

                    v50 = v95;
                  }
                  uint64_t v62 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v96 count]];
                  unint64_t v63 = [(RTRelabeler *)self placeholderCandidate:v50] ^ 1;
                  if ([v91 count] <= v63)
                  {
LABEL_62:
                    id v37 = v62;
                    *a8 = v37;
                    __int16 v57 = v90;
                    *a6 = v90;
                    BOOL v40 = 1;
                    id v20 = v87;
                    id v23 = v89;
                    v39 = v96;
                    id v34 = 0;
                    goto LABEL_54;
                  }
                  uint64_t v64 = 0;
                  v82 = v62;
                  id v83 = v18;
                  while (1)
                  {
                    id v94 = objc_alloc(MEMORY[0x1E4F5CE58]);
                    v65 = [v18 objectAtIndexedSubscript:v64];
                    v66 = [v65 firstObject];
                    v67 = [v91 objectAtIndexedSubscript:v63 + v64];
                    v68 = [v67 mapItem];
                    v69 = (void *)[v94 initWithFirstObject:v66 secondObject:v68];

                    if (!v69) {
                      break;
                    }
                    uint64_t v62 = v82;
                    [v82 addObject:v69];

                    ++v64;
                    id v18 = v83;
                    if (v63 + v64 >= [v91 count]) {
                      goto LABEL_62;
                    }
                  }
                  v70 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v97 = *MEMORY[0x1E4F28568];
                  v98 = @"dedupedCandidate was nil";
                  v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
                  v72 = [v70 errorWithDomain:@"RTRelabelerErrorDomain" code:2 userInfo:v71];

                  v73 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                  id v37 = v82;
                  if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                  {
                    v80 = NSStringFromSelector(aSelector);
                    *(_DWORD *)buf = 138412546;
                    v104 = v80;
                    __int16 v105 = 2112;
                    id v106 = v72;
                    _os_log_error_impl(&dword_1D9BFA000, v73, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
                  }
                  id v18 = v83;
                  id v20 = v87;
                  id v23 = v89;
                  id v34 = 0;
                  if (v85) {
                    id *v85 = v72;
                  }

                  BOOL v40 = 0;
                  v39 = v96;
LABEL_53:
                  __int16 v57 = v90;
LABEL_54:

LABEL_55:
                  id v17 = v95;
                  goto LABEL_41;
                }
                long long v54 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v101 = *MEMORY[0x1E4F28568];
                v102 = @"dedupedInferredMapItems.count != dedupableInferredMapItems.count";
                v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
                id v37 = [v54 errorWithDomain:@"RTRelabelerErrorDomain" code:5 userInfo:v55];

                v56 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                v39 = v96;
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  v79 = NSStringFromSelector(aSelector);
                  *(_DWORD *)buf = 138412546;
                  v104 = v79;
                  __int16 v105 = 2112;
                  id v106 = v37;
                  _os_log_error_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
                }
                id v34 = 0;
                if (v16)
                {
LABEL_14:
                  id v37 = v37;
                  BOOL v40 = 0;
                  id *v16 = v37;
                  goto LABEL_53;
                }
              }
              BOOL v40 = 0;
              goto LABEL_53;
            }
            uint64_t v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outDedupedNonRevGeoCandidates", buf, 2u);
            }

            if (a9)
            {
              long long v42 = @"outDedupedNonRevGeoCandidates";
              goto LABEL_39;
            }
LABEL_40:
            BOOL v40 = 0;
            goto LABEL_41;
          }
          v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outDedupedRelabelingCandidate", buf, 2u);
          }

          if (!a9) {
            goto LABEL_40;
          }
          long long v42 = @"outDedupedRelabelingCandidate";
        }
        else
        {
          long long v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outInferredMapItemDeduperState", buf, 2u);
          }

          if (!a9) {
            goto LABEL_40;
          }
          long long v42 = @"outInferredMapItemDeduperState";
        }
      }
      else
      {
        long long v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: deduper", buf, 2u);
        }

        if (!a9) {
          goto LABEL_40;
        }
        long long v42 = @"deduper";
      }
    }
    else
    {
      long long v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonRevGeoCandidates", buf, 2u);
      }

      if (!a9) {
        goto LABEL_40;
      }
      long long v42 = @"nonRevGeoCandidates";
    }
  }
  else
  {
    id v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabelingCandidate", buf, 2u);
    }

    if (!a9) {
      goto LABEL_40;
    }
    long long v42 = @"relabelingCandidate";
  }
LABEL_39:
  _RTErrorInvalidParameterCreate((uint64_t)v42);
  BOOL v40 = 0;
  *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

  return v40;
}

id __157__RTRelabeler_dedupeRelabelingCandidate_nonRevGeoCandidates_deduper_inferredMapItemDeduperState_dedupedRelabelingCandidate_dedupedNonRevGeoCandidates_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F5CDF8];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 secondObject];
  int v6 = [v3 firstObject];
  [v6 placeConfidence];
  double v8 = v7;
  id v9 = [v3 firstObject];

  id v10 = [v4 initWithMapItem:v5 confidence:[v9 placeSource] source:v8];

  return v10;
}

- (id)createProbabilityVectorForNonRevGeoCandidate:(id)a3 uniqueNonRevGeoMapItems:(id)a4 hallucinatedUUIDs:(id)a5 placeholderUUID:(id)a6 placeholderWeight:(double)a7 error:(id *)a8
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if (!v15)
  {
    id v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidate", buf, 2u);
    }

    if (a8)
    {
      id v20 = @"candidate";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ([(RTRelabeler *)self placeholderCandidate:v15])
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: ![self placeholderCandidate:candidate]", buf, 2u);
    }

    if (a8)
    {
      id v20 = @"![self placeholderCandidate:candidate]";
LABEL_31:
      _RTErrorInvalidParameterCreate((uint64_t)v20);
      id v26 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (!v16)
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uniqueNonRevGeoMapItems", buf, 2u);
    }

    if (a8)
    {
      id v20 = @"uniqueNonRevGeoMapItems";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (!v17)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hallucinatedUUIDs", buf, 2u);
    }

    if (a8)
    {
      id v20 = @"hallucinatedUUIDs";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (!v18)
  {
    id v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeholderUUID", buf, 2u);
    }

    if (a8)
    {
      id v20 = @"placeholderUUID";
      goto LABEL_31;
    }
LABEL_32:
    id v26 = 0;
    goto LABEL_33;
  }
  if (a7 < 1.0)
  {
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeholderWeight >= 1", buf, 2u);
    }

    if (a8)
    {
      id v20 = @"placeholderWeight >= 1";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  double v28 = [[_RTMap alloc] initWithInput:v16];
  uint64_t v29 = [(_RTMap *)v28 withBlock:&__block_literal_global_111];

  v70 = (void *)v29;
  long long v30 = [MEMORY[0x1E4F1CAD0] setWithArray:v29];
  long long v31 = [v15 secondObject];
  long long v32 = [v31 identifier];
  v71 = v30;
  id v33 = [v30 member:v32];

  if (v33)
  {
    id v69 = v18;
    uint64_t v34 = [v16 count];
    double v35 = (double)(unint64_t)(v34 + [v17 count] - 1) + a7;
    if (v35 <= 0.0)
    {
      v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v80 = "-[RTRelabeler createProbabilityVectorForNonRevGeoCandidate:uniqueNonRevGeoMapItems:hallucinatedUUIDs:place"
              "holderUUID:placeholderWeight:error:]";
        __int16 v81 = 1024;
        LODWORD(v82) = 423;
        _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "divisor was less than or equal to zero (in %s:%d)", buf, 0x12u);
      }
    }
    id v37 = [v15 firstObject];
    [v37 placeConfidence];
    double v39 = v38;

    double v40 = (1.0 - v39) / v35;
    if (v40 >= 0.0)
    {
      id v67 = v17;
      id v68 = v16;
      long long v51 = v15;
      long long v52 = [v71 setByAddingObjectsFromSet:v17];
      id v26 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:objc_msgSend(v52, "count") + 1];
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v53 = v52;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v73 != v56) {
              objc_enumerationMutation(v53);
            }
            v58 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            uint64_t v59 = [v51 secondObject];
            v60 = [v59 identifier];
            int v61 = [v58 isEqual:v60];

            if (v61) {
              double v62 = v39;
            }
            else {
              double v62 = v40;
            }
            unint64_t v63 = [NSNumber numberWithDouble:v62];
            [v26 setObject:v63 forKeyedSubscript:v58];
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }
        while (v55);
      }

      uint64_t v64 = [NSNumber numberWithDouble:v40 * a7];
      id v18 = v69;
      [v26 setObject:v64 forKeyedSubscript:v69];

      id v15 = v51;
      id v43 = v53;
      id v17 = v67;
      id v16 = v68;
    }
    else
    {
      id v41 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v77 = *MEMORY[0x1E4F28568];
      v78 = @"remainder < 0";
      long long v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      id v43 = [v41 errorWithDomain:@"RTRelabelerErrorDomain" code:7 userInfo:v42];

      long long v44 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v66 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v80 = v66;
        __int16 v81 = 2112;
        id v82 = v43;
        _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      id v18 = v69;
      if (a8)
      {
        id v43 = v43;
        id v26 = 0;
        *a8 = v43;
      }
      else
      {
        id v26 = 0;
      }
    }
  }
  else
  {
    id v45 = v18;
    uint64_t v46 = [NSString stringWithFormat:@"setNonRevGeoUUIDs does not contain the identifier of candidate, %@", v15];
    uint64_t v47 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v83 = *MEMORY[0x1E4F28568];
    v84[0] = v46;
    id v43 = (id)v46;
    __int16 v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:&v83 count:1];
    uint64_t v49 = [v47 errorWithDomain:@"RTRelabelerErrorDomain" code:6 userInfo:v48];

    v50 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v65 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v80 = v65;
      __int16 v81 = 2112;
      id v82 = v49;
      _os_log_error_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    if (a8) {
      *a8 = v49;
    }

    id v26 = 0;
    id v18 = v45;
  }

LABEL_33:

  return v26;
}

uint64_t __142__RTRelabeler_createProbabilityVectorForNonRevGeoCandidate_uniqueNonRevGeoMapItems_hallucinatedUUIDs_placeholderUUID_placeholderWeight_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)createProbabilityVectorForRevGeoCandidate:(id)a3 uniqueNonRevGeoMapItems:(id)a4 hallucinatedUUIDs:(id)a5 placeholderUUID:(id)a6 revGeoConfidence:(double)a7 clippingRadius:(double)a8 sigma:(double)a9 error:(id *)a10
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  if (!v18)
  {
    v60 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidate", buf, 2u);
    }

    if (!a10) {
      goto LABEL_68;
    }
    int v61 = @"candidate";
    goto LABEL_67;
  }
  if (![(RTRelabeler *)self placeholderCandidate:v18])
  {
    double v62 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [self placeholderCandidate:candidate]", buf, 2u);
    }

    if (!a10) {
      goto LABEL_68;
    }
    int v61 = @"[self placeholderCandidate:candidate]";
    goto LABEL_67;
  }
  if (!v19)
  {
    unint64_t v63 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uniqueNonRevGeoMapItems", buf, 2u);
    }

    if (!a10) {
      goto LABEL_68;
    }
    int v61 = @"uniqueNonRevGeoMapItems";
    goto LABEL_67;
  }
  if (!v20)
  {
    uint64_t v64 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hallucinatedUUIDs", buf, 2u);
    }

    if (!a10) {
      goto LABEL_68;
    }
    int v61 = @"hallucinatedUUIDs";
    goto LABEL_67;
  }
  if (!v21)
  {
    v65 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeholderUUID", buf, 2u);
    }

    if (!a10) {
      goto LABEL_68;
    }
    int v61 = @"placeholderUUID";
    goto LABEL_67;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v66 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTCommonValidConfidence(revGeoConfidence)", buf, 2u);
    }

    if (!a10) {
      goto LABEL_68;
    }
    int v61 = @"RTCommonValidConfidence(revGeoConfidence)";
    goto LABEL_67;
  }
  if (a8 <= 0.0)
  {
    id v67 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v67, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clippingRadius > 0", buf, 2u);
    }

    if (!a10) {
      goto LABEL_68;
    }
    int v61 = @"clippingRadius > 0";
LABEL_67:
    _RTErrorInvalidParameterCreate((uint64_t)v61);
    __int16 v48 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_69;
  }
  if (a9 <= 0.0)
  {
    id v68 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sigma > 0", buf, 2u);
    }

    if (a10)
    {
      int v61 = @"sigma > 0";
      goto LABEL_67;
    }
LABEL_68:
    __int16 v48 = 0;
    goto LABEL_69;
  }
  long long v72 = a10;
  id v73 = v21;
  double v22 = (a9 + a9) * a9;
  double v23 = log(v22 * 3.14159265) * -0.5;
  long long v74 = v20;
  id v24 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:objc_msgSend(v20, "count") + objc_msgSend(v19, "count")];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v25 = v19;
  id obj = v25;
  uint64_t v77 = [v25 countByEnumeratingWithState:&v90 objects:v97 count:16];
  id v79 = v18;
  if (v77)
  {
    uint64_t v76 = *(void *)v91;
    while (2)
    {
      for (uint64_t i = 0; i != v77; ++i)
      {
        if (*(void *)v91 != v76) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        distanceCalculator = self->_distanceCalculator;
        uint64_t v29 = [v18 firstObject:v72];
        long long v30 = [v29 location];
        long long v31 = [v30 location];
        long long v32 = [v27 location];
        id v89 = 0;
        [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v31 toLocation:v32 error:&v89];
        double v34 = v33;
        id v35 = v89;

        if (v35)
        {
          v70 = (void *)MEMORY[0x1E4F28C58];
          v71 = [v35 userInfo];
          v58 = [v70 errorWithDomain:@"RTRelabelerErrorDomain" code:1 userInfo:v71];

          __int16 v48 = 0;
          if (v72) {
            id *v72 = v58;
          }
          id v18 = v79;
          id v20 = v74;
          id v21 = v73;
          uint64_t v59 = obj;
          goto LABEL_75;
        }
        if (v34 <= a8) {
          double v36 = v34;
        }
        else {
          double v36 = a8;
        }
        id v37 = [NSNumber numberWithDouble:v23 - v36 * v36 / v22];
        double v38 = [v27 identifier];
        [v24 setObject:v37 forKeyedSubscript:v38];

        id v18 = v79;
      }
      id v25 = obj;
      uint64_t v77 = [obj countByEnumeratingWithState:&v90 objects:v97 count:16];
      if (v77) {
        continue;
      }
      break;
    }
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v39 = v74;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v85 objects:v96 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v86;
    double v43 = v23 - a8 * a8 / v22;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v86 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v45 = *(void *)(*((void *)&v85 + 1) + 8 * j);
        uint64_t v46 = [NSNumber numberWithDouble:v43, v72];
        [v24 setObject:v46 forKeyedSubscript:v45];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v85 objects:v96 count:16];
    }
    while (v41);
  }

  id v84 = 0;
  uint64_t v47 = [(RTRelabeler *)self convertAndNormalizeLogProbMap:v24 error:&v84];
  id v78 = v84;
  __int16 v48 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[obj count] + [v39 count] + 1];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v35 = v47;
  uint64_t v49 = [v35 countByEnumeratingWithState:&v80 objects:v95 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v81;
    do
    {
      for (uint64_t k = 0; k != v50; ++k)
      {
        if (*(void *)v81 != v51) {
          objc_enumerationMutation(v35);
        }
        uint64_t v53 = *(void *)(*((void *)&v80 + 1) + 8 * k);
        uint64_t v54 = NSNumber;
        uint64_t v55 = [v35 objectForKeyedSubscript:v53, v72];
        [v55 doubleValue];
        __int16 v57 = [v54 numberWithDouble:(1.0 - a7) * v56];
        [v48 setObject:v57 forKeyedSubscript:v53];
      }
      uint64_t v50 = [v35 countByEnumeratingWithState:&v80 objects:v95 count:16];
    }
    while (v50);
  }

  v58 = [NSNumber numberWithDouble:a7];
  id v21 = v73;
  [v48 setObject:v58 forKeyedSubscript:v73];
  uint64_t v59 = v78;
  id v18 = v79;
  id v20 = v74;
LABEL_75:

LABEL_69:

  return v48;
}

- (id)createProbabilityVectorForCandidate:(id)a3 uniqueNonRevGeoMapItems:(id)a4 hallucinatedUUIDs:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  BOOL v13 = [(RTRelabeler *)self placeholderCandidate:v12];
  parameters = self->_parameters;
  placeholderUUID = self->_placeholderUUID;
  if (v13)
  {
    [(RTRelabelerParameters *)parameters revGeoConfidence];
    double v17 = v16;
    [(RTRelabelerParameters *)self->_parameters clippingRadius];
    double v19 = v18;
    [(RTRelabelerParameters *)self->_parameters sigma];
    [(RTRelabeler *)self createProbabilityVectorForRevGeoCandidate:v12 uniqueNonRevGeoMapItems:v11 hallucinatedUUIDs:v10 placeholderUUID:placeholderUUID revGeoConfidence:a6 clippingRadius:v17 sigma:v19 error:v20];
  }
  else
  {
    [(RTRelabelerParameters *)parameters placeholderWeight];
    -[RTRelabeler createProbabilityVectorForNonRevGeoCandidate:uniqueNonRevGeoMapItems:hallucinatedUUIDs:placeholderUUID:placeholderWeight:error:](self, "createProbabilityVectorForNonRevGeoCandidate:uniqueNonRevGeoMapItems:hallucinatedUUIDs:placeholderUUID:placeholderWeight:error:", v12, v11, v10, placeholderUUID, a6);
  id v21 = };

  return v21;
}

- (id)createUUIDToPriorMapForContextNonRevGeoCandidates:(id)a3 contextRevGeoCandidates:(id)a4 uniqueNonRevGeoMapItems:(id)a5 hallucinatedUUIDs:(id)a6 baseCount:(double)a7 error:(id *)a8
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  double v19 = v18;
  if (!v15)
  {
    double v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contextNonRevGeoCandidates", buf, 2u);
    }

    if (a8)
    {
      id v21 = @"contextNonRevGeoCandidates";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (!v16)
  {
    double v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contextRevGeoCandidates", buf, 2u);
    }

    if (a8)
    {
      id v21 = @"contextRevGeoCandidates";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (!v17)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uniqueNonRevGeoMapItems", buf, 2u);
    }

    if (a8)
    {
      id v21 = @"uniqueNonRevGeoMapItems";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (!v18)
  {
    id v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hallucinatedUUIDs", buf, 2u);
    }

    if (a8)
    {
      id v21 = @"hallucinatedUUIDs";
      goto LABEL_26;
    }
LABEL_27:
    id v26 = 0;
    goto LABEL_28;
  }
  if (a7 < 0.0)
  {
    double v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: baseCount >= 0", buf, 2u);
    }

    if (a8)
    {
      id v21 = @"baseCount >= 0";
LABEL_26:
      _RTErrorInvalidParameterCreate((uint64_t)v21);
      id v26 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  aSelector = a2;
  __int16 v105 = a8;
  uint64_t v107 = v18;
  double v28 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v15 count] + [v18 count] + 1];
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v106 = v17;
  id obj = v17;
  uint64_t v29 = [obj countByEnumeratingWithState:&v136 objects:v152 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v137;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v137 != v31) {
          objc_enumerationMutation(obj);
        }
        double v33 = *(void **)(*((void *)&v136 + 1) + 8 * i);
        double v34 = [NSNumber numberWithDouble:a7];
        id v35 = [v33 identifier];
        [v28 setObject:v34 forKeyedSubscript:v35];
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v136 objects:v152 count:16];
    }
    while (v30);
  }

  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v116 = v107;
  uint64_t v36 = [v116 countByEnumeratingWithState:&v132 objects:v151 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v133;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v133 != v38) {
          objc_enumerationMutation(v116);
        }
        uint64_t v40 = *(void *)(*((void *)&v132 + 1) + 8 * j);
        uint64_t v41 = [NSNumber numberWithDouble:a7];
        [v28 setObject:v41 forKeyedSubscript:v40];
      }
      uint64_t v37 = [v116 countByEnumeratingWithState:&v132 objects:v151 count:16];
    }
    while (v37);
  }

  uint64_t v42 = [NSNumber numberWithDouble:a7];
  [v28 setObject:v42 forKeyedSubscript:self->_placeholderUUID];

  double v43 = (void *)MEMORY[0x1E4F1CAD0];
  long long v44 = [v28 allKeys];
  v113 = [v43 setWithArray:v44];

  uint64_t v45 = [[_RTMap alloc] initWithInput:v15];
  uint64_t v46 = [(_RTMap *)v45 withBlock:&__block_literal_global_144];

  uint64_t v47 = [[_RTMap alloc] initWithInput:obj];
  uint64_t v48 = [(_RTMap *)v47 withBlock:&__block_literal_global_146];

  uint64_t v49 = [MEMORY[0x1E4F1CAD0] setWithArray:v46];
  v104 = (void *)v48;
  v102 = [MEMORY[0x1E4F1CAD0] setWithArray:v48];
  v103 = v49;
  if ([v49 isSubsetOfSet:v102])
  {
    uint64_t v101 = v46;
    id v98 = v16;
    id v99 = v15;
    [v15 arrayByAddingObjectsFromArray:v16];
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v111 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v110 = [v111 countByEnumeratingWithState:&v128 objects:v144 count:16];
    if (!v110)
    {
      uint64_t v55 = 0;
      id v73 = 0;
      goto LABEL_74;
    }
    v108 = self;
    uint64_t v109 = *(void *)v129;
LABEL_48:
    uint64_t v50 = 0;
    while (1)
    {
      if (*(void *)v129 != v109) {
        objc_enumerationMutation(v111);
      }
      uint64_t v51 = *(void *)(*((void *)&v128 + 1) + 8 * v50);
      long long v52 = (void *)MEMORY[0x1E016D870]();
      id v127 = 0;
      uint64_t v53 = [(RTRelabeler *)self createProbabilityVectorForCandidate:v51 uniqueNonRevGeoMapItems:obj hallucinatedUUIDs:v116 error:&v127];
      id v54 = v127;
      uint64_t v55 = v54;
      if (v54) {
        break;
      }
      double v56 = (void *)MEMORY[0x1E4F1CAD0];
      __int16 v57 = [v53 allKeys];
      v58 = [v56 setWithArray:v57];
      char v59 = [v58 isEqualToSet:v113];

      if ((v59 & 1) == 0)
      {
        id v78 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v142 = *MEMORY[0x1E4F28568];
        v143 = @"the probability vector obtained had different UUIDs than the prior map built";
        id v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
        id v73 = [v78 errorWithDomain:@"RTRelabelerErrorDomain" code:8 userInfo:v79];

        long long v80 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          uint64_t v97 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412546;
          v146 = v97;
          __int16 v147 = 2112;
          id v148 = v73;
          _os_log_error_impl(&dword_1D9BFA000, v80, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        goto LABEL_73;
      }
      uint64_t v114 = v50;
      context = v52;
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      v60 = [v28 allKeys];
      uint64_t v61 = [v60 countByEnumeratingWithState:&v123 objects:v141 count:16];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v63 = *(void *)v124;
        do
        {
          for (uint64_t k = 0; k != v62; ++k)
          {
            if (*(void *)v124 != v63) {
              objc_enumerationMutation(v60);
            }
            uint64_t v65 = *(void *)(*((void *)&v123 + 1) + 8 * k);
            v66 = NSNumber;
            id v67 = [v28 objectForKeyedSubscript:v65];
            [v67 doubleValue];
            double v69 = v68;
            v70 = [v53 objectForKeyedSubscript:v65];
            [v70 doubleValue];
            long long v72 = [v66 numberWithDouble:v69 + v71];
            [v28 setObject:v72 forKeyedSubscript:v65];
          }
          uint64_t v62 = [v60 countByEnumeratingWithState:&v123 objects:v141 count:16];
        }
        while (v62);
      }

      uint64_t v50 = v114 + 1;
      self = v108;
      if (v114 + 1 == v110)
      {
        uint64_t v55 = 0;
        id v73 = 0;
        uint64_t v110 = [v111 countByEnumeratingWithState:&v128 objects:v144 count:16];
        if (v110) {
          goto LABEL_48;
        }
LABEL_74:

        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v81 = [v28 allKeys];
        uint64_t v82 = [v81 countByEnumeratingWithState:&v119 objects:v140 count:16];
        if (v82)
        {
          uint64_t v83 = v82;
          uint64_t v84 = *(void *)v120;
          do
          {
            for (uint64_t m = 0; m != v83; ++m)
            {
              if (*(void *)v120 != v84) {
                objc_enumerationMutation(v81);
              }
              uint64_t v86 = *(void *)(*((void *)&v119 + 1) + 8 * m);
              long long v87 = [v28 objectForKeyedSubscript:v86];
              [v87 doubleValue];
              long double v89 = v88;

              long long v90 = [NSNumber numberWithDouble:(double)log(v89)];
              [v28 setObject:v90 forKeyedSubscript:v86];
            }
            uint64_t v83 = [v81 countByEnumeratingWithState:&v119 objects:v140 count:16];
          }
          while (v83);
        }

        if (v55)
        {
          long long v91 = v105;
          id v17 = v106;
          uint64_t v46 = v101;
          if (v105)
          {
            long long v92 = v55;
            goto LABEL_87;
          }
LABEL_88:
          id v26 = 0;
        }
        else
        {
          long long v91 = v105;
          id v17 = v106;
          uint64_t v46 = v101;
          if (v73)
          {
            if (!v105) {
              goto LABEL_88;
            }
            long long v92 = v73;
LABEL_87:
            id v26 = 0;
            id *v91 = v92;
          }
          else
          {
            id v118 = 0;
            long long v93 = [(RTRelabeler *)self convertAndNormalizeLogProbMap:v28 error:&v118];
            id v94 = v118;
            v95 = v94;
            if (v94)
            {
              id v26 = 0;
              if (v105) {
                *__int16 v105 = v94;
              }
            }
            else
            {
              id v26 = v93;
            }

            uint64_t v46 = v101;
          }
        }

        id v16 = v98;
        id v15 = v99;
LABEL_95:

        goto LABEL_96;
      }
    }
    id v77 = v54;
    id v73 = 0;
LABEL_73:

    goto LABEL_74;
  }
  long long v74 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v149 = *MEMORY[0x1E4F28568];
  v150 = @"uniqueContextNonRevGeoUUIDs is not a subset of uniqueNonRevGeoUUIDs";
  long long v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
  id v111 = [v74 errorWithDomain:@"RTRelabelerErrorDomain" code:9 userInfo:v75];

  uint64_t v76 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
  {
    v96 = NSStringFromSelector(aSelector);
    *(_DWORD *)buf = 138412546;
    v146 = v96;
    __int16 v147 = 2112;
    id v148 = v111;
    _os_log_error_impl(&dword_1D9BFA000, v76, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
  }
  id v17 = v106;
  if (!a8)
  {
    id v26 = 0;
    goto LABEL_95;
  }
  id v26 = 0;
  id v112 = v111;
  *a8 = v112;

LABEL_96:
  double v19 = v107;
LABEL_28:

  return v26;
}

id __147__RTRelabeler_createUUIDToPriorMapForContextNonRevGeoCandidates_contextRevGeoCandidates_uniqueNonRevGeoMapItems_hallucinatedUUIDs_baseCount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 secondObject];
  id v3 = [v2 identifier];

  return v3;
}

uint64_t __147__RTRelabeler_createUUIDToPriorMapForContextNonRevGeoCandidates_contextRevGeoCandidates_uniqueNonRevGeoMapItems_hallucinatedUUIDs_baseCount_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)convertAndNormalizeLogProbMap:(id)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = v5;
  if (v5)
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v54;
      double v10 = -1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v54 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          BOOL v13 = [v6 objectForKeyedSubscript:v12];
          [v13 doubleValue];
          double v15 = v14;

          if (v15 > v10)
          {
            id v16 = [v6 objectForKeyedSubscript:v12];
            [v16 doubleValue];
            double v10 = v17;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v8);
    }
    else
    {
      double v10 = -1.79769313e308;
    }
    double v19 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v6 count]];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    double v20 = [v6 allKeys];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v50;
      long double v24 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v50 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v26 = *(void *)(*((void *)&v49 + 1) + 8 * j);
          uint64_t v27 = NSNumber;
          double v28 = [v6 objectForKeyedSubscript:v26];
          [v28 doubleValue];
          uint64_t v30 = [v27 numberWithDouble:v29 - v10];
          [v19 setObject:v30 forKeyedSubscript:v26];

          uint64_t v31 = [v19 objectForKeyedSubscript:v26];
          [v31 doubleValue];
          long double v24 = v24 + exp(v32);
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v49 objects:v59 count:16];
      }
      while (v22);
    }
    else
    {
      long double v24 = 0.0;
    }

    double v33 = log(v24);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    double v34 = [v19 allKeys];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v46 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v45 + 1) + 8 * k);
          uint64_t v40 = NSNumber;
          uint64_t v41 = [v19 objectForKeyedSubscript:v39];
          [v41 doubleValue];
          double v43 = [v40 numberWithDouble:(double)exp(v42 - v33)];
          [v19 setObject:v43 forKeyedSubscript:v39];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v36);
    }
  }
  else
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: logProbMap", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"logProbMap");
      double v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v19 = 0;
    }
  }

  return v19;
}

- (id)combineProbabilityVector:(id)a3 prior:(id)a4 error:(id *)a5
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: probabilityVector", buf, 2u);
    }

    if (a5)
    {
      uint64_t v37 = @"probabilityVector";
LABEL_24:
      _RTErrorInvalidParameterCreate((uint64_t)v37);
      id v35 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
LABEL_25:
    id v35 = 0;
    goto LABEL_36;
  }
  if (!v10)
  {
    uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: prior", buf, 2u);
    }

    if (a5)
    {
      uint64_t v37 = @"prior";
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v13 = [v9 allKeys];
  double v14 = [v12 setWithArray:v13];

  double v15 = (void *)MEMORY[0x1E4F1CAD0];
  id v16 = [v11 allKeys];
  double v17 = [v15 setWithArray:v16];

  if ([v14 isEqualToSet:v17])
  {
    long long v47 = self;
    aSelector = a2;
    long long v46 = a5;
    long long v48 = v14;
    id v18 = v11;
    [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v9 count]];
    id v49 = v9;
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v19 = v9;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v54 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          id v25 = NSNumber;
          uint64_t v26 = [v19 objectForKeyedSubscript:v24];
          [v26 doubleValue];
          double v28 = log(v27);
          double v29 = [v18 objectForKeyedSubscript:v24];
          [v29 doubleValue];
          uint64_t v31 = [v25 numberWithDouble:(double)(v28 + log(v30))];
          [v50 setObject:v31 forKeyedSubscript:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v21);
    }

    id v52 = 0;
    long double v32 = [(RTRelabeler *)v47 convertAndNormalizeLogProbMap:v50 error:&v52];
    id v33 = v52;
    if (v33)
    {
      double v34 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      double v14 = v48;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        long long v44 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412546;
        char v59 = v44;
        __int16 v60 = 2112;
        id v61 = v33;
        _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      id v35 = 0;
      if (v46) {
        id *v46 = v33;
      }
      id v11 = v18;
    }
    else
    {
      id v35 = v32;
      id v11 = v18;
      double v14 = v48;
    }

    id v9 = v49;
    goto LABEL_34;
  }
  uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v62 = *MEMORY[0x1E4F28568];
  v63[0] = @"probUUIDs != priorUUIDs";
  uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
  id v50 = [v39 errorWithDomain:@"RTRelabelerErrorDomain" code:8 userInfo:v40];

  uint64_t v41 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    double v43 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    char v59 = v43;
    __int16 v60 = 2112;
    id v61 = v50;
    _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
  }
  if (!a5)
  {
    id v35 = 0;
LABEL_34:

    goto LABEL_35;
  }
  id v35 = 0;
  id v51 = v50;
  *a5 = v51;

LABEL_35:
LABEL_36:

  return v35;
}

- (id)generateRelabeledInferredMapItemsFromProbMap:(id)a3 inferredMapItemDeduperState:(id)a4 hallucinatedUUIDs:(id)a5 originalCandidate:(id)a6 referenceLocation:(id)a7 error:(id *)a8
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  uint64_t v20 = v19;
  if (!v15)
  {
    long double v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: probMap", buf, 2u);
    }

    if (!a8) {
      goto LABEL_32;
    }
    _RTErrorInvalidParameterCreate(@"probMap");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (!v16)
  {
    long double v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemDeduperState", buf, 2u);
    }

    if (!a8) {
      goto LABEL_32;
    }
    _RTErrorInvalidParameterCreate(@"inferredMapItemDeduperState");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (!v17)
  {
    id v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hallucinatedUUIDs", buf, 2u);
    }

    if (!a8) {
      goto LABEL_32;
    }
    _RTErrorInvalidParameterCreate(@"hallucinatedUUIDs");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (!v18)
  {
    double v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: originalCandidate", buf, 2u);
    }

    if (!a8) {
      goto LABEL_32;
    }
    _RTErrorInvalidParameterCreate(@"originalCandidate");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
    double v29 = 0;
    *a8 = v31;
    goto LABEL_59;
  }
  if (!v19)
  {
    id v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (a8)
    {
      _RTErrorInvalidParameterCreate(@"referenceLocation");
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
LABEL_32:
    double v29 = 0;
    goto LABEL_59;
  }
  uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = [v15 allKeys];
  uint64_t v63 = [v21 setWithArray:v22];

  id v72 = 0;
  uint64_t v64 = [v16 allDedupedUUIDsWithError:&v72];
  id v23 = v72;
  uint64_t v62 = v23;
  if (v23)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    id v25 = [v23 userInfo];
    uint64_t v26 = [v24 errorWithDomain:@"RTRelabelerErrorDomain" code:5 userInfo:v25];

    long double v27 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v47 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v47;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v26;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, error when fetching all dedupedUUIDs, %@", buf, 0x16u);
    }
    if (a8)
    {
      id v28 = v26;
      double v29 = 0;
      *a8 = v28;
    }
    else
    {
      double v29 = 0;
      id v28 = v26;
    }
  }
  else
  {
    id v61 = [MEMORY[0x1E4F1CA80] setWithSet:v64];
    uint64_t v36 = [v17 allObjects];
    [v61 addObjectsFromArray:v36];

    [v61 addObject:self->_placeholderUUID];
    if ([v61 isEqualToSet:v63])
    {
      uint64_t v37 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v15 count]];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      long long v80 = __Block_byref_object_copy__64;
      long long v81 = __Block_byref_object_dispose__64;
      id v82 = 0;
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __148__RTRelabeler_generateRelabeledInferredMapItemsFromProbMap_inferredMapItemDeduperState_hallucinatedUUIDs_originalCandidate_referenceLocation_error___block_invoke;
      v66[3] = &unk_1E6B95F78;
      id v58 = v15;
      id v67 = v58;
      v70 = buf;
      SEL v71 = a2;
      id v68 = v18;
      id v60 = v37;
      id v69 = v60;
      id v65 = 0;
      [v16 enumerateDedupedUUIDToMapItemMapUsingBlock:v66 error:&v65];
      id v38 = v65;
      if (v38)
      {
        uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          uint64_t v53 = NSStringFromSelector(a2);
          *(_DWORD *)long long v75 = 138412546;
          uint64_t v76 = v53;
          __int16 v77 = 2112;
          id v78 = v38;
          id v57 = (id)v53;
          _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "%@, enumeration error, %@", v75, 0x16u);
        }
      }
      uint64_t v40 = *(void **)(*(void *)&buf[8] + 40);
      if (v40)
      {
        double v29 = 0;
        if (a8) {
          *a8 = v40;
        }
      }
      else
      {
        long long v55 = [RTFusedInferredMapItem alloc];
        long long v46 = [v58 objectForKeyedSubscript:self->_placeholderUUID];
        [v46 doubleValue];
        char v59 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v55, "initWithMapItem:confidence:source:", 0, 0);

        if (v59)
        {
          [v60 addObject:];
          [(RTRelabelerParameters *)self->_parameters confidenceEqualityEpsilon];
          double v29 = +[RTFusedInferredMapItem sortFusedInferredMapItems:confidenceEqualityEpsilon:referenceLocation:distanceCalculator:ascending:](RTFusedInferredMapItem, "sortFusedInferredMapItems:confidenceEqualityEpsilon:referenceLocation:distanceCalculator:ascending:", v60, v20, self->_distanceCalculator, 0);
        }
        else
        {
          long long v48 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v73 = *MEMORY[0x1E4F28568];
          long long v74 = @"relabeledInferredMapItem was nil";
          id v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
          id v56 = [v48 errorWithDomain:@"RTRelabelerErrorDomain" code:4 userInfo:v49];

          id v50 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            long long v54 = NSStringFromSelector(a2);
            *(_DWORD *)long long v75 = 138412546;
            uint64_t v76 = (uint64_t)v54;
            __int16 v77 = 2112;
            id v78 = v56;
            _os_log_error_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_ERROR, "%@, error, %@", v75, 0x16u);
          }
          if (a8) {
            *a8 = v56;
          }

          double v29 = 0;
        }
      }
      _Block_object_dispose(buf, 8);

      id v45 = v60;
    }
    else
    {
      uint64_t v41 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v83 = *MEMORY[0x1E4F28568];
      v84[0] = @"inputUUIDs != probMapUUIDs";
      double v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:&v83 count:1];
      double v43 = [v41 errorWithDomain:@"RTRelabelerErrorDomain" code:8 userInfo:v42];

      long long v44 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        id v52 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v52;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v43;
        _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      if (a8)
      {
        id v45 = v43;
        double v29 = 0;
        *a8 = v45;
      }
      else
      {
        double v29 = 0;
        id v45 = v43;
      }
    }

    id v28 = v61;
  }

LABEL_59:

  return v29;
}

void __148__RTRelabeler_generateRelabeledInferredMapItemsFromProbMap_inferredMapItemDeduperState_hallucinatedUUIDs_originalCandidate_referenceLocation_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a2;
  id v9 = [RTFusedInferredMapItem alloc];
  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

  [v10 doubleValue];
  double v12 = v11;
  BOOL v13 = [*(id *)(a1 + 40) firstObject];
  double v14 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v9, "initWithMapItem:confidence:source:", v7, [v13 placeSource], v12);

  if (v14)
  {
    [*(id *)(a1 + 48) addObject:v14];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"relabeledInferredMapItem was nil during enumeration";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v17 = [v15 errorWithDomain:@"RTRelabelerErrorDomain" code:4 userInfo:v16];

    id v18 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v22 = 138412546;
      id v23 = v21;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "%@, error, %@", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v17;

    *a4 = 1;
  }
}

- (id)relabeledProbVectorForCandidate:(id)a3 usingContextNonRevGeoCandidates:(id)a4 contextRevGeoCandidates:(id)a5 inferredMapItemDeduperState:(id)a6 referenceLocation:(id)a7 outPriorVector:(id *)a8 outObservationVector:(id *)a9 outPosteriorVector:(id *)a10 error:(id *)a11
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  int v22 = v21;
  if (!v17)
  {
    long double v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidate", buf, 2u);
    }

    if (!a11) {
      goto LABEL_56;
    }
    id v33 = @"candidate";
    goto LABEL_55;
  }
  if (!v18)
  {
    double v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contextNonRevGeoCandidates", buf, 2u);
    }

    if (!a11) {
      goto LABEL_56;
    }
    id v33 = @"contextNonRevGeoCandidates";
    goto LABEL_55;
  }
  if (!v19)
  {
    id v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contextRevGeoCandidates", buf, 2u);
    }

    if (!a11) {
      goto LABEL_56;
    }
    id v33 = @"contextRevGeoCandidates";
    goto LABEL_55;
  }
  if (!v20)
  {
    uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemDeduperState", buf, 2u);
    }

    if (!a11) {
      goto LABEL_56;
    }
    id v33 = @"inferredMapItemDeduperState";
    goto LABEL_55;
  }
  if (!v21)
  {
    uint64_t v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (!a11) {
      goto LABEL_56;
    }
    id v33 = @"referenceLocation";
    goto LABEL_55;
  }
  if (!a8)
  {
    id v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outPriorVector", buf, 2u);
    }

    if (!a11) {
      goto LABEL_56;
    }
    id v33 = @"outPriorVector";
    goto LABEL_55;
  }
  if (!a9)
  {
    uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outObservationVector", buf, 2u);
    }

    if (!a11) {
      goto LABEL_56;
    }
    id v33 = @"outObservationVector";
LABEL_55:
    _RTErrorInvalidParameterCreate((uint64_t)v33);
    id v31 = 0;
    *a11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_57;
  }
  if (!a10)
  {
    uint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outPosteriorVector", buf, 2u);
    }

    if (a11)
    {
      id v33 = @"outPosteriorVector";
      goto LABEL_55;
    }
LABEL_56:
    id v31 = 0;
    goto LABEL_57;
  }
  if (self->_loggingEnabled)
  {
    log = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v84 = [v18 count];
      _os_log_impl(&dword_1D9BFA000, log, OS_LOG_TYPE_INFO, "contextNonRevGeoCandidates count, %lu", buf, 0xCu);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      [v18 enumerateObjectsUsingBlock:&__block_literal_global_197];
    }
    loga = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(loga, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = [v19 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v84 = v23;
      _os_log_impl(&dword_1D9BFA000, loga, OS_LOG_TYPE_INFO, "contextRevGeoCandidates count, %lu", buf, 0xCu);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      [v19 enumerateObjectsUsingBlock:&__block_literal_global_200];
    }
  }
  id v82 = 0;
  os_log_t logb = [v20 allUniqueMapItemsWithError:&v82];
  id v24 = v82;
  if (v24)
  {
    os_log_t v25 = logb;
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    long double v27 = v24;
    id v28 = [v24 userInfo];
    id v71 = [v26 errorWithDomain:@"RTRelabelerErrorDomain" code:5 userInfo:v28];

    double v29 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v84 = (uint64_t)v27;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "error when fetching all unique mapItems, %@", buf, 0xCu);
    }

    if (a11)
    {
      id v30 = v71;
      id v31 = 0;
      *a11 = v30;
    }
    else
    {
      id v31 = 0;
      id v30 = v71;
    }
  }
  else
  {
    id v72 = (id)[logb count];
    if ((unint64_t)v72 <= [(RTRelabelerParameters *)self->_parameters minimumNumberPOIs]) {
      unint64_t v42 = [(RTRelabelerParameters *)self->_parameters minimumNumberPOIs] - (void)v72;
    }
    else {
      unint64_t v42 = 0;
    }
    id v73 = (id)MEMORY[0x1E4F1CAD0];
    -[NSArray subarrayWithRange:](self->_hallucinatedUUIDs, "subarrayWithRange:", 0, v42);
    id v69 = (id)objc_claimAutoreleasedReturnValue();
    id v74 = [v73 setWithArray:v69];

    [(RTRelabelerParameters *)self->_parameters baseCount];
    id v81 = 0;
    -[RTRelabeler createUUIDToPriorMapForContextNonRevGeoCandidates:contextRevGeoCandidates:uniqueNonRevGeoMapItems:hallucinatedUUIDs:baseCount:error:](self, "createUUIDToPriorMapForContextNonRevGeoCandidates:contextRevGeoCandidates:uniqueNonRevGeoMapItems:hallucinatedUUIDs:baseCount:error:", v18, v19, logb, v74, &v81);
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    id v43 = v81;
    id v68 = v43;
    if (self->_loggingEnabled)
    {
      id v65 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        uint64_t v44 = [v74 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v84 = v44;
        _os_log_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_INFO, "hallucinated UUIDs count, %lu", buf, 0xCu);
      }

      v66 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        uint64_t v45 = [v70 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v84 = v45;
        __int16 v85 = 2112;
        id v86 = v68;
        _os_log_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_INFO, "prior count, %lu, error, %@", buf, 0x16u);
      }

      BOOL v46 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
      id v43 = v68;
      if (v46)
      {
        [v70 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_204];
        id v43 = v68;
      }
    }
    if (v43)
    {
      if (a11)
      {
        long long v47 = v43;
        id v31 = 0;
        *a11 = v43;
        id v30 = v74;
        os_log_t v25 = logb;
      }
      else
      {
        id v31 = 0;
        id v30 = v74;
        os_log_t v25 = logb;
        long long v47 = v43;
      }
    }
    else
    {
      id v80 = 0;
      os_log_t v67 = [(RTRelabeler *)self createProbabilityVectorForCandidate:v17 uniqueNonRevGeoMapItems:logb hallucinatedUUIDs:v74 error:&v80];
      id v48 = v80;
      id v64 = v48;
      if (self->_loggingEnabled)
      {
        uint64_t v62 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          uint64_t v49 = [v67 count];
          *(_DWORD *)buf = 134218242;
          uint64_t v84 = v49;
          __int16 v85 = 2112;
          id v86 = v64;
          _os_log_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_INFO, "observation count, %lu, error, %@", buf, 0x16u);
        }

        BOOL v50 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
        id v48 = v64;
        if (v50)
        {
          [v67 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_207];
          id v48 = v64;
        }
      }
      if (v48)
      {
        if (a11)
        {
          id v51 = v48;
          id v31 = 0;
          *a11 = v48;
          id v30 = v74;
          os_log_t v25 = logb;
        }
        else
        {
          id v31 = 0;
          id v30 = v74;
          os_log_t v25 = logb;
          id v51 = v48;
        }
      }
      else
      {
        id v79 = 0;
        id v63 = [(RTRelabeler *)self combineProbabilityVector:v67 prior:v70 error:&v79];
        id v52 = v79;
        id v61 = v52;
        if (self->_loggingEnabled)
        {
          char v59 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            uint64_t v53 = [v63 count];
            *(_DWORD *)buf = 134218242;
            uint64_t v84 = v53;
            __int16 v85 = 2112;
            id v86 = v61;
            _os_log_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_INFO, "posterior count, %lu, error, %@", buf, 0x16u);
          }

          BOOL v54 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
          id v52 = v61;
          if (v54)
          {
            [v63 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_210];
            id v52 = v61;
          }
        }
        if (v52)
        {
          if (a11)
          {
            long long v55 = v52;
            id v31 = 0;
            *a11 = v52;
            id v30 = v74;
            os_log_t v25 = logb;
          }
          else
          {
            id v31 = 0;
            id v30 = v74;
            os_log_t v25 = logb;
            long long v55 = v52;
          }
        }
        else
        {
          id v78 = 0;
          id v60 = [(RTRelabeler *)self generateRelabeledInferredMapItemsFromProbMap:v63 inferredMapItemDeduperState:v20 hallucinatedUUIDs:v74 originalCandidate:v17 referenceLocation:v22 error:&v78];
          id v56 = v78;
          id v57 = v56;
          if (v56)
          {
            id v31 = 0;
            if (a11) {
              *a11 = v56;
            }
            id v30 = v74;
            os_log_t v25 = logb;
            id v58 = v60;
          }
          else
          {
            *a8 = v70;
            *a9 = v67;
            *a10 = v63;
            id v58 = v60;
            id v31 = v60;
            id v30 = v74;
            os_log_t v25 = logb;
          }

          long long v55 = v61;
        }

        id v51 = v64;
      }

      long long v47 = v68;
    }

    long double v27 = 0;
  }

LABEL_57:

  return v31;
}

void __210__RTRelabeler_relabeledProbVectorForCandidate_usingContextNonRevGeoCandidates_contextRevGeoCandidates_inferredMapItemDeduperState_referenceLocation_outPriorVector_outObservationVector_outPosteriorVector_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [v4 firstObject];
    id v7 = [v6 identifier];
    id v8 = [v4 secondObject];
    id v9 = [v8 identifier];
    int v10 = 134218498;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    BOOL v13 = v7;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "nonRevGeoCandidate, %lu, visit identifier, %@, mapItem identifier, %@", (uint8_t *)&v10, 0x20u);
  }
}

void __210__RTRelabeler_relabeledProbVectorForCandidate_usingContextNonRevGeoCandidates_contextRevGeoCandidates_inferredMapItemDeduperState_referenceLocation_outPriorVector_outObservationVector_outPosteriorVector_error___block_invoke_198(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [v4 firstObject];
    id v7 = [v6 identifier];
    id v8 = [v4 secondObject];
    id v9 = [v8 identifier];
    int v10 = 134218498;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    BOOL v13 = v7;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "revGeoCandidate, %lu, visit identifier, %@, mapItem identifier, %@", (uint8_t *)&v10, 0x20u);
  }
}

void __210__RTRelabeler_relabeledProbVectorForCandidate_usingContextNonRevGeoCandidates_contextRevGeoCandidates_inferredMapItemDeduperState_referenceLocation_outPriorVector_outObservationVector_outPosteriorVector_error___block_invoke_201(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  int v6 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "UUID, %@, prior, %@", (uint8_t *)&v7, 0x16u);
  }
}

void __210__RTRelabeler_relabeledProbVectorForCandidate_usingContextNonRevGeoCandidates_contextRevGeoCandidates_inferredMapItemDeduperState_referenceLocation_outPriorVector_outObservationVector_outPosteriorVector_error___block_invoke_205(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  int v6 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "UUID, %@, observation, %@", (uint8_t *)&v7, 0x16u);
  }
}

void __210__RTRelabeler_relabeledProbVectorForCandidate_usingContextNonRevGeoCandidates_contextRevGeoCandidates_inferredMapItemDeduperState_referenceLocation_outPriorVector_outObservationVector_outPosteriorVector_error___block_invoke_208(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  int v6 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "UUID, %@, posterior, %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)relabeledInferredMapItemFromProbVector:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = v6;
  if (!v6)
  {
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeledProbVector", buf, 2u);
    }

    if (a4)
    {
      id v15 = @"relabeledProbVector";
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v15);
      id v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_15:
    id v17 = 0;
    goto LABEL_24;
  }
  if (![v6 count])
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v30 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeledProbVector.count >= 1", v30, 2u);
    }

    if (a4)
    {
      id v15 = @"relabeledProbVector.count >= 1";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v8 = [v7 objectAtIndexedSubscript:0];
  [v8 confidence];
  double v10 = v9;
  [(RTRelabelerParameters *)self->_parameters confidenceThreshold];
  double v12 = v11;

  if (v10 <= v12) {
    goto LABEL_22;
  }
  if ((unint64_t)[v7 count] > 1)
  {
    id v18 = [v7 objectAtIndexedSubscript:0];
    [v18 confidence];
    double v20 = v19;
    [(RTRelabelerParameters *)self->_parameters minimumConfidenceRatio];
    double v22 = v21;
    uint64_t v23 = [v7 objectAtIndexedSubscript:1];
    [v23 confidence];
    double v25 = v22 * v24;

    if (v20 > v25)
    {
      uint64_t v13 = [v7 objectAtIndexedSubscript:0];
      goto LABEL_23;
    }
    if (self->_loggingEnabled)
    {
      uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v29 = 0;
        _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "demoted because does not satisfy minimum confidence ratio", v29, 2u);
      }
    }
LABEL_22:
    long double v27 = [RTFusedInferredMapItem alloc];
    [(RTRelabelerParameters *)self->_parameters revGeoConfidence];
    uint64_t v13 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v27, "initWithMapItem:confidence:source:", 0, 0);
    goto LABEL_23;
  }
  uint64_t v13 = [v7 firstObject];
LABEL_23:
  id v17 = (void *)v13;
LABEL_24:

  return v17;
}

- (id)relabelCandidate:(id)a3 usingContextCandidates:(id)a4 metrics:(id)a5 outPriorVector:(id *)a6 outObservationVector:(id *)a7 outPosteriorVector:(id *)a8 error:(id *)a9
{
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  double v19 = v18;
  if (!v16)
  {
    id v65 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidate", buf, 2u);
    }

    if (!a9)
    {
LABEL_55:
      id v16 = 0;
LABEL_56:
      id v64 = 0;
      goto LABEL_57;
    }
    _RTErrorInvalidParameterCreate(@"candidate");
    id v66 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = 0;
LABEL_28:
    id v64 = 0;
    *a9 = v66;
    goto LABEL_57;
  }
  if (!v18)
  {
    os_log_t v67 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v67, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metrics", buf, 2u);
    }

    if (!a9) {
      goto LABEL_56;
    }
    _RTErrorInvalidParameterCreate(@"metrics");
    id v66 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v160 = a6;
  aSelector = a2;
  if (self->_loggingEnabled)
  {
    double v20 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      double v21 = [v16 firstObject];
      double v22 = [v21 identifier];
      uint64_t v23 = [v16 secondObject];
      [v23 identifier];
      v163 = v19;
      double v24 = a7;
      double v25 = a8;
      id v26 = v16;
      long double v27 = self;
      v29 = id v28 = v17;
      *(_DWORD *)buf = 138412546;
      v186 = v22;
      __int16 v187 = 2112;
      id v188 = v29;
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "relabeling visit identifier, %@, mapItem identifier, %@", buf, 0x16u);

      id v17 = v28;
      self = v27;
      id v16 = v26;
      a8 = v25;
      a7 = v24;
      double v19 = v163;
    }
  }
  [v19 setPreprocessedMetricsUsingInputCandidate:v16 contextCandidates:v17];
  id v30 = [v16 firstObject];
  [v30 placeConfidence];
  double v32 = v31;
  [(RTRelabelerParameters *)self->_parameters confidenceThreshold];
  double v34 = v33;

  if (v32 < v34)
  {
    long long v139 = a7;
    uint64_t v142 = a8;
    id v158 = v17;
    v164 = v19;
    uint64_t v149 = [RTLearnedVisit alloc];
    v157 = [v16 firstObject];
    v144 = [v157 identifier];
    id v155 = [v16 firstObject];
    id v35 = [v155 location];
    id v153 = [v16 firstObject];
    uint64_t v36 = [v153 entryDate];
    __int16 v147 = [v16 firstObject];
    uint64_t v37 = [v147 exitDate];
    id v38 = [v16 firstObject];
    uint64_t v39 = [v38 creationDate];
    uint64_t v40 = [v16 firstObject];
    uint64_t v41 = [v40 expirationDate];
    unint64_t v42 = v16;
    v151 = v16;
    id v43 = self;
    uint64_t v44 = (void *)v41;
    uint64_t v45 = [v42 firstObject];
    [v45 placeConfidence];
    BOOL v46 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v149, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v144, v35, v36, v37, v39, v44, 1);

    self = v43;
    id v47 = objc_alloc(MEMORY[0x1E4F5CE58]);
    id v48 = [v151 secondObject];
    uint64_t v49 = [v47 initWithFirstObject:v46 secondObject:v48];

    if (v43->_loggingEnabled)
    {
      BOOL v50 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_INFO, "converting candidate to reverse geocode", buf, 2u);
      }
    }
    double v19 = v164;
    if (v49)
    {

      id v16 = (id)v49;
      id v17 = v158;
      a7 = v139;
      a8 = v142;
      goto LABEL_14;
    }
    uint64_t v84 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v183 = *MEMORY[0x1E4F28568];
    v184 = @"candidate was nil";
    __int16 v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v184 forKeys:&v183 count:1];
    id v86 = [v84 errorWithDomain:@"RTRelabelerErrorDomain" code:2 userInfo:v85];

    uint64_t v87 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    id v17 = v158;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      long long v122 = (RTFusedInferredMapItem *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v186 = v122;
      __int16 v187 = 2112;
      id v188 = v86;
      _os_log_error_impl(&dword_1D9BFA000, v87, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    if (a9) {
      *a9 = v86;
    }

    goto LABEL_55;
  }
LABEL_14:
  id v51 = [v16 firstObject];
  [v51 placeConfidence];
  double v53 = v52;
  [(RTRelabelerParameters *)self->_parameters passthroughThreshold];
  if (v53 <= v54)
  {
    long long v55 = [v16 secondObject];
    id v56 = [v55 extendedAttributes];
    if ([v56 wifiFingerprintLabelType] == 2)
    {

      goto LABEL_17;
    }
    uint64_t v79 = [v17 count];

    if (!v79) {
      goto LABEL_18;
    }
    v143 = a8;
    id v178 = 0;
    [(RTRelabeler *)self preprocessContextCandidates:v17 relabelingCandidate:v16 error:&v178];
    id v80 = v17;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v81 = v178;

    if (self->_loggingEnabled)
    {
      id v82 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        uint64_t v83 = [v17 count];
        *(_DWORD *)buf = 134218242;
        v186 = (RTFusedInferredMapItem *)v83;
        __int16 v187 = 2112;
        id v188 = v81;
        _os_log_impl(&dword_1D9BFA000, v82, OS_LOG_TYPE_INFO, "preprocessed contextCandidates count, %lu, preprocessError, %@", buf, 0x16u);
      }
    }
    if (v81)
    {
      id v64 = 0;
      if (a9) {
        *a9 = v81;
      }
      goto LABEL_112;
    }
    [v19 setFilteredInputMetricsUsingContextCandidates:v17];
    unint64_t v89 = [v17 count];
    if (v89 < [(RTRelabelerParameters *)self->_parameters contextCandidateAmountThreshold]&& ![(RTRelabeler *)self placeholderCandidate:v16])
    {
      id v112 = [RTFusedInferredMapItem alloc];
      v113 = [v16 secondObject];
      uint64_t v114 = [v16 firstObject];
      [v114 placeConfidence];
      double v116 = v115;
      v117 = [v16 firstObject];
      uint64_t v118 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v112, "initWithMapItem:confidence:source:", v113, [v117 placeSource], v116);
      long long v119 = self;
      id v64 = (RTFusedInferredMapItem *)v118;

      if (v119->_loggingEnabled)
      {
        long long v120 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v186 = v64;
          _os_log_impl(&dword_1D9BFA000, v120, OS_LOG_TYPE_INFO, "returning early since insufficient amount of context candidates, relabeledInferredMapItem, %@", buf, 0xCu);
        }
      }
      if (v64)
      {
        long long v121 = v64;
      }
      else
      {
        long long v124 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v179 = *MEMORY[0x1E4F28568];
        v180 = @"relabeledInferredMapItem was nil";
        long long v125 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v180 forKeys:&v179 count:1];
        long long v126 = [v124 errorWithDomain:@"RTRelabelerErrorDomain" code:4 userInfo:v125];

        id v127 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(aSelector);
          long long v134 = (RTFusedInferredMapItem *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v186 = v134;
          __int16 v187 = 2112;
          id v188 = v126;
          _os_log_error_impl(&dword_1D9BFA000, v127, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        if (a9) {
          *a9 = v126;
        }
      }
      goto LABEL_112;
    }
    id v176 = 0;
    id v177 = 0;
    id v175 = 0;
    BOOL v90 = [(RTRelabeler *)self partitionCandidates:v17 intoNonRevGeoCandidates:&v177 revGeoCandidates:&v176 error:&v175];
    id v91 = v177;
    long long v92 = (char *)v176;
    id v93 = v175;
    if (!v90)
    {
      if (a9)
      {
        id v110 = v93;
        id v64 = 0;
        *a9 = v93;
        id v93 = v110;
      }
      else
      {
        id v64 = 0;
      }
      goto LABEL_111;
    }
    id v159 = v93;
    [v19 setNonRevGeoCandidates:v91 revGeoCandidates:v92];
    deduper = self->_deduper;
    id v173 = 0;
    id v174 = 0;
    id v171 = 0;
    id v172 = 0;
    BOOL v95 = [(RTRelabeler *)self dedupeRelabelingCandidate:v16 nonRevGeoCandidates:v91 deduper:deduper inferredMapItemDeduperState:&v174 dedupedRelabelingCandidate:&v173 dedupedNonRevGeoCandidates:&v172 error:&v171];
    id v96 = v174;
    id v165 = v173;
    id v97 = v172;
    id v98 = v171;
    SEL aSelectora = v92;
    if (!v95)
    {
      if (a9)
      {
        id v123 = v98;
        id v64 = 0;
        *a9 = v98;
        id v98 = v123;
      }
      else
      {
        id v64 = 0;
      }
      uint64_t v109 = v165;
      v108 = v96;
      id v81 = 0;
      goto LABEL_110;
    }
    id v150 = v98;
    id v138 = v91;
    id v99 = v96;
    [v19 setNumberOfUniqueMapItems:v96];
    v145 = [v16 firstObject];
    v140 = [v145 location];
    [v140 location];
    uint64_t v101 = v100 = self;
    id v169 = 0;
    id v170 = 0;
    id v167 = 0;
    id v168 = 0;
    id v137 = v97;
    uint64_t v102 = [(RTRelabeler *)v100 relabeledProbVectorForCandidate:v165 usingContextNonRevGeoCandidates:v97 contextRevGeoCandidates:v92 inferredMapItemDeduperState:v99 referenceLocation:v101 outPriorVector:&v170 outObservationVector:&v169 outPosteriorVector:&v168 error:&v167];
    id v103 = v170;
    id v156 = v169;
    id v154 = v168;
    v104 = (RTFusedInferredMapItem *)v167;

    __int16 v105 = v99;
    v146 = v104;
    id v148 = v103;
    v152 = (void *)v102;
    if (v104)
    {
      id v106 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      uint64_t v107 = v104;
      id v81 = 0;
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v186 = v104;
        _os_log_error_impl(&dword_1D9BFA000, v106, OS_LOG_TYPE_ERROR, "relabeldProbVector error, %@", buf, 0xCu);
      }

      id v97 = v137;
      id v91 = v138;
      v108 = v105;
      id v64 = 0;
      uint64_t v109 = v165;
      if (a9) {
        *a9 = v146;
      }
      goto LABEL_109;
    }
    id v166 = 0;
    v141 = [(RTRelabeler *)v100 relabeledInferredMapItemFromProbVector:v102 error:&v166];
    long long v128 = v100;
    id v81 = 0;
    long long v135 = v99;
    long long v136 = (RTFusedInferredMapItem *)v166;
    if (v136)
    {
      long long v129 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v186 = v136;
        _os_log_error_impl(&dword_1D9BFA000, v129, OS_LOG_TYPE_ERROR, "relabeling pick error, %@", buf, 0xCu);
      }

      id v97 = v137;
      id v91 = v138;
      uint64_t v107 = 0;
      if (a9)
      {
        long long v130 = v136;
        id v64 = 0;
        uint64_t v109 = v165;
        *a9 = v136;
        long long v131 = v141;
LABEL_108:

        v108 = v135;
LABEL_109:

        id v98 = v150;
LABEL_110:

        id v93 = v159;
        long long v92 = (char *)aSelectora;
LABEL_111:

LABEL_112:
        goto LABEL_57;
      }
      id v64 = 0;
      uint64_t v109 = v165;
      long long v131 = v141;
    }
    else
    {
      if (v128->_loggingEnabled)
      {
        long long v132 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v186 = v141;
          _os_log_impl(&dword_1D9BFA000, v132, OS_LOG_TYPE_INFO, "relabeledInferredMapItem, %@", buf, 0xCu);
        }
      }
      uint64_t v109 = v165;
      [v19 setOutputMetricsUsingInputCandidate:v165 priorVector:v103 observationVector:v156 posteriorVector:v154 relabeledProbVector:v152 relabeledInferredMapItem:v141];
      if (v160) {
        id *v160 = v103;
      }
      if (a7) {
        *a7 = v156;
      }
      id v91 = v138;
      if (v143) {
        id *v143 = v154;
      }
      long long v133 = v141;
      long long v131 = v141;
      id v64 = v133;
      id v97 = v137;
      uint64_t v107 = 0;
    }
    long long v130 = v136;
    goto LABEL_108;
  }
LABEL_17:

LABEL_18:
  BOOL v57 = [(RTRelabeler *)self placeholderCandidate:v16];
  id v58 = [RTFusedInferredMapItem alloc];
  if (v57)
  {
    [(RTRelabelerParameters *)self->_parameters revGeoConfidence];
    double v60 = v59;
    id v61 = v16;
    uint64_t v62 = [v16 firstObject];
    id v63 = self;
    id v64 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v58, "initWithMapItem:confidence:source:", 0, [v62 placeSource], v60);
  }
  else
  {
    uint64_t v62 = [v16 secondObject];
    id v68 = [v16 firstObject];
    [v68 placeConfidence];
    double v70 = v69;
    id v61 = v16;
    id v71 = [v16 firstObject];
    id v63 = self;
    id v64 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v58, "initWithMapItem:confidence:source:", v62, [v71 placeSource], v70);
  }
  BOOL loggingEnabled = v63->_loggingEnabled;
  id v16 = v61;
  if (loggingEnabled)
  {
    id v73 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v186 = v64;
      _os_log_impl(&dword_1D9BFA000, v73, OS_LOG_TYPE_INFO, "passing through relabeler, relabeledInferredMapItem, %@", buf, 0xCu);
    }
  }
  if (v64)
  {
    id v74 = v64;
  }
  else
  {
    long long v75 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v181 = *MEMORY[0x1E4F28568];
    v182 = @"relabeledInferredMapItem was nil";
    uint64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v182 forKeys:&v181 count:1];
    __int16 v77 = [v75 errorWithDomain:@"RTRelabelerErrorDomain" code:4 userInfo:v76];

    id v78 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      id v111 = (RTFusedInferredMapItem *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v186 = v111;
      __int16 v187 = 2112;
      id v188 = v77;
      _os_log_error_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    if (a9) {
      *a9 = v77;
    }
  }
LABEL_57:

  return v64;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTInferredMapItemDeduper)deduper
{
  return self->_deduper;
}

- (void)setDeduper:(id)a3
{
}

- (RTRelabelerParameters)parameters
{
  return self->_parameters;
}

- (NSUUID)placeholderUUID
{
  return self->_placeholderUUID;
}

- (NSArray)hallucinatedUUIDs
{
  return self->_hallucinatedUUIDs;
}

- (BOOL)loggingEnabled
{
  return self->_loggingEnabled;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->_BOOL loggingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hallucinatedUUIDs, 0);
  objc_storeStrong((id *)&self->_placeholderUUID, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_deduper, 0);

  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end