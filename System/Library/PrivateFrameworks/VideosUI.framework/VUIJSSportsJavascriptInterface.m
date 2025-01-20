@interface VUIJSSportsJavascriptInterface
- (JSContext)context;
- (NSString)storefrontId;
- (VUIJSSportsJavascriptInterface)init;
- (VUIJSSportsJavascriptInterface)initWithContext:(id)a3;
- (id)checkActivityExistsFor:(id)a3;
- (id)getTierTypeWithLeagueId:(id)a3;
- (id)isPlayByPlayEnabledWithLeagueId:(id)a3;
- (id)isSportsFeatureEnabledWithLeagueId:(id)a3 featureName:(id)a4;
- (void)registerWithRequest:(id)a3 successHandler:(id)a4 errorHandler:(id)a5;
@end

@implementation VUIJSSportsJavascriptInterface

- (VUIJSSportsJavascriptInterface)initWithContext:(id)a3
{
  return (VUIJSSportsJavascriptInterface *)SportsJavascriptInterface.init(context:)((uint64_t)a3);
}

- (JSContext)context
{
  id v2 = sub_1E35DABAC();
  return (JSContext *)v2;
}

- (NSString)storefrontId
{
  id v2 = self;
  sub_1E35DAC90();

  v3 = (void *)sub_1E387C8E8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)checkActivityExistsFor:(id)a3
{
  return sub_1E35DBF78(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))SportsJavascriptInterface.checkActivityExists(for:));
}

- (void)registerWithRequest:(id)a3 successHandler:(id)a4 errorHandler:(id)a5
{
  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  uint64_t v9 = sub_1E387C678();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v7;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  v12 = self;
  SportsJavascriptInterface.register(request:successHandler:errorHandler:)(v9, (uint64_t)sub_1E3205314, v10, (void (*)(void))sub_1E31EEAAC, v11);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (id)getTierTypeWithLeagueId:(id)a3
{
  return sub_1E35DBF78(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))SportsJavascriptInterface.getTierType(leagueId:));
}

- (id)isPlayByPlayEnabledWithLeagueId:(id)a3
{
  return sub_1E35DBF78(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))SportsJavascriptInterface.isPlayByPlayEnabled(leagueId:));
}

- (id)isSportsFeatureEnabledWithLeagueId:(id)a3 featureName:(id)a4
{
  uint64_t v5 = sub_1E387C928();
  v7 = v6;
  uint64_t v8 = sub_1E387C928();
  uint64_t v10 = v9;
  uint64_t v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  v14.super.isa = SportsJavascriptInterface.isSportsFeatureEnabled(leagueId:featureName:)(v12, v13).super.isa;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14.super.isa;
}

- (VUIJSSportsJavascriptInterface)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___VUIJSSportsJavascriptInterface_tierManagerClientType;
  sub_1E387BAB8();
  OUTLINED_FUNCTION_2();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

@end