@interface PGGraphEntityTaggingServiceClient
- (PGGraphEntityTaggingServiceClient)init;
- (PGGraphEntityTaggingServiceClient)initWithSupportedTagsAsStrings:(id)a3 log:(id)a4 error:(id *)a5;
- (void)entityTagsForPersonWithPersonLocalIdentifier:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation PGGraphEntityTaggingServiceClient

- (PGGraphEntityTaggingServiceClient)initWithSupportedTagsAsStrings:(id)a3 log:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1D1EBE430();
  return (PGGraphEntityTaggingServiceClient *)EntityTaggingServiceClient.init(supportedTagsAsStrings:log:)(v6, a4);
}

- (void)entityTagsForPersonWithPersonLocalIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD48170);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1D1EBE350();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA65CE68;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA65AB60;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1D1A948C4((uint64_t)v9, (uint64_t)&unk_1EA65CC50, (uint64_t)v14);
  swift_release();
}

- (PGGraphEntityTaggingServiceClient)init
{
  result = (PGGraphEntityTaggingServiceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___PGGraphEntityTaggingServiceClient_personView;
  uint64_t v4 = sub_1D1EBDA40();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end