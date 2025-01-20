@interface ShelfContentTypeSet
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC8ShelfKit19ShelfContentTypeSet)init;
- (int64_t)hash;
@end

@implementation ShelfContentTypeSet

- (int64_t)hash
{
  sub_2A9ED8();
  v3 = self;
  int64_t v4 = sub_3D82D0();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    int64_t v4 = self;
    swift_unknownObjectRetain();
    sub_3D8A30();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_2A4CC8((uint64_t)v8);

  sub_250FC((uint64_t)v8, (uint64_t *)&unk_4B5A40);
  return v6 & 1;
}

- (NSString)debugDescription
{
  return (NSString *)sub_2A4E38((char *)self, (uint64_t)a2, (void (*)(uint64_t, ValueMetadata *, unint64_t))&Set.debugDescription.getter);
}

- (NSString)description
{
  return (NSString *)sub_2A4E38((char *)self, (uint64_t)a2, (void (*)(uint64_t, ValueMetadata *, unint64_t))&Set.description.getter);
}

- (_TtC8ShelfKit19ShelfContentTypeSet)init
{
  result = (_TtC8ShelfKit19ShelfContentTypeSet *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end