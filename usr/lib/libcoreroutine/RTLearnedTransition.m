@interface RTLearnedTransition
+ (id)createWithLearnedLocationOfInterestTransitionMO:(id)a3;
+ (id)createWithLearnedTransitionMO:(id)a3;
+ (id)createWithManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSDate)startDate;
- (NSDate)stopDate;
- (NSString)description;
- (NSUUID)identifier;
- (NSUUID)visitIdentifierDestination;
- (NSUUID)visitIdentifierOrigin;
- (RTLearnedTransition)init;
- (RTLearnedTransition)initWithIdentifier:(id)a3 startDate:(id)a4 stopDate:(id)a5 visitIdentifierOrigin:(id)a6 visitIdentifierDestination:(id)a7 creationDate:(id)a8 expirationDate:(id)a9 predominantMotionActivityType:(unint64_t)a10;
- (id)managedObjectWithContext:(id)a3;
- (unint64_t)hash;
- (unint64_t)predominantMotionActivityType;
- (void)setPredominantMotionActivityType:(unint64_t)a3;
- (void)updateManagedObject:(id)a3;
@end

@implementation RTLearnedTransition

- (RTLearnedTransition)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_startDate_stopDate_visitIdentifierOrigin_visitIdentifierDestination_creationDate_expirationDate_predominantMotionActivityType_);
}

- (RTLearnedTransition)initWithIdentifier:(id)a3 startDate:(id)a4 stopDate:(id)a5 visitIdentifierOrigin:(id)a6 visitIdentifierDestination:(id)a7 creationDate:(id)a8 expirationDate:(id)a9 predominantMotionActivityType:(unint64_t)a10
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination"
            ":creationDate:expirationDate:predominantMotionActivityType:]";
      __int16 v53 = 1024;
      LODWORD(v54) = 34;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (v17)
    {
LABEL_3:
      if (v18) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:c"
          "reationDate:expirationDate:predominantMotionActivityType:]";
    __int16 v53 = 1024;
    LODWORD(v54) = 35;
    _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
  }

  if (v18)
  {
LABEL_4:
    if (v19) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_23:
  v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:c"
          "reationDate:expirationDate:predominantMotionActivityType:]";
    __int16 v53 = 1024;
    LODWORD(v54) = 36;
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: stopDate (in %s:%d)", buf, 0x12u);
  }

  if (v19)
  {
LABEL_5:
    if (v20) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_26:
  v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:c"
          "reationDate:expirationDate:predominantMotionActivityType:]";
    __int16 v53 = 1024;
    LODWORD(v54) = 37;
    _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifierOrigin (in %s:%d)", buf, 0x12u);
  }

  if (v20)
  {
LABEL_6:
    if (v21) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_29:
  v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:c"
          "reationDate:expirationDate:predominantMotionActivityType:]";
    __int16 v53 = 1024;
    LODWORD(v54) = 38;
    _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifierDestination (in %s:%d)", buf, 0x12u);
  }

  if (v21)
  {
LABEL_7:
    if (v22) {
      goto LABEL_8;
    }
LABEL_35:
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination"
            ":creationDate:expirationDate:predominantMotionActivityType:]";
      __int16 v53 = 1024;
      LODWORD(v54) = 40;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_37;
  }
LABEL_32:
  v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:c"
          "reationDate:expirationDate:predominantMotionActivityType:]";
    __int16 v53 = 1024;
    LODWORD(v54) = 39;
    _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationDate (in %s:%d)", buf, 0x12u);
  }

  if (!v22) {
    goto LABEL_35;
  }
LABEL_8:
  v23 = 0;
  if (v16 && v17 && v18 && v19 && v20 && v21)
  {
    if ([v17 compare:v18] == 1)
    {
      v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v49 = [v17 stringFromDate];
        uint64_t v25 = [v18 stringFromDate];
        *(_DWORD *)buf = 138413058;
        v52 = v49;
        __int16 v53 = 2112;
        __int16 v55 = 2080;
        uint64_t v54 = v25;
        v26 = (void *)v25;
        v56 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestinati"
              "on:creationDate:expirationDate:predominantMotionActivityType:]";
        __int16 v57 = 1024;
        int v58 = 56;
        _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "start, %@, postdates stop, %@ (in %s:%d)", buf, 0x26u);
      }
