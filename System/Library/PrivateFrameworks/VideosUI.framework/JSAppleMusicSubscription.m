@interface JSAppleMusicSubscription
- (_TtC8VideosUI24JSAppleMusicSubscription)init;
- (_TtC8VideosUI24JSAppleMusicSubscription)initWithAppContext:(id)a3;
- (void)musicSubscriptionStatusHasChanged;
- (void)refreshAppleMusicSubscriptionStatusWithJsCallback:(id)a3;
@end

@implementation JSAppleMusicSubscription

- (void)refreshAppleMusicSubscriptionStatusWithJsCallback:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E352DD30(v4);
}

- (void)musicSubscriptionStatusHasChanged
{
  v2 = self;
  sub_1E352E478();
}

- (_TtC8VideosUI24JSAppleMusicSubscription)initWithAppContext:(id)a3
{
  id v3 = a3;
  sub_1E352E6EC();
}

- (_TtC8VideosUI24JSAppleMusicSubscription)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24JSAppleMusicSubscription_musicSubscriptionStatusController));
}

@end