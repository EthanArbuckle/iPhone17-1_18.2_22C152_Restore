@interface SSVRedeemCodeMetadata
- (BOOL)allowsAutoSubmission;
- (NSArray)items;
- (NSDictionary)redeemCodeDictionary;
- (NSString)code;
- (NSString)codeType;
- (NSString)inputCode;
- (SSVRedeemCodeMetadata)initWithRedeemCodeDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setInputCode:(id)a3;
@end

@implementation SSVRedeemCodeMetadata

- (SSVRedeemCodeMetadata)initWithRedeemCodeDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSVRedeemCodeMetadata;
  v5 = [(SSVRedeemCodeMetadata *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"codeInfo"];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = [v4 copy];
      dictionary = v5->_dictionary;
      v5->_dictionary = (NSDictionary *)v8;
    }
    else
    {
      dictionary = v5;
      v5 = 0;
    }
  }
  return v5;
}

- (NSString)code
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"codeInfo"];
  v3 = [v2 objectForKey:@"code"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (NSString)codeType
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"codeInfo"];
  v3 = [v2 objectForKey:@"codeType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (BOOL)allowsAutoSubmission
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"codeInfo"];
  v3 = [v2 objectForKey:@"allowAutoSubmission"];

  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NSArray)items
{
  v3 = [(NSDictionary *)self->_dictionary objectForKey:@"lockups"];
  char v4 = [(NSDictionary *)self->_dictionary objectForKey:@"codeInfo"];
  v5 = [v4 objectForKey:@"salable"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [[SSVRedeemCodeItem alloc] initWithRedeemCodeDictionary:v5];
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __30__SSVRedeemCodeMetadata_items__block_invoke;
      v10[3] = &unk_1E5BAE140;
      id v7 = v8;
      id v11 = v7;
      [v3 enumerateKeysAndObjectsUsingBlock:v10];
    }
    else
    {
      id v7 = 0;
    }
  }

  return (NSArray *)v7;
}

void __30__SSVRedeemCodeMetadata_items__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = [[SSLookupItem alloc] initWithLookupDictionary:v6];
    v5 = [[SSVRedeemCodeItem alloc] initWithLookupItem:v4];
    if (v5) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDictionary *)self->_dictionary copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_inputCode copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (NSString)inputCode
{
  return self->_inputCode;
}

- (void)setInputCode:(id)a3
{
}

- (NSDictionary)redeemCodeDictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputCode, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end