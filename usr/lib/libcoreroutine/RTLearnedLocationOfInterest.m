@interface RTLearnedLocationOfInterest
+ (id)createWithLearnedLocationOfInterestMO:(id)a3;
+ (id)createWithLearnedLocationOfInterestVisitMO:(id)a3;
+ (id)createWithManagedObject:(id)a3;
+ (unint64_t)mapItemSourceFromGeoMapItemSource:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)transitions;
- (NSArray)visits;
- (NSString)description;
- (NSUUID)identifier;
- (RTLearnedLocation)location;
- (RTLearnedLocationOfInterest)init;
- (RTLearnedLocationOfInterest)initWithIdentifier:(id)a3 location:(id)a4 place:(id)a5 visits:(id)a6 transitions:(id)a7;
- (RTLearnedLocationOfInterest)initWithLocationOfInterest:(id)a3 creationDate:(id)a4;
- (RTLearnedPlace)place;
- (double)dwellTime;
- (id)filterWithDateInterval:(id)a3;
- (id)managedObjectWithContext:(id)a3;
- (unint64_t)hash;
- (void)updateManagedObject:(id)a3;
@end

@implementation RTLearnedLocationOfInterest

+ (id)createWithManagedObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      uint64_t v5 = [(id)objc_opt_class() createWithLearnedLocationOfInterestMO:v4];
LABEL_6:
      v6 = (void *)v5;

      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      uint64_t v5 = [(id)objc_opt_class() createWithLearnedLocationOfInterestVisitMO:v4];
      goto LABEL_6;
    }
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412802;
      id v10 = v3;
      __int16 v11 = 2080;
      v12 = "+[RTLearnedLocationOfInterest(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v13 = 1024;
      int v14 = 49;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLearnedLocationOfInterest+CoreDataReadable (in %s:%d)", (uint8_t *)&v9, 0x1Cu);
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

