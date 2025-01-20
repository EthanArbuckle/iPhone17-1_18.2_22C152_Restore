@interface EmitNavigationEventWrapper
+ (void)generalEmitNavigationEventForSystemSettingWithGraphicIconIdentifier:(id)a3 title:(id)a4 localizedNavigationComponents:(id)a5 deepLink:(id)a6;
- (_TtC17GeneralSettingsUI26EmitNavigationEventWrapper)init;
@end

@implementation EmitNavigationEventWrapper

+ (void)generalEmitNavigationEventForSystemSettingWithGraphicIconIdentifier:(id)a3 title:(id)a4 localizedNavigationComponents:(id)a5 deepLink:(id)a6
{
  uint64_t v7 = sub_23D2C2FD0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_23D2C30D0();
  uint64_t v13 = v12;
  sub_23D2C0B1C();
  unint64_t v14 = sub_23D2C30F0();
  sub_23D2C2FC0();
  id v15 = a4;
  sub_23D2C08B4(v11, v13, v15, v14, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC17GeneralSettingsUI26EmitNavigationEventWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmitNavigationEventWrapper();
  return [(EmitNavigationEventWrapper *)&v3 init];
}

@end