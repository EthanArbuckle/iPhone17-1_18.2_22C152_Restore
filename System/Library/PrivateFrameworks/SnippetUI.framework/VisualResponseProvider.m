@interface VisualResponseProvider
+ (id)transformModel:(id)a3 mode:(int64_t)a4 currentIdiom:(int64_t)a5;
+ (void)preWarm:(id)a3;
+ (void)preloadPlugins;
+ (void)setPatternId:(id)a3 forViewId:(id)a4;
- (_TtC9SnippetUI22VisualResponseProvider)init;
- (id)viewControllerForModel:(id)a3 mode:(int64_t)a4;
- (id)viewControllerForSnippetModel:(id)a3 bundleName:(id)a4 mode:(int64_t)a5;
- (id)viewForModel:(id)a3 mode:(int64_t)a4 overload:(int64_t)a5;
- (id)viewForSnippetModel:(id)a3 bundleName:(id)a4 mode:(int64_t)a5;
- (void)reset;
- (void)viewControllerFor:(id)a3 mode:(int64_t)a4 completion:(id)a5;
@end

@implementation VisualResponseProvider

+ (void)setPatternId:(id)a3 forViewId:(id)a4
{
  sub_22C64F480();
  sub_22C64F480();
  static VisualResponseProvider.setPatternId(_:forViewId:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (void)preloadPlugins
{
}

+ (void)preWarm:(id)a3
{
  id v3 = a3;
  static VisualResponseProvider.preWarm(using:)();
}

- (id)viewControllerForModel:(id)a3 mode:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  sub_22C648F30();

  VisualResponseProvider.viewController(for:mode:)();
}

- (id)viewControllerForSnippetModel:(id)a3 bundleName:(id)a4 mode:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_22C648F30();

  sub_22C64F480();
  VisualResponseProvider.viewController(for:bundleName:mode:)();
}

- (id)viewForModel:(id)a3 mode:(int64_t)a4 overload:(int64_t)a5
{
  id v6 = a3;
  id v7 = self;
  uint64_t v8 = sub_22C648F30();
  unint64_t v10 = v9;

  VisualResponseProvider.view(for:mode:overload:)(v8, v10);
  v12 = v11;
  sub_22C264380(v8, v10);

  return v12;
}

- (id)viewForSnippetModel:(id)a3 bundleName:(id)a4 mode:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = self;
  uint64_t v10 = sub_22C648F30();
  unint64_t v12 = v11;

  sub_22C64F480();
  VisualResponseProvider.view(for:bundleName:mode:)();
  v14 = v13;
  swift_bridgeObjectRelease();
  sub_22C264380(v10, v12);

  return v14;
}

- (void)viewControllerFor:(id)a3 mode:(int64_t)a4 completion:(id)a5
{
  _Block_copy(a5);
  id v7 = a3;
  id v8 = self;
  sub_22C648F30();

  swift_allocObject();
  VisualResponseProvider.viewController(for:mode:completion:)();
}

- (void)reset
{
  v2 = self;
  VisualResponseProvider.reset()();
}

+ (id)transformModel:(id)a3 mode:(int64_t)a4 currentIdiom:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = sub_22C648F30();
  unint64_t v10 = v9;

  swift_getObjCClassMetadata();
  uint64_t v11 = static VisualResponseProvider.transformModel(_:mode:currentIdiom:)(v8, v10, a4, a5);
  sub_22C264380(v8, v10);
  if (v11)
  {
    sub_22C28737C(0, (unint64_t *)&unk_2684AE038);
    unint64_t v12 = (void *)sub_22C64F740();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

- (_TtC9SnippetUI22VisualResponseProvider)init
{
  return (_TtC9SnippetUI22VisualResponseProvider *)VisualResponseProvider.init()();
}

@end