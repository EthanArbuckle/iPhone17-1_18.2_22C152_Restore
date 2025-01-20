@interface SPSafeLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLLocation)location;
- (NSSet)associatedBeacons;
- (NSString)name;
- (NSUUID)identifier;
- (SPSafeLocation)initWithCoder:(id)a3;
- (SPSafeLocation)initWithIdentifier:(id)a3 type:(int64_t)a4 name:(id)a5 location:(id)a6 associatedBeacons:(id)a7 approvalState:(int64_t)a8;
- (SPSafeLocation)initWithType:(int64_t)a3 name:(id)a4 location:(id)a5 approvalState:(int64_t)a6;
- (double)altitude;
- (double)course;
- (double)courseAccuracy;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (double)speed;
- (double)speedAccuracy;
- (double)verticalAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)mutableSafeLocation;
- (int64_t)approvalState;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApprovalState:(int64_t)a3;
- (void)setAssociatedBeacons:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocation:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SPSafeLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPSafeLocation)initWithIdentifier:(id)a3 type:(int64_t)a4 name:(id)a5 location:(id)a6 associatedBeacons:(id)a7 approvalState:(int64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SPSafeLocation;
  v18 = [(SPSafeLocation *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    v19->_type = a4;
    objc_storeStrong((id *)&v19->_name, a5);
    objc_storeStrong((id *)&v19->_location, a6);
    v19->_approvalState = a8;
    objc_storeStrong((id *)&v19->_associatedBeacons, a7);
  }

  return v19;
}

- (SPSafeLocation)initWithType:(int64_t)a3 name:(id)a4 location:(id)a5 approvalState:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  v12 = objc_opt_new();
  v13 = objc_opt_new();
  id v14 = [(SPSafeLocation *)self initWithIdentifier:v12 type:a3 name:v11 location:v10 associatedBeacons:v13 approvalState:a6];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPSafeLocation *)a3;
  if (v4 == self)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SPSafeLocation *)self identifier];
      v7 = [(SPSafeLocation *)v5 identifier];
      if ([v6 isEqual:v7])
      {
        v8 = [(SPSafeLocation *)self name];
        v9 = [(SPSafeLocation *)v5 name];
        if ([v8 isEqual:v9])
        {
          id v10 = [(SPSafeLocation *)self location];
          id v11 = [(SPSafeLocation *)v5 location];
          [v10 distanceFromLocation:v11];
          if (v12 == 0.0)
          {
            uint64_t v13 = [(SPSafeLocation *)self associatedBeacons];
            uint64_t v14 = [(SPSafeLocation *)v5 associatedBeacons];
            v21 = (void *)v13;
            id v15 = (void *)v13;
            id v16 = (void *)v14;
            if ([v15 isEqual:v14]
              && (int64_t v20 = [(SPSafeLocation *)self type], v20 == [(SPSafeLocation *)v5 type]))
            {
              int64_t v17 = [(SPSafeLocation *)self approvalState];
              BOOL v18 = v17 == [(SPSafeLocation *)v5 approvalState];
            }
            else
            {
              BOOL v18 = 0;
            }
          }
          else
          {
            BOOL v18 = 0;
          }
        }
        else
        {
          BOOL v18 = 0;
        }
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  v3 = [(SPSafeLocation *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(SPSafeLocation *)self name];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SPSafeLocation *)self associatedBeacons];
  uint64_t v8 = [v7 hash];
  int64_t v9 = v6 ^ v8 ^ [(SPSafeLocation *)self type];
  unint64_t v10 = v9 ^ [(SPSafeLocation *)self approvalState];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [SPSafeLocation alloc];
  v5 = [(SPSafeLocation *)self identifier];
  int64_t v6 = [(SPSafeLocation *)self type];
  v7 = [(SPSafeLocation *)self name];
  uint64_t v8 = [(SPSafeLocation *)self location];
  int64_t v9 = [(SPSafeLocation *)self associatedBeacons];
  unint64_t v10 = [(SPSafeLocation *)v4 initWithIdentifier:v5 type:v6 name:v7 location:v8 associatedBeacons:v9 approvalState:[(SPSafeLocation *)self approvalState]];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPSafeLocation *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPSafeLocation type](self, "type"), @"type");
  int64_t v6 = [(SPSafeLocation *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  v7 = [(SPSafeLocation *)self location];
  [v4 encodeObject:v7 forKey:@"location"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPSafeLocation approvalState](self, "approvalState"), @"approvalState");
  id v8 = [(SPSafeLocation *)self associatedBeacons];
  [v4 encodeObject:v8 forKey:@"associatedBeacons"];
}

