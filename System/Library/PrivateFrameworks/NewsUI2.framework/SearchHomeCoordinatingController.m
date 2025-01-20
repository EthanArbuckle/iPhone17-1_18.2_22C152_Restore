@interface SearchHomeCoordinatingController
- (_TtC7NewsUI232SearchHomeCoordinatingController)initWithCoder:(id)a3;
- (_TtC7NewsUI232SearchHomeCoordinatingController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didDismissSearchController:(id)a3;
- (void)didPresentSearchController:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willPresentSearchController:(id)a3;
@end

@implementation SearchHomeCoordinatingController

- (_TtC7NewsUI232SearchHomeCoordinatingController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI232SearchHomeCoordinatingController_delegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC7NewsUI232SearchHomeCoordinatingController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF24D83C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(SearchHomeCoordinatingController *)&v7 viewWillAppear:v3];
  id v5 = (char *)objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC7NewsUI232SearchHomeCoordinatingController_searchHomeContainerController], sel_parentViewController, v7.receiver, v7.super_class);
  if (!v5 || (v6 = v5, v5, v6 != v4)) {
    sub_1DF24D2A4(0);
  }
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DF24D9F0();
}

- (_TtC7NewsUI232SearchHomeCoordinatingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI232SearchHomeCoordinatingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI232SearchHomeCoordinatingController_delegate);
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI232SearchHomeCoordinatingController_searchHomeContainerController);
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DF24DEA0();
}

- (void)didPresentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DF24DF7C();
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DF24E04C();
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = sub_1DFDFDD20();
  unint64_t v8 = v7;
  v9 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI232SearchHomeCoordinatingController_searchHomeContainerController);
  id v15 = a3;
  v10 = self;
  id v11 = objc_msgSend(v9, sel_parentViewController);
  if (v11)
  {
    v12 = v11;
    sub_1DEB51528();
    v13 = v10;
    id v14 = v12;
    LOBYTE(v12) = sub_1DFDFF550();

    if (v12) {
      sub_1DFD646E8(v6, v8, 4);
    }
  }

  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DF24E11C();
}

@end