LABEL_37:

      v23 = 0;
      goto LABEL_41;
    }
    v50.receiver = self;
    v50.super_class = (Class)RTLearnedTransition;
    v33 = [(RTLearnedTransition *)&v50 init];
    if (v33)
    {
      uint64_t v34 = [v16 copy];
      identifier = v33->_identifier;
      v33->_identifier = (NSUUID *)v34;

      uint64_t v36 = [v17 copy];
      startDate = v33->_startDate;
      v33->_startDate = (NSDate *)v36;

      uint64_t v38 = [v18 copy];
      stopDate = v33->_stopDate;
      v33->_stopDate = (NSDate *)v38;

      uint64_t v40 = [v19 copy];
      visitIdentifierOrigin = v33->_visitIdentifierOrigin;
      v33->_visitIdentifierOrigin = (NSUUID *)v40;

      uint64_t v42 = [v20 copy];
      visitIdentifierDestination = v33->_visitIdentifierDestination;
      v33->_visitIdentifierDestination = (NSUUID *)v42;

      uint64_t v44 = [v21 copy];
      creationDate = v33->_creationDate;
      v33->_creationDate = (NSDate *)v44;

      uint64_t v46 = [v22 copy];
      expirationDate = v33->_expirationDate;
      v33->_expirationDate = (NSDate *)v46;

      v33->_predominantMotionActivityType = a10;
    }
    self = v33;
    v23 = self;
  }
LABEL_41:

  return v23;
}

