@interface SearchBar.Coordinator
- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtCV5Books9SearchBar11Coordinator)init;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
@end

@implementation SearchBar.Coordinator

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtCV5Books9SearchBar11Coordinator_isEditing) = 1;
  return 1;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtCV5Books9SearchBar11Coordinator_isEditing) = 0;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV5Books9SearchBar11Coordinator_searchAction);
  id v5 = a3;
  v6 = self;
  uint64_t v7 = swift_retain();
  v4(v7);

  swift_release();
}

- (_TtCV5Books9SearchBar11Coordinator)init
{
  result = (_TtCV5Books9SearchBar11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

@end