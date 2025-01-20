@interface AEAnnotationGenericTextActivityItemProvider
- (BOOL)supportsActivityType:(id)a3;
@end

@implementation AEAnnotationGenericTextActivityItemProvider

- (BOOL)supportsActivityType:(id)a3
{
  id v3 = a3;
  v4 = +[IMActivity activityTypes];
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5 ^ 1;
}

@end