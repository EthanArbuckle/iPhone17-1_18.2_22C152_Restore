@interface asn1IntegerToken
- (id)_initWithID:(unint64_t)a3 class:(unsigned __int8)a4 length:(unint64_t)a5 content:(const char *)a6 opaque:(BOOL)a7;
- (id)description;
- (unint64_t)value;
@end

@implementation asn1IntegerToken

- (id)_initWithID:(unint64_t)a3 class:(unsigned __int8)a4 length:(unint64_t)a5 content:(const char *)a6 opaque:(BOOL)a7
{
  int v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)asn1IntegerToken;
  id result = [(asn1IntegerToken *)&v16 init];
  if (a3 != 2 || v9)
  {
    id v15 = result;
    return 0;
  }
  else if (result)
  {
    *((unsigned char *)result + 8) = 0;
    *((void *)result + 2) = 2;
    *((void *)result + 3) = a5;
    *((void *)result + 4) = a6;
    unint64_t v12 = 8;
    if (a5 < 8) {
      unint64_t v12 = a5;
    }
    *((void *)result + 5) = 0;
    if (v12)
    {
      uint64_t v13 = 0;
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (i)
        {
          v13 <<= 8;
          *((void *)result + 5) = v13;
        }
        v13 |= a6[i];
        *((void *)result + 5) = v13;
      }
    }
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"INT Token. Value:%lld (%llx)", self->mValue, self->mValue);
}

- (unint64_t)value
{
  return self->mValue;
}

@end