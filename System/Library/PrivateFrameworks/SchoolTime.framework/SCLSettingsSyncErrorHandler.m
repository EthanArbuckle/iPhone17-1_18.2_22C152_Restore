@interface SCLSettingsSyncErrorHandler
- (id)behaviorForError:(id)a3 history:(id)a4;
- (unint64_t)recoveryTypeForError:(id)a3;
@end

@implementation SCLSettingsSyncErrorHandler

- (id)behaviorForError:(id)a3 history:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  unint64_t v7 = [(SCLSettingsSyncErrorHandler *)self recoveryTypeForError:a3];
  if (v7 == 2)
  {
    v8 = [SCLSettingsSyncErrorBehavior alloc];
    uint64_t v9 = 2;
    uint64_t v10 = 0;
  }
  else
  {
    unint64_t v11 = v7;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      unint64_t v15 = 0;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v12);
          }
          v15 += objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "isEqual:", &unk_26DF0FF48, (void)v22);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);

      if (v15 > 6) {
        v18 = (uint64_t *)MEMORY[0x263EF81E8];
      }
      else {
        v18 = (uint64_t *)qword_2648AC188[v15];
      }
    }
    else
    {

      v18 = (uint64_t *)MEMORY[0x263EF81F8];
    }
    uint64_t v19 = *v18;
    v8 = [SCLSettingsSyncErrorBehavior alloc];
    uint64_t v9 = v11;
    uint64_t v10 = v19;
  }
  v20 = -[SCLSettingsSyncErrorBehavior initWithRecoveryType:retryInterval:](v8, "initWithRecoveryType:retryInterval:", v9, v10, (void)v22);

  return v20;
}

- (unint64_t)recoveryTypeForError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  int v5 = [v4 isEqual:@"com.apple.schooltime"];

  if (v5)
  {
    uint64_t v6 = [v3 code];

    if (((v6 - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else
  {
    v8 = [v3 domain];

    [v8 isEqual:*MEMORY[0x263F49E40]];
    return 1;
  }
}

@end