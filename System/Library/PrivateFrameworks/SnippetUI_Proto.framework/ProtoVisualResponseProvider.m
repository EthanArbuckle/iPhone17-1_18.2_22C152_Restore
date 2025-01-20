@interface ProtoVisualResponseProvider
+ (id)transformModel:(id)a3 mode:(int64_t)a4 currentIdiom:(int64_t)a5;
+ (void)preWarm:(id)a3;
+ (void)setPatternId:(id)a3 forViewId:(id)a4;
- (_TtC15SnippetUI_Proto27ProtoVisualResponseProvider)init;
- (id)viewControllerForModel:(id)a3 mode:(int64_t)a4;
- (id)viewForModel:(id)a3 mode:(int64_t)a4 overload:(int64_t)a5;
- (void)reset;
- (void)viewControllerFor:(id)a3 mode:(int64_t)a4 completion:(id)a5;
@end

@implementation ProtoVisualResponseProvider

+ (void)setPatternId:(id)a3 forViewId:(id)a4
{
  uint64_t v4 = sub_25E019FF0();
  uint64_t v6 = v5;
  uint64_t v7 = sub_25E019FF0();
  static ProtoVisualResponseProvider.setPatternId(_:forViewId:)(v4, v6, v7, v8);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (void)preWarm:(id)a3
{
  id v3 = a3;
  static ProtoVisualResponseProvider.preWarm(using:)(v3);
}

- (id)viewControllerForModel:(id)a3 mode:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_25E019D60();

  ProtoVisualResponseProvider.viewController(for:mode:)();
}

- (id)viewForModel:(id)a3 mode:(int64_t)a4 overload:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = sub_25E019D60();
  unint64_t v11 = v10;

  v12 = (void *)ProtoVisualResponseProvider.view(for:mode:overload:)(v9, v11, (void *)a4);
  sub_25E0168B0(v9, v11);

  return v12;
}

- (void)viewControllerFor:(id)a3 mode:(int64_t)a4 completion:(id)a5
{
  _Block_copy(a5);
  id v7 = a3;
  uint64_t v8 = self;
  sub_25E019D60();

  swift_allocObject();
  ProtoVisualResponseProvider.viewController(for:mode:completion:)();
}

- (void)reset
{
  v2 = self;
  ProtoVisualResponseProvider.reset()();
}

+ (id)transformModel:(id)a3 mode:(int64_t)a4 currentIdiom:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = sub_25E019D60();
  unint64_t v10 = v9;

  swift_getObjCClassMetadata();
  static ProtoVisualResponseProvider.transformModel(_:mode:currentIdiom:)(v8, v10, a4, a5);
  uint64_t v12 = v11;
  sub_25E0168B0(v8, v10);
  if (v12)
  {
    sub_25E016CBC(0, (unint64_t *)&unk_26A6D3B10);
    v13 = (void *)sub_25E01A040();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_TtC15SnippetUI_Proto27ProtoVisualResponseProvider)init
{
  return (_TtC15SnippetUI_Proto27ProtoVisualResponseProvider *)ProtoVisualResponseProvider.init()();
}

@end