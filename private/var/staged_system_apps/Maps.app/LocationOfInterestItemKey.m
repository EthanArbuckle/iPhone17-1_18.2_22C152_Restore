@interface LocationOfInterestItemKey
- (BOOL)isEqual:(id)a3;
- (LocationOfInterestItemKey)init;
- (LocationOfInterestItemKey)initWithLocationOfInterest:(id)a3;
- (MapsLocationOfInterest)locationOfInterest;
- (unint64_t)hash;
- (void)setLocationOfInterest:(id)a3;
@end

@implementation LocationOfInterestItemKey

- (LocationOfInterestItemKey)init
{
  return 0;
}

- (LocationOfInterestItemKey)initWithLocationOfInterest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LocationOfInterestItemKey;
  v6 = [(LocationOfInterestItemKey *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_locationOfInterest, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [(LocationOfInterestItemKey *)self locationOfInterest];
  v4 = [v3 identifier];
  id v5 = [(LocationOfInterestItemKey *)self locationOfInterest];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 identifier];
    id v8 = [v7 hash];
  }
  else
  {
    id v8 = v5;
  }

  return (unint64_t)v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LocationOfInterestItemKey *)a3;
  if (self == v4)
  {
    unsigned __int8 v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(LocationOfInterestItemKey *)v4 locationOfInterest];
      v6 = [(LocationOfInterestItemKey *)self locationOfInterest];
      uint64_t v7 = [v6 identifier];
      if (v7)
      {
        id v8 = (void *)v7;
        objc_super v9 = [v5 identifier];

        if (v9)
        {
          v10 = [(LocationOfInterestItemKey *)self locationOfInterest];
          v11 = [v10 identifier];
          v12 = [v5 identifier];
          unsigned __int8 v13 = [v11 isEqual:v12];

LABEL_10:
          goto LABEL_11;
        }
      }
      else
      {
      }
      v10 = [(LocationOfInterestItemKey *)self locationOfInterest];
      unsigned __int8 v13 = v10 == v5;
      goto LABEL_10;
    }
    unsigned __int8 v13 = 0;
  }
LABEL_11:

  return v13;
}

- (MapsLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end