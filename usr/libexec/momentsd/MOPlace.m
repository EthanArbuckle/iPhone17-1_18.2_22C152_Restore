@interface MOPlace
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MOPlace)initWithCoder:(id)a3;
- (MOPlace)initWithIdentifier:(id)a3;
- (MOPlace)initWithIdentifier:(id)a3 placeName:(id)a4 enclosingArea:(id)a5 placeType:(unint64_t)a6 placeUserType:(unint64_t)a7 location:(id)a8 locationMode:(unint64_t)a9 poiCategory:(id)a10 distanceToHomeInMiles:(double)a11 placeNameConfidence:(double)a12 familiarityIndexLOI:(double)a13 priorityScore:(double)a14 startDate:(id)a15 endDate:(id)a16;
- (MOPlace)initWithPlaceMO:(id)a3;
- (MOPlace)initWithPlaceName:(id)a3 enclosingArea:(id)a4 placeType:(unint64_t)a5 placeUserType:(unint64_t)a6 location:(id)a7 locationMode:(unint64_t)a8 poiCategory:(id)a9 distanceToHomeInMiles:(double)a10 placeNameConfidence:(double)a11 familiarityIndexLOI:(double)a12 startDate:(id)a13 endDate:(id)a14;
- (MOPlace)initWithPlaceName:(id)a3 placeType:(unint64_t)a4 placeUserType:(unint64_t)a5 location:(id)a6 locationMode:(unint64_t)a7 poiCategory:(id)a8 distanceToHomeInMiles:(double)a9 placeNameConfidence:(double)a10 familiarityIndexLOI:(double)a11;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)enclosingArea;
- (NSString)placeName;
- (NSString)poiCategory;
- (NSUUID)identifier;
- (NSUUID)sourceEventIdentifier;
- (RTLocation)location;
- (double)distanceToHomeInMiles;
- (double)familiarityIndexLOI;
- (double)placeNameConfidence;
- (double)priorityScore;
- (id)description;
- (id)promptDescription;
- (int64_t)sourceEventAccessType;
- (unint64_t)hash;
- (unint64_t)locationMode;
- (unint64_t)placeType;
- (unint64_t)placeUserType;
- (unint64_t)proposition;
- (void)encodeWithCoder:(id)a3;
- (void)setDistanceToHomeInMiles:(double)a3;
- (void)setEnclosingArea:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setFamiliarityIndexLOI:(double)a3;
- (void)setLocation:(id)a3;
- (void)setLocationMode:(unint64_t)a3;
- (void)setPlaceName:(id)a3;
- (void)setPlaceNameConfidence:(double)a3;
- (void)setPlaceType:(unint64_t)a3;
- (void)setPlaceUserType:(unint64_t)a3;
- (void)setPoiCategory:(id)a3;
- (void)setPriorityScore:(double)a3;
- (void)setProposition:(unint64_t)a3;
- (void)setSourceEventAccessType:(int64_t)a3;
- (void)setSourceEventIdentifier:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation MOPlace

