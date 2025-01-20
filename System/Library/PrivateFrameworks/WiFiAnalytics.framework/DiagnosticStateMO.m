@interface DiagnosticStateMO
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateInstance:(id)a3;
@end

@implementation DiagnosticStateMO

+ (id)entityName
{
  return @"DiagnosticState";
}

+ (id)generateInstance:(id)a3
{
  id v3 = a3;
  v4 = +[DiagnosticStateMO entityName];
  v5 = +[AnalyticsStoreProxy createEntity:v4 moc:v3];

  return v5;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DiagnosticState"];
}

@end