@interface StackCollectionViewCompositionalLayout
+ (Class)layoutAttributesClass;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithCoder:(id)a3;
- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithSection:(id)a3;
- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3;
- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
@end

@implementation StackCollectionViewCompositionalLayout

+ (Class)layoutAttributesClass
{
  sub_1E2FDA158(a1, a2);
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  id v3 = OUTLINED_FUNCTION_13_28(self);
  OUTLINED_FUNCTION_3();
  char v4 = sub_1E2FDA180();

  return v4 & 1;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  id v3 = OUTLINED_FUNCTION_13_28(self);
  OUTLINED_FUNCTION_3();
  id v4 = sub_1E2FDA544();

  if (v4)
  {
    sub_1E2FDA5FC();
    sub_1E387CC88();
    OUTLINED_FUNCTION_11_4();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E3876448();
  v10 = self;
  v11 = sub_1E2FDAE04();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  return v11;
}

- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithSection:(id)a3
{
  return (_TtC8VideosUI38StackCollectionViewCompositionalLayout *)sub_1E2FDAF74(a3);
}

- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  return (_TtC8VideosUI38StackCollectionViewCompositionalLayout *)sub_1E2FDAFF0(a3, a4);
}

- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3
{
  id v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  return (_TtC8VideosUI38StackCollectionViewCompositionalLayout *)sub_1E2FDB118((uint64_t)sub_1E2FDB53C, v4);
}

- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  uint64_t v5 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v5;
  id v6 = a4;
  return (_TtC8VideosUI38StackCollectionViewCompositionalLayout *)sub_1E2FDB358();
}

- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithCoder:(id)a3
{
  return (_TtC8VideosUI38StackCollectionViewCompositionalLayout *)sub_1E2F739C0(a3);
}

@end