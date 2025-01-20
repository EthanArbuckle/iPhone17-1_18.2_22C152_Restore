@interface CRLPersistentFollowHUDController
- (BOOL)animating;
- (BOOL)hideOnTouch;
- (BOOL)hiding;
- (BOOL)showing;
- (BOOL)swipable;
- (NSDate)timeStartedShowing;
- (NSLayoutConstraint)heightConstraint;
- (NSString)accessibilityAnnouncement;
- (NSString)message;
- (NSTimer)hideTimer;
- (UIGestureRecognizer)swipeGestureRecognizer;
- (UIView)containerView;
- (UIView)hudView;
- (_TtC8Freeform32CRLPersistentFollowHUDController)init;
- (_TtC8Freeform32CRLPersistentFollowHUDController)initWithManager:(id)a3 followingParticipant:(id)a4 delegate:(id)a5 canvasWidth:(double)a6 accessibilityExperienceCoordinator:(id)a7 stopButtonClickedHandler:(id)a8;
- (_TtP8Freeform23CRLStatusHUDManaging_mi_)manager;
- (double)height;
- (double)maximumShowDuration;
- (double)minimumShowDuration;
- (double)timeLeftToShow;
- (id)viewControllerForLargeContentViewerInteraction:(id)a3;
- (int64_t)type;
- (void)setAccessibilityAnnouncement:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setHeight:(double)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setHideOnTouch:(BOOL)a3;
- (void)setHideTimer:(id)a3;
- (void)setHiding:(BOOL)a3;
- (void)setHudView:(id)a3;
- (void)setManager:(id)a3;
- (void)setMaximumShowDuration:(double)a3;
- (void)setMinimumShowDuration:(double)a3;
- (void)setShowing:(BOOL)a3;
- (void)setSwipable:(BOOL)a3;
- (void)setSwipeGestureRecognizer:(id)a3;
- (void)setTimeStartedShowing:(id)a3;
- (void)stopButtonClickedWithSender:(id)a3;
- (void)updateForAppearance;
@end

@implementation CRLPersistentFollowHUDController

- (UIView)hudView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hudView));
}

- (void)setHudView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hudView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hudView) = (Class)a3;
  id v3 = a3;
}

- (UIView)containerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_containerView));
}

- (void)setContainerView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_containerView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_containerView) = (Class)a3;
  id v3 = a3;
}

- (_TtP8Freeform23CRLStatusHUDManaging_mi_)manager
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP8Freeform23CRLStatusHUDManaging_mi_ *)Strong;
}

- (void)setManager:(id)a3
{
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_type);
}

- (NSString)message
{
  v2 = self;
  sub_10091E328();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (double)minimumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_minimumShowDuration);
}

- (void)setMinimumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_minimumShowDuration) = a3;
}

- (double)maximumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_maximumShowDuration);
}

- (void)setMaximumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_maximumShowDuration) = a3;
}

- (NSDate)timeStartedShowing
{
  uint64_t v3 = sub_1005057FC(&qword_101672EB0);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_timeStartedShowing;
  swift_beginAccess();
  sub_100522E9C((uint64_t)v7, (uint64_t)v6, &qword_101672EB0);
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return (NSDate *)isa;
}

- (void)setTimeStartedShowing:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672EB0);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = (char *)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_timeStartedShowing;
  swift_beginAccess();
  uint64_t v12 = self;
  sub_1005E8B94((uint64_t)v8, (uint64_t)v11);
  swift_endAccess();
}

- (double)timeLeftToShow
{
  return 0.0;
}

- (NSTimer)hideTimer
{
  return (NSTimer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hideTimer));
}

- (void)setHideTimer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hideTimer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hideTimer) = (Class)a3;
  id v3 = a3;
}

- (BOOL)showing
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_showing);
}

- (void)setShowing:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_showing) = a3;
}

- (BOOL)animating
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_animating);
}

- (void)setAnimating:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_animating) = a3;
}

- (BOOL)hiding
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hiding);
}

- (void)setHiding:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hiding) = a3;
}

- (NSString)accessibilityAnnouncement
{
  if (*(void *)&self->followingParticipant[OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_accessibilityAnnouncement])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setAccessibilityAnnouncement:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_accessibilityAnnouncement);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (BOOL)swipable
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_swipable);
}

- (void)setSwipable:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_swipable) = a3;
}

- (UIGestureRecognizer)swipeGestureRecognizer
{
  return (UIGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_swipeGestureRecognizer));
}

- (void)setSwipeGestureRecognizer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_swipeGestureRecognizer);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_swipeGestureRecognizer) = (Class)a3;
  id v3 = a3;
}

- (BOOL)hideOnTouch
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hideOnTouch);
}

- (void)setHideOnTouch:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hideOnTouch) = a3;
}

- (double)height
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_height);
}

- (void)setHeight:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_height) = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_heightConstraint));
}

- (void)setHeightConstraint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_heightConstraint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_heightConstraint) = (Class)a3;
  id v3 = a3;
}

- (void)stopButtonClickedWithSender:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_stopButtonClickedHandler);
  if (v3)
  {
    swift_unknownObjectRetain();
    uint64_t v6 = self;
    uint64_t v5 = sub_1005173A0((uint64_t)v3);
    v3(v5);
    sub_1005174AC((uint64_t)v3);
    swift_unknownObjectRelease();
  }
}

- (_TtC8Freeform32CRLPersistentFollowHUDController)initWithManager:(id)a3 followingParticipant:(id)a4 delegate:(id)a5 canvasWidth:(double)a6 accessibilityExperienceCoordinator:(id)a7 stopButtonClickedHandler:(id)a8
{
  uint64_t v13 = _Block_copy(a8);
  if (v13)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    uint64_t v13 = sub_1005E2108;
  }
  else
  {
    uint64_t v14 = 0;
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v15 = a4;
  swift_unknownObjectRetain();
  id v16 = a7;

  return (_TtC8Freeform32CRLPersistentFollowHUDController *)sub_1009205BC((uint64_t)a3, v15, (uint64_t)a5, a7, (uint64_t)v13, v14, a6);
}

- (_TtC8Freeform32CRLPersistentFollowHUDController)init
{
  result = (_TtC8Freeform32CRLPersistentFollowHUDController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_followingParticipant));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_containerView));
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_manager);
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_delegate);
  swift_unknownObjectWeakDestroy();
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_timeStartedShowing, &qword_101672EB0);

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_swipeGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_heightConstraint));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  sub_1005174AC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_stopButtonClickedHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController____lazy_storage___participantColor));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController____lazy_storage____label);
}

- (void)updateForAppearance
{
  NSString v2 = self;
  sub_100E39090();
  id v3 = [*(id *)((char *)&v2->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hudView) layer];
  id v4 = sub_10091E650();
  id v5 = [v4 UIColor];

  id v6 = [v5 CGColor];
  [v3 setBackgroundColor:v6];
}

- (id)viewControllerForLargeContentViewerInteraction:(id)a3
{
  id Strong = (id)swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    id Strong = [objc_allocWithZone((Class)UIViewController) init];
  }

  return Strong;
}

@end