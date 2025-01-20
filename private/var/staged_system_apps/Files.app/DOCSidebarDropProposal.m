@interface DOCSidebarDropProposal
- (_TtC5Files22DOCSidebarDropProposal)initWithDropOperation:(unint64_t)a3;
- (_TtC5Files22DOCSidebarDropProposal)initWithDropOperation:(unint64_t)a3 dropLocation:(int64_t)a4;
- (_TtC5Files22DOCSidebarDropProposal)initWithDropOperation:(unint64_t)a3 intent:(int64_t)a4;
@end

@implementation DOCSidebarDropProposal

- (_TtC5Files22DOCSidebarDropProposal)initWithDropOperation:(unint64_t)a3 intent:(int64_t)a4
{
}

- (_TtC5Files22DOCSidebarDropProposal)initWithDropOperation:(unint64_t)a3
{
  result = (_TtC5Files22DOCSidebarDropProposal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Files22DOCSidebarDropProposal)initWithDropOperation:(unint64_t)a3 dropLocation:(int64_t)a4
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC5Files22DOCSidebarDropProposal_indexPath;
  uint64_t v3 = type metadata accessor for IndexPath();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end