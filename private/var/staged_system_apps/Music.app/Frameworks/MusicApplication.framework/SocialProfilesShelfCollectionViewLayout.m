@interface SocialProfilesShelfCollectionViewLayout
- (_TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout)init;
- (_TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout)initWithCoder:(id)a3;
- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3;
- (id)indexPathsToInsertForSupplementaryViewOfKind:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)finalizeCollectionViewUpdates;
- (void)prepareForCollectionViewUpdates:(id)a3;
@end

@implementation SocialProfilesShelfCollectionViewLayout

- (_TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout_updateItems) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout *)sub_AB8280();
  __break(1u);
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  id v8 = sub_409FC4(x, y, width, height);

  if (v8)
  {
    sub_173E4(0, (unint64_t *)&qword_DBF230);
    v9.super.isa = sub_AB6990().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_AB6510();
  uint64_t v13 = v12;
  sub_AB1080();
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  id v17 = sub_40A16C(v11, v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();

  return v17;
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  return sub_40ACDC((char *)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_40A45C);
}

- (id)indexPathsToInsertForSupplementaryViewOfKind:(id)a3
{
  return sub_40ACDC((char *)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_40A8A8);
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_173E4(0, (unint64_t *)&unk_DDD428);
  uint64_t v6 = sub_AB69B0();
  id v7 = a3;
  uint64_t v8 = self;
  Class isa = sub_AB6990().super.isa;
  v10.receiver = v8;
  v10.super_class = ObjectType;
  [(SocialProfilesShelfCollectionViewLayout *)&v10 prepareForCollectionViewUpdates:isa];

  *(Class *)((char *)&v8->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout_updateItems) = (Class)v6;

  swift_bridgeObjectRelease();
}

- (void)finalizeCollectionViewUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(SocialProfilesShelfCollectionViewLayout *)&v3 finalizeCollectionViewUpdates];
  *(void *)&v2[OBJC_IVAR____TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout_updateItems] = 0;

  swift_bridgeObjectRelease();
}

- (_TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout)init
{
  result = (_TtC16MusicApplication39SocialProfilesShelfCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end