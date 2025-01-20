@interface REMAlarmDateTriggerCDIngestor_ObjC
+ (id)storageFrom:(id)a3 accountID:(id)a4 alarmID:(id)a5;
- (_TtC7remindd34REMAlarmDateTriggerCDIngestor_ObjC)init;
@end

@implementation REMAlarmDateTriggerCDIngestor_ObjC

+ (id)storageFrom:(id)a3 accountID:(id)a4 alarmID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1001586A4(v7, v8, v9);

  return v10;
}

- (_TtC7remindd34REMAlarmDateTriggerCDIngestor_ObjC)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for REMAlarmDateTriggerCDIngestor_ObjC();
  return [(REMAlarmDateTriggerCDIngestor_ObjC *)&v3 init];
}

@end