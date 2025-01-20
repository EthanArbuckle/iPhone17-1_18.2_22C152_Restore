@interface FMFriendLocationAlertsViewController
- (_TtC6FindMy36FMFriendLocationAlertsViewController)initWithCoder:(id)a3;
- (void)handleFenceTapWithGestureRecognizer:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMFriendLocationAlertsViewController

- (_TtC6FindMy36FMFriendLocationAlertsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100158E48();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100154444(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100154604(a3);
}

- (void)handleFenceTapWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10015686C(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy36FMFriendLocationAlertsViewController_myFences));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy36FMFriendLocationAlertsViewController_friendFences));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy36FMFriendLocationAlertsViewController_friend, &qword_1006AF740);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end