@interface asn1ReceiptToken
+ (id)readFromBuffer:(const char *)a3;
- (NSString)stringValue;
- (asn1Token)contentToken;
- (id)_initWithType:(unint64_t)a3 typeVersion:(unint64_t)a4 contentToken:(id)a5;
- (id)description;
- (unint64_t)integerValue;
- (unint64_t)type;
- (unint64_t)typeVersion;
- (void)dealloc;
@end

@implementation asn1ReceiptToken

- (id)_initWithType:(unint64_t)a3 typeVersion:(unint64_t)a4 contentToken:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)asn1ReceiptToken;
  v8 = [(asn1ReceiptToken *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->mType = a3;
    v8->mTypeVersion = a4;
    v8->mContentToken = (asn1Token *)a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)asn1ReceiptToken;
  [(asn1ReceiptToken *)&v3 dealloc];
}

+ (id)readFromBuffer:(const char *)a3
{
  id v3 = +[asn1Token readTokenFromBuffer:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v4 = +[asn1Token readTokenFromBuffer:](asn1Token, "readTokenFromBuffer:", [v3 content] + objc_msgSend(v3, "length"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [v4 content];
  uint64_t v6 = [v4 length];
  unint64_t v7 = [v3 value];
  if (v7 > 0x18) {
    return 0;
  }
  uint64_t v8 = v5 + v6;
  if (((1 << v7) & 0x1E1FF1F) != 0)
  {
    id v9 = +[asn1Token readTokenFromBuffer:v8];
    if ([v9 identifier] != 4 || objc_msgSend(v9, "tokenClass") || !v9) {
      return 0;
    }
  }
  else
  {
    if (((1 << v7) & 0xE0) == 0) {
      return 0;
    }
    id v9 = +[asn1Token readOpaqueTokenFromBuffer:v8];
    if (!v9) {
      return 0;
    }
  }
  id v10 = -[asn1ReceiptToken _initWithType:typeVersion:contentToken:]([asn1ReceiptToken alloc], "_initWithType:typeVersion:contentToken:", [v3 value], objc_msgSend(v4, "value"), v9);
  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Type:%ld Version:%ld Data:%@", self->mType, self->mTypeVersion, objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", -[asn1Token content](self->mContentToken, "content"), -[asn1Token length](self->mContentToken, "length"), 0)];
}

- (NSString)stringValue
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  mContentToken = self->mContentToken;
  return (NSString *)[(asn1Token *)mContentToken stringValue];
}

- (unint64_t)integerValue
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0xFFFFLL;
  }
  id v3 = (void *)[(asn1Token *)self->mContentToken value];
  if ([v3 tokenClass] || objc_msgSend(v3, "identifier") != 2) {
    return 0xFFFFLL;
  }
  return [v3 value];
}

- (unint64_t)type
{
  return self->mType;
}

- (unint64_t)typeVersion
{
  return self->mTypeVersion;
}

- (asn1Token)contentToken
{
  return self->mContentToken;
}

@end