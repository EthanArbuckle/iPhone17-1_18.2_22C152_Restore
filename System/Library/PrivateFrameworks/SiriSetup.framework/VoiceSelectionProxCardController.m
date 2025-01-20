@interface VoiceSelectionProxCardController
- (_TtC9SiriSetup32VoiceSelectionProxCardController)initWithContentView:(id)a3;
- (void)presenter:(id)a3 didChangeVoiceSelection:(id)a4;
@end

@implementation VoiceSelectionProxCardController

- (_TtC9SiriSetup32VoiceSelectionProxCardController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC9SiriSetup32VoiceSelectionProxCardController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_orbView));
  sub_235A3492C((uint64_t)self + OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_currentVoiceSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_voiceOptionsView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_voiceSelectionPresenter);
}

- (void)presenter:(id)a3 didChangeVoiceSelection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_235A347A4(v7);
}

@end