@interface REMStructuredLocation
+ (BOOL)supportsSecureCoding;
+ (double)minimumRegionMonitoringDistance;
- (BOOL)isContentEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)mapKitHandle;
- (NSString)address;
- (NSString)contactLabel;
- (NSString)locationUID;
- (NSString)referenceFrameString;
- (NSString)routing;
- (NSString)title;
- (REMStructuredLocation)initWithCoder:(id)a3;
- (REMStructuredLocation)initWithTitle:(id)a3;
- (REMStructuredLocation)initWithTitle:(id)a3 locationUID:(id)a4;
- (REMStructuredLocation)initWithTitle:(id)a3 locationUID:(id)a4 latitude:(double)a5 longitude:(double)a6 radius:(double)a7 address:(id)a8 routing:(id)a9 referenceFrameString:(id)a10 contactLabel:(id)a11 mapKitHandle:(id)a12;
- (double)latitude;
- (double)longitude;
- (double)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)displayName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setContactLabel:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setMapKitHandle:(id)a3;
- (void)setRadius:(double)a3;
- (void)setReferenceFrameString:(id)a3;
- (void)setRouting:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation REMStructuredLocation

+ (double)minimumRegionMonitoringDistance
{
  return 100.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [REMStructuredLocation alloc];
  v5 = [(REMStructuredLocation *)self title];
  v6 = [(REMStructuredLocation *)self locationUID];
  [(REMStructuredLocation *)self latitude];
  double v8 = v7;
  [(REMStructuredLocation *)self longitude];
  double v10 = v9;
  [(REMStructuredLocation *)self radius];
  double v12 = v11;
  v13 = [(REMStructuredLocation *)self address];
  v14 = [(REMStructuredLocation *)self routing];
  v15 = [(REMStructuredLocation *)self referenceFrameString];
  v16 = [(REMStructuredLocation *)self contactLabel];
  v17 = [(REMStructuredLocation *)self mapKitHandle];
  v18 = [(REMStructuredLocation *)v4 initWithTitle:v5 locationUID:v6 latitude:v13 longitude:v14 radius:v15 address:v16 routing:v8 referenceFrameString:v10 contactLabel:v12 mapKitHandle:v17];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REMStructuredLocation *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v7 = [(REMStructuredLocation *)self locationUID];
      uint64_t v8 = [(REMStructuredLocation *)v6 locationUID];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        double v9 = (void *)v8;
        double v10 = [(REMStructuredLocation *)self locationUID];
        double v11 = [(REMStructuredLocation *)v6 locationUID];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      BOOL v13 = [(REMStructuredLocation *)self isContentEqual:v6];
      goto LABEL_9;
    }
LABEL_5:
    BOOL v13 = 0;
