@interface MOEventMO
+ (id)fetchRequest;
+ (id)managedObjectWithEvent:(id)a3 inManagedObjectContext:(id)a4;
+ (void)setPropertiesOfEventMO:(id)a3 withEvent:(id)a4;
- (id)clonedObjectWithContext:(id)a3;
@end

@implementation MOEventMO

+ (id)managedObjectWithEvent:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOEventMO alloc] initWithContext:v5];

  +[MOEventMO setPropertiesOfEventMO:v7 withEvent:v6];

  return v7;
}

+ (void)setPropertiesOfEventMO:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 eventIdentifier];
  [v6 setEventIdentifier:v7];

  v8 = [v5 startDate];
  [v6 setStartDate:v8];

  v9 = [v5 endDate];
  [v6 setEndDate:v9];

  v10 = [v5 creationDate];
  [v6 setCreationDate:v10];

  v11 = [v5 sourceCreationDate];
  [v6 setSourceCreationDate:v11];

  v12 = [v5 expirationDate];
  [v6 setExpirationDate:v12];

  v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 provider]);
  [v6 setProvider:v13];

  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 category]);
  [v6 setCategory:v14];

  v15 = [v5 identifierFromProvider];
  [v6 setIdentifierFromProvider:v15];

  v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 mode]);
  [v6 setMode:v16];

  [v6 setIsInvalid:[v5 isInvalid]];
  [v6 setIsHighConfidence:[v5 isHighConfidence]];
  v17 = [v5 trends];
  [v6 setTrends:v17];

  v18 = [v5 patterns];
  [v6 setPatterns:v18];

  [v6 setIsGatheringComplete:[v5 isGComplete]];
  v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 timeAtHomeSubType]);
  [v6 setTimeAtHomeSubType:v19];

  id v20 = [v5 rehydrationFailCount];
  id v21 = +[NSNumber numberWithUnsignedInteger:v20];
  [v6 setRehydrationFailCount:v21];
}

- (id)clonedObjectWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [[MOEvent alloc] initWithEventMO:self];
  id v6 = +[MOEventMO managedObjectWithEvent:v5 inManagedObjectContext:v4];

  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOEventMO"];
}

@end