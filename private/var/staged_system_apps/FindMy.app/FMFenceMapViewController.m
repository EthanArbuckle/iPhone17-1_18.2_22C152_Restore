@interface FMFenceMapViewController
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)searchBarShouldEndEditing:(id)a3;
- (_TtC6FindMy24FMFenceMapViewController)initWithCoder:(id)a3;
- (_TtC6FindMy24FMFenceMapViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelActionWithSender:(id)a3;
- (void)chooseLargeRadiusActionWithSender:(id)a3;
- (void)chooseMediumRadiusActionWithSender:(id)a3;
- (void)chooseSmallRadiusActionWithSender:(id)a3;
- (void)didStopDraggingHandle:(id)a3;
- (void)doneActionWithSender:(id)a3;
- (void)longPressActionWithSender:(id)a3;
- (void)mapView:(id)a3 annotationView:(id)a4 didChangeDragState:(unint64_t)a5 fromOldState:(unint64_t)a6;
- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)refreshActionWithSender:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willStartDraggingHandle:(id)a3;
@end

@implementation FMFenceMapViewController

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = sub_1002854AC();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_100283DEC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return UITableViewAutomaticDimension;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1002845D4((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100432D04(v6, v7);
}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100433C3C(v7);
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100433D94(v6);
}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_dragView);
  if (v4) {
    [v4 removeHandle:0 a4];
  }
  else {
    __break(1u);
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_dragView);
  if (v5) {
    [v5 addHandleForAnnotation:[self selectedAnnotation]];
  }
  else {
    __break(1u);
  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  id v8 = sub_1004334D4(v6, a4);

  swift_unknownObjectRelease();

  return v8;
}

- (void)mapView:(id)a3 annotationView:(id)a4 didChangeDragState:(unint64_t)a5 fromOldState:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_100433F28(v10, a5);
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  id v7 = sub_100433A5C(v5);

  swift_unknownObjectRelease();

  return v7;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v10 = self;
  id v5 = [v4 searchBar];
  id v6 = [v5 text];

  if (v6)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    sub_100465070(v7, v9);
    swift_bridgeObjectRelease();
  }
  else
  {
  }
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10045A61C(v4);

  return 1;
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  if ((*((unsigned char *)&self->super.super.super.isa
        + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_isResigningFromTableView) & 1) == 0)
  {
    v3 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_searchResultsTableView);
    if (!v3)
    {
      __break(1u);
      return (char)v3;
    }
    [v3 setHidden:1];
  }
  LOBYTE(v3) = 1;
  return (char)v3;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10045A838(v4);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10045AA44(v4);
}

- (_TtC6FindMy24FMFenceMapViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10046E3FC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10045EE0C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  sub_10045F068((id)v3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_10045F210((uint64_t)a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = self;
  sub_10046E804(a4);
  swift_unknownObjectRelease();
}

- (void)willStartDraggingHandle:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100467EF0(a3);
}

- (void)didStopDraggingHandle:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100468004(a3);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10046EAE4();
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4 = (_TtC6FindMy24FMFenceMapViewController *)a3;
  uint64_t v8 = self;
  id v5 = [(FMFenceMapViewController *)v8 navigationItem];
  id v6 = [v5 searchController];

  if (v6)
  {
    uint64_t v7 = (_TtC6FindMy24FMFenceMapViewController *)[v6 searchBar];

    [(FMFenceMapViewController *)v7 resignFirstResponder];
    id v4 = v8;
    uint64_t v8 = v7;
  }
}

- (void)chooseSmallRadiusActionWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100467A04(0x4059000000000000, 0);
}

- (void)chooseMediumRadiusActionWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100467A04(0x406F400000000000, 0);
}

- (void)chooseLargeRadiusActionWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100467A04(0x4077700000000000, 0);
}

- (void)longPressActionWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004684D4(v4);
}

- (void)refreshActionWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10046EB8C();
}

- (void)doneActionWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100466C98();
}

- (void)cancelActionWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (*((unsigned char *)&v4->super.super.super.isa + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_isOtherUsage) == 1)
  {
    id v5 = (_TtC6FindMy24FMFenceMapViewController *)[(FMFenceMapViewController *)v4 navigationController];
    if (v5)
    {
      id v6 = v5;
      id v7 = [(FMFenceMapViewController *)v5 popViewControllerAnimated:1];

      id v4 = v6;
    }
  }
  else
  {
    [(FMFenceMapViewController *)v4 dismissViewControllerAnimated:1 completion:0];
  }

  sub_10002CEFC((uint64_t)&v8);
}

- (_TtC6FindMy24FMFenceMapViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy24FMFenceMapViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_myLocation, (uint64_t *)&unk_1006AF710);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_selectedLocation));
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_address, &qword_1006AF730);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_addressType, (uint64_t *)&unk_1006BF070);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_addressLabel, &qword_1006B8930);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_friendForFence, &qword_1006AF740);
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_delegate);
  sub_100036B90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_doneHandler));
  swift_release();
  BOOL v3 = *(void **)&self->mediator[OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_style];
  id v4 = *(void **)&self->addressRadius[OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_style];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_searchResultsTableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_smallRadiusBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_mediumRadiusBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_largeRadiusBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_userDroppedAnnotation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_selectedAnnotation));
  swift_bridgeObjectRelease();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_mapLastSeachAddressType, (uint64_t *)&unk_1006BF070);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_searchController));

  swift_bridgeObjectRelease();
}

@end