+ (id)createWithLearnedLocationOfInterestMO:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 identifier];

  if (!v4)
  {
    v74 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    v76 = "Invalid parameter not satisfying: learnedLocationOfInterestMO.identifier";
LABEL_42:
    _os_log_error_impl(&dword_1D9BFA000, v74, OS_LOG_TYPE_ERROR, v76, buf, 2u);
    goto LABEL_37;
  }
  uint64_t v5 = [v3 placeIdentifier];

  if (v5)
  {
    v82 = [RTLearnedLocation alloc];
    id v6 = objc_alloc(MEMORY[0x1E4F5CE00]);
    v85 = [v3 locationLatitude];
    [v85 doubleValue];
    double v8 = v7;
    v83 = [v3 locationLongitude];
    [v83 doubleValue];
    double v10 = v9;
    __int16 v11 = [v3 locationHorizontalUncertainty];
    [v11 doubleValue];
    double v13 = v12;
    int v14 = [v3 locationAltitude];
    [v14 doubleValue];
    double v16 = v15;
    v17 = [v3 locationVerticalUncertainty];
    [v17 doubleValue];
    double v19 = v18;
    v20 = [v3 locationReferenceFrame];
    uint64_t v21 = [v20 intValue];
    v22 = [v3 locationSourceAccuracy];
    v23 = [v6 initWithLatitude:0 longitude:v21 horizontalUncertainty:(int)v22.intValue altitude:v8 verticalUncertainty:v10 date:v13 referenceFrame:v16 speed:v19 sourceAccuracy:0.0];
    v24 = [v3 dataPointCount];
    uint64_t v25 = [v24 unsignedIntegerValue];
    v26 = [v3 confidence];
    [v26 doubleValue];
    uint64_t v80 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v82, "initWithLocation:dataPointCount:confidence:", v23, v25);

    v79 = +[RTLearnedPlace createWithManagedObject:v3];
    v27 = (void *)MEMORY[0x1E4F1CA48];
    v28 = [v3 visits];
    v86 = [v27 arrayWithCapacity:[v28 count]];

    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    v81 = v3;
    v29 = [v3 visits];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v91 objects:v108 count:16];
    if (!v30) {
      goto LABEL_18;
    }
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v92;
    while (1)
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v92 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        uint64_t v35 = [v34 entryDate];
        if (v35)
        {
          v36 = (void *)v35;
          uint64_t v37 = [v34 exitDate];
          if (v37)
          {
            v38 = (void *)v37;
            v39 = [v34 entryDate];
            v40 = [v34 exitDate];
            uint64_t v41 = [v39 compare:v40];

            if (v41 != 1)
            {
              v42 = +[RTLearnedVisit createWithManagedObject:v34];
              if (v42) {
                [v86 addObject:v42];
              }
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
        v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = [v34 identifier];
          v44 = [v34 entryDate];
          v45 = [v44 stringFromDate];
          v46 = [v34 exitDate];
          v47 = [v46 stringFromDate];
          *(_DWORD *)buf = 138413314;
          v99 = v43;
          __int16 v100 = 2112;
          v101 = v45;
          __int16 v102 = 2112;
          v103 = v47;
          __int16 v104 = 2080;
          v105 = "+[RTLearnedLocationOfInterest(RTCoreDataTransformable) createWithLearnedLocationOfInterestMO:]";
          __int16 v106 = 1024;
          int v107 = 81;
          _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "location of interest visit, %@, has one or more malformed dates, entry, %@, exit, %@ (in %s:%d)", buf, 0x30u);
        }
LABEL_16:
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v91 objects:v108 count:16];
      if (!v31)
      {
LABEL_18:

        v78 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:1];
        v97 = v78;
        v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
        [v86 sortUsingDescriptors:v48];

        v49 = (void *)MEMORY[0x1E4F1CA48];
        v50 = [v81 transitions];
        v84 = [v49 arrayWithCapacity:[v50 count]];

        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        v51 = [v81 transitions];
        uint64_t v52 = [v51 countByEnumeratingWithState:&v87 objects:v96 count:16];
        if (!v52) {
          goto LABEL_33;
        }
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v88;
        while (1)
        {
          for (uint64_t j = 0; j != v53; ++j)
          {
            if (*(void *)v88 != v54) {
              objc_enumerationMutation(v51);
            }
            v56 = *(void **)(*((void *)&v87 + 1) + 8 * j);
            uint64_t v57 = [v56 startDate];
            if (v57)
            {
              v58 = (void *)v57;
              uint64_t v59 = [v56 stopDate];
              if (v59)
              {
                v60 = (void *)v59;
                v61 = [v56 startDate];
                v62 = [v56 stopDate];
                uint64_t v63 = [v61 compare:v62];

                if (v63 != 1)
                {
                  v64 = +[RTLearnedTransition createWithManagedObject:v56];
                  if (v64) {
                    [v84 addObject:v64];
                  }
                  goto LABEL_31;
                }
              }
              else
              {
              }
            }
            v64 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              v65 = [v56 identifier];
              v66 = [v56 startDate];
              v67 = [v66 stringFromDate];
              v68 = [v56 stopDate];
              v69 = [v68 stringFromDate];
              *(_DWORD *)buf = 138413314;
              v99 = v65;
              __int16 v100 = 2112;
              v101 = v67;
              __int16 v102 = 2112;
              v103 = v69;
              __int16 v104 = 2080;
              v105 = "+[RTLearnedLocationOfInterest(RTCoreDataTransformable) createWithLearnedLocationOfInterestMO:]";
              __int16 v106 = 1024;
              int v107 = 105;
              _os_log_error_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_ERROR, "location of interest transition, %@, has one or more malformed dates, start, %@, stop, %@ (in %s:%d)", buf, 0x30u);
            }
