@interface TagDataSource
- (_TtC11MobileNotes13TagDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 indexer:(id)a5;
@end

@implementation TagDataSource

- (_TtC11MobileNotes13TagDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 indexer:(id)a5
{
  v7 = _Block_copy(a4);
  id v8 = a3;
  id v9 = a5;
  _Block_release(v7);
  result = (_TtC11MobileNotes13TagDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->ICCoreDataDataSource_opaque[OBJC_IVAR____TtC11MobileNotes13TagDataSource_modernViewContext];
}

@end