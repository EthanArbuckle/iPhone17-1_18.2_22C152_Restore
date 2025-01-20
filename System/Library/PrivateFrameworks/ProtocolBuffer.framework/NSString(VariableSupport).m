@interface NSString(VariableSupport)
- (__CFString)_pb_fixCase:()VariableSupport;
@end

@implementation NSString(VariableSupport)

- (__CFString)_pb_fixCase:()VariableSupport
{
  if ([a1 length])
  {
    uint64_t v5 = [a1 lengthOfBytesUsingEncoding:4];
    v6 = (char *)malloc_type_malloc(v5 + 1, 0x77095664uLL);
    objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v6, v5, 0, 4, 1, 0, objc_msgSend(a1, "length"), 0);
    v6[v5] = 0;
    uint64_t v7 = 0;
    if (v5)
    {
      BOOL v8 = !a3;
      v9 = v6;
      do
      {
        __darwin_ct_rune_t v11 = *v9++;
        __darwin_ct_rune_t v10 = v11;
        if (a3)
        {
          LOBYTE(v10) = __toupper(v10);
        }
        else if (v8)
        {
          LOBYTE(v10) = __tolower(v10);
        }
        a3 = v10 == 95;
        if (v10 != 95) {
          v6[v7++] = v10;
        }
        BOOL v8 = 0;
        --v5;
      }
      while (v5);
    }
    v6[v7] = 0;
    v12 = [NSString stringWithUTF8String:v6];
    free(v6);
  }
  else
  {
    v12 = &stru_1EFF81660;
  }
  return v12;
}

@end