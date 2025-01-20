@interface PGSpecificationBasedFlexMusicCurator
- (PGSpecificationBasedFlexMusicCurator)init;
- (PGSpecificationBasedFlexMusicCurator)initWithOptions:(id)a3;
- (id)musicCurationAndReturnError:(id *)a3;
@end

@implementation PGSpecificationBasedFlexMusicCurator

- (PGSpecificationBasedFlexMusicCurator)initWithOptions:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = a3;
  v7 = self;
  sub_1D1B3E8E0(v6, (uint64_t)&v13);
  v8 = (_OWORD *)((char *)v7 + OBJC_IVAR___PGSpecificationBasedFlexMusicCurator_curationSpecification);
  long long v9 = v14[0];
  _OWORD *v8 = v13;
  v8[1] = v9;
  *(_OWORD *)((char *)v8 + 26) = *(_OWORD *)((char *)v14 + 10);

  v12.receiver = v7;
  v12.super_class = ObjectType;
  v10 = [(PGSpecificationBasedFlexMusicCurator *)&v12 init];

  return v10;
}

- (id)musicCurationAndReturnError:(id *)a3
{
  sub_1D187CD60();
  v4 = (void *)swift_allocError();
  swift_willThrow();
  if (a3)
  {
    v5 = (void *)sub_1D1EBC5F0();

    id v6 = v5;
    *a3 = v5;
  }
  else
  {
  }
  return 0;
}

- (PGSpecificationBasedFlexMusicCurator)init
{
  result = (PGSpecificationBasedFlexMusicCurator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end