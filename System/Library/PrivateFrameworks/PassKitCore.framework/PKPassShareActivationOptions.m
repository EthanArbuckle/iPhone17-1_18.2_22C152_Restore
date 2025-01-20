@interface PKPassShareActivationOptions
+ (BOOL)supportsSecureCoding;
+ (id)optionsFromRemoteOptions:(id)a3 localOptions:(id)a4;
- (BOOL)containsOptionOfType:(unint64_t)a3;
- (BOOL)containsPinCode;
- (BOOL)containsVehicleEnteredPin;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPassShareActivationOptions:(id)a3;
- (NSArray)identifiers;
- (NSArray)options;
- (NSString)activationCode;
- (NSString)localizationKeyPostfix;
- (PKPassShareActivationOption)primaryOption;
- (PKPassShareActivationOptions)init;
- (PKPassShareActivationOptions)initWithCarKeyIdentifiers:(id)a3;
- (PKPassShareActivationOptions)initWithCoder:(id)a3;
- (PKPassShareActivationOptions)initWithDefaultIdentifierForType:(unint64_t)a3;
- (PKPassShareActivationOptions)initWithOptions:(id)a3;
- (PKPassShareActivationOptions)optionsWithoutValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)optionOfType:(unint64_t)a3;
- (id)optionOfTypes:(id)a3;
- (id)optionsExcludingIdentifier:(id)a3 type:(unint64_t)a4;
- (id)optionsOfType:(unint64_t)a3;
- (id)optionsOfTypes:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassShareActivationOptions

- (PKPassShareActivationOptions)init
{
  return 0;
}

- (PKPassShareActivationOptions)initWithOptions:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPassShareActivationOptions;
    v6 = [(PKPassShareActivationOptions *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_options, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKPassShareActivationOptions)initWithCarKeyIdentifiers:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend(a3, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_36);
    self = [(PKPassShareActivationOptions *)self initWithOptions:v4];

    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

PKPassShareActivationOption *__58__PKPassShareActivationOptions_initWithCarKeyIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPassShareActivationOption alloc] initWithCarKeyIdentifier:v2];

  return v3;
}

- (PKPassShareActivationOptions)initWithDefaultIdentifierForType:(unint64_t)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v4 = [[PKPassShareActivationOption alloc] initWithDefaultIdentifierForType:a3];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6 = [(PKPassShareActivationOptions *)self initWithOptions:v5];

  return v6;
}

+ (id)optionsFromRemoteOptions:(id)a3 localOptions:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v8 = 0;
    goto LABEL_13;
  }
  if (v5 && !v6)
  {
    unint64_t v6 = v5;
LABEL_8:
    v8 = (PKPassShareActivationOptions *)[(id)v6 copy];
    goto LABEL_13;
  }
  if (!v5 && v6) {
    goto LABEL_8;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  objc_super v10 = [v7 identifiers];
  int v11 = [v10 containsObject:@"sharingPasswordActivation"];

  v12 = [(id)v5 identifiers];
  char v13 = [v12 containsObject:@"sharingPasswordActivation"];

  v14 = [(id)v5 options];
  [v9 addObjectsFromArray:v14];

  if (v11 && (v13 & 1) == 0)
  {
    v15 = [v7 optionsExcludingIdentifier:@"sharingPasswordActivation" type:2];
    [v9 addObjectsFromArray:v15];
  }
  v16 = [PKPassShareActivationOptions alloc];
  v17 = [v9 allObjects];
  v8 = [(PKPassShareActivationOptions *)v16 initWithOptions:v17];

LABEL_13:
  return v8;
}

- (NSString)activationCode
{
  id v2 = [(NSArray *)self->_options pk_firstObjectPassingTest:&__block_literal_global_167_0];
  v3 = [v2 value];

  return (NSString *)v3;
}

uint64_t __46__PKPassShareActivationOptions_activationCode__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 type];
  return (v2 < 4) & (6u >> (v2 & 0xF));
}

- (PKPassShareActivationOption)primaryOption
{
  v3 = [(PKPassShareActivationOptions *)self optionOfTypes:&unk_1EE22ACB8];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NSArray *)self->_options firstObject];
  }
  unint64_t v6 = v5;

  return (PKPassShareActivationOption *)v6;
}

- (NSArray)identifiers
{
  return (NSArray *)[(NSArray *)self->_options pk_arrayByApplyingBlock:&__block_literal_global_170];
}

uint64_t __43__PKPassShareActivationOptions_identifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)optionsExcludingIdentifier:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  options = self->_options;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PKPassShareActivationOptions_optionsExcludingIdentifier_type___block_invoke;
  v13[3] = &unk_1E56DFA90;
  id v14 = v6;
  unint64_t v15 = a4;
  id v8 = v6;
  id v9 = [(NSArray *)options pk_objectsPassingTest:v13];
  objc_super v10 = v9;
  if (!v9) {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v11 = v9;

  return v11;
}

BOOL __64__PKPassShareActivationOptions_optionsExcludingIdentifier_type___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 identifier];
  id v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    id v8 = v7;
    if (!v6 || !v7)
    {

LABEL_9:
      BOOL v10 = [v3 type] != *(void *)(a1 + 40);
      goto LABEL_10;
    }
    char v9 = [v6 isEqualToString:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_9;
    }
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)containsVehicleEnteredPin
{
  return [(NSArray *)self->_options pk_containsObjectPassingTest:&__block_literal_global_173];
}

