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
- (MOResource)initWithResourceMO:(id)a3;
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

- (MOResource)initWithResourceMO:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 identifier];
    v7 = [v5 name];
    id v8 = [v5 type];
    v9 = [v5 assets];
    v10 = [v5 data];
    [v5 value];
    double v12 = v11;
    [v5 priorityScore];
    double v14 = v13;
    v15 = [v5 photoCurationScore];
    self = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v6, v7, v8, v9, v10, v15, v12, v14, [v5 photoFaceCount], [v5 photoAssetMediaType]);

    v16 = [v5 sourceEventIdentifier];

    if (v16)
    {
      v17 = [v5 sourceEventIdentifier];
      [(MOResource *)self setSourceEventIdentifier:v17];
    }
    if ([v5 sourceEventAccessType]) {
      -[MOResource setSourceEventAccessType:](self, "setSourceEventAccessType:", [v5 sourceEventAccessType]);
    }
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (MOResource)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOResource initWithIdentifier:](v6);
    }

    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MOResource.m" lineNumber:29 description:@"Invalid parameter not satisfying: identifier (in %s:%d)", "-[MOResource initWithIdentifier:]", 29];
  }
  id v8 = [(MOResource *)self initWithIdentifier:v5 name:@"Resource" type:0 assets:0 data:0 value:0 priorityScore:0.0 photoCurationScore:-1.0 photoFaceCount:0 photoAssetMediaType:0];

  return v8;
}

- (MOResource)initWithName:(id)a3 type:(unint64_t)a4 assets:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSUUID UUID];
  double v11 = [(MOResource *)self initWithIdentifier:v10 name:v9 type:a4 assets:v8 data:0 value:0 priorityScore:0.0 photoCurationScore:-1.0 photoFaceCount:0 photoAssetMediaType:0];

  return v11;
}

- (MOResource)initWithName:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v7 = +[NSUUID UUID];
  id v8 = [(MOResource *)self initWithIdentifier:v7 name:v6 type:a4 assets:0 data:0 value:0 priorityScore:0.0 photoCurationScore:-1.0 photoFaceCount:0 photoAssetMediaType:0];

  return v8;
}

- (MOResource)initWithName:(id)a3 value:(double)a4
{
  id v6 = a3;
  v7 = +[NSUUID UUID];
  id v8 = [(MOResource *)self initWithIdentifier:v7 name:v6 type:1 assets:0 data:0 value:0 priorityScore:a4 photoCurationScore:-1.0 photoFaceCount:0 photoAssetMediaType:0];

  return v8;
}

- (MOResource)initWithName:(id)a3 type:(unint64_t)a4 dict:(id)a5 value:(double)a6
{
  id v10 = a3;
  if (a5)
  {
    id v17 = 0;
    a5 = +[NSJSONSerialization dataWithJSONObject:a5 options:0 error:&v17];
    id v11 = v17;
    if (v11) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = a5 == 0;
    }
    if (v12)
    {
      double v13 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[MOResource initWithName:type:dict:value:]((uint64_t)v11, v13);
      }
    }
  }
  double v14 = +[NSUUID UUID];
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
    return qword_1002BAE38[a3];
  }
}

+ (id)getDictionaryForData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    id v12 = 0;
    id v6 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v12];
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
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "resource data dictionary , %@", buf, 0xCu);
    }

    id v6 = v6;
    id v7 = 0;
    id v9 = v6;
    goto LABEL_15;
  }
  id v7 = 0;
LABEL_10:
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
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
  id v4 = [(MOResource *)self data];
  id v5 = [v3 getDictionaryForData:v4 error:0];

  return v5;
}

