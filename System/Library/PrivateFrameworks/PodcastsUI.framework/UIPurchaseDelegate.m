@interface UIPurchaseDelegate
- (_TtC10PodcastsUI18UIPurchaseDelegate)init;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation UIPurchaseDelegate

- (_TtC10PodcastsUI18UIPurchaseDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10PodcastsUI18UIPurchaseDelegate_senderWindow) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UIPurchaseDelegate();
  return [(UIPurchaseDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
}

@end