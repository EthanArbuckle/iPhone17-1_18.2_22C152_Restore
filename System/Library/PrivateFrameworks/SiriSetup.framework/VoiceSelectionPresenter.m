@interface VoiceSelectionPresenter
- (_TtC9SiriSetup23VoiceSelectionPresenter)init;
@end

@implementation VoiceSelectionPresenter

- (_TtC9SiriSetup23VoiceSelectionPresenter)init
{
  result = (_TtC9SiriSetup23VoiceSelectionPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_235A3492C((uint64_t)self + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_presentingViewController));
  long long v3 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel + 72];
  v9[8] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel + 56];
  v9[9] = v3;
  long long v4 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel + 104];
  v9[10] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel + 88];
  v9[11] = v4;
  long long v5 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel + 8];
  v9[4] = *(_OWORD *)&self->presentingViewController[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel + 8];
  v9[5] = v5;
  long long v6 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel + 40];
  v9[6] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel + 24];
  v9[7] = v6;
  long long v7 = *(_OWORD *)&self->dataSource[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel);
  v9[1] = v7;
  long long v8 = *(_OWORD *)&self->delegate[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel + 8];
  v9[2] = *(_OWORD *)&self->dataSourceWriter[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel + 8];
  v9[3] = v8;
  sub_235A346CC((uint64_t)v9);
  swift_release();
  swift_bridgeObjectRelease();
}

@end