@interface NSAttributedString(UserNotificationsUIKit)
- (BOOL)unui_containsExcessiveLineHeightCharacters;
@end

@implementation NSAttributedString(UserNotificationsUIKit)

- (BOOL)unui_containsExcessiveLineHeightCharacters
{
  v1 = [a1 string];
  v2 = objc_msgSend(MEMORY[0x1E4FB08E0], "unui_excessiveLineHeightChars");
  BOOL v3 = [v1 rangeOfCharacterFromSet:v2] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

@end