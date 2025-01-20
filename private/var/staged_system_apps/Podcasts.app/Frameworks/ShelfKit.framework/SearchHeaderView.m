@interface SearchHeaderView
- (_TtC8ShelfKit16SearchHeaderView)initWithCoder:(id)a3;
- (_TtC8ShelfKit16SearchHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SearchHeaderView

- (_TtC8ShelfKit16SearchHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_70450();
}

- (void)layoutSubviews
{
  v2 = self;
  SearchHeaderView.layoutSubviews()();
}

- (_TtC8ShelfKit16SearchHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC8ShelfKit16SearchHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8ShelfKit16SearchHeaderView_searchScopeControl));

  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8ShelfKit16SearchHeaderView_searchTerm);
  uint64_t v4 = *(void *)&self->searchScopeControl[OBJC_IVAR____TtC8ShelfKit16SearchHeaderView_searchTerm];
  unsigned __int8 v5 = self->headerLabel[OBJC_IVAR____TtC8ShelfKit16SearchHeaderView_searchTerm];

  sub_49E40(v3, v4, v5);
}

@end