@interface VKCMockHelper
+ (CGSize)sizeFromPlistDictionary:(id)a3;
+ (_NSRange)rangeFromPlistDictionary:(id)a3;
+ (id)plistFromRange:(_NSRange)a3;
+ (id)plistFromSize:(CGSize)a3;
@end

@implementation VKCMockHelper

+ (id)plistFromRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = VKCMockResultRangeLocationKey;
  v4 = [NSNumber numberWithUnsignedInteger:a3.location];
  v8[1] = VKCMockResultRangeLengthKey;
  v9[0] = v4;
  v5 = [NSNumber numberWithUnsignedInteger:length];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

+ (_NSRange)rangeFromPlistDictionary:(id)a3
{
  v3 = VKCMockResultRangeLocationKey;
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:v3];
  uint64_t v6 = [v5 unsignedLongValue];

  v7 = [v4 objectForKeyedSubscript:VKCMockResultRangeLengthKey];

  uint64_t v8 = [v7 unsignedLongValue];
  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.location = v9;
  return result;
}

+ (id)plistFromSize:(CGSize)a3
{
  double height = a3.height;
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = VKCMockResultSizeWidthKey;
  id v4 = [NSNumber numberWithDouble:a3.width];
  v8[1] = VKCMockResultSizeHeightKey;
  v9[0] = v4;
  v5 = [NSNumber numberWithDouble:height];
  v9[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

+ (CGSize)sizeFromPlistDictionary:(id)a3
{
  uint64_t v3 = VKCMockResultSizeWidthKey;
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:v3];
  double v6 = (double)(unint64_t)[v5 unsignedLongValue];

  v7 = [v4 objectForKeyedSubscript:VKCMockResultSizeHeightKey];

  double v8 = (double)(unint64_t)[v7 unsignedLongValue];
  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.width = v9;
  return result;
}

@end