@interface WhatDidTheySayIntentHandler
- (_TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler)init;
- (void)confirmWhatDidTheySay:(id)a3 completion:(id)a4;
- (void)handleWhatDidTheySay:(id)a3 completion:(id)a4;
- (void)resolveDeviceForWhatDidTheySay:(id)a3 withCompletion:(id)a4;
@end

@implementation WhatDidTheySayIntentHandler

- (_TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler *)WhatDidTheySayIntentHandler.init()();
}

- (void)resolveDeviceForWhatDidTheySay:(id)a3 withCompletion:(id)a4
{
}

- (void)handleWhatDidTheySay:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_232971470((uint64_t)v8, (uint64_t)sub_2328202AC, v7);

  swift_release();
}

- (void)confirmWhatDidTheySay:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler_analyticsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler_deviceState);
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler_queue));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler_assertion);
}

@end