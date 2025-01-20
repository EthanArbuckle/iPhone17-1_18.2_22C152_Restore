@interface VoiceTrainingPresenter
- (_TtC9SiriSetup22VoiceTrainingPresenter)init;
- (void)audioLevelDidChange:(float)a3;
@end

@implementation VoiceTrainingPresenter

- (_TtC9SiriSetup22VoiceTrainingPresenter)init
{
  result = (_TtC9SiriSetup22VoiceTrainingPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_235A3492C((uint64_t)self + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_delegate);
  long long v3 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel + 87];
  v9[8] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel + 71];
  v9[9] = v3;
  long long v4 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel + 119];
  v9[10] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel + 103];
  v9[11] = v4;
  long long v5 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel + 23];
  v9[4] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel + 7];
  v9[5] = v5;
  long long v6 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel + 55];
  v9[6] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel + 39];
  v9[7] = v6;
  long long v7 = *(_OWORD *)&self->dataSource[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel);
  v9[1] = v7;
  long long v8 = *(_OWORD *)&self->delegate[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel + 8];
  v9[2] = *(_OWORD *)&self->dataSourceWriter[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel + 8];
  v9[3] = v8;
  sub_235A346CC((uint64_t)v9);
  swift_release();
}

- (void)audioLevelDidChange:(float)a3
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController))
  {
    uint64_t v4 = *(void *)&self->dataSource[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController + 8];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, float))(v4 + 32))(ObjectType, v4, a3);
  }
}

@end