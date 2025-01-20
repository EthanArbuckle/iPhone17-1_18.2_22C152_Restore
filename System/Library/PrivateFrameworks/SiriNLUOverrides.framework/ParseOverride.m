@interface ParseOverride
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (ParseOverride)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation ParseOverride

- (BOOL)validateForInsert:(id *)a3
{
  return sub_225645E2C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ParseOverride.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_225645E2C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ParseOverride.validateForUpdate());
}

- (ParseOverride)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (ParseOverride *)ParseOverride.init(entity:insertInto:)(v5, a4);
}

@end