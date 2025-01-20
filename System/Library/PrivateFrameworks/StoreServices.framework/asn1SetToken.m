@interface asn1SetToken
- (id)_initWithID:(unint64_t)a3 class:(unsigned __int8)a4 length:(unint64_t)a5 content:(const char *)a6 opaque:(BOOL)a7;
- (id)description;
- (id)nextToken;
- (void)reset;
@end

@implementation asn1SetToken

- (id)_initWithID:(unint64_t)a3 class:(unsigned __int8)a4 length:(unint64_t)a5 content:(const char *)a6 opaque:(BOOL)a7
{
  int v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)asn1SetToken;
  id result = [(asn1SetToken *)&v13 init];
  if (a3 != 17 || v9)
  {
    id v12 = result;
    return 0;
  }
  else if (result)
  {
    *((unsigned char *)result + 8) = 0;
    *((void *)result + 2) = 17;
    *((void *)result + 3) = a5;
    *((void *)result + 4) = a6;
    *((void *)result + 5) = a6;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"SET Token. (length:%ld)", self->super.mLength);
}

- (void)reset
{
  self->mReadPointer = [(asn1Token *)self content];
}

- (id)nextToken
{
  mReadPointer = self->mReadPointer;
  v4 = [(asn1Token *)self content];
  if (mReadPointer >= &v4[[(asn1Token *)self length]]) {
    return 0;
  }
  id v5 = +[asn1Token readTokenFromBuffer:self->mReadPointer];
  self->mReadPointer = (const char *)[v5 content];
  self->mReadPointer += [v5 length];
  return v5;
}

@end