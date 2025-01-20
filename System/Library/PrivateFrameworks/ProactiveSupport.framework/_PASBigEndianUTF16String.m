@interface _PASBigEndianUTF16String
- (id)initWithLength:(void *)a3 buffer:(void *)a4 backingObject:;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)_implGetCharacters:(uint64_t)a3 range:(uint64_t)a4;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation _PASBigEndianUTF16String

- (void).cxx_destruct
{
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  unsigned __int16 __dst = 0;
  [(_PASBigEndianUTF16String *)self _implGetCharacters:a3 range:1];
  return __dst;
}

- (void)_implGetCharacters:(uint64_t)a3 range:(uint64_t)a4
{
  if (result)
  {
    uint64_t v4 = a4;
    if ((unint64_t)(a3 + a4) > result[1])
    {
      v6 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v7 = *MEMORY[0x1E4F1C4A8];
      v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Range {%tu, %tu} out of bounds; string length %tu",
                     a3,
                     a4,
                     result[1]);
      id v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];

      objc_exception_throw(v9);
    }
    if (a4)
    {
      v5 = __dst;
      result = memcpy(__dst, (const void *)(result[2] + 2 * a3), 2 * a4);
      do
      {
        _WORD *v5 = bswap32((unsigned __int16)*v5) >> 16;
        ++v5;
        --v4;
      }
      while (v4);
    }
  }
  return result;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (unint64_t)length
{
  return self->_length;
}

- (id)initWithLength:(void *)a3 buffer:(void *)a4 backingObject:
{
  id v8 = a4;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)_PASBigEndianUTF16String;
    id v9 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v9;
    if (v9)
    {
      v9[1] = a2;
      v9[2] = a3;
      objc_storeStrong(v9 + 3, a4);
    }
  }

  return a1;
}

@end