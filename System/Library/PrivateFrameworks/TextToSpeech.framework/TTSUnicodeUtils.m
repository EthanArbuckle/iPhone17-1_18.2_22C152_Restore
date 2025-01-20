@interface TTSUnicodeUtils
+ (_NSRange)utf16RangeFromUTF8Range:(_NSRange)a3 chars:(const char *)a4 size:(unint64_t)a5;
+ (_NSRange)utf8RangeFromUTF16Range:(_NSRange)a3 chars:(const unsigned __int16 *)a4 size:(unint64_t)a5;
+ (unsigned)codePointToUtf8ByteSize:(unsigned int)a3;
@end

@implementation TTSUnicodeUtils

+ (unsigned)codePointToUtf8ByteSize:(unsigned int)a3
{
  if (a3 < 0x10000) {
    char v3 = 3;
  }
  else {
    char v3 = 4;
  }
  if (a3 >= 0x800) {
    unsigned __int8 v4 = v3;
  }
  else {
    unsigned __int8 v4 = 2;
  }
  if (a3 >= 0x80) {
    return v4;
  }
  else {
    return 1;
  }
}

+ (_NSRange)utf8RangeFromUTF16Range:(_NSRange)a3 chars:(const unsigned __int16 *)a4 size:(unint64_t)a5
{
  NSUInteger location = a3.location;
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  uint64_t v10 = 0;
  NSUInteger v11 = a3.location + a3.length;
  do
  {
    if (v9 >= a5) {
      break;
    }
    uint64_t v12 = a4[v9];
    if ((v12 & 0xFC00) == 0xD800)
    {
      uint64_t v12 = ((a4[v9 + 1] - 56320) | ((v12 << 10) - 56623104)) + 0x10000;
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v13 = 1;
    }
    v14 = objc_opt_class();
    unsigned int v18 = objc_msgSend_codePointToUtf8ByteSize_(v14, v15, v12, v16, v17);
    if (v9 == location) {
      uint64_t v8 = v10;
    }
    if (v9 == v11)
    {
      NSUInteger v19 = v10 - v8;
      goto LABEL_14;
    }
    v9 += v13;
    v10 += v18;
  }
  while (v9 <= v11);
  if (v9 == v11)
  {
    NSUInteger v19 = v10 - v8;
  }
  else
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v19 = 0;
  }
LABEL_14:
  NSUInteger v20 = v8;
  result.length = v19;
  result.NSUInteger location = v20;
  return result;
}

+ (_NSRange)utf16RangeFromUTF8Range:(_NSRange)a3 chars:(const char *)a4 size:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      NSUInteger v7 = 0;
      NSUInteger v8 = 0;
      NSUInteger v6 = 0;
      NSUInteger length = 0;
      while (1)
      {
        int v9 = a4[v8];
        if (v9 < 0)
        {
          if ((v9 & 0xE0) == 0xC0)
          {
            uint64_t v10 = 1;
            uint64_t v11 = 2;
          }
          else if ((v9 & 0xF0) == 0xE0)
          {
            uint64_t v10 = 1;
            uint64_t v11 = 3;
          }
          else
          {
            if ((v9 & 0xF8) != 0xF0) {
              break;
            }
            uint64_t v10 = 2;
            uint64_t v11 = 4;
          }
        }
        else
        {
          uint64_t v10 = 1;
          uint64_t v11 = 1;
        }
        unint64_t v12 = v11 + v8;
        if (v12 > a5) {
          break;
        }
        if (v8 == a3.location) {
          NSUInteger v6 = v7;
        }
        if (v8 < a3.location + a3.length && v8 >= a3.location) {
          uint64_t v14 = v10;
        }
        else {
          uint64_t v14 = 0;
        }
        length += v14;
        v7 += v10;
        NSUInteger v8 = v12;
        if (v12 >= a5) {
          goto LABEL_25;
        }
      }
      NSUInteger length = 0;
      NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      NSUInteger v6 = 0;
      NSUInteger length = 0;
    }
  }
LABEL_25:
  result.NSUInteger length = length;
  result.NSUInteger location = v6;
  return result;
}

@end