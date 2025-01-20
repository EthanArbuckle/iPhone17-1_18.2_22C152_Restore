@interface CMPocketStateManager(SpringBoard)
+ (BOOL)_sb_isScreenObscuredInPocketState:()SpringBoard;
@end

@implementation CMPocketStateManager(SpringBoard)

+ (BOOL)_sb_isScreenObscuredInPocketState:()SpringBoard
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

@end