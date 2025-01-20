@interface SiriTargetMatchTypeResolutionResult
+ (id)confirmationRequiredWithSiriTargetMatchTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedSiriTargetMatchType:(int64_t)a3;
- (SiriTargetMatchTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SiriTargetMatchTypeResolutionResult

+ (id)successWithResolvedSiriTargetMatchType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_25DCAC598(a3);
  return v4;
}

+ (id)confirmationRequiredWithSiriTargetMatchTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_25DD1CAE4(a3);
  return v4;
}

- (SiriTargetMatchTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_25DD202C8();
  id v6 = a4;
  v7 = (void *)sub_25DD202B8();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SiriTargetMatchTypeResolutionResult();
  v8 = [(SiriTargetMatchTypeResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end