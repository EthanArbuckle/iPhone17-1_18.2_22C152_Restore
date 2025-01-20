@interface REMCDAlarmLocationTrigger
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
- (id)modelObject;
@end

@implementation REMCDAlarmLocationTrigger

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMAlarmLocationTrigger cdEntityName];
}

- (id)modelObject
{
  id v3 = objc_alloc_init((Class)REMStructuredLocation);
  v4 = [(REMCDAlarmLocationTrigger *)self title];
  [v3 setTitle:v4];

  [(REMCDAlarmLocationTrigger *)self latitude];
  [v3 setLatitude:];
  [(REMCDAlarmLocationTrigger *)self longitude];
  [v3 setLongitude:];
  [(REMCDAlarmLocationTrigger *)self radius];
  [v3 setRadius:];
  v5 = [(REMCDAlarmLocationTrigger *)self referenceFrameString];
  [v3 setReferenceFrameString:v5];

  id v6 = [objc_alloc((Class)REMAlarmLocationTrigger) initWithStructuredLocation:v3 proximity:-[REMCDAlarmLocationTrigger proximity](self, "proximity")];

  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAlarmLocationTrigger"];
}

@end