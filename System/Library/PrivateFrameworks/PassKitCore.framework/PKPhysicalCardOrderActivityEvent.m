@interface PKPhysicalCardOrderActivityEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)localizedReason;
- (PKPhysicalCardOrderActivityEvent)initWithCoder:(id)a3;
- (PKPhysicalCardOrderActivityEvent)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)activity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActivity:(unint64_t)a3;
- (void)setDate:(id)a3;
@end

@implementation PKPhysicalCardOrderActivityEvent

- (PKPhysicalCardOrderActivityEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKPhysicalCardOrderActivityEvent;
  v5 = [(PKPhysicalCardOrderActivityEvent *)&v24 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"activity"];
    v7 = v6;
    if (v6 != @"ordered")
    {
      if (v6)
      {
        char v8 = [@"ordered" isEqualToString:v6];

        if (v8) {
          goto LABEL_5;
        }
        v10 = v7;
        if (v10 == @"shipped"
          || (v11 = v10, char v12 = [@"shipped" isEqualToString:v10],
                         v11,
                         (v12 & 1) != 0))
        {
          uint64_t v9 = 2;
          goto LABEL_16;
        }
        v13 = v11;
        if (v13 == @"fixShippingAddress"
          || (v14 = v13,
              char v15 = [@"fixShippingAddress" isEqualToString:v13],
              v14,
              (v15 & 1) != 0))
        {
          uint64_t v9 = 3;
          goto LABEL_16;
        }
        v16 = v14;
        if (v16 == @"error"
          || (v17 = v16, int v18 = [@"error" isEqualToString:v16], v17, v18))
        {
          uint64_t v9 = 4;
          goto LABEL_16;
        }
      }
      uint64_t v9 = 0;
      goto LABEL_16;
    }
LABEL_5:
    uint64_t v9 = 1;
LABEL_16:

    v5->_activity = v9;
    uint64_t v19 = [v4 PKDateForKey:@"timestamp"];
    date = v5->_date;
    v5->_date = (NSDate *)v19;

    uint64_t v21 = [v4 PKStringForKey:@"localizedReason"];
    localizedReason = v5->_localizedReason;
    v5->_localizedReason = (NSString *)v21;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPhysicalCardOrderActivityEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPhysicalCardOrderActivityEvent;
  v5 = [(PKPhysicalCardOrderActivityEvent *)&v11 init];
  if (v5)
  {
    v5->_activity = [v4 decodeIntegerForKey:@"activity"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedReason"];
    localizedReason = v5->_localizedReason;
    v5->_localizedReason = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t activity = self->_activity;
  id v5 = a3;
  [v5 encodeInteger:activity forKey:@"activity"];
  [v5 encodeObject:self->_date forKey:@"timestamp"];
  [v5 encodeObject:self->_localizedReason forKey:@"localizedReason"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  date = self->_date;
  uint64_t v6 = (NSDate *)v4[2];
  if (date && v6)
  {
    if ((-[NSDate isEqual:](date, "isEqual:") & 1) == 0) {
      goto LABEL_15;
    }
  }
  else if (date != v6)
  {
LABEL_15:
    BOOL v12 = 0;
    goto LABEL_16;
  }
  v7 = (void *)v4[3];
  uint64_t v8 = self->_localizedReason;
  uint64_t v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_13;
  }
  v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_15;
  }
  BOOL v11 = [(NSString *)v8 isEqualToString:v9];

  if (!v11) {
    goto LABEL_15;
  }
LABEL_13:
  BOOL v12 = self->_activity == v4[1];
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_date];
  [v3 safelyAddObject:self->_localizedReason];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_activity - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  unint64_t activity = self->_activity;
  if (activity > 4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_1E56E2350[activity];
  }
  [v3 appendFormat:@"activity: '%@'; ", v6];
  v7 = [(NSDate *)self->_date description];
  [v4 appendFormat:@"date: '%@'; ", v7];

  [v4 appendFormat:@"localizedReason: '%@'; ", self->_localizedReason];
  [v4 appendFormat:@">"];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = +[PKPhysicalCardOrderActivityEvent allocWithZone:](PKPhysicalCardOrderActivityEvent, "allocWithZone:");
  v5->_unint64_t activity = self->_activity;
  uint64_t v6 = [(NSDate *)self->_date copyWithZone:a3];
  date = v5->_date;
  v5->_date = (NSDate *)v6;

  uint64_t v8 = [(NSString *)self->_localizedReason copyWithZone:a3];
  localizedReason = v5->_localizedReason;
  v5->_localizedReason = (NSString *)v8;

  return v5;
}

- (unint64_t)activity
{
  return self->_activity;
}

- (void)setActivity:(unint64_t)a3
{
  self->_unint64_t activity = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)localizedReason
{
  return self->_localizedReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedReason, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end