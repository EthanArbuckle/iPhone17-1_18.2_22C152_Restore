@interface PLCharacterRecognitionAttributes
+ (NSString)algorithmVersionKey;
+ (id)entityName;
@end

@implementation PLCharacterRecognitionAttributes

+ (id)entityName
{
  return @"CharacterRecognitionAttributes";
}

+ (NSString)algorithmVersionKey
{
  return (NSString *)@"algorithmVersion";
}

@end