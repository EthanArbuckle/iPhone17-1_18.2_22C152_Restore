@interface BCRCDataContainer
+ (BCRCDataContainer)defaultContainer;
- (BABooksTreatmentData)treatmentData;
- (BASessionHosting)sessionHosting;
- (BCRCDataContainer)init;
- (BOOL)configurationLoaded;
- (BOOL)isPriceTrackingEnabled;
- (BOOL)isReadingNow2Enabled;
- (BOOL)waitForConfiguration:(double)a3;
- (BRCJSABridge)bridge;
- (NSDictionary)configs;
- (void)configurationManager:(id)a3 namespaceDataDidUpdateFrom:(id)a4 to:(id)a5;
- (void)dealloc;
- (void)deployStagedDataIfNeeded;
- (void)registerOnConfigChange:(id)a3;
- (void)setBridge:(id)a3;
- (void)setOverrideObject:(id)a3 forKey:(id)a4;
- (void)setSessionHosting:(id)a3;
- (void)setTreatmentData:(id)a3;
- (void)unregisterOnConfigChange:(id)a3;
@end

@implementation BCRCDataContainer

+ (BCRCDataContainer)defaultContainer
{
  if (qword_342B60 != -1) {
    swift_once();
  }
  v2 = (void *)qword_343F88;

  return (BCRCDataContainer *)v2;
}

- (BRCJSABridge)bridge
{
  return (BRCJSABridge *)sub_1B8C1C();
}

- (void)setBridge:(id)a3
{
}

- (BASessionHosting)sessionHosting
{
  return (BASessionHosting *)sub_1B8C1C();
}

- (void)setSessionHosting:(id)a3
{
}

- (BCRCDataContainer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v3 = [self sharedInstance];
  id v4 = objc_allocWithZone(ObjectType);
  v5 = (BCRCDataContainer *)sub_1B8E7C(v3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)dealloc
{
  v2 = self;
  RCDataContainer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (BOOL)configurationLoaded
{
  id v3 = self;
  id v4 = self;
  id v5 = [v3 sharedInstance];
  unsigned __int8 v6 = [v5 configurationLoaded];

  return v6;
}

- (BOOL)waitForConfiguration:(double)a3
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_configManager) waitForCachedConfigurationLoaded:a3];
}

- (void)deployStagedDataIfNeeded
{
  v2 = self;
  RCDataContainer.deployStagedDataIfNeeded()();
}

- (BABooksTreatmentData)treatmentData
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_treatmentData);
  swift_beginAccess();
  return (BABooksTreatmentData *)*v2;
}

- (void)setTreatmentData:(id)a3
{
  id v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_treatmentData);
  swift_beginAccess();
  id v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

- (NSDictionary)configs
{
  v2 = self;
  RCDataContainer.configs.getter();

  v3.super.isa = sub_1F20E0().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3.super.isa;
}

- (void)registerOnConfigChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1F2330();
  if (qword_342B68 != -1) {
    swift_once();
  }
  id v6 = (id)qword_344770;
  sub_1F1DF0();

  [objc_allocWithZone((Class)JSManagedValue) initWithValue:v4];
  sub_1911F8(&qword_344028);
  sub_1F1E10();
}

- (void)unregisterOnConfigChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1911F8(&qword_344028);
  sub_1F1E10();
}

- (BOOL)isReadingNow2Enabled
{
  return 1;
}

- (BOOL)isPriceTrackingEnabled
{
  return 0;
}

- (void)setOverrideObject:(id)a3 forKey:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1F2610();
  swift_unknownObjectRelease();
  uint64_t v8 = sub_1F2190();
  uint64_t v10 = v9;

  v11 = (objc_class *)sub_1BDA74();
  sub_1BE9B8((uint64_t)v12, v8, v10, (uint64_t *)&v11);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___BCRCDataContainer____lazy_storage___overrides) = v11;
  swift_bridgeObjectRelease();
  sub_1BC294();

  swift_bridgeObjectRelease();
  sub_1B09C4((uint64_t)v12);
}

- (void)configurationManager:(id)a3 namespaceDataDidUpdateFrom:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1C1AD8(v10);
}

@end