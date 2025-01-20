@interface RTRelabelerPersister
+ (id)locationFromAggregateVisits:(id)a3;
- (BOOL)associateNonPlaceholderRelabeledInferredMapItem:(id)a3 oldCandidate:(id)a4 error:(id *)a5;
- (BOOL)associatePlaceholderRelabeledInferredMapItem:(id)a3 oldCandidate:(id)a4 error:(id *)a5;
- (BOOL)cleanUpCombinedPairs:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)cleanUpWithError:(id *)a3;
- (BOOL)combineEarlierVisitMO:(id)a3 withLaterVisitMO:(id)a4 error:(id *)a5;
- (BOOL)combineOverlappingRevGeoLOIsStabilized:(BOOL *)a3 error:(id *)a4;
- (BOOL)combineSequentialVisitsWithError:(id *)a3;
- (BOOL)consolidateVisitsToLoisWithKnownPlaceTypesWithError:(id *)a3;
- (BOOL)dedupeLOIsWithError:(id *)a3;
- (BOOL)fixUnconcreteLOIs:(id *)a3;
- (BOOL)iterativelyCollapseOverlappingRevGeoLOIsWithError:(id *)a3;
- (BOOL)moveVisitMOs:(id)a3 toLOIMO:(id)a4 error:(id *)a5;
- (BOOL)performBlock:(id)a3 error:(id *)a4;
- (BOOL)resnapVisitsWithError:(id *)a3;
- (BOOL)restoreToOldCandidate:(id)a3 error:(id *)a4;
- (BOOL)restoreVisit:(id)a3 transitions:(id)a4 toOldCandidate:(id)a5 error:(id *)a6;
- (BOOL)saveWithError:(id *)a3;
- (BOOL)unassociateOldCandidate:(id)a3 error:(id *)a4;
- (BOOL)unconcreteLOIMO:(id)a3;
- (BOOL)untrustedVisitMO:(id)a3;
- (BOOL)useRelabeledInferredMapItem:(id)a3 oldCandidate:(id)a4 associate:(BOOL)a5 error:(id *)a6;
- (BOOL)uuidConflicts:(id)a3 context:(id)a4 error:(id *)a5;
- (NSManagedObjectContext)context;
- (NSMutableDictionary)loiIdentifierToUnconcreteMap;
- (RTDistanceCalculator)distanceCalculator;
- (RTLocationShifter)locationShifter;
- (RTMapItemProviderLearnedPlaceParameters)learnedPlaceParameters;
- (RTMapItemProviderReverseGeocode)reverseGeocodeProvider;
- (RTRelabelerParameters)relabelerParameters;
- (RTRelabelerPersister)init;
- (RTRelabelerPersister)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedPlaceParameters:(id)a5 metrics:(id)a6 persistenceManager:(id)a7 relabelerParameters:(id)a8 reverseGeocodeProvider:(id)a9;
- (RTRelabelerPersister)initWithDistanceCalculator:(id)a3 learnedPlaceParameters:(id)a4 locationShifter:(id)a5 metrics:(id)a6 persistenceManager:(id)a7 relabelerParameters:(id)a8 relabelerPersisterParameters:(id)a9 reverseGeocodeProvider:(id)a10;
- (RTRelabelerPersisterMetrics)metrics;
- (RTRelabelerPersisterParameters)relabelerPersisterParameters;
- (double)scoreLOIMO:(id)a3;
- (double)scoreVisitMO:(id)a3;
- (id)connectedComponentForLoiMO:(id)a3 encounteredIdentifiers:(id)a4 error:(id *)a5;
- (id)dedupableLOIsNearLocation:(id)a3 mapItem:(id)a4 error:(id *)a5;
- (id)fetchClosestUnconcreteLocationOfInterestMOToLocation:(id)a3 withinDistance:(double)a4 distanceCalculator:(id)a5 error:(id *)a6;
- (id)fetchLearnedLocationOfInterestVisitMOForIdentifier:(id)a3 error:(id *)a4;
- (id)fetchLearnedPlaceMOforMapItemIdentifier:(id)a3 error:(id *)a4;
- (id)fetchLocationOfInterestMOforMapItemIdentifier:(id)a3 error:(id *)a4;
- (id)fetchNearbyLocationOfInterestMOsAroundLocation:(id)a3 withinDistance:(double)a4 error:(id *)a5;
- (id)fetchOverlappingUnconcreteLocationOfInterestMOsForLOIMO:(id)a3 distanceCalculator:(id)a4 unusableIdentifiers:(id)a5 error:(id *)a6;
- (id)fetchRevGeoLearnedPlaceInVicinityOfLocation:(id)a3 error:(id *)a4;
- (id)fetchTransitionMOsEndingAtVisitIdentifier:(id)a3 error:(id *)a4;
- (id)fetchTransitionMOsOriginatingFromVisitIdentifier:(id)a3 error:(id *)a4;
- (id)filteredVisitMOs:(id)a3 referenceMapItem:(id)a4 referencePlaceType:(unint64_t)a5 error:(id *)a6;
- (id)learnedPlaceForVisit:(id)a3 creationDate:(id)a4 expirationDate:(id)a5 context:(id)a6 error:(id *)a7;
- (id)loiToMoveToFromConnectedComponent:(id)a3;
- (id)rollLOIIdentifier:(id)a3 context:(id)a4 error:(id *)a5;
- (id)rollUUIDGivenUUID:(id)a3;
- (void)logLocalStoreWithReason:(id)a3;
- (void)setContext:(id)a3;
- (void)setMetrics:(id)a3;
@end

@implementation RTRelabelerPersister

- (RTRelabelerPersister)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_learnedPlaceParameters_metrics_persistenceManager_relabelerParameters_reverseGeocodeProvider_);
}

- (RTRelabelerPersister)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedPlaceParameters:(id)a5 metrics:(id)a6 persistenceManager:(id)a7 relabelerParameters:(id)a8 reverseGeocodeProvider:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (v15)
  {
    v22 = [[RTRelabelerPersisterParameters alloc] initWithDefaultsManager:v15];
    v23 = objc_opt_new();
    self = [(RTRelabelerPersister *)self initWithDistanceCalculator:v16 learnedPlaceParameters:v17 locationShifter:v23 metrics:v18 persistenceManager:v19 relabelerParameters:v20 relabelerPersisterParameters:v22 reverseGeocodeProvider:v21];

    v24 = self;
  }
  else
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v24 = 0;
  }

  return v24;
}

- (RTRelabelerPersister)initWithDistanceCalculator:(id)a3 learnedPlaceParameters:(id)a4 locationShifter:(id)a5 metrics:(id)a6 persistenceManager:(id)a7 relabelerParameters:(id)a8 relabelerPersisterParameters:(id)a9 reverseGeocodeProvider:(id)a10
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v39 = a4;
  id v17 = a4;
  id v40 = a5;
  id v18 = a5;
  id obj = a6;
  id v19 = a6;
  id v20 = a7;
  id v44 = a8;
  id v45 = a9;
  id v21 = a10;
  id v41 = v16;
  v43 = v21;
  if (!v16)
  {
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", buf, 2u);
    }

    v30 = 0;
    v32 = 0;
    v22 = self;
    v23 = v20;
    goto LABEL_21;
  }
  if (!v17)
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = self;
    v23 = v20;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedPlaceParameters", buf, 2u);
    }

    v30 = 0;
    v32 = v41;
LABEL_21:
    v24 = v44;
    goto LABEL_36;
  }
  v22 = self;
  v23 = v20;
  if (!v18)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = v44;
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: locationShifter";
LABEL_32:
    _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    goto LABEL_33;
  }
  v24 = v44;
  if (!v19)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: metrics";
    goto LABEL_32;
  }
  if (!v23)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: persistenceManager";
    goto LABEL_32;
  }
  if (!v44)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: relabelerParameters";
    goto LABEL_32;
  }
  if (!v45)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v35 = "Invalid parameter not satisfying: relabelerPersisterParameters";
      goto LABEL_32;
    }
LABEL_33:

    goto LABEL_34;
  }
  if (v21)
  {
    v46.receiver = self;
    v46.super_class = (Class)RTRelabelerPersister;
    v22 = [(RTRelabelerPersister *)&v46 init];
    if (!v22)
    {
LABEL_14:
      v22 = v22;
      v30 = v22;
LABEL_35:
      v32 = v41;
      goto LABEL_36;
    }
    uint64_t v25 = [v23 managedObjectContext];
    context = v22->_context;
    v22->_context = (NSManagedObjectContext *)v25;

    if (v22->_context)
    {
      objc_storeStrong((id *)&v22->_distanceCalculator, a3);
      objc_storeStrong((id *)&v22->_metrics, obj);
      objc_storeStrong((id *)&v22->_learnedPlaceParameters, v39);
      objc_storeStrong((id *)&v22->_locationShifter, v40);
      uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionary];
      loiIdentifierToUnconcreteMap = v22->_loiIdentifierToUnconcreteMap;
      v22->_loiIdentifierToUnconcreteMap = (NSMutableDictionary *)v27;

      objc_storeStrong((id *)&v22->_relabelerParameters, a8);
      objc_storeStrong((id *)&v22->_relabelerPersisterParameters, a9);
      objc_storeStrong((id *)&v22->_reverseGeocodeProvider, a10);
      v29 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v48 = v17;
        __int16 v49 = 2112;
        id v50 = v45;
        _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "created relabelerPersister with learnedPlaceParameters, %@, relabelerPersisterParameters, %@", buf, 0x16u);
      }

      goto LABEL_14;
    }
LABEL_34:
    v30 = 0;
    goto LABEL_35;
  }
  v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v32 = v41;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reverseGeocodeProvider", buf, 2u);
  }

  v30 = 0;
LABEL_36:

  return v30;
}

+ (id)locationFromAggregateVisits:(id)a3
{
  id v3 = a3;
  v4 = [[_RTMap alloc] initWithInput:v3];

  v5 = [(_RTMap *)v4 withBlock:&__block_literal_global_70];

  v6 = [[RTLearnedLocation alloc] initWithLearnedVisits:v5];

  return v6;
}

id __52__RTRelabelerPersister_locationFromAggregateVisits___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[RTLearnedVisit createWithManagedObject:a2];
}

- (BOOL)unconcreteLOIMO:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(RTRelabelerPersister *)self loiIdentifierToUnconcreteMap];
    v6 = [v4 identifier];
    v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      v8 = [(RTRelabelerPersister *)self loiIdentifierToUnconcreteMap];
      v9 = [v4 identifier];
      v10 = [v8 objectForKeyedSubscript:v9];
      LOBYTE(v11) = [v10 BOOLValue];
    }
    else
    {
      v13 = [v4 visits];
      uint64_t v11 = [v13 count] != 0;

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v14 = [v4 visits];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = [*(id *)(*((void *)&v25 + 1) + 8 * i) locationOfInterestSource];
            uint64_t v20 = [v19 unsignedIntegerValue];

            if (v20)
            {
              uint64_t v11 = 0;
              goto LABEL_17;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_17:

      id v21 = [NSNumber numberWithBool:v11];
      v22 = [(RTRelabelerPersister *)self loiIdentifierToUnconcreteMap];
      v23 = [v4 identifier];
      [v22 setObject:v21 forKeyedSubscript:v23];
    }
  }
  else
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiMO", buf, 2u);
    }

    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)fetchNearbyLocationOfInterestMOsAroundLocation:(id)a3 withinDistance:(double)a4 error:(id *)a5
{
  v94[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = v9;
  if (a5)
  {
    if (!v9)
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F5CFE8];
      uint64_t v93 = *MEMORY[0x1E4F28568];
      v94[0] = @"requires a non-nil location";
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:&v93 count:1];
      v14 = [v19 errorWithDomain:v20 code:7 userInfo:v21];

      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v90 = v16;
        __int16 v91 = 2112;
        v92 = v14;
        goto LABEL_37;
      }
LABEL_10:

      uint64_t v17 = v14;
      id v18 = 0;
      *a5 = v17;
      goto LABEL_33;
    }
    if (a4 < 0.0)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F5CFE8];
      uint64_t v87 = *MEMORY[0x1E4F28568];
      v88 = @"requries a non-negative distance";
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
      v14 = [v11 errorWithDomain:v12 code:7 userInfo:v13];

      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v90 = v16;
        __int16 v91 = 2112;
        v92 = v14;
LABEL_37:
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
    v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.@count > 0", @"visits"];
    v86 = v22;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];

    v23 = +[RTLearnedLocationOfInterestMO fetchRequest];
    v24 = [(RTRelabelerPersister *)self locationShifter];
    id v84 = 0;
    char v25 = [v23 setupBoundingBoxFetchRequestForLocation:v10 distance:1 entityCanBeLocationShifted:v24 locationShifter:0 resultExpansionPredicates:v17 resultFilteringPredicates:&v84 error:a4];
    id v26 = v84;

    if (v25)
    {
      [v23 setReturnsObjectsAsFaults:1];
      [v23 setFetchBatchSize:1];
      id v83 = 0;
      long long v27 = [v23 execute:&v83];
      id v28 = v83;
      v69 = v28;
      if (v28)
      {
        v29 = (void *)MEMORY[0x1E4F28C58];
        v30 = [v28 userInfo];
        uint64_t v31 = [v29 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:2 userInfo:v30];

        v32 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v90 = v23;
          __int16 v91 = 2112;
          v92 = v31;
          _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "nearby fetch request, %@, error, %@", buf, 0x16u);
        }

        id v33 = v31;
        id v18 = 0;
        *a5 = v33;
      }
      else
      {
        v75 = self;
        id v66 = v26;
        v67 = v23;
        v68 = v17;
        v64 = a5;
        v70 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v27 count]];
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        v65 = v27;
        id obj = v27;
        uint64_t v74 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
        if (v74)
        {
          uint64_t v72 = *(void *)v80;
          v73 = v10;
LABEL_19:
          uint64_t v34 = 0;
          while (1)
          {
            if (*(void *)v80 != v72) {
              objc_enumerationMutation(obj);
            }
            v35 = *(void **)(*((void *)&v79 + 1) + 8 * v34);
            context = (void *)MEMORY[0x1E016D870]();
            id v36 = objc_alloc(MEMORY[0x1E4F5CE00]);
            v76 = [v35 locationLatitude];
            [v76 doubleValue];
            double v38 = v37;
            id v39 = [v35 locationLongitude];
            [v39 doubleValue];
            double v41 = v40;
            v42 = [v35 locationHorizontalUncertainty];
            [v42 doubleValue];
            double v44 = v43;
            id v45 = [v35 locationAltitude];
            [v45 doubleValue];
            double v47 = v46;
            id v48 = [v35 locationVerticalUncertainty];
            [v48 doubleValue];
            double v50 = v49;
            uint64_t v51 = [v35 locationReferenceFrame];
            uint64_t v52 = [v51 intValue];
            v53 = [v35 locationSourceAccuracy];
            v54 = [v36 initWithLatitude:0 longitude:v52 horizontalUncertainty:(int)objc_msgSend(v53, "intValue") altitude:v38 verticalUncertainty:v41 date:v44 referenceFrame:v47 speed:v50 sourceAccuracy:0.0];

            v55 = [(RTRelabelerPersister *)v75 distanceCalculator];
            id v78 = 0;
            v10 = v73;
            [v55 distanceFromLocation:v54 toLocation:v73 error:&v78];
            double v57 = v56;
            id v58 = v78;

            if (v58) {
              break;
            }
            if (v57 <= a4) {
              [v70 addObject:v35];
            }

            if (v74 == ++v34)
            {
              uint64_t v74 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
              if (v74) {
                goto LABEL_19;
              }
              goto LABEL_27;
            }
          }
          v59 = (void *)MEMORY[0x1E4F28C58];
          v60 = [v58 userInfo];
          v61 = [v59 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:1 userInfo:v60];

          if (!v61) {
            goto LABEL_30;
          }
          id v62 = v61;
          id *v64 = v62;

          id v18 = 0;
          v23 = v67;
          uint64_t v17 = v68;
          long long v27 = v65;
          id v26 = v66;
          id v33 = v70;
        }
        else
        {
LABEL_27:

LABEL_30:
          id v33 = v70;
          id v18 = v33;
          v23 = v67;
          uint64_t v17 = v68;
          long long v27 = v65;
          id v26 = v66;
        }
      }
    }
    else
    {
      id v18 = 0;
      *a5 = v26;
    }
  }
  else
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    id v18 = 0;
  }
LABEL_33:

  return v18;
}

- (id)fetchClosestUnconcreteLocationOfInterestMOToLocation:(id)a3 withinDistance:(double)a4 distanceCalculator:(id)a5 error:(id *)a6
{
  v91[1] = *MEMORY[0x1E4F143B8];
  double v73 = COERCE_DOUBLE(a3);
  id v11 = a5;
  uint64_t v12 = v11;
  if (a6)
  {
    aSelector = a2;
    if (v11)
    {
      id v80 = 0;
      v13 = [(RTRelabelerPersister *)self fetchNearbyLocationOfInterestMOsAroundLocation:*(void *)&v73 withinDistance:&v80 error:a4];
      v14 = v80;
      uint64_t v15 = v14;
      if (v14)
      {
        uint64_t v16 = 0;
        *a6 = v14;
      }
      else
      {
        v65 = v13;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id obj = v13;
        uint64_t v23 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          v64 = a6;
          v71 = 0;
          uint64_t v25 = *(void *)v77;
          double v26 = 1.79769313e308;
          v68 = self;
          v69 = v12;
          uint64_t v67 = *(void *)v77;
          while (2)
          {
            uint64_t v27 = 0;
            uint64_t v70 = v24;
            do
            {
              if (*(void *)v77 != v25) {
                objc_enumerationMutation(obj);
              }
              id v28 = *(void **)(*((void *)&v76 + 1) + 8 * v27);
              if ([(RTRelabelerPersister *)self unconcreteLOIMO:v28])
              {
                id v29 = objc_alloc(MEMORY[0x1E4F5CE00]);
                uint64_t v74 = [v28 locationLatitude];
                [v74 doubleValue];
                double v31 = v30;
                v32 = [v28 locationLongitude];
                [v32 doubleValue];
                double v34 = v33;
                v35 = [v28 locationHorizontalUncertainty];
                [v35 doubleValue];
                double v37 = v36;
                double v38 = [v28 locationAltitude];
                [v38 doubleValue];
                double v40 = v39;
                double v41 = [v28 locationVerticalUncertainty];
                [v41 doubleValue];
                double v43 = v42;
                double v44 = [v28 locationReferenceFrame];
                uint64_t v45 = [v44 intValue];
                double v46 = [v28 locationSourceAccuracy];
                double v47 = [v29 initWithLatitude:0 longitude:v45 horizontalUncertainty:(int)[v46 intValue] altitude:v31 verticalUncertainty:v34 date:v40 referenceFrame:v43 speed:0.0 sourceAccuracy:0.0];

                uint64_t v12 = v69;
                id v75 = 0;
                [v69 distanceFromLocation:v47 toLocation:*(void *)&v73 error:&v75];
                double v49 = v48;
                id v50 = v75;
                if (v50)
                {
                  uint64_t v52 = v50;
                  v53 = (void *)MEMORY[0x1E4F28C58];
                  v54 = [v50 userInfo];
                  v55 = [v53 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:1 userInfo:v54];

                  double v56 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    v63 = NSStringFromSelector(aSelector);
                    *(_DWORD *)buf = 138413058;
                    long long v82 = v63;
                    __int16 v83 = 2112;
                    double v84 = *(double *)&v47;
                    __int16 v85 = 2112;
                    double v86 = v73;
                    __int16 v87 = 2112;
                    v88 = v55;
                    _os_log_error_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_ERROR, "%@, distance from location %@, to location %@, error, %@", buf, 0x2Au);
                  }
                  id v57 = v55;
                  id *v64 = v57;

                  uint64_t v16 = 0;
                  v13 = v65;
                  uint64_t v15 = 0;
                  id v58 = v71;
                  goto LABEL_31;
                }
                if (v49 < v26)
                {
                  id v51 = v28;

                  v71 = v51;
                  double v26 = v49;
                }
                uint64_t v25 = v67;
                self = v68;
                uint64_t v24 = v70;
              }
              ++v27;
            }
            while (v24 != v27);
            uint64_t v24 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }
        else
        {
          v71 = 0;
        }

        v59 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v60 = [v71 identifier];
          *(_DWORD *)buf = 138412802;
          long long v82 = v60;
          __int16 v83 = 2112;
          double v84 = v73;
          __int16 v85 = 2048;
          double v86 = a4;
          _os_log_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_INFO, "fetched closest unconcrete, identifier, %@, location, %@, distance, %.3f", buf, 0x20u);
        }
        id v58 = v71;
        uint64_t v16 = v58;
        v13 = v65;
        uint64_t v15 = 0;
