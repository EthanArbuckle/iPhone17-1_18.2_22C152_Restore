@interface STMutableStatusBarOverridesStatusDomainData(ArchiveRecordApplying)
- (void)_sbApplySystemStatusStatusBarOverridesArchiveRecord:()ArchiveRecordApplying;
@end

@implementation STMutableStatusBarOverridesStatusDomainData(ArchiveRecordApplying)

- (void)_sbApplySystemStatusStatusBarOverridesArchiveRecord:()ArchiveRecordApplying
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 statusBarData];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v6 = [MEMORY[0x1E4FA9440] entryKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v12 = [v5 entryForKey:v11];
        [a1 setEntry:v12 forKey:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }
  while (1)
  {

    v14 = [a1 suppressedBackgroundActivityIdentifiers];
    uint64_t v15 = [v14 count];

    if (!v15) {
      break;
    }
    v6 = [a1 suppressedBackgroundActivityIdentifiers];
    v13 = [v6 anyObject];
    [a1 stopSuppressingBackgroundActivityWithIdentifier:v13];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v16 = objc_msgSend(v4, "suppressedBackgroundActivityIdentifiers", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [a1 suppressBackgroundActivityWithIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * j)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }
}

@end