- (MOPlace)initWithPlaceMO:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 range];
    if (v6 >= 0.0)
    {
      id v8 = objc_alloc((Class)RTLocation);
      [v5 latitude];
      double v10 = v9;
      [v5 longitude];
      double v12 = v11;
      [v5 range];
      id v34 = [v8 initWithLatitude:0 longitude:v10 horizontalUncertainty:v12 date:v13];
    }
    else
    {
      id v34 = 0;
    }
    v14 = [v5 identifier];
    v15 = [v5 name];
    v16 = [v5 cityName];
    id v33 = [v5 placeType];
    id v17 = [v5 userSpecificPlaceType];
    id v18 = [v5 locationMode];
    v19 = [v5 poiCategory];
    [v5 distanceToHomeInMiles];
    double v21 = v20;
    [v5 placeNameConfidence];
    double v23 = v22;
    [v5 familiarityIndexLOI];
    double v25 = v24;
    [v5 priorityScore];
    double v27 = v26;
    v28 = [v5 startDate];
    v29 = [v5 endDate];
    self = [(MOPlace *)self initWithIdentifier:v14 placeName:v15 enclosingArea:v16 placeType:v33 placeUserType:v17 location:v34 locationMode:v21 poiCategory:v23 distanceToHomeInMiles:v25 placeNameConfidence:v27 familiarityIndexLOI:v18 priorityScore:v19 startDate:v28 endDate:v29];

    -[MOPlace setProposition:](self, "setProposition:", [v5 proposition]);
    v30 = [v5 sourceEventIdentifier];

    if (v30)
    {
      v31 = [v5 sourceEventIdentifier];
      [(MOPlace *)self setSourceEventIdentifier:v31];
    }
    if ([v5 sourceEventAccessType]) {
      -[MOPlace setSourceEventAccessType:](self, "setSourceEventAccessType:", [v5 sourceEventAccessType]);
    }

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MOPlace)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOPlace initWithIdentifier:](v6);
    }

    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MOPlace.m" lineNumber:23 description:@"Invalid parameter not satisfying: identifier (in %s:%d)", "-[MOPlace initWithIdentifier:]", 23];
  }
  id v8 = [(MOPlace *)self initWithIdentifier:v5 placeName:&stru_1002D2AC8 enclosingArea:&stru_1002D2AC8 placeType:0 placeUserType:0 location:0 locationMode:-1.0 poiCategory:-1.0 distanceToHomeInMiles:0.0 placeNameConfidence:-1.0 familiarityIndexLOI:0 priorityScore:&stru_1002D2AC8 startDate:0 endDate:0];

  return v8;
}

- (MOPlace)initWithPlaceName:(id)a3 enclosingArea:(id)a4 placeType:(unint64_t)a5 placeUserType:(unint64_t)a6 location:(id)a7 locationMode:(unint64_t)a8 poiCategory:(id)a9 distanceToHomeInMiles:(double)a10 placeNameConfidence:(double)a11 familiarityIndexLOI:(double)a12 startDate:(id)a13 endDate:(id)a14
{
  id v23 = a14;
  id v24 = a13;
  id v25 = a9;
  id v26 = a7;
  id v27 = a4;
  id v28 = a3;
  v29 = +[NSUUID UUID];
  v30 = [(MOPlace *)self initWithIdentifier:v29 placeName:v28 enclosingArea:v27 placeType:a5 placeUserType:a6 location:v26 locationMode:a10 poiCategory:a11 distanceToHomeInMiles:a12 placeNameConfidence:-1.0 familiarityIndexLOI:a8 priorityScore:v25 startDate:v24 endDate:v23];

  return v30;
}

- (MOPlace)initWithPlaceName:(id)a3 placeType:(unint64_t)a4 placeUserType:(unint64_t)a5 location:(id)a6 locationMode:(unint64_t)a7 poiCategory:(id)a8 distanceToHomeInMiles:(double)a9 placeNameConfidence:(double)a10 familiarityIndexLOI:(double)a11
{
  id v20 = a8;
  id v21 = a6;
  id v22 = a3;
  id v23 = +[NSUUID UUID];
  id v24 = [(MOPlace *)self initWithIdentifier:v23 placeName:v22 enclosingArea:&stru_1002D2AC8 placeType:a4 placeUserType:a5 location:v21 locationMode:a9 poiCategory:a10 distanceToHomeInMiles:a11 placeNameConfidence:-1.0 familiarityIndexLOI:a7 priorityScore:v20 startDate:0 endDate:0];

  return v24;
}

