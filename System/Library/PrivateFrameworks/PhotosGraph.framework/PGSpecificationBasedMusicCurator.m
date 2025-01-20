@interface PGSpecificationBasedMusicCurator
- (PGSpecificationBasedMusicCurator)init;
- (PGSpecificationBasedMusicCurator)initWithOptions:(id)a3;
- (id)musicCurationAndReturnError:(id *)a3;
@end

@implementation PGSpecificationBasedMusicCurator

- (PGSpecificationBasedMusicCurator)initWithOptions:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGSpecificationBasedMusicCurator_maxAppleMusicSongs) = (Class)9;
  v6 = (char *)self + OBJC_IVAR___PGSpecificationBasedMusicCurator_fetchOptions;
  *((void *)v6 + 1) = 0x101010101010101;
  *((void *)v6 + 2) = 0x101010101010101;
  *(void *)v6 = 0x101010101010101;
  *(_OWORD *)(v6 + 24) = xmmword_1D1F3EFC0;
  *((void *)v6 + 5) = 0xD00000000000001ELL;
  *((void *)v6 + 6) = 0x80000001D1F3EFC0;
  id v7 = a3;
  v8 = self;
  sub_1D1B3E8E0(v7, (uint64_t)&v14);
  v9 = (_OWORD *)((char *)v8 + OBJC_IVAR___PGSpecificationBasedMusicCurator_curationSpecification);
  long long v10 = v15[0];
  _OWORD *v9 = v14;
  v9[1] = v10;
  *(_OWORD *)((char *)v9 + 26) = *(_OWORD *)((char *)v15 + 10);

  v13.receiver = v8;
  v13.super_class = ObjectType;
  v11 = [(PGSpecificationBasedMusicCurator *)&v13 init];

  return v11;
}

- (id)musicCurationAndReturnError:(id *)a3
{
  v3 = self;
  v4 = sub_1D18DC3C0();

  return v4;
}

- (PGSpecificationBasedMusicCurator)init
{
  result = (PGSpecificationBasedMusicCurator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end