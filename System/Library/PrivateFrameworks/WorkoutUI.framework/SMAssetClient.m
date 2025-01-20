@interface SMAssetClient
- (SMAssetClient)init;
- (SMAssetClient)initWithDependenciesWrapper:(id)a3;
- (void)fetchArtwork:(id)a3 size:(CGSize)a4 completion:(id)a5;
@end

@implementation SMAssetClient

- (SMAssetClient)initWithDependenciesWrapper:(id)a3
{
  id v4 = a3;
  v5 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9450E0);
  sub_261B8B298();
  swift_release();
  sub_261A4E500(&v9, (uint64_t)v5 + OBJC_IVAR___SMAssetClient_artworkImageLoader);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for AssetClientBridge();
  v6 = [(SMAssetClient *)&v8 init];

  return v6;
}

- (void)fetchArtwork:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9450F0);
  uint64_t v8 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___SMAssetClient_artworkImageLoader), *(void *)&self->artworkImageLoader[OBJC_IVAR___SMAssetClient_artworkImageLoader + 16]);
  id v13 = a3;
  v14 = self;
  sub_261B8C828();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_261A552FC;
  *(void *)(v15 + 24) = v12;
  swift_retain();
  uint64_t v16 = v20;
  v17 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_261B8B7A8();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_261A55318;
  *(void *)(v18 + 24) = v15;
  swift_retain();
  v17(sub_261A50508, v18);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v16);

  swift_release();
}

- (SMAssetClient)init
{
  result = (SMAssetClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end