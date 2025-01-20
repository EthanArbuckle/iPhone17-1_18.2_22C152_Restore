@interface Multipart
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMultipart:(id)a3;
- (id)copyWithIndex:(unsigned __int8)a3;
- (unint64_t)hash;
@end

@implementation Multipart

- (id)copyWithIndex:(unsigned __int8)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  *((void *)result + 1) = self->identifier;
  *((unsigned char *)result + 16) = a3;
  *((unsigned char *)result + 17) = self->partCount;
  return result;
}

- (unint64_t)hash
{
  return self->identifier ^ self->partIndex ^ ((unint64_t)self->partCount << 8);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(Multipart *)self isEqualToMultipart:v4];

  return v5;
}

- (BOOL)isEqualToMultipart:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4[1] == self->identifier
    && *((unsigned __int8 *)v4 + 17) == self->partCount
    && *((unsigned __int8 *)v4 + 16) == self->partIndex;

  return v5;
}

@end