LABEL_9:

    goto LABEL_10;
  }
  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (BOOL)isContentEqual:(id)a3
{
  v4 = (REMStructuredLocation *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v7 = [(REMStructuredLocation *)self title];
      uint64_t v8 = [(REMStructuredLocation *)v6 title];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        double v9 = (void *)v8;
        double v10 = [(REMStructuredLocation *)self title];
        double v11 = [(REMStructuredLocation *)v6 title];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_25;
        }
      }
      [(REMStructuredLocation *)self latitude];
      double v15 = v14;
      [(REMStructuredLocation *)v6 latitude];
      if (vabdd_f64(v15, v16) >= 2.22044605e-16) {
        goto LABEL_25;
      }
      [(REMStructuredLocation *)self longitude];
      double v18 = v17;
      [(REMStructuredLocation *)v6 longitude];
      if (vabdd_f64(v18, v19) >= 2.22044605e-16) {
        goto LABEL_25;
      }
      [(REMStructuredLocation *)self radius];
      double v21 = v20;
      [(REMStructuredLocation *)v6 radius];
      if (vabdd_f64(v21, v22) >= 2.22044605e-16) {
        goto LABEL_25;
      }
      v23 = [(REMStructuredLocation *)self address];
      uint64_t v24 = [(REMStructuredLocation *)v6 address];
      if (v23 == (void *)v24)
      {
      }
      else
      {
        v25 = (void *)v24;
        v26 = [(REMStructuredLocation *)self address];
        v27 = [(REMStructuredLocation *)v6 address];
        int v28 = [v26 isEqual:v27];

        if (!v28) {
          goto LABEL_25;
        }
      }
      v29 = [(REMStructuredLocation *)self routing];
      uint64_t v30 = [(REMStructuredLocation *)v6 routing];
      if (v29 == (void *)v30)
      {
      }
      else
      {
        v31 = (void *)v30;
        v32 = [(REMStructuredLocation *)self routing];
        v33 = [(REMStructuredLocation *)v6 routing];
        int v34 = [v32 isEqual:v33];

        if (!v34) {
          goto LABEL_25;
        }
      }
      v35 = [(REMStructuredLocation *)self referenceFrameString];
      uint64_t v36 = [(REMStructuredLocation *)v6 referenceFrameString];
      if (v35 == (void *)v36)
      {
      }
      else
      {
        v37 = (void *)v36;
        v38 = [(REMStructuredLocation *)self referenceFrameString];
        v39 = [(REMStructuredLocation *)v6 referenceFrameString];
        int v40 = [v38 isEqual:v39];

        if (!v40) {
          goto LABEL_25;
        }
      }
      v41 = [(REMStructuredLocation *)self contactLabel];
      uint64_t v42 = [(REMStructuredLocation *)v6 contactLabel];
      if (v41 == (void *)v42)
      {
      }
      else
      {
        v43 = (void *)v42;
        v44 = [(REMStructuredLocation *)self contactLabel];
        v45 = [(REMStructuredLocation *)v6 contactLabel];
        int v46 = [v44 isEqual:v45];

        if (!v46) {
          goto LABEL_25;
        }
      }
      v48 = [(REMStructuredLocation *)self mapKitHandle];
      uint64_t v49 = [(REMStructuredLocation *)v6 mapKitHandle];
      if (v48 == (void *)v49)
      {
        char v13 = 1;
        v50 = v48;
      }
      else
      {
        v50 = (void *)v49;
        v51 = [(REMStructuredLocation *)self mapKitHandle];
        v52 = [(REMStructuredLocation *)v6 mapKitHandle];
        char v13 = [v51 isEqual:v52];
      }
      goto LABEL_26;
    }
LABEL_25:
    char v13 = 0;
LABEL_26:

    goto LABEL_27;
  }
  char v13 = 1;
LABEL_27:

  return v13;
}

- (unint64_t)hash
{
  v3 = [(REMStructuredLocation *)self title];
  uint64_t v4 = [v3 hash];

  v5 = [(REMStructuredLocation *)self locationUID];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  double v7 = [(REMStructuredLocation *)self address];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  double v9 = [(REMStructuredLocation *)self routing];
  uint64_t v10 = [v9 hash] - v8 + 32 * v8;

  double v11 = [(REMStructuredLocation *)self referenceFrameString];
  uint64_t v12 = [v11 hash] - v10 + 32 * v10;

  char v13 = [(REMStructuredLocation *)self contactLabel];
  uint64_t v14 = [v13 hash] - v12 + 32 * v12;

  double v15 = [(REMStructuredLocation *)self mapKitHandle];
  unint64_t v16 = [v15 hash] - v14 + 32 * v14;

  return v16;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMStructuredLocation *)self locationUID];
  uint64_t v6 = [v3 stringWithFormat:@"%@ {locationUID = %@}", v4, v5];

  return v6;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMStructuredLocation *)self title];
  [(REMStructuredLocation *)self latitude];
  uint64_t v7 = v6;
  [(REMStructuredLocation *)self longitude];
  uint64_t v9 = v8;
  [(REMStructuredLocation *)self radius];
  uint64_t v11 = v10;
  uint64_t v12 = [(REMStructuredLocation *)self locationUID];
  objc_msgSend(v3, "stringWithFormat:", @"%@ {title: %@; latlong: (%f, %f); radius: %f; locationUID = %@}",
    v4,
    v5,
    v7,
    v9,
    v11,
  char v13 = v12);

  return v13;
}

- (REMStructuredLocation)initWithTitle:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  uint64_t v6 = [v4 UUID];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = [(REMStructuredLocation *)self initWithTitle:v5 locationUID:v7];

  return v8;
}

- (REMStructuredLocation)initWithTitle:(id)a3 locationUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMStructuredLocation;
  uint64_t v9 = [(REMStructuredLocation *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_locationUID, a4);
  }

  return v10;
}

