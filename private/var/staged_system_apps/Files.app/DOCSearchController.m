@interface DOCSearchController
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (UISearchControllerDelegate)delegate;
- (UISearchResultsUpdating)searchResultsUpdater;
- (UITraitCollection)traitCollection;
- (UIViewController)searchResultsController;
- (_TtC5Files12DOCSearchBar)searchBar;
- (_TtC5Files19DOCSearchController)initWithCoder:(id)a3;
- (_TtC5Files19DOCSearchController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Files19DOCSearchController)initWithSearchResultsController:(id)a3;
- (_TtC5Files31DOCItemCollectionViewController)resultCollectionViewController;
- (_TtP5Files39DOCSearchControllerPresentationDelegate_)presentationDelegate;
- (void)deactivateAlongsideContainingTransitionCoordinator:(id)a3;
- (void)didDismissSearchController:(id)a3;
- (void)didPresentSearchController:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleSuggestionsTypingTimeout;
- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)searchController:(id)a3 didChangeFromSearchBarPlacement:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setSearchResultsUpdater:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3 selectingSearchSuggestion:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation DOCSearchController

- (void)setPresentationDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100011138();

  swift_unknownObjectRelease();
}

- (_TtC5Files12DOCSearchBar)searchBar
{
  return (_TtC5Files12DOCSearchBar *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                             + OBJC_IVAR____TtC5Files19DOCSearchController__searchBar));
}

- (void)setSearchResultsUpdater:(id)a3
{
  if (a3 && a3 == self)
  {
    v4.receiver = a3;
    v4.super_class = (Class)type metadata accessor for DOCSearchController();
    [(DOCSearchController *)&v4 setSearchResultsUpdater:a3];
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)sub_1000C6814(self, (uint64_t)a2, (SEL *)&selRef_traitCollection);
}

- (_TtC5Files31DOCItemCollectionViewController)resultCollectionViewController
{
  return (_TtC5Files31DOCItemCollectionViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC5Files19DOCSearchController_resultCollectionViewController));
}

- (_TtP5Files39DOCSearchControllerPresentationDelegate_)presentationDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP5Files39DOCSearchControllerPresentationDelegate_ *)Strong;
}

- (UISearchControllerDelegate)delegate
{
  return (UISearchControllerDelegate *)sub_1000C6814(self, (uint64_t)a2, (SEL *)&selRef_delegate);
}

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCSearchController();
  [(DOCSearchController *)&v4 setDelegate:a3];
}

- (UIViewController)searchResultsController
{
  return (UIViewController *)sub_1000C6814(self, (uint64_t)a2, (SEL *)&selRef_searchResultsController);
}

- (UISearchResultsUpdating)searchResultsUpdater
{
  return (UISearchResultsUpdating *)sub_1000C6814(self, (uint64_t)a2, (SEL *)&selRef_searchResultsUpdater);
}

- (_TtC5Files19DOCSearchController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005208EC();
}

- (_TtC5Files19DOCSearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  sub_1005208EC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1005186D0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100518AE0();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCSearchController();
  id v6 = v8.receiver;
  id v7 = a3;
  [(DOCSearchController *)&v8 viewDidMoveToWindow:v7 shouldAppearOrDisappear:v4];
  if (v7)
  {
    sub_1005199D0();
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCSearchController();
  id v4 = v6.receiver;
  [(DOCSearchController *)&v6 viewWillAppear:v3];
  id v5 = sub_1000C6E20();
  sub_10051D910();

  sub_1000C6A40();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCSearchController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DOCSearchController *)&v6 traitCollectionDidChange:v4];
  sub_100053754(0);
  sub_100053A00(a3);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    objc_super v8 = sub_100271E84;
  }
  else
  {
    objc_super v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = self;
  if ([(DOCSearchController *)v9 isActive])
  {
    sub_100518D94((uint64_t (*)(id))v8, v7, a3);
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    v8();
  }
  sub_1000A7258((uint64_t)v8);
LABEL_9:
}

- (void)deactivateAlongsideContainingTransitionCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_10051926C(a3);
  swift_unknownObjectRelease();
}

- (void)searchController:(id)a3 didChangeFromSearchBarPlacement:(int64_t)a4
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1000C6A40();
}

- (void)willPresentSearchController:(id)a3
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    objc_super v6 = Strong;
    if ([Strong respondsToSelector:"willPresentSearchController:"])
    {
      id v7 = a3;
      objc_super v8 = self;
      [v6 willPresentSearchController:v8];
    }
    swift_unknownObjectRelease();
  }
}

- (void)didPresentSearchController:(id)a3
{
  id v4 = a3;
  id v7 = self;
  sub_100053754(0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    objc_super v6 = Strong;
    if ([Strong respondsToSelector:"didPresentSearchController:"]) {
      [v6 didPresentSearchController:v7];
    }
    swift_unknownObjectRelease();
  }
  sub_10051AC1C();
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100520AE0();
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100520BBC();
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  if ((*((unsigned char *)&self->super.super.super.super.isa
        + OBJC_IVAR____TtC5Files19DOCSearchController_activationTemporilyDisabled) & 1) != 0)
    return 0;
  else {
    return [a3 isEnabled];
  }
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100519DBC(v4);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1005207BC(v5);
}

- (void)handleSuggestionsTypingTimeout
{
  v2 = self;
  sub_10051A804();
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files19DOCSearchController_selectedScopeIndex) = (Class)a4;
  id v5 = a3;
  objc_super v6 = self;
  sub_100517F1C();
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100520CF0();
}

- (void)updateSearchResultsForSearchController:(id)a3 selectingSearchSuggestion:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_1005212E4(a4);

  swift_unknownObjectRelease();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1005213C4();
}

- (_TtC5Files19DOCSearchController)initWithSearchResultsController:(id)a3
{
  id v3 = a3;
  result = (_TtC5Files19DOCSearchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_resultCollectionViewController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_cachedSearchQuery));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController__suggesterManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_suggestionsTableViewContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_suggestionsTableViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController____lazy_storage___stackedSearchLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController____lazy_storage___suggestionsTableViewController));
  swift_release();
  swift_unknownObjectWeakDestroy();
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files19DOCSearchController_searchDelegate);
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files19DOCSearchController_presentationDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController__searchBar));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_suggestionsTypingTimeoutTimer));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Files19DOCSearchController_selectedSuggestion);
}

@end