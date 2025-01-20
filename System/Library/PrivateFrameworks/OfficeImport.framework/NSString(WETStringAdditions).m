@interface NSString(WETStringAdditions)
- (uint64_t)fontTypeForCharacter:()WETStringAdditions isControl:;
- (uint64_t)tc_fontTypeAtIndex:()WETStringAdditions effectiveRange:forXML:;
@end

@implementation NSString(WETStringAdditions)

- (uint64_t)fontTypeForCharacter:()WETStringAdditions isControl:
{
  *a4 = a3 < 0x21;
  if (a3 < 0xA0) {
    return 0;
  }
  if (a3 < 0x590) {
    return 3;
  }
  if (a3 < 0x780) {
    return 2;
  }
  unsigned int v5 = a3 >> 8;
  if (a3 >> 8 < 0x11) {
    return 0;
  }
  if (a3 >> 9 < 9) {
    return 1;
  }
  if (a3 >> 9 < 0xF) {
    return 0;
  }
  if (a3 >> 7 < 0x5D) {
    return 3;
  }
  if (a3 < 0xE000) {
    return 1;
  }
  if (v5 < 0xF9) {
    return 3;
  }
  if (v5 < 0xFB) {
    return 1;
  }
  if (a3 < 0xFB1D) {
    return 3;
  }
  unsigned int v6 = a3 >> 4;
  if (a3 >> 4 < 0xFE3) {
    return 0;
  }
  if (v6 < 0xFE7) {
    return 1;
  }
  if (v5 < 0xFF) {
    return 0;
  }
  return v6 < 0xFFF;
}

- (uint64_t)tc_fontTypeAtIndex:()WETStringAdditions effectiveRange:forXML:
{
  if ([a1 length] <= a3) {
    return 0xFFFFFFFFLL;
  }
  BOOL v21 = 0;
  uint64_t v9 = [a1 characterAtIndex:a3];
  if (a5) {
    uint64_t v10 = [a1 fontTypeForCharacter:v9 isControl:&v21];
  }
  else {
    uint64_t v10 = OCLanguageTypeForCharacter(v9, &v21);
  }
  uint64_t v11 = v10;
  if (a4)
  {
    *a4 = a3;
    unint64_t v12 = [a1 length];
    if (v12 >= a4[1]) {
      unint64_t v13 = a4[1];
    }
    else {
      unint64_t v13 = v12;
    }
    unint64_t v14 = [a1 length];
    if (v14 >= *a4 + v13) {
      unint64_t v15 = *a4 + v13;
    }
    else {
      unint64_t v15 = v14;
    }
    unint64_t v16 = a3 + 1;
    if (v16 < v15)
    {
      do
      {
        BOOL v20 = 0;
        uint64_t v17 = [a1 characterAtIndex:v16];
        if (a5) {
          uint64_t v18 = [a1 fontTypeForCharacter:v17 isControl:&v20];
        }
        else {
          uint64_t v18 = OCLanguageTypeForCharacter(v17, &v20);
        }
        if (!v20)
        {
          if (v21)
          {
            BOOL v21 = 0;
            uint64_t v11 = v18;
          }
          else if (v11 != v18)
          {
            goto LABEL_23;
          }
        }
        ++v16;
      }
      while (v15 != v16);
      unint64_t v16 = v15;
    }
LABEL_23:
    a4[1] = v16 - *a4;
  }
  return v11;
}

@end