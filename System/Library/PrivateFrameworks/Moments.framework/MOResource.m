@interface MOResource
+ (BOOL)supportsSecureCoding;
+ (id)describeType:(unint64_t)a3;
+ (id)evergreenTypeStringFromEvergreenType:(unint64_t)a3;
+ (id)getDedupeKeyForResourceData:(id)a3 type:(unint64_t)a4 error:(id *)a5;
+ (id)getDictionaryForData:(id)a3 error:(id *)a4;
+ (id)getStringTypeForResources:(unint64_t)a3;
+ (unint64_t)evergreenTypeFromEvergreenTypeString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MOResource)initWithCoder:(id)a3;
- (MOResource)initWithEvergreenTypeName:(id)a3 promptIndex:(unint64_t)a4;
- (MOResource)initWithEvergreenTypeName:(id)a3 promptIndexes:(id)a4;
- (MOResource)initWithIdentifier:(id)a3;
- (MOResource)initWithIdentifier:(id)a3 name:(id)a4 type:(unint64_t)a5 assets:(id)a6 data:(id)a7 value:(double)a8 priorityScore:(double)a9 photoCurationScore:(id)a10 photoFaceCount:(unint64_t)a11 photoAssetMediaType:(unint64_t)a12;
- (MOResource)initWithName:(id)a3 mapItemHandle:(id)a4 priorityScore:(double)a5;
- (MOResource)initWithName:(id)a3 type:(unint64_t)a4;
- (MOResource)initWithName:(id)a3 type:(unint64_t)a4 assets:(id)a5;
- (MOResource)initWithName:(id)a3 type:(unint64_t)a4 dict:(id)a5 value:(double)a6;
- (MOResource)initWithName:(id)a3 value:(double)a4;
- (MOResource)initWithPerson:(id)a3;
- (MOResource)initWithPlace:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (MOResource)initWithWeather:(id)a3;
- (NSData)data;
- (NSDate)photoCreationDate;
- (NSNumber)photoCurationScore;
- (NSString)assets;
- (NSString)name;
- (NSUUID)identifier;
- (NSUUID)sourceEventIdentifier;
- (double)endDate;
- (double)priorityScore;
- (double)startDate;
- (double)value;
- (float)photoOverallAestheticScore;
- (id)bundleSourceType;
- (id)cityName;
- (id)describeType;
- (id)description;
- (id)enclosingArea;
- (id)getDedupeKeyError:(id *)a3;
- (id)getDictionary;
- (id)location;
- (id)metaData;
- (id)photoLocalDate;
- (id)poiCategory;
- (id)promptIndexes;
- (id)sourceAppBundleIds;
- (id)temperature;
- (id)weatherSummary;
- (id)weatherSymbolName;
- (id)windSpeed;
- (int64_t)sourceEventAccessType;
- (unint64_t)dataAccessTypeFromResourceType:(unint64_t)a3;
- (unint64_t)evergreenType;
- (unint64_t)hash;
- (unint64_t)photoAssetMediaType;
- (unint64_t)photoFaceCount;
- (unint64_t)placeType;
- (unint64_t)placeUserType;
- (unint64_t)promptCount;
- (unint64_t)promptIndex;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAssets:(id)a3;
- (void)setPhotoAssetMediaType:(unint64_t)a3;
- (void)setPhotoCreationDate:(id)a3;
- (void)setPhotoCurationScore:(id)a3;
- (void)setPhotoFaceCount:(unint64_t)a3;
- (void)setPhotoOverallAestheticScore:(float)a3;
- (void)setPriorityScore:(double)a3;
- (void)setSourceEventAccessType:(int64_t)a3;
- (void)setSourceEventIdentifier:(id)a3;
@end

@implementation MOResource

- (MOResource)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v6 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOResource initWithIdentifier:](v6);
    }

    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOResource.m", 29, @"Invalid parameter not satisfying: identifier (in %s:%d)", "-[MOResource initWithIdentifier:]", 29);
  }
  v8 = [(MOResource *)self initWithIdentifier:v5 name:@"Resource" type:0 assets:0 data:0 value:0 priorityScore:0.0 photoCurationScore:-1.0 photoFaceCount:0 photoAssetMediaType:0];

  return v8;
}

- (MOResource)initWithName:(id)a3 type:(unint64_t)a4 assets:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 UUID];
  v12 = [(MOResource *)self initWithIdentifier:v11 name:v10 type:a4 assets:v9 data:0 value:0 priorityScore:0.0 photoCurationScore:-1.0 photoFaceCount:0 photoAssetMediaType:0];

  return v12;
}

