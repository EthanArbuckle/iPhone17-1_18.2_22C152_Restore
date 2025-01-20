@interface SSTonePurchase
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldMakeDefaultRingtone;
- (BOOL)shouldMakeDefaultTextTone;
- (NSArray)allowedToneStyles;
- (NSNumber)assigneeIdentifier;
- (NSString)assigneeContactIdentifier;
- (NSString)assigneeToneStyle;
- (SSTonePurchase)initWithCoder:(id)a3;
- (SSTonePurchase)initWithItem:(id)a3 offer:(id)a4;
- (SSTonePurchase)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (void)_addEntriesToDatabaseEncoding:(id)a3;
- (void)_setValuesUsingDatabaseEncoding:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedToneStyles:(id)a3;
- (void)setAssigneeContactIdentifier:(id)a3;
- (void)setAssigneeIdentifier:(id)a3;
- (void)setAssigneeToneStyle:(id)a3;
- (void)setShouldMakeDefaultRingtone:(BOOL)a3;
- (void)setShouldMakeDefaultTextTone:(BOOL)a3;
@end

@implementation SSTonePurchase

- (SSTonePurchase)initWithItem:(id)a3 offer:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SSTonePurchase;
  v7 = [(SSPurchase *)&v12 initWithItem:a3 offer:v6];
  if (v7)
  {
    v8 = [v6 allowedToneStyles];
    uint64_t v9 = [v8 copy];
    allowedToneStyles = v7->_allowedToneStyles;
    v7->_allowedToneStyles = (NSArray *)v9;
  }
  return v7;
}

- (NSArray)allowedToneStyles
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SSTonePurchase_allowedToneStyles__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __35__SSTonePurchase_allowedToneStyles__block_invoke(uint64_t a1)
{
}

- (NSNumber)assigneeIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SSTonePurchase_assigneeIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __36__SSTonePurchase_assigneeIdentifier__block_invoke(uint64_t a1)
{
}

- (NSString)assigneeContactIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SSTonePurchase_assigneeContactIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __43__SSTonePurchase_assigneeContactIdentifier__block_invoke(uint64_t a1)
{
}

- (NSString)assigneeToneStyle
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SSTonePurchase_assigneeToneStyle__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __35__SSTonePurchase_assigneeToneStyle__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 288) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setAllowedToneStyles:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SSTonePurchase_setAllowedToneStyles___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __39__SSTonePurchase_setAllowedToneStyles___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 264) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 264);
    *(void *)(v5 + 264) = v4;
  }
}

- (void)setAssigneeIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SSTonePurchase_setAssigneeIdentifier___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __40__SSTonePurchase_setAssigneeIdentifier___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 272);
  if (*v2 != v1) {
    objc_storeStrong(v2, v1);
  }
}

- (void)setAssigneeContactIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SSTonePurchase_setAssigneeContactIdentifier___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __47__SSTonePurchase_setAssigneeContactIdentifier___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 280);
  if (*v2 != v1) {
    objc_storeStrong(v2, v1);
  }
}

- (void)setAssigneeToneStyle:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SSTonePurchase_setAssigneeToneStyle___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __39__SSTonePurchase_setAssigneeToneStyle___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 288);
  if (*v2 != v1) {
    objc_storeStrong(v2, v1);
  }
}

- (void)setShouldMakeDefaultRingtone:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SSTonePurchase_setShouldMakeDefaultRingtone___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __47__SSTonePurchase_setShouldMakeDefaultRingtone___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 296) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setShouldMakeDefaultTextTone:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SSTonePurchase_setShouldMakeDefaultTextTone___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __47__SSTonePurchase_setShouldMakeDefaultTextTone___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 297) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)shouldMakeDefaultRingtone
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SSTonePurchase_shouldMakeDefaultRingtone__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SSTonePurchase_shouldMakeDefaultRingtone__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 296);
  return result;
}

- (BOOL)shouldMakeDefaultTextTone
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SSTonePurchase_shouldMakeDefaultTextTone__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SSTonePurchase_shouldMakeDefaultTextTone__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 297);
  return result;
}

