@interface SPUnauthorizedTrackingObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)observedLocations;
- (NSDate)observedAt;
- (NSUUID)identifier;
- (SPUnauthorizedTrackingAdvertisement)trackingIdentifier;
- (SPUnauthorizedTrackingObservation)initWithAction:(int64_t)a3 type:(int64_t)a4 trackingIdentifier:(id)a5 observedLocations:(id)a6;
- (SPUnauthorizedTrackingObservation)initWithCoder:(id)a3;
- (SPUnauthorizedTrackingObservation)initWithCurrentAdvertisementAndLocationHistory:(id)a3 observedLocations:(id)a4;
- (id)description;
- (int64_t)action;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setObservedAt:(id)a3;
- (void)setObservedLocations:(id)a3;
- (void)setTrackingIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SPUnauthorizedTrackingObservation

- (SPUnauthorizedTrackingObservation)initWithCurrentAdvertisementAndLocationHistory:(id)a3 observedLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SPUnauthorizedTrackingObservation;
  v8 = [(SPUnauthorizedTrackingObservation *)&v13 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F29128] UUID];
    [(SPUnauthorizedTrackingObservation *)v8 setIdentifier:v9];

    [(SPUnauthorizedTrackingObservation *)v8 setAction:1];
    [(SPUnauthorizedTrackingObservation *)v8 setType:0];
    [(SPUnauthorizedTrackingObservation *)v8 setTrackingIdentifier:v6];
    [(SPUnauthorizedTrackingObservation *)v8 setObservedLocations:v7];
    v10 = [v7 lastObject];
    v11 = [v10 timestamp];
    [(SPUnauthorizedTrackingObservation *)v8 setObservedAt:v11];
  }
  return v8;
}

- (SPUnauthorizedTrackingObservation)initWithAction:(int64_t)a3 type:(int64_t)a4 trackingIdentifier:(id)a5 observedLocations:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SPUnauthorizedTrackingObservation;
  v12 = [(SPUnauthorizedTrackingObservation *)&v17 init];
  if (v12)
  {
    objc_super v13 = [MEMORY[0x1E4F29128] UUID];
    [(SPUnauthorizedTrackingObservation *)v12 setIdentifier:v13];

    [(SPUnauthorizedTrackingObservation *)v12 setAction:a3];
    [(SPUnauthorizedTrackingObservation *)v12 setType:a4];
    [(SPUnauthorizedTrackingObservation *)v12 setTrackingIdentifier:v10];
    [(SPUnauthorizedTrackingObservation *)v12 setObservedLocations:v11];
    v14 = [v11 lastObject];
    v15 = [v14 timestamp];
    [(SPUnauthorizedTrackingObservation *)v12 setObservedAt:v15];
  }
  return v12;
}

- (SPUnauthorizedTrackingObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  [(SPUnauthorizedTrackingObservation *)self setIdentifier:v5];

  -[SPUnauthorizedTrackingObservation setAction:](self, "setAction:", [v4 decodeIntegerForKey:@"action"]);
  -[SPUnauthorizedTrackingObservation setType:](self, "setType:", [v4 decodeIntegerForKey:@"type"]);
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingIdentifier"];
  [(SPUnauthorizedTrackingObservation *)self setTrackingIdentifier:v6];

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"observedLocations"];
  [(SPUnauthorizedTrackingObservation *)self setObservedLocations:v11];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"observedAt"];

  [(SPUnauthorizedTrackingObservation *)self setObservedAt:v12];
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SPUnauthorizedTrackingObservation *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(SPUnauthorizedTrackingObservation *)self action];
      if (v6 == [(SPUnauthorizedTrackingObservation *)v5 action])
      {
        id v7 = [(SPUnauthorizedTrackingObservation *)self trackingIdentifier];
        uint64_t v8 = [(SPUnauthorizedTrackingObservation *)v5 trackingIdentifier];
        if ([v7 isEqual:v8])
        {
          uint64_t v9 = [(SPUnauthorizedTrackingObservation *)self observedLocations];
          id v10 = [(SPUnauthorizedTrackingObservation *)v5 observedLocations];
          if ([v9 isEqualToArray:v10])
          {
            id v11 = [(SPUnauthorizedTrackingObservation *)self observedAt];
            v12 = [(SPUnauthorizedTrackingObservation *)v5 observedAt];
            char v13 = [v11 isEqualToDate:v12];
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(SPUnauthorizedTrackingObservation *)self trackingIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(SPUnauthorizedTrackingObservation *)self observedLocations];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(SPUnauthorizedTrackingObservation *)self observedAt];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPUnauthorizedTrackingObservation *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPUnauthorizedTrackingObservation action](self, "action"), @"action");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SPUnauthorizedTrackingObservation type](self, "type"), @"type");
  uint64_t v6 = [(SPUnauthorizedTrackingObservation *)self trackingIdentifier];
  [v4 encodeObject:v6 forKey:@"trackingIdentifier"];

  id v7 = [(SPUnauthorizedTrackingObservation *)self observedLocations];
  [v4 encodeObject:v7 forKey:@"observedLocations"];

  id v8 = [(SPUnauthorizedTrackingObservation *)self observedAt];
  [v4 encodeObject:v8 forKey:@"observedAt"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SPUnauthorizedTrackingObservation *)self identifier];
  v5 = [(SPUnauthorizedTrackingObservation *)self trackingIdentifier];
  uint64_t v6 = [v5 advertisementData];
  id v7 = objc_msgSend(v6, "fm_hexString");
  id v8 = [v3 stringWithFormat:@"SPUnauthorizedTrackingIdentifier %@ %@", v4, v7];

  return v8;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
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

- (SPUnauthorizedTrackingAdvertisement)trackingIdentifier
{
  return self->_trackingIdentifier;
}

- (void)setTrackingIdentifier:(id)a3
{
}

- (NSArray)observedLocations
{
  return self->_observedLocations;
}

- (void)setObservedLocations:(id)a3
{
}

- (NSDate)observedAt
{
  return self->_observedAt;
}

- (void)setObservedAt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedAt, 0);
  objc_storeStrong((id *)&self->_observedLocations, 0);
  objc_storeStrong((id *)&self->_trackingIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end