@interface ArtworkActivityItemProvider
- (_TtC8AppStore27ArtworkActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)item;
@end

@implementation ArtworkActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1004A722C(a4, &v17);

  uint64_t v9 = v18;
  if (v18)
  {
    v10 = sub_100081D90(&v17, v18);
    uint64_t v11 = *(void *)(v9 - 8);
    __n128 v12 = __chkstk_darwin(v10);
    v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v11 + 16))(v14, v12);
    v15 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
    _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)&v17);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)item
{
  v2 = self;
  sub_1004A74F0(v5);

  sub_100081D90(v5, v5[3]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v5);

  return v3;
}

- (_TtC8AppStore27ArtworkActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  result = (_TtC8AppStore27ArtworkActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

@end