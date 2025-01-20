@interface PassLocationWeatherManager
- (_TtC9PassKitUI26PassLocationWeatherManager)init;
- (void)fetchWeatherDisplayInformationFor:(id)a3 completion:(id)a4;
@end

@implementation PassLocationWeatherManager

- (void)fetchWeatherDisplayInformationFor:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_19F532BF4(v7, (uint64_t)v8, (void (**)(const void *, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC9PassKitUI26PassLocationWeatherManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PassLocationWeatherManager *)&v3 init];
}

@end