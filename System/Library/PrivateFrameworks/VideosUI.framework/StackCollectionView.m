@interface StackCollectionView
- (_TtC8VideosUI19StackCollectionView)initWithCoder:(id)a3;
- (_TtC8VideosUI19StackCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)vui_registerClass:(Class)a3 forCellWithReuseIdentifier:(id)a4;
@end

@implementation StackCollectionView

- (_TtC8VideosUI19StackCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  OUTLINED_FUNCTION_1_0();
  id v5 = v4;
  OUTLINED_FUNCTION_3();
  return (_TtC8VideosUI19StackCollectionView *)sub_1E30F4178(v6);
}

- (_TtC8VideosUI19StackCollectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E30F425C();
}

- (void)vui_registerClass:(Class)a3 forCellWithReuseIdentifier:(id)a4
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v6 = sub_1E387C928();
  uint64_t v8 = v7;
  v9 = self;
  sub_1E30F42E4(ObjCClassMetadata, v6, v8);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end