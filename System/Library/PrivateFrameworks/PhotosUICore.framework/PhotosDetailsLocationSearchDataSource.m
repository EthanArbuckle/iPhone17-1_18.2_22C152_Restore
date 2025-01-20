@interface PhotosDetailsLocationSearchDataSource
- (PXPhotosDetailsLocationSearchDelegate)delegate;
- (_TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource)init;
- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4;
- (void)infoUpdaterDidUpdate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PhotosDetailsLocationSearchDataSource

- (PXPhotosDetailsLocationSearchDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1AD10DA80](v2);
  return (PXPhotosDetailsLocationSearchDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = self;
  v7 = (void *)sub_1A9E8D3C4((uint64_t)v6, v5);
  _Block_release(v5);
  _Block_release(v5);

  return v7;
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A9E8C124((uint64_t)v4);
}

- (_TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource)init
{
  result = (_TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource_suggester));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource_assets));
  swift_bridgeObjectRelease();
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource_completion));
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource_delegate);
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource_undoManagerProvider));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource____lazy_storage___infoUpdater);
}

@end