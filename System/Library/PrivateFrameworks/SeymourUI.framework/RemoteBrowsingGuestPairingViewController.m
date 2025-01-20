@interface RemoteBrowsingGuestPairingViewController
- (_TtC9SeymourUI40RemoteBrowsingGuestPairingViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI40RemoteBrowsingGuestPairingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RemoteBrowsingGuestPairingViewController

- (_TtC9SeymourUI40RemoteBrowsingGuestPairingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A5D1A58();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A5CE890();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RemoteBrowsingGuestPairingViewController();
  id v4 = v5.receiver;
  [(RemoteBrowsingGuestPairingViewController *)&v5 viewDidDisappear:v3];
  sub_239F7F220();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_23A5CF0E0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_23A5CF524(a3);
}

- (_TtC9SeymourUI40RemoteBrowsingGuestPairingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI40RemoteBrowsingGuestPairingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI40RemoteBrowsingGuestPairingViewController_animationImageView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI40RemoteBrowsingGuestPairingViewController_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI40RemoteBrowsingGuestPairingViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI40RemoteBrowsingGuestPairingViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI40RemoteBrowsingGuestPairingViewController_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI40RemoteBrowsingGuestPairingViewController_stackView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end