@interface RTLearnedVisit
+ (id)createWithLearnedLocationOfInterestVisitMO:(id)a3;
+ (id)createWithLearnedVisitMO:(id)a3;
+ (id)createWithManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSDate)entryDate;
- (NSDate)exitDate;
- (NSDate)expirationDate;
- (NSString)description;
- (NSUUID)identifier;
- (RTLearnedLocation)location;
- (RTLearnedVisit)init;
- (RTLearnedVisit)initWithIdentifier:(id)a3 location:(id)a4 entryDate:(id)a5 exitDate:(id)a6 creationDate:(id)a7 expirationDate:(id)a8;
- (RTLearnedVisit)initWithIdentifier:(id)a3 location:(id)a4 entryDate:(id)a5 exitDate:(id)a6 creationDate:(id)a7 expirationDate:(id)a8 placeConfidence:(double)a9 placeSource:(unint64_t)a10;
- (RTLearnedVisit)initWithVisit:(id)a3 locationOfInterest:(id)a4 creationDate:(id)a5 expirationDate:(id)a6;
- (double)duration;
- (double)placeConfidence;
- (id)managedObjectWithContext:(id)a3;
- (unint64_t)hash;
- (unint64_t)placeSource;
- (void)setPlaceConfidence:(double)a3;
- (void)setPlaceSource:(unint64_t)a3;
- (void)updateManagedObject:(id)a3;
@end

@implementation RTLearnedVisit

- (RTLearnedVisit)initWithVisit:(id)a3 locationOfInterest:(id)a4 creationDate:(id)a5 expirationDate:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a3;
  v11 = [v10 identifier];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F29128] UUID];
  }
  v13 = [RTLearnedLocation alloc];
  v14 = [v10 location];
  v15 = [(RTLearnedLocation *)v13 initWithLocation:v14 dataPointCount:30 type:1];
  v16 = [v10 entryDate];
  v17 = [v10 exitDate];
  [v10 locationOfInterestConfidence];
  double v19 = v18;
  uint64_t v20 = [v10 locationOfInterestSource];

  v21 = [(RTLearnedVisit *)self initWithIdentifier:v12 location:v15 entryDate:v16 exitDate:v17 creationDate:v9 expirationDate:v8 placeConfidence:v19 placeSource:v20];
  if (!v11) {

  }
  return v21;
}

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
      uint64_t v5 = [(id)objc_opt_class() createWithLearnedVisitMO:v4];
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
      v12 = "+[RTLearnedVisit(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v13 = 1024;
      int v14 = 40;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLearnedVisit+CoreDataTransformable (in %s:%d)", (uint8_t *)&v9, 0x1Cu);
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

+ (id)createWithLearnedVisitMO:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v50 = 0;
    v42 = "Invalid parameter not satisfying: learnedVisitMO";
    v43 = (uint8_t *)&v50;
LABEL_20:
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, v42, v43, 2u);
    goto LABEL_15;
  }
  uint64_t v5 = [v3 identifier];

  if (!v5)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: learnedVisitMO.identifier";
    v43 = buf;
    goto LABEL_20;
  }
  v6 = [v4 managedObjectContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [v4 managedObjectContext];
    if ((-[NSObject allowTombstones](v8, "allowTombstones") & 1) != 0 || ([v4 flags] & 1) == 0)
    {

      goto LABEL_7;
    }
LABEL_15:

    v41 = 0;
    goto LABEL_16;
  }
