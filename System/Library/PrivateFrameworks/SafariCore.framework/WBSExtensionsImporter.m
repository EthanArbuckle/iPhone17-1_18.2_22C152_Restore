@interface WBSExtensionsImporter
- (BOOL)_checkNotAtRootLevel;
- (BOOL)_isParsingExtension;
- (BOOL)_isParsingExtensionsArray;
- (BOOL)jsonReader:(id)a3 appendKey:(id)a4;
- (BOOL)jsonReader:(id)a3 error:(id)a4;
- (BOOL)jsonReader:(id)a3 scalarValue:(id)a4;
- (BOOL)jsonReaderBeginArray:(id)a3;
- (BOOL)jsonReaderBeginObject:(id)a3;
- (BOOL)jsonReaderEndArray:(id)a3;
- (BOOL)jsonReaderEndObject:(id)a3;
- (WBSExtensionsImporterDelegate)delegate;
- (id)_popKeyFromStackIfPossible;
- (void)parseFileHandle:(id)a3 completionHandler:(id)a4;
- (void)parseURL:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation WBSExtensionsImporter

- (void)parseURL:(id)a3 completionHandler:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28CB0];
  id v11 = 0;
  v7 = (void (**)(id, id))a4;
  v8 = objc_msgSend(v6, "safari_fileHandleWithURL:options:createMode:error:", a3, 0, 0, &v11);
  id v9 = v11;
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10) {
    v7[2](v7, v9);
  }
  else {
    [(WBSExtensionsImporter *)self parseFileHandle:v8 completionHandler:v7];
  }
}

- (void)parseFileHandle:(id)a3 completionHandler:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, id))a4;
  id v7 = a3;
  v8 = objc_alloc_init(WBSJSONReader);
  [(WBSJSONReader *)v8 setDelegate:self];
  lastError = self->_lastError;
  self->_lastError = 0;

  BOOL v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  stack = self->_stack;
  self->_stack = v10;

  id v18 = 0;
  [(WBSJSONReader *)v8 parseFileHandle:v7 error:&v18];

  id v12 = v18;
  if (v12)
  {
    v6[2](v6, v12);
  }
  else
  {
    v13 = self->_lastError;
    if (!self->_foundExtensionsArray && !v13)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20[0] = @"Could not find extensions array in JSON file";
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      v16 = [v14 errorWithDomain:@"com.apple.SafariShared.WBSExtensionsImporterErrorDomain" code:2 userInfo:v15];
      v17 = self->_lastError;
      self->_lastError = v16;

      v13 = self->_lastError;
    }
    v6[2](v6, v13);
  }
}

- (BOOL)_checkNotAtRootLevel
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_stack count];
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"Root node is expected to be a dictionary";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v6 = [v4 errorWithDomain:@"com.apple.SafariShared.WBSExtensionsImporterErrorDomain" code:1 userInfo:v5];
    lastError = self->_lastError;
    self->_lastError = v6;
  }
  return v3 != 0;
}

- (BOOL)_isParsingExtensionsArray
{
  v5[3] = *MEMORY[0x1E4F143B8];
  stack = self->_stack;
  v5[0] = &unk_1F10864D0;
  v5[1] = @"extensions";
  v5[2] = &unk_1F10864E8;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  LOBYTE(stack) = [(NSMutableArray *)stack isEqual:v3];

  return (char)stack;
}

- (BOOL)_isParsingExtension
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  stack = self->_stack;
  v5[0] = &unk_1F10864D0;
  v5[1] = @"extensions";
  v5[2] = &unk_1F10864E8;
  v5[3] = &unk_1F10864D0;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  LOBYTE(stack) = [(NSMutableArray *)stack isEqual:v3];

  return (char)stack;
}

