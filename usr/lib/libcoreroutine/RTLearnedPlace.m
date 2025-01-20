@interface RTLearnedPlace
+ (BOOL)isTypeSourceValid:(unint64_t)a3;
+ (BOOL)learnedPlaceTypeIsValid:(unint64_t)a3;
+ (id)createWithLearnedLocationOfInterestMO:(id)a3;
+ (id)createWithLearnedPlaceMO:(id)a3;
+ (id)createWithManagedObject:(id)a3;
+ (id)placeTypeSourceToString:(unint64_t)a3;
+ (id)placeTypeToString:(unint64_t)a3;
+ (unint64_t)placeTypeFromLocationOfInterestType:(int64_t)a3;
+ (unint64_t)placeTypeFromType:(int64_t)a3;
+ (unint64_t)placeTypeSourceFromTypeSource:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSString)customLabel;
- (NSString)description;
- (NSUUID)identifier;
- (RTLearnedPlace)init;
- (RTLearnedPlace)initWithIdentifier:(id)a3 type:(unint64_t)a4 typeSource:(unint64_t)a5 mapItem:(id)a6 customLabel:(id)a7 creationDate:(id)a8 expirationDate:(id)a9;
- (RTMapItem)mapItem;
- (id)managedObjectWithContext:(id)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (unint64_t)typeSource;
- (void)updateManagedObject:(id)a3;
@end

@implementation RTLearnedPlace

+ (id)placeTypeToString:(unint64_t)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_1E6B98728[a3];
  }
}

+ (unint64_t)placeTypeFromType:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
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
      uint64_t v4 = [(id)objc_opt_class() createWithLearnedPlaceMO:v3];
LABEL_6:
      v5 = (void *)v4;
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [(id)objc_opt_class() createWithLearnedLocationOfInterestMO:v3];
      goto LABEL_6;
    }
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412802;
      id v9 = v3;
      __int16 v10 = 2080;
      v11 = "+[RTLearnedPlace(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v12 = 1024;
      int v13 = 36;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLearnedPlace+CoreDataTransformable (in %s:%d)", (uint8_t *)&v8, 0x1Cu);
    }
  }
  v5 = 0;
LABEL_11:

  return v5;
}

+ (id)createWithLearnedPlaceMO:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v25 = 0;
    v19 = "Invalid parameter not satisfying: learnedPlaceMO";
    v20 = (uint8_t *)&v25;
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
    v19 = "Invalid parameter not satisfying: learnedPlaceMO.identifier";
    v20 = buf;
    goto LABEL_20;
  }
  v6 = [v4 managedObjectContext];
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

    v18 = 0;
    goto LABEL_16;
  }
LABEL_7:
  v22 = [RTLearnedPlace alloc];
  v23 = [v4 identifier];
  id v9 = [v4 type];
  uint64_t v10 = [v9 unsignedIntegerValue];
  v11 = [v4 typeSource];
  uint64_t v12 = [v11 unsignedIntegerValue];
  int v13 = [MEMORY[0x1E4F5CE38] createWithManagedObject:v4];
  uint64_t v14 = [v4 customLabel];
  v15 = [v4 creationDate];
  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  v17 = [v4 expirationDate];
  v18 = [(RTLearnedPlace *)v22 initWithIdentifier:v23 type:v10 typeSource:v12 mapItem:v13 customLabel:v14 creationDate:v16 expirationDate:v17];

  if (!v15) {
LABEL_16:
  }

  return v18;
}

