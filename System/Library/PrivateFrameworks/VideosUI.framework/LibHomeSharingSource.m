@interface LibHomeSharingSource
- (void)dealloc;
- (void)mpMediaLibraryStatusChanged;
@end

@implementation LibHomeSharingSource

- (void)dealloc
{
  v2 = self;
  sub_1E32C6DBC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI20LibHomeSharingSource__menuItems;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFB2BD8);
  OUTLINED_FUNCTION_15_3();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20LibHomeSharingSource_libraryConnectionQueue));
  swift_release();
}

- (void)mpMediaLibraryStatusChanged
{
  v2 = self;
  sub_1E32C8BD8();
}

@end