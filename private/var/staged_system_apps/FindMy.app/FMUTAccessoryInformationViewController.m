@interface FMUTAccessoryInformationViewController
- (_TtC6FindMy38FMUTAccessoryInformationViewController)initWithCoder:(id)a3;
- (_TtC6FindMy38FMUTAccessoryInformationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelAction;
- (void)continueOnDisableWebsiteAction;
- (void)continueOnWebsiteAction;
- (void)doneAction;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMUTAccessoryInformationViewController

- (_TtC6FindMy38FMUTAccessoryInformationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100187500();
}

- (void)viewDidLoad
{
  uint64_t v3 = type metadata accessor for FMIPUnknownItem();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (objc_class *)type metadata accessor for FMUTAccessoryInformationViewController();
  v11.receiver = self;
  v11.super_class = v7;
  v8 = self;
  [(FMUTAccessoryInformationViewController *)&v11 viewDidLoad];
  v9 = (char *)v8 + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_unknownItem;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_100183890((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10017E114(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10017E2D0(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMUTAccessoryInformationViewController();
  [(FMUTAccessoryInformationViewController *)&v4 viewWillAppear:v3];
}

- (void)scrollViewDidScroll:(id)a3
{
  BOOL v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_scrollHandler);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    sub_1000B7838((uint64_t)v3);
    v3(v5);
    sub_100036B90((uint64_t)v3);
  }
}

- (void)doneAction
{
}

- (void)cancelAction
{
}

- (void)continueOnWebsiteAction
{
  v2 = self;
  sub_100182020();
}

- (void)continueOnDisableWebsiteAction
{
  v2 = self;
  sub_1001823CC();
}

- (_TtC6FindMy38FMUTAccessoryInformationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy38FMUTAccessoryInformationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100036B90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_scrollHandler));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_updateQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_scrollContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_footnoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_playerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_productImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_heatZone));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_productImage));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_waitingView));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_unknownItem;
  uint64_t v4 = type metadata accessor for FMIPUnknownItem();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_nfcURL, (uint64_t *)&unk_1006AF820);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end