LABEL_31:
      }
    }
    else
    {
      uint64_t v17 = a6;
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F5CFE8];
      uint64_t v90 = *MEMORY[0x1E4F28568];
      v91[0] = @"requires a non-nil distance calculator";
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:&v90 count:1];
      id v21 = [v18 errorWithDomain:v19 code:7 userInfo:v20];

      v22 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v62 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412546;
        long long v82 = v62;
        __int16 v83 = 2112;
        double v84 = *(double *)&v21;
        _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      uint64_t v15 = v21;
      uint64_t v16 = 0;
      *uint64_t v17 = v15;
    }
  }
  else
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)fetchOverlappingUnconcreteLocationOfInterestMOsForLOIMO:(id)a3 distanceCalculator:(id)a4 unusableIdentifiers:(id)a5 error:(id *)a6
{
  v131[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (!a6)
  {
    double v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    id v37 = 0;
    goto LABEL_42;
  }
  if (!v10)
  {
    double v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F5CFE8];
    uint64_t v130 = *MEMORY[0x1E4F28568];
    v131[0] = @"requires a non-nil loiMO";
    double v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v131 forKeys:&v130 count:1];
    double v41 = [v38 errorWithDomain:v39 code:7 userInfo:v40];

    double v42 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    double v43 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v118 = (uint64_t)v43;
    __int16 v119 = 2112;
    v120 = v41;
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    goto LABEL_17;
  }
  if (!v12)
  {
    double v44 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F5CFE8];
    uint64_t v128 = *MEMORY[0x1E4F28568];
    v129 = @"requires a non-nil unusable identifiers set";
    double v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
    double v41 = [v44 errorWithDomain:v45 code:7 userInfo:v46];

    double v42 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    double v43 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v118 = (uint64_t)v43;
    __int16 v119 = 2112;
    v120 = v41;
    goto LABEL_16;
  }
  if (!v11)
  {
    double v47 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v48 = *MEMORY[0x1E4F5CFE8];
    uint64_t v126 = *MEMORY[0x1E4F28568];
    v127 = @"requires a non-nil distance calculator";
    double v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
    double v41 = [v47 errorWithDomain:v48 code:7 userInfo:v49];

    double v42 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      double v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v118 = (uint64_t)v43;
      __int16 v119 = 2112;
      v120 = v41;
      goto LABEL_16;
    }
LABEL_17:

    double v33 = v41;
    id v37 = 0;
    *a6 = v33;
    goto LABEL_42;
  }
  aSelector = a2;
  v100 = a6;
  id v104 = v12;
  v105 = v11;
  id v14 = objc_alloc(MEMORY[0x1E4F5CE00]);
  uint64_t v15 = [v10 locationLatitude];
  [v15 doubleValue];
  double v17 = v16;
  id v18 = [v10 locationLongitude];
  [v18 doubleValue];
  double v20 = v19;
  id v21 = [v10 locationHorizontalUncertainty];
  [v21 doubleValue];
  double v23 = v22;
  uint64_t v24 = [v10 locationAltitude];
  [v24 doubleValue];
  double v26 = v25;
  uint64_t v27 = [v10 locationVerticalUncertainty];
  [v27 doubleValue];
  double v29 = v28;
  double v30 = [v10 locationReferenceFrame];
  uint64_t v31 = [v30 intValue];
  v32 = [v10 locationSourceAccuracy];
  double v33 = [v14 initWithLatitude:0 longitude:v31 horizontalUncertainty:(int)v32.intValue altitude:v17 verticalUncertainty:v20 date:v23 referenceFrame:v26 speed:v29 sourceAccuracy:0.0];

  double v34 = [(RTRelabelerPersister *)self relabelerPersisterParameters];
  [v34 unconcreteLOICollapseDistanceThreshold];
  id v116 = 0;
  v35 = -[RTRelabelerPersister fetchNearbyLocationOfInterestMOsAroundLocation:withinDistance:error:](self, "fetchNearbyLocationOfInterestMOsAroundLocation:withinDistance:error:", v33, &v116);
  id v36 = v116;

  if (v36)
  {
    id v37 = 0;
    id *v100 = v36;
    v13 = v104;
    id v11 = v105;
  }
  else
  {
    v103 = v33;
    v101 = [MEMORY[0x1E4F1CA48] array];
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v98 = v35;
    id obj = v35;
    uint64_t v50 = [obj countByEnumeratingWithState:&v112 objects:v125 count:16];
    v13 = v104;
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = self;
      uint64_t v53 = *(void *)v113;
      id v102 = v10;
      while (2)
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v113 != v53) {
            objc_enumerationMutation(obj);
          }
          v55 = *(void **)(*((void *)&v112 + 1) + 8 * i);
          double v56 = [v55 identifier];
          id v57 = [v10 identifier];
          char v58 = [v56 isEqual:v57];

          if ((v58 & 1) == 0)
          {
            v59 = [v55 identifier];
            v60 = [v13 member:v59];

            if (!v60)
            {
              if ([(RTRelabelerPersister *)v52 unconcreteLOIMO:v55])
              {
                id v106 = objc_alloc(MEMORY[0x1E4F5CE00]);
                v108 = [v55 locationLatitude];
                [v108 doubleValue];
                double v62 = v61;
                v107 = [v55 locationLongitude];
                [v107 doubleValue];
                double v64 = v63;
                v65 = [v55 locationHorizontalUncertainty];
                [v65 doubleValue];
                double v67 = v66;
                v68 = [v55 locationAltitude];
                [v68 doubleValue];
                double v70 = v69;
                v71 = [v55 locationVerticalUncertainty];
                [v71 doubleValue];
                double v73 = v72;
                uint64_t v74 = [v55 locationReferenceFrame];
                uint64_t v75 = [v74 intValue];
                long long v76 = [v55 locationSourceAccuracy];
                long long v77 = [v106 initWithLatitude:0 longitude:v75 horizontalUncertainty:(int)objc_msgSend(v76, "intValue") altitude:v62 verticalUncertainty:v64 date:v70 speed:v73 sourceAccuracy:0.0];

                id v111 = 0;
                [v105 distanceFromLocation:v77 toLocation:v103 error:&v111];
                double v79 = v78;
                id v80 = v111;
                if (v80)
                {
                  uint64_t v90 = v80;
                  __int16 v91 = (void *)MEMORY[0x1E4F28C58];
                  v92 = [v80 userInfo];
                  uint64_t v93 = [v91 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:1 userInfo:v92];

                  v94 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                  if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                  {
                    v97 = NSStringFromSelector(aSelector);
                    *(_DWORD *)buf = 138413058;
                    uint64_t v118 = (uint64_t)v97;
                    __int16 v119 = 2112;
                    v120 = v77;
                    __int16 v121 = 2112;
                    v122 = v103;
                    __int16 v123 = 2112;
                    v124 = v93;
                    _os_log_error_impl(&dword_1D9BFA000, v94, OS_LOG_TYPE_ERROR, "%@, distance from location %@, to location %@, error, %@", buf, 0x2Au);
                  }
                  id v95 = v93;
                  id *v100 = v95;

                  id v37 = 0;
                  __int16 v85 = v101;
                  id v10 = v102;
                  v13 = v104;
                  id v11 = v105;
                  id v36 = 0;
                  v35 = v98;
                  goto LABEL_40;
                }
                [v77 horizontalUncertainty];
                double v82 = v79 - v81;
                [v103 horizontalUncertainty];
                if (v82 - v83 < 0.0) {
                  [v101 addObject:v55];
                }

                id v10 = v102;
                v13 = v104;
                uint64_t v52 = self;
              }
            }
          }
        }
        uint64_t v51 = [obj countByEnumeratingWithState:&v112 objects:v125 count:16];
        if (v51) {
          continue;
        }
        break;
      }
    }
    double v84 = v10;

    __int16 v85 = v101;
    double v86 = [[_RTMap alloc] initWithInput:v101];
    id obj = [(_RTMap *)v86 withBlock:&__block_literal_global_244];

    __int16 v87 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      uint64_t v88 = [obj count];
      v89 = [v84 identifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v118 = v88;
      __int16 v119 = 2112;
      v120 = v89;
      _os_log_impl(&dword_1D9BFA000, v87, OS_LOG_TYPE_INFO, "fetched %lu overlapping LOI MOs, initial identifier, %@", buf, 0x16u);
    }
    id v11 = v105;
    id v36 = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      [obj enumerateObjectsUsingBlock:&__block_literal_global_248];
    }
    id v37 = v101;
    id v10 = v84;
    v35 = v98;
LABEL_40:

    double v33 = v103;
  }

LABEL_42:

  return v37;
}

uint64_t __125__RTRelabelerPersister_fetchOverlappingUnconcreteLocationOfInterestMOsForLOIMO_distanceCalculator_unusableIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __125__RTRelabelerPersister_fetchOverlappingUnconcreteLocationOfInterestMOsForLOIMO_distanceCalculator_unusableIdentifiers_error___block_invoke_245(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "overlapping identifier, %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)fetchLearnedLocationOfInterestVisitMOForIdentifier:(id)a3 error:(id *)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      v8 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
      id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v7];
      [v8 setPredicate:v9];

      [v8 setFetchLimit:1];
      [v8 setReturnsObjectsAsFaults:0];
      id v30 = 0;
      id v10 = [v8 execute:&v30];
      id v11 = v30;
      id v12 = [v10 firstObject];

      if (v11)
      {
        v13 = (void *)MEMORY[0x1E4F28C58];
        id v14 = [v11 userInfo];
        uint64_t v15 = [v13 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:2 userInfo:v14];

        id v16 = v15;
        *a4 = v16;
      }
      else
      {
        if (v12)
        {
          id v17 = v12;
          goto LABEL_14;
        }
        uint64_t v24 = [NSString stringWithFormat:@"candidate visit was not found for identifier, %@", v7];
        double v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v31 = *MEMORY[0x1E4F28568];
        v32 = v24;
        double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        uint64_t v27 = [v25 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:3 userInfo:v26];

        id v28 = v27;
        *a4 = v28;
      }
      id v17 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    v38[0] = @"requires a non-nil identifier";
    double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v21 = [v18 errorWithDomain:v19 code:7 userInfo:v20];

    double v22 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      double v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      double v34 = v29;
      __int16 v35 = 2112;
      id v36 = v21;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    v8 = v21;
    id v17 = 0;
    *a4 = v8;
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    id v17 = 0;
  }
LABEL_15:

  return v17;
}

- (id)fetchTransitionMOsOriginatingFromVisitIdentifier:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      v8 = +[RTLearnedLocationOfInterestTransitionMO fetchRequest];
      id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"visitIdentifierOrigin", v7];
      [v8 setPredicate:v9];

      id v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
      id v28 = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      [v8 setSortDescriptors:v11];

      [v8 setReturnsObjectsAsFaults:0];
      id v27 = 0;
      id v12 = [v8 execute:&v27];
      id v13 = v27;
      id v14 = v13;
      if (v13)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        id v16 = [v13 userInfo];
        id v17 = [v15 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:2 userInfo:v16];

        id v18 = v17;
        *a4 = v18;

        id v19 = 0;
      }
      else
      {
        id v19 = v12;
      }
    }
    else
    {
      double v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F5CFE8];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v34[0] = @"requires a non-nil identifier";
      double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      double v23 = [v20 errorWithDomain:v21 code:7 userInfo:v22];

      uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        double v26 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v30 = v26;
        __int16 v31 = 2112;
        v32 = v23;
        _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      v8 = v23;
      id v19 = 0;
      *a4 = v8;
    }
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    id v19 = 0;
  }

  return v19;
}

- (id)fetchTransitionMOsEndingAtVisitIdentifier:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      v8 = +[RTLearnedLocationOfInterestTransitionMO fetchRequest];
      id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"visitIdentifierDestination", v7];
      [v8 setPredicate:v9];

      id v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
      id v28 = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      [v8 setSortDescriptors:v11];

      [v8 setReturnsObjectsAsFaults:0];
      id v27 = 0;
      id v12 = [v8 execute:&v27];
      id v13 = v27;
      id v14 = v13;
      if (v13)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        id v16 = [v13 userInfo];
        id v17 = [v15 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:2 userInfo:v16];

        id v18 = v17;
        *a4 = v18;

        id v19 = 0;
      }
      else
      {
        id v19 = v12;
      }
    }
    else
    {
      double v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F5CFE8];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v34[0] = @"requires a non-nil identifier";
      double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      double v23 = [v20 errorWithDomain:v21 code:7 userInfo:v22];

      uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        double v26 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v30 = v26;
        __int16 v31 = 2112;
        v32 = v23;
        _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      v8 = v23;
      id v19 = 0;
      *a4 = v8;
    }
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    id v19 = 0;
  }

  return v19;
}

- (id)fetchLocationOfInterestMOforMapItemIdentifier:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      v8 = +[RTLearnedLocationOfInterestMO fetchRequest];
      id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"placeMapItemIdentifier", v7];
      [v8 setPredicate:v9];

      [v8 setFetchLimit:1];
      [v8 setReturnsObjectsAsFaults:0];
      id v32 = 0;
      id v10 = [v8 execute:&v32];
      id v11 = v32;
      id v12 = [v10 firstObject];

      if (v11)
      {
        id v13 = (void *)MEMORY[0x1E4F28C58];
        id v14 = [v11 userInfo];
        uint64_t v15 = [v13 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:2 userInfo:v14];

        id v16 = v15;
        *a4 = v16;
      }
      else
      {
        if (v12)
        {
          id v17 = v12;
          goto LABEL_14;
        }
        uint64_t v24 = [NSString stringWithFormat:@"LOI for mapItem identifier, %@, not found", v7];
        double v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        double v34 = v24;
        double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        id v27 = [v25 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:4 userInfo:v26];

        id v28 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          __int16 v31 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          id v36 = v31;
          __int16 v37 = 2112;
          double v38 = v27;
          _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        id v29 = v27;
        *a4 = v29;
      }
      id v17 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40[0] = @"requires a non-nil identifier";
    double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v21 = [v18 errorWithDomain:v19 code:7 userInfo:v20];

    double v22 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v30 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v36 = v30;
      __int16 v37 = 2112;
      double v38 = v21;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    v8 = v21;
    id v17 = 0;
    *a4 = v8;
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    id v17 = 0;
  }
LABEL_15:

  return v17;
}

- (id)fetchLearnedPlaceMOforMapItemIdentifier:(id)a3 error:(id *)a4
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      v8 = +[RTLearnedLocationOfInterestMO fetchRequest];
      id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"placeMapItemIdentifier", v7];
      [v8 setPredicate:v9];

      [v8 setFetchLimit:1];
      [v8 setReturnsObjectsAsFaults:0];
      id v50 = 0;
      id v10 = [v8 execute:&v50];
      id v11 = v50;
      id v12 = [v10 firstObject];

      if (v11)
      {
        id v13 = (void *)MEMORY[0x1E4F28C58];
        id v14 = [v11 userInfo];
        uint64_t v15 = [v13 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:2 userInfo:v14];

        id v16 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          double v42 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v54 = v42;
          __int16 v55 = 2112;
          double v56 = v15;
          _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, fetchLOIError, %@", buf, 0x16u);
        }
        id v17 = v15;
        id v18 = 0;
        *a4 = v17;
        goto LABEL_21;
      }
      id v17 = +[RTLearnedPlaceMO fetchRequest];
      uint64_t v24 = (void *)MEMORY[0x1E4F28F60];
      double v25 = [v12 placeIdentifier];
      double v26 = [v24 predicateWithFormat:@"%K == %@", @"identifier", v25];
      [v17 setPredicate:v26];

      id v49 = 0;
      id v27 = [v17 execute:&v49];
      id v28 = v49;
      id v29 = [v27 firstObject];

      if (v28)
      {
        double v47 = v29;
        id v48 = v28;
        id v30 = (void *)MEMORY[0x1E4F28C58];
        __int16 v31 = [v28 userInfo];
        id v32 = [v30 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:2 userInfo:v31];

        uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          double v44 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v54 = v44;
          __int16 v55 = 2112;
          double v56 = v32;
          _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, fetchPlaceError, %@", buf, 0x16u);
        }
        id v34 = v32;
        *a4 = v34;
      }
      else
      {
        if (v29)
        {
          id v18 = v29;
          goto LABEL_20;
        }
        double v47 = 0;
        id v48 = 0;
        uint64_t v36 = [NSString stringWithFormat:@"learnedPlaceMO was nil for identifier, %@", v7];
        __int16 v37 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v51 = *MEMORY[0x1E4F28568];
        uint64_t v52 = v36;
        double v46 = (void *)v36;
        double v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        uint64_t v39 = [v37 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:5 userInfo:v38];

        double v40 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          uint64_t v45 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v54 = v45;
          __int16 v55 = 2112;
          double v56 = v39;
          _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "%@, learnedPlaceMOError, %@", buf, 0x16u);
        }
        id v41 = v39;
        *a4 = v41;
      }
      id v18 = 0;
      id v29 = v47;
      id v28 = v48;
LABEL_20:

LABEL_21:
      goto LABEL_22;
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F5CFE8];
    uint64_t v57 = *MEMORY[0x1E4F28568];
    v58[0] = @"requires a non-nil identifier";
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
    double v22 = [v19 errorWithDomain:v20 code:7 userInfo:v21];

    double v23 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      double v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v54 = v43;
      __int16 v55 = 2112;
      double v56 = v22;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    v8 = v22;
    id v18 = 0;
    *a4 = v8;
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    id v18 = 0;
  }
LABEL_22:

  return v18;
}

- (id)fetchRevGeoLearnedPlaceInVicinityOfLocation:(id)a3 error:(id *)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K & %lu) != 0", @"mapItemSource", 1];
    v72[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];

    id v9 = +[RTMapItemMO fetchRequest];
    id v10 = [(RTRelabelerPersister *)self relabelerPersisterParameters];
    [v10 reverseGeocodePlaceFetchDistanceThreshold];
    double v12 = v11;
    id v13 = [(RTRelabelerPersister *)self locationShifter];
    id v66 = 0;
    char v14 = [v9 setupBoundingBoxFetchRequestForLocation:v6 distance:1 entityCanBeLocationShifted:v13 locationShifter:0 resultExpansionPredicates:v8 resultFilteringPredicates:&v66 error:v12];
    id v15 = v66;

    if ((v14 & 1) == 0)
    {
      uint64_t v19 = 0;
      if (a4) {
        *a4 = v15;
      }
LABEL_35:

      goto LABEL_36;
    }
    id v65 = 0;
    id v16 = [v9 execute:&v65];
    id v17 = v65;
    id v18 = v17;
    if (v17)
    {
      uint64_t v19 = 0;
      if (a4) {
        *a4 = v17;
      }
LABEL_34:

      goto LABEL_35;
    }
    uint64_t v52 = v16;
    id v53 = v15;
    v54 = v9;
    __int16 v55 = v8;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v16;
    uint64_t v21 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (!v21)
    {
      uint64_t v57 = 0;
      goto LABEL_33;
    }
    uint64_t v22 = v21;
    uint64_t v57 = 0;
    uint64_t v59 = *(void *)v62;
    double v23 = 1.79769313e308;
