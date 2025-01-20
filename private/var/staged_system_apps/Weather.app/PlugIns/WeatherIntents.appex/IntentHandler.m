@interface IntentHandler
- (_TtC14WeatherIntents13IntentHandler)init;
- (id)defaultLocationForWeather:(id)a3;
- (id)handlerForIntent:(id)a3;
- (void)handleWeather:(id)a3 completion:(id)a4;
- (void)provideLocationOptionsCollectionForWeather:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5;
- (void)resolveLocationForWeather:(id)a3 withCompletion:(id)a4;
@end

@implementation IntentHandler

- (_TtC14WeatherIntents13IntentHandler)init
{
  return (_TtC14WeatherIntents13IntentHandler *)sub_100009410();
}

- (void).cxx_destruct
{
  sub_10000CB64((uint64_t)self + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___localSearchManager, &qword_100019768);
  swift_release();
  swift_release();
  sub_10000CB64((uint64_t)self + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___locationDataModelFactory, &qword_1000197A8);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___defaultCityManager));
  sub_10000CB64((uint64_t)self + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReader, &qword_100019790);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14WeatherIntents13IntentHandler_searchCompleter);
}

- (void)provideLocationOptionsCollectionForWeather:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_100010470();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_copy(v8);
  id v11 = a3;
  v12 = self;
  sub_100009638((uint64_t)v11, v9, (unint64_t)a4, v12, (void (**)(void, void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (id)defaultLocationForWeather:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_10000A0B0(v4);

  return v6;
}

- (id)handlerForIntent:(id)a3
{
  sub_10000A6D8(v5);
  sub_100006C64(v5, v5[3]);
  v3 = (void *)sub_100010680();
  sub_100004508((uint64_t)v5);

  return v3;
}

- (void)resolveLocationForWeather:(id)a3 withCompletion:(id)a4
{
}

- (void)handleWeather:(id)a3 completion:(id)a4
{
}

@end