- (MOResource)initWithName:(id)a3 type:(unint64_t)a4
{
  v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a3;
  v8 = [v6 UUID];
  id v9 = [(MOResource *)self initWithIdentifier:v8 name:v7 type:a4 assets:0 data:0 value:0 priorityScore:0.0 photoCurationScore:-1.0 photoFaceCount:0 photoAssetMediaType:0];

  return v9;
}

- (MOResource)initWithName:(id)a3 value:(double)a4
{
  v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a3;
  v8 = [v6 UUID];
  id v9 = [(MOResource *)self initWithIdentifier:v8 name:v7 type:1 assets:0 data:0 value:0 priorityScore:a4 photoCurationScore:-1.0 photoFaceCount:0 photoAssetMediaType:0];

  return v9;
}

- (MOResource)initWithName:(id)a3 type:(unint64_t)a4 dict:(id)a5 value:(double)a6
{
  id v10 = a3;
  if (a5)
  {
    id v17 = 0;
    a5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a5 options:0 error:&v17];
    id v11 = v17;
    if (v11) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = a5 == 0;
    }
    if (v12)
    {
      v13 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[MOResource initWithName:type:dict:value:]((uint64_t)v11, v13);
      }
    }
  }
  v14 = [MEMORY[0x1E4F29128] UUID];
  v15 = [(MOResource *)self initWithIdentifier:v14 name:v10 type:a4 assets:0 data:a5 value:0 priorityScore:a6 photoCurationScore:-1.0 photoFaceCount:0 photoAssetMediaType:0];

  return v15;
}

- (MOResource)initWithIdentifier:(id)a3 name:(id)a4 type:(unint64_t)a5 assets:(id)a6 data:(id)a7 value:(double)a8 priorityScore:(double)a9 photoCurationScore:(id)a10 photoFaceCount:(unint64_t)a11 photoAssetMediaType:(unint64_t)a12
{
  id v21 = a3;
  id v22 = a4;
  id v28 = a6;
  id v27 = a7;
  id v23 = a10;
  v29.receiver = self;
  v29.super_class = (Class)MOResource;
  v24 = [(MOResource *)&v29 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_identifier, a3);
    objc_storeStrong((id *)&v25->_name, a4);
    v25->_type = a5;
    objc_storeStrong((id *)&v25->_assets, a6);
    objc_storeStrong((id *)&v25->_data, a7);
    v25->_value = a8;
    v25->_priorityScore = a9;
    objc_storeStrong((id *)&v25->_photoCurationScore, a10);
    v25->_photoFaceCount = a11;
    v25->_photoAssetMediaType = a12;
    v25->_sourceEventAccessType = [(MOResource *)v25 dataAccessTypeFromResourceType:a5];
  }

  return v25;
}

- (unint64_t)dataAccessTypeFromResourceType:(unint64_t)a3
{
  if (a3 > 0x10) {
    return 0;
  }
  else {
    return qword_1D250EE48[a3];
  }
}

+ (id)getDictionaryForData:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v12 = 0;
    id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v12];
    id v7 = v12;
    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
    id v6 = 0;
  }
  if ([v6 count])
  {
    v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_INFO, "resource data dictionary , %@", buf, 0xCu);
    }

    id v6 = v6;
    id v7 = 0;
    id v9 = v6;
    goto LABEL_15;
  }
  id v7 = 0;
LABEL_10:
  id v10 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    +[MOResource getDictionaryForData:error:]((uint64_t)v7, v10);
  }

  if (a4)
  {
    id v7 = v7;
    id v9 = 0;
    *a4 = v7;
  }
  else
  {
    id v9 = 0;
  }
LABEL_15:

  return v9;
}

- (id)getDictionary
{
  v3 = objc_opt_class();
  v4 = [(MOResource *)self data];
  id v5 = [v3 getDictionaryForData:v4 error:0];

  return v5;
}

- (id)description
{
  v3 = NSString;
  v4 = [(MOResource *)self identifier];
  id v5 = [(MOResource *)self name];
  id v6 = [v5 mask];
  unint64_t v7 = [(MOResource *)self type];
  v8 = [(MOResource *)self assets];
  id v9 = [(MOResource *)self data];
  uint64_t v10 = [v9 length];
  [(MOResource *)self value];
  id v12 = [v3 stringWithFormat:@"<MOResource identifier, %@, name, %@, type, %lu, assets, %@, data.length, %lu, value, %f", v4, v6, v7, v8, v10, v11];

  return v12;
}

