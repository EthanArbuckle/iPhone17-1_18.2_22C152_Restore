@interface CRLTransientStartEndFollowHUDController
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
- (_TtC8Freeform39CRLTransientStartEndFollowHUDController)init;
- (_TtC8Freeform39CRLTransientStartEndFollowHUDController)initWithManager:(id)a3 followingParticipant:(id)a4 delegate:(id)a5 canvasWidth:(double)a6 isStartFollow:(BOOL)a7;
- (_TtC8Freeform39CRLTransientStartEndFollowHUDController)initWithManager:(id)a3 numberOfParticipants:(int64_t)a4 delegate:(id)a5 canvasWidth:(double)a6 isStartFollow:(BOOL)a7;
- (_TtP8Freeform23CRLStatusHUDManaging_mi_)manager;
- (double)height;
- (double)maximumShowDuration;
- (double)minimumShowDuration;
- (double)timeLeftToShow;
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
- (void)swipedWithSender:(id)a3;
- (void)touchedHUDWithSender:(id)a3;
- (void)updateForAppearance;
@end

@implementation CRLTransientStartEndFollowHUDController

- (UIView)hudView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hudView));
}

- (void)setHudView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hudView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hudView) = (Class)a3;
  id v3 = a3;
}

- (UIView)containerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_containerView));
}

- (void)setContainerView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_containerView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_containerView) = (Class)a3;
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
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_type);
}

- (NSString)message
{
  v2 = self;
  sub_100736F9C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (double)minimumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_minimumShowDuration);
}

- (void)setMinimumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_minimumShowDuration) = a3;
}

- (double)maximumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_maximumShowDuration);
}

- (void)setMaximumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_maximumShowDuration) = a3;
}

- (NSDate)timeStartedShowing
{
  uint64_t v3 = sub_1005057FC(&qword_101672EB0);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_timeStartedShowing;
  swift_beginAccess();
  sub_100541258((uint64_t)v7, (uint64_t)v6);
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
  v11 = (char *)self + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_timeStartedShowing;
  swift_beginAccess();
  uint64_t v12 = self;
  sub_1005E8B94((uint64_t)v8, (uint64_t)v11);
  swift_endAccess();
}

- (double)timeLeftToShow
{
  v2 = self;
  sub_1007366E4();
  double v4 = v3;

  return v4;
}

- (NSTimer)hideTimer
{
  return (NSTimer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideTimer));
}

- (void)setHideTimer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideTimer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideTimer) = (Class)a3;
  id v3 = a3;
}

- (BOOL)showing
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_showing);
}

- (void)setShowing:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_showing) = a3;
  id v3 = self;
  sub_10073696C();
}

- (BOOL)animating
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_animating);
}

- (void)setAnimating:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_animating) = a3;
}

- (BOOL)hiding
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hiding);
}

- (void)setHiding:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hiding) = a3;
}

- (NSString)accessibilityAnnouncement
{
  if (*(void *)&self->followingParticipantInfo[OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_accessibilityAnnouncement])
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
  uint64_t v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_accessibilityAnnouncement);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (BOOL)swipable
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_swipable);
}

- (void)setSwipable:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_swipable) = a3;
}

- (UIGestureRecognizer)swipeGestureRecognizer
{
  return (UIGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_swipeGestureRecognizer));
}

- (void)setSwipeGestureRecognizer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_swipeGestureRecognizer);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_swipeGestureRecognizer) = (Class)a3;
  id v3 = a3;
}

- (void)swipedWithSender:(id)a3
{
  if (a3)
  {
    uint64_t v5 = self;
    id v4 = a3;
    sub_1009D191C(1);
  }
}

- (BOOL)hideOnTouch
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideOnTouch);
}

- (void)setHideOnTouch:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideOnTouch) = a3;
}

- (double)height
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_height);
}

- (void)setHeight:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_height) = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_heightConstraint));
}

- (void)setHeightConstraint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_heightConstraint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_heightConstraint) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform39CRLTransientStartEndFollowHUDController)initWithManager:(id)a3 followingParticipant:(id)a4 delegate:(id)a5 canvasWidth:(double)a6 isStartFollow:(BOOL)a7
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v12 = a4;
  swift_unknownObjectRetain();

  return (_TtC8Freeform39CRLTransientStartEndFollowHUDController *)sub_100738B10((uint64_t)a3, v12, (uint64_t)a5, a7, a6);
}

- (_TtC8Freeform39CRLTransientStartEndFollowHUDController)initWithManager:(id)a3 numberOfParticipants:(int64_t)a4 delegate:(id)a5 canvasWidth:(double)a6 isStartFollow:(BOOL)a7
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();

  return (_TtC8Freeform39CRLTransientStartEndFollowHUDController *)sub_100738D34((uint64_t)a3, (void *)a4, (uint64_t)a5, a7, a6);
}

- (_TtC8Freeform39CRLTransientStartEndFollowHUDController)init
{
  result = (_TtC8Freeform39CRLTransientStartEndFollowHUDController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1007389C0(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_followingParticipantInfo), self->followingParticipantInfo[OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_followingParticipantInfo]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hudView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_containerView));
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_manager);
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_delegate);
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_timeStartedShowing, &qword_101672EB0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideTimer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_swipeGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_heightConstraint));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController____lazy_storage____label);
}

- (void)touchedHUDWithSender:(id)a3
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideOnTouch) == 1)
  {
    swift_unknownObjectRetain();
    id v4 = self;
    sub_1009D191C(1);
    swift_unknownObjectRelease();
  }
}

- (void)updateForAppearance
{
  NSString v2 = self;
  sub_100E39090();
}

@end