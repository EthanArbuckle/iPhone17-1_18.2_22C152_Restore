@interface SMSessionDestination
+ (BOOL)supportsSecureCoding;
+ (id)destinationTypeToString:(unint64_t)a3;
+ (unint64_t)convertPlaceTypeToDestinationType:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CLLocation)clLocation;
- (NSData)destinationMapItem;
- (RTLocation)location;
- (SMSessionDestination)initWithCLLocation:(id)a3 eta:(id)a4 radius:(double)a5 destinationType:(unint64_t)a6 destinationMapItem:(id)a7;
- (SMSessionDestination)initWithCoder:(id)a3;
- (SMSessionDestination)initWithDictionary:(id)a3;
- (SMSessionDestination)initWithLocation:(id)a3 eta:(id)a4 radius:(double)a5 destinationType:(unint64_t)a6 destinationMapItem:(id)a7;
- (SMSessionDestinationEta)eta;
- (double)radius;
- (id)description;
- (id)outputToDictionary;
- (unint64_t)destinationType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionDestination

- (SMSessionDestination)initWithCLLocation:(id)a3 eta:(id)a4 radius:(double)a5 destinationType:(unint64_t)a6 destinationMapItem:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  if ([v14 type] == 1) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  id v16 = objc_alloc(MEMORY[0x263F37EE8]);
  [v14 coordinate];
  double v18 = v17;
  [v14 coordinate];
  double v20 = v19;
  [v14 horizontalAccuracy];
  double v22 = v21;
  [v14 altitude];
  double v24 = v23;
  [v14 verticalAccuracy];
  double v26 = v25;
  v27 = [v14 timestamp];
  uint64_t v28 = [v14 referenceFrame];
  [v14 speed];
  double v30 = v29;

  v31 = (void *)[v16 initWithLatitude:v27 longitude:v28 horizontalUncertainty:v15 altitude:v18 verticalUncertainty:v20 date:v22 referenceFrame:v24 speed:v26 sourceAccuracy:v30];
  v32 = [(SMSessionDestination *)self initWithLocation:v31 eta:v13 radius:a6 destinationType:v12 destinationMapItem:a5];

  return v32;
}

- (SMSessionDestination)initWithLocation:(id)a3 eta:(id)a4 radius:(double)a5 destinationType:(unint64_t)a6 destinationMapItem:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SMSessionDestination;
  id v16 = [(SMSessionDestination *)&v19 init];
  double v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_location, a3);
    objc_storeStrong((id *)&v17->_eta, a4);
    v17->_radius = a5;
    v17->_destinationType = a6;
    objc_storeStrong((id *)&v17->_destinationMapItem, a7);
  }

  return v17;
}

