@interface WTBSCompatibleAttributedString
+ (BOOL)supportsSecureCoding;
+ (id)allowedClasses;
- (NSAttributedString)attributedString;
- (WTBSCompatibleAttributedString)initWithCoder:(id)a3;
- (WTBSCompatibleAttributedString)initWithXPCDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setAttributedString:(id)a3;
@end

@implementation WTBSCompatibleAttributedString

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WTBSCompatibleAttributedString *)self attributedString];
  v6 = [v5 string];
  [v4 encodeObject:v6 forKey:@"WTUICodingKeyString"];

  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [(WTBSCompatibleAttributedString *)self attributedString];
  v9 = [(WTBSCompatibleAttributedString *)self attributedString];
  uint64_t v10 = [v9 length];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__WTBSCompatibleAttributedString_encodeWithCoder___block_invoke;
  v12[3] = &unk_26558DB98;
  id v13 = v7;
  id v11 = v7;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v12);

  [v4 encodeObject:v11 forKey:@"WTUICodingAttributes"];
}

void __50__WTBSCompatibleAttributedString_encodeWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = (void *)MEMORY[0x263F08D40];
  id v8 = a2;
  objc_msgSend(v7, "valueWithRange:", a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v8 forKeyedSubscript:v9];
}

- (WTBSCompatibleAttributedString)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WTBSCompatibleAttributedString;
  v5 = [(WTBSCompatibleAttributedString *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WTUICodingKeyString"];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v6];
    id v8 = [(id)objc_opt_class() allowedClasses];
    id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"WTUICodingAttributes"];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__WTBSCompatibleAttributedString_initWithCoder___block_invoke;
    v14[3] = &unk_26558DBC0;
    uint64_t v10 = v7;
    v15 = v10;
    [v9 enumerateKeysAndObjectsUsingBlock:v14];
    attributedString = v5->_attributedString;
    v5->_attributedString = v10;
    v12 = v10;
  }
  return v5;
}

void __48__WTBSCompatibleAttributedString_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v5 = [a2 rangeValue];
  objc_msgSend(v4, "addAttributes:range:", v7, v5, v6);
}

+ (id)allowedClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3 = a3;
  [@"WTBSCodingKey" UTF8String];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
}

- (WTBSCompatibleAttributedString)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  [@"WTBSCodingKey" UTF8String];
  BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  uint64_t v5 = (WTBSCompatibleAttributedString *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAttributedString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end