@interface FMAirTagEducationalVideoViewController
- (_TtC6FindMy38FMAirTagEducationalVideoViewController)initWithCoder:(id)a3;
- (_TtC6FindMy38FMAirTagEducationalVideoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)actionTriggered;
- (void)doneAction;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMAirTagEducationalVideoViewController

- (_TtC6FindMy38FMAirTagEducationalVideoViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002D8A54();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMAirTagEducationalVideoViewController();
  id v4 = v9.receiver;
  [(FMAirTagEducationalVideoViewController *)&v9 viewWillAppear:v3];
  id v5 = [v4 view];
  if (v5)
  {
    v6 = v5;
    [v5 setNeedsLayout];

    id v7 = [v4 view];
    if (v7)
    {
      v8 = v7;
      [v7 layoutIfNeeded];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAirTagEducationalVideoViewController();
  id v4 = v5.receiver;
  [(FMAirTagEducationalVideoViewController *)&v5 viewDidAppear:v3];
  if ((v4[OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_animating] & 1) == 0
    && (v4[OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_shouldAnimate] & 1) != 0)
  {
    v4[OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_animating] = 1;
    sub_1002D7C1C();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAirTagEducationalVideoViewController();
  id v4 = v5.receiver;
  [(FMAirTagEducationalVideoViewController *)&v5 viewWillDisappear:v3];
  if (v4[OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_animating] == 1) {
    v4[OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_animating] = 0;
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAirTagEducationalVideoViewController();
  id v2 = v3.receiver;
  [(FMAirTagEducationalVideoViewController *)&v3 viewDidLayoutSubviews];
  sub_1002D75D8();
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for FMAirTagEducationalVideoViewController();
  id v4 = a3;
  id v5 = v10.receiver;
  [(FMAirTagEducationalVideoViewController *)&v10 traitCollectionDidChange:v4];
  if (qword_1006AE190 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_1000606BC(v6, (uint64_t)qword_1006D1E98);
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    objc_super v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "FMAirTagEducationalVideoViewController: traitCollectionDidChange", v9, 2u);
    swift_slowDealloc();
  }

  sub_1002D75D8();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v6 = self;
  sub_1002D75D8();
  id v5 = *(void (**)(id))((char *)&v6->super.super.super.isa
                                 + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_scrollHandler);
  if (v5)
  {
    swift_retain();
    v5(v4);
    sub_100036B90((uint64_t)v5);
  }
}

- (void)doneAction
{
  uint64_t v2 = qword_1006AE190;
  id v7 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_1000606BC(v3, (uint64_t)qword_1006D1E98);
  id v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "FMAirTagEducationalVideoViewController: Done button pressed", v6, 2u);
    swift_slowDealloc();
  }

  [(FMAirTagEducationalVideoViewController *)v7 dismissViewControllerAnimated:1 completion:0];
}

- (_TtC6FindMy38FMAirTagEducationalVideoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy38FMAirTagEducationalVideoViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100036B90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_scrollHandler));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_scrollContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_actionBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_footnoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_playerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_videoTopConstraint));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_bottomConstraint);
}

- (void)actionTriggered
{
  uint64_t v0 = sub_10005D034((uint64_t *)&unk_1006AF820);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for FMIPConfigValue();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  objc_super v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1006AE190 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  v23[1] = sub_1000606BC(v11, (uint64_t)qword_1006D1E98);
  v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "FMAirTagEducationalVideoViewController: Action button pressed", v14, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for FMIPConfigValue.batteryRecyclingLink(_:), v7);
  v23[2] = 0;
  v23[3] = 0xE000000000000000;
  FMIPGlobalConfig<A>(_:fallback:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  URL.init(string:)();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1000AFBAC((uint64_t)v2);
    v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "FMAirTagEducationalVideoViewController: Cannot open invalid URL", v17, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    id v18 = [self sharedApplication];
    URL._bridgeToObjectiveC()(v19);
    v21 = v20;
    sub_10014C1D0((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_10004588C((unint64_t *)&qword_1006AEA10, type metadata accessor for OpenExternalURLOptionsKey);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v18 openURL:v21 options:isa completionHandler:0];

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

@end