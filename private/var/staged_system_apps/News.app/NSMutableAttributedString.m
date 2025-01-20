@interface NSMutableAttributedString
- (void)fr_accessibilityApplyLowerPitchTokenToRange:(_NSRange)a3;
@end

@implementation NSMutableAttributedString

- (void)fr_accessibilityApplyLowerPitchTokenToRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v7 = UIAccessibilityTokenLowPitch;
  v8 = &__kCFBooleanTrue;
  v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v6, location, length);
}

@end