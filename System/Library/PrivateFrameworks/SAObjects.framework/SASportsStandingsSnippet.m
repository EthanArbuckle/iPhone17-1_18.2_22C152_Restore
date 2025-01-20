@interface SASportsStandingsSnippet
+ (id)standingsSnippet;
- (BOOL)showCardinalPositions;
- (NSArray)columns;
- (NSArray)entities;
- (NSArray)selectedEntities;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setColumns:(id)a3;
- (void)setEntities:(id)a3;
- (void)setSelectedEntities:(id)a3;
- (void)setShowCardinalPositions:(BOOL)a3;
@end

@implementation SASportsStandingsSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"StandingsSnippet";
}

+ (id)standingsSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)columns
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"columns"];
}

- (void)setColumns:(id)a3
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

- (NSArray)selectedEntities
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"selectedEntities", v3);
}

- (void)setSelectedEntities:(id)a3
{
}

- (BOOL)showCardinalPositions
{
  return AceObjectBoolForProperty(self, @"showCardinalPositions");
}

- (void)setShowCardinalPositions:(BOOL)a3
{
}

@end