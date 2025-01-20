@interface FMTableView
- (_TtC6FindMy11FMTableView)initWithCoder:(id)a3;
- (_TtC6FindMy11FMTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
@end

@implementation FMTableView

- (_TtC6FindMy11FMTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = (char *)self + OBJC_IVAR____TtC6FindMy11FMTableView_newIndexPath;
  uint64_t v11 = type metadata accessor for IndexPath();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FMTableView();
  return -[FMTableView initWithFrame:style:](&v13, "initWithFrame:style:", a4, x, y, width, height);
}

- (void).cxx_destruct
{
}

- (_TtC6FindMy11FMTableView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy11FMTableView_newIndexPath;
  uint64_t v6 = type metadata accessor for IndexPath();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMTableView();
  return [(FMTableView *)&v8 initWithCoder:a3];
}

@end