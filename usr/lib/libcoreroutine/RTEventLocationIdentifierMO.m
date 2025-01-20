@interface RTEventLocationIdentifierMO
+ (id)managedObjectWithEventLocationIdentifier:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTEventLocationIdentifierMO

+ (id)managedObjectWithEventLocationIdentifier:(id)a3 inManagedObjectContext:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1C0A8];
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSManagedObject entityName];
  v9 = [v5 insertNewObjectForEntityForName:v8 inManagedObjectContext:v6];

  v10 = [v7 name];
  [v9 setName:v10];

  v11 = [NSNumber numberWithUnsignedInteger:[v7 source]];
  [v9 setSource:v11];

  v12 = [v7 calendarIdentifier];

  [v9 setCalendarIdentifier:v12];

  return v9;
}

@end