@interface PersonalizedItemClientFeatureIDAdornment
+ (PersonalizedItemClientFeatureIDAdornment)adornmentWithClientFeatureID:(unint64_t)a3;
+ (id)defaultAdornment;
- (PersonalizedItemClientFeatureIDAdornment)initWithClientFeatureID:(unint64_t)a3;
- (id)combineAdornment:(id)a3;
- (unint64_t)clientFeatureID;
@end

@implementation PersonalizedItemClientFeatureIDAdornment

- (id)combineAdornment:(id)a3
{
  id v4 = a3;
  if ([v4 clientFeatureID])
  {
    unint64_t clientFeatureID = self->_clientFeatureID;
    uint64_t v6 = objc_opt_class();
    if (clientFeatureID)
    {
      unint64_t v7 = self->_clientFeatureID;
      id v8 = (id)((unint64_t)[v4 clientFeatureID] ^ v7);
    }
    else
    {
      id v8 = [v4 clientFeatureID];
    }
    v9 = (void *)v6;
  }
  else
  {
    v9 = objc_opt_class();
    id v8 = self->_clientFeatureID;
  }
  v10 = [v9 adornmentWithClientFeatureID:v8];

  return v10;
}

- (unint64_t)clientFeatureID
{
  return self->_clientFeatureID;
}

+ (PersonalizedItemClientFeatureIDAdornment)adornmentWithClientFeatureID:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithClientFeatureID:a3];

  return (PersonalizedItemClientFeatureIDAdornment *)v3;
}

- (PersonalizedItemClientFeatureIDAdornment)initWithClientFeatureID:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PersonalizedItemClientFeatureIDAdornment;
  result = [(PersonalizedItemClientFeatureIDAdornment *)&v5 init];
  if (result) {
    result->_unint64_t clientFeatureID = a3;
  }
  return result;
}

+ (id)defaultAdornment
{
  return [a1 adornmentWithClientFeatureID:0];
}

@end