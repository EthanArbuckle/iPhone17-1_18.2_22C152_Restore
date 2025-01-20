@interface PALoggingOptionsFactory
+ (unint64_t)defaultLoggingOptions;
@end

@implementation PALoggingOptionsFactory

+ (unint64_t)defaultLoggingOptions
{
  return +[_PALoggingOptions defaultLoggingOptions];
}

@end