LABEL_15:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v62 != v59) {
        objc_enumerationMutation(obj);
      }
      double v25 = *(void **)(*((void *)&v61 + 1) + 8 * v24);
      double v26 = [v25 place];

      if (!v26) {
        goto LABEL_27;
      }
      id v27 = objc_alloc(MEMORY[0x1E4F5CE00]);
      id v28 = [v25 latitude];
      [v28 doubleValue];
      double v30 = v29;
      __int16 v31 = [v25 longitude];
      [v31 doubleValue];
      double v33 = v32;
      [v25 uncertainty];
      id v34 = self;
      uint64_t v36 = v35 = v6;
      [v36 doubleValue];
      double v38 = v37;
      uint64_t v39 = [v25 referenceFrame];
      double v40 = [v27 initWithLatitude:0 longitude:[v39 intValue] horizontalUncertainty:v30 date:v33 referenceFrame:v38];

      id v6 = v35;
      self = v34;

      id v41 = [(RTRelabelerPersister *)v34 distanceCalculator];
      id v60 = 0;
      [v41 distanceFromLocation:v40 toLocation:v6 error:&v60];
      double v43 = v42;
      id v44 = v60;

      if (v44)
      {
        uint64_t v45 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          double v46 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v68 = v46;
          __int16 v69 = 2112;
          id v70 = v44;
          _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "%@, distance error, %@", buf, 0x16u);
        }
      }
      else
      {
        double v47 = [(RTRelabelerPersister *)v34 relabelerPersisterParameters];
        [v47 reverseGeocodePlaceFetchDistanceThreshold];
        double v49 = v48;

        if (v43 > v49 || v43 >= v23) {
          goto LABEL_26;
        }
        uint64_t v45 = [v25 place];
        uint64_t v50 = +[RTLearnedPlace createWithManagedObject:v45];

        double v23 = v43;
        uint64_t v57 = (void *)v50;
      }

LABEL_26:
LABEL_27:
      if (v22 == ++v24)
      {
        uint64_t v22 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
        if (!v22)
        {
LABEL_33:

          id v9 = v54;
          v8 = v55;
          id v16 = v52;
          id v15 = v53;
          id v18 = 0;
          uint64_t v19 = v57;
          goto LABEL_34;
        }
        goto LABEL_15;
      }
    }
  }
  uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"location");
    uint64_t v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v19 = 0;
  }
LABEL_36:

  return v19;
}

- (id)learnedPlaceForVisit:(id)a3 creationDate:(id)a4 expirationDate:(id)a5 context:(id)a6 error:(id *)a7
{
  v94[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = v16;
  if (!a7)
  {
    double v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_24;
  }
  if (v16)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v13 identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v90 = v19;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "rev geo query for visit identifier, %@", buf, 0xCu);
    }
    if (v13)
    {
      if (v14)
      {
        if (v15)
        {
          aSelector = a2;
          uint64_t v20 = [v13 location];
          uint64_t v21 = [v20 location];
          id v80 = 0;
          uint64_t v22 = [(RTRelabelerPersister *)self fetchRevGeoLearnedPlaceInVicinityOfLocation:v21 error:&v80];
          id v23 = v80;

          if (v23)
          {
            uint64_t v24 = 0;
            *a7 = v23;
LABEL_36:

            goto LABEL_25;
          }
          if (v22)
          {
            uint64_t v24 = v22;
            goto LABEL_36;
          }
          id v41 = objc_alloc(MEMORY[0x1E4F5CE78]);
          long long v76 = [(RTRelabelerPersister *)self relabelerPersisterParameters];
          [v76 reverseGeocodeLeewayDistance];
          double v43 = v42;
          double v73 = [v13 location];
          id v44 = [v73 location];
          uint64_t v45 = [v13 entryDate];
          double v46 = [v13 exitDate];
          uint64_t v47 = [v41 initWithinDistance:v44 location:v45 startDate:v46 endDate:v43];

          reverseGeocodeProvider = self->_reverseGeocodeProvider;
          id v79 = 0;
          double v49 = [(RTMapItemProviderReverseGeocode *)reverseGeocodeProvider mapItemsWithOptions:v47 error:&v79];
          id v50 = v79;
          long long v77 = [v49 firstObject];

          uint64_t v51 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v90 = v77;
            __int16 v91 = 2112;
            id v92 = v50;
            _os_log_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_INFO, "rev geo query result, %@, error, %@", buf, 0x16u);
          }

          uint64_t v74 = v50;
          uint64_t v75 = (void *)v47;
          if (v50)
          {
            uint64_t v52 = (void *)MEMORY[0x1E4F28C58];
            id v53 = [v50 userInfo];
            v54 = [v52 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:6 userInfo:v53];

            __int16 v55 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
              goto LABEL_34;
            }
            id v65 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412546;
            uint64_t v90 = v65;
            __int16 v91 = 2112;
            id v92 = v54;
            id v66 = "%@, rev geo error, %@";
          }
          else
          {
            if (v77)
            {
              uint64_t v57 = [RTLearnedPlace alloc];
              char v58 = [MEMORY[0x1E4F29128] UUID];
              uint64_t v59 = [v77 mapItem];
              id v60 = [(RTLearnedPlace *)v57 initWithIdentifier:v58 type:0 typeSource:0 mapItem:v59 customLabel:0 creationDate:v14 expirationDate:v15];

              if (v60)
              {
                id v61 = [(RTLearnedPlace *)v60 managedObjectWithContext:v17];
                long long v62 = [(RTRelabelerPersister *)self metrics];
                [v62 tallyKey:@"numberOfPlaceholderNotCollapsedRevGeoQuery"];

                double v56 = v60;
                uint64_t v24 = v56;
              }
              else
              {
                double v67 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v81 = *MEMORY[0x1E4F28568];
                double v82 = @"learned place was nil";
                v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
                __int16 v69 = [v67 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:0 userInfo:v68];

                id v70 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  double v72 = NSStringFromSelector(aSelector);
                  *(_DWORD *)buf = 138412546;
                  uint64_t v90 = v72;
                  __int16 v91 = 2112;
                  id v92 = v69;
                  _os_log_error_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
                }
                id v71 = v69;
                *a7 = v71;

                double v56 = 0;
                uint64_t v24 = 0;
              }
              goto LABEL_35;
            }
            long long v63 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v83 = *MEMORY[0x1E4F28568];
            double v84 = @"could not get a rev geo map item";
            long long v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
            v54 = [v63 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:6 userInfo:v64];

            __int16 v55 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
LABEL_34:

              double v56 = v54;
              uint64_t v24 = 0;
              *a7 = v56;
LABEL_35:
              id v23 = 0;
              uint64_t v22 = 0;

              goto LABEL_36;
            }
            id v65 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412546;
            uint64_t v90 = v65;
            __int16 v91 = 2112;
            id v92 = v54;
            id v66 = "%@, error, %@";
          }
          _os_log_error_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_ERROR, v66, buf, 0x16u);

          goto LABEL_34;
        }
        uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v37 = *MEMORY[0x1E4F5CFE8];
        uint64_t v85 = *MEMORY[0x1E4F28568];
        double v86 = @"requires a non-nil expirationDate";
        double v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        double v30 = [v36 errorWithDomain:v37 code:7 userInfo:v38];

        __int16 v31 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        double v32 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        uint64_t v90 = v32;
        __int16 v91 = 2112;
        id v92 = v30;
        goto LABEL_22;
      }
      double v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F5CFE8];
      uint64_t v87 = *MEMORY[0x1E4F28568];
      uint64_t v88 = @"requires a non-nil creationDate";
      id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
      double v30 = [v33 errorWithDomain:v34 code:7 userInfo:v35];

      __int16 v31 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        double v32 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        uint64_t v90 = v32;
        __int16 v91 = 2112;
        id v92 = v30;
        goto LABEL_22;
      }
    }
    else
    {
      id v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F5CFE8];
      uint64_t v93 = *MEMORY[0x1E4F28568];
      v94[0] = @"requires a non-nil visit";
      double v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:&v93 count:1];
      double v30 = [v27 errorWithDomain:v28 code:7 userInfo:v29];

      __int16 v31 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        double v32 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        uint64_t v90 = v32;
        __int16 v91 = 2112;
        id v92 = v30;
LABEL_22:
        _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
    }
LABEL_23:

    id v39 = v30;
    *a7 = v39;

LABEL_24:
    uint64_t v24 = 0;
    goto LABEL_25;
  }
  double v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
  }

  _RTErrorInvalidParameterCreate(@"context");
  uint64_t v24 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v24;
}

- (BOOL)restoreVisit:(id)a3 transitions:(id)a4 toOldCandidate:(id)a5 error:(id *)a6
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = v13;
  if (a6)
  {
    if (v11)
    {
      if (v13)
      {
        id v15 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          id v16 = [v11 identifier];
          id v17 = [v14 secondObject];
          id v18 = [v17 identifier];
          *(_DWORD *)buf = 138412546;
          id v49 = v16;
          __int16 v50 = 2112;
          uint64_t v51 = v18;
          _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "restoring visit identifier, %@, to old map item identifier, %@", buf, 0x16u);
        }
        uint64_t v19 = [v14 secondObject];
        uint64_t v20 = [v19 identifier];
        id v44 = 0;
        uint64_t v21 = [(RTRelabelerPersister *)self fetchLocationOfInterestMOforMapItemIdentifier:v20 error:&v44];
        uint64_t v22 = v44;

        BOOL v23 = v22 == 0;
        if (v22)
        {
          *a6 = v22;
        }
        else
        {
          [v11 setLocationOfInterest:v21];
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v33 = v12;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v40 objects:v45 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v41;
            do
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (*(void *)v41 != v36) {
                  objc_enumerationMutation(v33);
                }
                [*(id *)(*((void *)&v40 + 1) + 8 * i) setLocationOfInterest:v21, (void)v40];
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v40 objects:v45 count:16];
            }
            while (v35);
          }

          double v38 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v11;
            _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "successfully restored visit, %@", buf, 0xCu);
          }
        }
        goto LABEL_26;
      }
      double v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F5CFE8];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      uint64_t v47 = @"requires a non-nil oldCandidate";
      double v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      id v27 = [v30 errorWithDomain:v31 code:7 userInfo:v32];

      uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        uint64_t v22 = v27;
        BOOL v23 = 0;
        *a6 = v22;
        goto LABEL_26;
      }
      double v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v49 = v29;
      __int16 v50 = 2112;
      uint64_t v51 = v27;
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F5CFE8];
      uint64_t v52 = *MEMORY[0x1E4F28568];
      v53[0] = @"requires a non-nil visit";
      double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
      id v27 = [v24 errorWithDomain:v25 code:7 userInfo:v26];

      uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      double v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v49 = v29;
      __int16 v50 = 2112;
      uint64_t v51 = v27;
    }
    _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    goto LABEL_14;
  }
  uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }
  BOOL v23 = 0;
LABEL_26:

  return v23;
}

- (BOOL)restoreToOldCandidate:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = v7;
  if (a4)
  {
    if (v7)
    {
      objc_initWeak(location, self);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52__RTRelabelerPersister_restoreToOldCandidate_error___block_invoke;
      v17[3] = &unk_1E6B98558;
      objc_copyWeak(v19, location);
      v19[1] = (id)a2;
      id v18 = v8;
      id v9 = (void *)MEMORY[0x1E016DB00](v17);
      id v16 = 0;
      [(RTRelabelerPersister *)self performBlock:v9 error:&v16];
      id v10 = v16;
      id v11 = v10;
      BOOL v12 = v10 == 0;
      if (v10) {
        *a4 = v10;
      }

      objc_destroyWeak(v19);
      objc_destroyWeak(location);
    }
    else
    {
      id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: oldCandidate", (uint8_t *)location, 2u);
      }

      _RTErrorInvalidParameterCreate(@"oldCandidate");
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", (uint8_t *)location, 2u);
    }

    BOOL v12 = 0;
  }

  return v12;
}

void __52__RTRelabelerPersister_restoreToOldCandidate_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v6 = [*(id *)(a1 + 32) firstObject];
      id v7 = [v6 identifier];
      v8 = [WeakRetained fetchLearnedLocationOfInterestVisitMOForIdentifier:v7 error:a3];

      if (!*a3)
      {
        id v9 = [*(id *)(a1 + 32) firstObject];
        id v10 = [v9 identifier];
        id v11 = [WeakRetained fetchTransitionMOsEndingAtVisitIdentifier:v10 error:a3];

        if (!*a3) {
          [WeakRetained restoreVisit:v8 transitions:v11 toOldCandidate:*(void *)(a1 + 32) error:a3];
        }
      }
    }
    else
    {
      BOOL v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = @"swelf is nil";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      id v15 = [v12 errorWithDomain:v13 code:0 userInfo:v14];

      id v16 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
        int v19 = 138412546;
        uint64_t v20 = v18;
        __int16 v21 = 2112;
        uint64_t v22 = v15;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, error, %@", (uint8_t *)&v19, 0x16u);
      }
      id v17 = v15;
      *a3 = v17;
    }
  }
}

- (BOOL)performBlock:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (a4)
  {
    *(void *)buf = 0;
    uint64_t v20 = buf;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__86;
    uint64_t v23 = __Block_byref_object_dispose__86;
    id v24 = 0;
    objc_initWeak(&location, self);
    v8 = [(RTRelabelerPersister *)self context];

    if (v8)
    {
      id v9 = [(RTRelabelerPersister *)self context];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __43__RTRelabelerPersister_performBlock_error___block_invoke;
      v14[3] = &unk_1E6B98580;
      objc_copyWeak(v17, &location);
      v17[1] = (id)a2;
      id v16 = buf;
      id v15 = v7;
      [v9 performBlockAndWait:v14];

      id v10 = (void *)*((void *)v20 + 5);
      BOOL v11 = v10 == 0;
      if (v10) {
        *a4 = v10;
      }

      objc_destroyWeak(v17);
    }
    else
    {
      BOOL v11 = 0;
    }
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

void __43__RTRelabelerPersister_performBlock_error___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [WeakRetained context];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    (*(void (**)(uint64_t, void *, id *))(v4 + 16))(v4, v5, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F5CFE8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"swelf is nil";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v10 = [v7 errorWithDomain:v8 code:0 userInfo:v9];

    BOOL v11 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      id v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v10;
  }
}

- (BOOL)untrustedVisitMO:(id)a3
{
  id v4 = a3;
  id v5 = [v4 locationOfInterestSource];
  BOOL v6 = ([v5 unsignedIntegerValue] & 0xFDFDE) == 0;

  id v7 = [v4 locationOfInterestConfidence];

  [v7 doubleValue];
  double v9 = v8;
  uint64_t v10 = [(RTRelabelerPersister *)self relabelerParameters];
  [v10 passthroughThreshold];
  double v12 = v11;

  return v9 < v12 && v6;
}

- (double)scoreVisitMO:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(RTRelabelerPersister *)self untrustedVisitMO:v4])
    {
      id v5 = [(RTRelabelerPersister *)self learnedPlaceParameters];
      [v5 revGeoConfidence];
    }
    else
    {
      double v9 = [v4 locationOfInterestSource];
      __int16 v10 = [v9 unsignedIntegerValue];

      if ((v10 & 0x2000) != 0)
      {
        id v5 = [v4 locationOfInterestConfidence];
        [v5 doubleValue];
      }
      else
      {
        id v5 = [(RTRelabelerPersister *)self learnedPlaceParameters];
        [v5 nonRevGeoConfidence];
      }
    }
    double v8 = v6;
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v12 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitMO", v12, 2u);
    }

    double v8 = -1.79769313e308;
  }

  return v8;
}

- (double)scoreLOIMO:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiMO", buf, 2u);
    }
    goto LABEL_14;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [a3 visits];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (!v5)
  {
LABEL_14:
    double v8 = -1.79769313e308;
    goto LABEL_15;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v13;
  double v8 = -1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      [(RTRelabelerPersister *)self scoreVisitMO:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      if (v10 > v8) {
        double v8 = v10;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  }
  while (v6);
LABEL_15:

  return v8;
}

- (BOOL)resnapVisitsWithError:(id *)a3
{
  if (a3)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "resnapping learned places", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__RTRelabelerPersister_resnapVisitsWithError___block_invoke;
    v13[3] = &unk_1E6B985A8;
    objc_copyWeak(v14, buf);
    v14[1] = (id)a2;
    uint64_t v7 = (void *)MEMORY[0x1E016DB00](v13);
    id v12 = 0;
    [(RTRelabelerPersister *)self performBlock:v7 error:&v12];
    id v8 = v12;
    BOOL v9 = v8 == 0;
    if (v8)
    {
      [(RTRelabelerPersisterMetrics *)self->_metrics tallyError:v8];
      [(RTRelabelerPersisterMetrics *)self->_metrics setErrorKey:@"resnappingErroredOut"];
      *a3 = v8;
    }

    objc_destroyWeak(v14);
    objc_destroyWeak(buf);
  }
  else
  {
    double v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", (uint8_t *)buf, 2u);
    }

    return 0;
  }
  return v9;
}

void __46__RTRelabelerPersister_resnapVisitsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v160[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a3) {
    goto LABEL_77;
  }
  id v116 = v5;
  uint64_t v113 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    id v16 = a3;
    __int16 v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F5CFE8];
    uint64_t v159 = *MEMORY[0x1E4F28568];
    v160[0] = @"swelf is nil";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v160 forKeys:&v159 count:1];
    uint64_t v20 = [v17 errorWithDomain:v18 code:0 userInfo:v19];

    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v108 = NSStringFromSelector(*(SEL *)(v113 + 40));
      *(_DWORD *)buf = 138412546;
      v156 = v108;
      __int16 v157 = 2112;
      double v158 = *(double *)&v20;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    id v22 = v20;
    *id v16 = v22;
    goto LABEL_76;
  }
  uint64_t v7 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
  [v7 setFetchBatchSize:10];
  [v7 setReturnsObjectsAsFaults:0];
  id v151 = 0;
  long long v115 = v7;
  id v8 = [v7 execute:&v151];
  id v9 = v151;
  v117 = v8;
  id v114 = v9;
  if (v9)
  {
    double v10 = a3;
    double v11 = (void *)MEMORY[0x1E4F28C58];
    id v12 = [v9 userInfo];
    long long v13 = [v11 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:2 userInfo:v12];

    long long v14 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v107 = NSStringFromSelector(*(SEL *)(v113 + 40));
      *(_DWORD *)buf = 138412546;
      v156 = v107;
      __int16 v157 = 2112;
      double v158 = *(double *)&v13;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, fetch visit MOs error, %@", buf, 0x16u);

      id v8 = v117;
    }

    id v15 = v13;
    void *v10 = v15;
    goto LABEL_75;
  }
  id v111 = a3;
  uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v24 = v8;
  uint64_t v122 = [v24 countByEnumeratingWithState:&v147 objects:v154 count:16];
  if (!v122)
  {

    goto LABEL_73;
  }
  id v123 = 0;
  uint64_t v120 = *(void *)v148;
  *(void *)&long long v25 = 138412546;
  long long v110 = v25;
  __int16 v121 = v24;
  uint64_t v128 = WeakRetained;
  uint64_t v130 = v23;
  do
  {
    uint64_t v26 = 0;
    do
    {
      if (*(void *)v148 != v120) {
        objc_enumerationMutation(v24);
      }
      id v27 = *(void **)(*((void *)&v147 + 1) + 8 * v26);
      uint64_t v124 = v26;
      v125 = (void *)MEMORY[0x1E016D870]();
      if (![WeakRetained untrustedVisitMO:v27]) {
        goto LABEL_61;
      }
      uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        double v29 = [v27 identifier];
        *(_DWORD *)buf = 138412290;
        v156 = v29;
        _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "resnapping visit identifier, %@", buf, 0xCu);
      }
      double v30 = [v27 identifier];
      id v146 = 0;
      __int16 v119 = [WeakRetained fetchTransitionMOsEndingAtVisitIdentifier:v30 error:&v146];
      uint64_t v31 = v27;
      id v32 = v146;

      if (v32)
      {
        id v106 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          v109 = NSStringFromSelector(*(SEL *)(v113 + 40));
          *(_DWORD *)buf = v110;
          v156 = v109;
          __int16 v157 = 2112;
          double v158 = *(double *)&v32;
          _os_log_error_impl(&dword_1D9BFA000, v106, OS_LOG_TYPE_ERROR, "%@, fetch transition MOs error, %@", buf, 0x16u);
        }
