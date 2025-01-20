@interface NSIndexPath(MSVAdditions)
+ (id)msv_indexPathForItem:()MSVAdditions inSection:;
- (uint64_t)msv_item;
- (uint64_t)msv_section;
@end

@implementation NSIndexPath(MSVAdditions)

- (uint64_t)msv_section
{
  return [a1 indexAtPosition:0];
}

- (uint64_t)msv_item
{
  if ((unint64_t)[a1 length] < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [a1 indexAtPosition:1];
}

+ (id)msv_indexPathForItem:()MSVAdditions inSection:
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = a4;
  v6[1] = a3;
  v4 = [(id)objc_opt_class() indexPathWithIndexes:v6 length:2];
  return v4;
}

@end