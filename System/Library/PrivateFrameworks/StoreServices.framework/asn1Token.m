@interface asn1Token
+ (id)readOpaqueTokenFromBuffer:(const char *)a3;
+ (id)readTokenFromBuffer:(const char *)a3;
+ (id)readTokenFromBuffer:(const char *)a3 opaque:(BOOL)a4;
- (const)content;
- (id)_initWithID:(unint64_t)a3 class:(unsigned __int8)a4 length:(unint64_t)a5 content:(const char *)a6 opaque:(BOOL)a7;
- (id)description;
- (unint64_t)identifier;
- (unint64_t)length;
- (unsigned)tokenClass;
@end

@implementation asn1Token

- (id)_initWithID:(unint64_t)a3 class:(unsigned __int8)a4 length:(unint64_t)a5 content:(const char *)a6 opaque:(BOOL)a7
{
  v12.receiver = self;
  v12.super_class = (Class)asn1Token;
  id result = [(asn1Token *)&v12 init];
  if (result)
  {
    *((unsigned char *)result + 8) = a4;
    *((void *)result + 2) = a3;
    *((void *)result + 3) = a5;
    *((void *)result + 4) = a6;
  }
  return result;
}

+ (id)readTokenFromBuffer:(const char *)a3 opaque:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v6 = *(unsigned __int8 *)a3;
  uint64_t v7 = v6 & 0x1F;
  if ((v6 & 0x1F) == 0x1F)
  {
    NSLog(&cfstr_MultibyteAsn1I.isa, a2);
    uint64_t v8 = 0;
    uint64_t v7 = 0xFFFFLL;
  }
  else
  {
    uint64_t v8 = 1;
  }
  v9 = &a3[v8];
  uint64_t v10 = *(unsigned __int8 *)v9;
  if (*v9 < 0)
  {
    uint64_t v12 = v10 & 0x7F;
    if ((v10 & 0x7F) != 0)
    {
      uint64_t v13 = 0;
      uint64_t v10 = 0;
      do
      {
        uint64_t v14 = v10 << 8;
        if (!v13) {
          uint64_t v14 = v10;
        }
        uint64_t v10 = v14 | v9[++v13];
      }
      while (v12 != v13);
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = (v12 + 1);
  }
  else
  {
    uint64_t v11 = 1;
  }
  if (v6 > 0x3F)
  {
LABEL_22:
    v15 = &off_1E5BA6C40;
    goto LABEL_23;
  }
  if ((int)v7 > 15)
  {
    if (v7 != 17)
    {
      if (v7 == 16)
      {
        v15 = off_1E5BA6C30;
        uint64_t v7 = 16;
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    v15 = off_1E5BA6C38;
  }
  else
  {
    if (v7 != 2)
    {
      if (v7 == 4)
      {
        v15 = off_1E5BA6C28;
        uint64_t v7 = 4;
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    v15 = off_1E5BA6C20;
    uint64_t v7 = 2;
  }
LABEL_23:
  v16 = (void *)[objc_alloc(*v15) _initWithID:v7 class:v6 >> 6 length:v10 content:&v9[v11] opaque:v4];
  return v16;
}

+ (id)readTokenFromBuffer:(const char *)a3
{
  return +[asn1Token readTokenFromBuffer:a3 opaque:0];
}

+ (id)readOpaqueTokenFromBuffer:(const char *)a3
{
  return +[asn1Token readTokenFromBuffer:a3 opaque:1];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Token of class:%d ID:%ld length:%ld data:%@", self->mClass, self->mIdentifier, self->mLength, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", self->mContent, self->mLength), "description")];
}

- (unsigned)tokenClass
{
  return self->mClass;
}

- (unint64_t)identifier
{
  return self->mIdentifier;
}

- (unint64_t)length
{
  return self->mLength;
}

- (const)content
{
  return self->mContent;
}

@end