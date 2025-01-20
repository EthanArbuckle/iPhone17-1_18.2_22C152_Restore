@interface ASDConfigurationManager
+ (_TtC3asd23ASDConfigurationManager)shared;
+ (void)setShared:(id)a3;
- (NSDictionary)configDictionaryForCoreODI;
- (NSDictionary)payloadWorkflowTTLs;
- (_TtC3asd23ASDConfigurationManager)init;
- (double)cacheV2MaxAge;
- (void)dealloc;
- (void)pushInitialCoreODIConfig;
@end

@implementation ASDConfigurationManager

- (NSDictionary)configDictionaryForCoreODI
{
  v2 = self;
  Class v3 = ASDConfigurationManager.configDictionaryForCoreODI.getter();

  return (NSDictionary *)v3;
}

- (double)cacheV2MaxAge
{
  v2 = self;
  ASDConfigurationManager.cacheV2MaxAge.getter();
  double v4 = v3;

  return v4;
}

- (NSDictionary)payloadWorkflowTTLs
{
  v2 = self;
  ASDConfigurationManager.payloadWorkflowTTLs.getter();

  sub_1000362B0(0, (unint64_t *)&qword_100697EF8);
  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3.super.isa;
}

- (void)pushInitialCoreODIConfig
{
  v2 = self;
  ASDConfigurationManager.pushInitialCoreODIConfig()();
}

+ (_TtC3asd23ASDConfigurationManager)shared
{
  id v2 = static ASDConfigurationManager.shared.getter();

  return (_TtC3asd23ASDConfigurationManager *)v2;
}

+ (void)setShared:(id)a3
{
}

- (_TtC3asd23ASDConfigurationManager)init
{
  return (_TtC3asd23ASDConfigurationManager *)sub_10009A0C8();
}

- (void)dealloc
{
  id v2 = self;
  ASDConfigurationManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
}

@end