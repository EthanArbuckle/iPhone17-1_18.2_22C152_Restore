@interface DateRangePickerView
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityValue;
- (_TtC8StocksUI19DateRangePickerView)initWithCoder:(id)a3;
- (_TtC8StocksUI19DateRangePickerView)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DateRangePickerView

- (_TtC8StocksUI19DateRangePickerView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI19DateRangePickerView_onChange);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8StocksUI19DateRangePickerView *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A63D5B4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_20A63D8E8((uint64_t)a3);
}

- (_TtC8StocksUI19DateRangePickerView)initWithFrame:(CGRect)a3
{
  result = (_TtC8StocksUI19DateRangePickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI19DateRangePickerView_styler);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI19DateRangePickerView_segmentedControl));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI19DateRangePickerView_onChange);

  sub_20A459CA4(v3);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DateRangePickerView();
  id v2 = v6.receiver;
  unint64_t v3 = [(DateRangePickerView *)&v6 accessibilityTraits];
  uint64_t v4 = *MEMORY[0x263F83248];

  return v4 | v3;
}

- (NSString)accessibilityValue
{
  id v2 = self;
  sub_20A63DCDC();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (void)accessibilityIncrement
{
  id v2 = self;
  sub_20A63DE3C();
}

- (void)accessibilityDecrement
{
  id v2 = self;
  sub_20A63E34C();
}

- (BOOL)accessibilityActivate
{
  return 1;
}

@end