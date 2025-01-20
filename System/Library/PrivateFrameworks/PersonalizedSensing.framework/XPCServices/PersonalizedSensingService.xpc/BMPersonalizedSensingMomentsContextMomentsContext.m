@interface BMPersonalizedSensingMomentsContextMomentsContext
+ (id)toBiome:(id)a3;
@end

@implementation BMPersonalizedSensingMomentsContextMomentsContext

+ (id)toBiome:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = objc_msgSend(v3, "contextStrings", 0);
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[BMPersonalizedSensingMomentsContextMomentsContextString toBiome:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v11 = objc_alloc((Class)BMPersonalizedSensingMomentsContextMomentsContext);
  v12 = [v3 contextIdentifier];
  v13 = [v3 contextCreationTimestamp];
  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 associatedPatternType]);
  id v15 = [v11 initWithContextIdentifier:v12 contextStrings:v4 contextCreationTimestamp:v13 associatedPatternType:v14 metadataContentBitmap:&off_1000B6B58];

  return v15;
}

@end