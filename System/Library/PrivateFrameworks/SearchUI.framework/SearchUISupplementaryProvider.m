@interface SearchUISupplementaryProvider
+ (id)sectionForHeaderView:(id)a3;
+ (id)viewForSupplementaryOfKind:(id)a3 atIndexPath:(id)a4 forSectionModel:(id)a5 controller:(id)a6;
+ (unint64_t)headerTypeForHeaderView:(id)a3;
+ (void)registerSupplementariesForCollectionView:(id)a3;
- (SearchUISupplementaryProvider)init;
@end

@implementation SearchUISupplementaryProvider

+ (void)registerSupplementariesForCollectionView:(id)a3
{
  id v3 = a3;
  sub_1E4667E24(v3);
}

+ (id)viewForSupplementaryOfKind:(id)a3 atIndexPath:(id)a4 forSectionModel:(id)a5 controller:(id)a6
{
  uint64_t v8 = sub_1E46A4EA0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1E46A6050();
  uint64_t v14 = v13;
  sub_1E46A4E80();
  id v15 = a5;
  id v16 = a6;
  id v17 = sub_1E466800C(v12, v14, (uint64_t)v11, v15, v16);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v17;
}

+ (id)sectionForHeaderView:(id)a3
{
  uint64_t v4 = type metadata accessor for Header();
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (id *)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53508);
  uint64_t v7 = swift_dynamicCastClass();
  if (v7)
  {
    uint64_t v8 = *(void **)(v7 + qword_1EB99B9D8);
    id v9 = a3;
    id v10 = v8;
    sub_1E46A52E0();

    id v11 = v6[8];
    sub_1E46683CC((uint64_t)v6);
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

+ (unint64_t)headerTypeForHeaderView:(id)a3
{
  id v3 = a3;
  unint64_t v4 = sub_1E46681D0();

  return v4;
}

- (SearchUISupplementaryProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUISupplementaryProvider;
  return [(SearchUISupplementaryProvider *)&v3 init];
}

@end