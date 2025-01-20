@interface _REStringFeatureValue
+ (id)featureValueWithString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_REStringFeatureValue)initWithValue:(id)a3;
- (id)stringValue;
- (unint64_t)_integralFeatureValue;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation _REStringFeatureValue

- (unint64_t)hash
{
  return [(NSString *)self->_value hash];
}

+ (id)featureValueWithString:(id)a3
{
  id v3 = a3;
  v4 = [[_REStringFeatureValue alloc] initWithValue:v3];

  return v4;
}

- (_REStringFeatureValue)initWithValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REStringFeatureValue;
  v5 = [(_REStringFeatureValue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    value = v5->_value;
    v5->_value = (NSString *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (unint64_t)type
{
  return 3;
}

- (id)stringValue
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_REStringFeatureValue *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      value = self->_value;
      uint64_t v6 = v4->_value;
      v7 = value;
      v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSString *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)_integralFeatureValue
{
  return REHashString(self->_value);
}

@end