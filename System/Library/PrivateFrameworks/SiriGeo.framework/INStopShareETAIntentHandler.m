@interface INStopShareETAIntentHandler
- (_TtC7SiriGeo27INStopShareETAIntentHandler)init;
- (void)confirmStopShareETA:(id)a3 completion:(id)a4;
- (void)handleStopShareETA:(id)a3 completion:(id)a4;
- (void)resolveRecipientsForStopShareETA:(id)a3 withCompletion:(id)a4;
@end

@implementation INStopShareETAIntentHandler

- (void)resolveRecipientsForStopShareETA:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmStopShareETA:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  specialized INStopShareETAIntentHandler.confirm(intent:completion:)((char *)v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)handleStopShareETA:(id)a3 completion:(id)a4
{
}

- (_TtC7SiriGeo27INStopShareETAIntentHandler)init
{
  uint64_t v3 = OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)OS_os_log.init(subsystem:category:)();
  uint64_t v5 = OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_contactService;
  type metadata accessor for ContactService();
  swift_allocObject();
  *(Class *)((char *)&v4->super.isa + v5) = (Class)ContactService.init()();
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact) = 0;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for INStopShareETAIntentHandler();
  return [(INStopShareETAIntentHandler *)&v7 init];
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact);
}

@end