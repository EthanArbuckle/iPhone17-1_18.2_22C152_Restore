@interface PETConfig
- (BOOL)isAggregatedForMessageName:(id)a3;
- (BOOL)isChinaEnabledForMessageName:(id)a3 messageGroup:(id)a4;
- (BOOL)isTVOSEnabledForMessageName:(id)a3 messageGroup:(id)a4;
- (BOOL)shouldUploadToFBFv2;
- (BOOL)shouldUploadToFBFv2ForCarryAndSeed;
- (BOOL)shouldUploadToParsec;
- (NSDictionary)configDictionary;
- (PETConfig)initWithDictionary:(id)a3;
- (PETConfig)initWithFile:(id)a3;
- (double)deviceSamplingForMessageName:(id)a3 isSeed:(BOOL)a4;
- (double)messageSamplingForMessageName:(id)a3 isSeed:(BOOL)a4;
- (id)_configForMessageName:(id)a3;
- (id)_groupConfigForMessageName:(id)a3;
- (id)_nestedFieldsHelper:(id)a3;
- (id)_whitelistHelper:(id)a3;
- (id)bucketsForMessageName:(id)a3;
- (id)groupForMessageName:(id)a3;
- (unint64_t)samplingLimitForMessageGroup:(id)a3;
- (unint64_t)sigFigsForMessageName:(id)a3;
- (unint64_t)version;
- (void)_enumerateGroupConfigsWithBlock:(id)a3;
- (void)writeToFile:(id)a3;
@end

@implementation PETConfig

void __45__PETConfig__enumerateGroupConfigsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 16);
    id v4 = v6;
    v5 = objc_msgSend(v3, "pet_dictForKey:", v4);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __35__PETConfig__configForMessageName___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  objc_msgSend(a3, "pet_dictForKey:", @"message_whitelist");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = objc_msgSend(v7, "pet_dictForKey:", *(void *)(a1 + 32));
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    *a4 = 1;
  }
}

- (id)bucketsForMessageName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(PETConfig *)self _configForMessageName:a3];
  objc_msgSend(v3, "pet_arrayForKey:", @"hist_buckets");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          id v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v9 = v4;
LABEL_11:

  return v9;
}

- (id)_configForMessageName:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__604;
  v15 = __Block_byref_object_dispose__605;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__PETConfig__configForMessageName___block_invoke;
  v8[3] = &unk_1E56C3F38;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(PETConfig *)self _enumerateGroupConfigsWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)_enumerateGroupConfigsWithBlock:(id)a3
{
  id v4 = a3;
  messageGroups = self->_messageGroups;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PETConfig__enumerateGroupConfigsWithBlock___block_invoke;
  v7[3] = &unk_1E56C3F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)messageGroups enumerateKeysAndObjectsUsingBlock:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configDictionary, 0);

  objc_storeStrong((id *)&self->_messageGroups, 0);
}

- (NSDictionary)configDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)shouldUploadToFBFv2ForCarryAndSeed
{
  v2 = [(PETConfig *)self configDictionary];
  v3 = objc_msgSend(v2, "pet_numForKey:", @"upload_to_fbfv2_carry_seed");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)shouldUploadToFBFv2
{
  v2 = [(PETConfig *)self configDictionary];
  v3 = objc_msgSend(v2, "pet_numForKey:", @"upload_to_fbfv2");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)shouldUploadToParsec
{
  v2 = [(PETConfig *)self configDictionary];
  v3 = objc_msgSend(v2, "pet_numForKey:", @"upload_to_parsec");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isChinaEnabledForMessageName:(id)a3 messageGroup:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSDictionary *)self->_messageGroups objectForKeyedSubscript:a4];
  if (!v7)
  {
    uint64_t v7 = [(PETConfig *)self _groupConfigForMessageName:v6];
    if (!v7)
    {
      char v13 = 0;
      goto LABEL_8;
    }
  }
  id v8 = objc_msgSend(v7, "pet_numForKey:", @"china_enabled");
  id v9 = [(PETConfig *)self _configForMessageName:v6];
  v10 = objc_msgSend(v9, "pet_numForKey:", @"china_enabled");
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;

    id v8 = v12;
  }
  else if (!v8)
  {
    char v13 = 0;
    goto LABEL_7;
  }
  char v13 = [v8 BOOLValue];
LABEL_7:

LABEL_8:
  return v13;
}

