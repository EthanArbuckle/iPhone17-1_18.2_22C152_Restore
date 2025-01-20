@interface PKCategoryVisualizationMagnitude
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)passUniqueIdentifier;
- (PKCategoryVisualizationMagnitude)initWithCoder:(id)a3;
- (double)magnitude;
- (int64_t)bucket;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBucket:(int64_t)a3;
- (void)setMagnitude:(double)a3;
- (void)setPassUniqueIdentifier:(id)a3;
@end

@implementation PKCategoryVisualizationMagnitude

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCategoryVisualizationMagnitude)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKCategoryVisualizationMagnitude;
  v5 = [(PKCategoryVisualizationMagnitude *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v6;

    v5->_bucket = [v4 decodeIntegerForKey:@"bucket"];
    [v4 decodeDoubleForKey:@"magnitude"];
    v5->_magnitude = v8;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKCategoryVisualizationMagnitude *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      passUniqueIdentifier = self->_passUniqueIdentifier;
      v7 = v5->_passUniqueIdentifier;
      if (passUniqueIdentifier && v7)
      {
        if ((-[NSString isEqual:](passUniqueIdentifier, "isEqual:") & 1) == 0) {
          goto LABEL_12;
        }
      }
      else if (passUniqueIdentifier != v7)
      {
        goto LABEL_12;
      }
      if (self->_bucket == v5->_bucket)
      {
        BOOL v8 = self->_magnitude == v5->_magnitude;
LABEL_13:

        goto LABEL_14;
      }
LABEL_12:
      BOOL v8 = 0;
      goto LABEL_13;
    }
    BOOL v8 = 0;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_passUniqueIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_bucket - v4 + 32 * v4;
  unint64_t v6 = (unint64_t)self->_magnitude - v5 + 32 * v5;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  passUniqueIdentifier = self->_passUniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:passUniqueIdentifier forKey:@"passUniqueIdentifier"];
  [v5 encodeInteger:self->_bucket forKey:@"bucket"];
  [v5 encodeDouble:@"magnitude" forKey:self->_magnitude];
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
}

- (int64_t)bucket
{
  return self->_bucket;
}

- (void)setBucket:(int64_t)a3
{
  self->_bucket = a3;
}

- (double)magnitude
{
  return self->_magnitude;
}

- (void)setMagnitude:(double)a3
{
  self->_magnitude = a3;
}

- (void).cxx_destruct
{
}

@end