@interface SiriTimerStateResolutionResult
+ (id)confirmationRequiredWithSiriTimerStateToConfirm:(int64_t)a3;
+ (id)successWithResolvedSiriTimerState:(int64_t)a3;
- (SiriTimerStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SiriTimerStateResolutionResult

+ (id)successWithResolvedSiriTimerState:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_25DCAC598(a3);
  return v4;
}

+ (id)confirmationRequiredWithSiriTimerStateToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_25DD1CAE4(a3);
  return v4;
}

- (SiriTimerStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_25DD202C8();
  id v6 = a4;
  v7 = (void *)sub_25DD202B8();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SiriTimerStateResolutionResult();
  v8 = [(SiriTimerStateResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end