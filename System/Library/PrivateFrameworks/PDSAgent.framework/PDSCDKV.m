@interface PDSCDKV
+ (id)fetchRequest;
+ (id)insertIntoManagedObjectContext:(id)a3;
+ (id)predicateForKey:(id)a3;
@end

@implementation PDSCDKV

+ (id)insertIntoManagedObjectContext:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF240];
  id v5 = a3;
  v6 = [v4 entityForName:@"PDSCDKV" inManagedObjectContext:v5];
  v7 = (void *)[objc_alloc((Class)a1) initWithEntity:v6 insertIntoManagedObjectContext:v5];

  return v7;
}

+ (id)predicateForKey:(id)a3
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"key == %@", a3];
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"PDSCDKV"];
}

@end