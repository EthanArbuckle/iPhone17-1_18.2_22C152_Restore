@interface WFNetworkRowConfig
+ (id)knownNetworkRowConfig;
+ (id)settingsNetworkRowConfig;
+ (id)setupNetworkRowConfig;
- (BOOL)hideConnectionState;
- (BOOL)isEditable;
- (BOOL)problematicConnection;
- (BOOL)showInfoButton;
- (NSString)subtitle;
- (WFNetworkListRecord)network;
- (WFNetworkRowConfig)init;
- (id)infoButtonHandler;
- (int64_t)connectionState;
- (unint64_t)context;
- (unint64_t)signalBars;
- (void)setConnectionState:(int64_t)a3;
- (void)setContext:(unint64_t)a3;
- (void)setHideConnectionState:(BOOL)a3;
- (void)setInfoButtonHandler:(id)a3;
- (void)setIsEditable:(BOOL)a3;
- (void)setNetwork:(id)a3;
- (void)setProblematicConnection:(BOOL)a3;
- (void)setShowInfoButton:(BOOL)a3;
- (void)setSignalBars:(unint64_t)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation WFNetworkRowConfig

- (WFNetworkListRecord)network
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_225881C28();

  swift_release();
  swift_release();
  return (WFNetworkListRecord *)v5;
}

- (void)setNetwork:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_225870D60(a3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C38();
}

- (NSString)subtitle
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_225881C28();

  swift_release();
  swift_release();
  if (v6)
  {
    v4 = (void *)sub_225882508();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setSubtitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_225882538();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_22587137C(v4, v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C38();
}

- (int64_t)connectionState
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_225881C28();

  swift_release();
  swift_release();
  return v5;
}

- (void)setConnectionState:(int64_t)a3
{
  uint64_t v4 = self;
  sub_225871A18(a3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C38();
}

- (BOOL)problematicConnection
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_225881C28();

  swift_release();
  swift_release();
  return v5;
}

- (void)setProblematicConnection:(BOOL)a3
{
  uint64_t v4 = self;
  sub_225871FA8(a3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C38();
}

- (unint64_t)signalBars
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_225881C28();

  swift_release();
  swift_release();
  return v5;
}

- (void)setSignalBars:(unint64_t)a3
{
  uint64_t v4 = self;
  sub_225872538(a3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C38();
}

- (unint64_t)context
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___WFNetworkRowConfig_context);
  swift_beginAccess();
  return *v2;
}

- (void)setContext:(unint64_t)a3
{
  uint64_t v4 = (unint64_t *)((char *)self + OBJC_IVAR___WFNetworkRowConfig_context);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (BOOL)hideConnectionState
{
  v2 = (BOOL *)self + OBJC_IVAR___WFNetworkRowConfig_hideConnectionState;
  swift_beginAccess();
  return *v2;
}

- (void)setHideConnectionState:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___WFNetworkRowConfig_hideConnectionState;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)showInfoButton
{
  v2 = (BOOL *)self + OBJC_IVAR___WFNetworkRowConfig_showInfoButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShowInfoButton:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___WFNetworkRowConfig_showInfoButton;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isEditable
{
  v2 = (BOOL *)self + OBJC_IVAR___WFNetworkRowConfig_isEditable;
  swift_beginAccess();
  return *v2;
}

- (void)setIsEditable:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___WFNetworkRowConfig_isEditable;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (id)infoButtonHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22585C818;
    aBlock[3] = &block_descriptor_2;
    uint64_t v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)setInfoButtonHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    uint64_t v4 = sub_225873DA8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *uint64_t v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_225858008(v7);
}

+ (id)settingsNetworkRowConfig
{
  swift_getObjCClassMetadata();
  v2 = static WFNetworkRowConfigModel.settingsNetworkRowConfig()();
  return v2;
}

+ (id)knownNetworkRowConfig
{
  swift_getObjCClassMetadata();
  v2 = static WFNetworkRowConfigModel.knownNetworkRowConfig()();
  return v2;
}

+ (id)setupNetworkRowConfig
{
  swift_getObjCClassMetadata();
  v2 = static WFNetworkRowConfigModel.setupNetworkRowConfig()();
  return v2;
}

- (WFNetworkRowConfig)init
{
  return (WFNetworkRowConfig *)WFNetworkRowConfigModel.init()();
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___WFNetworkRowConfig__network;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681091C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR___WFNetworkRowConfig__subtitle;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681091A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = (char *)self + OBJC_IVAR___WFNetworkRowConfig__connectionState;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109408);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR___WFNetworkRowConfig__problematicConnection;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109400);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR___WFNetworkRowConfig__signalBars;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681093F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler);
  sub_225858008(v13);
}

@end