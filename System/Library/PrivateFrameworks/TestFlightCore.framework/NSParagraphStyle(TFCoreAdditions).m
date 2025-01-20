@interface NSParagraphStyle(TFCoreAdditions)
- (id)tf_paragraphStyleWithBaseWritingDirection:()TFCoreAdditions;
@end

@implementation NSParagraphStyle(TFCoreAdditions)

- (id)tf_paragraphStyleWithBaseWritingDirection:()TFCoreAdditions
{
  v4 = (void *)[a1 mutableCopy];
  [v4 setBaseWritingDirection:a3];
  v5 = (void *)[v4 copy];

  return v5;
}

@end