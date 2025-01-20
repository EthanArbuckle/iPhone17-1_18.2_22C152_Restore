@interface PersonalizedItemAdornment
+ (id)defaultAdornment;
+ (id)reduceArrayOfAdornments:(id)a3;
- (id)combineAdornment:(id)a3;
@end

@implementation PersonalizedItemAdornment

+ (id)defaultAdornment
{
  return 0;
}

- (id)combineAdornment:(id)a3
{
  return 0;
}

+ (id)reduceArrayOfAdornments:(id)a3
{
  id v4 = a3;
  v5 = [a1 defaultAdornment];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v5 = [v11 combineAdornment:*(void *)(*((void *)&v13 + 1) + 8 * (void)v10) v13];

        v10 = (char *)v10 + 1;
        v11 = v5;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

@end