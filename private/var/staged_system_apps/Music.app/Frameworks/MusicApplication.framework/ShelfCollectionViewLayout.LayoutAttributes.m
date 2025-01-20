@interface ShelfCollectionViewLayout.LayoutAttributes
- (BOOL)isEqual:(id)a3;
- (_TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes)init;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
@end

@implementation ShelfCollectionViewLayout.LayoutAttributes

- (int64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ShelfCollectionViewLayout.LayoutAttributes();
  v2 = (unsigned __int8 *)v7.receiver;
  int64_t v3 = [(ShelfCollectionViewLayout.LayoutAttributes *)&v7 hash];
  Swift::UInt v4 = v2[OBJC_IVAR____TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes_rowPosition];
  sub_AB8830();
  sub_AB8840(v4);
  Swift::Int v5 = sub_AB8880();

  return v5 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    Swift::UInt v4 = self;
    swift_unknownObjectRetain();
    sub_AB7E30();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    Swift::Int v5 = self;
  }
  BOOL v6 = sub_353D14((uint64_t)v8);

  sub_1A538((uint64_t)v8, (uint64_t *)&unk_DC4CF0);
  return v6;
}

- (id)copyWithZone:(void *)a3
{
  Swift::UInt v4 = self;
  sub_353F8C((uint64_t)a3, (uint64_t)v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  Swift::Int v5 = (void *)sub_AB8630();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (_TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes)init
{
  return (_TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes *)sub_354100(self, (uint64_t)a2, &OBJC_IVAR____TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes_rowPosition, v2, (uint64_t (*)(uint64_t))type metadata accessor for ShelfCollectionViewLayout.LayoutAttributes);
}

@end