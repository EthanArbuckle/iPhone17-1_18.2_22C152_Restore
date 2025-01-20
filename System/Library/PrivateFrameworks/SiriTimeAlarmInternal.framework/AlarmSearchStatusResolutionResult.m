@interface AlarmSearchStatusResolutionResult
+ (id)confirmationRequiredWithAlarmSearchStatusToConfirm:(int64_t)a3;
+ (id)successWithResolvedAlarmSearchStatus:(int64_t)a3;
- (AlarmSearchStatusResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation AlarmSearchStatusResolutionResult

+ (id)successWithResolvedAlarmSearchStatus:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_25DC90C08(a3);

  return v4;
}

+ (id)confirmationRequiredWithAlarmSearchStatusToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_25DC90C54(a3);

  return v4;
}

- (AlarmSearchStatusResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_25DC95E40();
  id v6 = a4;
  v7 = (void *)sub_25DC95E30();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AlarmSearchStatusResolutionResult();
  v8 = [(AlarmSearchStatusResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end