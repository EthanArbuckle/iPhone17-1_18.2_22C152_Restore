@interface TSDRangeClamper
+ (_NSRange)clampSelectedRange:(_NSRange)a3 inFullString:(id)a4 toWordLimit:(unint64_t)a5;
@end

@implementation TSDRangeClamper

+ (_NSRange)clampSelectedRange:(_NSRange)a3 inFullString:(id)a4 toWordLimit:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v8 = objc_msgSend(a4, "substringWithRange:");
  if ([v8 tsdWordCount] > a5) {
    NSUInteger length = [v8 endingCharIndexForWordLimit:a5];
  }
  NSUInteger v9 = location;
  NSUInteger v10 = length;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

@end