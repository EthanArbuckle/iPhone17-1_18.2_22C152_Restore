@interface BMPersonalizedSensingMomentsContextMomentsContextString
+ (id)toBiome:(id)a3;
@end

@implementation BMPersonalizedSensingMomentsContextMomentsContextString

+ (id)toBiome:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend(v3, "contextDimensions", 0);
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[BMPersonalizedSensingMomentsContextDimension toBiome:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v11 = objc_alloc((Class)BMPersonalizedSensingMomentsContextMomentsContextString);
  v12 = [v3 textString];
  v13 = [v3 stringIdentifier];
  id v14 = [v11 initWithTextString:v12 stringIdentifier:v13 dimensions:v4];

  return v14;
}

@end