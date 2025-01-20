@interface IntentHandler
- (_TtC22SiriGeoIntentExtension13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  IntentHandler.handler(for:)(v4, v8);

  __swift_project_boxed_opaque_existential_0(v8, v8[3]);
  v6 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);

  return v6;
}

- (_TtC22SiriGeoIntentExtension13IntentHandler)init
{
  uint64_t v3 = OBJC_IVAR____TtC22SiriGeoIntentExtension13IntentHandler_logObject;
  type metadata accessor for OS_os_log();
  id v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)OS_os_log.init(subsystem:category:)();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for IntentHandler();
  return [(IntentHandler *)&v6 init];
}

- (void).cxx_destruct
{
}

@end