- (BOOL)isTVOSEnabledForMessageName:(id)a3 messageGroup:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSDictionary *)self->_messageGroups objectForKeyedSubscript:a4];
  if (!v7)
  {
    uint64_t v7 = [(PETConfig *)self _groupConfigForMessageName:v6];
    if (!v7)
    {
      char v13 = 0;
      goto LABEL_8;
    }
  }
  id v8 = objc_msgSend(v7, "pet_numForKey:", @"tvos_enabled");
  id v9 = [(PETConfig *)self _configForMessageName:v6];
  v10 = objc_msgSend(v9, "pet_numForKey:", @"tvos_enabled");
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;

    id v8 = v12;
  }
  else if (!v8)
  {
    char v13 = 0;
    goto LABEL_7;
  }
  char v13 = [v8 BOOLValue];
LABEL_7:

LABEL_8:
  return v13;
}

- (BOOL)isAggregatedForMessageName:(id)a3
{
  id v4 = a3;
  id v5 = [(PETConfig *)self _groupConfigForMessageName:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(v5, "pet_numForKey:", @"aggregated");
    id v8 = [(PETConfig *)self _configForMessageName:v4];
    id v9 = objc_msgSend(v8, "pet_numForKey:", @"aggregated");
    v10 = v9;
    if (v9)
    {
      id v11 = v9;

      uint64_t v7 = v11;
    }
    else if (!v7)
    {
      char v12 = 1;
      goto LABEL_7;
    }
    char v12 = [v7 BOOLValue];
LABEL_7:

    goto LABEL_8;
  }
  char v12 = 1;
LABEL_8:

  return v12;
}

- (unint64_t)sigFigsForMessageName:(id)a3
{
  id v4 = a3;
  id v5 = [(PETConfig *)self _groupConfigForMessageName:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(v5, "pet_numForKey:", @"sig_figs");
    id v8 = [(PETConfig *)self _configForMessageName:v4];
    id v9 = objc_msgSend(v8, "pet_numForKey:", @"sig_figs");
    v10 = v9;
    if (v9)
    {
      id v11 = v9;

      uint64_t v7 = v11;
    }
    else if (!v7)
    {
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    unint64_t v12 = [v7 unsignedIntegerValue];
LABEL_7:

    goto LABEL_8;
  }
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_8:

  return v12;
}

- (double)messageSamplingForMessageName:(id)a3 isSeed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(PETConfig *)self _groupConfigForMessageName:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = objc_msgSend(v7, "pet_numForKey:", @"message_sampling");
    v10 = [(PETConfig *)self _configForMessageName:v6];
    id v11 = objc_msgSend(v10, "pet_numForKey:", @"message_sampling");
    unint64_t v12 = v11;
    if (v11)
    {
      id v13 = v11;

      id v9 = v13;
    }
    if (v4)
    {
      long long v14 = objc_msgSend(v8, "pet_numForKey:", @"message_sampling_seed");
      v15 = v14;
      if (v14)
      {
        id v16 = v14;

        id v9 = v16;
      }
      v17 = objc_msgSend(v10, "pet_numForKey:", @"message_sampling_seed");
      v18 = v17;
      if (v17)
      {
        id v19 = v17;

        id v9 = v19;
      }
    }
    if (v9)
    {
      [v9 doubleValue];
      double v21 = v20;
    }
    else
    {
      double v21 = 1.0;
    }
  }
  else
  {
    double v21 = 1.0;
  }

  return v21;
}

- (double)deviceSamplingForMessageName:(id)a3 isSeed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(PETConfig *)self _groupConfigForMessageName:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = objc_msgSend(v7, "pet_numForKey:", @"device_sampling");
    v10 = [(PETConfig *)self _configForMessageName:v6];
    id v11 = objc_msgSend(v10, "pet_numForKey:", @"device_sampling");
    unint64_t v12 = v11;
    if (v11)
    {
      id v13 = v11;

      id v9 = v13;
    }
    if (v4)
    {
      long long v14 = objc_msgSend(v8, "pet_numForKey:", @"device_sampling_seed");
      v15 = v14;
      if (v14)
      {
        id v16 = v14;

        id v9 = v16;
      }
      v17 = objc_msgSend(v10, "pet_numForKey:", @"device_sampling_seed");
      v18 = v17;
      if (v17)
      {
        id v19 = v17;

        id v9 = v19;
      }
    }
    if (v9)
    {
      [v9 doubleValue];
      double v21 = v20;
    }
    else
    {
      double v21 = 1.0;
    }
  }
  else
  {
    double v21 = 1.0;
  }

  return v21;
}

