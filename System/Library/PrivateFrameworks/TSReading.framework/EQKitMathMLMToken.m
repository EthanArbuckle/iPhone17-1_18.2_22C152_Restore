@interface EQKitMathMLMToken
- (BOOL)isNumber;
- (EQKitMathMLMToken)init;
- (EQKitMathMLMToken)initWithContent:(id)a3;
- (EQKitMathMLMToken)initWithString:(id)a3 environment:(id)a4;
- (NSString)description;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)schemataTokenString;
- (int)scriptContext;
- (int)scriptVariant;
- (unsigned)schemataUnicharOrNul;
- (void)dealloc;
@end

@implementation EQKitMathMLMToken

- (EQKitMathMLMToken)init
{
  return [(EQKitMathMLMToken *)self initWithString:0 environment:0];
}

- (EQKitMathMLMToken)initWithString:(id)a3 environment:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EQKitMathMLMToken;
  v5 = [(EQKitMathMLMToken *)&v9 init];
  if (v5)
  {
    unsigned int v6 = EQKitUtilUTF32CharFromString(a3);
    char v7 = *(unsigned char *)&v5->mFlags & 0xFC;
    if (v6)
    {
      *(unsigned char *)&v5->mFlags = v7;
      v5->mContent.mChar = v6;
    }
    else
    {
      *(unsigned char *)&v5->mFlags = v7 | 1;
      v5->mContent.mString = (NSString *)a3;
    }
  }
  return v5;
}

- (EQKitMathMLMToken)initWithContent:(id)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)EQKitMathMLMToken;
    v4 = [(EQKitMathMLMToken *)&v7 init];
    v5 = v4;
    if (v4)
    {
      *(unsigned char *)&v4->mFlags = *(unsigned char *)&v4->mFlags & 0xFC | 2;
      v4->mContent.mString = (NSString *)a3;
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  if (EQKitXMLIsTextContentOnly((uint64_t)a3))
  {
    EQKitXMLTextContentAsString(a3, 1, &__p);
    id v7 = [NSString alloc];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    objc_super v9 = (void *)[v7 initWithUTF8String:p_p];
    v10 = -[EQKitMathMLMToken initWithString:environment:](self, "initWithString:environment:", v9, [a4 environment]);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    return v10;
  }
  else
  {
    uint64_t v12 = [a4 parseChildrenAsTokenContentFromXMLNode:a3];
    return [(EQKitMathMLMToken *)self initWithContent:v12];
  }
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMToken mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMToken mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMOver mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMToken mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  if ((*(unsigned char *)&self->mFlags & 3u) - 1 <= 1) {

  }
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMToken;
  [(EQKitMathMLMToken *)&v3 dealloc];
}

- (int)scriptVariant
{
  return 0;
}

- (int)scriptContext
{
  return 0;
}

- (unsigned)schemataUnicharOrNul
{
  if ((*(unsigned char *)&self->mFlags & 3) != 0) {
    return 0;
  }
  else {
    return self->mContent.mChar;
  }
}

- (NSString)description
{
  int v3 = *(unsigned char *)&self->mFlags & 3;
  if (v3 == 2)
  {
    objc_super v9 = NSString;
    v10 = (objc_class *)objc_opt_class();
    return (NSString *)[v9 stringWithFormat:@"<%@ %p content=%@>", NSStringFromClass(v10), self, self->mContent.mString];
  }
  else if (v3 == 1)
  {
    v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    return (NSString *)[v11 stringWithFormat:@"<%@ %p string=%@>", NSStringFromClass(v12), self, self->mContent.mString];
  }
  else if ((*(unsigned char *)&self->mFlags & 3) != 0)
  {
    return 0;
  }
  else
  {
    v4 = (void *)EQKitUtilNewStringFromUTF32Char(self->mContent.mChar);
    v5 = NSString;
    unsigned int v6 = (objc_class *)objc_opt_class();
    id v7 = (NSString *)[v5 stringWithFormat:@"<%@ %p char='%@'>", NSStringFromClass(v6), self, v4];

    return v7;
  }
}

- (BOOL)isNumber
{
  return 0;
}

- (id)schemataTokenString
{
  if ((*(unsigned char *)&self->mFlags & 3) == 1) {
    return self->mContent.mString;
  }
  if ((*(unsigned char *)&self->mFlags & 3) != 0) {
    return 0;
  }
  v2 = (void *)EQKitUtilNewStringFromUTF32Char(self->mContent.mChar);

  return v2;
}

@end