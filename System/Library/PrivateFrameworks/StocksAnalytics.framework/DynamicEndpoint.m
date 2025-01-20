@interface DynamicEndpoint
- (NSString)name;
- (NSString)sharedContainerIdentifier;
- (NSURL)url;
@end

@implementation DynamicEndpoint

- (NSURL)url
{
  uint64_t v2 = sub_20AB85140();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  DynamicEndpoint.url.getter((uint64_t)v5);
  swift_release();
  v6 = (void *)sub_20AB85120();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSURL *)v6;
}

- (NSString)name
{
  uint64_t v3 = sub_20AB85480();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_20AB85500();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(self->appConfigurationManager, *(void *)&self->appConfigurationManager[24]);
  swift_retain();
  sub_20AB85570();
  sub_20AB853D0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_20AB854F0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  v11 = (void *)sub_20AB866D0();
  swift_bridgeObjectRelease();

  return (NSString *)v11;
}

- (NSString)sharedContainerIdentifier
{
  sub_20AB85670();
  swift_retain();
  sub_20AB85660();
  sub_20AB85650();
  swift_release();
  swift_release();
  uint64_t v2 = (void *)sub_20AB866D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

@end