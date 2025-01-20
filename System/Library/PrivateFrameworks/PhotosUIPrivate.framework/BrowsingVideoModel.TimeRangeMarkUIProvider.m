@interface BrowsingVideoModel.TimeRangeMarkUIProvider
- (CGSize)timeRangeMark:(id)a3 sizeInFrame:(CGRect)a4;
- (_TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC23TimeRangeMarkUIProvider)init;
- (id)uiProxyForTimeRangeMark:(id)a3 withSource:(id)a4;
@end

@implementation BrowsingVideoModel.TimeRangeMarkUIProvider

- (CGSize)timeRangeMark:(id)a3 sizeInFrame:(CGRect)a4
{
  id v5 = a3;
  v6 = self;
  sub_1AEA26B28(v5);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)uiProxyForTimeRangeMark:(id)a3 withSource:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  id v7 = sub_1AEA26C44();

  swift_unknownObjectRelease();
  return v7;
}

- (_TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC23TimeRangeMarkUIProvider)init
{
  return (_TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC23TimeRangeMarkUIProvider *)sub_1AEA26D54();
}

@end