@interface NSString
+ (BOOL)isDataConvertibleToVisibleString:(id)a3;
+ (id)hexStringFromData:(id)a3;
+ (id)macAddressStringFromData:(id)a3;
+ (id)macAddressStringFromSysconfigDataSixByte:(id)a3;
+ (id)stringFromData:(id)a3;
+ (id)visibleStringFromData:(id)a3;
- (id)ccccValue;
- (id)stringByLeftTrimmingCharacter:(char)a3;
- (id)stringByRemovingCharactersInString:(id)a3;
- (id)stringByRightTrimmingCharacter:(char)a3;
- (id)stringByTrimmingCharactersInString:(id)a3;
@end

@implementation NSString

+ (BOOL)isDataConvertibleToVisibleString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    v6 = (unsigned __int8 *)[v5 bytes];
    v7 = (char *)[v5 length];
    while (v7)
    {
      v8 = v7 - 1;
      if ((v7--)[(void)(v6 - 1)])
      {
        uint64_t v10 = 0;
        v11 = v8 + 1;
        while ((char)v6[v10] >= 8)
        {
          int v12 = v6[v10];
          if (v12 == 127 || (v12 - 14) <= 0x11) {
            break;
          }
          if (++v10 >= (unint64_t)v11)
          {
            BOOL v14 = 1;
            goto LABEL_15;
          }
        }
        break;
      }
    }
  }
  BOOL v14 = 0;
LABEL_15:

  return v14;
}

+ (id)stringFromData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 length])
    {
      if ([a1 isDataConvertibleToVisibleString:v5]) {
        [a1 visibleStringFromData:v5];
      }
      else {
      v6 = [a1 hexStringFromData:v5];
      }
    }
    else
    {
      v6 = &stru_1000148A0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)visibleStringFromData:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  char v8 = 0;
  if (v3)
  {
    if ([v3 length])
    {
      objc_msgSend(v4, "getBytes:range:", &v8, (char *)objc_msgSend(v4, "length") - 1, 1);
      if (v8)
      {
        id v5 = (__CFString *)[objc_alloc((Class)NSString) initWithData:v4 encoding:4];
      }
      else
      {
        +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v4 bytes]);
        id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v6 = v5;
    }
    else
    {
      v6 = &stru_1000148A0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)hexStringFromData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableString);
    id v5 = (char *)[v3 length];
    v6 = (unsigned __int8 *)[v3 bytes];
    if (v5)
    {
      v7 = v6;
      do
      {
        unsigned int v8 = *v7++;
        objc_msgSend(v4, "appendFormat:", @"%02x", v8);
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)macAddressStringFromData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableString);
    id v5 = (char *)[v3 length];
    v6 = (unsigned __int8 *)[v3 bytes];
    if (v5)
    {
      v7 = v6;
      do
      {
        unsigned int v8 = *v7++;
        objc_msgSend(v4, "appendFormat:", @"%02x", v8);
        if (v5 != (char *)1) {
          [v4 appendFormat:@":"];
        }
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)macAddressStringFromSysconfigDataSixByte:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableString);
    if ((unint64_t)[v3 length] <= 6) {
      uint64_t v5 = (uint64_t)[v3 length];
    }
    else {
      uint64_t v5 = 6;
    }
    v6 = (unsigned __int8 *)[v3 bytes];
    if (v5)
    {
      v7 = v6;
      do
      {
        unsigned int v8 = *v7++;
        objc_msgSend(v4, "appendFormat:", @"%02x", v8);
        if (v5 != 1) {
          [v4 appendFormat:@":"];
        }
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)stringByRemovingCharactersInString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  if (v4 && [v4 length])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = objc_msgSend(v4, "substringWithRange:", v6, 1);
      unsigned int v8 = [(NSString *)v5 stringByReplacingOccurrencesOfString:v7 withString:&stru_1000148A0];

      ++v6;
      uint64_t v5 = v8;
    }
    while ((unint64_t)[v4 length] > v6);
  }
  else
  {
    unsigned int v8 = v5;
  }

  return v8;
}

- (id)stringByTrimmingCharactersInString:(id)a3
{
  id v4 = self;
  if (a3)
  {
    uint64_t v5 = +[NSCharacterSet characterSetWithCharactersInString:a3];
    uint64_t v6 = [(NSString *)v4 stringByTrimmingCharactersInSet:v5];

    id v4 = (NSString *)v6;
  }
  return v4;
}

- (id)stringByLeftTrimmingCharacter:(char)a3
{
  id v4 = [(NSString *)self UTF8String];
  size_t v5 = strlen(v4);
  size_t v6 = 0;
  if (v5)
  {
    while (v4[v6] == a3)
    {
      if (v5 == ++v6)
      {
        size_t v6 = v5;
        break;
      }
    }
  }
  id v7 = [objc_alloc((Class)NSString) initWithBytes:&v4[v6] length:v5 - v6 encoding:4];
  return v7;
}

- (id)stringByRightTrimmingCharacter:(char)a3
{
  int v3 = a3;
  id v4 = [(NSString *)self UTF8String];
  size_t v5 = strlen(v4);
  do
  {
    size_t v6 = v5;
    if (!v5) {
      break;
    }
    --v5;
  }
  while (v4[v6 - 1] == v3);
  id v7 = [objc_alloc((Class)NSString) initWithBytes:v4 length:v6 encoding:4];
  return v7;
}

- (id)ccccValue
{
  if ((id)[(NSString *)self length] == (id)4)
  {
    int v3 = +[NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)[(NSString *)self cStringUsingEncoding:1])];
  }
  else
  {
    int v3 = 0;
  }
  return v3;
}

@end