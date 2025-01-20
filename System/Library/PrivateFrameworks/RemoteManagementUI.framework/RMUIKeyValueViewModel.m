@interface RMUIKeyValueViewModel
+ (BOOL)supportsSecureCoding;
- (NSArray)detailViewModels;
- (NSString)declarationIdentifier;
- (NSString)declarationServerToken;
- (NSString)declarationType;
- (NSString)title;
- (RMModelDeclarationBase)declaration;
- (RMUIKeyValueViewModel)init;
- (RMUIKeyValueViewModel)initWithCoder:(id)a3;
- (signed)symbol;
- (void)clearModel;
- (void)encodeWithCoder:(id)a3;
- (void)setDeclaration:(id)a3;
- (void)setDeclarationIdentifier:(id)a3;
- (void)setDeclarationServerToken:(id)a3;
- (void)setDeclarationType:(id)a3;
- (void)setDetailViewModels:(id)a3;
- (void)setSymbol:(signed __int16)a3;
- (void)setTitle:(id)a3;
@end

@implementation RMUIKeyValueViewModel

- (RMUIKeyValueViewModel)init
{
  v6.receiver = self;
  v6.super_class = (Class)RMUIKeyValueViewModel;
  v2 = [(RMUIKeyValueViewModel *)&v6 init];
  v3 = v2;
  if (v2)
  {
    detailViewModels = v2->_detailViewModels;
    v2->_detailViewModels = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (void)clearModel
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(RMUIKeyValueViewModel *)self setTitle:0];
  [(RMUIKeyValueViewModel *)self setSymbol:0];
  [(RMUIKeyValueViewModel *)self setDeclaration:0];
  [(RMUIKeyValueViewModel *)self setDeclarationIdentifier:0];
  [(RMUIKeyValueViewModel *)self setDeclarationServerToken:0];
  [(RMUIKeyValueViewModel *)self setDeclarationType:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(RMUIKeyValueViewModel *)self detailViewModels];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) clearModel];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithShort:", -[RMUIKeyValueViewModel symbol](self, "symbol"));
  [v5 encodeObject:v6 forKey:@"symbol"];

  uint64_t v7 = [(RMUIKeyValueViewModel *)self title];
  [v5 encodeObject:v7 forKey:@"title"];

  long long v8 = [(RMUIKeyValueViewModel *)self declaration];
  [v5 encodeObject:v8 forKey:@"declaration"];

  long long v9 = [(RMUIKeyValueViewModel *)self declarationIdentifier];
  [v5 encodeObject:v9 forKey:@"declarationIdentifier"];

  long long v10 = [(RMUIKeyValueViewModel *)self declarationServerToken];
  [v5 encodeObject:v10 forKey:@"declarationServerToken"];

  long long v11 = [(RMUIKeyValueViewModel *)self declarationType];
  [v5 encodeObject:v11 forKey:@"declarationType"];

  id v12 = [(RMUIKeyValueViewModel *)self detailViewModels];
  [v5 encodeObject:v12 forKey:@"detailViewModels"];
}

- (RMUIKeyValueViewModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RMUIKeyValueViewModel;
  id v5 = [(RMUIKeyValueViewModel *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbol"];
    v5->_symbol = [v6 integerValue];

    uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    long long v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"declaration"];
    declaration = v5->_declaration;
    v5->_declaration = (RMModelDeclarationBase *)v11;

    uint64_t v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"declarationIdentifier"];
    declarationIdentifier = v5->_declarationIdentifier;
    v5->_declarationIdentifier = (NSString *)v14;

    v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"declarationServerToken"];
    declarationServerToken = v5->_declarationServerToken;
    v5->_declarationServerToken = (NSString *)v17;

    v19 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"declarationType"];
    declarationType = v5->_declarationType;
    v5->_declarationType = (NSString *)v20;

    v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"detailViewModels"];
    detailViewModels = v5->_detailViewModels;
    v5->_detailViewModels = (NSArray *)v25;
  }
  return v5;
}

- (signed)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(signed __int16)a3
{
  self->_symbol = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (RMModelDeclarationBase)declaration
{
  return (RMModelDeclarationBase *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeclaration:(id)a3
{
}

- (NSString)declarationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeclarationIdentifier:(id)a3
{
}

- (NSString)declarationServerToken
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeclarationServerToken:(id)a3
{
}

- (NSString)declarationType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeclarationType:(id)a3
{
}

- (NSArray)detailViewModels
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDetailViewModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailViewModels, 0);
  objc_storeStrong((id *)&self->_declarationType, 0);
  objc_storeStrong((id *)&self->_declarationServerToken, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
  objc_storeStrong((id *)&self->_declaration, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end