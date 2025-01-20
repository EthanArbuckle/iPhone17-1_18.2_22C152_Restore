@interface PCNewsSegmentation
+ (NSNumber)ageGroup;
+ (NSNumber)gender;
+ (id)_classProperties;
+ (id)segmentData;
+ (void)_updateGenderAndAgeGroupValues;
+ (void)addClientToSegments:(id)a3 replaceExisting:(BOOL)a4 privateSegment:(BOOL)a5;
@end

@implementation PCNewsSegmentation

+ (void)addClientToSegments:(id)a3 replaceExisting:(BOOL)a4 privateSegment:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(PCSupportRequester);
  [(PCSupportRequester *)v8 addClientToSegments:v7 replaceExisting:v6 privateSegment:v5];
}

+ (id)_classProperties
{
  if (qword_26AB31B88 != -1) {
    dispatch_once(&qword_26AB31B88, &unk_26D2A87E0);
  }
  v2 = (void *)qword_26AB31B80;
  return v2;
}

+ (NSNumber)ageGroup
{
  [a1 _updateGenderAndAgeGroupValues];
  v3 = [a1 _classProperties];
  v4 = [v3 objectForKey:@"ageGroup"];

  return (NSNumber *)v4;
}

+ (NSNumber)gender
{
  [a1 _updateGenderAndAgeGroupValues];
  v3 = [a1 _classProperties];
  v4 = [v3 objectForKey:@"gender"];

  return (NSNumber *)v4;
}

+ (id)segmentData
{
  return 0;
}

+ (void)_updateGenderAndAgeGroupValues
{
  id v7 = objc_alloc_init(PCSupportRequester);
  v3 = [(PCSupportRequester *)v7 fetchGenderAndAgeGroupData];
  v4 = [v3 objectForKey:@"gender"];
  BOOL v5 = [v3 objectForKey:@"ageGroup"];
  BOOL v6 = [a1 _classProperties];
  [v6 setValue:v4 forKey:@"gender"];
  [v6 setValue:v5 forKey:@"ageGroup"];
}

@end