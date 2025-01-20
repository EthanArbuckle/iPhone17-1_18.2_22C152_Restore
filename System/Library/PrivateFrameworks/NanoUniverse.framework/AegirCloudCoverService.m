@interface AegirCloudCoverService
+ (NSString)cloudLevelHighFileName;
+ (NSString)cloudLevelLowFileName;
+ (NSString)cloudLevelMidFileName;
+ (NSString)cloudLevelPrefix;
- (BOOL)canFetchData;
- (BOOL)disableFetch;
- (NSArray)allCloudLevelFileNames;
- (NSURL)directory;
- (NUNIFileConverter)fileConverter;
- (_TtC12NanoUniverse22AegirCloudCoverService)init;
- (_TtC12NanoUniverse22AegirCloudCoverService)initWithImageScale:(float)a3;
- (id)cloudTextureURLs;
- (id)currentURLForCloudLevelWith:(id)a3;
- (id)urlForCloudLevelWith:(id)a3;
- (void)retrieveCloudTextureURLsWithNotifyOn:(id)a3 completionHandler:(id)a4;
- (void)setDirectory:(id)a3;
- (void)setDisableFetch:(BOOL)a3;
- (void)setFileConverter:(id)a3;
@end

@implementation AegirCloudCoverService

- (NUNIFileConverter)fileConverter
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (NUNIFileConverter *)v2;
}

- (void)setFileConverter:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_fileConverter);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)disableFetch
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch;
  swift_beginAccess();
  return *v2;
}

- (void)setDisableFetch:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSURL)directory
{
  uint64_t v3 = sub_21E8EE490();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v8, v3);
  v9 = (void *)sub_21E8EE430();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return (NSURL *)v9;
}

- (void)setDirectory:(id)a3
{
  uint64_t v4 = sub_21E8EE490();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7, v10);
  v12 = &v17[-v11];
  sub_21E8EE460();
  v13 = (char *)self + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  (*(void (**)(unsigned char *, char *, uint64_t))(v5 + 16))(v9, v13, v4);
  swift_beginAccess();
  v14 = *(void (**)(char *, unsigned char *, uint64_t))(v5 + 24);
  v15 = self;
  v14(v13, v12, v4);
  swift_endAccess();
  sub_21E8D9FA0();
  v16 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v16(v12, v4);
  v16(v9, v4);
}

- (_TtC12NanoUniverse22AegirCloudCoverService)initWithImageScale:(float)a3
{
  static AegirCloudCoverService.Configuration.prodEnvironment.getter((unint64_t *)v10);
  v7[0] = v10[0];
  v7[1] = v10[1];
  uint64_t v8 = v11;
  uint64_t v9 = v12;
  id v4 = objc_allocWithZone((Class)type metadata accessor for AegirCloudCoverService());
  uint64_t v5 = (_TtC12NanoUniverse22AegirCloudCoverService *)AegirCloudCoverService.init(configuration:imageScale:)((uint64_t *)v7, a3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)retrieveCloudTextureURLsWithNotifyOn:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_21E8DBC94(v8, (uint64_t)sub_21E8ED2F4, v7);

  swift_release();
}

- (id)cloudTextureURLs
{
  v2 = self;
  sub_21E8DC07C();

  sub_21E8EE490();
  uint64_t v3 = (void *)sub_21E8EEA40();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)canFetchData
{
  v2 = self;
  char v4 = sub_21E8DC6D8((uint64_t)v2, v3);

  return v4 & 1;
}

- (_TtC12NanoUniverse22AegirCloudCoverService)init
{
  result = (_TtC12NanoUniverse22AegirCloudCoverService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  uint64_t v4 = sub_21E8EE490();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

+ (NSString)cloudLevelPrefix
{
  v2 = (void *)sub_21E8EE9C0();
  return (NSString *)v2;
}

+ (NSString)cloudLevelLowFileName
{
  v2 = (void *)sub_21E8EE9C0();
  return (NSString *)v2;
}

+ (NSString)cloudLevelMidFileName
{
  v2 = (void *)sub_21E8EE9C0();
  return (NSString *)v2;
}

+ (NSString)cloudLevelHighFileName
{
  v2 = (void *)sub_21E8EE9C0();
  return (NSString *)v2;
}

- (id)urlForCloudLevelWith:(id)a3
{
  return sub_21E8E6C04(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))AegirCloudCoverService.urlForCloudLevel(with:));
}

- (id)currentURLForCloudLevelWith:(id)a3
{
  return sub_21E8E6C04(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))AegirCloudCoverService.currentURLForCloudLevel(with:));
}

- (NSArray)allCloudLevelFileNames
{
  _s12NanoUniverse22AegirCloudCoverServiceC03allD14LevelFileNamesSaySSGvg_0();
  v2 = (void *)sub_21E8EEA40();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

@end