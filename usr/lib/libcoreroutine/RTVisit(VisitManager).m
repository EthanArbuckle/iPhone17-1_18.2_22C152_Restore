@interface RTVisit(VisitManager)
- (uint64_t)initWithDefaultsDictionanry:()VisitManager;
@end

@implementation RTVisit(VisitManager)

- (uint64_t)initWithDefaultsDictionanry:()VisitManager
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"VisitIncidentDate"];
  v6 = (void *)MEMORY[0x1E4F5CFC8];
  v7 = [v4 objectForKey:@"VisitIncidentType"];
  uint64_t v8 = [v6 visitIncidentTypeFromString:v7];

  v9 = [v4 objectForKey:@"Latitude"];
  [v9 doubleValue];
  double v11 = v10;

  v12 = [v4 objectForKey:@"Longitude"];
  [v12 doubleValue];
  double v14 = v13;

  v15 = [v4 objectForKey:@"Uncertainty"];
  [v15 doubleValue];
  double v17 = v16;

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithLatitude:v5 longitude:v11 horizontalUncertainty:v14 date:v17];
  v19 = [v4 objectForKey:@"VisitIncidentEntryDate"];
  v20 = [v4 objectForKey:@"VisitIncidentExitDate"];
  v21 = [v4 objectForKey:@"Confidence"];

  [v21 doubleValue];
  double v23 = v22;

  uint64_t v24 = [a1 initWithDate:v5 type:v8 location:v18 entry:v19 exit:v20 dataPointCount:0 confidence:v23 placeInference:0];
  return v24;
}

@end