LABEL_70:
        id v123 = v32;
        id v24 = v121;
        goto LABEL_71;
      }
      id v134 = objc_alloc(MEMORY[0x1E4F5CE00]);
      id v33 = [v27 locationLatitude];
      [v33 doubleValue];
      double v35 = v34;
      uint64_t v36 = [v27 locationLongitude];
      [v36 doubleValue];
      double v38 = v37;
      id v39 = [v27 locationHorizontalUncertainty];
      [v39 doubleValue];
      double v41 = v40;
      long long v42 = [v27 locationAltitude];
      [v42 doubleValue];
      double v44 = v43;
      uint64_t v45 = [v27 locationVerticalUncertainty];
      [v45 doubleValue];
      double v47 = v46;
      double v48 = [v31 locationReferenceFrame];
      uint64_t v49 = [v48 intValue];
      __int16 v50 = [v31 locationSourceAccuracy];
      uint64_t v51 = [v134 initWithLatitude:0 longitude:v49 horizontalUncertainty:(int)v50.intValue altitude:v35 verticalUncertainty:v38 date:v41 referenceFrame:v44 speed:v47 sourceAccuracy:0.0];

      uint64_t v52 = [WeakRetained learnedPlaceParameters];
      [v52 maxDistanceThreshold];
      id v145 = 0;
      v131 = (void *)v51;
      id v53 = [WeakRetained fetchNearbyLocationOfInterestMOsAroundLocation:v51 withinDistance:&v145];
      id v54 = v145;

      uint64_t v118 = v53;
      if (v54)
      {
        id v32 = v54;
        BOOL v55 = 0;
        double v56 = v123;
        id v8 = v117;
        uint64_t v23 = v130;
        goto LABEL_60;
      }
      long long v112 = v31;
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id v57 = v53;
      uint64_t v23 = v130;
      uint64_t v129 = [v57 countByEnumeratingWithState:&v141 objects:v153 count:16];
      if (!v129)
      {

        double v56 = 0;
        id v32 = v123;
        BOOL v55 = v123 == 0;
LABEL_58:
        id v8 = v117;
        goto LABEL_59;
      }
      double v56 = 0;
      id obj = v57;
      uint64_t v127 = *(void *)v142;
      double v58 = 1.79769313e308;
      double v59 = -1.79769313e308;
      while (2)
      {
        uint64_t v60 = 0;
        do
        {
          v135 = v56;
          if (*(void *)v142 != v127) {
            objc_enumerationMutation(obj);
          }
          uint64_t v132 = v60;
          id v61 = *(void **)(*((void *)&v141 + 1) + 8 * v60);
          context = (void *)MEMORY[0x1E016D870]();
          id v62 = objc_alloc(MEMORY[0x1E4F5CE00]);
          long long v63 = [v61 mapItem];
          long long v64 = [v63 latitude];
          [v64 doubleValue];
          double v66 = v65;
          double v67 = [v61 mapItem];
          v68 = [v67 longitude];
          [v68 doubleValue];
          double v70 = v69;
          id v71 = [v61 mapItem];
          double v72 = [v71 uncertainty];
          [v72 doubleValue];
          double v74 = v73;
          uint64_t v75 = [v61 mapItem];
          long long v76 = [v75 referenceFrame];
          long long v77 = [v62 initWithLatitude:0 longitude:[v76 intValue] horizontalUncertainty:v66 date:v70 referenceFrame:v74];

          id WeakRetained = v128;
          double v78 = [v128 distanceCalculator];
          id v140 = 0;
          [v78 distanceFromLocation:v77 toLocation:v131 error:&v140];
          double v80 = v79;
          id v81 = v140;

          if (v81)
          {
            uint64_t v90 = (void *)MEMORY[0x1E4F28C58];
            __int16 v91 = [v81 userInfo];
            id v32 = [v90 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:1 userInfo:v91];

            id v92 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            uint64_t v23 = v130;
            double v56 = v135;
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              id v104 = NSStringFromSelector(*(SEL *)(v113 + 40));
              *(_DWORD *)buf = v110;
              v156 = v104;
              __int16 v157 = 2112;
              double v158 = *(double *)&v32;
              _os_log_error_impl(&dword_1D9BFA000, v92, OS_LOG_TYPE_ERROR, "%@, distance error, %@", buf, 0x16u);
            }
            id WeakRetained = v128;
            goto LABEL_40;
          }
          double v82 = [v61 identifier];
          uint64_t v23 = v130;
          uint64_t v83 = [v130 objectForKeyedSubscript:v82];

          double v56 = v135;
          if (v83)
          {
            double v84 = [v61 identifier];
            uint64_t v85 = [v130 objectForKeyedSubscript:v84];
            [v85 doubleValue];
            double v87 = v86;
          }
          else
          {
            [v128 scoreLOIMO:v61];
            double v87 = v88;
            double v84 = [NSNumber numberWithDouble:];
            uint64_t v85 = [v61 identifier];
            [v130 setObject:v84 forKeyedSubscript:v85];
          }

          if (v87 > v59 || v87 == v59 && v80 < v58)
          {
            id v89 = v61;

            double v56 = v89;
            double v59 = v87;
            double v58 = v80;
          }

          uint64_t v60 = v132 + 1;
        }
        while (v129 != v132 + 1);
        uint64_t v129 = [obj countByEnumeratingWithState:&v141 objects:v153 count:16];
        if (v129) {
          continue;
        }
        break;
      }
      id v32 = v123;
LABEL_40:
      id v8 = v117;

      if (!v32)
      {
        if (!v56)
        {
          id v32 = 0;
          BOOL v55 = 1;
          goto LABEL_59;
        }
        uint64_t v93 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          v94 = [v56 identifier];
          *(_DWORD *)buf = v110;
          v156 = v94;
          __int16 v157 = 2048;
          double v158 = v59;
          _os_log_impl(&dword_1D9BFA000, v93, OS_LOG_TYPE_INFO, "resnapped to loi identifier, %@, score, %.3f", buf, 0x16u);
        }
        id v95 = [v112 locationOfInterestConfidence];
        [v95 doubleValue];
        double v97 = v96;

        if (v59 > v97) {
          [v112 setLocationOfInterestSource:&unk_1F3451458];
        }
        [v112 setLocationOfInterest:v56, v110];
        if (v59 > 0.0)
        {
          v98 = [NSNumber numberWithDouble:v59];
          [v112 setLocationOfInterestConfidence:v98];
        }
        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        id v99 = v119;
        uint64_t v100 = [v99 countByEnumeratingWithState:&v136 objects:v152 count:16];
        if (v100)
        {
          uint64_t v101 = v100;
          uint64_t v102 = *(void *)v137;
          do
          {
            for (uint64_t i = 0; i != v101; ++i)
            {
              if (*(void *)v137 != v102) {
                objc_enumerationMutation(v99);
              }
              [*(id *)(*((void *)&v136 + 1) + 8 * i) setLocationOfInterest:v56];
            }
            uint64_t v101 = [v99 countByEnumeratingWithState:&v136 objects:v152 count:16];
          }
          while (v101);
        }

        id v32 = 0;
        BOOL v55 = 1;
        id WeakRetained = v128;
        goto LABEL_58;
      }
      BOOL v55 = 0;
LABEL_59:
      id v54 = 0;
LABEL_60:

      id v123 = v32;
      if (!v55) {
        goto LABEL_70;
      }
LABEL_61:
      uint64_t v26 = v124 + 1;
      id v24 = v121;
    }
    while (v124 + 1 != v122);
    uint64_t v105 = [v121 countByEnumeratingWithState:&v147 objects:v154 count:16];
    uint64_t v122 = v105;
  }
  while (v105);
LABEL_71:

  if (v123)
  {
    id v15 = v123;
    *id v111 = v15;
    goto LABEL_74;
  }
LABEL_73:
  [v116 save:v111, v110];
  id v15 = 0;
LABEL_74:

LABEL_75:
  id v22 = v114;
LABEL_76:

  id v5 = v116;
LABEL_77:
}

- (BOOL)unassociateOldCandidate:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (a4)
  {
    if (v7)
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        double v10 = [v8 firstObject];
        double v11 = [v10 identifier];
        id v12 = [v8 secondObject];
        long long v13 = [v12 identifier];
        *(_DWORD *)buf = 138412546;
        long long v25 = v11;
        __int16 v26 = 2112;
        id v27 = v13;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "unassociating oldCandidate visit identifier, %@, oldCandidate mapItem identifier, %@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, self);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __54__RTRelabelerPersister_unassociateOldCandidate_error___block_invoke;
      v21[3] = &unk_1E6B98558;
      objc_copyWeak(v23, (id *)buf);
      v23[1] = (id)a2;
      id v22 = v8;
      long long v14 = (void *)MEMORY[0x1E016DB00](v21);
      id v20 = 0;
      [(RTRelabelerPersister *)self performBlock:v14 error:&v20];
      id v15 = v20;
      BOOL v16 = v15 == 0;
      if (v15)
      {
        [(RTRelabelerPersisterMetrics *)self->_metrics tallyKey:@"numberUnassociatedError"];
        [(RTRelabelerPersisterMetrics *)self->_metrics tallyError:v15];
        *a4 = v15;
      }

      objc_destroyWeak(v23);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: oldCandidate", buf, 2u);
      }

      _RTErrorInvalidParameterCreate(@"oldCandidate");
      BOOL v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    BOOL v16 = 0;
  }

  return v16;
}

void __54__RTRelabelerPersister_unassociateOldCandidate_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      uint64_t v6 = [*(id *)(a1 + 32) firstObject];
      id v7 = [v6 identifier];
      id v31 = 0;
      id v8 = [WeakRetained fetchLearnedLocationOfInterestVisitMOForIdentifier:v7 error:&v31];
      id v9 = v31;

      if (v9)
      {
        *a3 = v9;
      }
      else
      {
        id v15 = [*(id *)(a1 + 32) firstObject];
        BOOL v16 = [v15 identifier];
        id v30 = 0;
        __int16 v17 = [WeakRetained fetchTransitionMOsEndingAtVisitIdentifier:v16 error:&v30];
        id v18 = v30;

        if (v18)
        {
          *a3 = v18;
        }
        else
        {
          [v8 setLocationOfInterest:0];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v19 = v17;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v27 != v22) {
                  objc_enumerationMutation(v19);
                }
                [*(id *)(*((void *)&v26 + 1) + 8 * i) setLocationOfInterest:0, v26];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
            }
            while (v21);
          }

          id v24 = [WeakRetained metrics];
          [v24 tallyKey:@"numberUnassociated"];
        }
      }
    }
    else
    {
      double v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F5CFE8];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v38[0] = @"swelf is nil";
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      long long v13 = [v10 errorWithDomain:v11 code:0 userInfo:v12];

      long long v14 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        long long v25 = NSStringFromSelector(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 138412546;
        double v34 = v25;
        __int16 v35 = 2112;
        uint64_t v36 = v13;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      id v9 = v13;
      *a3 = v9;
    }
  }
}

- (BOOL)associateNonPlaceholderRelabeledInferredMapItem:(id)a3 oldCandidate:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (a5)
  {
    if (v9)
    {
      uint64_t v11 = [v9 mapItem];

      if (v11)
      {
        if (v10)
        {
          id v12 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            long long v13 = [v10 firstObject];
            long long v14 = [v13 identifier];
            id v15 = [v10 secondObject];
            BOOL v16 = [v15 identifier];
            *(_DWORD *)buf = 138412802;
            id v32 = v9;
            __int16 v33 = 2112;
            double v34 = v14;
            __int16 v35 = 2112;
            uint64_t v36 = v16;
            _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "associating non placeholder relabeledInferredMapItem %@, oldCandidate visit identifier, %@, oldCandidate mapItem identifier, %@", buf, 0x20u);
          }
          objc_initWeak((id *)buf, self);
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __91__RTRelabelerPersister_associateNonPlaceholderRelabeledInferredMapItem_oldCandidate_error___block_invoke;
          v27[3] = &unk_1E6B985D0;
          objc_copyWeak(v30, (id *)buf);
          v30[1] = (id)a2;
          id v28 = v10;
          id v29 = v9;
          __int16 v17 = (void *)MEMORY[0x1E016DB00](v27);
          id v26 = 0;
          [(RTRelabelerPersister *)self performBlock:v17 error:&v26];
          id v18 = v26;
          BOOL v19 = v18 == 0;
          if (v18)
          {
            [(RTRelabelerPersisterMetrics *)self->_metrics tallyKey:@"numberOfNonPlaceholderError"];
            [(RTRelabelerPersisterMetrics *)self->_metrics tallyError:v18];
            *a5 = v18;
          }

          objc_destroyWeak(v30);
          objc_destroyWeak((id *)buf);
          goto LABEL_23;
        }
        id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: oldCandidate", buf, 2u);
        }

        _RTErrorInvalidParameterCreate(@"oldCandidate");
        id v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeledInferredMapItem.mapItem", buf, 2u);
        }

        _RTErrorInvalidParameterCreate(@"relabeledInferredMapItem.mapItem");
        id v22 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeledInferredMapItem", buf, 2u);
      }

      _RTErrorInvalidParameterCreate(@"relabeledInferredMapItem");
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v19 = 0;
    *a5 = v22;
    goto LABEL_23;
  }
  uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  BOOL v19 = 0;
LABEL_23:

  return v19;
}

void __91__RTRelabelerPersister_associateNonPlaceholderRelabeledInferredMapItem_oldCandidate_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v56[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      uint64_t v6 = [*(id *)(a1 + 32) firstObject];
      id v7 = [v6 identifier];
      id v49 = 0;
      id v8 = [WeakRetained fetchLearnedLocationOfInterestVisitMOForIdentifier:v7 error:&v49];
      id v9 = v49;

      if (v9)
      {
        *a3 = v9;
      }
      else
      {
        id v15 = [*(id *)(a1 + 32) firstObject];
        BOOL v16 = [v15 identifier];
        id v48 = 0;
        __int16 v17 = [WeakRetained fetchTransitionMOsEndingAtVisitIdentifier:v16 error:&v48];
        id v18 = v48;

        if (v18)
        {
          *a3 = v18;
        }
        else
        {
          double v41 = v17;
          BOOL v19 = [*(id *)(a1 + 40) mapItem];
          uint64_t v20 = [v19 identifier];
          id v47 = 0;
          uint64_t v21 = [WeakRetained fetchLocationOfInterestMOforMapItemIdentifier:v20 error:&v47];
          id v22 = v47;

          if (v22)
          {
            id v23 = v22;
            *a3 = v23;
          }
          else
          {
            id v24 = [*(id *)(a1 + 32) secondObject];
            long long v25 = [v24 identifier];
            id v46 = 0;
            double v40 = [WeakRetained fetchLocationOfInterestMOforMapItemIdentifier:v25 error:&v46];
            id v23 = v46;

            if (v23)
            {
              *a3 = v23;
            }
            else
            {
              long long v27 = [v40 identifier];
              id v28 = [v21 identifier];
              int v29 = [v27 isEqual:v28];

              id v30 = [WeakRetained metrics];
              id v31 = v30;
              if (v29) {
                id v32 = @"numberOfNonPlaceholderSame";
              }
              else {
                id v32 = @"numberOfNonPlaceholderDifferent";
              }
              [v30 tallyKey:v32, v40];

              [v8 setLocationOfInterest:v21];
              __int16 v33 = NSNumber;
              [*(id *)(a1 + 40) confidence];
              double v34 = [v33 numberWithDouble:x0];
              [v8 setLocationOfInterestConfidence:v34];

              long long v44 = 0u;
              long long v45 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              id v35 = v41;
              uint64_t v36 = [v35 countByEnumeratingWithState:&v42 objects:v50 count:16];
              if (v36)
              {
                uint64_t v37 = v36;
                uint64_t v38 = *(void *)v43;
                do
                {
                  for (uint64_t i = 0; i != v37; ++i)
                  {
                    if (*(void *)v43 != v38) {
                      objc_enumerationMutation(v35);
                    }
                    [*(id *)(*((void *)&v42 + 1) + 8 * i) setLocationOfInterest:v21];
                  }
                  uint64_t v37 = [v35 countByEnumeratingWithState:&v42 objects:v50 count:16];
                }
                while (v37);
              }

              id v23 = 0;
            }
          }
          __int16 v17 = v41;
        }
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F5CFE8];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      v56[0] = @"swelf is nil";
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
      long long v13 = [v10 errorWithDomain:v11 code:0 userInfo:v12];

      long long v14 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v26 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412546;
        uint64_t v52 = v26;
        __int16 v53 = 2112;
        id v54 = v13;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      id v9 = v13;
      *a3 = v9;
    }
  }
}

- (id)rollLOIIdentifier:(id)a3 context:(id)a4 error:(id *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!a5)
  {
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    uint64_t v20 = 0;
    goto LABEL_22;
  }
  if (!v8)
  {
    id v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiIdentifier", buf, 2u);
    }

    id v23 = @"loiIdentifier";
    goto LABEL_18;
  }
  if (!v9)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    id v23 = @"context";
LABEL_18:
    _RTErrorInvalidParameterCreate((uint64_t)v23);
    uint64_t v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  id v11 = [(RTRelabelerPersister *)self rollUUIDGivenUUID:v8];
  uint64_t v12 = 100;
  while (1)
  {
    id v26 = 0;
    BOOL v13 = [(RTRelabelerPersister *)self uuidConflicts:v11 context:v10 error:&v26];
    id v14 = v26;
    id v15 = v14;
    if (!v13)
    {
      id v11 = v11;
      uint64_t v20 = v11;
      goto LABEL_21;
    }
    if (v14) {
      break;
    }
    uint64_t v16 = [(RTRelabelerPersister *)self rollUUIDGivenUUID:v11];

    id v11 = (id)v16;
    if (!--v12)
    {
      __int16 v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v29[0] = @"could not roll LOI identifier without exceeding max limit";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      BOOL v19 = [v17 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:0 userInfo:v18];

      id v15 = v19;
      uint64_t v20 = 0;
      *a5 = v15;
      id v11 = (id)v16;
      goto LABEL_21;
    }
  }
  id v15 = v14;
  uint64_t v20 = 0;
  *a5 = v15;
LABEL_21:

LABEL_22:

  return v20;
}

- (id)rollUUIDGivenUUID:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v8[0] = 0;
    v8[1] = 0;
    [a3 getUUIDBytes:v8];
    id v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:16];
    CC_SHA256((const void *)[v3 bytes], [v3 length], v7);
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v7];
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuid", v7, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

