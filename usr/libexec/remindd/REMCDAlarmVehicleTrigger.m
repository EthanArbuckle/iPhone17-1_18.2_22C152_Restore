@interface REMCDAlarmVehicleTrigger
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
- (id)modelObject;
@end

@implementation REMCDAlarmVehicleTrigger

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMAlarmVehicleTrigger cdEntityName];
}

- (id)modelObject
{
  id v2 = [objc_alloc((Class)REMAlarmVehicleTrigger) initWithEvent:-[REMCDAlarmVehicleTrigger event](self, "event")];

  return v2;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAlarmVehicleTrigger"];
}

@end