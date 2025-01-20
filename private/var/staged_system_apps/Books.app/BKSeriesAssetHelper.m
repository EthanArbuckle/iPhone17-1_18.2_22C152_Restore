@interface BKSeriesAssetHelper
+ (signed)mappedAssetContentTypeFromRawItemType:(id)a3;
- (BKSeriesAssetHelper)init;
@end

@implementation BKSeriesAssetHelper

+ (signed)mappedAssetContentTypeFromRawItemType:(id)a3
{
  id v3 = a3;
  signed __int16 v4 = _s5Books17SeriesAssetHelperC06mappedC11ContentType4fromSo07BKAssetfG0VSo8NSNumberC_tFZ_0(v3);

  return v4;
}

- (BKSeriesAssetHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SeriesAssetHelper();
  return [(BKSeriesAssetHelper *)&v3 init];
}

@end