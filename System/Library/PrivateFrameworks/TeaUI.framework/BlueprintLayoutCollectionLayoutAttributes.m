@interface BlueprintLayoutCollectionLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (_TtC5TeaUI41BlueprintLayoutCollectionLayoutAttributes)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation BlueprintLayoutCollectionLayoutAttributes

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  BlueprintLayoutCollectionLayoutAttributes.copy(with:)((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_1B61B3740();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B61B3030();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  unsigned __int8 v6 = BlueprintLayoutCollectionLayoutAttributes.isEqual(_:)((uint64_t)v8);

  sub_1B605A510((uint64_t)v8, (void (*)(void))sub_1B5E5F6A8);
  return v6 & 1;
}

- (_TtC5TeaUI41BlueprintLayoutCollectionLayoutAttributes)init
{
  return (_TtC5TeaUI41BlueprintLayoutCollectionLayoutAttributes *)BlueprintLayoutCollectionLayoutAttributes.init()();
}

- (void).cxx_destruct
{
}

@end