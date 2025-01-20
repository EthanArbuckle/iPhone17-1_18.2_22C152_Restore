@interface RTVehicleEventHistoryMO
+ (id)managedObjectWithVehicleEvent:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTVehicleEventHistoryMO

+ (id)managedObjectWithVehicleEvent:(id)a3 inManagedObjectContext:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1C0A8];
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSManagedObject entityName];
  v9 = [v5 insertNewObjectForEntityForName:v8 inManagedObjectContext:v6];

  v10 = [v7 date];
  [v9 setDate:v10];

  v11 = NSNumber;
  v12 = [v7 location];
  [v12 latitude];
  v13 = [v11 numberWithDouble:x0];
  [v9 setLocLatitude:v13];

  v14 = NSNumber;
  v15 = [v7 location];
  [v15 longitude];
  v16 = [v14 numberWithDouble:x0];
  [v9 setLocLongitude:v16];

  v17 = NSNumber;
  v18 = [v7 location];
  [v18 horizontalUncertainty];
  v19 = [v17 numberWithDouble:x0];
  [v9 setLocUncertainty:v19];

  v20 = [v7 location];
  v21 = [v20 date];
  [v9 setLocDate:v21];

  v22 = [v7 identifier];

  v23 = [v22 UUIDString];
  [v9 setIdentifier:v23];

  return v9;
}

@end