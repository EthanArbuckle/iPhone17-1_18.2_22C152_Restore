@interface SASetHomeContext
- (BOOL)byPassServerFlow;
- (BOOL)requiresResponse;
- (NSArray)currentHomes;
- (NSArray)entities;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setByPassServerFlow:(BOOL)a3;
- (void)setCurrentHomes:(id)a3;
- (void)setEntities:(id)a3;
@end

@implementation SASetHomeContext

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetHomeContext";
}

- (BOOL)byPassServerFlow
{
  return AceObjectBoolForProperty(self, @"byPassServerFlow");
}

- (void)setByPassServerFlow:(BOOL)a3
{
}

- (NSArray)currentHomes
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"currentHomes", v3);
}

- (void)setCurrentHomes:(id)a3
{
}

- (NSArray)entities
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"entities", v3);
}

- (void)setEntities:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end