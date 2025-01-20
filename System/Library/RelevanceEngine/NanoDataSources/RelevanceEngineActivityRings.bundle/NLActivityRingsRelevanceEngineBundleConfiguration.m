@interface NLActivityRingsRelevanceEngineBundleConfiguration
- (Class)dataSourceClassForKey:(id)a3;
@end

@implementation NLActivityRingsRelevanceEngineBundleConfiguration

- (Class)dataSourceClassForKey:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:RESampleDataSourceKey] & 1) != 0
    || [v3 isEqualToString:REPrimaryDataSourceKey])
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

@end