- (BOOL)uuidConflicts:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!a5)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_16;
  }
  if (!v7)
  {
    __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v23 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuid", v23, 2u);
    }

    id v18 = @"uuid";
    goto LABEL_15;
  }
  if (!v8)
  {
    BOOL v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v22 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v22, 2u);
    }

    id v18 = @"context";
LABEL_15:
    _RTErrorInvalidParameterCreate((uint64_t)v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
    BOOL v15 = 1;
    goto LABEL_19;
  }
  id v10 = +[RTLearnedLocationOfInterestMO fetchRequest];
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v7];
  [v10 setPredicate:v11];

  id v21 = 0;
  uint64_t v12 = [v9 countForFetchRequest:v10 error:&v21];
  id v13 = v21;
  id v14 = v13;
  if (v13)
  {
    *a5 = v13;
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = v12 != 0;
  }

LABEL_19:
  return v15;
}

- (BOOL)associatePlaceholderRelabeledInferredMapItem:(id)a3 oldCandidate:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (a5)
  {
    if (!v9)
    {
      uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeledInferredMapItem", buf, 2u);
      }

      _RTErrorInvalidParameterCreate(@"relabeledInferredMapItem");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    id v11 = [v9 mapItem];

    if (v11)
    {
      uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !relabeledInferredMapItem.mapItem", buf, 2u);
      }

      _RTErrorInvalidParameterCreate(@"!relabeledInferredMapItem.mapItem");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      BOOL v15 = 0;
      *a5 = v13;
      goto LABEL_14;
    }
    if (!v10)
    {
      long long v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: oldCandidate", buf, 2u);
      }

      _RTErrorInvalidParameterCreate(@"oldCandidate");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      BOOL v19 = [v10 firstObject];
      uint64_t v20 = [v19 identifier];
      id v21 = [v10 secondObject];
      id v22 = [v21 identifier];
      *(_DWORD *)buf = 138412802;
      id v32 = v9;
      __int16 v33 = 2112;
      double v34 = v20;
      __int16 v35 = 2112;
      uint64_t v36 = v22;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "associating placeholder relabeledInferredMapItem %@, oldCandidate visit identifier, %@, oldCandidate mapItem identifier, %@", buf, 0x20u);
    }
    objc_initWeak((id *)buf, self);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __88__RTRelabelerPersister_associatePlaceholderRelabeledInferredMapItem_oldCandidate_error___block_invoke;
    v27[3] = &unk_1E6B985D0;
    objc_copyWeak(v30, (id *)buf);
    v30[1] = (id)a2;
    id v28 = v10;
    id v29 = v9;
    id v23 = (void *)MEMORY[0x1E016DB00](v27);
    id v26 = 0;
    [(RTRelabelerPersister *)self performBlock:v23 error:&v26];
    id v24 = v26;
    BOOL v15 = v24 == 0;
    if (v24)
    {
      [(RTRelabelerPersisterMetrics *)self->_metrics tallyKey:@"numberOfPlaceholderError"];
      [(RTRelabelerPersisterMetrics *)self->_metrics tallyError:v24];
      *a5 = v24;
    }

    objc_destroyWeak(v30);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    BOOL v15 = 0;
  }
LABEL_14:

  return v15;
}

void __88__RTRelabelerPersister_associatePlaceholderRelabeledInferredMapItem_oldCandidate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v132[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = [*(id *)(a1 + 32) firstObject];
    id v8 = [v7 identifier];
    id v125 = 0;
    id v9 = [WeakRetained fetchLearnedLocationOfInterestVisitMOForIdentifier:v8 error:&v125];
    id v10 = v125;

    if (v10)
    {
      id v11 = v10;
      *a3 = v11;
      goto LABEL_18;
    }
    uint64_t v16 = [*(id *)(a1 + 32) firstObject];
    __int16 v17 = [v16 identifier];
    id v124 = 0;
    id v18 = [WeakRetained fetchTransitionMOsEndingAtVisitIdentifier:v17 error:&v124];
    id v19 = v124;

    if (v19)
    {
      *a3 = v19;
LABEL_17:

      id v11 = 0;
      goto LABEL_18;
    }
    id v106 = a3;
    id v107 = v5;
    v108 = v18;
    uint64_t v20 = [*(id *)(a1 + 32) firstObject];
    id v21 = [v20 location];
    id v22 = [v21 location];
    id v23 = [WeakRetained relabelerPersisterParameters];
    [v23 placeholderCollapseDistanceThreshold];
    double v25 = v24;
    id v26 = [WeakRetained distanceCalculator];
    id v123 = 0;
    long long v27 = [WeakRetained fetchClosestUnconcreteLocationOfInterestMOToLocation:v22 withinDistance:v26 distanceCalculator:&v123 error:v25];
    id v28 = v123;

    if (v28)
    {
      id v29 = [WeakRetained metrics];
      [v29 tallyError:v28];

      id v30 = [NSString stringWithFormat:@"error in %@, %@", @"unconcrete loi fetch", v28];
      id v31 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        long long v63 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412546;
        uint64_t v128 = v63;
        __int16 v129 = 2112;
        id v130 = v30;
        _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@,%@", buf, 0x16u);
      }
      uint64_t v32 = *(void *)(a1 + 32);
      id v122 = 0;
      id v18 = v108;
      [WeakRetained restoreVisit:v9 transitions:v108 toOldCandidate:v32 error:&v122];
      id v33 = v122;
      if (!v33)
      {
        double v34 = [WeakRetained metrics];
        [v34 tallyKey:@"numberOfPlaceholderUnintendedRestored"];
      }
      id v35 = v33;
      *id v106 = v35;

LABEL_14:
      id v36 = 0;
LABEL_15:

LABEL_16:
      id v19 = 0;
      id v5 = v107;
      goto LABEL_17;
    }
    if (v27)
    {
      id v36 = v27;
      uint64_t v37 = [WeakRetained metrics];
      [v37 tallyKey:@"numberOfPlaceholderCollapsed"];

      id v18 = v108;
    }
    else
    {
      uint64_t v44 = *(void *)(a1 + 32);
      long long v45 = [WeakRetained relabelerParameters];
      [v45 passthroughThreshold];
      BOOL v46 = +[RTRelabeler placeholderCandidate:knownPlaceTypeThreshold:](RTRelabeler, "placeholderCandidate:knownPlaceTypeThreshold:", v44);

      uint64_t v47 = *(void *)(a1 + 32);
      if (v46)
      {
        id v121 = 0;
        id v18 = v108;
        [WeakRetained restoreVisit:v9 transitions:v108 toOldCandidate:v47 error:&v121];
        id v48 = v121;
        if (!v48)
        {
          id v49 = NSNumber;
          [*(id *)(a1 + 40) confidence];
          __int16 v50 = [v49 numberWithDouble:];
          [v9 setLocationOfInterestConfidence:v50];

          [v9 setLocationOfInterestSource:&unk_1F3451470];
          uint64_t v51 = [WeakRetained metrics];
          [v51 tallyKey:@"numberOfPlaceholderIntendedRestored"];
        }
        id v30 = v48;
        id v36 = 0;
        *id v106 = v30;
        goto LABEL_15;
      }
      uint64_t v52 = [*(id *)(a1 + 32) secondObject];
      __int16 v53 = [v52 identifier];
      id v120 = 0;
      id v54 = [WeakRetained fetchLearnedPlaceMOforMapItemIdentifier:v53 error:&v120];
      id v30 = v120;

      if (v30)
      {
        uint64_t v55 = [WeakRetained metrics];
        [v55 tallyError:v30];

        double v56 = [NSString stringWithFormat:@"error in %@, %@", @"learned place fetch", v30];
        id v57 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          uint64_t v93 = v92 = v56;
          *(_DWORD *)buf = 138412546;
          uint64_t v128 = v93;
          __int16 v129 = 2112;
          id v130 = v92;
          _os_log_error_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_ERROR, "%@,%@", buf, 0x16u);

          double v56 = v92;
        }

        uint64_t v58 = *(void *)(a1 + 32);
        id v119 = 0;
        id v18 = v108;
        [WeakRetained restoreVisit:v9 transitions:v108 toOldCandidate:v58 error:&v119];
        id v59 = v119;
        if (!v59)
        {
          [WeakRetained metrics];
          id v61 = v60 = v56;
          [v61 tallyKey:@"numberOfPlaceholderUnintendedRestored"];

          double v56 = v60;
        }
        id v62 = v59;
        *id v106 = v62;

        goto LABEL_14;
      }
      long long v64 = [*(id *)(a1 + 32) firstObject];
      double v65 = [v54 creationDate];
      double v66 = [v54 expirationDate];
      id v118 = 0;
      uint64_t v105 = [WeakRetained learnedPlaceForVisit:v64 creationDate:v65 expirationDate:v66 context:v107 error:&v118];
      id v67 = v118;

      if (v67)
      {
        v68 = [WeakRetained metrics];
        [v68 tallyError:v67];

        id v104 = [NSString stringWithFormat:@"error in %@, %@", @"learned place lookup", v67];
        double v69 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        id v28 = 0;
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          v98 = NSStringFromSelector(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 138412546;
          uint64_t v128 = v98;
          __int16 v129 = 2112;
          id v130 = v104;
          _os_log_error_impl(&dword_1D9BFA000, v69, OS_LOG_TYPE_ERROR, "%@,%@", buf, 0x16u);
        }
        uint64_t v70 = *(void *)(a1 + 32);
        id v117 = 0;
        id v18 = v108;
        [WeakRetained restoreVisit:v9 transitions:v108 toOldCandidate:v70 error:&v117];
        id v71 = v117;
        if (!v71)
        {
          double v72 = [WeakRetained metrics];
          [v72 tallyKey:@"numberOfPlaceholderUnintendedRestored"];
        }
        id v73 = v71;
        id v36 = 0;
        *id v106 = v73;
        int v74 = 1;
      }
      else
      {
        uint64_t v75 = [*(id *)(a1 + 32) secondObject];
        long long v76 = [v75 identifier];
        id v116 = 0;
        id v103 = [WeakRetained fetchLocationOfInterestMOforMapItemIdentifier:v76 error:&v116];
        id v77 = v116;

        id v104 = v77;
        if (v77)
        {
          double v78 = [WeakRetained metrics];
          [v78 tallyError:v77];

          uint64_t v102 = [NSString stringWithFormat:@"error in %@, %@", @"old LOI lookup", v77];
          double v79 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          id v18 = v108;
          id v28 = 0;
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            id v99 = NSStringFromSelector(*(SEL *)(a1 + 56));
            *(_DWORD *)buf = 138412546;
            uint64_t v128 = v99;
            __int16 v129 = 2112;
            id v130 = v102;
            _os_log_error_impl(&dword_1D9BFA000, v79, OS_LOG_TYPE_ERROR, "%@,%@", buf, 0x16u);
          }
          uint64_t v80 = *(void *)(a1 + 32);
          id v115 = 0;
          [WeakRetained restoreVisit:v9 transitions:v108 toOldCandidate:v80 error:&v115];
          id v81 = v115;
          if (!v81)
          {
            double v82 = [WeakRetained metrics];
            [v82 tallyKey:@"numberOfPlaceholderUnintendedRestored"];
          }
          id v83 = v81;
          id v36 = 0;
          *id v106 = v83;
          int v74 = 1;
        }
        else
        {
          double v84 = [v103 identifier];
          id v114 = 0;
          id v83 = [WeakRetained rollLOIIdentifier:v84 context:v107 error:&v114];
          id v85 = v114;

          uint64_t v102 = v85;
          if (v85)
          {
            double v86 = [WeakRetained metrics];
            [v86 tallyError:v85];

            uint64_t v101 = [NSString stringWithFormat:@"error in %@, %@", @"rolling identifier", v85];
            double v87 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            id v18 = v108;
            id v28 = 0;
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              uint64_t v100 = NSStringFromSelector(*(SEL *)(a1 + 56));
              *(_DWORD *)buf = 138412546;
              uint64_t v128 = v100;
              __int16 v129 = 2112;
              id v130 = v101;
              _os_log_error_impl(&dword_1D9BFA000, v87, OS_LOG_TYPE_ERROR, "%@,%@", buf, 0x16u);
            }
            uint64_t v88 = *(void *)(a1 + 32);
            id v113 = 0;
            [WeakRetained restoreVisit:v9 transitions:v108 toOldCandidate:v88 error:&v113];
            id v89 = v113;
            if (!v89)
            {
              uint64_t v90 = [WeakRetained metrics];
              [v90 tallyKey:@"numberOfPlaceholderUnintendedRestored"];
            }
            id v91 = v89;
            *id v106 = v91;

            id v36 = 0;
            int v74 = 1;
          }
          else
          {
            v94 = [RTLearnedLocationOfInterest alloc];
            id v95 = [*(id *)(a1 + 32) firstObject];
            double v96 = [v95 location];
            double v97 = [(RTLearnedLocationOfInterest *)v94 initWithIdentifier:v83 location:v96 place:v105 visits:0 transitions:0];

            uint64_t v101 = v97;
            id v36 = [(RTLearnedLocationOfInterest *)v97 managedObjectWithContext:v107];
            int v74 = 0;
            id v18 = v108;
            id v28 = 0;
          }
        }
        id v67 = 0;
        id v73 = v103;
      }

      if (v74) {
        goto LABEL_16;
      }
    }
    [v9 setLocationOfInterest:v36];
    uint64_t v38 = NSNumber;
    [*(id *)(a1 + 40) confidence];
    id v39 = [v38 numberWithDouble:];
    [v9 setLocationOfInterestConfidence:v39];

    [v9 setLocationOfInterestSource:&unk_1F3451470];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v30 = v18;
    uint64_t v40 = [v30 countByEnumeratingWithState:&v109 objects:v126 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v110;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v110 != v42) {
            objc_enumerationMutation(v30);
          }
          [*(id *)(*((void *)&v109 + 1) + 8 * i) setLocationOfInterest:v36];
        }
        uint64_t v41 = [v30 countByEnumeratingWithState:&v109 objects:v126 count:16];
      }
      while (v41);
      id v18 = v108;
    }
    goto LABEL_15;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v13 = *MEMORY[0x1E4F5CFE8];
  uint64_t v131 = *MEMORY[0x1E4F28568];
  v132[0] = @"strongified welf not retained";
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:&v131 count:1];
  id v11 = [v12 errorWithDomain:v13 code:0 userInfo:v14];

  id v9 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    BOOL v15 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412546;
    uint64_t v128 = v15;
    __int16 v129 = 2112;
    id v130 = v11;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
  }
LABEL_18:
}

- (BOOL)useRelabeledInferredMapItem:(id)a3 oldCandidate:(id)a4 associate:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = v11;
  if (a6)
  {
    if (v10)
    {
      if (v11)
      {
        if (v7)
        {
          uint64_t v13 = [v10 mapItem];

          if (v13)
          {
            uint64_t v28 = 0;
            id v14 = (id *)&v28;
            [(RTRelabelerPersister *)self associateNonPlaceholderRelabeledInferredMapItem:v10 oldCandidate:v12 error:&v28];
          }
          else
          {
            uint64_t v27 = 0;
            id v14 = (id *)&v27;
            [(RTRelabelerPersister *)self associatePlaceholderRelabeledInferredMapItem:v10 oldCandidate:v12 error:&v27];
          }
        }
        else
        {
          uint64_t v29 = 0;
          id v14 = (id *)&v29;
          [(RTRelabelerPersister *)self unassociateOldCandidate:v11 error:&v29];
        }
        id v20 = *v14;
        id v21 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          id v23 = [v12 firstObject];
          double v24 = [v23 identifier];
          double v25 = [v12 secondObject];
          id v26 = [v25 identifier];
          *(_DWORD *)buf = 138413314;
          id v31 = v10;
          __int16 v32 = 2112;
          id v33 = v24;
          __int16 v34 = 2112;
          id v35 = v26;
          __int16 v36 = 2048;
          BOOL v37 = v7;
          __int16 v38 = 2112;
          id v39 = v20;
          _os_log_debug_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEBUG, "used relabelInferredMapItem, %@, oldCandidate visit identifier, %@, oldCandidate map item ientifier, %@, associate, %lu, error, %@", buf, 0x34u);
        }
        BOOL v16 = v20 == 0;
        if (v20) {
          *a6 = v20;
        }

        goto LABEL_24;
      }
      id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: oldCandidate", buf, 2u);
      }

      id v18 = @"oldCandidate";
    }
    else
    {
      __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeledInferredMapItem", buf, 2u);
      }

      id v18 = @"relabeledInferredMapItem";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v18);
    BOOL v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  BOOL v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  BOOL v16 = 0;
LABEL_24:

  return v16;
}

- (BOOL)combineOverlappingRevGeoLOIsStabilized:(BOOL *)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if (a3)
    {
      *(void *)id v19 = 0;
      id v20 = v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 1;
      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __69__RTRelabelerPersister_combineOverlappingRevGeoLOIsStabilized_error___block_invoke;
      v16[3] = &unk_1E6B985F8;
      objc_copyWeak(v17, &location);
      v17[1] = (id)a2;
      v16[4] = self;
      v16[5] = v19;
      id v8 = (void *)MEMORY[0x1E016DB00](v16);
      id v15 = 0;
      [(RTRelabelerPersister *)self performBlock:v8 error:&v15];
      id v9 = v15;
      id v10 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v9;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "relabeling combined with error, %@", buf, 0xCu);
      }

      BOOL v11 = v9 == 0;
      if (v9)
      {
        [(RTRelabelerPersisterMetrics *)self->_metrics tallyError:v9];
        [(RTRelabelerPersisterMetrics *)self->_metrics setErrorKey:@"combineErroredOut"];
        *a4 = v9;
      }
      else
      {
        *a3 = v20[24];
      }

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
      _Block_object_dispose(v19, 8);
    }
    else
    {
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v19 = 0;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: stabilized", v19, 2u);
      }

      _RTErrorInvalidParameterCreate(@"stabilized");
      BOOL v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v19 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v19, 2u);
    }

    return 0;
  }
  return v11;
}

void __69__RTRelabelerPersister_combineOverlappingRevGeoLOIsStabilized_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v135[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v101 = a1;
    if (!WeakRetained)
    {
      char v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F5CFE8];
      uint64_t v134 = *MEMORY[0x1E4F28568];
      v135[0] = @"swelf is nil";
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v135 forKeys:&v134 count:1];
      uint64_t v25 = [v22 errorWithDomain:v23 code:0 userInfo:v24];

      id v26 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v81 = NSStringFromSelector(*(SEL *)(v101 + 56));
        *(_DWORD *)buf = 138412546;
        uint64_t v131 = (uint64_t)v81;
        __int16 v132 = 2112;
        uint64_t v133 = (uint64_t)v25;
        _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      id v6 = v25;
      *a3 = v6;
      goto LABEL_70;
    }
    if ([v5 save:a3])
    {
      id v6 = +[RTLearnedLocationOfInterestMO fetchRequest];
      BOOL v7 = (void *)MEMORY[0x1E4F28C68];
      id v8 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"visits"];
      __int16 v129 = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
      uint64_t v10 = [v7 expressionForFunction:@"count:" arguments:v9];

      id v11 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
      [v11 setName:@"visitCount"];
      id v91 = (void *)v10;
      [v11 setExpression:v10];
      [v11 setExpressionResultType:200];
      v128[0] = @"identifier";
      v128[1] = @"placeCreationDate";
      uint64_t v90 = v11;
      v128[2] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:3];
      [v6 setPropertiesToFetch:v12];

      [v6 setResultType:2];
      [v6 setReturnsObjectsAsFaults:1];
      [v6 setFetchBatchSize:1];
      id v122 = 0;
      id v92 = v5;
      uint64_t v13 = [v5 executeFetchRequest:v6 error:&v122];
      id v14 = v122;
      id v15 = v14;
      if (v14)
      {
        BOOL v16 = (void *)MEMORY[0x1E4F28C58];
        __int16 v17 = [v14 userInfo];
        id v18 = [v16 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:2 userInfo:v17];

        id v19 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(v101 + 56));
          v83 = double v82 = v15;
          *(_DWORD *)buf = 138412546;
          uint64_t v131 = (uint64_t)v83;
          __int16 v132 = 2112;
          uint64_t v133 = (uint64_t)v18;
          _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          id v15 = v82;
        }

        id v20 = v18;
        *a3 = v20;
        id v21 = v13;
        goto LABEL_69;
      }
      id v87 = v6;
      uint64_t v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"visitCount" ascending:0];
      v127[0] = v27;
      uint64_t v28 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"placeCreationDate" ascending:1];
      v127[1] = v28;
      uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
      id v30 = [v13 sortedArrayUsingDescriptors:v29];

      [MEMORY[0x1E4F1CA80] setWithCapacity:[v30 count]];
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      long long v118 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id v21 = v30;
      uint64_t v31 = [v21 countByEnumeratingWithState:&v118 objects:v126 count:16];
      id v32 = v21;
      uint64_t v96 = v31;
      if (!v31) {
        goto LABEL_67;
      }
      id v93 = 0;
      uint64_t v95 = *(void *)v119;
      uint64_t v33 = v101;
      __int16 v34 = &off_1E6B8E000;
      double v86 = a3;
      id v89 = v21;
      uint64_t v102 = v20;
