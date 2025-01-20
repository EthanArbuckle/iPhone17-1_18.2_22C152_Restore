@interface PLVisualSearchAttributes
+ (NSString)algorithmVersionKey;
+ (NSString)stickerConfidenceAlgorithmVersionKey;
+ (NSString)stickerConfidenceScoreKey;
+ (id)entityName;
@end

@implementation PLVisualSearchAttributes

+ (id)entityName
{
  return @"VisualSearchAttributes";
}

+ (NSString)stickerConfidenceAlgorithmVersionKey
{
  return (NSString *)@"stickerConfidenceAlgorithmVersion";
}

+ (NSString)algorithmVersionKey
{
  return (NSString *)@"algorithmVersion";
}

+ (NSString)stickerConfidenceScoreKey
{
  return (NSString *)@"stickerConfidenceScore";
}

@end