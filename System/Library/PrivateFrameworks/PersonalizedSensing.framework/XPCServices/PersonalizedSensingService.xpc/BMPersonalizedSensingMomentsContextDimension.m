@interface BMPersonalizedSensingMomentsContextDimension
+ (id)toBiome:(id)a3;
@end

@implementation BMPersonalizedSensingMomentsContextDimension

+ (id)toBiome:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)BMPersonalizedSensingMomentsContextDimension);
  v5 = [v3 name];
  v6 = [v3 queries];

  id v7 = [v4 initWithName:v5 queries:v6];
  return v7;
}

@end