LABEL_7:
  v47 = [RTLearnedLocation alloc];
  id v9 = objc_alloc(MEMORY[0x1E4F5CE00]);
  v46 = [v4 locationLatitude];
  [v46 doubleValue];
  double v11 = v10;
  v45 = [v4 locationLongitude];
  [v45 doubleValue];
  double v13 = v12;
  int v14 = [v4 locationHorizontalUncertainty];
  [v14 doubleValue];
  double v16 = v15;
  v17 = [v4 locationAltitude];
  [v17 doubleValue];
  double v19 = v18;
  uint64_t v20 = [v4 locationVerticalUncertainty];
  [v20 doubleValue];
  double v22 = v21;
  v23 = [v4 locationReferenceFrame];
  uint64_t v24 = [v23 intValue];
  v25 = [v4 locationSourceAccuracy];
  v26 = [v9 initWithLatitude:0.0 longitude:v24 horizontalUncertainty:(int)v25.intValue altitude:v11 verticalUncertainty:v13 date:v16 speed:v22 sourceAccuracy:0.0];
  v27 = [v4 dataPointCount];
  uint64_t v28 = [v27 unsignedIntegerValue];
  v29 = [v4 confidence];
  [v29 doubleValue];
  v48 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v47, "initWithLocation:dataPointCount:confidence:", v26, v28);

  v30 = [RTLearnedVisit alloc];
  v31 = [v4 identifier];
  v32 = [v4 entryDate];
  v33 = [v4 exitDate];
  v34 = [v4 creationDate];
  v35 = v34;
  if (!v34)
  {
    v35 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  v36 = [v4 expirationDate];
  v37 = [v4 placeConfidence];
  [v37 doubleValue];
  double v39 = v38;
  v40 = [v4 placeSource];
  v41 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v30, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v31, v48, v32, v33, v35, v36, v39, [v40 unsignedIntegerValue]);

  if (!v34) {
LABEL_16:
  }

  return v41;
}

+ (id)createWithLearnedLocationOfInterestVisitMO:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v41 = 0;
      goto LABEL_12;
    }
    __int16 v49 = 0;
    v43 = "Invalid parameter not satisfying: learnedLocationOfInterestVisitMO";
    v44 = (uint8_t *)&v49;
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, v43, v44, 2u);
    goto LABEL_11;
  }
  uint64_t v5 = [v3 identifier];

  if (!v5)
  {
    v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v43 = "Invalid parameter not satisfying: learnedLocationOfInterestVisitMO.identifier";
    v44 = buf;
    goto LABEL_16;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F5CE00]);
  v7 = [v4 locationLatitude];
  [v7 doubleValue];
  double v9 = v8;
  double v10 = [v4 locationLongitude];
  [v10 doubleValue];
  double v12 = v11;
  double v13 = [v4 locationHorizontalUncertainty];
  [v13 doubleValue];
  double v15 = v14;
  double v16 = [v4 locationAltitude];
  [v16 doubleValue];
  double v18 = v17;
  double v19 = [v4 locationVerticalUncertainty];
  [v19 doubleValue];
  double v21 = v20;
  double v22 = [v4 locationReferenceFrame];
  uint64_t v23 = [v22 intValue];
  uint64_t v24 = [v4 locationSourceAccuracy];
  uint64_t v25 = [v6 initWithLatitude:0 longitude:v23 horizontalUncertainty:(int)[v24 intValue] altitude:v9 verticalUncertainty:v12 date:v15 referenceFrame:v21 speed:0.0 sourceAccuracy:0.0];

  v26 = [RTLearnedLocation alloc];
  v27 = [v4 dataPointCount];
  uint64_t v28 = [v27 unsignedIntegerValue];
  v29 = [v4 confidence];
  [v29 doubleValue];
  v46 = (void *)v25;
  v47 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v26, "initWithLocation:dataPointCount:confidence:", v25, v28);

  v30 = [RTLearnedVisit alloc];
  v31 = [v4 identifier];
  v32 = [v4 entryDate];
  v33 = [v4 exitDate];
  v34 = [v4 creationDate];
  v35 = v34;
  if (!v34)
  {
    v35 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  v36 = [v4 expirationDate];
  v37 = [v4 locationOfInterestConfidence];
  [v37 doubleValue];
  double v39 = v38;
  v40 = [v4 locationOfInterestSource];
  v41 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v30, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v31, v47, v32, v33, v35, v36, v39, [v40 unsignedIntegerValue]);

  if (!v34) {
LABEL_12:
  }

  return v41;
}

