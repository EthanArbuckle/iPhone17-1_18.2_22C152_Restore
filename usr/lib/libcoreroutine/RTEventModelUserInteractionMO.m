@interface RTEventModelUserInteractionMO
+ (id)managedObjectWithFeedback:(id)a3 interaction:(id)a4 locationOfInterestIdentifier:(id)a5 date:(id)a6 inManagedObjectContext:(id)a7;
@end

@implementation RTEventModelUserInteractionMO

+ (id)managedObjectWithFeedback:(id)a3 interaction:(id)a4 locationOfInterestIdentifier:(id)a5 date:(id)a6 inManagedObjectContext:(id)a7
{
  v11 = (void *)MEMORY[0x1E4F1C0A8];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = +[NSManagedObject entityName];
  v18 = [v11 insertNewObjectForEntityForName:v17 inManagedObjectContext:v12];

  [v18 setFeedback:v16];
  [v18 setInteraction:v15];

  [v18 setLocationOfInterestIdentifier:v14];
  [v18 setDate:v13];

  return v18;
}

@end