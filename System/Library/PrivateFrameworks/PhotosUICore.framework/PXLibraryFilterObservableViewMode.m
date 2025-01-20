@interface PXLibraryFilterObservableViewMode
- (_TtC12PhotosUICore33PXLibraryFilterObservableViewMode)init;
- (_TtC12PhotosUICore33PXLibraryFilterObservableViewMode)initWithViewMode:(int64_t)a3;
- (int64_t)viewMode;
- (void)setViewMode:(int64_t)a3;
@end

@implementation PXLibraryFilterObservableViewMode

- (int64_t)viewMode
{
  swift_getKeyPath();
  sub_1A9B6108C();
  v3 = self;
  sub_1AB230B6C();
  swift_release();
  int64_t v4 = *(int64_t *)((char *)&v3->super.isa
                         + OBJC_IVAR____TtC12PhotosUICore33PXLibraryFilterObservableViewMode___viewMode);

  return v4;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore33PXLibraryFilterObservableViewMode___observationRegistrar;
  uint64_t v3 = sub_1AB230BAC();
  int64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

- (_TtC12PhotosUICore33PXLibraryFilterObservableViewMode)initWithViewMode:(int64_t)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = self;
  sub_1AB230B9C();
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC12PhotosUICore33PXLibraryFilterObservableViewMode___viewMode) = (Class)a3;

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return [(PXLibraryFilterObservableViewMode *)&v8 init];
}

- (void)setViewMode:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A9D9393C(a3);
}

- (_TtC12PhotosUICore33PXLibraryFilterObservableViewMode)init
{
  result = (_TtC12PhotosUICore33PXLibraryFilterObservableViewMode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end