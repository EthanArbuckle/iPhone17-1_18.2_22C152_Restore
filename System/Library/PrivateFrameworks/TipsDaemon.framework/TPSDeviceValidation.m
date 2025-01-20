@interface TPSDeviceValidation
- (BOOL)_matchesDevices:(id)a3;
- (TPSDeviceValidation)initWithTargetDevices:(id)a3 excludeDevices:(id)a4;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSDeviceValidation

- (TPSDeviceValidation)initWithTargetDevices:(id)a3 excludeDevices:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TPSDeviceValidation;
  return [(TPSInclusivityValidation *)&v5 initWithTargetValues:a3 excludeValues:a4];
}

- (BOOL)_matchesDevices:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v4 = (void *)MGCopyAnswer();
  objc_super v5 = (void *)MGCopyAnswer();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__TPSDeviceValidation__matchesDevices___block_invoke;
  v10[3] = &unk_1E6E6C698;
  id v6 = v4;
  id v11 = v6;
  v13 = &v14;
  id v7 = v5;
  id v12 = v7;
  [v3 enumerateObjectsUsingBlock:v10];
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __39__TPSDeviceValidation__matchesDevices___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = [a2 componentsSeparatedByString:@"/"];
  if ((unint64_t)[v11 count] >= 2)
  {
    id v6 = [v11 objectAtIndexedSubscript:1];
    id v7 = [v11 firstObject];
    uint64_t v8 = [v7 caseInsensitiveCompare:@"deviceFamily"];

    if (v8)
    {
      v9 = [v11 firstObject];
      uint64_t v10 = [v9 caseInsensitiveCompare:@"model"];

      if (v10 || [v6 caseInsensitiveCompare:a1[5]]) {
        goto LABEL_8;
      }
    }
    else if (([v6 containsString:a1[4]] & 1) == 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  objc_super v5 = [(TPSDeviceValidation *)self targetDevices];
  if ([v5 count])
  {

LABEL_4:
    uint64_t v8 = [(TPSDeviceValidation *)self targetDevices];
    if ([v8 count])
    {
      v9 = [(TPSDeviceValidation *)self targetDevices];
      BOOL v10 = [(TPSDeviceValidation *)self _matchesDevices:v9];
    }
    else
    {
      BOOL v10 = 1;
    }

    id v11 = [(TPSDeviceValidation *)self excludeDevices];
    BOOL v12 = [(TPSDeviceValidation *)self _matchesDevices:v11];

    uint64_t v13 = v10 && !v12;
    uint64_t v14 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      [(TPSDeviceValidation *)self validateWithCompletion:v14];
    }
    goto LABEL_9;
  }
  id v6 = [(TPSInclusivityValidation *)self excludeValues];
  uint64_t v7 = [v6 count];

  if (v7) {
    goto LABEL_4;
  }
  uint64_t v14 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[TPSDeviceValidation validateWithCompletion:]((uint64_t)self, v14);
  }
  uint64_t v13 = 1;
LABEL_9:

  v4[2](v4, v13, 0);
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "%@ - neither target nor exclude device(s) is specified.", (uint8_t *)&v4, 0xCu);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.2(void *a1, char a2, NSObject *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_opt_class();
  id v7 = v6;
  uint64_t v8 = [a1 targetDevices];
  v9 = [v8 componentsJoinedByString:@","];
  BOOL v10 = [a1 excludeDevices];
  id v11 = [v10 componentsJoinedByString:@","];
  int v12 = 138413058;
  uint64_t v13 = v6;
  __int16 v14 = 2112;
  v15 = v9;
  __int16 v16 = 2112;
  char v17 = v11;
  __int16 v18 = 1024;
  int v19 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - target devices: %@, exclude devices: %@. Valid: %d", (uint8_t *)&v12, 0x26u);
}

@end