BOOL __57__PKPassShareActivationOptions_containsVehicleEnteredPin__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 identifier];
  v4 = v3;
  BOOL v5 = v3
    && [v3 isEqual:@"sharingPasswordActivation"]
    && [v2 type] == 2;

  return v5;
}

- (BOOL)containsPinCode
{
  return [(PKPassShareActivationOptions *)self containsOptionOfType:1];
}

- (BOOL)containsOptionOfType:(unint64_t)a3
{
  options = self->_options;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PKPassShareActivationOptions_containsOptionOfType___block_invoke;
  v5[3] = &__block_descriptor_40_e37_B16__0__PKPassShareActivationOption_8l;
  v5[4] = a3;
  return [(NSArray *)options pk_containsObjectPassingTest:v5];
}

BOOL __53__PKPassShareActivationOptions_containsOptionOfType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (id)optionOfType:(unint64_t)a3
{
  options = self->_options;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PKPassShareActivationOptions_optionOfType___block_invoke;
  v6[3] = &__block_descriptor_40_e37_B16__0__PKPassShareActivationOption_8l;
  v6[4] = a3;
  v4 = [(NSArray *)options pk_firstObjectPassingTest:v6];
  return v4;
}

BOOL __45__PKPassShareActivationOptions_optionOfType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (id)optionOfTypes:(id)a3
{
  id v4 = a3;
  options = self->_options;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__PKPassShareActivationOptions_optionOfTypes___block_invoke;
  v9[3] = &unk_1E56DFAD8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSArray *)options pk_firstObjectPassingTest:v9];

  return v7;
}

uint64_t __46__PKPassShareActivationOptions_optionOfTypes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)optionsOfTypes:(id)a3
{
  id v4 = a3;
  options = self->_options;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__PKPassShareActivationOptions_optionsOfTypes___block_invoke;
  v11[3] = &unk_1E56DFB00;
  id v12 = v4;
  id v6 = v4;
  id v7 = [(NSArray *)options pk_objectsPassingTest:v11];
  if ([v7 count]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  return v9;
}

uint64_t __47__PKPassShareActivationOptions_optionsOfTypes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)optionsOfType:(unint64_t)a3
{
  options = self->_options;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __46__PKPassShareActivationOptions_optionsOfType___block_invoke;
  v8[3] = &__block_descriptor_40_e44_B32__0__PKPassShareActivationOption_8Q16_B24l;
  v8[4] = a3;
  uint64_t v4 = [(NSArray *)options pk_objectsPassingTest:v8];
  if ([v4 count]) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;

  return v6;
}

BOOL __46__PKPassShareActivationOptions_optionsOfType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (PKPassShareActivationOptions)optionsWithoutValues
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)[(PKPassShareActivationOptions *)self copy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v2[1];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "value", (void)v12);
        id v10 = v9;
        if (v9) {
          objc_msgSend(v8, "setValueLength:", objc_msgSend(v9, "length"));
        }
        [v8 setValue:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return (PKPassShareActivationOptions *)v2;
}

- (NSString)localizationKeyPostfix
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKPassShareActivationOptions_localizationKeyPostfix__block_invoke;
  aBlock[3] = &unk_1E56DFAD8;
  id v4 = v3;
  id v23 = v4;
  uint64_t v5 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v6 = [(PKPassShareActivationOptions *)self optionOfType:1];
  char v7 = v5[2](v5, v6);

  if ((v7 & 1) == 0)
  {
    id v8 = [(PKPassShareActivationOptions *)self optionOfType:2];
    v5[2](v5, v8);

    id v9 = [(PKPassShareActivationOptions *)self optionsOfType:3];
    id v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_182];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v5[2](v5, *(void **)(*((void *)&v18 + 1) + 8 * i));
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v13);
    }
  }
  v16 = objc_msgSend(v4, "copy", (void)v18);

  return (NSString *)v16;
}

BOOL __54__PKPassShareActivationOptions_localizationKeyPostfix__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if ([*(id *)(a1 + 32) length]) {
      [*(id *)(a1 + 32) appendString:@"_"];
    }
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 localizationKeyPostfix];
    [v4 appendString:v5];
  }
  return v3 != 0;
}

uint64_t __54__PKPassShareActivationOptions_localizationKeyPostfix__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 identifier];
  uint64_t v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassShareActivationOptions)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"options"];

  id v9 = [(PKPassShareActivationOptions *)self initWithOptions:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@; ", v5];

  [v6 appendFormat:@"options: '%@'; ", self->_options];
  [v6 appendFormat:@">"];
  uint64_t v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_options) {
    objc_msgSend(v3, "addObject:");
  }
  unint64_t v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassShareActivationOptions *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassShareActivationOptions *)self isEqualToPassShareActivationOptions:v5];

  return v6;
}

- (BOOL)isEqualToPassShareActivationOptions:(id)a3
{
  if (!a3) {
    return 0;
  }
  options = self->_options;
  id v4 = (NSArray *)*((void *)a3 + 1);
  if (options) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return options == v4;
  }
  else {
    return -[NSArray isEqual:](options, "isEqual:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(NSArray *)self->_options pk_arrayByApplyingBlock:&__block_literal_global_194];
  id v4 = [[PKPassShareActivationOptions alloc] initWithOptions:v3];

  return v4;
}

id __45__PKPassShareActivationOptions_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copy];
  return v2;
}

- (NSArray)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end