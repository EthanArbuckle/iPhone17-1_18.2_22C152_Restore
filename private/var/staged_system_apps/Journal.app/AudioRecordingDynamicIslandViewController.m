@interface AudioRecordingDynamicIslandViewController
- (BOOL)_canShowWhileLocked;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIColor)keyColor;
- (_TtC7Journal41AudioRecordingDynamicIslandViewController)initWithCoder:(id)a3;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation AudioRecordingDynamicIslandViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC7Journal41AudioRecordingDynamicIslandViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  v4 = self;
  sub_1005C4BA8(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1005C544C();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC7Journal41AudioRecordingDynamicIslandViewController)initWithCoder:(id)a3
{
  return (_TtC7Journal41AudioRecordingDynamicIslandViewController *)sub_1005C5B6C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal41AudioRecordingDynamicIslandViewController____lazy_storage___leadingWaveformView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal41AudioRecordingDynamicIslandViewController____lazy_storage___trailingAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal41AudioRecordingDynamicIslandViewController____lazy_storage___minimalWaveformView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal41AudioRecordingDynamicIslandViewController____lazy_storage___minimalCheckmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal41AudioRecordingDynamicIslandViewController____lazy_storage___minimalAccessoryView));
  v3 = (char *)self + OBJC_IVAR____TtC7Journal41AudioRecordingDynamicIslandViewController__updateLink;
  uint64_t v4 = sub_100010218(&qword_100812A60);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (SBUISystemApertureAccessoryView)leadingView
{
  v2 = self;
  id v3 = sub_1005C5218(&OBJC_IVAR____TtC7Journal41AudioRecordingDynamicIslandViewController____lazy_storage___leadingWaveformView, (uint64_t (*)(uint64_t))sub_1005C4D14);

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  v2 = self;
  id v3 = sub_1005C5218(&OBJC_IVAR____TtC7Journal41AudioRecordingDynamicIslandViewController____lazy_storage___trailingAccessoryView, (uint64_t (*)(uint64_t))sub_1005C4F04);

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  v2 = self;
  id v3 = sub_1005C5218(&OBJC_IVAR____TtC7Journal41AudioRecordingDynamicIslandViewController____lazy_storage___minimalAccessoryView, (uint64_t (*)(uint64_t))sub_1005C527C);

  return (SBUISystemApertureAccessoryView *)v3;
}

- (UIColor)keyColor
{
  uint64_t v3 = type metadata accessor for ColorResource();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001B284(0, (unint64_t *)&qword_1007FC140);
  uint64_t v7 = qword_1007F7F88;
  v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_100026A54(v3, (uint64_t)qword_10083EFB8);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v9, v3);
  v10 = (void *)UIColor.init(resource:)();
  id v11 = [(AudioRecordingDynamicIslandViewController *)v8 traitCollection];
  id v12 = [v10 resolvedColorWithTraitCollection:v11];

  return (UIColor *)v12;
}

- (int64_t)contentRole
{
  return 2;
}

- (int64_t)preferredLayoutMode
{
  return 3;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v8[4] = sub_1005C6AE8;
  v8[5] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_1005C49E0;
  v8[3] = &unk_1007B6FE8;
  v6 = _Block_copy(v8);
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  swift_release();
  [a3 animateAlongsideTransition:v6 completion:0];
  _Block_release(v6);
  swift_unknownObjectRelease();
}

@end