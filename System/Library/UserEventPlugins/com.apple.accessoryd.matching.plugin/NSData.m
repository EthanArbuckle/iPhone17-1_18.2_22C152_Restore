@interface NSData
+ (id)CKDataWithHexString:(id)a3;
+ (id)CKDataWithHexString:(id)a3 stringIsUppercase:(BOOL)a4;
- (id)CKHexString;
- (id)CKLowercaseHexStringWithoutSpaces;
- (id)CKUppercaseHexStringWithoutSpaces;
@end

@implementation NSData

- (id)CKHexString
{
  v2 = self;
  v3 = [(NSData *)v2 bytes];
  unint64_t v4 = [(NSData *)v2 length];
  if (v4 > 0x5555555555555555)
  {
    uint64_t v5 = 0;
    v6 = 0;
    goto LABEL_27;
  }
  unint64_t v7 = v4;
  v8 = malloc_type_calloc(1uLL, ((9 * v4) >> 2) & 0x1FFFFFFFFFFFFFFFLL, 0x9D46FE2BuLL);
  v6 = v8;
  if (v7 >= 5)
  {
    uint64_t v9 = 0;
    v10 = v3;
    v11 = v8;
    do
    {
      uint64_t v12 = 0;
      ++v11;
      do
      {
        if (v10[v12] <= 0x9Fu) {
          char v13 = 48;
        }
        else {
          char v13 = 87;
        }
        *(v11 - 1) = v13 + (v10[v12] >> 4);
        unsigned int v14 = v10[v12] & 0xF;
        if (v14 <= 9) {
          char v15 = 48;
        }
        else {
          char v15 = 87;
        }
        unsigned char *v11 = v15 + v14;
        v11 += 2;
        ++v12;
      }
      while (v12 != 4);
      *(v11 - 1) = 32;
      v9 += 4;
      v7 -= 4;
      v10 += 4;
    }
    while (v7 > 4);
    if (!v7) {
      goto LABEL_26;
    }
    goto LABEL_17;
  }
  uint64_t v9 = 0;
  v11 = v8;
  if (v7)
  {
LABEL_17:
    v16 = &v3[v9];
    do
    {
      if (*v16 <= 0x9Fu) {
        char v17 = 48;
      }
      else {
        char v17 = 87;
      }
      unsigned char *v11 = v17 + (*v16 >> 4);
      char v18 = *v16++;
      unsigned int v19 = v18 & 0xF;
      if (v19 <= 9) {
        char v20 = 48;
      }
      else {
        char v20 = 87;
      }
      char v21 = v20 + v19;
      v22 = v11 + 2;
      v11[1] = v21;
      v11 += 2;
      --v7;
    }
    while (v7);
    v11 = v22;
  }
LABEL_26:
  uint64_t v5 = v11 - v8;
LABEL_27:
  id v23 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v6 length:v5 encoding:1 freeWhenDone:1];

  return v23;
}

- (id)CKLowercaseHexStringWithoutSpaces
{
  v2 = [(NSData *)self CKHexString];
  id v3 = [v2 mutableCopy];

  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_51F10, 0, 0, objc_msgSend(v3, "length"));

  return v3;
}

- (id)CKUppercaseHexStringWithoutSpaces
{
  v2 = [(NSData *)self CKHexString];
  id v3 = [v2 uppercaseString];
  id v4 = [v3 mutableCopy];

  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_51F10, 0, 0, objc_msgSend(v4, "length"));

  return v4;
}

+ (id)CKDataWithHexString:(id)a3 stringIsUppercase:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableData);
  if (v4) {
    unint64_t v7 = @"0123456789ABCDEF";
  }
  else {
    unint64_t v7 = @"0123456789abcdef";
  }
  if (v4) {
    char v8 = -65;
  }
  else {
    char v8 = -97;
  }
  uint64_t v9 = +[NSCharacterSet characterSetWithCharactersInString:v7];
  if ([v5 length])
  {
    unsigned int v10 = 0;
    do
    {
      unint64_t v11 = v10;
      if ((unint64_t)[v5 length] <= v10)
      {
        LODWORD(v13) = 0;
        char v16 = 1;
      }
      else
      {
        unsigned int v12 = v10 + 1;
        do
        {
          unsigned int v10 = v12;
          id v13 = [v5 characterAtIndex:v11];
          unsigned __int8 v14 = [v9 characterIsMember:v13];
          unint64_t v11 = v10;
          if (v14) {
            break;
          }
          id v15 = [v5 length];
          unsigned int v12 = v10 + 1;
        }
        while ((unint64_t)v15 > v10);
        char v16 = v14 ^ 1;
      }
      if ((unint64_t)[v5 length] <= v11) {
        break;
      }
      ++v10;
      while (1)
      {
        id v17 = [v5 characterAtIndex:v11];
        if ([v9 characterIsMember:v17]) {
          break;
        }
        unint64_t v11 = v10;
        if ((unint64_t)[v5 length] <= v10++) {
          goto LABEL_27;
        }
      }
      if (v16) {
        break;
      }
      if ((v13 - 48) >= 0xA) {
        char v19 = (_BYTE)v13 + 9;
      }
      else {
        char v19 = (char)v13;
      }
      char v20 = (_BYTE)v17 - 48;
      if ((v17 - 48) >= 0xA) {
        char v20 = v8 + (_BYTE)v17 + 10;
      }
      char v22 = v20 + 16 * v19;
      [v6 appendBytes:&v22 length:1];
    }
    while ((unint64_t)[v5 length] > v10);
  }
LABEL_27:

  return v6;
}

+ (id)CKDataWithHexString:(id)a3
{
  return [a1 CKDataWithHexString:a3 stringIsUppercase:0];
}

@end