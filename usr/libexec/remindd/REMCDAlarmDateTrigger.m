@interface REMCDAlarmDateTrigger
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
- (BOOL)didHandleMarkingExtraneousAlarmDuringWillSave;
- (BOOL)isTemporal;
- (double)generateNonce;
- (id)modelObject;
- (void)didSave;
- (void)setDidHandleMarkingExtraneousAlarmDuringWillSave:(BOOL)a3;
- (void)willSave;
@end

@implementation REMCDAlarmDateTrigger

- (id)modelObject
{
  v3 = [(REMCDAlarmDateTrigger *)self account];
  v4 = [v3 remObjectID];

  v5 = [(REMCDAlarmDateTrigger *)self alarm];
  v6 = [v5 remObjectID];

  if (v4 && v6)
  {
    v7 = +[REMAlarmDateTriggerCDIngestor_ObjC storageFrom:self accountID:v4 alarmID:v6];
  }
  else
  {
    v8 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100750304((uint64_t)v4, (uint64_t)v6, v8);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAlarmDateTrigger"];
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMAlarmDateTrigger cdEntityName];
}

- (BOOL)isTemporal
{
  return 1;
}

- (void)willSave
{
  if (![(REMCDAlarmDateTrigger *)self didHandleMarkingExtraneousAlarmDuringWillSave])
  {
    [(REMCDAlarmDateTrigger *)self setDidHandleMarkingExtraneousAlarmDuringWillSave:1];
    if ([(REMCDAlarmDateTrigger *)self markedForDeletion])
    {
      uint64_t v3 = [(REMCDAlarmDateTrigger *)self alarm];
      if (!v3) {
        goto LABEL_5;
      }
      v4 = (void *)v3;
      v5 = [(REMCDAlarmDateTrigger *)self alarm];
      v6 = [v5 reminder];

      if (!v6) {
LABEL_5:
      }
        [(REMCDAlarmDateTrigger *)self setIsExtraneous:1];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)REMCDAlarmDateTrigger;
  [(REMCDObject *)&v7 willSave];
}

- (void)didSave
{
  v3.receiver = self;
  v3.super_class = (Class)REMCDAlarmDateTrigger;
  [(REMCDObject *)&v3 didSave];
  [(REMCDAlarmDateTrigger *)self setDidHandleMarkingExtraneousAlarmDuringWillSave:0];
}

- (BOOL)didHandleMarkingExtraneousAlarmDuringWillSave
{
  return self->didHandleMarkingExtraneousAlarmDuringWillSave;
}

- (void)setDidHandleMarkingExtraneousAlarmDuringWillSave:(BOOL)a3
{
  self->didHandleMarkingExtraneousAlarmDuringWillSave = a3;
}

- (double)generateNonce
{
  v2 = self;
  double v3 = REMCDAlarmDateTrigger.generateNonce()();

  return v3;
}

@end