+ (id)createWithLearnedLocationOfInterestMO:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v26 = 0;
    v20 = "Invalid parameter not satisfying: learnedLocationOfInterestMO";
    v21 = (uint8_t *)&v26;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, v20, v21, 2u);
    goto LABEL_7;
  }
  v5 = [v3 placeIdentifier];

  if (v5)
  {
    v6 = [RTLearnedPlace alloc];
    uint64_t v7 = [v4 placeIdentifier];
    v24 = [v4 placeType];
    uint64_t v23 = [v24 unsignedIntegerValue];
    int v8 = [v4 placeTypeSource];
    uint64_t v9 = [v8 unsignedIntegerValue];
    uint64_t v10 = (void *)MEMORY[0x1E4F5CE38];
    v11 = [v4 mapItem];
    uint64_t v12 = [v10 createWithManagedObject:v11];
    int v13 = [v4 placeCustomLabel];
    uint64_t v14 = [v4 placeCreationDate];
    v15 = [v4 placeExpirationDate];
    v16 = v6;
    v17 = (void *)v7;
    v18 = [(RTLearnedPlace *)v16 initWithIdentifier:v7 type:v23 typeSource:v9 mapItem:v12 customLabel:v13 creationDate:v14 expirationDate:v15];

    goto LABEL_8;
  }
  v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: learnedLocationOfInterestMO.placeIdentifier";
    v21 = buf;
    goto LABEL_12;
  }
LABEL_7:

  v18 = 0;
LABEL_8:

  return v18;
}

- (id)managedObjectWithContext:(id)a3
{
  if (a3)
  {
    id v3 = +[RTLearnedPlaceMO managedObjectWithPlace:self inManagedObjectContext:a3];
  }
  else
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
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
  id v5 = +[RTLearnedPlaceMO managedObjectWithPlace:self managedObject:v6 inManagedObjectContext:v4];
}

+ (unint64_t)placeTypeSourceFromTypeSource:(unint64_t)a3
{
  return (a3 >> 2) & 0xC | (2 * (a3 & 1)) | ((a3 & 0xE) != 0);
}

+ (BOOL)learnedPlaceTypeIsValid:(unint64_t)a3
{
  return a3 < 5;
}

+ (BOOL)isTypeSourceValid:(unint64_t)a3
{
  return a3 < 0x10;
}

+ (id)placeTypeSourceToString:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v5 = +[RTLearnedPlace isTypeSourceValid:](RTLearnedPlace, "isTypeSourceValid:");
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      int v13 = 138413058;
      uint64_t v14 = v12;
      __int16 v15 = 2048;
      __int16 v17 = 2080;
      unint64_t v16 = a3;
      v18 = "+[RTLearnedPlace placeTypeSourceToString:]";
      __int16 v19 = 1024;
      int v20 = 67;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@ does not handle RTLearnedPlaceTypeSource, %lu (in %s:%d)", (uint8_t *)&v13, 0x26u);
    }
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  int v8 = v7;
  if (!a3)
  {
    uint64_t v10 = @"Unknown";
    goto LABEL_17;
  }
  if (a3)
  {
    [v7 addObject:@"Inferred"];
    if ((a3 & 2) == 0)
    {
LABEL_8:
      if ((a3 & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_15;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_8;
  }
  [v8 addObject:@"MeCard"];
  if ((a3 & 4) == 0)
  {
LABEL_9:
    if ((a3 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v8 addObject:@"User"];
  if ((a3 & 8) != 0)
  {
LABEL_16:
    uint64_t v10 = @"Fallback";
LABEL_17:
    [v8 addObject:v10];
    if (v5) {
      goto LABEL_11;
    }
    goto LABEL_18;
  }
LABEL_10:
  if (v5)
  {
LABEL_11:
    uint64_t v9 = [v8 componentsJoinedByString:@", "];
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
LABEL_19:

  return v9;
}

+ (unint64_t)placeTypeFromLocationOfInterestType:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (RTLearnedPlace)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_type_typeSource_mapItem_customLabel_creationDate_expirationDate_);
}

- (RTLearnedPlace)initWithIdentifier:(id)a3 type:(unint64_t)a4 typeSource:(unint64_t)a5 mapItem:(id)a6 customLabel:(id)a7 creationDate:(id)a8 expirationDate:(id)a9
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (v15)
  {
    if (v18) {
      goto LABEL_3;
    }
LABEL_12:
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:]";
      __int16 v37 = 1024;
      int v38 = 121;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationDate (in %s:%d)", buf, 0x12u);
    }

    if (v19) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:]";
    __int16 v37 = 1024;
    int v38 = 120;
    _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
  }

  if (!v18) {
    goto LABEL_12;
  }