- (CLLocation)clLocation
{
  id v3 = objc_alloc(MEMORY[0x263F00A50]);
  v4 = [(SMSessionDestination *)self location];
  [v4 latitude];
  CLLocationDegrees v6 = v5;
  v7 = [(SMSessionDestination *)self location];
  [v7 longitude];
  CLLocationCoordinate2D v9 = CLLocationCoordinate2DMake(v6, v8);
  v10 = [(SMSessionDestination *)self location];
  [v10 altitude];
  double v12 = v11;
  id v13 = [(SMSessionDestination *)self location];
  [v13 horizontalUncertainty];
  double v15 = v14;
  id v16 = [(SMSessionDestination *)self location];
  [v16 verticalUncertainty];
  double v18 = v17;
  objc_super v19 = [(SMSessionDestination *)self location];
  double v20 = [v19 date];
  double v21 = [(SMSessionDestination *)self location];
  double v22 = objc_msgSend(v3, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v20, objc_msgSend(v21, "referenceFrame"), v9.latitude, v9.longitude, v12, v15, v18);

  return (CLLocation *)v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionDestinationLocationKey"];
  CLLocationDegrees v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionDestinationEtaKey"];
  [v4 decodeDoubleForKey:@"__kSMSessionDestinationRadiusKey"];
  double v8 = v7;
  uint64_t v9 = [v4 decodeIntegerForKey:@"__kSMSessionDestinationDestinationTypeKey"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionDestinationDestinationMapItem"];

  double v11 = [(SMSessionDestination *)self initWithLocation:v5 eta:v6 radius:v9 destinationType:v10 destinationMapItem:v8];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(SMSessionDestination *)self location];
  [v4 encodeObject:v5 forKey:@"__kSMSessionDestinationLocationKey"];

  CLLocationDegrees v6 = [(SMSessionDestination *)self eta];
  [v4 encodeObject:v6 forKey:@"__kSMSessionDestinationEtaKey"];

  [(SMSessionDestination *)self radius];
  objc_msgSend(v4, "encodeDouble:forKey:", @"__kSMSessionDestinationRadiusKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionDestination destinationType](self, "destinationType"), @"__kSMSessionDestinationDestinationTypeKey");
  id v7 = [(SMSessionDestination *)self destinationMapItem];
  [v4 encodeObject:v7 forKey:@"__kSMSessionDestinationDestinationMapItem"];
}

- (unint64_t)hash
{
  id v3 = [(SMSessionDestination *)self location];
  uint64_t v4 = [v3 hash];
  double v5 = [(SMSessionDestination *)self eta];
  uint64_t v6 = [v5 hash] ^ v4;
  [(SMSessionDestination *)self radius];
  unint64_t v8 = (unint64_t)v7;
  unint64_t v9 = v6 ^ [(SMSessionDestination *)self destinationType];
  v10 = [(SMSessionDestination *)self destinationMapItem];
  unint64_t v11 = v9 ^ [v10 hash] ^ v8;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SMSessionDestination *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      uint64_t v6 = [(SMSessionDestination *)self location];
      [v6 latitude];
      double v8 = v7;
      unint64_t v9 = [(SMSessionDestination *)v5 location];
      [v9 latitude];
      double v11 = v10;
      if (v8 != v10)
      {
        v47 = [(SMSessionDestination *)self location];
        [v47 latitude];
        double v13 = v12;
        double v14 = [(SMSessionDestination *)v5 location];
        [v14 latitude];
        if (vabdd_f64(v13, v15) >= 2.22044605e-16)
        {
          char v16 = 0;
          goto LABEL_29;
        }
        v46 = v14;
      }
      double v17 = [(SMSessionDestination *)self location];
      [v17 longitude];
      double v19 = v18;
      double v20 = [(SMSessionDestination *)v5 location];
      [v20 longitude];
      double v22 = v21;
      if (v19 != v21)
      {
        double v23 = [(SMSessionDestination *)self location];
        [v23 longitude];
        double v25 = v24;
        double v26 = [(SMSessionDestination *)v5 location];
        [v26 longitude];
        if (vabdd_f64(v25, v27) >= 2.22044605e-16)
        {
          char v16 = 0;
LABEL_27:

LABEL_28:
          double v14 = v46;
          if (v8 == v11)
          {
LABEL_30:

            goto LABEL_31;
          }
LABEL_29:

          goto LABEL_30;
        }
        v44 = v26;
        v45 = v23;
      }
      uint64_t v28 = [(SMSessionDestination *)self eta];
      double v29 = [(SMSessionDestination *)v5 eta];
      if (v28 == v29)
      {
        v43 = v17;
      }
      else
      {
        double v30 = [(SMSessionDestination *)self eta];
        v41 = [(SMSessionDestination *)v5 eta];
        v42 = v30;
        if (![v30 isEqual:v41])
        {
          char v16 = 0;
          goto LABEL_25;
        }
        v43 = v17;
      }
      [(SMSessionDestination *)self radius];
      double v32 = v31;
      [(SMSessionDestination *)v5 radius];
      if (v32 == v33
        && (unint64_t v34 = [(SMSessionDestination *)self destinationType],
            v34 == [(SMSessionDestination *)v5 destinationType]))
      {
        v35 = [(SMSessionDestination *)self destinationMapItem];
        uint64_t v36 = [(SMSessionDestination *)v5 destinationMapItem];
        if (v35 == (void *)v36)
        {

          char v16 = 1;
        }
        else
        {
          v40 = (void *)v36;
          v39 = [(SMSessionDestination *)self destinationMapItem];
          v37 = [(SMSessionDestination *)v5 destinationMapItem];
          char v16 = [v39 isEqual:v37];
        }
      }
      else
      {
        char v16 = 0;
      }
      double v17 = v43;
      if (v28 == v29)
      {
LABEL_26:

        double v26 = v44;
        double v23 = v45;
        if (v19 == v22) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
LABEL_25:

      goto LABEL_26;
    }
    char v16 = 0;
  }
LABEL_31:

  return v16;
}

