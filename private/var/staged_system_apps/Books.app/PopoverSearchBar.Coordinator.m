@interface PopoverSearchBar.Coordinator
- (_TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator)init;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
@end

@implementation PopoverSearchBar.Coordinator

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = sub_1007FDC70();
  uint64_t v8 = v7;
  v9 = *(void (**)(uint64_t, uint64_t))((char *)&self->super.isa
                                               + OBJC_IVAR____TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator_textDidChange);
  id v10 = a3;
  v11 = self;
  swift_retain();
  v9(v6, v8);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator_searchButtonClicked);
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = swift_retain();
  v4(v7);

  swift_release();
}

- (_TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Swift::Void (__swiftcall **)())((char *)self
                                      + OBJC_IVAR____TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator_textDidChange);
  *v4 = BKAppDelegate.enableMetricsInspectorOnDebugMode();
  v4[1] = 0;
  id v5 = (Swift::Void (__swiftcall **)())((char *)self
                                      + OBJC_IVAR____TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator_searchButtonClicked);
  *id v5 = BKAppDelegate.enableMetricsInspectorOnDebugMode();
  v5[1] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(PopoverSearchBar.Coordinator *)&v7 init];
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end