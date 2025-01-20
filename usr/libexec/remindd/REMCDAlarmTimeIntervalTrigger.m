@interface REMCDAlarmTimeIntervalTrigger
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
- (BOOL)isTemporal;
- (double)generateNonce;
- (id)modelObject;
@end

@implementation REMCDAlarmTimeIntervalTrigger

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAlarmTimeIntervalTrigger"];
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMAlarmTimeIntervalTrigger cdEntityName];
}

- (BOOL)isTemporal
{
  return 1;
}

- (id)modelObject
{
  id v3 = objc_alloc((Class)REMAlarmTimeIntervalTrigger);
  [(REMCDAlarmTimeIntervalTrigger *)self timeInterval];
  id v4 = [v3 initWithTimeInterval:x0];

  return v4;
}

- (double)generateNonce
{
  v2 = self;
  double v3 = REMCDAlarmTimeIntervalTrigger.generateNonce()();

  return v3;
}

@end