- (id)managedObjectWithContext:(id)a3
{
  if (a3)
  {
    id v3 = +[RTLearnedVisitMO managedObjectWithVisit:self inManagedObjectContext:a3];
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
  id v5 = +[RTLearnedVisitMO managedObjectWithVisit:self finerGranularityInferredMapItem:0 place:0 managedObject:v6 inManagedObjectContext:v4];
}

- (RTLearnedVisit)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_location_entryDate_exitDate_creationDate_expirationDate_placeConfidence_placeSource_);
}

- (RTLearnedVisit)initWithIdentifier:(id)a3 location:(id)a4 entryDate:(id)a5 exitDate:(id)a6 creationDate:(id)a7 expirationDate:(id)a8
{
  return [(RTLearnedVisit *)self initWithIdentifier:a3 location:a4 entryDate:a5 exitDate:a6 creationDate:a7 expirationDate:a8 placeConfidence:0.0 placeSource:0];
}

- (RTLearnedVisit)initWithIdentifier:(id)a3 location:(id)a4 entryDate:(id)a5 exitDate:(id)a6 creationDate:(id)a7 expirationDate:(id)a8 placeConfidence:(double)a9 placeSource:(unint64_t)a10
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
      __int16 v49 = 1024;
      LODWORD(v50) = 53;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (v18)
    {
LABEL_3:
      if (v19) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
    __int16 v49 = 1024;
    LODWORD(v50) = 54;
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", buf, 0x12u);
  }

  if (v19)
  {
LABEL_4:
    if (v20) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
    __int16 v49 = 1024;
    LODWORD(v50) = 55;
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entryDate (in %s:%d)", buf, 0x12u);
  }

  if (v20)
  {
LABEL_5:
    if (v21) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_17:
  v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
    __int16 v49 = 1024;
    LODWORD(v50) = 56;
    _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: exitDate (in %s:%d)", buf, 0x12u);
  }

  if (v21)
  {
LABEL_6:
    if (v22) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
LABEL_20:
  v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
    __int16 v49 = 1024;
    LODWORD(v50) = 57;
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationDate (in %s:%d)", buf, 0x12u);
  }

  if (!v22)
  {
LABEL_23:
    uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
      __int16 v49 = 1024;
      LODWORD(v50) = 58;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_26:
  if (a9 < 0.0 || a9 > 1.0)
  {
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
      __int16 v49 = 1024;
      LODWORD(v50) = 60;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: kRTLearnedVisitPlaceConfidenceMin <= placeConfidence && placeConfidence <= kRTLearnedVisitPlaceConfidenceMax (in %s:%d)", buf, 0x12u);
    }
  }
  v30 = 0;
  if (v17 && v18 && v19 && v20 && v21 && v22)
  {
    if ([v19 compare:v20] == 1)
    {
      v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v44 = [v19 stringFromDate];
        v45 = [v20 stringFromDate];
        *(_DWORD *)buf = 138413058;
        v48 = v44;
        __int16 v49 = 2112;
        __int16 v51 = 2080;
        __int16 v50 = v45;
        v52 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
        __int16 v53 = 1024;
        int v54 = 75;
        _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "entry, %@, postdates exit, %@ (in %s:%d)", buf, 0x26u);
      }
      v30 = 0;
    }
    else
    {
      v30 = 0;
      if (a9 >= 0.0 && a9 <= 1.0)
      {
        v46.receiver = self;
        v46.super_class = (Class)RTLearnedVisit;
        v32 = [(RTLearnedVisit *)&v46 init];
        if (v32)
        {
          uint64_t v33 = [v17 copy];
          identifier = v32->_identifier;
          v32->_identifier = (NSUUID *)v33;

          objc_storeStrong((id *)&v32->_location, a4);
          uint64_t v35 = [v19 copy];
          entryDate = v32->_entryDate;
          v32->_entryDate = (NSDate *)v35;

          uint64_t v37 = [v20 copy];
          exitDate = v32->_exitDate;
          v32->_exitDate = (NSDate *)v37;

          uint64_t v39 = [v21 copy];
          creationDate = v32->_creationDate;
          v32->_creationDate = (NSDate *)v39;

          uint64_t v41 = [v22 copy];
          expirationDate = v32->_expirationDate;
          v32->_expirationDate = (NSDate *)v41;

          v32->_placeConfidence = a9;
          v32->_placeSource = a10;
        }
        self = v32;
        v30 = self;
      }
    }
  }

  return v30;
}

