@interface VoiceTrainingProxController
- (_TtC9SiriSetup27VoiceTrainingProxController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation VoiceTrainingProxController

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_235A41DD8(a3);
}

- (_TtC9SiriSetup27VoiceTrainingProxController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC9SiriSetup27VoiceTrainingProxController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_viewModel);
  sub_235A3492C((uint64_t)self + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_orbView);
}

@end