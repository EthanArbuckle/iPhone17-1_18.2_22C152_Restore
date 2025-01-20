@interface RTLearnedPlaceTypeInference
+ (BOOL)supportsSecureCoding;
+ (id)createWithLearnedPlaceTypeInferenceMO:(id)a3;
+ (id)createWithManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSString)description;
- (NSUUID)identifier;
- (NSUUID)learnedPlaceIdentifier;
- (NSUUID)sessionId;
- (RTLearnedPlaceTypeInference)init;
- (RTLearnedPlaceTypeInference)initWithCoder:(id)a3;
- (RTLearnedPlaceTypeInference)initWithIdentifier:(id)a3 sessionId:(id)a4 learnedPlaceIdentifier:(id)a5 placeType:(unint64_t)a6 metricSource:(unint64_t)a7 creationDate:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)managedObjectWithContext:(id)a3;
- (unint64_t)hash;
- (unint64_t)metricSource;
- (unint64_t)placeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTLearnedPlaceTypeInference

- (RTLearnedPlaceTypeInference)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_sessionId_learnedPlaceIdentifier_placeType_metricSource_creationDate_);
}

- (RTLearnedPlaceTypeInference)initWithIdentifier:(id)a3 sessionId:(id)a4 learnedPlaceIdentifier:(id)a5 placeType:(unint64_t)a6 metricSource:(unint64_t)a7 creationDate:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v27 = a5;
  id v17 = a8;
  v18 = v17;
  if (!v15)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v21 = 0;
LABEL_11:
      v24 = v27;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: identifier";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_10;
  }
  if (!v16)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: sessionId";
    goto LABEL_17;
  }
  if (v17)
  {
    v28.receiver = self;
    v28.super_class = (Class)RTLearnedPlaceTypeInference;
    v19 = [(RTLearnedPlaceTypeInference *)&v28 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_identifier, a3);
      objc_storeStrong((id *)&v20->_sessionId, a4);
      objc_storeStrong((id *)&v20->_learnedPlaceIdentifier, a5);
      v20->_placeType = a6;
      v20->_metricSource = a7;
      objc_storeStrong((id *)&v20->_creationDate, a8);
    }
    self = v20;
    v21 = self;
    goto LABEL_11;
  }
  v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v24 = v27;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationDate", buf, 2u);
  }

  v21 = 0;
