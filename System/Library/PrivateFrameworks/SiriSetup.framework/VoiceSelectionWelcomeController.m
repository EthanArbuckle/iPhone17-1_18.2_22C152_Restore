@interface VoiceSelectionWelcomeController
- (_TtC9SiriSetup31VoiceSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC9SiriSetup31VoiceSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC9SiriSetup31VoiceSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC9SiriSetup31VoiceSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (void)chooseForMeTapped;
- (void)continueTapped;
- (void)presenter:(id)a3 didChangeVoiceSelection:(id)a4;
@end

@implementation VoiceSelectionWelcomeController

- (void)continueTapped
{
  v2 = self;
  sub_235A3B13C();
}

- (void)chooseForMeTapped
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceSelectionPresenter);
  if (v2)
  {
    v7[4] = nullsub_1;
    v7[5] = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 1107296256;
    v7[2] = sub_235A3AAE4;
    v7[3] = &block_descriptor_1;
    v4 = _Block_copy(v7);
    v5 = self;
    id v6 = v2;
    objc_msgSend(v6, sel_selectRandomVoiceWithCompletion_, v4);
    _Block_release(v4);
  }
}

- (_TtC9SiriSetup31VoiceSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC9SiriSetup31VoiceSelectionWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup31VoiceSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC9SiriSetup31VoiceSelectionWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup31VoiceSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC9SiriSetup31VoiceSelectionWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup31VoiceSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC9SiriSetup31VoiceSelectionWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_235A3492C((uint64_t)self + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_orbView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceOptionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceSelectionPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_continueButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_primaryButton);
}

- (void)presenter:(id)a3 didChangeVoiceSelection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_235A3C5BC(v7);
}

@end