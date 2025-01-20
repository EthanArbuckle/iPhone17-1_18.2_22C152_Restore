@interface SetupSession
- (_TtC21MediaSetupViewService12SetupSession)init;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation SetupSession

- (_TtC21MediaSetupViewService12SetupSession)init
{
  return (_TtC21MediaSetupViewService12SetupSession *)SetupSession.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_100010844(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_progressHandler));
  v3 = (char *)self + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_log;
  uint64_t v4 = sub_100029870();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1000102F8(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel), *(void *)&self->homesToSetup[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel]);
  swift_bridgeObjectRelease();

  sub_1000101B8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext), *(void *)&self->homesToSetup[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext], *(void *)&self->state[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext], *(void **)&self->serviceAccount[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 7], *(void *)&self->dispatchQueue[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 7], *(void *)&self->hostAuditToken[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 7], *(void *)&self->hostAuditToken[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 15], *(void *)&self->hostAuditToken[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 23]);
  sub_1000101B8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext), *(void *)&self->homesToSetup[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext], *(void *)&self->state[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext], *(void **)&self->serviceAccount[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 7], *(void *)&self->dispatchQueue[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 7], *(void *)&self->hostAuditToken[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 7], *(void *)&self->hostAuditToken[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 15], *(void *)&self->hostAuditToken[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 23]);
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_setupAnalyticEvent));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession____lazy_storage___configuration));
  sub_10001088C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession____lazy_storage___mediaService));
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession__completedSetupEvent);
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s21MediaSetupViewService0B7SessionC25homeManagerDidUpdateHomesyySo06HMHomeG0CF_0();
}

@end