LABEL_12:

  return v21;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(RTLearnedPlaceTypeInference *)self identifier];
  v5 = [(RTLearnedPlaceTypeInference *)self sessionId];
  v6 = [(RTLearnedPlaceTypeInference *)self learnedPlaceIdentifier];
  v7 = +[RTLearnedPlace placeTypeToString:[(RTLearnedPlaceTypeInference *)self placeType]];
  v8 = +[RTPlaceTypeClassifierMetricsCalculator metricsSourceToString:[(RTLearnedPlaceTypeInference *)self metricSource]];
  v9 = [(RTLearnedPlaceTypeInference *)self creationDate];
  v10 = [v9 stringFromDate];
  v11 = [v3 stringWithFormat:@"identifier, %@, sessionId, %@, learnedPlaceIdentifier, %@, placeType, %@, metricSource, %@, creationDate, %@,", v4, v5, v6, v7, v8, v10];

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTLearnedPlaceTypeInference *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(RTLearnedPlaceTypeInference *)self identifier];
    v8 = [(RTLearnedPlaceTypeInference *)v6 identifier];
    if ([v7 isEqual:v8])
    {
      v9 = [(RTLearnedPlaceTypeInference *)self sessionId];
      v10 = [(RTLearnedPlaceTypeInference *)v6 sessionId];
      if ([v9 isEqual:v10])
      {
        v11 = [(RTLearnedPlaceTypeInference *)self learnedPlaceIdentifier];
        v12 = [(RTLearnedPlaceTypeInference *)v6 learnedPlaceIdentifier];
        if ([v11 isEqual:v12]
          && (unint64_t v13 = [(RTLearnedPlaceTypeInference *)self placeType],
              v13 == [(RTLearnedPlaceTypeInference *)v6 placeType])
          && (unint64_t v14 = [(RTLearnedPlaceTypeInference *)self metricSource],
              v14 == [(RTLearnedPlaceTypeInference *)v6 metricSource]))
        {
          v18 = [(RTLearnedPlaceTypeInference *)self creationDate];
          id v15 = [(RTLearnedPlaceTypeInference *)v6 creationDate];
          char v16 = [v18 isEqualToDate:v15];
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  v3 = [(RTLearnedPlaceTypeInference *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(RTLearnedPlaceTypeInference *)self sessionId];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RTLearnedPlaceTypeInference *)self learnedPlaceIdentifier];
  uint64_t v8 = v6 ^ [v7 hash];
  v9 = [NSNumber numberWithUnsignedInteger:-[RTLearnedPlaceTypeInference placeType](self, "placeType")];
  uint64_t v10 = v8 ^ [v9 hash];
  v11 = [NSNumber numberWithUnsignedInteger:-[RTLearnedPlaceTypeInference metricSource](self, "metricSource")];
  uint64_t v12 = [v11 hash];
  unint64_t v13 = [(RTLearnedPlaceTypeInference *)self creationDate];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTLearnedPlaceTypeInference)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SessionId"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LearnedPlaceIdentifier"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"PlaceType"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"MetricSource"];
  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];

  v11 = [(RTLearnedPlaceTypeInference *)self initWithIdentifier:v5 sessionId:v6 learnedPlaceIdentifier:v7 placeType:v8 metricSource:v9 creationDate:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"Identifier"];
  [v5 encodeObject:self->_sessionId forKey:@"SessionId"];
  [v5 encodeObject:self->_learnedPlaceIdentifier forKey:@"LearnedPlaceIdentifier"];
  [v5 encodeInteger:self->_metricSource forKey:@"MetricSource"];
  [v5 encodeInteger:self->_placeType forKey:@"PlaceType"];
  [v5 encodeObject:self->_creationDate forKey:@"CreationDate"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  sessionId = self->_sessionId;
  learnedPlaceIdentifier = self->_learnedPlaceIdentifier;
  unint64_t placeType = self->_placeType;
  unint64_t metricSource = self->_metricSource;
  creationDate = self->_creationDate;

  return (id)[v4 initWithIdentifier:identifier sessionId:sessionId learnedPlaceIdentifier:learnedPlaceIdentifier placeType:placeType metricSource:metricSource creationDate:creationDate];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (NSUUID)learnedPlaceIdentifier
{
  return self->_learnedPlaceIdentifier;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (unint64_t)metricSource
{
  return self->_metricSource;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_learnedPlaceIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)createWithManagedObject:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [(id)objc_opt_class() createWithLearnedPlaceTypeInferenceMO:v3];
      goto LABEL_8;
    }
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2080;
      uint64_t v10 = "+[RTLearnedPlaceTypeInference(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v11 = 1024;
      int v12 = 34;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLearnedPlaceTypeInferenceMO+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }
  }
  id v4 = 0;
LABEL_8:

  return v4;
}

+ (id)createWithLearnedPlaceTypeInferenceMO:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    *(void *)buf = 0;
    uint64_t v13 = buf;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__128;
    char v16 = __Block_byref_object_dispose__128;
    id v17 = 0;
    id v5 = [v3 managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __94__RTLearnedPlaceTypeInference_RTCoreDataTransformable__createWithLearnedPlaceTypeInferenceMO___block_invoke;
    v9[3] = &unk_1E6B93860;
    __int16 v11 = buf;
    id v10 = v4;
    [v5 performBlockAndWait:v9];

    id v6 = *((id *)v13 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedPlaceTypeInferenceMO", buf, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

void __94__RTLearnedPlaceTypeInference_RTCoreDataTransformable__createWithLearnedPlaceTypeInferenceMO___block_invoke(uint64_t a1)
{
  uint64_t v2 = [RTLearnedPlaceTypeInference alloc];
  id v11 = [*(id *)(a1 + 32) identifier];
  id v3 = [*(id *)(a1 + 32) sessionId];
  id v4 = [*(id *)(a1 + 32) learnedPlaceIdentifier];
  uint64_t v5 = (int)[*(id *)(a1 + 32) placeType];
  uint64_t v6 = (int)[*(id *)(a1 + 32) metricSource];
  int v7 = [*(id *)(a1 + 32) creationDate];
  uint64_t v8 = [(RTLearnedPlaceTypeInference *)v2 initWithIdentifier:v11 sessionId:v3 learnedPlaceIdentifier:v4 placeType:v5 metricSource:v6 creationDate:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)managedObjectWithContext:(id)a3
{
  if (a3)
  {
    id v3 = +[RTLearnedPlaceTypeInferenceMO initWithLearnedPlaceTypeInference:self managedObjectContext:a3];
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

@end