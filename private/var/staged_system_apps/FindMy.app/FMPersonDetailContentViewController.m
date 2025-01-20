@interface FMPersonDetailContentViewController
- (_TtC6FindMy35FMPersonDetailContentViewController)initWithCoder:(id)a3;
- (void)handleContact;
- (void)handleDirections;
- (void)handleFavorite;
- (void)handleFind;
- (void)handleInnaccurateLocationAttentionTap;
- (void)handleLocationLabel;
- (void)handleNotificationsOffAttentionTap;
- (void)handleRemoveFriend;
- (void)handleStartFollowing;
- (void)handleStartSharing;
- (void)handleStopSharing;
- (void)handleTapNotificationsPausedAttention;
- (void)handleUnfavorite;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMPersonDetailContentViewController

- (_TtC6FindMy35FMPersonDetailContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100136014();
}

- (void)viewDidLoad
{
  v2 = self;
  id v3 = [(FMPersonDetailContentViewController *)v2 view];
  if (v3)
  {
    v4 = v3;
    [v3 setFrame:CGRectMake(0.0, 0.0, 100.0, 100.0)];

    v5.receiver = v2;
    v5.super_class = (Class)type metadata accessor for FMPersonDetailContentViewController();
    [(FMBaseContentViewController *)&v5 viewDidLoad];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10012341C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100123618(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100123798(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100123F90();
}

- (void)handleDirections
{
  v2 = self;
  sub_10012C710();
}

- (void)handleFind
{
  v2 = self;
  sub_10012CC4C();
}

- (void)handleLocationLabel
{
  v2 = self;
  sub_10012EA74();
}

- (void)handleContact
{
  v2 = self;
  sub_10012F2E0();
}

- (void)handleStartFollowing
{
  v2 = self;
  sub_10012F5D4();
}

- (void)handleRemoveFriend
{
  v2 = self;
  sub_100130200();
}

- (void)handleStartSharing
{
  v2 = self;
  sub_100130478();
}

- (void)handleStopSharing
{
  v2 = self;
  sub_100130940();
}

- (void)handleTapNotificationsPausedAttention
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for FMPauseNotificationsViewController());
  v4 = self;
  uint64_t v5 = swift_retain();
  id v6 = sub_100417174(v5);
  id v7 = objc_allocWithZone((Class)type metadata accessor for FMActivityIndicatingNavigationController());
  id v8 = v6;
  id v9 = sub_1000BE210(v8, 2);
  [(FMPersonDetailContentViewController *)v4 presentViewController:v9 animated:1 completion:0];
}

- (void)handleFavorite
{
  v2 = self;
  sub_10013268C();
}

- (void)handleUnfavorite
{
  v2 = self;
  sub_1001326F4();
}

- (void)handleInnaccurateLocationAttentionTap
{
  v2 = self;
  sub_100132A14();
}

- (void)handleNotificationsOffAttentionTap
{
  v2 = self;
  sub_100136A84();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_findingExperiencePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_contactButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_directionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_findButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_notifications));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_timeRemaining));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_inaccurateAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_notificationsPausedAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_stewieLocationAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_notificationsOffAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_errorConditionsAttentionModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_favoriteButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_unfavoriteButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_nameThisLocationButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_startFollowingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_startSharingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_stopSharingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_removeFriendButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_firstButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_actionButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_verticalStackBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_presentedModelViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_connectionManager));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_peerToken));
  swift_release();
  swift_release();
  swift_release();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_startDiscoveryTimestamp, (uint64_t *)&unk_1006AF6E0);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_peopleFindingAnalytics, &qword_1006B27C0);
}

@end