- (double)duration
{
  [(NSDate *)self->_exitDate timeIntervalSinceDate:self->_entryDate];
  return result;
}

- (NSString)description
{
  id v17 = NSString;
  id v19 = [(RTLearnedVisit *)self identifier];
  double v15 = [v19 UUIDString];
  id v3 = [(RTLearnedVisit *)self location];
  id v18 = [(RTLearnedVisit *)self entryDate];
  id v4 = [v18 stringFromDate];
  double v16 = [(RTLearnedVisit *)self exitDate];
  id v5 = [v16 stringFromDate];
  id v6 = [(RTLearnedVisit *)self creationDate];
  v7 = [v6 stringFromDate];
  double v8 = [(RTLearnedVisit *)self expirationDate];
  double v9 = [v8 stringFromDate];
  [(RTLearnedVisit *)self placeConfidence];
  uint64_t v11 = v10;
  double v12 = [[MEMORY[0x1E4F5CE38] sourceToString:-[RTLearnedVisit placeSource](self, "placeSource")];
  double v13 = [v17 stringWithFormat:@"identifier, %@, location, %@, entryDate, %@, exitDate, %@, creationDate, %@, expirationDate, %@, placeConfidence, %.3f, placeSource, %@", v15, v3, v4, v5, v7, v9, v11, v12];

  return (NSString *)v13;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (RTLearnedVisit *)a3;
  v7 = v6;
  if (v6 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v8 = v7;
        double v9 = [(RTLearnedVisit *)self identifier];
        if (v9
          || ([(RTLearnedVisit *)v8 identifier], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v4 = [(RTLearnedVisit *)self identifier];
          uint64_t v10 = [(RTLearnedVisit *)v8 identifier];
          char v11 = [v4 isEqual:v10];

          if (v9)
          {
LABEL_12:

            double v13 = [(RTLearnedVisit *)self expirationDate];
            if (v13
              || ([(RTLearnedVisit *)v8 expirationDate],
                  (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              double v14 = [(RTLearnedVisit *)self expirationDate];
              double v15 = [(RTLearnedVisit *)v8 expirationDate];
              char v16 = [v14 isEqual:v15];

              if (v13)
              {
LABEL_18:

                id v17 = [(RTLearnedVisit *)self creationDate];
                if (v17
                  || ([(RTLearnedVisit *)v8 creationDate],
                      (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  id v18 = [(RTLearnedVisit *)self creationDate];
                  id v19 = [(RTLearnedVisit *)v8 creationDate];
                  char v20 = [v18 isEqual:v19];

                  if (v17)
                  {
LABEL_24:

                    char v12 = v11 & v16 & v20;
                    goto LABEL_25;
                  }
                }
                else
                {
                  char v20 = 1;
                }

                goto LABEL_24;
              }
            }
            else
            {
              char v16 = 1;
            }

            goto LABEL_18;
          }
        }
        else
        {
          char v11 = 1;
        }

        goto LABEL_12;
      }
    }
    char v12 = 0;
  }
LABEL_25:

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(RTLearnedVisit *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(RTLearnedVisit *)self expirationDate];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RTLearnedVisit *)self creationDate];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (RTLearnedLocation)location
{
  return self->_location;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (NSDate)exitDate
{
  return self->_exitDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (double)placeConfidence
{
  return self->_placeConfidence;
}

- (void)setPlaceConfidence:(double)a3
{
  self->_placeConfidence = a3;
}

- (unint64_t)placeSource
{
  return self->_placeSource;
}

- (void)setPlaceSource:(unint64_t)a3
{
  self->_placeSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_exitDate, 0);
  objc_storeStrong((id *)&self->_entryDate, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end