- (SPSafeLocation)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  self->_type = [v4 decodeIntegerForKey:@"type"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v7;

  int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  location = self->_location;
  self->_location = v9;

  self->_approvalState = [v4 decodeIntegerForKey:@"approvalState"];
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v13 = [v11 setWithArray:v12];
  uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"associatedBeacons"];

  associatedBeacons = self->_associatedBeacons;
  self->_associatedBeacons = v14;

  return self;
}

- (id)mutableSafeLocation
{
  v3 = [SPMutableSafeLocation alloc];
  id v4 = [(SPSafeLocation *)self identifier];
  int64_t v5 = [(SPSafeLocation *)self type];
  int64_t v6 = [(SPSafeLocation *)self name];
  v7 = [(SPSafeLocation *)self location];
  id v8 = [(SPSafeLocation *)self associatedBeacons];
  int64_t v9 = [(SPSafeLocation *)v3 initWithIdentifier:v4 type:v5 name:v6 location:v7 associatedBeacons:v8 approvalState:[(SPSafeLocation *)self approvalState]];

  return v9;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(SPSafeLocation *)self identifier];
  int64_t v6 = [(SPSafeLocation *)self location];
  [v6 coordinate];
  uint64_t v8 = v7;
  int64_t v9 = [(SPSafeLocation *)self location];
  [v9 coordinate];
  uint64_t v11 = v10;
  double v12 = [(SPSafeLocation *)self location];
  [v12 horizontalAccuracy];
  uint64_t v14 = v13;
  id v15 = [(SPSafeLocation *)self name];
  id v16 = [(SPSafeLocation *)self associatedBeacons];
  int64_t v17 = [v3 stringWithFormat:@"<%@: %p %@ loc: %f,%f (%f) n:%@ b:%@ a:%ld>", v4, self, v5, v8, v11, v14, v15, v16, -[SPSafeLocation approvalState](self, "approvalState")];

  return v17;
}

- (double)latitude
{
  v2 = [(SPSafeLocation *)self location];
  [v2 coordinate];
  double v4 = v3;

  return v4;
}

- (double)longitude
{
  v2 = [(SPSafeLocation *)self location];
  [v2 coordinate];
  double v4 = v3;

  return v4;
}

- (double)horizontalAccuracy
{
  v2 = [(SPSafeLocation *)self location];
  [v2 horizontalAccuracy];
  double v4 = v3;

  return v4;
}

- (double)altitude
{
  v2 = [(SPSafeLocation *)self location];
  [v2 altitude];
  double v4 = v3;

  return v4;
}

- (double)verticalAccuracy
{
  v2 = [(SPSafeLocation *)self location];
  [v2 verticalAccuracy];
  double v4 = v3;

  return v4;
}

- (double)speed
{
  v2 = [(SPSafeLocation *)self location];
  [v2 speed];
  double v4 = v3;

  return v4;
}

- (double)speedAccuracy
{
  v2 = [(SPSafeLocation *)self location];
  [v2 speedAccuracy];
  double v4 = v3;

  return v4;
}

- (double)course
{
  v2 = [(SPSafeLocation *)self location];
  [v2 course];
  double v4 = v3;

  return v4;
}

- (double)courseAccuracy
{
  v2 = [(SPSafeLocation *)self location];
  [v2 courseAccuracy];
  double v4 = v3;

  return v4;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int64_t)approvalState
{
  return self->_approvalState;
}

- (void)setApprovalState:(int64_t)a3
{
  self->_approvalState = a3;
}

- (NSSet)associatedBeacons
{
  return self->_associatedBeacons;
}

- (void)setAssociatedBeacons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedBeacons, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end