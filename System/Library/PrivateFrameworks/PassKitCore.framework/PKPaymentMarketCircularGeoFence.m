@interface PKPaymentMarketCircularGeoFence
+ (BOOL)supportsSecureCoding;
- (BOOL)containsLocation:(id)a3;
- (PKPaymentMarketCircularGeoFence)init;
- (PKPaymentMarketCircularGeoFence)initWithCoder:(id)a3;
- (PKPaymentMarketCircularGeoFence)initWithDictionary:(id)a3;
- (double)distanceFromLocation:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentMarketCircularGeoFence

- (PKPaymentMarketCircularGeoFence)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentMarketCircularGeoFence;
  v2 = [(PKPaymentMarketCircularGeoFence *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;
  }
  return v2;
}

- (PKPaymentMarketCircularGeoFence)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKDictionaryForKey:@"Center"];
  objc_super v6 = [v5 PKNumberForKey:@"Latitude"];
  v7 = [v5 PKNumberForKey:@"Longitude"];
  v8 = [v4 PKNumberForKey:@"Radius"];

  v9 = 0;
  if (v6 && v7 && v8)
  {
    v10 = [(PKPaymentMarketCircularGeoFence *)self init];
    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1E5A8]);
      [v6 doubleValue];
      CLLocationDegrees v13 = v12;
      [v7 doubleValue];
      CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v13, v14);
      [v8 doubleValue];
      double v17 = v16;
      v18 = [(NSUUID *)v10->_identifier UUIDString];
      uint64_t v19 = objc_msgSend(v11, "initWithCenter:radius:identifier:", v18, v15.latitude, v15.longitude, v17);
      circle = v10->_circle;
      v10->_circle = (CLCircularRegion *)v19;
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (BOOL)containsLocation:(id)a3
{
  circle = self->_circle;
  [a3 coordinate];
  return -[CLCircularRegion containsCoordinate:](circle, "containsCoordinate:");
}

- (double)distanceFromLocation:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1E5F0];
  id v5 = a3;
  id v6 = [v4 alloc];
  [(CLCircularRegion *)self->_circle center];
  double v8 = v7;
  [(CLCircularRegion *)self->_circle center];
  v9 = objc_msgSend(v6, "initWithLatitude:longitude:", v8);
  [v9 distanceFromLocation:v5];
  double v11 = v10;

  return v11;
}

- (PKPaymentMarketCircularGeoFence)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentMarketCircularGeoFence;
  id v5 = [(PKPaymentMarketCircularGeoFence *)&v20 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"latitude"];
    CLLocationDegrees v7 = v6;
    [v4 decodeDoubleForKey:@"longitude"];
    CLLocationDegrees v9 = v8;
    [v4 decodeDoubleForKey:@"radius"];
    double v11 = v10;
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v7, v9);
    double v16 = [(NSUUID *)v5->_identifier UUIDString];
    uint64_t v17 = objc_msgSend(v14, "initWithCenter:radius:identifier:", v16, v15.latitude, v15.longitude, v11);
    circle = v5->_circle;
    v5->_circle = (CLCircularRegion *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  [(CLCircularRegion *)self->_circle center];
  objc_msgSend(v6, "encodeDouble:forKey:", @"latitude");
  [(CLCircularRegion *)self->_circle center];
  [v6 encodeDouble:@"longitude" forKey:v5];
  [(CLCircularRegion *)self->_circle radius];
  objc_msgSend(v6, "encodeDouble:forKey:", @"radius");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_circle, 0);
}

@end