LABEL_31:
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v87 objects:v96 count:16];
          if (!v53)
          {
LABEL_33:

            v70 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
            v95 = v70;
            v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
            [v84 sortUsingDescriptors:v71];

            v72 = [RTLearnedLocationOfInterest alloc];
            id v3 = v81;
            v73 = [v81 identifier];
            v74 = v80;
            v75 = [(RTLearnedLocationOfInterest *)v72 initWithIdentifier:v73 location:v80 place:v79 visits:v86 transitions:v84];

            goto LABEL_38;
          }
        }
      }
    }
  }
  v74 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v76 = "Invalid parameter not satisfying: learnedLocationOfInterestMO.placeIdentifier";
    goto LABEL_42;
  }
LABEL_37:
  v75 = 0;
LABEL_38:

  return v75;
}

+ (id)createWithLearnedLocationOfInterestVisitMO:(id)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      uint64_t v35 = 0;
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: visitMO";
LABEL_27:
    _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, v36, buf, 2u);
    goto LABEL_10;
  }
  uint64_t v5 = [v3 identifier];

  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: visitMO.identifier";
    goto LABEL_27;
  }
  id v6 = [v4 locationOfInterest];
  double v7 = [v6 identifier];

  if (v7)
  {
    v38 = [RTLearnedLocation alloc];
    id v8 = objc_alloc(MEMORY[0x1E4F5CE00]);
    v42 = [v6 locationLatitude];
    [v42 doubleValue];
    double v10 = v9;
    uint64_t v41 = [v6 locationLongitude];
    [v41 doubleValue];
    double v12 = v11;
    v40 = [v6 locationHorizontalUncertainty];
    [v40 doubleValue];
    double v14 = v13;
    double v15 = [v6 locationAltitude];
    [v15 doubleValue];
    double v17 = v16;
    double v18 = [v6 locationVerticalUncertainty];
    [v18 doubleValue];
    double v20 = v19;
    uint64_t v21 = [v6 locationReferenceFrame];
    uint64_t v22 = [v21 intValue];
    v23 = [v6 locationSourceAccuracy];
    v24 = [v8 initWithLatitude:0 longitude:v22 horizontalUncertainty:(int)objc_msgSend(v23, "intValue") altitude:v10 verticalUncertainty:v12 date:v14 referenceFrame:v20 speed:0.0 sourceAccuracy:0.0];
    uint64_t v25 = [v6 dataPointCount];
    uint64_t v26 = [v25 unsignedIntegerValue];
    v27 = [v6 confidence];
    [v27 doubleValue];
    uint64_t v39 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v38, "initWithLocation:dataPointCount:confidence:", v24, v26);

    v28 = +[RTLearnedPlace createWithManagedObject:v6];
    if (v28)
    {
      v29 = +[RTLearnedVisit createWithManagedObject:v4];
      if (v29)
      {
        uint64_t v30 = [RTLearnedLocationOfInterest alloc];
        uint64_t v31 = [v6 identifier];
        v44[0] = v29;
        uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
        v33 = v30;
        v34 = v39;
        uint64_t v35 = [(RTLearnedLocationOfInterest *)v33 initWithIdentifier:v31 location:v39 place:v28 visits:v32 transitions:0];
      }
      else
      {
        uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
        }
        uint64_t v35 = 0;
        v34 = v39;
      }
    }
    else
    {
      v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedPlace", buf, 2u);
      }
      uint64_t v35 = 0;
      v34 = v39;
    }
  }
  else
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationOfInterestMO.identifier", buf, 2u);
    }
    uint64_t v35 = 0;
  }

LABEL_23:

  return v35;
}

