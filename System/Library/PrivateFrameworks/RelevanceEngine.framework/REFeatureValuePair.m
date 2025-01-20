@interface REFeatureValuePair
- (BOOL)isEqual:(id)a3;
- (REFeature)feature;
- (REFeatureValuePair)initWithFeature:(id)a3 value:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)value;
- (void)dealloc;
@end

@implementation REFeatureValuePair

- (unint64_t)hash
{
  unint64_t v3 = [(REFeature *)self->_feature hash];
  return REFeatureValueHashForTaggedPointer(self->_value) ^ v3;
}

- (void).cxx_destruct
{
}

- (REFeature)feature
{
  return self->_feature;
}

- (unint64_t)value
{
  return self->_value;
}

- (REFeatureValuePair)initWithFeature:(id)a3 value:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REFeatureValuePair;
  v8 = [(REFeatureValuePair *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_feature, a3);
    v9->_value = a4;
    RERetainFeatureValueTaggedPointer((CFTypeRef)a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REFeatureValuePair *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      feature = self->_feature;
      id v7 = v5->_feature;
      if (feature == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = feature;
        BOOL v10 = [(REFeature *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_13;
        }
      }
      unint64_t value = self->_value;
      unint64_t v13 = v5->_value;
      if (value == v13)
      {
        char v11 = 1;
      }
      else
      {
        uint64_t v14 = REFeatureValueTypeForTaggedPointer(value);
        if (v14 != REFeatureValueTypeForTaggedPointer(v13))
        {
LABEL_13:
          char v11 = 0;
          goto LABEL_14;
        }
        v15 = REFeatureValueForTaggedPointer(value);
        v16 = REFeatureValueForTaggedPointer(v13);
        char v11 = [v15 isEqual:v16];
      }
LABEL_14:

      goto LABEL_15;
    }
    char v11 = 0;
  }
LABEL_15:

  return v11;
}

- (void)dealloc
{
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_value);
  v3.receiver = self;
  v3.super_class = (Class)REFeatureValuePair;
  [(REFeatureValuePair *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  feature = self->_feature;
  v6 = REDescriptionForTaggedPointer(self->_value);
  id v7 = [v3 stringWithFormat:@"<%p: %@> feature=%@, value=%@", self, v4, feature, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  feature = self->_feature;
  unint64_t value = self->_value;
  return (id)[v4 initWithFeature:feature value:value];
}

@end