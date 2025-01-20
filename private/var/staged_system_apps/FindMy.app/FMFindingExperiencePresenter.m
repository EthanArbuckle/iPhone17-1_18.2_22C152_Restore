@interface FMFindingExperiencePresenter
- (_TtC6FindMy28FMFindingExperiencePresenter)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)dealloc;
@end

@implementation FMFindingExperiencePresenter

- (void)dealloc
{
  uint64_t v2 = qword_1006AE190;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000606BC(v4, (uint64_t)qword_1006D1E98);
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "FMFindingExperiencePresenter: Deinit, tearing down", v7, 2u);
    swift_slowDealloc();
  }

  sub_10015CD54();
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for FMFindingExperiencePresenter(0);
  [(FMFindingExperiencePresenter *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_presentedMode, (uint64_t *)&unk_1006B36A0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_presentedViewController));

  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_backgroundedDate, (uint64_t *)&unk_1006AF6E0);
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_delegate;

  sub_100068760((uint64_t)v3);
}

- (_TtC6FindMy28FMFindingExperiencePresenter)init
{
  result = (_TtC6FindMy28FMFindingExperiencePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v9 = objc_allocWithZone((Class)type metadata accessor for FMR1FindingViewPresentedTransition());
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = self;
  id v14 = [v9 init];

  return v14;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for FMR1FindingViewDismissedTransition());
  id v6 = a3;
  v7 = self;
  id v8 = [v5 init];

  return v8;
}

@end