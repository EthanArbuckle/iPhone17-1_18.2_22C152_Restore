@interface ICNoteData
- (BOOL)didBlockLastSave;
- (BOOL)isSettingNoteData;
- (BOOL)needsToBeSaved;
- (BOOL)saveNoteDataIfNeeded;
- (void)setCryptoInitializationVector:(id)a3;
- (void)setCryptoTag:(id)a3;
- (void)setDidBlockLastSave:(BOOL)a3;
- (void)setNeedsToBeSaved:(BOOL)a3;
- (void)setSettingNoteData:(BOOL)a3;
- (void)willAccessValueForKey:(id)a3;
- (void)willSave;
@end

@implementation ICNoteData

- (void)willAccessValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"data"]) {
    [(ICNoteData *)self saveNoteDataIfNeeded];
  }
  v5.receiver = self;
  v5.super_class = (Class)ICNoteData;
  [(ICNoteData *)&v5 willAccessValueForKey:v4];
}

- (BOOL)saveNoteDataIfNeeded
{
  if (![(ICNoteData *)self needsToBeSaved])
  {
    v3 = [(ICNoteData *)self note];
    if ([v3 needsInitialDerivedAttributesUpdate])
    {
      BOOL v4 = [(ICNoteData *)self isSettingNoteData];

      if (!v4) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    return 0;
  }
  if ([(ICNoteData *)self isSettingNoteData]) {
    return 0;
  }
LABEL_6:
  [(ICNoteData *)self setSettingNoteData:1];
  if ([(ICNoteData *)self needsToBeSaved])
  {
    objc_super v5 = [(ICNoteData *)self note];
    char v6 = [v5 saveNoteData];
  }
  else
  {
    char v6 = 0;
  }
  v7 = [(ICNoteData *)self note];
  [v7 updateDerivedAttributesIfNeeded];

  [(ICNoteData *)self setSettingNoteData:0];
  [(ICNoteData *)self setNeedsToBeSaved:0];
  return v6;
}

- (BOOL)needsToBeSaved
{
  return self->needsToBeSaved;
}

- (void)willSave
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(a1, "ic_loggingIdentifier");
  int v4 = 138412290;
  objc_super v5 = v3;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Skipping note data save for %@ because merge is blocked", (uint8_t *)&v4, 0xCu);
}

- (void)setCryptoTag:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(ICNoteData *)self cryptoTag];
  [(ICNoteData *)self willChangeValueForKey:@"cryptoTag"];
  [(ICNoteData *)self setPrimitiveValue:v4 forKey:@"cryptoTag"];
  [(ICNoteData *)self didChangeValueForKey:@"cryptoTag"];
  uint64_t v6 = (void *)*MEMORY[0x1E4F1D260];
  if ((id)*MEMORY[0x1E4F1D260] == v4) {
    v7 = 0;
  }
  else {
    v7 = v4;
  }
  unint64_t v8 = v7;
  if (v6 == v5) {
    v9 = 0;
  }
  else {
    v9 = v5;
  }
  unint64_t v10 = v9;
  if (!(v8 | v10))
  {
LABEL_15:
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteData setCryptoTag:](self, v4);
    }
    goto LABEL_19;
  }
  v11 = (void *)v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
  }
  else
  {
    int v13 = [(id)v8 isEqual:v10];

    if (v13) {
      goto LABEL_15;
    }
  }
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = objc_opt_class();
    v16 = [(ICNoteData *)self note];
    v17 = [v16 identifier];
    int v18 = 138412802;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    v21 = v17;
    __int16 v22 = 2048;
    uint64_t v23 = [v4 hash];
    _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoTag.hash = %lu", (uint8_t *)&v18, 0x20u);
  }
LABEL_19:
}

- (void)setCryptoInitializationVector:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(ICNoteData *)self cryptoInitializationVector];
  [(ICNoteData *)self willChangeValueForKey:@"cryptoInitializationVector"];
  [(ICNoteData *)self setPrimitiveValue:v4 forKey:@"cryptoInitializationVector"];
  [(ICNoteData *)self didChangeValueForKey:@"cryptoInitializationVector"];
  uint64_t v6 = (void *)*MEMORY[0x1E4F1D260];
  if ((id)*MEMORY[0x1E4F1D260] == v4) {
    v7 = 0;
  }
  else {
    v7 = v4;
  }
  unint64_t v8 = v7;
  if (v6 == v5) {
    v9 = 0;
  }
  else {
    v9 = v5;
  }
  unint64_t v10 = v9;
  if (!(v8 | v10))
  {
LABEL_15:
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteData setCryptoInitializationVector:](self, v4);
    }
    goto LABEL_19;
  }
  v11 = (void *)v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
  }
  else
  {
    int v13 = [(id)v8 isEqual:v10];

    if (v13) {
      goto LABEL_15;
    }
  }
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = objc_opt_class();
    v16 = [(ICNoteData *)self note];
    v17 = [v16 identifier];
    int v18 = 138412802;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    v21 = v17;
    __int16 v22 = 2048;
    uint64_t v23 = [v4 hash];
    _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoInitializationVector.hash = %lu", (uint8_t *)&v18, 0x20u);
  }
LABEL_19:
}

- (void)setNeedsToBeSaved:(BOOL)a3
{
  self->needsToBeSaved = a3;
}

- (BOOL)isSettingNoteData
{
  return self->settingNoteData;
}

- (void)setSettingNoteData:(BOOL)a3
{
  self->settingNoteData = a3;
}

- (BOOL)didBlockLastSave
{
  return self->didBlockLastSave;
}

- (void)setDidBlockLastSave:(BOOL)a3
{
  self->didBlockLastSave = a3;
}

- (void)setCryptoTag:(void *)a1 .cold.1(void *a1, void *a2)
{
  objc_opt_class();
  id v4 = [a1 note];
  objc_super v5 = [v4 identifier];
  [a2 hash];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v6, v7, "Updated crypto goo to the same value for %@ (%@): cryptoTag.hash = %lu", v8, v9, v10, v11, v12);
}

- (void)setCryptoInitializationVector:(void *)a1 .cold.1(void *a1, void *a2)
{
  objc_opt_class();
  id v4 = [a1 note];
  objc_super v5 = [v4 identifier];
  [a2 hash];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v6, v7, "Updated crypto goo to the same value for %@ (%@): cryptoInitializationVector.hash = %lu", v8, v9, v10, v11, v12);
}

@end