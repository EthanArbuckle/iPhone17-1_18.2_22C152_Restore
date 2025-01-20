@interface _REConcreteFeature
- (BOOL)isEqual:(id)a3;
- (_REConcreteFeature)initWithName:(id)a3 featureType:(unint64_t)a4;
- (id)_rootFeatures;
- (id)copyWithZone:(_NSZone *)a3;
- (id)name;
- (int64_t)_bitCount;
- (unint64_t)featureType;
- (unint64_t)hash;
@end

@implementation _REConcreteFeature

- (unint64_t)hash
{
  return self->_featureType ^ [(NSString *)self->_name hash];
}

- (id)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REConcreteFeature *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (self->_featureType == v5->_featureType)
      {
        name = self->_name;
        v8 = v5->_name;
        v9 = name;
        v10 = v9;
        if (v9 == v8) {
          char v11 = 1;
        }
        else {
          char v11 = [(NSString *)v9 isEqual:v8];
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)_rootFeatures
{
  v2 = [[REFeatureSet alloc] initWithFeature:self];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  name = self->_name;
  unint64_t featureType = self->_featureType;
  return (id)[v4 initWithName:name featureType:featureType];
}

- (_REConcreteFeature)initWithName:(id)a3 featureType:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_REConcreteFeature;
  v7 = [(_REConcreteFeature *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_unint64_t featureType = a4;
  }

  return v7;
}

- (unint64_t)featureType
{
  return self->_featureType;
}

- (int64_t)_bitCount
{
  unint64_t featureType = self->_featureType;
  int64_t v3 = -1;
  if (featureType != 2) {
    int64_t v3 = 1;
  }
  if (featureType == 1) {
    return 64;
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
}

@end