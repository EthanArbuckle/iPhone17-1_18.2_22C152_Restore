@interface TPSFullTipContent
+ (BOOL)supportsSecureCoding;
+ (id)na_identity;
- (NSArray)footnoteContent;
- (TPSFullTipContent)initWithCoder:(id)a3;
- (TPSFullTipContent)initWithDictionary:(id)a3 metadata:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFootnoteContent:(id)a3;
@end

@implementation TPSFullTipContent

- (TPSFullTipContent)initWithDictionary:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSFullTipContent;
  v7 = [(TPSActionableContent *)&v12 initWithDictionary:v6 metadata:a4];
  if (v7)
  {
    v8 = [v6 TPSSafeDictionaryForKey:@"footnote"];
    uint64_t v9 = [v8 TPSSafeArrayForKey:@"content"];
    footnoteContent = v7->_footnoteContent;
    v7->_footnoteContent = (NSArray *)v9;
  }
  return v7;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSFullTipContent;
  id v4 = a3;
  [(TPSActionableContent *)&v6 encodeWithCoder:v4];
  v5 = [(TPSFullTipContent *)self footnoteContent];
  [v4 encodeObject:v5 forKey:@"footnote"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSFullTipContent;
  id v4 = [(TPSActionableContent *)&v7 copyWithZone:a3];
  v5 = [(TPSFullTipContent *)self footnoteContent];
  [v4 setFootnoteContent:v5];

  return v4;
}

- (NSArray)footnoteContent
{
  return self->_footnoteContent;
}

- (void)setFootnoteContent:(id)a3
{
}

- (TPSFullTipContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPSFullTipContent;
  v5 = [(TPSActionableContent *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = +[TPSConstellationContentUtilities contentClasses];
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"footnote"];
    footnoteContent = v5->_footnoteContent;
    v5->_footnoteContent = (NSArray *)v7;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSFullTipContent;
  id v4 = [(TPSContent *)&v9 description];
  v5 = (void *)[v3 initWithString:v4];

  objc_super v6 = [(TPSFullTipContent *)self footnoteContent];

  if (v6)
  {
    uint64_t v7 = [(TPSFullTipContent *)self footnoteContent];
    [v5 appendFormat:@" %@ = %@\n", @"footnote", v7];
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSFullTipContent;
  id v4 = [(TPSActionableContent *)&v9 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  [v5 appendString:@"\n"];
  objc_super v6 = [(TPSFullTipContent *)self footnoteContent];

  if (v6)
  {
    uint64_t v7 = [(TPSFullTipContent *)self footnoteContent];
    [v5 appendFormat:@"  %@ = %@\n", @"footnote", v7];
  }
  return v5;
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__TPSFullTipContent_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __32__TPSFullTipContent_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __32__TPSFullTipContent_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__TPSFullTipContent_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (TPSFullTipContentFootnoteKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&TPSFullTipContentFootnoteKey_block_invoke_na_once_token_0, block);
  }
  v1 = (void *)TPSFullTipContentFootnoteKey_block_invoke_na_once_object_0;
  return v1;
}

void __32__TPSFullTipContent_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__TPSFullTipContent_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __32__TPSFullTipContent_na_identity__block_invoke_3((uint64_t)v3);
  v2 = (void *)TPSFullTipContentFootnoteKey_block_invoke_na_once_object_0;
  TPSFullTipContentFootnoteKey_block_invoke_na_once_object_0 = v1;
}

id __32__TPSFullTipContent_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F7A0E0];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___TPSFullTipContent;
  v2 = objc_msgSendSuper2(&v7, sel_na_identity);
  id v3 = [v1 builderWithIdentity:v2];

  id v4 = (id)[v3 appendCharacteristic:&__block_literal_global_24];
  v5 = [v3 build];

  return v5;
}

uint64_t __32__TPSFullTipContent_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 footnoteContent];
}

@end