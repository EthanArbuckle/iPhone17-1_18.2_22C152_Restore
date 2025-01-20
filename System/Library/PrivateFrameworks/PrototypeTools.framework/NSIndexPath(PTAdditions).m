@interface NSIndexPath(PTAdditions)
+ (id)pt_indexPathForRow:()PTAdditions inSection:;
- (uint64_t)pt_row;
- (uint64_t)pt_section;
@end

@implementation NSIndexPath(PTAdditions)

+ (id)pt_indexPathForRow:()PTAdditions inSection:
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = a4;
  v6[1] = a3;
  v4 = [(id)objc_opt_class() indexPathWithIndexes:v6 length:2];
  return v4;
}

- (uint64_t)pt_section
{
  return [a1 indexAtPosition:0];
}

- (uint64_t)pt_row
{
  return [a1 indexAtPosition:1];
}

@end