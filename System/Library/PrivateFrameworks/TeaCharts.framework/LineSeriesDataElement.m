@interface LineSeriesDataElement
- (CGRect)accessibilityFrame;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement)init;
- (_TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement)initWithAccessibilityContainer:(id)a3;
- (void)setAccessibilityFrame:(CGRect)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
@end

@implementation LineSeriesDataElement

- (CGRect)accessibilityFrame
{
  double v2 = sub_1BD5FED9C(self, (uint64_t)a2, sub_1BD5FE36C);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAccessibilityFrame:(CGRect)a3
{
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1BD5FE514(self, (uint64_t)a2, (void (*)(void))sub_1BD5FE430);
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1BD5FE514(self, (uint64_t)a2, (void (*)(void))sub_1BD5FE594);
}

- (void)setAccessibilityValue:(id)a3
{
}

- (_TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement)initWithAccessibilityContainer:(id)a3
{
}

- (_TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end