- (id)description
{
  v3 = [(MOResource *)self identifier];
  id v4 = [(MOResource *)self name];
  id v5 = [v4 mask];
  unint64_t v6 = [(MOResource *)self type];
  id v7 = [(MOResource *)self assets];
  id v8 = [(MOResource *)self data];
  id v9 = [v8 length];
  [(MOResource *)self value];
  id v11 = +[NSString stringWithFormat:@"<MOResource identifier, %@, name, %@, type, %lu, assets, %@, data.length, %lu, value, %f", v3, v5, v6, v7, v9, v10];

  return v11;
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
    return off_1002CBBA8[a3];
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
    unint64_t v6 = [(MOResource *)self initWithIdentifier:v5];
    if (v6)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
      name = v6->_name;
      v6->_name = (NSString *)v7;

      v6->_type = (unint64_t)[v4 decodeInt64ForKey:@"type"];
      [v4 decodeDoubleForKey:@"value"];
      v6->_value = v9;
      [v4 decodeDoubleForKey:@"priorityScore"];
      v6->_priorityScore = v10;
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoCurationScore"];
      photoCurationScore = v6->_photoCurationScore;
      v6->_photoCurationScore = (NSNumber *)v11;

      v6->_photoFaceCount = (unint64_t)[v4 decodeInt64ForKey:@"photoFaceCount"];
      v6->_photoAssetMediaType = (unint64_t)[v4 decodeInt64ForKey:@"photoAssetMediaType"];
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

      v6->_sourceEventAccessType = (int64_t)[v4 decodeInt64ForKey:@"sourceEventAccessType"];
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
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOResource *)a3;
  unint64_t v6 = v5;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = v6;
        id v8 = [(MOResource *)self identifier];
        if (v8
          || ([(MOResource *)v7 identifier], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          double v9 = [(MOResource *)self identifier];
          double v10 = [(MOResource *)v7 identifier];
          unsigned __int8 v11 = [v9 isEqual:v10];

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          unsigned __int8 v11 = 1;
        }

        goto LABEL_12;
      }
    }
    unsigned __int8 v11 = 0;
  }
LABEL_13:

  return v11;
}

+ (id)getDedupeKeyForResourceData:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (!v8)
  {
    id v5 = 0;
    goto LABEL_19;
  }
  if (a4 == 6)
  {
    double v9 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v33 = [v8 length];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Using for the dedupe key the map item handler , %lu", buf, 0xCu);
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
        id v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          +[MOResource getDedupeKeyForResourceData:type:error:].cold.4(a4, v12);
        }
        goto LABEL_15;
      case 2uLL:
        id v14 = [v10 allKeys];
        CFStringRef v15 = @"MOPhotoResourceLocalIdentifier";
        unsigned int v16 = [v14 containsObject:@"MOPhotoResourceLocalIdentifier"];

        uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
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
        id v33 = v19;
        goto LABEL_28;
      case 0xAuLL:
        v20 = [v10 allKeys];
        CFStringRef v15 = @"MOWorkoutMetaDataKeyWorkoutID";
        unsigned int v21 = [v20 containsObject:@"MOWorkoutMetaDataKeyWorkoutID"];

        id v22 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
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
          id v33 = v19;
LABEL_28:
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Using for the dedupe key, %@", buf, 0xCu);
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
          unsigned int v26 = [v25 containsObject:@"MOActivityMetaDataKeyEndDate"];

          if (v26)
          {
            id v5 = +[NSMutableDictionary dictionary];
            id v27 = [v10 objectForKeyedSubscript:@"MOActivityMetaDataMotionType"];
            [v5 setObject:v27 forKey:@"MOActivityMetaDataMotionType"];

            id v28 = [v10 objectForKeyedSubscript:@"MOActivityMetaDataKeyStartDate"];
            [v5 setObject:v28 forKey:@"MOActivityMetaDataKeyStartDate"];

            objc_super v29 = [v10 objectForKeyedSubscript:@"MOActivityMetaDataKeyEndDate"];
            [v5 setObject:v29 forKey:@"MOActivityMetaDataKeyEndDate"];

            v30 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v33 = v5;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Using for the dedupe key the dictionary, %@", buf, 0xCu);
            }

            goto LABEL_6;
          }
        }
        else
        {

LABEL_42:
        }
        id v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
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
  unint64_t v6 = [(MOResource *)self data];
  uint64_t v7 = [v5 getDedupeKeyForResourceData:v6 type:-[MOResource type](self, "type") error:a3];

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

