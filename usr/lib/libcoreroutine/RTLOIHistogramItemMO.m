@interface RTLOIHistogramItemMO
+ (id)managedObjectWithLOIHistogramItem:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTLOIHistogramItemMO

+ (id)managedObjectWithLOIHistogramItem:(id)a3 inManagedObjectContext:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1C0A8];
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSManagedObject entityName];
  v9 = [v5 insertNewObjectForEntityForName:v8 inManagedObjectContext:v6];

  v10 = [v7 locationOfInterest];
  v11 = [v10 identifier];
  v12 = [v11 UUIDString];
  [v9 setLocationOfInterestIdentifier:v12];

  v13 = NSNumber;
  [v7 timeOfStay];
  v14 = [v13 numberWithDouble:];
  [v9 setTimeOfStay:v14];

  v15 = [NSNumber numberWithInteger:[v7 numOfEvents]];
  [v9 setNumOfEvents:v15];

  v16 = NSNumber;
  [v7 probability];
  double v18 = v17;

  v19 = [v16 numberWithDouble:v18];
  [v9 setProbability:v19];

  return v9;
}

@end