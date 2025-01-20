@interface EDContentFormat
+ (id)contentFormatWithFormatString:(id)a3;
+ (id)contentFormatWithFormatString:(id)a3 formatId:(unint64_t)a4;
+ (id)contentFormatWithNSString:(id)a3 formatId:(unint64_t)a4 builtIn:(BOOL)a5;
- (BOOL)builtIn;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContentFormat:(id)a3;
- (BOOL)referenced;
- (EDContentFormat)init;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formatString;
- (int64_t)key;
- (unint64_t)formatId;
- (unint64_t)hash;
- (void)setFormatId:(unint64_t)a3;
- (void)setReferenced:(BOOL)a3;
@end

@implementation EDContentFormat

+ (id)contentFormatWithNSString:(id)a3 formatId:(unint64_t)a4 builtIn:(BOOL)a5
{
  v8 = +[EDString edStringWithString:a3];
  v9 = [a1 contentFormatWithFormatString:v8 formatId:a4];

  v9[24] = a5;
  return v9;
}

+ (id)contentFormatWithFormatString:(id)a3 formatId:(unint64_t)a4
{
  v5 = [a1 contentFormatWithFormatString:a3];
  v5[2] = a4;
  return v5;
}

+ (id)contentFormatWithFormatString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

- (EDContentFormat)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDContentFormat;
  result = [(EDContentFormat *)&v3 init];
  if (result)
  {
    result->mFormatId = -1;
    *(_WORD *)&result->mBuiltIn = 0;
  }
  return result;
}

- (unint64_t)formatId
{
  return self->mFormatId;
}

- (int64_t)key
{
  return self->mFormatId;
}

- (void)setReferenced:(BOOL)a3
{
  self->mReferenced = a3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EDContentFormat *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDContentFormat *)self isEqualToContentFormat:v5];

  return v6;
}

- (BOOL)isEqualToContentFormat:(id)a3
{
  v4 = a3;
  v5 = v4;
  unint64_t mFormatId = self->mFormatId;
  if (mFormatId == -1 || ((uint64_t v7 = v4[2], v7 != -1) ? (v8 = mFormatId == v7) : (v8 = 1), v8))
  {
    mFormatString = self->mFormatString;
    if (mFormatString == (EDString *)v5[1]) {
      char v10 = 1;
    }
    else {
      char v10 = -[EDString isEqual:](mFormatString, "isEqual:");
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)formatString
{
  return self->mFormatString;
}

- (void)setFormatId:(unint64_t)a3
{
  self->unint64_t mFormatId = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    uint64_t v5 = [(EDString *)self->mFormatString copy];
    BOOL v6 = (void *)v4[1];
    v4[1] = v5;

    v4[2] = self->mFormatId;
    *((unsigned char *)v4 + 24) = self->mBuiltIn;
    *((unsigned char *)v4 + 25) = 0;
    uint64_t v7 = v4;
  }

  return v4;
}

- (unint64_t)hash
{
  unint64_t mFormatId = self->mFormatId;
  return [(EDString *)self->mFormatString hash] ^ mFormatId;
}

- (BOOL)builtIn
{
  return self->mBuiltIn;
}

- (BOOL)referenced
{
  return self->mReferenced;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDContentFormat;
  v2 = [(EDContentFormat *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
}

@end