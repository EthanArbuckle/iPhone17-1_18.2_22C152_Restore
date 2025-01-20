@interface MOPlaceMO
+ (id)fetchRequest;
+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4;
- (id)clonedObjectWithContext:(id)a3;
@end

@implementation MOPlaceMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOPlaceMO"];
}

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOPlaceMO alloc] initWithContext:v5];

  v8 = [v6 identifier];
  [(MOPlaceMO *)v7 setIdentifier:v8];

  v9 = [v6 placeName];
  [(MOPlaceMO *)v7 setName:v9];

  v10 = [v6 location];
  [v10 latitude];
  -[MOPlaceMO setLatitude:](v7, "setLatitude:");

  v11 = [v6 location];
  [v11 longitude];
  -[MOPlaceMO setLongitude:](v7, "setLongitude:");

  v12 = [v6 location];
  [v12 horizontalUncertainty];
  -[MOPlaceMO setRange:](v7, "setRange:");

  -[MOPlaceMO setUserSpecificPlaceType:](v7, "setUserSpecificPlaceType:", [v6 placeUserType]);
  -[MOPlaceMO setProposition:](v7, "setProposition:", [v6 proposition]);
  -[MOPlaceMO setPlaceType:](v7, "setPlaceType:", [v6 placeType]);
  -[MOPlaceMO setLocationMode:](v7, "setLocationMode:", [v6 locationMode]);
  v13 = [v6 poiCategory];
  [(MOPlaceMO *)v7 setPoiCategory:v13];

  [v6 distanceToHomeInMiles];
  -[MOPlaceMO setDistanceToHomeInMiles:](v7, "setDistanceToHomeInMiles:");
  [v6 placeNameConfidence];
  -[MOPlaceMO setPlaceNameConfidence:](v7, "setPlaceNameConfidence:");
  [v6 familiarityIndexLOI];
  -[MOPlaceMO setFamiliarityIndexLOI:](v7, "setFamiliarityIndexLOI:");
  v14 = [v6 enclosingArea];
  [(MOPlaceMO *)v7 setCityName:v14];

  v15 = [v6 startDate];
  [(MOPlaceMO *)v7 setStartDate:v15];

  v16 = [v6 endDate];
  [(MOPlaceMO *)v7 setEndDate:v16];

  [v6 priorityScore];
  -[MOPlaceMO setPriorityScore:](v7, "setPriorityScore:");
  -[MOPlaceMO setSourceEventAccessType:](v7, "setSourceEventAccessType:", [v6 sourceEventAccessType]);
  v17 = [v6 sourceEventIdentifier];

  [(MOPlaceMO *)v7 setSourceEventIdentifier:v17];

  return v7;
}

- (id)clonedObjectWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [[MOPlace alloc] initWithPlaceMO:self];
  id v6 = +[MOPlaceMO managedObjectWithObject:v5 inManagedObjectContext:v4];

  return v6;
}

@end