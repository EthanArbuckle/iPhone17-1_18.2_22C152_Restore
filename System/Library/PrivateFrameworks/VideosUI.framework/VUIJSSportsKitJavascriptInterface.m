@interface VUIJSSportsKitJavascriptInterface
- (JSContext)context;
- (VUIJSSportsKitJavascriptInterface)init;
- (VUIJSSportsKitJavascriptInterface)initWithContext:(id)a3;
- (id)checkActivityExistsFor:(id)a3;
- (void)registerWithRequest:(id)a3 successHandler:(id)a4 errorHandler:(id)a5;
@end

@implementation VUIJSSportsKitJavascriptInterface

- (VUIJSSportsKitJavascriptInterface)initWithContext:(id)a3
{
  return (VUIJSSportsKitJavascriptInterface *)SportsKitJavascriptInterface.init(context:)((uint64_t)a3);
}

- (JSContext)context
{
  id v2 = sub_1E3203F10();
  return (JSContext *)v2;
}

- (id)checkActivityExistsFor:(id)a3
{
  uint64_t v4 = sub_1E387C928();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  v9.super.isa = SportsKitJavascriptInterface.checkActivityExists(for:)(v8).super.isa;

  swift_bridgeObjectRelease();
  return v9.super.isa;
}

- (void)registerWithRequest:(id)a3 successHandler:(id)a4 errorHandler:(id)a5
{
  v7 = _Block_copy(a4);
  Swift::String v8 = _Block_copy(a5);
  uint64_t v9 = sub_1E387C678();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v7;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  v12 = self;
  SportsKitJavascriptInterface.register(request:successHandler:errorHandler:)(v9, (uint64_t)sub_1E3205314, v10, (void (*)(void))sub_1E31EEAAC, v11);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (VUIJSSportsKitJavascriptInterface)init
{
}

- (void).cxx_destruct
{
}

@end