- (SMSessionDestination)initWithDictionary:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F37EE8];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithDictionary:v5];
  double v7 = [[SMSessionDestinationEta alloc] initWithDictionary:v5];
  double v8 = [v5 valueForKey:@"__kSMSessionDestinationRadiusKey"];
  [v8 doubleValue];
  double v10 = v9;

  double v11 = [v5 valueForKey:@"__kSMSessionDestinationDestinationTypeKey"];
  uint64_t v12 = [v11 integerValue];

  double v13 = [v5 valueForKey:@"__kSMSessionDestinationDestinationMapItem"];

  double v14 = [(SMSessionDestination *)self initWithLocation:v6 eta:v7 radius:v12 destinationType:v13 destinationMapItem:v10];
  return v14;
}

- (id)outputToDictionary
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(SMSessionDestination *)self location];
  id v5 = [v4 outputToDictionary];
  [v3 addEntriesFromDictionary:v5];

  uint64_t v6 = NSNumber;
  [(SMSessionDestination *)self radius];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKey:@"__kSMSessionDestinationRadiusKey"];

  double v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionDestination destinationType](self, "destinationType"));
  [v3 setObject:v8 forKey:@"__kSMSessionDestinationDestinationTypeKey"];

  double v9 = [(SMSessionDestination *)self destinationMapItem];
  [v3 setObject:v9 forKey:@"__kSMSessionDestinationDestinationMapItem"];

  double v10 = [(SMSessionDestination *)self eta];

  if (v10)
  {
    double v11 = [(SMSessionDestination *)self eta];
    uint64_t v12 = [v11 outputToDictionary];
    [v3 addEntriesFromDictionary:v12];
  }
  return v3;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = [(SMSessionDestination *)self location];
  [v4 latitude];
  uint64_t v6 = v5;
  double v7 = [(SMSessionDestination *)self location];
  [v7 longitude];
  uint64_t v9 = v8;
  double v10 = [(SMSessionDestination *)self location];
  [v10 horizontalUncertainty];
  uint64_t v12 = v11;
  double v13 = [(SMSessionDestination *)self location];
  uint64_t v14 = [v13 referenceFrame];
  [(SMSessionDestination *)self radius];
  uint64_t v16 = v15;
  double v17 = [(SMSessionDestination *)self eta];
  double v18 = objc_msgSend((id)objc_opt_class(), "destinationTypeToString:", -[SMSessionDestination destinationType](self, "destinationType"));
  double v19 = [(SMSessionDestination *)self destinationMapItem];
  double v20 = [v3 stringWithFormat:@"location, <%.8f, %.8f> +/- %.2f, referenceFrame %d, radius, %.3f, eta, %@, destinationType, %@, destinationMapItem, %lu", v6, v9, v12, v14, v16, v17, v18, objc_msgSend(v19, "length")];

  return v20;
}

+ (id)destinationTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"unknown";
  }
  else {
    return off_265499650[a3 - 1];
  }
}

+ (unint64_t)convertPlaceTypeToDestinationType:(unint64_t)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return qword_25B75E4E8[a3];
  }
}

- (RTLocation)location
{
  return self->_location;
}

- (SMSessionDestinationEta)eta
{
  return self->_eta;
}

- (double)radius
{
  return self->_radius;
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (NSData)destinationMapItem
{
  return self->_destinationMapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
  objc_storeStrong((id *)&self->_eta, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end