@interface MOOutlierMetadataMO
+ (id)fetchRequest;
+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation MOOutlierMetadataMO

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOOutlierMetadataMO alloc] initWithContext:v5];

  v8 = [v6 identifier];
  [(MOOutlierMetadataMO *)v7 setIdentifier:v8];

  v9 = [v6 updatedDate];
  [(MOOutlierMetadataMO *)v7 setUpdatedDate:v9];

  -[MOOutlierMetadataMO setIsSignificant:](v7, "setIsSignificant:", [v6 isSignificant]);
  [v6 outlierScore];
  -[MOOutlierMetadataMO setOutlierScore:](v7, "setOutlierScore:");
  [v6 outlierScoreThreshold];
  -[MOOutlierMetadataMO setOutlierScoreThreshold:](v7, "setOutlierScoreThreshold:");
  [v6 bundleGoodnessScore];
  -[MOOutlierMetadataMO setBundleGoodnessScore:](v7, "setBundleGoodnessScore:");
  [v6 bundleGoodnessScoreThreshold];
  double v11 = v10;

  [(MOOutlierMetadataMO *)v7 setBundleGoodnessScoreThreshold:v11];

  return v7;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOOutlierMetadataMO"];
}

@end