- (MOPlace)initWithIdentifier:(id)a3 placeName:(id)a4 enclosingArea:(id)a5 placeType:(unint64_t)a6 placeUserType:(unint64_t)a7 location:(id)a8 locationMode:(unint64_t)a9 poiCategory:(id)a10 distanceToHomeInMiles:(double)a11 placeNameConfidence:(double)a12 familiarityIndexLOI:(double)a13 priorityScore:(double)a14 startDate:(id)a15 endDate:(id)a16
{
  id v25 = a3;
  id v26 = a4;
  id obj = a5;
  id v27 = a5;
  id v37 = a8;
  id v36 = a10;
  id v28 = a15;
  id v29 = a16;
  v38.receiver = self;
  v38.super_class = (Class)MOPlace;
  v30 = [(MOPlace *)&v38 init];
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_identifier, a3);
    v31->_placeUserType = a7;
    v31->_placeType = a6;
    objc_storeStrong((id *)&v31->_placeName, a4);
    objc_storeStrong((id *)&v31->_enclosingArea, obj);
    objc_storeStrong((id *)&v31->_location, a8);
    v31->_locationMode = a9;
    objc_storeStrong((id *)&v31->_poiCategory, a10);
    v31->_proposition = 0;
    v31->_familiarityIndexLOI = a13;
    v31->_distanceToHomeInMiles = a11;
    v31->_placeNameConfidence = a12;
    v31->_priorityScore = a14;
    objc_storeStrong((id *)&v31->_startDate, a15);
    objc_storeStrong((id *)&v31->_endDate, a16);
    v31->_sourceEventAccessType = 5;
  }

  return v31;
}

- (id)promptDescription
{
  v3 = [(MOPlace *)self placeName];

  if (v3)
  {
    unint64_t v4 = [(MOPlace *)self proposition];
    CFStringRef v5 = @"at";
    if (v4 == 2) {
      CFStringRef v5 = @"on";
    }
    if (v4 == 3) {
      CFStringRef v6 = @"in";
    }
    else {
      CFStringRef v6 = v5;
    }
    v7 = [(MOPlace *)self placeName];
    id v8 = +[NSString stringWithFormat:@"%@ %@", v6, v7];
  }
  else
  {
    id v8 = &stru_1002D2AC8;
  }

  return v8;
}

- (id)description
{
  v3 = [(MOPlace *)self identifier];
  unint64_t v4 = [(MOPlace *)self placeName];
  CFStringRef v5 = [v4 mask];
  [(MOPlace *)self placeNameConfidence];
  uint64_t v7 = v6;
  unint64_t v8 = [(MOPlace *)self placeType];
  unint64_t v9 = [(MOPlace *)self placeUserType];
  unint64_t v10 = [(MOPlace *)self proposition];
  unint64_t v11 = [(MOPlace *)self locationMode];
  [(MOPlace *)self distanceToHomeInMiles];
  uint64_t v13 = v12;
  v14 = [(MOPlace *)self poiCategory];
  [(MOPlace *)self familiarityIndexLOI];
  v16 = +[NSString stringWithFormat:@"<MOPlace identifier, %@, name, %@, confidence, %f, placeType, %lu, placeUserType, %lu, preposition, %lu, locationMode, %lu, distanceToHomeInMiles, %f, poiCategory, %@, familiarityIndexLOI, %f>", v3, v5, v7, v8, v9, v10, v11, v13, v14, v15];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOPlace)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeName"];
  id v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enclosingArea"];
  id v27 = [v4 decodeInt64ForKey:@"placeType"];
  id v26 = [v4 decodeInt64ForKey:@"placeUserType"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  id v25 = [v4 decodeInt64ForKey:@"proposition"];
  [v4 decodeFloatForKey:@"placeNameConfidence"];
  double v9 = v8;
  id v10 = [v4 decodeInt64ForKey:@"locationMode"];
  unint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"poiCategory"];
  [v4 decodeFloatForKey:@"distanceToHomeInMiles"];
  double v13 = v12;
  [v4 decodeFloatForKey:@"familiarityIndexLOI"];
  double v15 = v14;
  [v4 decodeFloatForKey:@"priorityScore"];
  double v17 = v16;
  id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  id v20 = (void *)v5;
  id v21 = [(MOPlace *)self initWithIdentifier:v5 placeName:v6 enclosingArea:v28 placeType:v27 placeUserType:v26 location:v7 locationMode:v13 poiCategory:v9 distanceToHomeInMiles:v15 placeNameConfidence:v17 familiarityIndexLOI:v10 priorityScore:v11 startDate:v18 endDate:v19];
  id v22 = v21;
  if (v21)
  {
    [(MOPlace *)v21 setProposition:v25];
    id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceEventIdentifier"];
    [(MOPlace *)v22 setSourceEventIdentifier:v23];

    -[MOPlace setSourceEventAccessType:](v22, "setSourceEventAccessType:", [v4 decodeInt64ForKey:@"sourceEventAccessType"]);
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v9 = a3;
  [v9 encodeObject:identifier forKey:@"identifier"];
  [v9 encodeObject:self->_placeName forKey:@"placeName"];
  [v9 encodeInt64:self->_placeType forKey:@"placeType"];
  [v9 encodeInt64:self->_placeUserType forKey:@"placeUserType"];
  [v9 encodeObject:self->_location forKey:@"location"];
  [v9 encodeInt64:self->_proposition forKey:@"proposition"];
  [v9 encodeInt64:self->_locationMode forKey:@"locationMode"];
  [v9 encodeObject:self->_poiCategory forKey:@"poiCategory"];
  double priorityScore = self->_priorityScore;
  *(float *)&double priorityScore = priorityScore;
  [v9 encodeFloat:@"priorityScore" forKey:priorityScore];
  double distanceToHomeInMiles = self->_distanceToHomeInMiles;
  *(float *)&double distanceToHomeInMiles = distanceToHomeInMiles;
  [v9 encodeFloat:@"distanceToHomeInMiles" forKey:distanceToHomeInMiles];
  double placeNameConfidence = self->_placeNameConfidence;
  *(float *)&double placeNameConfidence = placeNameConfidence;
  [v9 encodeFloat:@"placeNameConfidence" forKey:placeNameConfidence];
  double familiarityIndexLOI = self->_familiarityIndexLOI;
  *(float *)&double familiarityIndexLOI = familiarityIndexLOI;
  [v9 encodeFloat:@"familiarityIndexLOI" forKey:familiarityIndexLOI];
  [v9 encodeObject:self->_enclosingArea forKey:@"enclosingArea"];
  [v9 encodeObject:self->_startDate forKey:@"startDate"];
  [v9 encodeObject:self->_endDate forKey:@"endDate"];
  [v9 encodeInt64:self->_sourceEventAccessType forKey:@"sourceEventAccessType"];
  [v9 encodeObject:self->_sourceEventIdentifier forKey:@"sourceEventIdentifier"];
}

