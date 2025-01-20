@interface SXDataStringSortDescriptor
- (id)stringFromObject:(id)a3;
- (int64_t)compareObject:(id)a3 toObject:(id)a4;
@end

@implementation SXDataStringSortDescriptor

- (int64_t)compareObject:(id)a3 toObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SXDataStringSortDescriptor *)self key];
  v9 = [v7 valueForKey:v8];

  v10 = [(SXDataStringSortDescriptor *)self stringFromObject:v9];

  v11 = [(SXDataStringSortDescriptor *)self key];
  v12 = [v6 valueForKey:v11];

  v13 = [(SXDataStringSortDescriptor *)self stringFromObject:v12];

  if (v10)
  {
    if (v13)
    {
      if ([(SXDataStringSortDescriptor *)self ascending])
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

- (id)stringFromObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 valueForKey:@"text"];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

@end