LABEL_13:
      uint64_t v35 = 0;
      while (1)
      {
        if (*(void *)v119 != v95) {
          objc_enumerationMutation(v21);
        }
        uint64_t v97 = v35;
        __int16 v36 = *(void **)(*((void *)&v118 + 1) + 8 * v35);
        context = (void *)MEMORY[0x1E016D870]();
        uint64_t v37 = [v36 objectForKeyedSubscript:@"identifier"];
        __int16 v38 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v131 = v37;
          _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "collapsing loi identifier, %@", buf, 0xCu);
        }

        id v39 = [v20 member:v37];

        id v99 = (void *)v37;
        if (v39)
        {
          uint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_INFO, "already processed", buf, 2u);
          }
        }
        else
        {
          uint64_t v41 = [v34[391] fetchRequest];
          [v41 setReturnsObjectsAsFaults:0];
          [v41 setFetchLimit:1];
          uint64_t v85 = v37;
          uint64_t v40 = v41;
          uint64_t v42 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v85];
          [v40 setPredicate:v42];

          id v117 = 0;
          long long v43 = [v40 execute:&v117];
          id v44 = v117;
          long long v45 = [v43 firstObject];

          if (v44)
          {
            id v77 = (void *)MEMORY[0x1E4F28C58];
            double v78 = [v44 userInfo];
            uint64_t v79 = [v77 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:2 userInfo:v78];

            uint64_t v80 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              double v84 = NSStringFromSelector(*(SEL *)(v101 + 56));
              *(_DWORD *)buf = 138412546;
              uint64_t v131 = (uint64_t)v84;
              __int16 v132 = 2112;
              uint64_t v133 = v79;
              _os_log_error_impl(&dword_1D9BFA000, v80, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
            }
            id v93 = (id)v79;
            id v20 = v102;
            goto LABEL_65;
          }
          if (v45)
          {
            id v20 = v102;
            if ([*(id *)(v33 + 32) unconcreteLOIMO:v45])
            {
              BOOL v46 = [WeakRetained distanceCalculator];
              id v116 = 0;
              uint64_t v47 = [WeakRetained fetchOverlappingUnconcreteLocationOfInterestMOsForLOIMO:v45 distanceCalculator:v46 unusableIdentifiers:v102 error:&v116];
              id v48 = v116;

              v94 = v47;
              if (v48)
              {
                id v49 = v93;
                id v93 = v48;
                __int16 v50 = v99;
              }
              else
              {
                __int16 v50 = v99;
                [v102 addObject:v99];
                long long v114 = 0u;
                long long v115 = 0u;
                long long v112 = 0u;
                long long v113 = 0u;
                id v49 = v47;
                uint64_t v54 = [v49 countByEnumeratingWithState:&v112 objects:v125 count:16];
                if (v54)
                {
                  uint64_t v55 = v54;
                  id obj = v49;
                  uint64_t v88 = v40;
                  uint64_t v56 = *(void *)v113;
                  do
                  {
                    for (uint64_t i = 0; i != v55; ++i)
                    {
                      if (*(void *)v113 != v56) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v58 = *(void **)(*((void *)&v112 + 1) + 8 * i);
                      id v59 = (void *)MEMORY[0x1E016D870]();
                      long long v108 = 0u;
                      long long v109 = 0u;
                      long long v110 = 0u;
                      long long v111 = 0u;
                      uint64_t v60 = [v58 visits];
                      id v61 = [v60 set];
                      id v62 = [v61 allObjects];

                      uint64_t v63 = [v62 countByEnumeratingWithState:&v108 objects:v124 count:16];
                      if (v63)
                      {
                        uint64_t v64 = v63;
                        uint64_t v65 = *(void *)v109;
                        do
                        {
                          for (uint64_t j = 0; j != v64; ++j)
                          {
                            if (*(void *)v109 != v65) {
                              objc_enumerationMutation(v62);
                            }
                            [*(id *)(*((void *)&v108 + 1) + 8 * j) setLocationOfInterest:v45];
                          }
                          uint64_t v64 = [v62 countByEnumeratingWithState:&v108 objects:v124 count:16];
                        }
                        while (v64);
                      }

                      long long v106 = 0u;
                      long long v107 = 0u;
                      long long v104 = 0u;
                      long long v105 = 0u;
                      id v67 = [v58 transitions];
                      v68 = [v67 allObjects];

                      uint64_t v69 = [v68 countByEnumeratingWithState:&v104 objects:v123 count:16];
                      if (v69)
                      {
                        uint64_t v70 = v69;
                        uint64_t v71 = *(void *)v105;
                        do
                        {
                          for (uint64_t k = 0; k != v70; ++k)
                          {
                            if (*(void *)v105 != v71) {
                              objc_enumerationMutation(v68);
                            }
                            [*(id *)(*((void *)&v104 + 1) + 8 * k) setLocationOfInterest:v45];
                          }
                          uint64_t v70 = [v68 countByEnumeratingWithState:&v104 objects:v123 count:16];
                        }
                        while (v70);
                      }

                      id v73 = [v58 identifier];
                      id v20 = v102;
                      [v102 addObject:v73];

                      int v74 = [WeakRetained metrics];
                      [v74 tallyKey:@"numberOfLOIsCollapsed"];

                      uint64_t v33 = v101;
                      *(unsigned char *)(*(void *)(*(void *)(v101 + 40) + 8) + 24) = 0;
                    }
                    uint64_t v55 = [obj countByEnumeratingWithState:&v112 objects:v125 count:16];
                  }
                  while (v55);
                  a3 = v86;
                  __int16 v34 = &off_1E6B8E000;
                  __int16 v50 = v99;
                  id v49 = obj;
                  id v48 = 0;
                  uint64_t v40 = v88;
                }
              }

              id v75 = v48;
              id v21 = v89;
              if (v75) {
                goto LABEL_65;
              }
              goto LABEL_34;
            }
            uint64_t v52 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "not an unconcrete loi", buf, 2u);
            }

            __int16 v53 = [v45 identifier];
            [v102 addObject:v53];
          }
          else
          {
            uint64_t v51 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            id v20 = v102;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_INFO, "was deleted", buf, 2u);
            }

            [v102 addObject:v99];
          }
        }
LABEL_34:
        uint64_t v35 = v97 + 1;
        if (v97 + 1 == v96)
        {
          uint64_t v76 = [v21 countByEnumeratingWithState:&v118 objects:v126 count:16];
          uint64_t v96 = v76;
          if (v76) {
            goto LABEL_13;
          }
LABEL_65:

          if (v93)
          {
            id v32 = v93;
            *a3 = v32;
LABEL_67:
          }
          id v15 = 0;
          id v6 = v87;
LABEL_69:

          id v5 = v92;
LABEL_70:

          break;
        }
      }
    }
  }
}

- (BOOL)cleanUpWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__RTRelabelerPersister_cleanUpWithError___block_invoke;
    v13[3] = &unk_1E6B985A8;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a2;
    id v6 = (void *)MEMORY[0x1E016DB00](v13);
    id v12 = 0;
    [(RTRelabelerPersister *)self performBlock:v6 error:&v12];
    id v7 = v12;
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "relabeling cleaned up with error, %@", buf, 0xCu);
    }

    BOOL v9 = v7 == 0;
    if (v7)
    {
      [(RTRelabelerPersisterMetrics *)self->_metrics tallyError:v7];
      [(RTRelabelerPersisterMetrics *)self->_metrics setErrorKey:@"cleanUpErroredOut"];
      *a3 = v7;
    }

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    return 0;
  }
  return v9;
}

void __41__RTRelabelerPersister_cleanUpWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v91[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    uint64_t v63 = a1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (!WeakRetained)
    {
      BOOL v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F5CFE8];
      uint64_t v90 = *MEMORY[0x1E4F28568];
      v91[0] = @"swelf is nil";
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:&v90 count:1];
      id v19 = [v16 errorWithDomain:v17 code:0 userInfo:v18];

      id v20 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v59 = NSStringFromSelector(*(SEL *)(v63 + 40));
        *(_DWORD *)buf = 138412546;
        id v87 = v59;
        __int16 v88 = 2112;
        uint64_t v89 = (uint64_t)v19;
        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      id v21 = v19;
      *a3 = v21;
LABEL_41:

      goto LABEL_42;
    }
    id v7 = +[RTLearnedLocationOfInterestMO fetchRequest];
    [v7 setReturnsObjectsAsFaults:1];
    [v7 setFetchBatchSize:1];
    id v81 = 0;
    id v62 = v7;
    id v8 = [v7 execute:&v81];
    id v9 = v81;
    id v61 = v9;
    if (v9)
    {
      uint64_t v10 = v8;
      id v11 = (void *)MEMORY[0x1E4F28C58];
      id v12 = [v9 userInfo];
      uint64_t v13 = [v11 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:2 userInfo:v12];

      id v14 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v58 = NSStringFromSelector(*(SEL *)(v63 + 40));
        *(_DWORD *)buf = 138412546;
        id v87 = v58;
        __int16 v88 = 2112;
        uint64_t v89 = (uint64_t)v13;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      id v15 = v13;
      *a3 = v15;
LABEL_40:

      id v21 = v62;
      goto LABEL_41;
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v15 = v8;
    uint64_t v22 = [v15 countByEnumeratingWithState:&v77 objects:v85 count:16];
    uint64_t v10 = v8;
    if (!v22) {
      goto LABEL_40;
    }
    uint64_t v23 = v22;
    uint64_t v60 = v8;
    uint64_t v24 = *(void *)v78;
    uint64_t v64 = *MEMORY[0x1E4F28568];
    uint64_t v65 = *(void *)v78;
    id v66 = v15;
LABEL_12:
    uint64_t v25 = 0;
    uint64_t v67 = v23;
    while (1)
    {
      if (*(void *)v78 != v24) {
        objc_enumerationMutation(v15);
      }
      id v26 = *(void **)(*((void *)&v77 + 1) + 8 * v25);
      uint64_t v27 = [v26 visits];
      if ([v27 count])
      {
      }
      else
      {
        uint64_t v28 = [v26 transitions];
        uint64_t v29 = [v28 count];

        if (!v29)
        {
          uint64_t v54 = [v26 placeType];
          uint64_t v55 = [v54 unsignedIntegerValue];

          if (!v55)
          {
            uint64_t v56 = [WeakRetained metrics];
            [v56 tallyKey:@"numberOfLOIsCleanedUp"];

            [v5 deleteObject:v26];
          }
          goto LABEL_37;
        }
      }
      id v30 = [v26 visits];
      uint64_t v31 = [v30 count];

      if (v31)
      {
        id v32 = [v26 visits];
        uint64_t v33 = [v32 array];
        __int16 v34 = +[RTRelabelerPersister locationFromAggregateVisits:v33];

        [v26 updateWithLearnedLocation:v34];
      }
      else
      {
        uint64_t v35 = NSString;
        __int16 v36 = [v26 identifier];
        uint64_t v37 = [v35 stringWithFormat:@"LOI found with zero visits and non zero transitions, identifier, %@", v36];

        __int16 v38 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v83 = v64;
        uint64_t v84 = v37;
        uint64_t v69 = (void *)v37;
        id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        uint64_t v40 = [v38 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:7 userInfo:v39];

        uint64_t v41 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          id v57 = NSStringFromSelector(*(SEL *)(v63 + 40));
          *(_DWORD *)buf = 138412546;
          id v87 = v57;
          __int16 v88 = 2112;
          uint64_t v89 = v40;
          _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        uint64_t v71 = v25;

        if (v40)
        {
          uint64_t v42 = [WeakRetained metrics];
          [v42 tallyError:v40];
        }
        v68 = (void *)v40;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        uint64_t v70 = v26;
        long long v43 = [v26 transitions];
        id v44 = [v43 allObjects];

        uint64_t v45 = [v44 countByEnumeratingWithState:&v73 objects:v82 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v46; ++i)
            {
              if (*(void *)v74 != v47) {
                objc_enumerationMutation(v44);
              }
              id v49 = *(void **)(*((void *)&v73 + 1) + 8 * i);
              __int16 v50 = [v49 visitIdentifierDestination];
              id v72 = 0;
              uint64_t v51 = [WeakRetained fetchLearnedLocationOfInterestVisitMOForIdentifier:v50 error:&v72];
              id v52 = v72;

              if (v52)
              {
                [v5 deleteObject:v49];
                __int16 v53 = [WeakRetained metrics];
                [v53 tallyError:v52];
              }
              else
              {
                __int16 v53 = [v51 locationOfInterest];
                [v49 setLocationOfInterest:v53];
              }
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v73 objects:v82 count:16];
          }
          while (v46);
        }

        [v5 deleteObject:v70];
        uint64_t v24 = v65;
        id v15 = v66;
        uint64_t v23 = v67;
        uint64_t v25 = v71;
      }
LABEL_37:
      if (++v25 == v23)
      {
        uint64_t v23 = [v15 countByEnumeratingWithState:&v77 objects:v85 count:16];
        if (!v23)
        {
          uint64_t v10 = v60;
          goto LABEL_40;
        }
        goto LABEL_12;
      }
    }
  }
LABEL_42:
}

- (BOOL)iterativelyCollapseOverlappingRevGeoLOIsWithError:(id *)a3
{
  if (a3)
  {
    id v16 = 0;
    [(RTRelabelerPersister *)self cleanUpWithError:&v16];
    id v5 = v16;
    if (v5)
    {
LABEL_3:
      id v6 = v5;
      BOOL v7 = 0;
      *a3 = v6;
    }
    else
    {
      buf[0] = 0;
      uint64_t v8 = -1;
      while (1)
      {
        id v9 = [(RTRelabelerPersister *)self relabelerPersisterParameters];
        unint64_t v10 = [v9 maxCollapseIterations];

        if (++v8 >= v10)
        {
LABEL_12:
          id v6 = 0;
          BOOL v7 = 1;
          goto LABEL_14;
        }
        id v15 = 0;
        [(RTRelabelerPersister *)self combineOverlappingRevGeoLOIsStabilized:buf error:&v15];
        id v11 = v15;
        if (v11) {
          break;
        }
        id v14 = 0;
        [(RTRelabelerPersister *)self cleanUpWithError:&v14];
        id v5 = v14;
        if (v5) {
          goto LABEL_3;
        }
        [(RTRelabelerPersisterMetrics *)self->_metrics tallyKey:@"numberOfCombineIterations"];
        if (buf[0]) {
          goto LABEL_12;
        }
      }
      id v12 = v11;
      *a3 = v12;

      BOOL v7 = 0;
      id v6 = 0;
    }
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    BOOL v7 = 0;
  }
LABEL_14:

  return v7;
}

- (BOOL)moveVisitMOs:(id)a3 toLOIMO:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = v9;
  if (!a5)
  {
    uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_29;
  }
  if (!v8)
  {
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
LABEL_33:

      _RTErrorInvalidParameterCreate(@"visitMOs");
      BOOL v27 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
LABEL_36:
    _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitMOs", buf, 2u);
    goto LABEL_33;
  }
  if (!v9)
  {
    uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiMO", buf, 2u);
    }

    _RTErrorInvalidParameterCreate(@"loiMO");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

    BOOL v27 = 0;
    goto LABEL_34;
  }
  id v11 = [MEMORY[0x1E4F1C978] arrayWithArray:v8];

  if (!v11)
  {
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    goto LABEL_36;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v33 = a5;
    id obj = v12;
    uint64_t v15 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v18 = (void *)MEMORY[0x1E016D870]();
        id v19 = [v17 identifier];
        id v39 = 0;
        id v20 = [(RTRelabelerPersister *)self fetchTransitionMOsEndingAtVisitIdentifier:v19 error:&v39];
        id v21 = v39;

        if (v21)
        {

          id v12 = obj;

          id v28 = v21;
          BOOL v27 = 0;
          id *v33 = v28;
          goto LABEL_31;
        }
        [v17 setLocationOfInterest:v10];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v22 = v20;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v36;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v36 != v25) {
                objc_enumerationMutation(v22);
              }
              [*(id *)(*((void *)&v35 + 1) + 8 * j) setLocationOfInterest:v10, v33];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v45 count:16];
          }
          while (v24);
        }
      }
      id v12 = obj;
      uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v27 = 1;
  id v28 = v12;
LABEL_31:

LABEL_34:
  return v27;
}

- (id)dedupableLOIsNearLocation:(id)a3 mapItem:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = v9;
  if (a5)
  {
    if (v8)
    {
      if (v9)
      {
        id v35 = 0;
        id v11 = [(RTRelabelerPersister *)self fetchNearbyLocationOfInterestMOsAroundLocation:v8 withinDistance:&v35 error:1000.0];
        id v12 = v35;
        uint64_t v13 = v12;
        if (v12)
        {
          id v30 = 0;
          *a5 = v12;
        }
        else
        {
          [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v11 count]];
          id v30 = (id)objc_claimAutoreleasedReturnValue();
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          uint64_t v29 = v11;
          id v18 = v11;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v37 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v32 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                uint64_t v24 = (void *)MEMORY[0x1E016D870]();
                uint64_t v25 = (void *)MEMORY[0x1E4F5CE38];
                id v26 = [v23 mapItem];
                BOOL v27 = [v25 createWithManagedObject:v26];

                if (v27 && [v27 isEqual:v10]) {
                  [v30 addObject:v23];
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v37 count:16];
            }
            while (v20);
          }

          id v11 = v29;
          uint64_t v13 = 0;
        }

        goto LABEL_28;
      }
      uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem", buf, 2u);
      }

      id v16 = @"mapItem";
    }
    else
    {
      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
      }

      id v16 = @"location";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v16);
    id v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  id v30 = 0;
LABEL_28:

  return v30;
}

