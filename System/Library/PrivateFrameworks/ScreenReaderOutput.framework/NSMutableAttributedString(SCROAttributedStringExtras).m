@interface NSMutableAttributedString(SCROAttributedStringExtras)
- (void)scrAttributedStringTrimTrailingNewlines;
@end

@implementation NSMutableAttributedString(SCROAttributedStringExtras)

- (void)scrAttributedStringTrimTrailingNewlines
{
  v2 = [a1 string];
  uint64_t v3 = [v2 length];
  v4 = [MEMORY[0x263F08708] newlineCharacterSet];
  if (v3 < 1)
  {
    id v12 = v2;
  }
  else
  {
    unint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = [v2 rangeOfCharacterFromSet:v4 options:4];
      BOOL v8 = v6 == v3 - 1 && v7 == 1;
      int v9 = v8;
      if (v8) {
        objc_msgSend(a1, "replaceCharactersInRange:withString:", v6, v7, &stru_26CCE0B50);
      }
      id v14 = [a1 string];

      uint64_t v10 = [v14 length];
      int v11 = v10 > 0 ? v9 : 0;
      if (v11 != 1) {
        break;
      }
      uint64_t v3 = v10;
      id v12 = v14;
      v2 = v14;
      if (v5++ >= 0x64) {
        goto LABEL_21;
      }
    }
    id v12 = v14;
  }
LABEL_21:
  id v15 = v12;
}

@end