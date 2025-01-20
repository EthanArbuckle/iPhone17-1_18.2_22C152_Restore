@interface SiriTTSNSRangeUtil
+ (_NSRange)mapUtf8RangeToUtf16:(_NSRange)a3 inText:(id)a4;
- (SiriTTSNSRangeUtil)init;
@end

@implementation SiriTTSNSRangeUtil

- (SiriTTSNSRangeUtil)init
{
  return (SiriTTSNSRangeUtil *)sub_19CDF3F80();
}

+ (_NSRange)mapUtf8RangeToUtf16:(_NSRange)a3 inText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = sub_19CED5260();
  unint64_t v8 = static NSRangeUtil.mapUtf8RangeToUtf16(_:inText:)(location, length, v6, v7);
  NSUInteger v10 = v9;
  swift_bridgeObjectRelease();
  NSUInteger v11 = v8;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

@end