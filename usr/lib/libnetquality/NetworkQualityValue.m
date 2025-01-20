@interface NetworkQualityValue
+ (BOOL)supportsSecureCoding;
- (NSNumber)rating;
- (NSNumber)value;
- (NetworkQualityValue)init;
- (NetworkQualityValue)initWithCoder:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)confidence;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(int64_t)a3;
- (void)setRating:(id)a3;
- (void)setValue:(id)a3;
- (void)updateConfidence:(int64_t)a3;
@end

@implementation NetworkQualityValue

- (void)updateConfidence:(int64_t)a3
{
  if ([(NetworkQualityValue *)self confidence] < a3)
  {
    [(NetworkQualityValue *)self setConfidence:a3];
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(NetworkQualityValue);
  v5 = [(NetworkQualityValue *)self value];
  v6 = (void *)[v5 copy];
  [(NetworkQualityValue *)v4 setValue:v6];

  v7 = [(NetworkQualityValue *)self rating];
  v8 = (void *)[v7 copy];
  [(NetworkQualityValue *)v4 setRating:v8];

  [(NetworkQualityValue *)v4 setConfidence:[(NetworkQualityValue *)self confidence]];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NetworkQualityValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NetworkQualityValue;
  v5 = [(NetworkQualityValue *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rating"];
    rating = v5->_rating;
    v5->_rating = (NSNumber *)v8;

    v5->_confidence = [v4 decodeIntegerForKey:@"confidence"];
  }

  return v5;
}

- (NetworkQualityValue)init
{
  v8.receiver = self;
  v8.super_class = (Class)NetworkQualityValue;
  v2 = [(NetworkQualityValue *)&v8 init];
  if (v2)
  {
    v3 = (NSNumber *)objc_alloc_init(NSNumber);
    value = v2->_value;
    v2->_value = v3;

    v5 = (NSNumber *)objc_alloc_init(NSNumber);
    rating = v2->_rating;
    v2->_rating = v5;
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  value = self->_value;
  id v5 = a3;
  [v5 encodeObject:value forKey:@"value"];
  [v5 encodeObject:self->_rating forKey:@"rating"];
  [v5 encodeInteger:self->_confidence forKey:@"confidence"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: value=%@, rating=%@, confidence=%ld>", v5, self->_value, self->_rating, self->_confidence];

  return v6;
}

- (NSNumber)value
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setValue:(id)a3
{
}

- (NSNumber)rating
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRating:(id)a3
{
}

- (int64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int64_t)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rating, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end