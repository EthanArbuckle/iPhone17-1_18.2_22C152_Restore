@interface NSMutableArray(SpringBoard)
- (void)_sb_safeAddObject:()SpringBoard;
@end

@implementation NSMutableArray(SpringBoard)

- (void)_sb_safeAddObject:()SpringBoard
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end