- (REMStructuredLocation)initWithTitle:(id)a3 locationUID:(id)a4 latitude:(double)a5 longitude:(double)a6 radius:(double)a7 address:(id)a8 routing:(id)a9 referenceFrameString:(id)a10 contactLabel:(id)a11 mapKitHandle:(id)a12
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a8;
  id v28 = a9;
  id v27 = a10;
  id v22 = a11;
  id v23 = a12;
  v32.receiver = self;
  v32.super_class = (Class)REMStructuredLocation;
  uint64_t v24 = [(REMStructuredLocation *)&v32 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_title, a3);
    objc_storeStrong((id *)&v25->_locationUID, a4);
    v25->_latitude = a5;
    v25->_longitude = a6;
    v25->_radius = a7;
    objc_storeStrong((id *)&v25->_address, a8);
    objc_storeStrong((id *)&v25->_routing, a9);
    objc_storeStrong((id *)&v25->_referenceFrameString, a10);
    objc_storeStrong((id *)&v25->_contactLabel, a11);
    objc_storeStrong((id *)&v25->_mapKitHandle, a12);
  }

  return v25;
}

- (id)displayName
{
  v3 = [(REMStructuredLocation *)self contactLabel];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = [(REMStructuredLocation *)self contactLabel];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v5];
    id v7 = [v6 host];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      id v9 = [v6 host];
    }
    else
    {
      id v9 = v5;
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = [(REMStructuredLocation *)self title];
  }

  return v10;
}

- (REMStructuredLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)REMStructuredLocation;
  id v5 = [(REMStructuredLocation *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    [v4 decodeDoubleForKey:@"latitude"];
    v5->_latitude = v8;
    [v4 decodeDoubleForKey:@"longitude"];
    v5->_longitude = v9;
    [v4 decodeDoubleForKey:@"radius"];
    v5->_radius = v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationUID"];
    locationUID = v5->_locationUID;
    v5->_locationUID = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
    address = v5->_address;
    v5->_address = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routing"];
    routing = v5->_routing;
    v5->_routing = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceFrameString"];
    referenceFrameString = v5->_referenceFrameString;
    v5->_referenceFrameString = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactLabel"];
    contactLabel = v5->_contactLabel;
    v5->_contactLabel = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapKitHandle"];
    mapKitHandle = v5->_mapKitHandle;
    v5->_mapKitHandle = (NSData *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMStructuredLocation *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  [(REMStructuredLocation *)self latitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"latitude");
  [(REMStructuredLocation *)self longitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"longitude");
  [(REMStructuredLocation *)self radius];
  objc_msgSend(v4, "encodeDouble:forKey:", @"radius");
  uint64_t v6 = [(REMStructuredLocation *)self locationUID];
  [v4 encodeObject:v6 forKey:@"locationUID"];

  id v7 = [(REMStructuredLocation *)self address];
  [v4 encodeObject:v7 forKey:@"address"];

  double v8 = [(REMStructuredLocation *)self routing];
  [v4 encodeObject:v8 forKey:@"routing"];

  double v9 = [(REMStructuredLocation *)self referenceFrameString];
  [v4 encodeObject:v9 forKey:@"referenceFrameString"];

  double v10 = [(REMStructuredLocation *)self contactLabel];
  [v4 encodeObject:v10 forKey:@"contactLabel"];

  id v11 = [(REMStructuredLocation *)self mapKitHandle];
  [v4 encodeObject:v11 forKey:@"mapKitHandle"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSString)routing
{
  return self->_routing;
}

- (void)setRouting:(id)a3
{
}

- (NSString)referenceFrameString
{
  return self->_referenceFrameString;
}

- (void)setReferenceFrameString:(id)a3
{
}

- (NSString)contactLabel
{
  return self->_contactLabel;
}

- (void)setContactLabel:(id)a3
{
}

- (NSData)mapKitHandle
{
  return self->_mapKitHandle;
}

- (void)setMapKitHandle:(id)a3
{
}

- (NSString)locationUID
{
  return self->_locationUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationUID, 0);
  objc_storeStrong((id *)&self->_mapKitHandle, 0);
  objc_storeStrong((id *)&self->_contactLabel, 0);
  objc_storeStrong((id *)&self->_referenceFrameString, 0);
  objc_storeStrong((id *)&self->_routing, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end