- (void)_addEntriesToDatabaseEncoding:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  allowedToneStyles = self->_allowedToneStyles;
  if (allowedToneStyles) {
    [v4 setObject:allowedToneStyles forKey:@"00"];
  }
  assigneeIdentifier = self->_assigneeIdentifier;
  if (assigneeIdentifier) {
    [v5 setObject:assigneeIdentifier forKey:@"01"];
  }
  assigneeContactIdentifier = self->_assigneeContactIdentifier;
  if (assigneeContactIdentifier) {
    [v5 setObject:assigneeContactIdentifier forKey:@"06"];
  }
  assigneeToneStyle = self->_assigneeToneStyle;
  if (assigneeToneStyle) {
    [v5 setObject:assigneeToneStyle forKey:@"02"];
  }
  [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"03"];
  v10 = [NSNumber numberWithBool:self->_shouldMakeDefaultRingtone];
  [v5 setObject:v10 forKey:@"04"];

  id v11 = [NSNumber numberWithBool:self->_shouldMakeDefaultTextTone];
  [v5 setObject:v11 forKey:@"05"];

  v12.receiver = self;
  v12.super_class = (Class)SSTonePurchase;
  [(SSPurchase *)&v12 _addEntriesToDatabaseEncoding:v5];
}

- (void)_setValuesUsingDatabaseEncoding:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKey:@"00"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = (NSArray *)[v5 copy];
    allowedToneStyles = self->_allowedToneStyles;
    self->_allowedToneStyles = v6;
  }
  uint64_t v8 = [v4 objectForKey:@"01"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v9 = (NSNumber *)[v8 copy];
    assigneeIdentifier = self->_assigneeIdentifier;
    self->_assigneeIdentifier = v9;
  }
  id v11 = [v4 objectForKey:@"06"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v12 = (NSString *)[v11 copy];
    assigneeContactIdentifier = self->_assigneeContactIdentifier;
    self->_assigneeContactIdentifier = v12;
  }
  v14 = [v4 objectForKey:@"02"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = (NSString *)[v14 copy];
    assigneeToneStyle = self->_assigneeToneStyle;
    self->_assigneeToneStyle = v15;
  }
  v17 = [v4 objectForKey:@"04"];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v17 BOOLValue]) {
    self->_shouldMakeDefaultRingtone = 1;
  }
  v18 = [v4 objectForKey:@"05"];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v18 BOOLValue]) {
    self->_shouldMakeDefaultTextTone = 1;
  }
  v19.receiver = self;
  v19.super_class = (Class)SSTonePurchase;
  [(SSPurchase *)&v19 _setValuesUsingDatabaseEncoding:v4];
}

- (SSTonePurchase)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    objc_super v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SSPurchase.m" lineNumber:1496 description:@"Only keyed coding is supported"];
  }
  v20.receiver = self;
  v20.super_class = (Class)SSTonePurchase;
  uint64_t v6 = [(SSPurchase *)&v20 initWithCoder:v5];
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    char v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v5 decodeObjectOfClasses:v9 forKey:@"tonestyles"];
    allowedToneStyles = v6->_allowedToneStyles;
    v6->_allowedToneStyles = (NSArray *)v10;

    uint64_t v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"assignee"];
    assigneeIdentifier = v6->_assigneeIdentifier;
    v6->_assigneeIdentifier = (NSNumber *)v12;

    uint64_t v14 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
    assigneeContactIdentifier = v6->_assigneeContactIdentifier;
    v6->_assigneeContactIdentifier = (NSString *)v14;

    uint64_t v16 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"tonestyle"];
    assigneeToneStyle = v6->_assigneeToneStyle;
    v6->_assigneeToneStyle = (NSString *)v16;

    v6->_shouldMakeDefaultRingtone = [v5 decodeBoolForKey:@"makedefault"];
    v6->_shouldMakeDefaultTextTone = [v5 decodeBoolForKey:@"makedefaulttext"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SSPurchase.m" lineNumber:1509 description:@"Only keyed coding is supported"];
  }
  v12.receiver = self;
  v12.super_class = (Class)SSTonePurchase;
  [(SSPurchase *)&v12 encodeWithCoder:v5];
  dispatchQueue = self->super._dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__SSTonePurchase_encodeWithCoder___block_invoke;
  v9[3] = &unk_1E5BA7018;
  id v10 = v5;
  id v11 = self;
  id v7 = v5;
  dispatch_sync(dispatchQueue, v9);
}

