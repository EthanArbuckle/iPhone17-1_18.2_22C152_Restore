@interface CRLApplicationCoordinator
+ (_TtC8Freeform25CRLApplicationCoordinator)shared;
- (BOOL)isActivating;
- (BOOL)isInBackground;
- (BOOL)isTerminating;
- (_TtC8Freeform25CRLApplicationCoordinator)init;
- (void)applicationDidBecomeActive;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)applicationWillTerminate;
- (void)setIsActivating:(BOOL)a3;
- (void)setIsInBackground:(BOOL)a3;
- (void)setIsTerminating:(BOOL)a3;
@end

@implementation CRLApplicationCoordinator

- (BOOL)isActivating
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isActivating);
}

- (void)setIsActivating:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isActivating) = a3;
}

- (BOOL)isInBackground
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isInBackground);
}

- (void)setIsInBackground:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isInBackground) = a3;
}

- (BOOL)isTerminating
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isTerminating);
}

- (void)setIsTerminating:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isTerminating) = a3;
}

+ (_TtC8Freeform25CRLApplicationCoordinator)shared
{
  if (qword_10166F7C8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10168DB10;

  return (_TtC8Freeform25CRLApplicationCoordinator *)v2;
}

- (void)applicationWillEnterForeground
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isActivating) = 1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isInBackground) = 0;
}

- (void)applicationDidBecomeActive
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isActivating) = 0;
}

- (void)applicationDidEnterBackground
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isInBackground) = 1;
}

- (void)applicationWillTerminate
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isTerminating) = 1;
}

- (_TtC8Freeform25CRLApplicationCoordinator)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isActivating) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isInBackground) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isTerminating) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLApplicationCoordinator();
  return [(CRLApplicationCoordinator *)&v3 init];
}

@end