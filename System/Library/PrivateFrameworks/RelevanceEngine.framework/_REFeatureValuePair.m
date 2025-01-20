@interface _REFeatureValuePair
- (BOOL)isEqual:(id)a3;
- (NSArray)rootFeatures;
- (REFeature)feature;
- (_REFeatureValuePair)initWithFeature:(id)a3 value:(unint64_t)a4 index:(unint64_t)a5 rootFeatures:(id)a6;
- (unint64_t)hash;
- (unint64_t)index;
- (unint64_t)value;
- (void)dealloc;
@end

@implementation _REFeatureValuePair

- (_REFeatureValuePair)initWithFeature:(id)a3 value:(unint64_t)a4 index:(unint64_t)a5 rootFeatures:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_REFeatureValuePair;
  v13 = [(_REFeatureValuePair *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_feature, a3);
    v14->_value = a4;
    RERetainFeatureValueTaggedPointer((CFTypeRef)a4);
    v14->_index = a5;
    objc_storeStrong((id *)&v14->_rootFeatures, a6);
  }

  return v14;
}

- (void)dealloc
{
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_value);
  v3.receiver = self;
  v3.super_class = (Class)_REFeatureValuePair;
  [(_REFeatureValuePair *)&v3 dealloc];
}

- (unint64_t)hash
{
  unint64_t v3 = [(REFeature *)self->_feature hash];
  return REFeatureValueHashForTaggedPointer(self->_value) ^ v3 ^ self->_index;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REFeatureValuePair *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      feature = self->_feature;
      v7 = v5->_feature;
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
      if (value == v13) {
        goto LABEL_10;
      }
      uint64_t v14 = REFeatureValueTypeForTaggedPointer(self->_value);
      if (v14 == REFeatureValueTypeForTaggedPointer(v13))
      {
        v15 = REFeatureValueForTaggedPointer(value);
        objc_super v16 = REFeatureValueForTaggedPointer(v13);
        int v17 = [v15 isEqual:v16];

        if (v17)
        {
LABEL_10:
          BOOL v11 = self->_index == v5->_index;
LABEL_14:

          goto LABEL_15;
        }
      }
LABEL_13:
      BOOL v11 = 0;
      goto LABEL_14;
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (REFeature)feature
{
  return self->_feature;
}

- (unint64_t)value
{
  return self->_value;
}

- (unint64_t)index
{
  return self->_index;
}

- (NSArray)rootFeatures
{
  return self->_rootFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFeatures, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

@end