uint64_t __34__SSTonePurchase_encodeWithCoder___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 264) forKey:@"tonestyles"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 272) forKey:@"assignee"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 280) forKey:@"contact"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 288) forKey:@"tonestyle"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 296) forKey:@"makedefault"];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 297);
  return [v2 encodeBool:v3 forKey:@"makedefaulttext"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SSTonePurchase;
  id v4 = [(SSPurchase *)&v12 copyWithZone:a3];
  dispatchQueue = self->super._dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__SSTonePurchase_copyWithZone___block_invoke;
  v9[3] = &unk_1E5BA7018;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  dispatch_sync(dispatchQueue, v9);
  id v7 = v6;

  return v7;
}

uint64_t __31__SSTonePurchase_copyWithZone___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAllowedToneStyles:*(void *)(*(void *)(a1 + 40) + 264)];
  [*(id *)(a1 + 32) setAssigneeIdentifier:*(void *)(*(void *)(a1 + 40) + 272)];
  [*(id *)(a1 + 32) setAssigneeContactIdentifier:*(void *)(*(void *)(a1 + 40) + 280)];
  [*(id *)(a1 + 32) setAssigneeToneStyle:*(void *)(*(void *)(a1 + 40) + 288)];
  [*(id *)(a1 + 32) setShouldMakeDefaultRingtone:*(unsigned __int8 *)(*(void *)(a1 + 40) + 296)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 297);
  return [v2 setShouldMakeDefaultTextTone:v3];
}

- (id)copyXPCEncoding
{
  v11.receiver = self;
  v11.super_class = (Class)SSTonePurchase;
  id v3 = [(SSPurchase *)&v11 copyXPCEncoding];
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__SSTonePurchase_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E5BA7018;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(dispatchQueue, v8);
  id v6 = v5;

  return v6;
}

void __33__SSTonePurchase_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "50", *(void *)(*(void *)(a1 + 40) + 264));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "51", *(void *)(*(void *)(a1 + 40) + 272));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "56", *(void *)(*(void *)(a1 + 40) + 280));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "52", *(void *)(*(void *)(a1 + 40) + 288));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "53", *(unsigned char *)(*(void *)(a1 + 40) + 296));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "54", *(unsigned char *)(*(void *)(a1 + 40) + 297));
  uint64_t v2 = *(void **)(a1 + 32);
  xpc_dictionary_set_BOOL(v2, "55", 1);
}

- (SSTonePurchase)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SSTonePurchase;
  id v5 = [(SSPurchase *)&v19 initWithXPCEncoding:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = SSXPCDictionaryCopyObjectWithClass(v4, "50", v6);
    allowedToneStyles = v5->_allowedToneStyles;
    v5->_allowedToneStyles = (NSArray *)v7;

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = SSXPCDictionaryCopyObjectWithClass(v4, "51", v9);
    assigneeIdentifier = v5->_assigneeIdentifier;
    v5->_assigneeIdentifier = (NSNumber *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = SSXPCDictionaryCopyObjectWithClass(v4, "56", v12);
    assigneeContactIdentifier = v5->_assigneeContactIdentifier;
    v5->_assigneeContactIdentifier = (NSString *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v16 = SSXPCDictionaryCopyObjectWithClass(v4, "52", v15);
    assigneeToneStyle = v5->_assigneeToneStyle;
    v5->_assigneeToneStyle = (NSString *)v16;

    v5->_shouldMakeDefaultRingtone = xpc_dictionary_get_BOOL(v4, "53");
    v5->_shouldMakeDefaultTextTone = xpc_dictionary_get_BOOL(v4, "54");
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assigneeToneStyle, 0);
  objc_storeStrong((id *)&self->_assigneeContactIdentifier, 0);
  objc_storeStrong((id *)&self->_assigneeIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedToneStyles, 0);
}

@end