- (id)_popKeyFromStackIfPossible
{
  uint64_t v3 = [(NSMutableArray *)self->_stack lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(NSMutableArray *)self->_stack lastObject];
    [(NSMutableArray *)self->_stack removeLastObject];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)jsonReader:(id)a3 scalarValue:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(WBSExtensionsImporter *)self _checkNotAtRootLevel];
  if (v7)
  {
    v8 = [(WBSExtensionsImporter *)self _popKeyFromStackIfPossible];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v8 isEqualToString:@"display_name"])
      {
        uint64_t v9 = 48;
LABEL_15:
        objc_storeStrong((id *)((char *)&self->super.isa + v9), a4);
        goto LABEL_16;
      }
      if ([v8 isEqualToString:@"developer_name"])
      {
        uint64_t v9 = 40;
        goto LABEL_15;
      }
      if ([v8 isEqualToString:@"composed_identifier"])
      {
        uint64_t v9 = 32;
        goto LABEL_15;
      }
      if ([v8 isEqualToString:@"store_identifier"])
      {
        uint64_t v9 = 56;
        goto LABEL_15;
      }
      if ([v8 isEqualToString:@"ios_extension_bundle_identifier"])
      {
        uint64_t v9 = 72;
        goto LABEL_15;
      }
      if ([v8 isEqualToString:@"ios_app_bundle_identifier"])
      {
        uint64_t v9 = 64;
        goto LABEL_15;
      }
    }
LABEL_16:
  }
  return v7;
}

- (BOOL)jsonReaderBeginObject:(id)a3
{
  [(NSMutableArray *)self->_stack addObject:&unk_1F10864D0];
  if ([(WBSExtensionsImporter *)self _isParsingExtension])
  {
    composedIdentifier = self->_composedIdentifier;
    self->_composedIdentifier = 0;

    developerName = self->_developerName;
    self->_developerName = 0;

    displayName = self->_displayName;
    self->_displayName = 0;

    adamIdentifier = self->_adamIdentifier;
    self->_adamIdentifier = 0;

    alternatePlatformAppBundleIdentifier = self->_alternatePlatformAppBundleIdentifier;
    self->_alternatePlatformAppBundleIdentifier = 0;

    alternatePlatformExtensionBundleIdentifier = self->_alternatePlatformExtensionBundleIdentifier;
    self->_alternatePlatformExtensionBundleIdentifier = 0;
  }
  return 1;
}

- (BOOL)jsonReader:(id)a3 appendKey:(id)a4
{
  return 1;
}

- (BOOL)jsonReaderEndObject:(id)a3
{
  if ([(WBSExtensionsImporter *)self _isParsingExtension])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained enableExtensionWithComposedIdentifier:self->_composedIdentifier adamIdentifier:self->_adamIdentifier alternatePlatformAppBundleIdentifier:self->_alternatePlatformAppBundleIdentifier alternatePlatformExtensionBundleIdentifier:self->_alternatePlatformExtensionBundleIdentifier];
  }
  [(NSMutableArray *)self->_stack removeLastObject];
  id v5 = [(WBSExtensionsImporter *)self _popKeyFromStackIfPossible];
  return 1;
}

- (BOOL)jsonReaderBeginArray:(id)a3
{
  BOOL v4 = [(WBSExtensionsImporter *)self _checkNotAtRootLevel];
  if (v4)
  {
    [(NSMutableArray *)self->_stack addObject:&unk_1F10864E8];
    if ([(WBSExtensionsImporter *)self _isParsingExtensionsArray]) {
      self->_foundExtensionsArray = 1;
    }
  }
  return v4;
}

- (BOOL)jsonReaderEndArray:(id)a3
{
  [(NSMutableArray *)self->_stack removeLastObject];
  id v4 = [(WBSExtensionsImporter *)self _popKeyFromStackIfPossible];
  return 1;
}

- (BOOL)jsonReader:(id)a3 error:(id)a4
{
  return 0;
}

- (WBSExtensionsImporterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSExtensionsImporterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_alternatePlatformExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_alternatePlatformAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_adamIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_developerName, 0);
  objc_storeStrong((id *)&self->_composedIdentifier, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
}

@end