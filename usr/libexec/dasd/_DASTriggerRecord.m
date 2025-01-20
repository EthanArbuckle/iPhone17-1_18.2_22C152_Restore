@interface _DASTriggerRecord
- (id)createTrigger:(id)a3 managedObjectContext:(id)a4;
- (id)entityName;
- (id)fetchOrCreateTrigger:(id)a3 managedObjectContext:(id)a4;
- (void)copyTrigger:(id)a3 toManagedObject:(id)a4;
@end

@implementation _DASTriggerRecord

- (id)entityName
{
  return @"Trigger";
}

- (id)createTrigger:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(_DASTriggerRecord *)self entityName];
  v9 = +[NSEntityDescription insertNewObjectForEntityForName:v8 inManagedObjectContext:v6];

  [(_DASTriggerRecord *)self copyTrigger:v7 toManagedObject:v9];

  return v9;
}

- (id)fetchOrCreateTrigger:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = objc_opt_new();
    v9 = [(_DASTriggerRecord *)self entityName];
    v10 = +[NSEntityDescription entityForName:v9 inManagedObjectContext:v7];
    [v8 setEntity:v10];

    v11 = +[NSPredicate predicateWithFormat:@"identifier == %@", v6];
    [v8 setPredicate:v11];

    uint64_t v15 = 0;
    v12 = [v7 executeFetchRequest:v8 error:&v15];
    v13 = [v12 lastObject];

    if (!v13)
    {
      v13 = [(_DASTriggerRecord *)self createTrigger:v6 managedObjectContext:v7];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)copyTrigger:(id)a3 toManagedObject:(id)a4
{
}

@end