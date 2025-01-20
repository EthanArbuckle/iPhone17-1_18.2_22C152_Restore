@interface SiriTimerTypeResolutionResult
+ (id)confirmationRequiredWithSiriTimerTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedSiriTimerType:(int64_t)a3;
- (SiriTimerTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SiriTimerTypeResolutionResult

+ (id)successWithResolvedSiriTimerType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_25DCAC598(a3);
  return v4;
}

+ (id)confirmationRequiredWithSiriTimerTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_25DD1CAE4(a3);
  return v4;
}

- (SiriTimerTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_25DD202C8();
  id v6 = a4;
  v7 = (void *)sub_25DD202B8();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SiriTimerTypeResolutionResult();
  v8 = [(SiriTimerTypeResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end