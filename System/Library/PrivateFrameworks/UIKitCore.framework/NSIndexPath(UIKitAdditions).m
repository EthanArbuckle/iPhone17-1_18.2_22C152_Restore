@interface NSIndexPath(UIKitAdditions)
+ (id)indexPathForItem:()UIKitAdditions inSection:;
+ (id)indexPathForRow:()UIKitAdditions inSection:;
- (uint64_t)item;
- (uint64_t)row;
- (uint64_t)section;
@end

@implementation NSIndexPath(UIKitAdditions)

- (uint64_t)section
{
  return [a1 indexAtPosition:0];
}

- (uint64_t)item
{
  return [a1 indexAtPosition:1];
}

+ (id)indexPathForRow:()UIKitAdditions inSection:
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = a4;
  v6[1] = a3;
  v4 = [(id)objc_opt_class() indexPathWithIndexes:v6 length:2];
  return v4;
}

+ (id)indexPathForItem:()UIKitAdditions inSection:
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = a4;
  v6[1] = a3;
  v4 = [(id)objc_opt_class() indexPathWithIndexes:v6 length:2];
  return v4;
}

- (uint64_t)row
{
  if ([a1 length] != 2)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:a1 file:@"NSIndexPath+UIKitAdditions.m" lineNumber:32 description:@"Invalid index path for use with UITableView. Index paths passed to table view must contain exactly two indices specifying the section and row. Please use the category on NSIndexPath in NSIndexPath+UIKitAdditions.h if possible."];
  }
  return [a1 indexAtPosition:1];
}

@end