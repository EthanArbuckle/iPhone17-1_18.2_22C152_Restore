@interface MusicMessagesAppViewController
- (_TtC16MusicMessagesApp30MusicMessagesAppViewController)initWithCoder:(id)a3;
- (_TtC16MusicMessagesApp30MusicMessagesAppViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didStartSendingMessage:(id)a3 conversation:(id)a4;
- (void)viewDidLoad;
@end

@implementation MusicMessagesAppViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10002ED60();
}

- (void)dealloc
{
  v2 = self;
  sub_10002EF98();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp30MusicMessagesAppViewController__sharingViewController));
}

- (void)didStartSendingMessage:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_100483DD0();
  AnalyticsSendEvent();
}

- (_TtC16MusicMessagesApp30MusicMessagesAppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_100483E10();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC16MusicMessagesApp30MusicMessagesAppViewController__sharingViewController) = 0;
    id v6 = a4;
    NSString v7 = sub_100483DD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC16MusicMessagesApp30MusicMessagesAppViewController__sharingViewController) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MusicMessagesAppViewController();
  id v9 = [(MusicMessagesAppViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC16MusicMessagesApp30MusicMessagesAppViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicMessagesApp30MusicMessagesAppViewController__sharingViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MusicMessagesAppViewController();
  return [(MusicMessagesAppViewController *)&v5 initWithCoder:a3];
}

@end