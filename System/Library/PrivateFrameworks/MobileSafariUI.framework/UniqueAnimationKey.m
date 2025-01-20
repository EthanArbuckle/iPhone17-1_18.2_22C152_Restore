@interface UniqueAnimationKey
- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9;
- (UniqueAnimationKey)initWithKey:(unint64_t)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
@end

@implementation UniqueAnimationKey

- (UniqueAnimationKey)initWithKey:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UniqueAnimationKey;
  v4 = [(UniqueAnimationKey *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_key = a3;
    v6 = v4;
  }

  return v5;
}

- (unint64_t)length
{
  unint64_t key = self->_key;
  unint64_t result = 12;
  if (key >= 0x10)
  {
    do
    {
      ++result;
      BOOL v4 = key > 0xFF;
      key >>= 4;
    }
    while (v4);
  }
  return result;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (a3 <= 0xA) {
    return kUniqueAnimationKeyPrefix[a3];
  }
  unint64_t key = self->_key;
  unint64_t v5 = a3 - 11;
  if (a3 != 11)
  {
    do
    {
      key >>= 4;
      --v5;
    }
    while (v5);
  }
  return (key & 0xF) + 97;
}

- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9
{
  if (a9) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = a6 == 30;
  }
  if (v9 && a8.location == 0)
  {
    if (a8.length >= a4) {
      unint64_t length = a4;
    }
    else {
      unint64_t length = a8.length;
    }
    if (length < 0xB)
    {
      return 0;
    }
    else
    {
      *(_DWORD *)((char *)a3 + 7) = 762930539;
      *(void *)a3 = *(void *)"unique-key-";
      unint64_t key = self->_key;
      if (length == 11 || key == 0)
      {
        unint64_t v15 = 11;
      }
      else
      {
        uint64_t v16 = 0;
        unint64_t v17 = length - 12;
        do
        {
          *((unsigned char *)a3 + v16 + 11) = (key & 0xF) + 97;
          uint64_t v18 = v16 + 1;
          if (v17 == v16) {
            break;
          }
          ++v16;
          BOOL v19 = key > 0xF;
          key >>= 4;
        }
        while (v19);
        unint64_t v15 = v18 + 11;
      }
      *a5 = v15;
      return 1;
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)UniqueAnimationKey;
    return -[UniqueAnimationKey getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](&v20, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_, a3, a4, a5, a6, a7, a8.location, a8.length, a9);
  }
}

@end