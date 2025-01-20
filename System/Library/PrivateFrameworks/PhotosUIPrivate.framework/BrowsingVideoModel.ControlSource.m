@interface BrowsingVideoModel.ControlSource
- (BOOL)isLoading;
- (BOOL)isPlaying;
- (NSArray)timeRangeMarks;
- (NSString)currentValueText;
- (NSString)maxValueText;
- (_TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC13ControlSource)init;
- (float)currentValue;
- (float)maxValue;
- (float)minValue;
- (void)setCurrentValue:(float)a3;
- (void)setCurrentValueText:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setMaxValue:(float)a3;
- (void)setMaxValueText:(id)a3;
- (void)setMinValue:(float)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setTimeRangeMarks:(id)a3;
@end

@implementation BrowsingVideoModel.ControlSource

- (float)minValue
{
  return sub_1AEA26568();
}

- (void)setMinValue:(float)a3
{
}

- (float)maxValue
{
  return sub_1AEA265D0();
}

- (void)setMaxValue:(float)a3
{
}

- (float)currentValue
{
  return sub_1AEA26638();
}

- (void)setCurrentValue:(float)a3
{
}

- (BOOL)isPlaying
{
  return sub_1AEA266A4() & 1;
}

- (void)setPlaying:(BOOL)a3
{
}

- (BOOL)isLoading
{
  return sub_1AEA26714() & 1;
}

- (void)setLoading:(BOOL)a3
{
}

- (NSString)currentValueText
{
  return (NSString *)sub_1AEA26780((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC13ControlSource_currentValueText);
}

- (void)setCurrentValueText:(id)a3
{
}

- (NSString)maxValueText
{
  return (NSString *)sub_1AEA26780((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC13ControlSource_maxValueText);
}

- (void)setMaxValueText:(id)a3
{
}

- (NSArray)timeRangeMarks
{
  sub_1AEA2692C();
  sub_1AEA0826C(0, &qword_1E9A972F8);
  v2 = (void *)sub_1AEF96F60();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setTimeRangeMarks:(id)a3
{
  sub_1AEA0826C(0, &qword_1E9A972F8);
  uint64_t v4 = sub_1AEF96F70();
  v5 = self;
  sub_1AEA269BC(v4);
}

- (_TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC13ControlSource)init
{
  return (_TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC13ControlSource *)sub_1AEA269D4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end