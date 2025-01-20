@interface NSString(UserNotificationsUIKit)
- (BOOL)unui_containsExcessiveLineHeightCharacters;
@end

@implementation NSString(UserNotificationsUIKit)

- (BOOL)unui_containsExcessiveLineHeightCharacters
{
  v2 = objc_msgSend(MEMORY[0x1E4FB08E0], "unui_excessiveLineHeightChars");
  BOOL v3 = [a1 rangeOfCharacterFromSet:v2] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

@end