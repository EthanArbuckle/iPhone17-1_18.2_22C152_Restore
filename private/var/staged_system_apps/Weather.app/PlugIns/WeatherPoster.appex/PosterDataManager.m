@interface PosterDataManager
- (_TtC13WeatherPoster17PosterDataManager)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation PosterDataManager

- (_TtC13WeatherPoster17PosterDataManager)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager____lazy_storage___locationManager));
  swift_release();

  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_activeRequestLocation));
  sub_100019374((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_sessionExtenderDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_posterDataDelegate;

  sub_100019374((uint64_t)v3);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_100018DB0(0, &qword_10006D958);
  unint64_t v6 = sub_100053FC8();
  id v7 = a3;
  v8 = self;
  sub_10004D800(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_10004ED28();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10004EFA0(v4);
}

@end