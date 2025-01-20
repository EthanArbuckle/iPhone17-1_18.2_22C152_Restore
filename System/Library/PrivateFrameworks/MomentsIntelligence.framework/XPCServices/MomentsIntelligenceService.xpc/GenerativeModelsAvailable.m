@interface GenerativeModelsAvailable
+ (BOOL)isGenerativeModelAvailable;
- (_TtC26MomentsIntelligenceService25GenerativeModelsAvailable)init;
@end

@implementation GenerativeModelsAvailable

+ (BOOL)isGenerativeModelAvailable
{
  uint64_t v2 = type metadata accessor for GenerativeModelsAvailability.Availability();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for GenerativeModelsAvailability.Parameters();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for GenerativeModelsAvailability();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)();
  static GenerativeModelsAvailability.current(parameters:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  GenerativeModelsAvailability.availability.getter();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v5, v2) == enum case for GenerativeModelsAvailability.Availability.available(_:);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

- (_TtC26MomentsIntelligenceService25GenerativeModelsAvailable)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenerativeModelsAvailable();
  return [(GenerativeModelsAvailable *)&v3 init];
}

@end