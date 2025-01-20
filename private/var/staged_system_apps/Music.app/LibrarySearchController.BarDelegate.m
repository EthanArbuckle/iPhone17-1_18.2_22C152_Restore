@interface LibrarySearchController.BarDelegate
- (_TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate)init;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
@end

@implementation LibrarySearchController.BarDelegate

- (void)searchBarTextDidBeginEditing:(id)a3
{
}

- (void)searchBarTextDidEndEditing:(id)a3
{
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_text);
  uint64_t *v7 = v6;
  v7[1] = v8;
  id v11 = a3;
  v9 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(void (**)(_TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate *))((char *)&v9->super.isa + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_textDidChange);
  if (v10)
  {
    swift_retain();
    v10(v9);
    sub_10006ADFC((uint64_t)v10);
  }

  swift_bridgeObjectRelease();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003BAD34(v4);
}

- (_TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_text);
  void *v3 = 0;
  v3[1] = 0;
  id v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didBeginEditing);
  *id v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didEndEditing);
  void *v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_textDidChange);
  *uint64_t v6 = 0;
  v6[1] = 0;
  v7 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didCancel);
  uint64_t v8 = (objc_class *)type metadata accessor for LibrarySearchController.BarDelegate();
  void *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return [(LibrarySearchController.BarDelegate *)&v10 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didBeginEditing));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didEndEditing));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_textDidChange));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didCancel);

  sub_10006ADFC(v3);
}

@end