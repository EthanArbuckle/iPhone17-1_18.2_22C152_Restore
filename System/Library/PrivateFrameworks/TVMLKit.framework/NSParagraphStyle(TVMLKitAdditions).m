@interface NSParagraphStyle(TVMLKitAdditions)
- (id)tv_paragraphStyleWithBaseWritingDirection:()TVMLKitAdditions;
@end

@implementation NSParagraphStyle(TVMLKitAdditions)

- (id)tv_paragraphStyleWithBaseWritingDirection:()TVMLKitAdditions
{
  v4 = (void *)[a1 mutableCopy];
  [v4 setBaseWritingDirection:a3];
  v5 = (void *)[v4 copy];

  return v5;
}

@end