- (void)setAssets:(id)a3
{
}

- (void)setPriorityScore:(double)a3
{
  self->_priorityScore = a3;
}

- (void)setPhotoCurationScore:(id)a3
{
}

- (void)setPhotoCreationDate:(id)a3
{
}

+ (id)describeType:(unint64_t)a3
{
  if (a3 > 0x10) {
    return @"Invalid";
  }
  else {
    return off_1E691E9F0[a3];
  }
}

- (id)describeType
{
  unint64_t v2 = [(MOResource *)self type];
  return +[MOResource describeType:v2];
}

+ (id)getStringTypeForResources:(unint64_t)a3
{
  return +[MOResource describeType:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOResource)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    id v6 = [(MOResource *)self initWithIdentifier:v5];
    if (v6)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
      name = v6->_name;
      v6->_name = (NSString *)v7;

      v6->_type = [v4 decodeInt64ForKey:@"type"];
      [v4 decodeDoubleForKey:@"value"];
      v6->_value = v9;
      [v4 decodeDoubleForKey:@"priorityScore"];
      v6->_priorityScore = v10;
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoCurationScore"];
      photoCurationScore = v6->_photoCurationScore;
      v6->_photoCurationScore = (NSNumber *)v11;

      v6->_photoFaceCount = [v4 decodeInt64ForKey:@"photoFaceCount"];
      v6->_photoAssetMediaType = [v4 decodeInt64ForKey:@"photoAssetMediaType"];
      uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoCreationDate"];
      photoCreationDate = v6->_photoCreationDate;
      v6->_photoCreationDate = (NSDate *)v13;

      uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Assets"];
      assets = v6->_assets;
      v6->_assets = (NSString *)v15;

      uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
      data = v6->_data;
      v6->_data = (NSData *)v17;

      uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceEventIdentifier"];
      sourceEventIdentifier = v6->_sourceEventIdentifier;
      v6->_sourceEventIdentifier = (NSUUID *)v19;

      v6->_sourceEventAccessType = [v4 decodeInt64ForKey:@"sourceEventAccessType"];
    }
    self = v6;
    id v21 = self;
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeInt64:self->_type forKey:@"type"];
  [v5 encodeDouble:@"value" forKey:self->_value];
  [v5 encodeDouble:@"priorityScore" forKey:self->_priorityScore];
  [v5 encodeObject:self->_photoCurationScore forKey:@"photoCurationScore"];
  [v5 encodeInt64:self->_photoFaceCount forKey:@"photoFaceCount"];
  [v5 encodeInt64:self->_photoAssetMediaType forKey:@"photoAssetMediaType"];
  [v5 encodeObject:self->_photoCreationDate forKey:@"photoCreationDate"];
  [v5 encodeObject:self->_assets forKey:@"Assets"];
  [v5 encodeObject:self->_data forKey:@"data"];
  [v5 encodeInt64:self->_sourceEventAccessType forKey:@"sourceEventAccessType"];
  [v5 encodeObject:self->_sourceEventIdentifier forKey:@"sourceEventIdentifier"];
}

