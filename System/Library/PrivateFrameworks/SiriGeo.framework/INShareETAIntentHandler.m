@interface INShareETAIntentHandler
- (_TtC7SiriGeo23INShareETAIntentHandler)init;
- (void)confirmShareETA:(id)a3 completion:(id)a4;
- (void)handleShareETA:(id)a3 completion:(id)a4;
- (void)resolveRecipientsForShareETA:(id)a3 withCompletion:(id)a4;
@end

@implementation INShareETAIntentHandler

- (void)resolveRecipientsForShareETA:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  specialized INShareETAIntentHandler.resolveRecipients(for:with:)(v7, (char *)v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)confirmShareETA:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  specialized INShareETAIntentHandler.confirm(intent:completion:)(v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)handleShareETA:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  id v9 = a3;
  specialized INShareETAIntentHandler.handleShareETA(intent:completion:)(v9, (char *)v8, v8, (void (*)(id))partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned INDeleteParkingLocationIntentResponse) -> (), v7);

  swift_release();
}

- (_TtC7SiriGeo23INShareETAIntentHandler)init
{
  uint64_t v3 = OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)OS_os_log.init(subsystem:category:)();
  v5 = (_OWORD *)((char *)v4 + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact);
  v5[1] = 0u;
  v5[2] = 0u;
  _OWORD *v5 = 0u;
  uint64_t v6 = OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_contactService;
  type metadata accessor for ContactService();
  swift_allocObject();
  *(Class *)((char *)&v4->super.isa + v6) = (Class)ContactService.init()();

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for INShareETAIntentHandler();
  return [(INShareETAIntentHandler *)&v8 init];
}

- (void).cxx_destruct
{
  outlined consume of EnhancedMSPSharedTripContact?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact), *(void *)&self->logObject[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact], *(void **)&self->sharedTripContact[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact], *(void *)&self->sharedTripContact[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 8], *(void *)&self->sharedTripContact[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 16], *(void **)&self->sharedTripContact[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 24]);

  swift_release();
}

@end