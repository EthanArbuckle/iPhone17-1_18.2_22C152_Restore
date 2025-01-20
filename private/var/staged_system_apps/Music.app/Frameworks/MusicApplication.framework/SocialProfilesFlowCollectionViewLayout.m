@interface SocialProfilesFlowCollectionViewLayout
- (_TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout)init;
- (_TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout)initWithCoder:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
@end

@implementation SocialProfilesFlowCollectionViewLayout

- (_TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout)initWithCoder:(id)a3
{
  result = (_TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout *)sub_AB8280();
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
  id v8 = sub_510CB4(x, y, width, height);

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
  id v17 = sub_510E58(v11, v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();

  return v17;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  uint64_t v8 = sub_511130(x, y, width, height);

  return v8;
}

- (_TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout)init
{
  result = (_TtC16MusicApplication38SocialProfilesFlowCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end