- (unint64_t)hash
{
  unint64_t v2 = [(MOResource *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOResource *)a3;
  id v6 = v5;
  if (self == v5)
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
        uint64_t v7 = v6;
        v8 = [(MOResource *)self identifier];
        if (v8
          || ([(MOResource *)v7 identifier], (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          double v9 = [(MOResource *)self identifier];
          double v10 = [(MOResource *)v7 identifier];
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

+ (id)getDedupeKeyForResourceData:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    id v5 = 0;
    goto LABEL_19;
  }
  if (a4 == 6)
  {
    double v9 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = [v8 length];
      _os_log_impl(&dword_1D24AE000, v9, OS_LOG_TYPE_INFO, "Using for the dedupe key the map item handler , %lu", buf, 0xCu);
    }

    id v5 = v8;
    double v10 = 0;
LABEL_6:
    id v11 = 0;
    goto LABEL_18;
  }
  id v31 = 0;
  double v10 = +[MOResource getDictionaryForData:v8 error:&v31];
  id v11 = v31;
  if (!v11 && [v10 count])
  {
    id v11 = 0;
    switch(a4)
    {
      case 0uLL:
      case 1uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x10uLL:
        id v12 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          +[MOResource getDedupeKeyForResourceData:type:error:].cold.4(a4, v12);
        }
        goto LABEL_15;
      case 2uLL:
        id v14 = [v10 allKeys];
        uint64_t v15 = @"MOPhotoResourceLocalIdentifier";
        int v16 = [v14 containsObject:@"MOPhotoResourceLocalIdentifier"];

        uint64_t v17 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
        v18 = v17;
        if (!v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            +[MOResource getDedupeKeyForResourceData:type:error:]();
          }
          goto LABEL_40;
        }
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
          goto LABEL_29;
        }
        uint64_t v19 = [v10 objectForKeyedSubscript:@"MOPhotoResourceLocalIdentifier"];
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = (uint64_t)v19;
        goto LABEL_28;
      case 0xAuLL:
        v20 = [v10 allKeys];
        uint64_t v15 = @"MOWorkoutMetaDataKeyWorkoutID";
        int v21 = [v20 containsObject:@"MOWorkoutMetaDataKeyWorkoutID"];

        id v22 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
        v18 = v22;
        if (!v21)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            +[MOResource getDedupeKeyForResourceData:type:error:]();
          }
LABEL_40:

          goto LABEL_16;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = [v10 objectForKeyedSubscript:@"MOWorkoutMetaDataKeyWorkoutID"];
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = (uint64_t)v19;
LABEL_28:
          _os_log_impl(&dword_1D24AE000, v18, OS_LOG_TYPE_INFO, "Using for the dedupe key, %@", buf, 0xCu);
        }
LABEL_29:

        id v5 = [v10 objectForKeyedSubscript:v15];
        goto LABEL_6;
      case 0xDuLL:
        id v23 = [v10 allKeys];
        if (![v23 containsObject:@"MOActivityMetaDataMotionType"]) {
          goto LABEL_42;
        }
        v24 = [v10 allKeys];
        if ([v24 containsObject:@"MOActivityMetaDataKeyStartDate"])
        {
          v25 = [v10 allKeys];
          int v26 = [v25 containsObject:@"MOActivityMetaDataKeyEndDate"];

          if (v26)
          {
            id v5 = [MEMORY[0x1E4F1CA60] dictionary];
            id v27 = [v10 objectForKeyedSubscript:@"MOActivityMetaDataMotionType"];
            [v5 setObject:v27 forKey:@"MOActivityMetaDataMotionType"];

            id v28 = [v10 objectForKeyedSubscript:@"MOActivityMetaDataKeyStartDate"];
            [v5 setObject:v28 forKey:@"MOActivityMetaDataKeyStartDate"];

            objc_super v29 = [v10 objectForKeyedSubscript:@"MOActivityMetaDataKeyEndDate"];
            [v5 setObject:v29 forKey:@"MOActivityMetaDataKeyEndDate"];

            v30 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v33 = (uint64_t)v5;
              _os_log_impl(&dword_1D24AE000, v30, OS_LOG_TYPE_INFO, "Using for the dedupe key the dictionary, %@", buf, 0xCu);
            }

            goto LABEL_6;
          }
        }
        else
        {

LABEL_42:
        }
        id v12 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          +[MOResource getDedupeKeyForResourceData:type:error:]();
        }
LABEL_15:

LABEL_16:
        id v11 = 0;
        break;
      default:
        goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (!a5)
  {
LABEL_17:
    id v5 = 0;
    goto LABEL_18;
  }
  id v11 = v11;
  id v5 = 0;
  *a5 = v11;
LABEL_18:

LABEL_19:
  return v5;
}

- (id)getDedupeKeyError:(id *)a3
{
  id v5 = objc_opt_class();
  id v6 = [(MOResource *)self data];
  uint64_t v7 = objc_msgSend(v5, "getDedupeKeyForResourceData:type:error:", v6, -[MOResource type](self, "type"), a3);

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)value
{
  return self->_value;
}

- (double)priorityScore
{
  return self->_priorityScore;
}

- (NSNumber)photoCurationScore
{
  return self->_photoCurationScore;
}

- (unint64_t)photoFaceCount
{
  return self->_photoFaceCount;
}

- (void)setPhotoFaceCount:(unint64_t)a3
{
  self->_photoFaceCount = a3;
}

- (float)photoOverallAestheticScore
{
  return self->_photoOverallAestheticScore;
}

- (void)setPhotoOverallAestheticScore:(float)a3
{
  self->_photoOverallAestheticScore = a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)assets
{
  return self->_assets;
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)photoAssetMediaType
{
  return self->_photoAssetMediaType;
}

