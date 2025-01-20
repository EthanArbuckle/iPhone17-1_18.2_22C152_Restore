@interface VUIJetPackController
+ (_TtC8VideosUI20VUIJetPackController)controllerWithBagKey:(id)a3 defaults:(id)a4 urlOverrideDefaultKey:(id)a5;
+ (_TtC8VideosUI20VUIJetPackController)controllerWithBagKey:(id)a3 defaults:(id)a4 urlOverrideDefaultKey:(id)a5 withCachePolicy:(unint64_t)a6;
- (_TtC8VideosUI20VUIJetPackController)init;
- (id)getJetPackSource;
- (id)getJetPackURL;
@end

@implementation VUIJetPackController

- (void).cxx_destruct
{
}

+ (_TtC8VideosUI20VUIJetPackController)controllerWithBagKey:(id)a3 defaults:(id)a4 urlOverrideDefaultKey:(id)a5 withCachePolicy:(unint64_t)a6
{
  uint64_t v9 = sub_1E387C928();
  uint64_t v11 = v10;
  swift_getObjCClassMetadata();
  id v12 = a3;
  id v13 = a4;
  v14 = (void *)static VUIJetPackController.controller(bagKey:defaults:urlOverrideDefaultKey:withCachePolicy:)(v12, a4, v9, v11, a6);

  swift_bridgeObjectRelease();
  return (_TtC8VideosUI20VUIJetPackController *)v14;
}

- (id)getJetPackSource
{
  v2 = self;
  v3 = (void *)VUIJetPackController.getJetPackSource()();

  return v3;
}

+ (_TtC8VideosUI20VUIJetPackController)controllerWithBagKey:(id)a3 defaults:(id)a4 urlOverrideDefaultKey:(id)a5
{
  uint64_t v7 = sub_1E387C928();
  uint64_t v9 = v8;
  swift_getObjCClassMetadata();
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)static VUIJetPackController.controller(bagKey:defaults:urlOverrideDefaultKey:)(v10, a4, v7, v9);

  swift_bridgeObjectRelease();
  return (_TtC8VideosUI20VUIJetPackController *)v12;
}

- (id)getJetPackURL
{
  v2 = self;
  v3 = (void *)VUIJetPackController.getJetPackURL()();

  return v3;
}

- (_TtC8VideosUI20VUIJetPackController)init
{
}

@end