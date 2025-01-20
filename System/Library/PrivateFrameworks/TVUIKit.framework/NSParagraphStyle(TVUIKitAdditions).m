@interface NSParagraphStyle(TVUIKitAdditions)
- (id)tv_paragraphStyleWithBaseWritingDirection:()TVUIKitAdditions;
@end

@implementation NSParagraphStyle(TVUIKitAdditions)

- (id)tv_paragraphStyleWithBaseWritingDirection:()TVUIKitAdditions
{
  v4 = (void *)[a1 mutableCopy];
  [v4 setBaseWritingDirection:a3];
  v5 = (void *)[v4 copy];

  return v5;
}

@end