- (void)setPhotoAssetMediaType:(unint64_t)a3
{
  self->_photoAssetMediaType = a3;
}

- (NSDate)photoCreationDate
{
  return self->_photoCreationDate;
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_photoCreationDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_photoCurationScore, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (MOResource)initWithPerson:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F29128];
  id v6 = [v4 contactIdentifier];
  uint64_t v7 = [v5 uuidFromString:v6];

  id v8 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(MOResource(MOPerson) *)(uint64_t)v7 initWithPerson:v8];
  }

  double v9 = [v4 name];
  double v10 = [v4 contactIdentifier];
  [v4 priorityScore];
  id v12 = [(MOResource *)self initWithIdentifier:v7 name:v9 type:11 assets:v10 data:0 value:0 priorityScore:0.0 photoCurationScore:v11 photoFaceCount:0 photoAssetMediaType:0];

  return v12;
}

- (id)sourceAppBundleIds
{
  if ([(MOResource *)self type] != 3)
  {
    double v9 = 0;
    goto LABEL_19;
  }
  unint64_t v3 = [(MOResource *)self data];

  if (!v3)
  {
    uint64_t v7 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MOResource(Source) sourceAppBundleIds](v7);
    }
    double v9 = 0;
    goto LABEL_18;
  }
  id v4 = (void *)MEMORY[0x1E4F28D90];
  id v5 = [(MOResource *)self data];
  id v12 = 0;
  id v6 = [v4 JSONObjectWithData:v5 options:0 error:&v12];
  uint64_t v7 = v12;

  if (v7 || !v6)
  {
    id v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(MOResource(Source) *)(uint64_t)v7 sourceAppBundleIds];
    }
    goto LABEL_16;
  }
  id v8 = [v6 objectForKeyedSubscript:@"MOMediaPlayMetaDataKeyPlayerBundleID"];
  if (!v8)
  {
    double v10 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MOResource(Source) sourceAppBundleIds](v10);
    }

LABEL_16:
    double v9 = 0;
    goto LABEL_17;
  }
  double v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
LABEL_17:

LABEL_18:
LABEL_19:
  return v9;
}

- (id)bundleSourceType
{
  unint64_t v2 = [(MOResource *)self type] - 2;
  if (v2 <= 0xE && ((0x6F93u >> v2) & 1) != 0) {
    unint64_t v3 = *off_1E691EAE0[v2];
  }
  else {
    unint64_t v3 = 0;
  }
  return v3;
}

- (id)photoLocalDate
{
  unint64_t v2 = [(MOResource *)self data];
  unint64_t v3 = +[MODictionaryEncoder decodeToDictionary:v2];

  id v4 = [v3 objectForKeyedSubscript:@"MOPhotoResourceLocalTime"];
  [v4 doubleValue];
  double v6 = v5;

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v6];
  return v7;
}

- (MOResource)initWithWeather:(id)a3
{
  id v4 = a3;
  double v5 = objc_opt_new();
  double v6 = NSNumber;
  uint64_t v7 = [v4 startDate];
  [v7 timeIntervalSinceReferenceDate];
  id v8 = objc_msgSend(v6, "numberWithDouble:");
  [v5 setObject:v8 forKeyedSubscript:@"MOWeatherMetaDataKeyStartDate"];

  double v9 = NSNumber;
  double v10 = [v4 endDate];
  [v10 timeIntervalSinceReferenceDate];
  double v11 = objc_msgSend(v9, "numberWithDouble:");
  [v5 setObject:v11 forKeyedSubscript:@"MOWeatherMetaDataKeyEndDate"];

  id v12 = [v4 weatherSummary];
  [v5 setObject:v12 forKeyedSubscript:@"MOWeatherMetaDataKeyWeatherSummary"];

  uint64_t v13 = [v4 weatherSymbolName];
  [v5 setObject:v13 forKeyedSubscript:@"MOWeatherMetaDataKeySymbolName"];

  id v14 = [v4 temperature];

  if (v14)
  {
    uint64_t v15 = NSNumber;
    int v16 = [v4 temperature];
    [v16 doubleValue];
    uint64_t v17 = objc_msgSend(v15, "numberWithDouble:");
    [v5 setObject:v17 forKeyedSubscript:@"MOWeatherMetaDataKeyTemperatureValue"];

    v18 = [v4 temperature];
    uint64_t v19 = [v18 unit];
    v20 = [v19 symbol];
    [v5 setObject:v20 forKeyedSubscript:@"MOWeatherMetaDataKeyTemperatureUnitSymbol"];
  }
  int v21 = [v4 windSpeed];

  if (v21)
  {
    id v22 = NSNumber;
    id v23 = [v4 windSpeed];
    [v23 doubleValue];
    v24 = objc_msgSend(v22, "numberWithDouble:");
    [v5 setObject:v24 forKeyedSubscript:@"MOWeatherMetaDataKeyWindSpeedValue"];

    v25 = [v4 windSpeed];
    int v26 = [v25 unit];
    id v27 = [v26 symbol];
    [v5 setObject:v27 forKeyedSubscript:@"MOWeatherMetaDataKeyWindSpeedUnitSymbol"];
  }
  id v28 = +[MODictionaryEncoder encodeDictionary:v5];
  objc_super v29 = [MEMORY[0x1E4F29128] UUID];
  v30 = [(MOResource *)self initWithIdentifier:v29 name:@"Weather" type:14 assets:0 data:v28 value:0 priorityScore:0.0 photoCurationScore:-1.0 photoFaceCount:0 photoAssetMediaType:0];

  return v30;
}

