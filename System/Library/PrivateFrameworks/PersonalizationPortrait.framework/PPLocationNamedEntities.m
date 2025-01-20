@interface PPLocationNamedEntities
+ (BOOL)supportsSecureCoding;
- (CLLocation)location;
- (NSData)mapItem;
- (NSDate)date;
- (NSString)city;
- (NSString)country;
- (NSString)documentId;
- (NSString)locationName;
- (NSString)postalCode;
- (NSString)stateOrProvince;
- (NSString)streetAddress;
- (NSString)unstructuredLocationString;
- (PPLocationNamedEntities)initWithCoder:(id)a3;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCity:(id)a3;
- (void)setCountry:(id)a3;
- (void)setDate:(id)a3;
- (void)setDocumentId:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationName:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setScore:(double)a3;
- (void)setStateOrProvince:(id)a3;
- (void)setStreetAddress:(id)a3;
- (void)setUnstructuredLocationString:(id)a3;
@end

@implementation PPLocationNamedEntities

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_documentId, 0);
  objc_storeStrong((id *)&self->_unstructuredLocationString, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_stateOrProvince, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_streetAddress, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setMapItem:(id)a3
{
}

- (NSData)mapItem
{
  return self->_mapItem;
}

- (void)setDocumentId:(id)a3
{
}

- (NSString)documentId
{
  return self->_documentId;
}

- (double)score
{
  return self->_score;
}

- (void)setUnstructuredLocationString:(id)a3
{
}

- (NSString)unstructuredLocationString
{
  return self->_unstructuredLocationString;
}

- (void)setCountry:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setPostalCode:(id)a3
{
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setStateOrProvince:(id)a3
{
}

- (NSString)stateOrProvince
{
  return self->_stateOrProvince;
}

- (void)setCity:(id)a3
{
}

- (NSString)city
{
  return self->_city;
}

- (void)setStreetAddress:(id)a3
{
}

- (NSString)streetAddress
{
  return self->_streetAddress;
}

- (void)setLocationName:(id)a3
{
}

- (NSString)locationName
{
  return self->_locationName;
}

- (PPLocationNamedEntities)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PPLocationNamedEntities;
  v5 = [(PPLocationNamedEntities *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loc"];
    locationName = v5->_locationName;
    v5->_locationName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"str"];
    streetAddress = v5->_streetAddress;
    v5->_streetAddress = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cty"];
    city = v5->_city;
    v5->_city = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sta"];
    stateOrProvince = v5->_stateOrProvince;
    v5->_stateOrProvince = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pst"];
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cnt"];
    country = v5->_country;
    v5->_country = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uls"];
    unstructuredLocationString = v5->_unstructuredLocationString;
    v5->_unstructuredLocationString = (NSString *)v18;

    [v4 decodeDoubleForKey:@"sco"];
    v5->_score = v20;
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doc"];
    documentId = v5->_documentId;
    v5->_documentId = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mit"];
    mapItem = v5->_mapItem;
    v5->_mapItem = (NSData *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cll"];
    location = v5->_location;
    v5->_location = (CLLocation *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dat"];
    date = v5->_date;
    v5->_date = (NSDate *)v27;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  locationName = self->_locationName;
  id v5 = a3;
  [v5 encodeObject:locationName forKey:@"loc"];
  [v5 encodeObject:self->_streetAddress forKey:@"str"];
  [v5 encodeObject:self->_city forKey:@"cty"];
  [v5 encodeObject:self->_stateOrProvince forKey:@"sta"];
  [v5 encodeObject:self->_postalCode forKey:@"pst"];
  [v5 encodeObject:self->_country forKey:@"cnt"];
  [v5 encodeObject:self->_unstructuredLocationString forKey:@"uls"];
  [v5 encodeDouble:@"sco" forKey:self->_score];
  [v5 encodeObject:self->_documentId forKey:@"doc"];
  [v5 encodeObject:self->_mapItem forKey:@"mit"];
  [v5 encodeObject:self->_location forKey:@"cll"];
  [v5 encodeObject:self->_date forKey:@"dat"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_locationName copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_streetAddress copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_city copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_stateOrProvince copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_postalCode copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  uint64_t v16 = [(NSString *)self->_country copyWithZone:a3];
  v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  uint64_t v18 = [(NSString *)self->_unstructuredLocationString copyWithZone:a3];
  v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  *(double *)(v5 + 64) = self->_score;
  uint64_t v20 = [(NSString *)self->_documentId copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v20;

  uint64_t v22 = [(NSData *)self->_mapItem copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v22;

  uint64_t v24 = [(CLLocation *)self->_location copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v24;

  uint64_t v26 = [(NSDate *)self->_date copyWithZone:a3];
  uint64_t v27 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v26;

  return (id)v5;
}

- (void)setScore:(double)a3
{
  double v3 = fmax(a3, 0.0);
  if (v3 > 1.0) {
    double v3 = 1.0;
  }
  self->_score = v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end