@interface SXDataNumberSortDescriptor
- (id)numberForObject:(id)a3;
- (int64_t)compareObject:(id)a3 toObject:(id)a4;
@end

@implementation SXDataNumberSortDescriptor

- (int64_t)compareObject:(id)a3 toObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SXDataNumberSortDescriptor *)self key];
  v9 = [v7 valueForKey:v8];

  v10 = [(SXDataNumberSortDescriptor *)self numberForObject:v9];

  v11 = [(SXDataNumberSortDescriptor *)self key];
  v12 = [v6 valueForKey:v11];

  v13 = [(SXDataNumberSortDescriptor *)self numberForObject:v12];

  if (v10)
  {
    if (v13)
    {
      if ([(SXDataNumberSortDescriptor *)self ascending])
      {
        v14 = v10;
        v15 = v13;
      }
      else
      {
        v14 = v13;
        v15 = v10;
      }
      int64_t v16 = [v14 compare:v15];
    }
    else
    {
      int64_t v16 = -1;
    }
  }
  else
  {
    int64_t v16 = 1;
  }

  return v16;
}

- (id)numberForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end