@interface TagImageShareAttributeProvider
- (_TtC8NewsFeed30TagImageShareAttributeProvider)init;
- (id)mySportsShareImageFor:(id)a3;
- (id)shareImageFor:(id)a3;
- (void)createShareSportsEventImageFor:(id)a3 size:(CGSize)a4 logoWidth:(double)a5 completion:(id)a6;
- (void)createSportsShareImageFor:(id)a3 completion:(id)a4;
@end

@implementation TagImageShareAttributeProvider

- (_TtC8NewsFeed30TagImageShareAttributeProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TagImageShareAttributeProvider *)&v3 init];
}

- (id)shareImageFor:(id)a3
{
  return sub_1C0EC226C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s8NewsFeed30TagImageShareAttributeProviderC05shareD03forSo7UIImageCSo14FCTagProviding_p_tF_0);
}

- (id)mySportsShareImageFor:(id)a3
{
  return sub_1C0EC226C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s8NewsFeed30TagImageShareAttributeProviderC08mySportseD03forSo7UIImageCSo14FCTagProviding_p_tF_0);
}

- (void)createSportsShareImageFor:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_unknownObjectRetain();
  v7 = self;
  sub_1C0EC454C(a3, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease();
}

- (void)createShareSportsEventImageFor:(id)a3 size:(CGSize)a4 logoWidth:(double)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v11 = _Block_copy(a6);
  _Block_copy(v11);
  swift_unknownObjectRetain();
  v12 = self;
  sub_1C0EC4D20(a3, width, height, a5, (uint64_t)v12, (void (**)(void, void))v11);
  _Block_release(v11);
  _Block_release(v11);
  swift_unknownObjectRelease();
}

@end