- (id)managedObjectWithContext:(id)a3
{
  if (a3)
  {
    id v3 = +[RTLearnedLocationOfInterestMO managedObjectWithLocationOfInterest:self inManagedObjectContext:a3];
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

- (void)updateManagedObject:(id)a3
{
  id v6 = a3;
  id v4 = [v6 managedObjectContext];
  id v5 = +[RTLearnedLocationOfInterestMO managedObjectWithLocationOfInterest:self managedObject:v6 inManagedObjectContext:v4];
}

+ (unint64_t)mapItemSourceFromGeoMapItemSource:(unint64_t)a3
{
  return a3 & 0x1D9 | (4 * ((a3 >> 1) & 1)) | (a3 >> 1) & 0xF800;
}

- (RTLearnedLocationOfInterest)initWithLocationOfInterest:(id)a3 creationDate:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v33 = [[RTLearnedLocation alloc] initWithLocationOfInterest:v5];
  uint64_t v32 = [v5 mapItem];
  double v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = [v5 visits];
  uint64_t v35 = [v7 arrayWithCapacity:[v8 count]];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = [v5 visits];
  uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    double v11 = 0;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        double v15 = [v5 visits];
        BOOL v16 = (unint64_t)[v15 count] > 1;

        double v17 = [v14 exitDate];
        double v18 = [v17 dateByAddingTimeInterval:dbl_1DA0FF860[v16]];

        if (!v11 || [v11 compare:v18] == -1)
        {
          id v19 = v18;

          double v11 = v19;
        }
        double v20 = [[RTLearnedVisit alloc] initWithVisit:v14 locationOfInterest:v5 creationDate:v6 expirationDate:v18];
        if (v20) {
          [v35 addObject:v20];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v10);
  }
  else
  {
    double v11 = 0;
  }

  uint64_t v21 = [v6 dateByAddingTimeInterval:4838400.0];
  uint64_t v22 = [RTLearnedPlace alloc];
  v23 = [v5 identifier];
  unint64_t v24 = +[RTLearnedPlace placeTypeFromType:](RTLearnedPlace, "placeTypeFromType:", [v5 type]);
  unint64_t v25 = +[RTLearnedPlace placeTypeSourceFromTypeSource:](RTLearnedPlace, "placeTypeSourceFromTypeSource:", [v5 typeSource]);
  uint64_t v26 = [v5 customLabel];
  v27 = [(RTLearnedPlace *)v22 initWithIdentifier:v23 type:v24 typeSource:v25 mapItem:v32 customLabel:v26 creationDate:v6 expirationDate:v21];

  v28 = [v5 identifier];
  v29 = [(RTLearnedLocationOfInterest *)self initWithIdentifier:v28 location:v33 place:v27 visits:v35 transitions:MEMORY[0x1E4F1CBF0]];

  return v29;
}

- (RTLearnedLocationOfInterest)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_location_place_visits_transitions_);
}

- (RTLearnedLocationOfInterest)initWithIdentifier:(id)a3 location:(id)a4 place:(id)a5 visits:(id)a6 transitions:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v25 = a7;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_13:
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:]";
      __int16 v29 = 1024;
      int v30 = 31;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", buf, 0x12u);
    }

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:]";
    __int16 v29 = 1024;
    int v30 = 30;
    _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
  }

  if (!v13) {
    goto LABEL_13;
  }
LABEL_3:
  if (v14)
  {
LABEL_4:
    BOOL v16 = 0;
    if (v12 && v13)
    {
      v26.receiver = self;
      v26.super_class = (Class)RTLearnedLocationOfInterest;
      double v17 = [(RTLearnedLocationOfInterest *)&v26 init];
      if (v17)
      {
        uint64_t v18 = [v12 copy];
        identifier = v17->_identifier;
        v17->_identifier = (NSUUID *)v18;

        objc_storeStrong((id *)&v17->_location, a4);
        objc_storeStrong((id *)&v17->_place, a5);
        objc_storeStrong((id *)&v17->_visits, a6);
        objc_storeStrong((id *)&v17->_transitions, a7);
      }
      self = v17;
      BOOL v16 = self;
    }
    double v20 = v25;
    goto LABEL_19;
  }
LABEL_16:
  v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  double v20 = v25;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:]";
    __int16 v29 = 1024;
    int v30 = 32;
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place (in %s:%d)", buf, 0x12u);
  }

  BOOL v16 = 0;