- (double)endDate
{
  unint64_t v3 = [(MOResource *)self metaData];

  if (!v3) {
    return 0.0;
  }
  id v4 = [(MOResource *)self metaData];
  double v5 = [v4 objectForKeyedSubscript:@"MOWeatherMetaDataKeyEndDate"];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (double)startDate
{
  unint64_t v3 = [(MOResource *)self metaData];

  if (!v3) {
    return 0.0;
  }
  id v4 = [(MOResource *)self metaData];
  double v5 = [v4 objectForKeyedSubscript:@"MOWeatherMetaDataKeyStartDate"];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (id)temperature
{
  unint64_t v3 = [(MOResource *)self metaData];

  if (v3
    && ([(MOResource *)self metaData],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:@"MOWeatherMetaDataKeyTemperatureValue"],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28E28]);
    double v7 = [(MOResource *)self metaData];
    id v8 = [v7 objectForKeyedSubscript:@"MOWeatherMetaDataKeyTemperatureValue"];
    [v8 doubleValue];
    double v10 = v9;
    id v11 = objc_alloc(MEMORY[0x1E4F29218]);
    id v12 = [(MOResource *)self metaData];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"MOWeatherMetaDataKeyTemperatureUnitSymbol"];
    id v14 = (void *)[v11 initWithSymbol:v13];
    uint64_t v15 = (void *)[v6 initWithDoubleValue:v14 unit:v10];
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)weatherSummary
{
  unint64_t v3 = [(MOResource *)self metaData];

  if (v3)
  {
    id v4 = [(MOResource *)self metaData];
    double v5 = [v4 objectForKeyedSubscript:@"MOWeatherMetaDataKeyWeatherSummary"];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (id)weatherSymbolName
{
  unint64_t v3 = [(MOResource *)self metaData];

  if (v3)
  {
    id v4 = [(MOResource *)self metaData];
    double v5 = [v4 objectForKeyedSubscript:@"MOWeatherMetaDataKeySymbolName"];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (id)windSpeed
{
  unint64_t v3 = [(MOResource *)self metaData];

  if (v3
    && ([(MOResource *)self metaData],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:@"MOWeatherMetaDataKeyWindSpeedValue"],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28E28]);
    double v7 = [(MOResource *)self metaData];
    id v8 = [v7 objectForKeyedSubscript:@"MOWeatherMetaDataKeyWindSpeedValue"];
    [v8 doubleValue];
    double v10 = v9;
    id v11 = objc_alloc(MEMORY[0x1E4F29148]);
    id v12 = [(MOResource *)self metaData];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"MOWeatherMetaDataKeyWindSpeedUnitSymbol"];
    id v14 = (void *)[v11 initWithSymbol:v13];
    uint64_t v15 = (void *)[v6 initWithDoubleValue:v14 unit:v10];
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (MOResource)initWithPlace:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "placeType"));
  [v11 setObject:v12 forKeyedSubscript:@"placeType"];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "placeUserType"));
  [v11 setObject:v13 forKeyedSubscript:@"placeUserType"];

  id v14 = [v8 location];
  uint64_t v15 = [v14 dictionary];
  [v11 setObject:v15 forKeyedSubscript:@"location"];

  int v16 = [v8 poiCategory];
  [v11 setObject:v16 forKeyedSubscript:@"poiCategory"];

  if ([v8 placeType] != 101 && objc_msgSend(v8, "placeType") != 102)
  {
    uint64_t v17 = [v8 enclosingArea];
    [v11 setObject:v17 forKeyedSubscript:@"cityName"];
  }
  v18 = [v8 enclosingArea];
  [v11 setObject:v18 forKeyedSubscript:@"enclosingArea"];

  if (v9)
  {
    uint64_t v19 = NSNumber;
    [v9 timeIntervalSinceReferenceDate];
    v20 = objc_msgSend(v19, "numberWithDouble:");
    [v11 setObject:v20 forKeyedSubscript:@"startDate"];
  }
  if (v10)
  {
    int v21 = NSNumber;
    [v10 timeIntervalSinceReferenceDate];
    id v22 = objc_msgSend(v21, "numberWithDouble:");
    [v11 setObject:v22 forKeyedSubscript:@"endDate"];
  }
  id v23 = +[MODictionaryEncoder encodeDictionary:v11];
  v24 = [v8 identifier];
  v25 = [v8 placeName];
  [v8 placeNameConfidence];
  double v27 = v26;
  [v8 priorityScore];
  objc_super v29 = [(MOResource *)self initWithIdentifier:v24 name:v25 type:12 assets:0 data:v23 value:0 priorityScore:v27 photoCurationScore:v28 photoFaceCount:0 photoAssetMediaType:0];

  return v29;
}