- (id)photoLocalDate
{
  unint64_t v2 = [(MOResource *)self data];
  id v3 = +[MODictionaryEncoder decodeToDictionary:v2];

  id v4 = [v3 objectForKeyedSubscript:@"MOPhotoResourceLocalTime"];
  [v4 doubleValue];
  double v6 = v5;

  id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:v6];

  return v7;
}

- (id)bundleSourceType
{
  unint64_t v2 = [(MOResource *)self type] - 2;
  if (v2 <= 0xE && ((0x6F93u >> v2) & 1) != 0) {
    id v3 = *off_1002CD6D8[v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (MOResource)initWithPerson:(id)a3
{
  id v4 = a3;
  double v5 = [v4 contactIdentifier];
  double v6 = +[NSUUID uuidFromString:v5];

  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(MOResource(MOPerson) *)(uint64_t)v6 initWithPerson:v7];
  }

  id v8 = [v4 name];
  double v9 = [v4 contactIdentifier];
  [v4 priorityScore];
  id v11 = [(MOResource *)self initWithIdentifier:v6 name:v8 type:11 assets:v9 data:0 value:0 priorityScore:0.0 photoCurationScore:v10 photoFaceCount:0 photoAssetMediaType:0];

  return v11;
}

- (MOResource)initWithWeather:(id)a3
{
  id v4 = a3;
  double v5 = objc_opt_new();
  double v6 = [v4 startDate];
  [v6 timeIntervalSinceReferenceDate];
  id v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v5 setObject:v7 forKeyedSubscript:@"MOWeatherMetaDataKeyStartDate"];

  id v8 = [v4 endDate];
  [v8 timeIntervalSinceReferenceDate];
  double v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v5 setObject:v9 forKeyedSubscript:@"MOWeatherMetaDataKeyEndDate"];

  double v10 = [v4 weatherSummary];
  [v5 setObject:v10 forKeyedSubscript:@"MOWeatherMetaDataKeyWeatherSummary"];

  id v11 = [v4 weatherSymbolName];
  [v5 setObject:v11 forKeyedSubscript:@"MOWeatherMetaDataKeySymbolName"];

  id v12 = [v4 temperature];

  if (v12)
  {
    uint64_t v13 = [v4 temperature];
    [v13 doubleValue];
    id v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v5 setObject:v14 forKeyedSubscript:@"MOWeatherMetaDataKeyTemperatureValue"];

    CFStringRef v15 = [v4 temperature];
    unsigned int v16 = [v15 unit];
    uint64_t v17 = [v16 symbol];
    [v5 setObject:v17 forKeyedSubscript:@"MOWeatherMetaDataKeyTemperatureUnitSymbol"];
  }
  v18 = [v4 windSpeed];

  if (v18)
  {
    uint64_t v19 = [v4 windSpeed];
    [v19 doubleValue];
    v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v5 setObject:v20 forKeyedSubscript:@"MOWeatherMetaDataKeyWindSpeedValue"];

    unsigned int v21 = [v4 windSpeed];
    id v22 = [v21 unit];
    id v23 = [v22 symbol];
    [v5 setObject:v23 forKeyedSubscript:@"MOWeatherMetaDataKeyWindSpeedUnitSymbol"];
  }
  v24 = +[MODictionaryEncoder encodeDictionary:v5];
  v25 = +[NSUUID UUID];
  unsigned int v26 = [(MOResource *)self initWithIdentifier:v25 name:@"Weather" type:14 assets:0 data:v24 value:0 priorityScore:0.0 photoCurationScore:-1.0 photoFaceCount:0 photoAssetMediaType:0];

  return v26;
}