LABEL_19:

  return v16;
}

- (id)filterWithDateInterval:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  if (v57)
  {
    v56 = [MEMORY[0x1E4F1CA48] array];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v54 = self;
    id v4 = [(RTLearnedLocationOfInterest *)self visits];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v62 objects:v77 count:16];
    if (!v5) {
      goto LABEL_17;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v63;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v63 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        uint64_t v10 = [v9 entryDate];
        if (v10)
        {
          double v11 = (void *)v10;
          uint64_t v12 = [v9 exitDate];
          if (v12)
          {
            id v13 = (void *)v12;
            id v14 = [v9 exitDate];
            id v15 = [v9 entryDate];
            int v16 = [v14 isOnOrBefore:v15];

            if (!v16)
            {
              id v17 = objc_alloc(MEMORY[0x1E4F28C18]);
              uint64_t v18 = [v9 entryDate];
              id v19 = [v9 exitDate];
              double v20 = [v17 initWithStartDate:v18 endDate:v19];

              if ([v20 intersectsDateInterval:v57]) {
                [v56 addObject:v9];
              }
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        double v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = [v9 identifier];
          uint64_t v22 = [v9 entryDate];
          v23 = [v22 stringFromDate];
          unint64_t v24 = [v9 exitDate];
          id v25 = [v24 stringFromDate];
          *(_DWORD *)buf = 138413314;
          v68 = v21;
          __int16 v69 = 2112;
          v70 = v23;
          __int16 v71 = 2112;
          v72 = v25;
          __int16 v73 = 2080;
          v74 = "-[RTLearnedLocationOfInterest filterWithDateInterval:]";
          __int16 v75 = 1024;
          int v76 = 66;
          _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "location of interest visit, %@, has one or more malformed dates, entry, %@, exit, %@ (in %s:%d)", buf, 0x30u);
        }
LABEL_15:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v62 objects:v77 count:16];
      if (!v6)
      {
LABEL_17:

        v55 = [MEMORY[0x1E4F1CA48] array];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        objc_super v26 = [(RTLearnedLocationOfInterest *)v54 transitions];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v66 count:16];
        if (!v27) {
          goto LABEL_32;
        }
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v59;
        while (1)
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v59 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void **)(*((void *)&v58 + 1) + 8 * j);
            uint64_t v32 = [v31 startDate];
            if (v32)
            {
              v33 = (void *)v32;
              uint64_t v34 = [v31 stopDate];
              if (v34)
              {
                uint64_t v35 = (void *)v34;
                long long v36 = [v31 stopDate];
                long long v37 = [v31 startDate];
                int v38 = [v36 isOnOrBefore:v37];

                if (!v38)
                {
                  id v39 = objc_alloc(MEMORY[0x1E4F28C18]);
                  v40 = [v31 startDate];
                  uint64_t v41 = [v31 stopDate];
                  v42 = [v39 initWithStartDate:v40 endDate:v41];

                  if ([v42 intersectsDateInterval:v57]) {
                    [v55 addObject:v31];
                  }
                  goto LABEL_30;
                }
              }
              else
              {
              }
            }
            v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              v43 = [v31 identifier];
              v44 = [v31 startDate];
              v45 = [v44 stringFromDate];
              v46 = [v31 stopDate];
              v47 = [v46 stringFromDate];
              *(_DWORD *)buf = 138413314;
              v68 = v43;
              __int16 v69 = 2112;
              v70 = v45;
              __int16 v71 = 2112;
              v72 = v47;
              __int16 v73 = 2080;
              v74 = "-[RTLearnedLocationOfInterest filterWithDateInterval:]";
              __int16 v75 = 1024;
              int v76 = 88;
              _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "location of interest transition, %@, has one or more malformed dates, start, %@, stop, %@ (in %s:%d)", buf, 0x30u);
            }
