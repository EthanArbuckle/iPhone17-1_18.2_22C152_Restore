@interface SearchHomeContainerController
- (_TtC7NewsUI229SearchHomeContainerController)initWithCoder:(id)a3;
- (_TtC7NewsUI229SearchHomeContainerController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (uint64_t)didPresentSearchController:(uint64_t)a1;
- (void)didDismissSearchController:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willPresentSearchController:(id)a3;
@end

@implementation SearchHomeContainerController

- (_TtC7NewsUI229SearchHomeContainerController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_currentSearchTerm);
  void *v5 = 0;
  v5[1] = 0xE000000000000000;
  id v6 = a3;

  result = (_TtC7NewsUI229SearchHomeContainerController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DFD64D88();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1DFD651BC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(SearchHomeContainerController *)&v5 viewWillDisappear:v3];
  swift_getObjectType();
  sub_1DFDF2040();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DFD654E0();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(SearchHomeContainerController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DFD65068(v6);
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  BOOL v3 = self;
  id v4 = sub_1DFD65C10();

  return v4;
}

- (_TtC7NewsUI229SearchHomeContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI229SearchHomeContainerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_searchHomeViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_searchResultsViewController));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)willPresentSearchController:(id)a3
{
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate, a2))
  {
    id v5 = a3;
    id v6 = self;
    sub_1DECB3AD8();

    swift_unknownObjectRelease();
  }
}

- (uint64_t)didPresentSearchController:(uint64_t)a1
{
  uint64_t result = MEMORY[0x1E01EFB70](a1 + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate);
  if (result)
  {
    return swift_unknownObjectRelease();
  }
  return result;
}

- (void)didDismissSearchController:(id)a3
{
  uint64_t v5 = MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate, a2);
  id v6 = a3;
  objc_super v7 = self;
  if (v5)
  {
    sub_1DECB3C38();
    swift_unknownObjectRelease();
  }
  sub_1DFD646E8(0, 0xE000000000000000, 4);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = sub_1DFDFDD20();
  unint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_1DFD646E8(v6, v8, 4);

  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  uint64_t v5 = MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate, a2);
  if (v5)
  {
    *(unsigned char *)(v5 + 40) = 1;
    uint64_t v6 = *(void **)(v5 + 24);
    id v7 = a3;
    unint64_t v8 = self;
    id v9 = objc_msgSend(v6, sel_searchBar);
    objc_msgSend(v9, sel_becomeFirstResponder);

    swift_unknownObjectRelease();
  }
}

@end