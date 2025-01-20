@interface SPBeaconingKey
+ (BOOL)supportsSecureCoding;
- (NSData)key;
- (NSData)secondaryKey;
- (NSDateInterval)dateInterval;
- (SPBeaconingKey)initWithCoder:(id)a3;
- (SPBeaconingKey)initWithDateInterval:(id)a3 key:(id)a4;
- (SPBeaconingKey)initWithDateInterval:(id)a3 key:(id)a4 secondaryKey:(id)a5 primaryIndex:(unint64_t)a6 secondaryIndex:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)primaryIndex;
- (unint64_t)secondaryIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setKey:(id)a3;
- (void)setPrimaryIndex:(unint64_t)a3;
- (void)setSecondaryIndex:(unint64_t)a3;
- (void)setSecondaryKey:(id)a3;
@end

@implementation SPBeaconingKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconingKey)initWithDateInterval:(id)a3 key:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPBeaconingKey;
  v9 = [(SPBeaconingKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateInterval, a3);
    objc_storeStrong((id *)&v10->_key, a4);
  }

  return v10;
}

- (SPBeaconingKey)initWithDateInterval:(id)a3 key:(id)a4 secondaryKey:(id)a5 primaryIndex:(unint64_t)a6 secondaryIndex:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SPBeaconingKey;
  v16 = [(SPBeaconingKey *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_dateInterval, a3);
    objc_storeStrong((id *)&v17->_key, a4);
    objc_storeStrong((id *)&v17->_secondaryKey, a5);
    v17->_primaryIndex = a6;
    v17->_secondaryIndex = a7;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPBeaconingKey alloc];
  v5 = [(SPBeaconingKey *)self dateInterval];
  v6 = [(SPBeaconingKey *)self key];
  id v7 = [(SPBeaconingKey *)self secondaryKey];
  id v8 = [(SPBeaconingKey *)v4 initWithDateInterval:v5 key:v6 secondaryKey:v7 primaryIndex:[(SPBeaconingKey *)self primaryIndex] secondaryIndex:[(SPBeaconingKey *)self secondaryIndex]];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"dateInterval"];
  [v5 encodeObject:self->_key forKey:@"key"];
  [v5 encodeObject:self->_secondaryKey forKey:@"secondaryKey"];
  v6 = [NSNumber numberWithUnsignedLongLong:self->_primaryIndex];
  [v5 encodeObject:v6 forKey:@"primaryIndex"];

  id v7 = [NSNumber numberWithUnsignedLongLong:self->_secondaryIndex];
  [v5 encodeObject:v7 forKey:@"secondaryIndex"];
}

- (SPBeaconingKey)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  dateInterval = self->_dateInterval;
  self->_dateInterval = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  key = self->_key;
  self->_key = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryKey"];
  secondaryKey = self->_secondaryKey;
  self->_secondaryKey = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryIndex"];
  self->_primaryIndex = [v11 unsignedIntegerValue];

  objc_super v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryIndex"];

  self->_secondaryIndex = [v12 unsignedIntegerValue];
  return self;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SPBeaconingKey *)self dateInterval];
  v6 = [(SPBeaconingKey *)self key];
  id v7 = [(SPBeaconingKey *)self secondaryKey];
  id v8 = [v3 stringWithFormat:@"<%@: %p -- dateInterval: %@ key: %@ secondaryKey: %@ primaryIndex: %llu secondaryIndex: %llu>", v4, self, v5, v6, v7, -[SPBeaconingKey primaryIndex](self, "primaryIndex"), -[SPBeaconingKey secondaryIndex](self, "secondaryIndex")];

  return v8;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)secondaryKey
{
  return self->_secondaryKey;
}

- (void)setSecondaryKey:(id)a3
{
}

- (unint64_t)primaryIndex
{
  return self->_primaryIndex;
}

- (void)setPrimaryIndex:(unint64_t)a3
{
  self->_primaryIndex = a3;
}

- (unint64_t)secondaryIndex
{
  return self->_secondaryIndex;
}

- (void)setSecondaryIndex:(unint64_t)a3
{
  self->_secondaryIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryKey, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end