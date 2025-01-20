@interface EVChargerUtility
+ (id)chargerStringForNonRealDataWithChargerNumber:(int64_t)a3;
+ (id)realTimeEVChargerDisplayStringWithEvCharger:(id)a3 mapDisplay:(BOOL)a4;
+ (int)chargerStatusForNonRealData;
+ (int)realTimeEVChargerStatusWithEvCharger:(id)a3;
- (_TtC4Maps16EVChargerUtility)init;
@end

@implementation EVChargerUtility

+ (int)realTimeEVChargerStatusWithEvCharger:(id)a3
{
  v4 = self;
  id v5 = a3;
  id v6 = [v4 sharedSearchVirtualGarageManager];
  id v7 = [v6 virtualGarage];

  if (v7)
  {
    id v8 = [self getRealTimeEVChargerInfo:v7 charger:v5];
    int v9 = [v8 status];

    id v5 = v8;
  }
  else
  {
    int v9 = [v5 _realTimePlugAvailabilityStatus];
  }

  return v9;
}

+ (int)chargerStatusForNonRealData
{
  return 0;
}

+ (id)chargerStringForNonRealDataWithChargerNumber:(int64_t)a3
{
  sub_1003168A0(a3);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

+ (id)realTimeEVChargerDisplayStringWithEvCharger:(id)a3 mapDisplay:(BOOL)a4
{
  id v5 = a3;
  sub_1003166D4(v5, a4);

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC4Maps16EVChargerUtility)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EVChargerUtility();
  return [(EVChargerUtility *)&v3 init];
}

@end