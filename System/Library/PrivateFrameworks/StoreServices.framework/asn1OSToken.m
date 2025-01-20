@interface asn1OSToken
- (asn1Token)value;
- (id)_initWithID:(unint64_t)a3 class:(unsigned __int8)a4 length:(unint64_t)a5 content:(const char *)a6 opaque:(BOOL)a7;
- (id)stringValue;
- (void)dealloc;
@end

@implementation asn1OSToken

- (id)_initWithID:(unint64_t)a3 class:(unsigned __int8)a4 length:(unint64_t)a5 content:(const char *)a6 opaque:(BOOL)a7
{
  BOOL v7 = a7;
  int v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)asn1OSToken;
  v12 = [(asn1OSToken *)&v16 init];
  v13 = v12;
  if (a3 != 4 || v10)
  {
    v14 = v12;
    return 0;
  }
  else if (v12)
  {
    v12->super.mClass = 0;
    v12->super.mIdentifier = 4;
    v12->super.mLength = a5;
    v12->super.mContent = a6;
    if (v7) {
      v12->mValue = 0;
    }
    else {
      v12->mValue = (asn1Token *)+[asn1Token readTokenFromBuffer:a6];
    }
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)asn1OSToken;
  [(asn1OSToken *)&v3 dealloc];
}

- (id)stringValue
{
  uint64_t v3 = 4 * ([(asn1Token *)self->mValue identifier] == 12);
  if ([(asn1Token *)self->mValue identifier] == 22) {
    uint64_t v3 = 1;
  }
  if (!v3) {
    return 0;
  }
  v4 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", -[asn1Token content](self->mValue, "content"), -[asn1Token length](self->mValue, "length"), v3);
  return v4;
}

- (asn1Token)value
{
  return self->mValue;
}

@end