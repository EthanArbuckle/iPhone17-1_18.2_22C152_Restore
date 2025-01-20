@interface URLActivityItemProvider
- (_TtC8AppStore23URLActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerSubject:(id)a3;
- (id)item;
@end

@implementation URLActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if (a4)
  {
    uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC8AppStore23URLActivityItemProvider_excludedActivityTypes);
    id v8 = a3;
    v9 = self;
    id v10 = a4;
    if (sub_1002F9D48(v10, v7))
    {
      long long v21 = 0u;
      long long v22 = 0u;

      goto LABEL_6;
    }
  }
  else
  {
    id v11 = a3;
    v12 = self;
  }
  *((void *)&v22 + 1) = type metadata accessor for URL();
  sub_1000808B8((uint64_t *)&v21);
  ShareSheetData.url.getter();

LABEL_6:
  uint64_t v13 = *((void *)&v22 + 1);
  if (*((void *)&v22 + 1))
  {
    v14 = sub_100081D90(&v21, *((uint64_t *)&v22 + 1));
    uint64_t v15 = *(void *)(v13 - 8);
    __n128 v16 = __chkstk_darwin(v14);
    v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v15 + 16))(v18, v16);
    v19 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v13);
    _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)&v21);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)item
{
  v2 = self;
  sub_100712020(v5);

  sub_100081D90(v5, v5[3]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v5);

  return v3;
}

- (_TtC8AppStore23URLActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  result = (_TtC8AppStore23URLActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_100712678();

  return v6;
}

- (id)activityViewControllerSubject:(id)a3
{
  id v4 = self;
  id v5 = a3;
  sub_100713524();
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

@end