- (double)endDate
{
  id v3 = [(MOResource *)self metaData];

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
  id v3 = [(MOResource *)self metaData];

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
  id v3 = [(MOResource *)self metaData];

  if (v3
    && ([(MOResource *)self metaData],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:@"MOWeatherMetaDataKeyTemperatureValue"],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = objc_alloc((Class)NSMeasurement);
    double v7 = [(MOResource *)self metaData];
    id v8 = [v7 objectForKeyedSubscript:@"MOWeatherMetaDataKeyTemperatureValue"];
    [v8 doubleValue];
    double v10 = v9;
    id v11 = objc_alloc((Class)NSUnitTemperature);
    id v12 = [(MOResource *)self metaData];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"MOWeatherMetaDataKeyTemperatureUnitSymbol"];
    id v14 = [v11 initWithSymbol:v13];
    id v15 = [v6 initWithDoubleValue:v14 unit:v10];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)weatherSummary
{
  id v3 = [(MOResource *)self metaData];

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
  id v3 = [(MOResource *)self metaData];

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
  id v3 = [(MOResource *)self metaData];

  if (v3
    && ([(MOResource *)self metaData],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:@"MOWeatherMetaDataKeyWindSpeedValue"],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = objc_alloc((Class)NSMeasurement);
    double v7 = [(MOResource *)self metaData];
    id v8 = [v7 objectForKeyedSubscript:@"MOWeatherMetaDataKeyWindSpeedValue"];
    [v8 doubleValue];
    double v10 = v9;
    id v11 = objc_alloc((Class)NSUnit);
    id v12 = [(MOResource *)self metaData];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"MOWeatherMetaDataKeyWindSpeedUnitSymbol"];
    id v14 = [v11 initWithSymbol:v13];
    id v15 = [v6 initWithDoubleValue:v14 unit:v10];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (MOResource)initWithEvergreenTypeName:(id)a3 promptIndex:(unint64_t)a4
{
  id v6 = a3;
  v12[0] = @"evergreen_type";
  double v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MOResource evergreenTypeFromEvergreenTypeString:v6]);
  v13[0] = v7;
  v12[1] = @"evergreen_index";
  id v8 = +[NSNumber numberWithUnsignedInteger:a4];
  v13[1] = v8;
  double v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  double v10 = [(MOResource *)self initWithName:v6 type:9 dict:v9 value:(double)a4];
  return v10;
}

- (MOResource)initWithEvergreenTypeName:(id)a3 promptIndexes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v13[0] = @"evergreen_type";
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MOResource evergreenTypeFromEvergreenTypeString:v7]);
  v14[0] = v8;
  v14[1] = v6;
  v13[1] = @"evergreen_indexes";
  void v13[2] = @"evergreen_count";
  double v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
  v14[2] = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  id v11 = [(MOResource *)self initWithName:v7 type:9 dict:v10 value:0.0];
  return v11;
}

- (unint64_t)evergreenType
{
  id v3 = [(MOResource *)self getDictionary];

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
  id v3 = [(MOResource *)self getDictionary];

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
  id v3 = [(MOResource *)self getDictionary];

  if (v3)
  {
    id v4 = [(MOResource *)self getDictionary];
    double v5 = [v4 objectForKeyedSubscript:@"evergreen_indexes"];
  }
  else
  {
    double v5 = &__NSArray0__struct;
  }

  return v5;
}

- (unint64_t)promptCount
{
  id v3 = [(MOResource *)self getDictionary];

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
    id v4 = *off_1002D24C0[a3 - 1];
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

- (MOResource)initWithPlace:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 placeType]);
  [v11 setObject:v12 forKeyedSubscript:@"placeType"];

  uint64_t v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 placeUserType]);
  [v11 setObject:v13 forKeyedSubscript:@"placeUserType"];

  id v14 = [v8 location];
  id v15 = [v14 dictionary];
  [v11 setObject:v15 forKeyedSubscript:@"location"];

  unsigned int v16 = [v8 poiCategory];
  [v11 setObject:v16 forKeyedSubscript:@"poiCategory"];

  if ([v8 placeType] != (id)101 && objc_msgSend(v8, "placeType") != (id)102)
  {
    uint64_t v17 = [v8 enclosingArea];
    [v11 setObject:v17 forKeyedSubscript:@"cityName"];
  }
  v18 = [v8 enclosingArea];
  [v11 setObject:v18 forKeyedSubscript:@"enclosingArea"];

  if (v9)
  {
    [v9 timeIntervalSinceReferenceDate];
    uint64_t v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v11 setObject:v19 forKeyedSubscript:@"startDate"];
  }
  if (v10)
  {
    [v10 timeIntervalSinceReferenceDate];
    v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v11 setObject:v20 forKeyedSubscript:@"endDate"];
  }
  unsigned int v21 = +[MODictionaryEncoder encodeDictionary:v11];
  id v22 = [v8 identifier];
  id v23 = [v8 placeName];
  [v8 placeNameConfidence];
  double v25 = v24;
  [v8 priorityScore];
  id v27 = [(MOResource *)self initWithIdentifier:v22 name:v23 type:12 assets:0 data:v21 value:0 priorityScore:v25 photoCurationScore:v26 photoFaceCount:0 photoAssetMediaType:0];

  return v27;
}

