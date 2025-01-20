@interface PGGraphPropertylessEdge
- (BOOL)hasProperties;
- (BOOL)hasProperties:(id)a3;
- (id)propertyDictionary;
- (void)checkConsistencyOfProperties:(id)a3 withExtraPropertyKeys:(id)a4;
@end

@implementation PGGraphPropertylessEdge

- (void)checkConsistencyOfProperties:(id)a3 withExtraPropertyKeys:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  PGMethodForbiddenException(self, a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (BOOL)hasProperties
{
  return 0;
}

- (id)propertyDictionary
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (BOOL)hasProperties:(id)a3
{
  return [a3 count] == 0;
}

@end