- (id)_nestedFieldsHelper:(id)a3
{
  BOOL v4 = [(PETConfig *)self _configForMessageName:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(v4, "pet_dictForKey:", @"nested_fields");
    uint64_t v7 = objc_opt_new();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__PETConfig__nestedFieldsHelper___block_invoke;
    v11[3] = &unk_1E56C3F88;
    id v8 = v7;
    id v12 = v8;
    id v13 = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];
    id v9 = v8;
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

void __33__PETConfig__nestedFieldsHelper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(a2, "integerValue"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [*(id *)(a1 + 40) _nestedFieldsHelper:v6];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
}

- (id)_whitelistHelper:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(PETConfig *)self _configForMessageName:v4];

  if (v6)
  {
    uint64_t v7 = objc_msgSend(v6, "pet_arrayForKey:", @"field_whitelist");
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __30__PETConfig__whitelistHelper___block_invoke;
    v16[3] = &unk_1E56C3F60;
    id v8 = v5;
    id v17 = v8;
    [v7 enumerateObjectsUsingBlock:v16];
    id v9 = objc_msgSend(v6, "pet_dictForKey:", @"nested_fields");
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __30__PETConfig__whitelistHelper___block_invoke_2;
    v13[3] = &unk_1E56C3F88;
    id v10 = v8;
    id v14 = v10;
    v15 = self;
    [v9 enumerateKeysAndObjectsUsingBlock:v13];
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t __30__PETConfig__whitelistHelper___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:a2];
}

void __30__PETConfig__whitelistHelper___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "integerValue"));
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) _whitelistHelper:v8];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
  }
}

- (id)_groupConfigForMessageName:(id)a3
{
  id v4 = [(PETConfig *)self groupForMessageName:a3];
  if ([v4 isEqualToString:@"default"])
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSDictionary *)self->_messageGroups pet_dictForKey:v4];
  }

  return v5;
}

- (id)groupForMessageName:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__604;
  v15 = __Block_byref_object_dispose__605;
  id v16 = @"default";
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__PETConfig_groupForMessageName___block_invoke;
  v8[3] = &unk_1E56C3F38;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(PETConfig *)self _enumerateGroupConfigsWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __33__PETConfig_groupForMessageName___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v8 = objc_msgSend(a3, "pet_dictForKey:", @"message_whitelist");
  id v9 = objc_msgSend(v8, "pet_dictForKey:", *(void *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (unint64_t)samplingLimitForMessageGroup:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"default"])
  {
    unint64_t v5 = 40960;
  }
  else
  {
    id v6 = [(NSDictionary *)self->_messageGroups pet_dictForKey:v4];
    uint64_t v7 = objc_msgSend(v6, "pet_numForKey:", @"sampling_limit");
    if ([v7 longValue] < 1 || objc_msgSend(v7, "longValue") > 4294967294) {
      unint64_t v5 = 4096;
    }
    else {
      unint64_t v5 = [v7 unsignedIntegerValue];
    }
  }
  return v5;
}

- (PETConfig)initWithDictionary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PETConfig;
  id v6 = [(PETConfig *)&v13 init];
  if (!v6) {
    goto LABEL_4;
  }
  if (+[PETConfigValidator configIsValid:v5])
  {
    objc_storeStrong((id *)&v6->_configDictionary, a3);
    uint64_t v7 = [(NSDictionary *)v6->_configDictionary pet_numForKey:@"version"];
    v6->_version = [v7 unsignedIntegerValue];

    uint64_t v8 = [(NSDictionary *)v6->_configDictionary pet_dictForKey:@"message_groups"];
    messageGroups = v6->_messageGroups;
    v6->_messageGroups = (NSDictionary *)v8;

LABEL_4:
    id v10 = v6;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v12 = 0;
    _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Configuration format is not valid", v12, 2u);
  }
  AnalyticsSendEvent();
  id v10 = 0;
LABEL_8:

  return v10;
}

- (void)writeToFile:(id)a3
{
}

- (PETConfig)initWithFile:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PETConfig;
  id v5 = [(PETConfig *)&v15 init];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = [v4 pathExtension];
    int v8 = [v7 isEqualToString:@"bin"];

    if (v8)
    {
      id v14 = 0;
      id v9 = [MEMORY[0x1E4F93B50] propertyListWithPath:v4 error:&v14];
      id v10 = v14;
      if (v10)
      {
        uint64_t v11 = v10;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v11;
          _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error loading pet config lazy plist: %@", buf, 0xCu);
        }
        AnalyticsSendEvent();

        goto LABEL_14;
      }
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
    }
    if (v9)
    {
      id v6 = [(PETConfig *)v6 initWithDictionary:v9];

      id v12 = v6;
LABEL_15:

      goto LABEL_16;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error loading pet config. File is missing or corrupted: %@", buf, 0xCu);
    }
    AnalyticsSendEvent();
LABEL_14:
    id v12 = 0;
    goto LABEL_15;
  }
  id v12 = 0;
LABEL_16:

  return v12;
}

@end