- (NSString)description
{
  id v15 = (id)NSString;
  id v20 = [(RTLearnedTransition *)self identifier];
  v14 = [v20 UUIDString];
  id v19 = [(RTLearnedTransition *)self startDate];
  v13 = [v19 stringFromDate];
  id v18 = [(RTLearnedTransition *)self stopDate];
  v12 = [v18 stringFromDate];
  id v17 = [(RTLearnedTransition *)self visitIdentifierOrigin];
  v3 = [v17 UUIDString];
  v4 = [(RTLearnedTransition *)self visitIdentifierDestination];
  v5 = [v4 UUIDString];
  v6 = [(RTLearnedTransition *)self creationDate];
  v7 = [v6 stringFromDate];
  v8 = [(RTLearnedTransition *)self expirationDate];
  v9 = [v8 stringFromDate];
  v10 = [MEMORY[0x1E4F5CE50] motionActivityTypeToString:-[RTLearnedTransition predominantMotionActivityType](self, "predominantMotionActivityType")];
  id v16 = [v15 stringWithFormat:@"identifier, %@, startDate, %@, stopDate, %@, visitIdentifierOrigin, %@, visitIdentifierDestination, %@, creationDate, %@, expirationDate, %@, predominantMotionActivityType, %@", v14, v13, v12, v3, v5, v7, v9, v10];

  return (NSString *)v16;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (RTLearnedTransition *)a3;
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
        v8 = v7;
        v9 = [(RTLearnedTransition *)self identifier];
        if (v9
          || ([(RTLearnedTransition *)v8 identifier],
              (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v4 = [(RTLearnedTransition *)self identifier];
          v10 = [(RTLearnedTransition *)v8 identifier];
          char v11 = [v4 isEqual:v10];

          if (v9)
          {
LABEL_12:

            v13 = [(RTLearnedTransition *)self expirationDate];
            if (v13
              || ([(RTLearnedTransition *)v8 expirationDate],
                  (v4 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v14 = [(RTLearnedTransition *)self expirationDate];
              id v15 = [(RTLearnedTransition *)v8 expirationDate];
              char v16 = [v14 isEqual:v15];

              if (v13)
              {
LABEL_18:

                id v17 = [(RTLearnedTransition *)self creationDate];
                if (v17
                  || ([(RTLearnedTransition *)v8 creationDate],
                      (v4 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  id v18 = [(RTLearnedTransition *)self creationDate];
                  id v19 = [(RTLearnedTransition *)v8 creationDate];
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
  v3 = [(RTLearnedTransition *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(RTLearnedTransition *)self expirationDate];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RTLearnedTransition *)self creationDate];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)stopDate
{
  return self->_stopDate;
}

- (NSUUID)visitIdentifierOrigin
{
  return self->_visitIdentifierOrigin;
}

- (NSUUID)visitIdentifierDestination
{
  return self->_visitIdentifierDestination;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (unint64_t)predominantMotionActivityType
{
  return self->_predominantMotionActivityType;
}

- (void)setPredominantMotionActivityType:(unint64_t)a3
{
  self->_predominantMotionActivityType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_visitIdentifierDestination, 0);
  objc_storeStrong((id *)&self->_visitIdentifierOrigin, 0);
  objc_storeStrong((id *)&self->_stopDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)createWithManagedObject:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [(id)objc_opt_class() createWithLearnedTransitionMO:v3];
LABEL_6:
      v5 = (void *)v4;
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [(id)objc_opt_class() createWithLearnedLocationOfInterestTransitionMO:v3];
      goto LABEL_6;
    }
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412802;
      id v9 = v3;
      __int16 v10 = 2080;
      char v11 = "+[RTLearnedTransition(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v12 = 1024;
      int v13 = 39;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLearnedTransition+CoreDataTransformable (in %s:%d)", (uint8_t *)&v8, 0x1Cu);
    }
  }
  v5 = 0;
LABEL_11:

  return v5;
}

+ (id)createWithLearnedTransitionMO:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v26 = 0;
    id v19 = "Invalid parameter not satisfying: learnedTransitionMO";
    char v20 = (uint8_t *)&v26;
LABEL_20:
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_15;
  }
  v5 = [v3 identifier];

  if (!v5)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    id v19 = "Invalid parameter not satisfying: learnedTransitionMO.identifier";
    char v20 = buf;
    goto LABEL_20;
  }
  uint64_t v6 = [v4 managedObjectContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v8 = [v4 managedObjectContext];
    if ((-[NSObject allowTombstones](v8, "allowTombstones") & 1) != 0 || ([v4 flags] & 1) == 0)
    {

      goto LABEL_7;
    }
LABEL_15:

    id v18 = 0;
    goto LABEL_16;
  }
LABEL_7:
  id v9 = [RTLearnedTransition alloc];
  v24 = [v4 identifier];
  v23 = [v4 startDate];
  id v22 = [v4 stopDate];
  __int16 v10 = [v4 origin];
  char v11 = [v10 identifier];
  __int16 v12 = [v4 destination];
  int v13 = [v12 identifier];
  uint64_t v14 = [v4 creationDate];
  id v15 = v14;
  if (!v14)
  {
    id v15 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  char v16 = [v4 expirationDate];
  id v17 = [v4 predominantMotionActivityType];
  id v18 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v9, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v24, v23, v22, v11, v13, v15, v16, [v17 integerValue]);

  if (!v14) {
LABEL_16:
  }

  return v18;
}

+ (id)createWithLearnedLocationOfInterestTransitionMO:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    char v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v21 = 0;
    id v17 = "Invalid parameter not satisfying: learnedLocationOfInterestTransitionMO";
    id v18 = (uint8_t *)&v21;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    goto LABEL_7;
  }
  v5 = [v3 identifier];

  if (v5)
  {
    uint64_t v6 = [RTLearnedTransition alloc];
    v7 = [v4 identifier];
    int v8 = [v4 startDate];
    id v9 = [v4 stopDate];
    __int16 v10 = [v4 visitIdentifierOrigin];
    char v11 = [v4 visitIdentifierDestination];
    __int16 v12 = [v4 creationDate];
    int v13 = [v4 expirationDate];
    uint64_t v14 = [v4 predominantMotionActivityType];
    id v15 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v6, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v7, v8, v9, v10, v11, v12, v13, [v14 integerValue]);

    goto LABEL_8;
  }
  char v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    id v17 = "Invalid parameter not satisfying: learnedLocationOfInterestTransitionMO.identifier";
    id v18 = buf;
    goto LABEL_12;
  }
LABEL_7:

  id v15 = 0;
LABEL_8:

  return v15;
}

- (id)managedObjectWithContext:(id)a3
{
  if (a3)
  {
    id v3 = +[RTLearnedTransitionMO managedObjectWithTransition:self inManagedObjectContext:a3];
  }
  else
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

- (void)updateManagedObject:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 managedObjectContext];
  id v5 = +[RTLearnedTransitionMO managedObjectWithTransition:self managedObject:v6 inManagedObjectContext:v4];
}

@end