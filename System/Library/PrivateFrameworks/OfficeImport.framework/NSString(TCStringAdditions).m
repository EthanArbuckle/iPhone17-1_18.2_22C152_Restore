@interface NSString(TCStringAdditions)
+ (id)tc_stringByFixingUnpairedSurrogateCharactersInString:()TCStringAdditions;
+ (uint64_t)tc_fixUnpairedSurrogateCharactersInBuffer:()TCStringAdditions;
- (BOOL)tc_doesURLHostContainWhitespace;
- (BOOL)tc_startsWithString:()TCStringAdditions;
- (uint64_t)nulTerminatedUTF8;
@end

@implementation NSString(TCStringAdditions)

- (BOOL)tc_startsWithString:()TCStringAdditions
{
  uint64_t v1 = objc_msgSend(a1, "rangeOfString:");
  return v2 && v1 == 0;
}

- (BOOL)tc_doesURLHostContainWhitespace
{
  uint64_t v1 = (void *)[objc_alloc(NSURL) initWithString:a1];
  uint64_t v2 = [v1 host];
  if (v2)
  {
    v3 = [v1 host];
    v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    BOOL v5 = [v3 rangeOfCharacterFromSet:v4] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (uint64_t)nulTerminatedUTF8
{
  id v1 = a1;
  return [v1 UTF8String];
}

+ (uint64_t)tc_fixUnpairedSurrogateCharactersInBuffer:()TCStringAdditions
{
  uint64_t v3 = *a3;
  uint64_t v4 = a3[1];
  uint64_t v5 = v4 - *a3;
  if (v4 != *a3)
  {
    uint64_t v6 = 0;
    char v7 = 0;
    unint64_t v8 = v5 >> 1;
    while (1)
    {
      int v9 = *(_WORD *)(v3 + 2 * v6) & 0xFC00;
      if (v9 == 56320) {
        goto LABEL_7;
      }
      if (v9 == 55296) {
        break;
      }
LABEL_8:
      uint64_t v10 = v6;
LABEL_9:
      uint64_t v6 = v10 + 1;
      if (v10 + 1 >= v8) {
        return v7 & 1;
      }
    }
    uint64_t v10 = v6 + 1;
    if (v6 + 1 < v8 && (*(_WORD *)(v3 + 2 * v10) & 0xFC00) == 0xDC00) {
      goto LABEL_9;
    }
LABEL_7:
    *(_WORD *)(v3 + 2 * v6) = 9633;
    char v7 = 1;
    goto LABEL_8;
  }
  char v7 = 0;
  return v7 & 1;
}

+ (id)tc_stringByFixingUnpairedSurrogateCharactersInString:()TCStringAdditions
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  std::vector<unsigned short>::vector(__p, v5);
  [v4 getCharacters:__p[0]];
  int v6 = objc_msgSend(a1, "tc_fixUnpairedSurrogateCharactersInBuffer:", __p);
  char v7 = v4;
  if (v6)
  {
    char v7 = [NSString stringWithCharacters:__p[0] length:v5];
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v7;
}

@end