@interface NSMutableString(MSVLyricsTTMLParser)
- (void)msvl_trimTrailingWhitespace;
@end

@implementation NSMutableString(MSVLyricsTTMLParser)

- (void)msvl_trimTrailingWhitespace
{
  v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v5 = [v2 invertedSet];

  uint64_t v3 = [a1 rangeOfCharacterFromSet:v5 options:4];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [a1 setString:&stru_1EF642BA8];
  }
  else
  {
    uint64_t v4 = v3 + 1;
    if (v3 + 1 < (unint64_t)[a1 length]) {
      objc_msgSend(a1, "deleteCharactersInRange:", v4, objc_msgSend(a1, "length") - v4);
    }
  }
}

@end