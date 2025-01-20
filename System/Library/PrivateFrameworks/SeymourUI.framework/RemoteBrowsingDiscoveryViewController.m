@interface RemoteBrowsingDiscoveryViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (NSArray)preferredFocusEnvironments;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UILabel)accessibilityTitleLabel;
- (_TtC9SeymourUI37RemoteBrowsingDiscoveryViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI37RemoteBrowsingDiscoveryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)handleKohnahmiCodeSequence;
- (void)handleMenuButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RemoteBrowsingDiscoveryViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_collectionView);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI37RemoteBrowsingDiscoveryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239E34E60();
}

- (void)handleKohnahmiCodeSequence
{
  uint64_t v3 = sub_23A7FEE28();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_23A7FE868();
  sub_23A7FEE08();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_23A18290C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_239E31E38();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_239E32748(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_239E32B6C(a3);
}

- (void)handleMenuButtonTapped
{
  v2 = self;
  sub_239E32DA4();
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_titleLabel));
}

- (_TtC9SeymourUI37RemoteBrowsingDiscoveryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI37RemoteBrowsingDiscoveryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_currentlyConnectingCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_promptLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_promptIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_menuGestureRecognizer));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_playPauseGestureRecognizer);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  uint64_t v5 = type metadata accessor for RemoteBrowsingDiscoveryPresenter.State(0);
  MEMORY[0x270FA5388](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_presenter)
     + OBJC_IVAR____TtC9SeymourUI32RemoteBrowsingDiscoveryPresenter_state;
  swift_beginAccess();
  sub_239E35748((uint64_t)v8, (uint64_t)v7, type metadata accessor for RemoteBrowsingDiscoveryPresenter.State);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    sub_239E357B0((uint64_t)v7, type metadata accessor for RemoteBrowsingDiscoveryPresenter.State);
  }
  else
  {
    uint64_t v10 = sub_23A7F89A8();
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v7, v10);
  }
  return EnumCaseMultiPayload == 0;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_23A7F6B08();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F6AA8();
  id v10 = a3;
  v11 = self;
  unint64_t v12 = sub_23A7F6AE8();
  sub_23A18A7E0(v12);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  double v10 = sub_239E35570(v7);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

@end