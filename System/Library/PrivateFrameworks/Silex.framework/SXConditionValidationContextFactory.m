@interface SXConditionValidationContextFactory
- (id)createContextWithLayoutOptions:(id)a3;
@end

@implementation SXConditionValidationContextFactory

- (id)createContextWithLayoutOptions:(id)a3
{
  id v3 = a3;
  v4 = [[SXConditionValidationContext alloc] initWithLayoutOptions:v3];

  return v4;
}

@end