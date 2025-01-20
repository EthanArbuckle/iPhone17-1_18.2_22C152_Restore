@interface SUSettingsSwiftTipsManager
+ (SUSettingsSwiftTipsManager)sharedManager;
- (BOOL)shouldShowUserDefaultsBasedComingSoonTip;
- (SUSettingsSwiftTipsManager)init;
- (void)configureManualComingSoonTipWithTitle:(id)a3 andContent:(id)a4 learnMoreLink:(id)a5;
- (void)setup;
- (void)setupForManualControl:(BOOL)a3;
@end

@implementation SUSettingsSwiftTipsManager

+ (SUSettingsSwiftTipsManager)sharedManager
{
  if (qword_268A7C2D0 != -1) {
    swift_once();
  }
  v2 = (void *)static SUSettingsSwiftTipsManager.shared;
  return (SUSettingsSwiftTipsManager *)v2;
}

- (BOOL)shouldShowUserDefaultsBasedComingSoonTip
{
  _s22SoftwareUpdateSettings26SUSettingsSwiftTipsManagerC40shouldShowUserDefaultsBasedComingSoonTipSbvg_0();
  return v2 & 1;
}

- (void)setup
{
  char v2 = *(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0xB8);
  v3 = self;
  v2(0);
}

- (void)setupForManualControl:(BOOL)a3
{
  v4 = self;
  SUSettingsSwiftTipsManager.setup(forManualControl:)(a3);
}

- (void)configureManualComingSoonTipWithTitle:(id)a3 andContent:(id)a4 learnMoreLink:(id)a5
{
  uint64_t v8 = sub_23BB094C0();
  v10 = v9;
  if (a4)
  {
    uint64_t v11 = sub_23BB094C0();
    a4 = v12;
    if (a5)
    {
LABEL_3:
      uint64_t v13 = sub_23BB094C0();
      a5 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  v15 = self;
  v16._countAndFlagsBits = v8;
  v16._object = v10;
  v17.value._countAndFlagsBits = v11;
  v17.value._object = a4;
  v18.value._countAndFlagsBits = v13;
  v18.value._object = a5;
  SUSettingsSwiftTipsManager.configureManualComingSoonTip(withTitle:andContent:learnMoreLink:)(v16, v17, v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (SUSettingsSwiftTipsManager)init
{
  char v2 = self;
  uint64_t v3 = nullsub_6();
  nullsub_1(v3);
  v4 = (_OWORD *)((char *)v2 + OBJC_IVAR___SUSettingsSwiftTipsManager_mockedComingSoonTip);
  sub_23BB05AA4((uint64_t)v8);
  long long v5 = v8[1];
  _OWORD *v4 = v8[0];
  v4[1] = v5;
  v4[2] = v8[2];
  *((unsigned char *)&v2->super.isa + OBJC_IVAR___SUSettingsSwiftTipsManager_inManualControl) = 0;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for SUSettingsSwiftTipsManager();
  return [(SUSettingsSwiftTipsManager *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end