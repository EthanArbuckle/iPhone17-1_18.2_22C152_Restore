@interface SnoozeAlarmHalIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SnoozeAlarmHalIntent)init;
- (SnoozeAlarmHalIntent)initWithCoder:(id)a3;
- (SnoozeAlarmHalIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SnoozeAlarmHalIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SnoozeAlarmHalIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SnoozeAlarmHalIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SnoozeAlarmHalIntent();
  return [(SnoozeAlarmHalIntent *)&v3 init];
}

- (SnoozeAlarmHalIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SnoozeAlarmHalIntent();
  return [(SnoozeAlarmHalIntent *)&v5 initWithCoder:a3];
}

- (SnoozeAlarmHalIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    sub_25DC95E90();
    id v6 = a4;
    v7 = (void *)sub_25DC95E80();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SnoozeAlarmHalIntent();
  v9 = [(SnoozeAlarmHalIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (SnoozeAlarmHalIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_25DC95E90();
  sub_25DC95E90();
  if (a5) {
    a5 = (id)sub_25DC95E40();
  }
  v7 = (void *)sub_25DC95E80();
  swift_bridgeObjectRelease();
  id v8 = (void *)sub_25DC95E80();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_25DC95E30();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SnoozeAlarmHalIntent();
  v10 = [(SnoozeAlarmHalIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9];

  return v10;
}

@end