- (unint64_t)hash
{
  v2 = [(MOPlace *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (MOPlace *)a3;
  uint64_t v6 = v5;
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
        float v8 = [(MOPlace *)self identifier];
        if (v8 || ([(MOPlace *)v7 identifier], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v9 = [(MOPlace *)self identifier];
          id v10 = [(MOPlace *)v7 identifier];
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

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)placeUserType
{
  return self->_placeUserType;
}

- (void)setPlaceUserType:(unint64_t)a3
{
  self->_placeUserType = a3;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (void)setPlaceType:(unint64_t)a3
{
  self->_placeType = a3;
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceName:(id)a3
{
}

- (double)placeNameConfidence
{
  return self->_placeNameConfidence;
}

- (void)setPlaceNameConfidence:(double)a3
{
  self->_double placeNameConfidence = a3;
}

- (double)priorityScore
{
  return self->_priorityScore;
}

- (void)setPriorityScore:(double)a3
{
  self->_double priorityScore = a3;
}

- (RTLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (unint64_t)proposition
{
  return self->_proposition;
}

- (void)setProposition:(unint64_t)a3
{
  self->_proposition = a3;
}

- (unint64_t)locationMode
{
  return self->_locationMode;
}

- (void)setLocationMode:(unint64_t)a3
{
  self->_locationMode = a3;
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
}

- (double)familiarityIndexLOI
{
  return self->_familiarityIndexLOI;
}

- (void)setFamiliarityIndexLOI:(double)a3
{
  self->_double familiarityIndexLOI = a3;
}

- (double)distanceToHomeInMiles
{
  return self->_distanceToHomeInMiles;
}

- (void)setDistanceToHomeInMiles:(double)a3
{
  self->_double distanceToHomeInMiles = a3;
}

- (NSString)enclosingArea
{
  return self->_enclosingArea;
}

- (void)setEnclosingArea:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
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
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_enclosingArea, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_placeName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315394;
  v2 = "-[MOPlace initWithIdentifier:]";
  __int16 v3 = 1024;
  int v4 = 23;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end