- (id)connectedComponentForLoiMO:(id)a3 encounteredIdentifiers:(id)a4 error:(id *)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a5)
  {
    if (v7)
    {
      if (v8)
      {
        unint64_t v10 = [v7 identifier];

        if (v10)
        {
          id v57 = a5;
          id v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
          id v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
          id v58 = v7;
          uint64_t v13 = [v7 identifier];
          [v9 addObject:v13];

          id v60 = 0;
          do
          {
            if (![v12 count]) {
              break;
            }
            context = (void *)MEMORY[0x1E016D870]();
            uint64_t v14 = [v12 firstObject];
            id v15 = objc_alloc(MEMORY[0x1E4F5CE00]);
            id v66 = [v14 locationLatitude];
            [v66 doubleValue];
            double v17 = v16;
            uint64_t v64 = [v14 locationLongitude];
            [v64 doubleValue];
            double v19 = v18;
            id v62 = [v14 locationHorizontalUncertainty];
            [v62 doubleValue];
            double v21 = v20;
            id v22 = [v14 locationAltitude];
            [v22 doubleValue];
            double v24 = v23;
            uint64_t v25 = [v14 locationVerticalUncertainty];
            [v25 doubleValue];
            double v27 = v26;
            id v28 = [v14 locationReferenceFrame];
            uint64_t v29 = [v28 intValue];
            id v30 = [v14 locationSourceAccuracy];
            uint64_t v31 = [v15 initWithLatitude:0 longitude:v29 horizontalUncertainty:(int)objc_msgSend(v30, "intValue") altitude:v17 verticalUncertainty:v19 date:v21 referenceFrame:v24 speed:v27 sourceAccuracy:0.0];

            long long v32 = (void *)MEMORY[0x1E4F5CE38];
            long long v33 = [v14 mapItem];
            long long v34 = [v32 createWithManagedObject:v33];

            id v35 = (void *)v31;
            if (!v31) {
              goto LABEL_11;
            }
            if (v34)
            {
              id v73 = 0;
              long long v36 = [(RTRelabelerPersister *)self dedupableLOIsNearLocation:v31 mapItem:v34 error:&v73];
              id v37 = v73;
              uint64_t v38 = v37;
              if (v37)
              {
                id v39 = v37;

                int v40 = 15;
                id v60 = v39;
              }
              else
              {
                id v59 = v36;
                uint64_t v63 = v34;
                uint64_t v65 = v35;
                uint64_t v67 = v14;
                long long v71 = 0u;
                long long v72 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                id v41 = v36;
                uint64_t v42 = [v41 countByEnumeratingWithState:&v69 objects:v75 count:16];
                if (v42)
                {
                  uint64_t v43 = v42;
                  uint64_t v44 = *(void *)v70;
                  do
                  {
                    for (uint64_t i = 0; i != v43; ++i)
                    {
                      if (*(void *)v70 != v44) {
                        objc_enumerationMutation(v41);
                      }
                      uint64_t v46 = *(void **)(*((void *)&v69 + 1) + 8 * i);
                      uint64_t v47 = [v46 identifier];

                      if (v47)
                      {
                        id v48 = [v46 identifier];
                        id v49 = [v9 member:v48];

                        if (!v49)
                        {
                          __int16 v50 = [v46 identifier];
                          [v9 addObject:v50];

                          [v11 addObject:v46];
                          [v12 addObject:v46];
                        }
                      }
                    }
                    uint64_t v43 = [v41 countByEnumeratingWithState:&v69 objects:v75 count:16];
                  }
                  while (v43);
                }

                [v12 removeObjectAtIndex:0];
                int v40 = 0;
                id v35 = v65;
                uint64_t v14 = v67;
                long long v34 = v63;
                uint64_t v38 = 0;
                long long v36 = v59;
              }
            }
            else
            {
LABEL_11:
              [v12 removeObjectAtIndex:0];
              int v40 = 14;
            }
          }
          while (v40 != 15);
          if (v60)
          {
            id v51 = 0;
            *id v57 = v60;
          }
          else
          {
            id v51 = v11;
          }

          id v7 = v58;
        }
        else
        {
          id v51 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
        }
        goto LABEL_40;
      }
      uint64_t v55 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encounteredIdentifiers", buf, 2u);
      }

      uint64_t v54 = @"encounteredIdentifiers";
    }
    else
    {
      __int16 v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiMO", buf, 2u);
      }

      uint64_t v54 = @"loiMO";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v54);
    id v51 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  id v52 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  id v51 = 0;
LABEL_40:

  return v51;
}

- (id)loiToMoveToFromConnectedComponent:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    double v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: connectedComponent", buf, 2u);
    }

    goto LABEL_22;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (!v5)
  {
LABEL_22:
    id v7 = 0;
    goto LABEL_23;
  }
  uint64_t v6 = v5;
  id v7 = 0;
  uint64_t v8 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(v4);
      }
      unint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if (v7)
      {
        id v11 = [*(id *)(*((void *)&v25 + 1) + 8 * i) mapItem];
        id v12 = [v11 mapItemSource];
        uint64_t v13 = [v12 unsignedIntegerValue] & 0xFDFDE;

        uint64_t v14 = [v7 mapItem];
        id v15 = [v14 mapItemSource];
        uint64_t v16 = [v15 unsignedIntegerValue] & 0xFDFDE;

        if (v13) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17) {
          goto LABEL_14;
        }
        if ((v13 != 0) == (v16 != 0))
        {
          double v18 = [v7 visits];
          unint64_t v19 = [v18 count];
          double v20 = [v10 visits];
          unint64_t v21 = [v20 count];

          if (v19 < v21)
          {
LABEL_14:
            id v22 = v10;

            id v7 = v22;
          }
        }
      }
      else
      {
        id v7 = v10;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  }
  while (v6);
LABEL_23:

  return v7;
}

- (BOOL)dedupeLOIsWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v14[2] = __44__RTRelabelerPersister_dedupeLOIsWithError___block_invoke;
    v14[3] = &unk_1E6B985A8;
    objc_copyWeak(v15, &location);
    v15[1] = (id)a2;
    uint64_t v6 = (void *)MEMORY[0x1E016DB00](v14);
    id v13 = 0;
    [(RTRelabelerPersister *)self performBlock:v6 error:&v13];
    id v7 = v13;
    BOOL v8 = v7 == 0;
    if (v7)
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v12 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        double v18 = v12;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, error in deduping, %@", buf, 0x16u);
      }
      *a3 = v7;
    }

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
  else
  {
    unint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    return 0;
  }
  return v8;
}

void __44__RTRelabelerPersister_dedupeLOIsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v7 = +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation];
      [v7 setReturnsObjectsAsFaults:1];
      [v7 setFetchBatchSize:1];
      id v67 = 0;
      BOOL v8 = [v7 execute:&v67];
      id v9 = v67;
      unint64_t v10 = v9;
      if (v9)
      {
        *a3 = v9;
      }
      else
      {
        __int16 v53 = [MEMORY[0x1E4F1CA80] set];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v54 = v8;
        uint64_t v16 = [v54 countByEnumeratingWithState:&v63 objects:v69 count:16];
        if (v16)
        {
          uint64_t v51 = v16;
          id v48 = v5;
          uint64_t v49 = *(void *)v64;
          uint64_t v55 = WeakRetained;
          id v46 = v7;
          uint64_t v47 = a3;
          uint64_t v45 = v8;
          while (2)
          {
            uint64_t v17 = 0;
            double v18 = v53;
            __int16 v19 = v54;
            uint64_t v20 = v49;
            uint64_t v21 = v51;
            do
            {
              if (*(void *)v64 != v20) {
                objc_enumerationMutation(v19);
              }
              id v22 = *(void **)(*((void *)&v63 + 1) + 8 * v17);
              double v23 = (void *)MEMORY[0x1E016D870]();
              double v24 = [v22 identifier];

              if (v24)
              {
                long long v25 = [v22 identifier];
                long long v26 = [v18 member:v25];

                if (!v26)
                {
                  context = v23;
                  id v62 = 0;
                  long long v27 = [WeakRetained connectedComponentForLoiMO:v22 encounteredIdentifiers:v18 error:&v62];
                  id v28 = v62;
                  if (v28)
                  {
                    id v41 = v28;
LABEL_32:

                    a3 = v47;
                    id v5 = v48;
                    BOOL v8 = v45;
                    id v7 = v46;
                    unint64_t v10 = 0;
                    goto LABEL_34;
                  }
                  uint64_t v29 = [WeakRetained loiToMoveToFromConnectedComponent:v27];
                  if (v29)
                  {
                    long long v60 = 0u;
                    long long v61 = 0u;
                    long long v58 = 0u;
                    long long v59 = 0u;
                    __int16 v50 = v27;
                    id obj = v27;
                    uint64_t v30 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
                    if (v30)
                    {
                      uint64_t v31 = v30;
                      uint64_t v32 = *(void *)v59;
                      while (2)
                      {
                        for (uint64_t i = 0; i != v31; ++i)
                        {
                          if (*(void *)v59 != v32) {
                            objc_enumerationMutation(obj);
                          }
                          long long v34 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                          id v35 = (void *)MEMORY[0x1E016D870]();
                          long long v36 = [v34 identifier];
                          id v37 = [v29 identifier];
                          char v38 = [v36 isEqual:v37];

                          if ((v38 & 1) == 0)
                          {
                            id v39 = [v34 visits];
                            int v40 = [v39 array];
                            id v57 = 0;
                            [v55 moveVisitMOs:v40 toLOIMO:v29 error:&v57];
                            id v41 = v57;

                            if (v41)
                            {

                              id WeakRetained = v55;
                              long long v27 = v50;
                              goto LABEL_32;
                            }
                          }
                        }
                        uint64_t v31 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
                        if (v31) {
                          continue;
                        }
                        break;
                      }
                    }

                    id WeakRetained = v55;
                    double v18 = v53;
                    uint64_t v20 = v49;
                    long long v27 = v50;
                  }

                  __int16 v19 = v54;
                  uint64_t v21 = v51;
                  double v23 = context;
                }
              }
              ++v17;
            }
            while (v17 != v21);
            uint64_t v42 = [v19 countByEnumeratingWithState:&v63 objects:v69 count:16];
            id v41 = 0;
            a3 = v47;
            id v5 = v48;
            BOOL v8 = v45;
            id v7 = v46;
            unint64_t v10 = 0;
            uint64_t v51 = v42;
            if (v42) {
              continue;
            }
            break;
          }
        }
        else
        {
          id v41 = 0;
        }
LABEL_34:

        id v43 = v41;
        *a3 = v43;
      }
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F5CFE8];
      uint64_t v74 = *MEMORY[0x1E4F28568];
      v75[0] = @"swelf is nil";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1];
      uint64_t v14 = [v11 errorWithDomain:v12 code:0 userInfo:v13];

      id v15 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 138412546;
        long long v71 = v44;
        __int16 v72 = 2112;
        id v73 = v14;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      id v7 = v14;
      *a3 = v7;
    }
  }
}

- (BOOL)combineEarlierVisitMO:(id)a3 withLaterVisitMO:(id)a4 error:(id *)a5
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a5)
  {
    if (v7)
    {
      if (v8)
      {
        unint64_t v10 = [v7 entryDate];
        [v9 setEntryDate:v10];

        id v11 = [v7 expirationDate];
        uint64_t v12 = [v9 expirationDate];
        if ([v11 isAfterDate:v12]) {
          id v13 = v7;
        }
        else {
          id v13 = v9;
        }
        uint64_t v14 = [v13 expirationDate];
        [v9 setExpirationDate:v14];

        id v15 = NSNumber;
        uint64_t v16 = [v7 locationOfInterestConfidence];
        [v16 doubleValue];
        double v18 = v17;

        __int16 v19 = [v9 locationOfInterestConfidence];
        [v19 doubleValue];
        double v21 = v20;

        if (v18 >= v21) {
          double v22 = v18;
        }
        else {
          double v22 = v21;
        }
        double v23 = [v15 numberWithDouble:v22];
        [v9 setLocationOfInterestConfidence:v23];

        double v24 = NSNumber;
        long long v25 = [v7 locationOfInterestSource];
        uint64_t v26 = [v25 unsignedIntegerValue];
        long long v27 = [v9 locationOfInterestSource];
        id v28 = [v24 numberWithUnsignedInteger:[v27 unsignedIntegerValue] | v26];
        [v9 setLocationOfInterestSource:v28];

        uint64_t v29 = objc_opt_class();
        v49[0] = v7;
        v49[1] = v9;
        uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
        uint64_t v31 = [v29 locationFromAggregateVisits:v30];

        uint64_t v32 = NSNumber;
        long long v33 = [v31 location];
        [v33 latitude];
        long long v34 = [v32 numberWithDouble:];
        [v9 setLocationLatitude:v34];

        id v35 = NSNumber;
        long long v36 = [v31 location];
        [v36 longitude];
        id v37 = [v35 numberWithDouble:];
        [v9 setLocationLongitude:v37];

        char v38 = NSNumber;
        id v39 = [v31 location];
        [v39 horizontalUncertainty];
        int v40 = [v38 numberWithDouble:];
        [v9 setLocationHorizontalUncertainty:v40];

        id v41 = [NSNumber numberWithUnsignedInteger:[v31 dataPointCount]];
        [v9 setDataPointCount:v41];

        BOOL v42 = 1;
        goto LABEL_21;
      }
      id v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v48 = 0;
        _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: laterVisitMO", v48, 2u);
      }

      uint64_t v45 = @"laterVisitMO";
    }
    else
    {
      uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v48 = 0;
        _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: earlierVisitMO", v48, 2u);
      }

      uint64_t v45 = @"earlierVisitMO";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v45);
    BOOL v42 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  id v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v48 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v48, 2u);
  }

  BOOL v42 = 0;
LABEL_21:

  return v42;
}

- (BOOL)cleanUpCombinedPairs:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = v9;
  if (!a5)
  {
    char v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    BOOL v37 = 0;
    goto LABEL_47;
  }
  if (!v8)
  {
    id v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: combinedPairs", buf, 2u);
    }

    int v40 = @"combinedPairs";
    goto LABEL_44;
  }
  if (!v9)
  {
    id v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    int v40 = @"context";
LABEL_44:
    _RTErrorInvalidParameterCreate((uint64_t)v40);
    BOOL v37 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v62;
    uint64_t v45 = a5;
    uint64_t v47 = self;
    id v43 = v8;
    uint64_t v44 = *(void *)v62;
    while (2)
    {
      uint64_t v14 = 0;
      uint64_t v46 = v12;
      do
      {
        if (*(void *)v62 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v61 + 1) + 8 * v14);
        uint64_t v16 = [v15 firstObject:v43];
        double v17 = [v15 secondObject];
        __int16 v50 = v16;
        double v18 = [v16 identifier];
        id v60 = 0;
        __int16 v19 = [(RTRelabelerPersister *)self fetchTransitionMOsEndingAtVisitIdentifier:v18 error:&v60];
        id v20 = v60;

        uint64_t v49 = v19;
        if (v20)
        {
          *a5 = v20;
          int v21 = 1;
        }
        else
        {
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v22 = v19;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v67 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v57;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v57 != v25) {
                  objc_enumerationMutation(v22);
                }
                long long v27 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                id v28 = [v17 identifier];
                [v27 setVisitIdentifierDestination:v28];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v56 objects:v67 count:16];
            }
            while (v24);
          }

          uint64_t v29 = [v50 identifier];
          id v55 = 0;
          self = v47;
          uint64_t v30 = [(RTRelabelerPersister *)v47 fetchTransitionMOsOriginatingFromVisitIdentifier:v29 error:&v55];
          id v31 = v55;

          if (v31)
          {
            a5 = v45;
            *uint64_t v45 = v31;
            int v21 = 1;
          }
          else
          {
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            id v32 = v30;
            uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v66 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v52;
              do
              {
                for (uint64_t j = 0; j != v34; ++j)
                {
                  if (*(void *)v52 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  [v10 deleteObject:*(void *)(*((void *)&v51 + 1) + 8 * j)];
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v51 objects:v66 count:16];
              }
              while (v34);
            }

            [v10 deleteObject:v50];
            int v21 = 0;
            a5 = v45;
            self = v47;
          }
          uint64_t v13 = v44;

          uint64_t v12 = v46;
        }

        if (v21)
        {
          BOOL v37 = 0;
          goto LABEL_40;
        }
        ++v14;
      }
      while (v14 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    BOOL v37 = 1;
LABEL_40:
    id v8 = v43;
  }
  else
  {
    BOOL v37 = 1;
  }

LABEL_47:
  return v37;
}

- (BOOL)combineSequentialVisitsWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__RTRelabelerPersister_combineSequentialVisitsWithError___block_invoke;
    v13[3] = &unk_1E6B985A8;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a2;
    uint64_t v6 = (void *)MEMORY[0x1E016DB00](v13);
    id v12 = 0;
    [(RTRelabelerPersister *)self performBlock:v6 error:&v12];
    id v7 = v12;
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "relabeling merged sequential visits with error, %@", buf, 0xCu);
    }

    BOOL v9 = v7 == 0;
    if (v7)
    {
      [(RTRelabelerPersisterMetrics *)self->_metrics tallyError:v7];
      [(RTRelabelerPersisterMetrics *)self->_metrics setErrorKey:@"mergingSequentialVisitsErroredOut"];
      *a3 = v7;
    }

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
  else
  {
    unint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    return 0;
  }
  return v9;
}

void __57__RTRelabelerPersister_combineSequentialVisitsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v82[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    long long v54 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v7 = +[RTLearnedLocationOfInterestMO fetchRequest];
      [v7 setReturnsObjectsAsFaults:1];
      [v7 setFetchBatchSize:1];
      id v71 = 0;
      id v52 = v7;
      id v8 = [v7 execute:&v71];
      id v9 = v71;
      if (v9)
      {
        unint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v49 = NSStringFromSelector(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 138412546;
          long long v78 = v49;
          __int16 v79 = 2112;
          id v80 = v9;
          _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        void *v54 = v9;
      }
      else
      {
        id v51 = v5;
        uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id obj = v8;
        uint64_t v58 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
        if (v58)
        {
          uint64_t v57 = *(void *)v68;
          uint64_t v53 = *MEMORY[0x1E4F28568];
          long long v56 = v8;
          long long v61 = v18;
          while (2)
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v68 != v57) {
                objc_enumerationMutation(obj);
              }
              uint64_t v59 = v19;
              id v20 = *(void **)(*((void *)&v67 + 1) + 8 * v19);
              context = (void *)MEMORY[0x1E016D870]();
              int v21 = [v20 visits];
              id v22 = [v21 array];
              uint64_t v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:1];
              long long v75 = v23;
              uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
              uint64_t v25 = [v22 sortedArrayUsingDescriptors:v24];

              long long v65 = 0u;
              long long v66 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              id v26 = v25;
              uint64_t v27 = [v26 countByEnumeratingWithState:&v63 objects:v74 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = 0;
                uint64_t v30 = *(void *)v64;
                while (2)
                {
                  uint64_t v31 = 0;
                  id v32 = v29;
                  do
                  {
                    if (*(void *)v64 != v30) {
                      objc_enumerationMutation(v26);
                    }
                    uint64_t v29 = *(void **)(*((void *)&v63 + 1) + 8 * v31);
                    if (v32)
                    {
                      uint64_t v33 = [*(id *)(*((void *)&v63 + 1) + 8 * v31) entryDate];
                      uint64_t v34 = [v32 exitDate];
                      [v33 timeIntervalSinceDate:v34];
                      double v36 = v35;
                      BOOL v37 = [WeakRetained relabelerPersisterParameters];
                      [v37 visitAdjacencyMergeThreshold];
                      double v39 = v38 * 60.0;

                      if (v36 < v39)
                      {
                        id v62 = 0;
                        [WeakRetained combineEarlierVisitMO:v32 withLaterVisitMO:v29 error:&v62];
                        id v40 = v62;
                        if (v40)
                        {
                          uint64_t v45 = v40;
                          goto LABEL_33;
                        }
                        uint64_t v41 = [objc_alloc(MEMORY[0x1E4F5CE58]) initWithFirstObject:v32 secondObject:v29];
                        if (!v41)
                        {
                          uint64_t v46 = (void *)MEMORY[0x1E4F28C58];
                          uint64_t v72 = v53;
                          id v73 = @"combinedPair was nil";
                          uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
                          uint64_t v45 = [v46 errorWithDomain:@"RTRelabelerPersisterErrorDomain" code:0 userInfo:v47];

                          goto LABEL_33;
                        }
                        BOOL v42 = (void *)v41;
                        [v61 addObject:v41];
                      }
                      id v43 = v29;
                    }
                    else
                    {
                      id v44 = v29;
                    }
                    ++v31;
                    id v32 = v29;
                  }
                  while (v28 != v31);
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v63 objects:v74 count:16];
                  if (v28) {
                    continue;
                  }
                  break;
                }
                uint64_t v45 = 0;
                id v32 = v29;
LABEL_33:

                id v9 = 0;
                id v8 = v56;
              }
              else
              {
                uint64_t v45 = 0;
              }
              uint64_t v18 = v61;

              if (v45)
              {

                id v48 = v45;
                void *v54 = v48;

                id v5 = v51;
                goto LABEL_39;
              }
              uint64_t v19 = v59 + 1;
            }
            while (v59 + 1 != v58);
            uint64_t v58 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
            if (v58) {
              continue;
            }
            break;
          }
        }

        id v5 = v51;
        [WeakRetained cleanUpCombinedPairs:v18 context:v51 error:v54];
