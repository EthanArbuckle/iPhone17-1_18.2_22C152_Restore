@interface ResumeMediaIntentHandler
- (_TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler)init;
- (void)confirmResumeMedia:(id)a3 completion:(id)a4;
- (void)handleResumeMedia:(id)a3 completion:(id)a4;
- (void)resolveDevicesForResumeMedia:(id)a3 withCompletion:(id)a4;
@end

@implementation ResumeMediaIntentHandler

- (void)resolveDevicesForResumeMedia:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmResumeMedia:(id)a3 completion:(id)a4
{
}

- (void)handleResumeMedia:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_232830958((uint64_t)v8, (uint64_t)sub_2328202AC, v7);

  swift_release();
}

- (_TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler *)ResumeMediaIntentHandler.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler_analyticsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler_deviceState);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler_aceService);
  v3 = (char *)self
     + OBJC_IVAR____TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler_aceBlockClearAudioQueueForResume;
  sub_232A683B8();
  OUTLINED_FUNCTION_20();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

@end