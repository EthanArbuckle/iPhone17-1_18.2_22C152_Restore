@interface LibraryTableNavigationTitleView
- (UIButton)filterButton;
- (_TtC5Music31LibraryTableNavigationTitleView)initWithCoder:(id)a3;
- (_TtC5Music31LibraryTableNavigationTitleView)initWithFrame:(CGRect)a3;
- (_TtC5Music31LibraryTableNavigationTitleView)initWithTitle:(id)a3;
- (void)setFilterButton:(id)a3;
@end

@implementation LibraryTableNavigationTitleView

- (_TtC5Music31LibraryTableNavigationTitleView)initWithTitle:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC5Music31LibraryTableNavigationTitleView *)sub_1000CC520(v3, v4);
}

- (_TtC5Music31LibraryTableNavigationTitleView)initWithCoder:(id)a3
{
  result = (_TtC5Music31LibraryTableNavigationTitleView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (UIButton)filterButton
{
  return (UIButton *)*(id *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music31LibraryTableNavigationTitleView_filterButton];
}

- (void)setFilterButton:(id)a3
{
  id v4 = *(id *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music31LibraryTableNavigationTitleView_filterButton];
  *(void *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music31LibraryTableNavigationTitleView_filterButton] = a3;
  id v3 = a3;
}

- (_TtC5Music31LibraryTableNavigationTitleView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end