LABEL_39:
      }
      id v17 = v52;
    }
    else
    {
      id v11 = v5;
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v81 = *MEMORY[0x1E4F28568];
      v82[0] = @"swelf is nil";
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:&v81 count:1];
      id v15 = [v12 errorWithDomain:v13 code:0 userInfo:v14];

      uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v50 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 138412546;
        long long v78 = v50;
        __int16 v79 = 2112;
        id v80 = v15;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      id v17 = v15;
      void *v54 = v17;
      id v5 = v11;
    }
  }
}

- (BOOL)fixUnconcreteLOIs:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__RTRelabelerPersister_fixUnconcreteLOIs___block_invoke;
  v12[3] = &unk_1E6B985A8;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a2;
  uint64_t v6 = (void *)MEMORY[0x1E016DB00](v12);
  id v11 = 0;
  [(RTRelabelerPersister *)self performBlock:v6 error:&v11];
  id v7 = v11;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, fixing unconcrete with error, %@", buf, 0x16u);
  }
  if (v7)
  {
    [(RTRelabelerPersisterMetrics *)self->_metrics tallyError:v7];
    [(RTRelabelerPersisterMetrics *)self->_metrics setErrorKey:@"fixingUnconcreteErroredOut"];
    if (a3) {
      *a3 = v7;
    }
  }

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v7 == 0;
}

void __42__RTRelabelerPersister_fixUnconcreteLOIs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v6 = +[RTLearnedLocationOfInterestMO fetchRequest];
      [v6 setReturnsObjectsAsFaults:1];
      [v6 setFetchBatchSize:1];
      id v38 = 0;
      id v7 = [v6 execute:&v38];
      id v8 = v38;
      if (v8)
      {
        id v9 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v26 = NSStringFromSelector(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 138412546;
          BOOL v42 = v26;
          __int16 v43 = 2112;
          id v44 = v8;
          _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        *a3 = v8;
      }
      else
      {
        uint64_t v28 = v7;
        id v29 = v6;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v15 = v7;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v35 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              if ([WeakRetained unconcreteLOIMO:v20])
              {
                long long v32 = 0u;
                long long v33 = 0u;
                long long v30 = 0u;
                long long v31 = 0u;
                int v21 = [v20 visits];
                uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
                if (v22)
                {
                  uint64_t v23 = v22;
                  uint64_t v24 = *(void *)v31;
                  do
                  {
                    for (uint64_t j = 0; j != v23; ++j)
                    {
                      if (*(void *)v31 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      [*(id *)(*((void *)&v30 + 1) + 8 * j) setLocationOfInterestSource:&unk_1F3451488];
                    }
                    uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
                  }
                  while (v23);
                }
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v40 count:16];
          }
          while (v17);
        }

        id v7 = v28;
        id v6 = v29;
        id v8 = 0;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F5CFE8];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      v46[0] = @"swelf is nil";
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      uint64_t v13 = [v10 errorWithDomain:v11 code:0 userInfo:v12];

      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 138412546;
        BOOL v42 = v27;
        __int16 v43 = 2112;
        id v44 = v13;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      id v6 = v13;
      *a3 = v6;
    }
  }
}

- (id)filteredVisitMOs:(id)a3 referenceMapItem:(id)a4 referencePlaceType:(unint64_t)a5 error:(id *)a6
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (!a6)
  {
    long long v63 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    id v62 = 0;
    goto LABEL_34;
  }
  if (!v10)
  {
    long long v64 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitMOs", buf, 2u);
    }

    long long v65 = @"visitMOs";
    goto LABEL_33;
  }
  if (!v11)
  {
    long long v67 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v67, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceMapItem", buf, 2u);
    }

    long long v65 = @"referenceMapItem";
LABEL_33:
    _RTErrorInvalidParameterCreate((uint64_t)v65);
    id v62 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  long long v77 = self;
  long long v69 = a6;
  id v13 = objc_alloc(MEMORY[0x1E4F5CE00]);
  uint64_t v14 = [v12 latitude];
  [v14 doubleValue];
  double v16 = v15;
  uint64_t v17 = [v12 longitude];
  [v17 doubleValue];
  double v19 = v18;
  id v20 = [v12 uncertainty];
  [v20 doubleValue];
  double v22 = v21;
  uint64_t v72 = v12;
  uint64_t v23 = [v12 referenceFrame];
  long long v78 = [v13 initWithLatitude:0 longitude:[v23 intValue] horizontalUncertainty:v16 date:v19 referenceFrame:v22];

  uint64_t v74 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v10 count]];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v70 = v10;
  id obj = v10;
  uint64_t v76 = [obj countByEnumeratingWithState:&v82 objects:v87 count:16];
  if (v76)
  {
    uint64_t v75 = *(void *)v83;
    unint64_t v71 = a5 & 0xFFFFFFFFFFFFFFFELL;
LABEL_6:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v83 != v75) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void **)(*((void *)&v82 + 1) + 8 * v24);
      context = (void *)MEMORY[0x1E016D870]();
      id v80 = objc_alloc(MEMORY[0x1E4F5CE00]);
      id v26 = [v25 locationLatitude];
      [v26 doubleValue];
      double v28 = v27;
      id v29 = [v25 locationLongitude];
      [v29 doubleValue];
      double v31 = v30;
      long long v32 = [v25 locationHorizontalUncertainty];
      [v32 doubleValue];
      double v34 = v33;
      long long v35 = [v25 locationAltitude];
      [v35 doubleValue];
      double v37 = v36;
      id v38 = [v25 locationVerticalUncertainty];
      [v38 doubleValue];
      double v40 = v39;
      uint64_t v41 = [v25 locationReferenceFrame];
      uint64_t v42 = [v41 intValue];
      __int16 v43 = [v25 locationSourceAccuracy];
      id v44 = [v80 initWithLatitude:0.0 longitude:v42 horizontalUncertainty:(int)v43.intValue altitude:v28 verticalUncertainty:v31 date:v34 referenceFrame:v37 speed:v40 sourceAccuracy:0.0];

      uint64_t v45 = [(RTRelabelerPersister *)v77 distanceCalculator];
      id v81 = 0;
      [v45 distanceFromLocation:v44 toLocation:v78 error:&v81];
      double v47 = v46;
      id v48 = v81;

      if (v48)
      {

        id v66 = v48;
        id *v69 = v66;

        id v62 = 0;
        id v12 = v72;
        long long v61 = v74;
        goto LABEL_29;
      }
      uint64_t v49 = [(RTRelabelerPersister *)v77 learnedPlaceParameters];
      [v49 softDistanceThreshold];
      double v51 = v50;

      if (v47 >= v51)
      {
        id v52 = [(RTRelabelerPersister *)v77 learnedPlaceParameters];
        [v52 softDistanceThreshold];
        if (v47 <= v53) {
          goto LABEL_18;
        }
        long long v54 = [(RTRelabelerPersister *)v77 learnedPlaceParameters];
        [v54 softDistanceThreshold];
        if (v47 >= v55 + v55)
        {

LABEL_18:
          goto LABEL_19;
        }
        long long v56 = [v25 locationOfInterest];
        uint64_t v57 = [v56 mapItem];
        uint64_t v58 = [v57 name];
        uint64_t v59 = [v72 name];
        int v60 = [v58 isEqualToString:v59];

        if (v71 != 2 || !v60) {
          goto LABEL_19;
        }
      }
      [v74 addObject:v25];
LABEL_19:

      if (v76 == ++v24)
      {
        uint64_t v76 = [obj countByEnumeratingWithState:&v82 objects:v87 count:16];
        if (v76) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  long long v61 = v74;
  id v62 = v74;
  id v12 = v72;
LABEL_29:

  id v10 = v70;
LABEL_34:

  return v62;
}

- (BOOL)consolidateVisitsToLoisWithKnownPlaceTypesWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __76__RTRelabelerPersister_consolidateVisitsToLoisWithKnownPlaceTypesWithError___block_invoke;
    v15[3] = &unk_1E6B985A8;
    objc_copyWeak(v16, &location);
    v16[1] = (id)a2;
    id v6 = (void *)MEMORY[0x1E016DB00](v15);
    id v14 = 0;
    [(RTRelabelerPersister *)self performBlock:v6 error:&v14];
    id v7 = v14;
    BOOL v8 = v7 == 0;
    if (v7)
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v13 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        double v19 = v13;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, collapseError, %@", buf, 0x16u);
      }
      *a3 = v7;
    }
    else
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "relabeling collapsed known place LOIs successfully", buf, 2u);
      }
    }
    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    return 0;
  }
  return v8;
}

void __76__RTRelabelerPersister_consolidateVisitsToLoisWithKnownPlaceTypesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v92[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      long long v61 = a3;
      id v62 = v5;
      id v70 = [MEMORY[0x1E4F1CA48] array];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      uint64_t v7 = [&unk_1F34530A8 countByEnumeratingWithState:&v80 objects:v86 count:16];
      id v66 = WeakRetained;
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v81;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v81 != v9) {
              objc_enumerationMutation(&unk_1F34530A8);
            }
            uint64_t v11 = *(void *)(*((void *)&v80 + 1) + 8 * i);
            id v12 = +[RTLearnedLocationOfInterestMO fetchRequest];
            id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"placeType", v11];
            [v12 setPredicate:v13];

            id v14 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"placeType" ascending:0];
            long long v85 = v14;
            double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
            [v12 setSortDescriptors:v15];

            id v79 = 0;
            double v16 = [v12 execute:&v79];
            id v17 = v79;
            if (v17)
            {
              id v53 = v17;
              *a3 = v53;

              goto LABEL_32;
            }
            [v70 addObjectsFromArray:v16];
          }
          uint64_t v8 = [&unk_1F34530A8 countByEnumeratingWithState:&v80 objects:v86 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id obj = v70;
      uint64_t v65 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
      id v18 = 0;
      if (v65)
      {
        uint64_t v64 = *(void *)v76;
LABEL_13:
        uint64_t v19 = 0;
        while (1)
        {
          long long v69 = v18;
          if (*(void *)v76 != v64) {
            objc_enumerationMutation(obj);
          }
          uint64_t v67 = v19;
          __int16 v20 = *(void **)(*((void *)&v75 + 1) + 8 * v19);
          uint64_t v68 = MEMORY[0x1E016D870]();
          id v21 = objc_alloc(MEMORY[0x1E4F5CE00]);
          uint64_t v22 = [v20 mapItem];
          uint64_t v23 = [v22 latitude];
          [v23 doubleValue];
          double v25 = v24;
          id v26 = [v20 mapItem];
          double v27 = [v26 longitude];
          [v27 doubleValue];
          double v29 = v28;
          uint64_t v30 = [v20 mapItem];
          double v31 = [(id)v30 uncertainty];
          [v31 doubleValue];
          double v33 = v32;
          double v34 = [v20 mapItem];
          long long v35 = [v34 referenceFrame];
          uint64_t v36 = [v21 initWithLatitude:0 longitude:[v35 intValue] horizontalUncertainty:v25 date:v29 referenceFrame:v33];

          double v37 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
          id v38 = [v66 learnedPlaceParameters];
          [v38 softDistanceThreshold];
          id v74 = 0;
          double v39 = (void *)v36;
          LOBYTE(v30) = [v37 setupBoundingBoxFetchRequestForLocation:v36 distance:0 entityCanBeLocationShifted:0 locationShifter:0 resultExpansionPredicates:0 resultFilteringPredicates:0 error:&v74];
          id v40 = v74;

          if (v30)
          {
            [v37 setFetchBatchSize:10];
            id v73 = 0;
            uint64_t v41 = [v37 execute:&v73];
            id v42 = v73;
            __int16 v43 = v42;
            if (v42)
            {
              id v18 = v42;
              uint64_t v45 = (void *)v68;
              id v44 = v69;
              int v46 = 4;
              double v47 = v41;
            }
            else
            {
              id v48 = [v20 mapItem];
              uint64_t v49 = [v20 placeType];
              uint64_t v50 = [v49 integerValue];
              id v72 = 0;
              double v47 = [v66 filteredVisitMOs:v41 referenceMapItem:v48 referencePlaceType:v50 error:&v72];
              id v44 = v72;

              if (v44)
              {
                id v18 = v44;
                id v51 = v69;
                int v46 = 4;
              }
              else
              {
                id v71 = 0;
                [v66 moveVisitMOs:v47 toLOIMO:v20 error:&v71];
                id v52 = v71;
                if (v52)
                {
                  id v51 = v52;

                  int v46 = 4;
                  id v18 = v51;
                }
                else
                {
                  id v51 = 0;
                  int v46 = 0;
                  id v18 = v69;
                }
              }
              uint64_t v45 = (void *)v68;
            }
          }
          else
          {
            id v18 = v40;
            uint64_t v45 = (void *)v68;
            __int16 v43 = v69;
            int v46 = 4;
          }

          if (v46) {
            break;
          }
          uint64_t v19 = v67 + 1;
          if (v65 == v67 + 1)
          {
            uint64_t v65 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
            if (v65) {
              goto LABEL_13;
            }
            break;
          }
        }
      }

      id v12 = v18;
      void *v61 = v12;
LABEL_32:

      id v5 = v62;
      id v54 = v70;
      id WeakRetained = v66;
    }
    else
    {
      double v55 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F5CFE8];
      uint64_t v91 = *MEMORY[0x1E4F28568];
      v92[0] = @"swelf is nil";
      uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:&v91 count:1];
      uint64_t v58 = [v55 errorWithDomain:v56 code:0 userInfo:v57];

      uint64_t v59 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        int v60 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 138412546;
        uint64_t v88 = v60;
        __int16 v89 = 2112;
        uint64_t v90 = v58;
        _os_log_error_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      id v54 = v58;
      *a3 = v54;
    }
  }
}

- (BOOL)saveWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  [(RTRelabelerPersister *)self performBlock:&__block_literal_global_434 error:&v11];
  id v6 = v11;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@, save error, %@", buf, 0x16u);
    }
    [(RTRelabelerPersisterMetrics *)self->_metrics tallyError:v6];
    [(RTRelabelerPersisterMetrics *)self->_metrics setErrorKey:@"saveErroredOut"];
    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "relabeling saved successfully", buf, 2u);
    }
  }
  return v6 == 0;
}

void __38__RTRelabelerPersister_saveWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = 0;
  [a2 save:&v5];
  id v4 = v5;
  *a3 = v4;
}

- (void)logLocalStoreWithReason:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__RTRelabelerPersister_logLocalStoreWithReason___block_invoke;
  void v8[3] = &unk_1E6B98640;
  id v9 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1E016DB00](v8);
  uint64_t v7 = 0;
  [(RTRelabelerPersister *)self performBlock:v6 error:&v7];
}

void __48__RTRelabelerPersister_logLocalStoreWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (*(void *)(a1 + 32))
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v59 = v7;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "start logging local store with reason, %@", buf, 0xCu);
    }
  }
  uint64_t v8 = +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation];
  [v8 setReturnsObjectsAsFaults:1];
  [v8 setFetchBatchSize:5];
  id v55 = 0;
  id v9 = [v8 execute:&v55];
  id v10 = v55;
  if (v10)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v59 = (uint64_t)v10;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "log locations error, %@", buf, 0xCu);
    }

    *a3 = v10;
  }
  else
  {
    double v33 = v9;
    uint64_t v34 = a1;
    long long v35 = v8;
    id v36 = v5;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v9;
    uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
    if (v40)
    {
      uint64_t v38 = *(void *)v52;
      uint64_t v39 = 0;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v52 != v38) {
            objc_enumerationMutation(obj);
          }
          id v13 = +[RTLearnedLocationOfInterest createWithManagedObject:*(void *)(*((void *)&v51 + 1) + 8 * v12)];
          __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          uint64_t v41 = v12;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v59 = ++v39;
            __int16 v60 = 2112;
            long long v61 = v13;
            _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "locationOfInterest %lu, %@", buf, 0x16u);
          }

          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v42 = v13;
          id v15 = [v13 visits];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            id v18 = 0;
            uint64_t v19 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v48 != v19) {
                  objc_enumerationMutation(v15);
                }
                id v21 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  ++v18;
                  *(_DWORD *)buf = 134218242;
                  uint64_t v59 = (uint64_t)v18;
                  __int16 v60 = 2112;
                  long long v61 = v21;
                  _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "visit %lu, %@", buf, 0x16u);
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v57 count:16];
            }
            while (v17);
          }

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v23 = [v42 transitions];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v56 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            id v26 = 0;
            uint64_t v27 = *(void *)v44;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v44 != v27) {
                  objc_enumerationMutation(v23);
                }
                double v29 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  ++v26;
                  *(_DWORD *)buf = 134218242;
                  uint64_t v59 = (uint64_t)v26;
                  __int16 v60 = 2112;
                  long long v61 = v29;
                  _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "transition %lu, %@", buf, 0x16u);
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v56 count:16];
            }
            while (v25);
          }

          uint64_t v12 = v41 + 1;
        }
        while (v41 + 1 != v40);
        uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
      }
      while (v40);
    }

    uint64_t v8 = v35;
    id v5 = v36;
    id v10 = 0;
    id v9 = v33;
    if (*(void *)(v34 + 32))
    {
      double v31 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = *(void *)(v34 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v59 = v32;
        _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "end logging local store with reason, %@", buf, 0xCu);
      }
    }
  }
}

- (RTRelabelerPersisterMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (RTMapItemProviderReverseGeocode)reverseGeocodeProvider
{
  return self->_reverseGeocodeProvider;
}

- (RTMapItemProviderLearnedPlaceParameters)learnedPlaceParameters
{
  return self->_learnedPlaceParameters;
}

- (NSMutableDictionary)loiIdentifierToUnconcreteMap
{
  return self->_loiIdentifierToUnconcreteMap;
}

- (RTRelabelerParameters)relabelerParameters
{
  return self->_relabelerParameters;
}

- (RTRelabelerPersisterParameters)relabelerPersisterParameters
{
  return self->_relabelerPersisterParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relabelerPersisterParameters, 0);
  objc_storeStrong((id *)&self->_relabelerParameters, 0);
  objc_storeStrong((id *)&self->_loiIdentifierToUnconcreteMap, 0);
  objc_storeStrong((id *)&self->_learnedPlaceParameters, 0);
  objc_storeStrong((id *)&self->_reverseGeocodeProvider, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_metrics, 0);
}

@end