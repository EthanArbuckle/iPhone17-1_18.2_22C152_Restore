@interface StackCollectionViewLayoutAttributes
- (BOOL)forcedSize;
- (BOOL)isEqual:(id)a3;
- (_TtC8VideosUI35StackCollectionViewLayoutAttributes)init;
- (id)copyWithZone:(void *)a3;
- (void)setForcedSize:(BOOL)a3;
@end

@implementation StackCollectionViewLayoutAttributes

- (BOOL)forcedSize
{
  return sub_1E2FD9C70() & 1;
}

- (void)setForcedSize:(BOOL)a3
{
}

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_1E2FD9D24((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_1E387E238();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1E387DB08();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1E2FD9E8C((uint64_t)v8);

  sub_1E2C324CC((uint64_t)v8);
  return v6 & 1;
}

- (_TtC8VideosUI35StackCollectionViewLayoutAttributes)init
{
  return (_TtC8VideosUI35StackCollectionViewLayoutAttributes *)sub_1E2FD9FF4();
}

@end