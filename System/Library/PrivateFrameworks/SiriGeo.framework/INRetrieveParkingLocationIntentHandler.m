@interface INRetrieveParkingLocationIntentHandler
- (_TtC7SiriGeo38INRetrieveParkingLocationIntentHandler)init;
- (void)handleRetrieveParkingLocation:(id)a3 completion:(id)a4;
@end

@implementation INRetrieveParkingLocationIntentHandler

- (void)handleRetrieveParkingLocation:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  specialized INRetrieveParkingLocationIntentHandler.handle(intent:completion:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned INDeleteParkingLocationIntentResponse) -> (), v7);

  swift_release();
}

- (_TtC7SiriGeo38INRetrieveParkingLocationIntentHandler)init
{
  uint64_t v3 = OBJC_IVAR____TtC7SiriGeo38INRetrieveParkingLocationIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)OS_os_log.init(subsystem:category:)();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for INRetrieveParkingLocationIntentHandler();
  return [(INRetrieveParkingLocationIntentHandler *)&v6 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SiriGeo38INRetrieveParkingLocationIntentHandler_logObject));
}

@end