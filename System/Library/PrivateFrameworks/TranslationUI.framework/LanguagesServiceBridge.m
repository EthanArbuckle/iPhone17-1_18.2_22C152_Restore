@interface LanguagesServiceBridge
+ (NSString)modelsKeyPath;
- (NSArray)models;
- (_TtC13TranslationUI22LanguagesServiceBridge)init;
- (id)modelForLocale:(id)a3;
- (void)deleteLocale:(id)a3;
- (void)downloadLocales:(id)a3;
- (void)setModels:(id)a3;
@end

@implementation LanguagesServiceBridge

- (NSArray)models
{
  swift_beginAccess();
  sub_1DB0E2EFC(0, (unint64_t *)&qword_1EBA4D958);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DB1F1480();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setModels:(id)a3
{
  sub_1DB0E2EFC(0, (unint64_t *)&qword_1EBA4D958);
  uint64_t v4 = sub_1DB1F14A0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13TranslationUI22LanguagesServiceBridge_models);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

+ (NSString)modelsKeyPath
{
  v2 = (void *)sub_1DB1F1260();
  return (NSString *)v2;
}

- (_TtC13TranslationUI22LanguagesServiceBridge)init
{
  return (_TtC13TranslationUI22LanguagesServiceBridge *)LanguagesServiceBridge.init()();
}

- (id)modelForLocale:(id)a3
{
  uint64_t v4 = sub_1DB1EF6B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DB1EF5F0();
  v8 = self;
  v9 = [(LanguagesServiceBridge *)v8 models];
  sub_1DB0E2EFC(0, (unint64_t *)&qword_1EBA4D958);
  unint64_t v10 = sub_1DB1F14A0();

  v14 = v7;
  v11 = sub_1DB131DF8(sub_1DB13FD34, (uint64_t)v13, v10);

  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (void)downloadLocales:(id)a3
{
  sub_1DB1EF6B0();
  uint64_t v4 = sub_1DB1F14A0();
  uint64_t v5 = self;
  LanguagesServiceBridge.download(locales:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)deleteLocale:(id)a3
{
  uint64_t v4 = sub_1DB1EF6B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB1EF5F0();
  v8 = self;
  LanguagesServiceBridge.delete(locale:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end