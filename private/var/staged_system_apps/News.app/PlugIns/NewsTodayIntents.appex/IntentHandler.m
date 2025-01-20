@interface IntentHandler
- (_TtC16NewsTodayIntents13IntentHandler)init;
- (id)defaultTagForTag:(id)a3;
- (void)handleTag:(id)a3 completion:(id)a4;
- (void)handleToday:(id)a3 completion:(id)a4;
- (void)provideTagOptionsCollectionForTag:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5;
@end

@implementation IntentHandler

- (_TtC16NewsTodayIntents13IntentHandler)init
{
  uint64_t v3 = OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler_container;
  type metadata accessor for TodayIntentsContainer();
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_100006FA8();
  v5 = (char *)v4 + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___resolver;
  *((void *)v5 + 4) = 0;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v6 = (char *)v4 + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___followingTagsService;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v7 = (char *)v4 + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___searchService;
  *((void *)v7 + 4) = 0;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *(Class *)((char *)&v4->super.super.isa
           + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___configurationManager) = 0;

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for IntentHandler();
  return [(IntentHandler *)&v9 init];
}

- (void).cxx_destruct
{
  swift_release();
  sub_10000AEF8((uint64_t)self + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___resolver, (uint64_t *)&unk_10002ADE0);
  sub_10000AEF8((uint64_t)self + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___followingTagsService, (uint64_t *)&unk_10002ADD0);
  sub_10000AEF8((uint64_t)self + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___searchService, &qword_10002ADC0);
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___configurationManager);
}

- (void)handleToday:(id)a3 completion:(id)a4
{
}

- (void)provideTagOptionsCollectionForTag:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_10000FD10();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  id v12 = a3;
  v13 = self;
  sub_100009DAC(v9, (unint64_t)a4, (uint64_t)sub_10000AC18, v11);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)handleTag:(id)a3 completion:(id)a4
{
}

- (id)defaultTagForTag:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_10000A73C();

  return v6;
}

@end