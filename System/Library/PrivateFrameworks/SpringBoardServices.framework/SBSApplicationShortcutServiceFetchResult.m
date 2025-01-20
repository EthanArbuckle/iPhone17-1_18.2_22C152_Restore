@interface SBSApplicationShortcutServiceFetchResult
- (BOOL)isEqual:(id)a3;
- (NSArray)composedApplicationShortcutItems;
- (NSArray)dynamicApplicationShortcutItems;
- (NSArray)staticApplicationShortcutItems;
- (SBSApplicationShortcutServiceFetchResult)init;
- (SBSApplicationShortcutServiceFetchResult)initWithStaticApplicationShortcutItems:(id)a3 dynamicApplicationShortcutItems:(id)a4 composedApplicationShortcutItems:(id)a5;
- (SBSApplicationShortcutServiceFetchResult)initWithXPCDictionary:(id)a3;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation SBSApplicationShortcutServiceFetchResult

- (void)encodeWithXPCDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(SBSApplicationShortcutServiceFetchResult *)self staticApplicationShortcutItems];
    BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

    v6 = [(SBSApplicationShortcutServiceFetchResult *)self dynamicApplicationShortcutItems];
    BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

    id v7 = [(SBSApplicationShortcutServiceFetchResult *)self composedApplicationShortcutItems];
    BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
  }
}

- (NSArray)dynamicApplicationShortcutItems
{
  return self->_dynamicApplicationShortcutItems;
}

- (NSArray)staticApplicationShortcutItems
{
  return self->_staticApplicationShortcutItems;
}

- (NSArray)composedApplicationShortcutItems
{
  return self->_composedApplicationShortcutItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedApplicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_dynamicApplicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_staticApplicationShortcutItems, 0);
}

- (SBSApplicationShortcutServiceFetchResult)initWithXPCDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    v6 = BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    id v7 = BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();

    self = [(SBSApplicationShortcutServiceFetchResult *)self initWithStaticApplicationShortcutItems:v5 dynamicApplicationShortcutItems:v6 composedApplicationShortcutItems:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SBSApplicationShortcutServiceFetchResult)initWithStaticApplicationShortcutItems:(id)a3 dynamicApplicationShortcutItems:(id)a4 composedApplicationShortcutItems:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBSApplicationShortcutServiceFetchResult;
  v11 = [(SBSApplicationShortcutServiceFetchResult *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    staticApplicationShortcutItems = v11->_staticApplicationShortcutItems;
    v11->_staticApplicationShortcutItems = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    dynamicApplicationShortcutItems = v11->_dynamicApplicationShortcutItems;
    v11->_dynamicApplicationShortcutItems = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    composedApplicationShortcutItems = v11->_composedApplicationShortcutItems;
    v11->_composedApplicationShortcutItems = (NSArray *)v16;
  }
  return v11;
}

- (SBSApplicationShortcutServiceFetchResult)init
{
  [MEMORY[0x1E4F1CA00] raise:[MEMORY[0x1E4F1C3A8] intValue] format:@"%s may only be called from SpringBoard.app.", @"-[SBSApplicationShortcutServiceFetchResult init]"];
  return [(SBSApplicationShortcutServiceFetchResult *)self initWithStaticApplicationShortcutItems:0 dynamicApplicationShortcutItems:0 composedApplicationShortcutItems:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSApplicationShortcutServiceFetchResult *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    v6 = [(SBSApplicationShortcutServiceFetchResult *)self staticApplicationShortcutItems];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__SBSApplicationShortcutServiceFetchResult_isEqual___block_invoke;
    v20[3] = &unk_1E566B6A0;
    id v7 = v4;
    v21 = v7;
    id v8 = (id)[v5 appendObject:v6 counterpart:v20];

    id v9 = [(SBSApplicationShortcutServiceFetchResult *)self dynamicApplicationShortcutItems];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__SBSApplicationShortcutServiceFetchResult_isEqual___block_invoke_2;
    v18[3] = &unk_1E566B6A0;
    id v10 = v7;
    objc_super v19 = v10;
    id v11 = (id)[v5 appendObject:v9 counterpart:v18];

    uint64_t v12 = [(SBSApplicationShortcutServiceFetchResult *)self composedApplicationShortcutItems];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__SBSApplicationShortcutServiceFetchResult_isEqual___block_invoke_3;
    v16[3] = &unk_1E566B6A0;
    v17 = v10;
    id v13 = (id)[v5 appendObject:v12 counterpart:v16];

    char v14 = [v5 isEqual];
  }

  return v14;
}

uint64_t __52__SBSApplicationShortcutServiceFetchResult_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) staticApplicationShortcutItems];
}

uint64_t __52__SBSApplicationShortcutServiceFetchResult_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dynamicApplicationShortcutItems];
}

uint64_t __52__SBSApplicationShortcutServiceFetchResult_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) composedApplicationShortcutItems];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(SBSApplicationShortcutServiceFetchResult *)self staticApplicationShortcutItems];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(SBSApplicationShortcutServiceFetchResult *)self dynamicApplicationShortcutItems];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = [(SBSApplicationShortcutServiceFetchResult *)self composedApplicationShortcutItems];
  id v9 = (id)[v3 appendObject:v8];

  unint64_t v10 = [v3 hash];
  return v10;
}

@end