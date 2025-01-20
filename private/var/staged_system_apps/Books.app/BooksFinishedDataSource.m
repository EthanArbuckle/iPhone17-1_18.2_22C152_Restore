@interface BooksFinishedDataSource
- (_TtC5Books23BooksFinishedDataSource)init;
- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4;
@end

@implementation BooksFinishedDataSource

- (_TtC5Books23BooksFinishedDataSource)init
{
  result = (_TtC5Books23BooksFinishedDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003E138(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books23BooksFinishedDataSource_onChange));

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books23BooksFinishedDataSource_monitor);
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books23BooksFinishedDataSource_onChange);
  if (v4)
  {
    id v7 = a3;
    id v8 = a4;
    v10 = self;
    uint64_t v9 = sub_10003E148((uint64_t)v4);
    v4(v9);
    sub_10003E138((uint64_t)v4);
  }
}

@end