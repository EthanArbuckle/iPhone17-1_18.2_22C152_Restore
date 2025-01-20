@interface FMMapViewController
- (BOOL)canRotateForHeading;
- (BOOL)hasUserLocation;
- (BOOL)isCurrentlyRotated;
- (_TtC6FindMy19FMMapViewController)initWithCoder:(id)a3;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (int64_t)userTrackingMode;
- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5;
- (void)cardPositionChangedWithNotification:(id)a3;
- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4;
- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4;
- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5;
- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4;
- (void)mapViewDidStartUserInteraction:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation FMMapViewController

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  sub_100006060(0, &qword_1006BD9B8);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_100014FEC(v6);

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMMapViewController();
  v2 = v3.receiver;
  [(FMMapViewController *)&v3 viewDidLoad];
  sub_100022F98();
  sub_10002CF4C();
  sub_100030210(1, 0, 0);
  v2[OBJC_IVAR____TtC6FindMy19FMMapViewController_isAnimationEnabled] = 1;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  v8 = sub_100010944(v6, (uint64_t)a4);

  swift_unknownObjectRelease();

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMMapViewController();
  id v4 = v6.receiver;
  [(FMMapViewController *)&v6 viewWillAppear:v3];
  sub_100029D00();
  id v5 = [self defaultCenter];
  if (qword_1006AE480 != -1) {
    swift_once();
  }
  [v5 addObserver:v4 selector:"cardPositionChangedWithNotification:" name:qword_1006D2978 object:0];
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  uint64_t v6 = sub_10005D034((uint64_t *)&unk_1006AF6E0);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = *((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC6FindMy19FMMapViewController_isAutomaticCenteringEnabled);
  id v10 = a3;
  v11 = self;
  if ((v9 & 1) == 0)
  {
    Date.init()();
    uint64_t v12 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 0, 1, v12);
    uint64_t v13 = (uint64_t)v11 + OBJC_IVAR____TtC6FindMy19FMMapViewController_lastCenterAnimationDisableDate;
    swift_beginAccess();
    sub_10040BB40((uint64_t)v8, v13);
    swift_endAccess();
  }
  sub_100036200(1);
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  id v8 = [v11 annotations];
  sub_10005D034(&qword_1006BD9C0);
  unint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v10 == 1) {
    sub_100030210(1, 0, 0);
  }
}

- (void)cardPositionChangedWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = self;
  sub_1000290D0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10002EC48(v5);
}

- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1000360D8();
}

- (int64_t)userTrackingMode
{
  return (int64_t)[*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy19FMMapViewController_mapView) userTrackingMode];
}

- (BOOL)hasUserLocation
{
  return [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy19FMMapViewController_mapView) hasUserLocation];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10000F124(a3);
}

- (_TtC6FindMy19FMMapViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100408834();
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1003FF080(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC6FindMy19FMMapViewController_isAutomaticCenteringEnabled) = 1;
  id v4 = a3;
  id v5 = self;
  sub_100029D00();
  sub_100030210(1, 0, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for FMMapViewController();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[FMMapViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_10040C85C;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10045D478;
  v11[3] = &unk_10063A970;
  uint64_t v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:0 completion:v9];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy19FMMapViewController_lastCenterAnimationDisableDate, (uint64_t *)&unk_1006AF6E0);

  swift_release();
  swift_release();
  sub_100057E74((uint64_t)self + OBJC_IVAR____TtC6FindMy19FMMapViewController_previousSelectedSection, (uint64_t (*)(void))type metadata accessor for FMSelectedSection);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMMapViewController_mapOptionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMMapViewController_statusBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMMapViewController_compassButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy19FMMapViewController_userTrackingAnnotationView);
}

- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10040899C();
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  id v8 = sub_100408AD0((uint64_t)a4);

  swift_unknownObjectRelease();

  return v8;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100408DCC(v7);
}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10040B250(v7);
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = self;
  sub_10040B820(a4);
}

- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5
{
  id v7 = self;
  sub_10040BBA8(a3, a5);
}

- (BOOL)canRotateForHeading
{
  return [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy19FMMapViewController_mapView) canRotateForHeading];
}

- (BOOL)isCurrentlyRotated
{
  return [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy19FMMapViewController_mapView) isCurrentlyRotated];
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  uint64_t v5 = sub_10005D034((uint64_t *)&unk_1006AF6E0);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC6FindMy19FMMapViewController_isAutomaticCenteringEnabled) = 0;
  id v8 = a3;
  uint64_t v9 = self;
  Date.init()();
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  uint64_t v11 = (uint64_t)v9 + OBJC_IVAR____TtC6FindMy19FMMapViewController_lastCenterAnimationDisableDate;
  swift_beginAccess();
  sub_10040BB40((uint64_t)v7, v11);
  swift_endAccess();
}

@end