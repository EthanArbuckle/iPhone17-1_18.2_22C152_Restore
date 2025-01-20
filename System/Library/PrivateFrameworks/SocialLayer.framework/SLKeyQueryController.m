@interface SLKeyQueryController
- (SLKeyQueryController)init;
- (SLKeyQueryController)initWithService:(id)a3 targetQueue:(id)a4;
@end

@implementation SLKeyQueryController

- (SLKeyQueryController)initWithService:(id)a3 targetQueue:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t ObjectType = swift_getObjectType();
  v9 = self;
  id v10 = a4;
  result = (SLKeyQueryController *)objc_msgSend(v9, sel_sharedInstance);
  if (result)
  {
    v12 = result;
    v14[3] = type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for IDSIDQueryController);
    v14[4] = &protocol witness table for IDSIDQueryController;
    v14[0] = v12;
    v13 = (SLKeyQueryController *)(*(uint64_t (**)(uint64_t, uint64_t, id, void *))(ObjectType + 176))(v5, v7, v10, v14);
    swift_deallocPartialClassInstance();
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (SLKeyQueryController)init
{
  result = (SLKeyQueryController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___SLKeyQueryController_queryController);
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf), *(void *)&self->service[OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles);
  outlined consume of [String]??(v3);
}

@end