- (MOResource)initWithName:(id)a3 mapItemHandle:(id)a4 priorityScore:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSUUID UUID];
  id v11 = [(MOResource *)self initWithIdentifier:v10 name:v9 type:6 assets:0 data:v8 value:0 priorityScore:0.0 photoCurationScore:a5 photoFaceCount:0 photoAssetMediaType:0];

  return v11;
}

- (id)metaData
{
  unint64_t v2 = [(MOResource *)self data];
  id v3 = +[MODictionaryEncoder decodeToDictionary:v2];

  return v3;
}

- (id)cityName
{
  id v3 = [(MOResource *)self metaData];

  if (v3)
  {
    unint64_t v4 = [(MOResource *)self metaData];
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
  id v3 = [(MOResource *)self metaData];

  if (v3)
  {
    unint64_t v4 = [(MOResource *)self metaData];
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
  id v3 = [(MOResource *)self metaData];

  if (!v3) {
    return 0;
  }
  unint64_t v4 = [(MOResource *)self metaData];
  double v5 = [v4 objectForKeyedSubscript:@"placeUserType"];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (unint64_t)placeType
{
  id v3 = [(MOResource *)self metaData];

  if (!v3) {
    return 0;
  }
  unint64_t v4 = [(MOResource *)self metaData];
  double v5 = [v4 objectForKeyedSubscript:@"placeType"];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (id)location
{
  id v3 = [(MOResource *)self metaData];

  if (v3)
  {
    unint64_t v4 = [(MOResource *)self metaData];
    double v5 = [v4 objectForKeyedSubscript:@"location"];

    unint64_t v6 = +[RTLocation locationFromDictionary:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)poiCategory
{
  id v3 = [(MOResource *)self metaData];

  if (v3)
  {
    unint64_t v4 = [(MOResource *)self metaData];
    double v5 = [v4 objectForKeyedSubscript:@"poiCategory"];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315394;
  unint64_t v2 = "-[MOResource initWithIdentifier:]";
  __int16 v3 = 1024;
  int v4 = 29;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

- (void)initWithName:(uint64_t)a1 type:(NSObject *)a2 dict:value:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Error when serialization to json, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)getDictionaryForData:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to deserialize data to dictionary, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)getDedupeKeyForResourceData:type:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = +[MOResource getStringTypeForResources:2];
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Malformed dictionary, %@, for resource type, %@, the key %@ is missing.", v3, v4, v5, v6, v7);
}

+ (void)getDedupeKeyForResourceData:type:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  v0 = +[MOResource getStringTypeForResources:10];
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Malformed dictionary, %@, for resource type, %@, the key %@ is missing.", v3, v4, v5, v6, v7);
}

+ (void)getDedupeKeyForResourceData:type:error:.cold.3()
{
  OUTLINED_FUNCTION_6();
  uint64_t v3 = +[MOResource getStringTypeForResources:13];
  int v4 = 138413314;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint8_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  __int16 v10 = 2112;
  CFStringRef v11 = @"MOActivityMetaDataKeyStartDate";
  __int16 v12 = 2112;
  CFStringRef v13 = @"MOActivityMetaDataKeyEndDate";
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Malformed dictionary, %@, for resource type, %@, the one of the keys %@, %@, %@ is missing.", (uint8_t *)&v4, 0x34u);
}

+ (void)getDedupeKeyForResourceData:(uint64_t)a1 type:(NSObject *)a2 error:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = +[MOResource getStringTypeForResources:a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Dedupe key not available for this type, %@.", (uint8_t *)&v4, 0xCu);
}

@end