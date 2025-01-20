@interface DataSharingPresenter
- (_TtC9SiriSetup20DataSharingPresenter)init;
@end

@implementation DataSharingPresenter

- (_TtC9SiriSetup20DataSharingPresenter)init
{
  result = (_TtC9SiriSetup20DataSharingPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_235A3492C((uint64_t)self + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_presentingViewController));
  long long v3 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel + 64];
  v9[8] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel + 48];
  v9[9] = v3;
  long long v4 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel + 96];
  v9[10] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel + 80];
  v9[11] = v4;
  long long v5 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel];
  v9[4] = *(_OWORD *)&self->presentingViewController[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel];
  v9[5] = v5;
  long long v6 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel + 32];
  v9[6] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel + 16];
  v9[7] = v6;
  long long v7 = *(_OWORD *)&self->dataSource[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel);
  v9[1] = v7;
  long long v8 = *(_OWORD *)&self->delegate[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel + 8];
  v9[2] = *(_OWORD *)&self->dataSourceWriter[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel + 8];
  v9[3] = v8;
  sub_235A346CC((uint64_t)v9);
  swift_release();
}

@end