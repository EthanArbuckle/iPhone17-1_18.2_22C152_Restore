@interface PopoverViewController
- (_TtC11WeatherMaps21PopoverViewController)initWithCoder:(id)a3;
- (_TtC11WeatherMaps21PopoverViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PopoverViewController

- (void)dealloc
{
  v2 = self;
  sub_20A206310();
}

- (void).cxx_destruct
{
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps21PopoverViewController_delegate);
  sub_20A38A2B0();
  OUTLINED_FUNCTION_3_14();
  uint64_t v3 = OUTLINED_FUNCTION_8_3();
  v4(v3);
  sub_20A389870();
  OUTLINED_FUNCTION_3_14();
  uint64_t v5 = OUTLINED_FUNCTION_8_3();
  v6(v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC3D3E0);
  OUTLINED_FUNCTION_3_14();
  uint64_t v7 = OUTLINED_FUNCTION_8_3();
  v8(v7);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___locationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___timeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___conditionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___temperatureRangeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___temperatureLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___viewLocationButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___openLocationButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___separator));
  swift_release();
}

- (_TtC11WeatherMaps21PopoverViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A206574();
}

- (void)loadView
{
  v2 = self;
  sub_20A2066C8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A2067B8();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_20A206AB0();
}

- (_TtC11WeatherMaps21PopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_20A38B610();
  }
  id v5 = a4;
  sub_20A20725C();
}

@end