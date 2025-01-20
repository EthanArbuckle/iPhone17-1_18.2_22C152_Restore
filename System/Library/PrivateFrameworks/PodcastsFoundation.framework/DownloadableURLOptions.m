@interface DownloadableURLOptions
- (BOOL)nonAppInitiated;
- (NSString)urlRawString;
- (NSURL)url;
- (_TtC18PodcastsFoundation22DownloadableURLOptions)init;
- (_TtC18PodcastsFoundation22DownloadableURLOptions)initWithUrl:(id)a3 nonAppInitiated:(BOOL)a4;
- (id)init:(id)a3 nonAppInitiated:(BOOL)a4;
- (void)setNonAppInitiated:(BOOL)a3;
@end

@implementation DownloadableURLOptions

- (NSString)urlRawString
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSURL)url
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7731B0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1ACE74EF8();

  uint64_t v7 = sub_1ACE74F28();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1ACE74E18();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (BOOL)nonAppInitiated
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC18PodcastsFoundation22DownloadableURLOptions_nonAppInitiated;
  swift_beginAccess();
  return *v2;
}

- (void)setNonAppInitiated:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC18PodcastsFoundation22DownloadableURLOptions_nonAppInitiated;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (_TtC18PodcastsFoundation22DownloadableURLOptions)initWithUrl:(id)a3 nonAppInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = sub_1ACE74F28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE74E98();
  sub_1ACE74DD8();
  v10 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  uint64_t v11 = [(DownloadableURLOptions *)self init:v10 nonAppInitiated:v4];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (id)init:(id)a3 nonAppInitiated:(BOOL)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = sub_1ACE761B8();
  uint64_t v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18PodcastsFoundation22DownloadableURLOptions_urlRawString);
  *uint64_t v8 = v7;
  v8[1] = v9;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation22DownloadableURLOptions_nonAppInitiated) = a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return [(DownloadableURLOptions *)&v11 init];
}

- (_TtC18PodcastsFoundation22DownloadableURLOptions)init
{
  result = (_TtC18PodcastsFoundation22DownloadableURLOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end