LABEL_3:
  if (v19)
  {
LABEL_4:
    int v20 = 0;
    if (v15 && v18)
    {
      v34.receiver = self;
      v34.super_class = (Class)RTLearnedPlace;
      uint64_t v21 = [(RTLearnedPlace *)&v34 init];
      if (v21)
      {
        uint64_t v22 = [v15 copy];
        identifier = v21->_identifier;
        v21->_identifier = (NSUUID *)v22;

        v21->_type = a4;
        v21->_typeSource = a5;
        objc_storeStrong((id *)&v21->_mapItem, a6);
        uint64_t v24 = [v17 copy];
        customLabel = v21->_customLabel;
        v21->_customLabel = (NSString *)v24;

        uint64_t v26 = [v18 copy];
        creationDate = v21->_creationDate;
        v21->_creationDate = (NSDate *)v26;

        uint64_t v28 = [v19 copy];
        expirationDate = v21->_expirationDate;
        v21->_expirationDate = (NSDate *)v28;
      }
      self = v21;
      int v20 = self;
    }
    goto LABEL_18;
  }
LABEL_15:
  v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:]";
    __int16 v37 = 1024;
    int v38 = 122;
    _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate (in %s:%d)", buf, 0x12u);
  }

  int v20 = 0;
LABEL_18:

  return v20;
}

- (NSString)description
{
  id v3 = NSString;
  id v15 = [(RTLearnedPlace *)self identifier];
  uint64_t v4 = [v15 UUIDString];
  BOOL v5 = [[objc_opt_class() placeTypeToString:-[RTLearnedPlace type](self, "type")]
  id v6 = [objc_opt_class() placeTypeSourceToString:-[RTLearnedPlace typeSource](self, "typeSource")];
  uint64_t v7 = [(RTLearnedPlace *)self mapItem];
  int v8 = [(RTLearnedPlace *)self customLabel];
  uint64_t v9 = [(RTLearnedPlace *)self creationDate];
  uint64_t v10 = [v9 stringFromDate];
  v11 = [(RTLearnedPlace *)self expirationDate];
  uint64_t v12 = [v11 stringFromDate];
  int v13 = [v3 stringWithFormat:@"identifier, %@, type, %@, typeSource, %@, mapItem, %@, customLabel, %@, creationDate, %@, expirationDate, %@", v4, v5, v6, v7, v8, v10, v12];

  return (NSString *)v13;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (RTLearnedPlace *)a3;
  uint64_t v7 = v6;
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
        int v8 = v7;
        uint64_t v9 = [(RTLearnedPlace *)self identifier];
        if (v9
          || ([(RTLearnedPlace *)v8 identifier], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v4 = [(RTLearnedPlace *)self identifier];
          uint64_t v10 = [(RTLearnedPlace *)v8 identifier];
          char v11 = [v4 isEqual:v10];

          if (v9)
          {
LABEL_12:

            int v13 = [(RTLearnedPlace *)self expirationDate];
            if (v13
              || ([(RTLearnedPlace *)v8 expirationDate],
                  (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              uint64_t v14 = [(RTLearnedPlace *)self expirationDate];
              id v15 = [(RTLearnedPlace *)v8 expirationDate];
              char v16 = [v14 isEqual:v15];

              if (v13)
              {
LABEL_18:

                id v17 = [(RTLearnedPlace *)self creationDate];
                if (v17
                  || ([(RTLearnedPlace *)v8 creationDate],
                      (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  id v18 = [(RTLearnedPlace *)self creationDate];
                  id v19 = [(RTLearnedPlace *)v8 creationDate];
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
  id v3 = [(RTLearnedPlace *)self identifier];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(RTLearnedPlace *)self expirationDate];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(RTLearnedPlace *)self creationDate];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)typeSource
{
  return self->_typeSource;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (NSString)customLabel
{
  return self->_customLabel;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_customLabel, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end