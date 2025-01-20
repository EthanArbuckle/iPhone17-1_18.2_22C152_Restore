@interface CRLCollaboratorBaseStatusHUDController_mi
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
- (_TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi)init;
- (_TtP8Freeform23CRLStatusHUDManaging_mi_)manager;
- (double)height;
- (double)maximumShowDuration;
- (double)minimumShowDuration;
- (double)timeLeftToShow;
- (int64_t)type;
- (void)action;
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

@implementation CRLCollaboratorBaseStatusHUDController_mi

- (UIView)hudView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hudView));
}

- (void)setHudView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hudView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hudView) = (Class)a3;
  id v3 = a3;
}

- (UIView)containerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_containerView));
}

- (void)setContainerView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_containerView);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_containerView) = (Class)a3;
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
                           + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_type);
}

- (NSString)message
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x2B8);
  id v3 = self;
  v2();

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (double)minimumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_minimumShowDuration);
}

- (void)setMinimumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_minimumShowDuration) = a3;
}

- (double)maximumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_maximumShowDuration);
}

- (void)setMaximumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_maximumShowDuration) = a3;
}

- (NSDate)timeStartedShowing
{
  uint64_t v3 = sub_1005057FC(&qword_101672EB0);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_timeStartedShowing;
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
  v11 = (char *)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_timeStartedShowing;
  swift_beginAccess();
  uint64_t v12 = self;
  sub_1005E8B94((uint64_t)v8, (uint64_t)v11);
  swift_endAccess();
}

- (double)timeLeftToShow
{
  v2 = self;
  sub_100735180();
  double v4 = v3;

  return v4;
}

- (NSTimer)hideTimer
{
  return (NSTimer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideTimer));
}

- (void)setHideTimer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideTimer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideTimer) = (Class)a3;
  id v3 = a3;
}

- (BOOL)showing
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_showing);
}

- (void)setShowing:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_showing) = a3;
  id v3 = self;
  sub_100735400();
}

- (BOOL)animating
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_animating);
}

- (void)setAnimating:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_animating) = a3;
}

- (BOOL)hiding
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hiding);
}

- (void)setHiding:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hiding) = a3;
}

- (NSString)accessibilityAnnouncement
{
  if (*(void *)&self->hudView[OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_accessibilityAnnouncement])
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
                 + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_accessibilityAnnouncement);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (BOOL)swipable
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_swipable);
}

- (void)setSwipable:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_swipable) = a3;
}

- (UIGestureRecognizer)swipeGestureRecognizer
{
  return (UIGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_swipeGestureRecognizer));
}

- (void)setSwipeGestureRecognizer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_swipeGestureRecognizer);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_swipeGestureRecognizer) = (Class)a3;
  id v3 = a3;
}

- (void)swipedWithSender:(id)a3
{
  if (a3)
  {
    uint64_t v5 = self;
    id v4 = a3;
    sub_1009D18F4(1);
  }
}

- (BOOL)hideOnTouch
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideOnTouch);
}

- (void)setHideOnTouch:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideOnTouch) = a3;
}

- (double)height
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_height);
}

- (void)setHeight:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_height) = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_heightConstraint));
}

- (void)setHeightConstraint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_heightConstraint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_heightConstraint) = (Class)a3;
  id v3 = a3;
}

- (void)touchedHUDWithSender:(id)a3
{
  int v4 = *((unsigned __int8 *)&self->super.isa
       + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideOnTouch);
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  if (v4 == 1) {
    sub_1009D18F4(1);
  }
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong collabHUDActivated];
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

- (void)updateForAppearance
{
  NSString v2 = self;
  sub_100E39090();
}

- (void)action
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    int v4 = (void *)Strong;
    uint64_t v5 = self;
    [v4 collabHUDActivated];

    swift_unknownObjectRelease();
  }
}

- (_TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi)init
{
  result = (_TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hudView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_containerView));
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_manager);
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_delegate);
  sub_100517604((uint64_t)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_timeStartedShowing);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideTimer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_swipeGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_heightConstraint));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi____lazy_storage____label);
}

@end