- (MOResource)initWithName:(id)a3 mapItemHandle:(id)a4 priorityScore:(double)a5
{
  id v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 UUID];
  id v12 = [(MOResource *)self initWithIdentifier:v11 name:v10 type:6 assets:0 data:v9 value:0 priorityScore:0.0 photoCurationScore:a5 photoFaceCount:0 photoAssetMediaType:0];

  return v12;
}

- (id)metaData
{
  unint64_t v2 = [(MOResource *)self data];
  unint64_t v3 = +[MODictionaryEncoder decodeToDictionary:v2];

  return v3;
}

- (id)cityName
{
  unint64_t v3 = [(MOResource *)self metaData];

  if (v3)
  {
    id v4 = [(MOResource *)self metaData];
    double v5 = [v4 objectForKeyedSubscript:@"cityName"];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (id)enclosingArea
{
  unint64_t v3 = [(MOResource *)self metaData];

  if (v3)
  {
    id v4 = [(MOResource *)self metaData];
    double v5 = [v4 objectForKeyedSubscript:@"enclosingArea"];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (unint64_t)placeUserType
{
  unint64_t v3 = [(MOResource *)self metaData];

  if (!v3) {
    return 0;
  }
  id v4 = [(MOResource *)self metaData];
  double v5 = [v4 objectForKeyedSubscript:@"placeUserType"];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (unint64_t)placeType
{
  unint64_t v3 = [(MOResource *)self metaData];

  if (!v3) {
    return 0;
  }
  id v4 = [(MOResource *)self metaData];
  double v5 = [v4 objectForKeyedSubscript:@"placeType"];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (id)location
{
  unint64_t v3 = [(MOResource *)self metaData];

  if (v3)
  {
    id v4 = [(MOResource *)self metaData];
    double v5 = [v4 objectForKeyedSubscript:@"location"];

    unint64_t v6 = [MEMORY[0x1E4F5CE00] locationFromDictionary:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v6;
}

- (id)poiCategory
{
  unint64_t v3 = [(MOResource *)self metaData];

  if (v3)
  {
    id v4 = [(MOResource *)self metaData];
    double v5 = [v4 objectForKeyedSubscript:@"poiCategory"];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (MOResource)initWithEvergreenTypeName:(id)a3 promptIndex:(unint64_t)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = +[MOResource evergreenTypeFromEvergreenTypeString:v6];
  v13[0] = @"evergreen_type";
  id v8 = [NSNumber numberWithUnsignedInteger:v7];
  v14[0] = v8;
  v13[1] = @"evergreen_index";
  id v9 = [NSNumber numberWithUnsignedInteger:a4];
  v14[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  id v11 = [(MOResource *)self initWithName:v6 type:9 dict:v10 value:(double)a4];
  return v11;
}

- (MOResource)initWithEvergreenTypeName:(id)a3 promptIndexes:(id)a4
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = +[MOResource evergreenTypeFromEvergreenTypeString:v7];
  v14[0] = @"evergreen_type";
  id v9 = [NSNumber numberWithUnsignedInteger:v8];
  v15[0] = v9;
  v15[1] = v6;
  v14[1] = @"evergreen_indexes";
  v14[2] = @"evergreen_count";
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v15[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v12 = [(MOResource *)self initWithName:v7 type:9 dict:v11 value:0.0];
  return v12;
}

- (unint64_t)evergreenType
{
  unint64_t v3 = [(MOResource *)self getDictionary];

  if (!v3) {
    return 0;
  }
  id v4 = [(MOResource *)self getDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"evergreen_type"];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (unint64_t)promptIndex
{
  unint64_t v3 = [(MOResource *)self getDictionary];

  if (v3)
  {
    id v4 = [(MOResource *)self getDictionary];
    double v5 = [v4 objectForKeyedSubscript:@"evergreen_index"];
    unint64_t v6 = (int)[v5 intValue];
  }
  else
  {
    [(MOResource *)self value];
    return (unint64_t)v7;
  }
  return v6;
}

- (id)promptIndexes
{
  unint64_t v3 = [(MOResource *)self getDictionary];

  if (v3)
  {
    id v4 = [(MOResource *)self getDictionary];
    double v5 = [v4 objectForKeyedSubscript:@"evergreen_indexes"];
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (unint64_t)promptCount
{
  unint64_t v3 = [(MOResource *)self getDictionary];

  if (v3)
  {
    id v4 = [(MOResource *)self getDictionary];
    double v5 = [v4 objectForKeyedSubscript:@"evergreen_count"];
    unint64_t v6 = (int)[v5 intValue];
  }
  else
  {
    [(MOResource *)self value];
    return (unint64_t)v7;
  }
  return v6;
}

+ (id)evergreenTypeStringFromEvergreenType:(unint64_t)a3
{
  if (a3 - 1 > 5)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *off_1E69209F8[a3 - 1];
  }
  return v4;
}

+ (unint64_t)evergreenTypeFromEvergreenTypeString:(id)a3
{
  id v3 = a3;
  if ([@"WISDOM" isEqualToString:v3])
  {
    unint64_t v4 = 1;
  }
  else if ([@"PURPOSE" isEqualToString:v3])
  {
    unint64_t v4 = 4;
  }
  else if ([@"KINDNESS" isEqualToString:v3])
  {
    unint64_t v4 = 3;
  }
  else if ([@"GRATITUDE" isEqualToString:v3])
  {
    unint64_t v4 = 2;
  }
  else if ([@"CREATIVITY" isEqualToString:v3])
  {
    unint64_t v4 = 6;
  }
  else if ([@"RESILIENCE" isEqualToString:v3])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  unint64_t v2 = "-[MOResource initWithIdentifier:]";
  __int16 v3 = 1024;
  int v4 = 29;
  _os_log_error_impl(&dword_1D24AE000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

- (void)initWithName:(uint64_t)a1 type:(NSObject *)a2 dict:value:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_DEBUG, "Error when serialization to json, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)getDictionaryForData:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_ERROR, "Unable to deserialize data to dictionary, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)getDedupeKeyForResourceData:type:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  v0 = +[MOResource getStringTypeForResources:2];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_1D24AE000, v1, v2, "Malformed dictionary, %@, for resource type, %@, the key %@ is missing.", v3, v4, v5, v6, v7);
}

+ (void)getDedupeKeyForResourceData:type:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  v0 = +[MOResource getStringTypeForResources:10];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_1D24AE000, v1, v2, "Malformed dictionary, %@, for resource type, %@, the key %@ is missing.", v3, v4, v5, v6, v7);
}

+ (void)getDedupeKeyForResourceData:type:error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[MOResource getStringTypeForResources:13];
  int v4 = 138413314;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint8_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  __int16 v10 = 2112;
  id v11 = @"MOActivityMetaDataKeyStartDate";
  __int16 v12 = 2112;
  uint64_t v13 = @"MOActivityMetaDataKeyEndDate";
  _os_log_error_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_ERROR, "Malformed dictionary, %@, for resource type, %@, the one of the keys %@, %@, %@ is missing.", (uint8_t *)&v4, 0x34u);
}

+ (void)getDedupeKeyForResourceData:(uint64_t)a1 type:(NSObject *)a2 error:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[MOResource getStringTypeForResources:a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_ERROR, "Dedupe key not available for this type, %@.", (uint8_t *)&v4, 0xCu);
}

@end