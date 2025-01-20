@interface EngagementPopoverViewController
- (_TtC5Books31EngagementPopoverViewController)initWithCoder:(id)a3;
- (_TtC5Books31EngagementPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)messageViewController:(id)a3 didSelectActionWithURL:(id)a4;
- (void)messageViewControllerDidSelectCancel:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
@end

@implementation EngagementPopoverViewController

- (_TtC5Books31EngagementPopoverViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1007B4BF0();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1007B4CAC();
}

- (_TtC5Books31EngagementPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Books31EngagementPopoverViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books31EngagementPopoverViewController_eventHandler);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books31EngagementPopoverViewController_popoverVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books31EngagementPopoverViewController____lazy_storage___amsEngagement));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books31EngagementPopoverViewController_messageViewControllerProvider));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books31EngagementPopoverViewController_currentRequestDisplayed);
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9 = sub_1007FDC70();
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1007B4D28(a4, v9, v11);

  swift_bridgeObjectRelease();
}

- (void)messageViewControllerDidSelectCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1007B445C(v4);
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);

  _Block_release(v5);
}

- (void)messageViewController:(id)a3 didSelectActionWithURL:(id)a4
{
  uint64_t v4 = sub_1007F29D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2990();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end