LABEL_30:
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v58 objects:v66 count:16];
          if (!v28)
          {
LABEL_32:

            v48 = [RTLearnedLocationOfInterest alloc];
            v49 = [(RTLearnedLocationOfInterest *)v54 identifier];
            v50 = [(RTLearnedLocationOfInterest *)v54 location];
            v51 = [(RTLearnedLocationOfInterest *)v54 place];
            uint64_t v52 = [(RTLearnedLocationOfInterest *)v48 initWithIdentifier:v49 location:v50 place:v51 visits:v56 transitions:v55];

            goto LABEL_34;
          }
        }
      }
    }
  }
  uint64_t v52 = self;
LABEL_34:

  return v52;
}

- (double)dwellTime
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v2 = [(RTLearnedLocationOfInterest *)self visits];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v27;
    double v7 = 0.0;
    *(void *)&long long v4 = 138413314;
    long long v25 = v4;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v10 = [v9 entryDate:v25];
        if (v10)
        {
          double v11 = (void *)v10;
          uint64_t v12 = [v9 exitDate];
          if (v12)
          {
            id v13 = (void *)v12;
            id v14 = [v9 exitDate];
            id v15 = [v9 entryDate];
            int v16 = [v14 isOnOrBefore:v15];

            if (!v16)
            {
              [v9 duration];
              double v7 = v7 + v17;
              continue;
            }
          }
          else
          {
          }
        }
        uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          id v19 = [v9 identifier];
          double v20 = [v9 entryDate];
          uint64_t v21 = [v20 stringFromDate];
          uint64_t v22 = [v9 exitDate];
          v23 = [v22 stringFromDate];
          *(_DWORD *)buf = v25;
          uint64_t v31 = v19;
          __int16 v32 = 2112;
          v33 = v21;
          __int16 v34 = 2112;
          uint64_t v35 = v23;
          __int16 v36 = 2080;
          long long v37 = "-[RTLearnedLocationOfInterest dwellTime]";
          __int16 v38 = 1024;
          int v39 = 119;
          _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "location of interest visit, %@, has one or more malformed dates, entry, %@, exit, %@ (in %s:%d)", buf, 0x30u);
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v26 objects:v40 count:16];
      if (!v5) {
        goto LABEL_18;
      }
    }
  }
  double v7 = 0.0;
LABEL_18:

  return v7;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  long long v4 = [(RTLearnedLocationOfInterest *)self identifier];
  uint64_t v5 = [v4 UUIDString];
  uint64_t v6 = [(RTLearnedLocationOfInterest *)self location];
  double v7 = [(RTLearnedLocationOfInterest *)self place];
  id v8 = [(RTLearnedLocationOfInterest *)self visits];
  uint64_t v9 = [v8 count];
  uint64_t v10 = [(RTLearnedLocationOfInterest *)self transitions];
  double v11 = [v3 stringWithFormat:@"identifier, %@, location, %@, place, %@, visits, %lu, transitions, %lu", v5, v6, v7, v9, [v10 count]];

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RTLearnedLocationOfInterest *)a3;
  uint64_t v6 = v5;
  if (v5 == self)
  {
    char v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v7 = v6;
        id v8 = [(RTLearnedLocationOfInterest *)self identifier];
        if (v8
          || ([(RTLearnedLocationOfInterest *)v7 identifier],
              (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v9 = [(RTLearnedLocationOfInterest *)self identifier];
          uint64_t v10 = [(RTLearnedLocationOfInterest *)v7 identifier];
          char v11 = [v9 isEqual:v10];

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          char v11 = 1;
        }

        goto LABEL_12;
      }
    }
    char v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v2 = [(RTLearnedLocationOfInterest *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (RTLearnedLocation)location
{
  return self->_location;
}

- (RTLearnedPlace)place
{
  return self->_place;
}

- (NSArray)visits
{
  return self->_visits;
}

- (NSArray)transitions
{
  return self->_transitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end