@interface WBSCacheRetainReleasePolicy
- (BOOL)isEntryRetainedForKeyString:(id)a3;
- (NSSet)retainedKeyStrings;
- (WBSCacheRetainReleasePolicy)initWithPurgeBlock:(id)a3;
- (void)_releaseEntryForKeyString:(id)a3;
- (void)_retainEntryForKeyString:(id)a3;
- (void)releaseEntriesForKeyStrings:(id)a3;
- (void)releaseEntryWithKeyStringProvider:(id)a3;
- (void)retainEntriesForKeyStrings:(id)a3;
- (void)retainEntryWithKeyStringProvider:(id)a3;
@end

@implementation WBSCacheRetainReleasePolicy

- (WBSCacheRetainReleasePolicy)initWithPurgeBlock:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSCacheRetainReleasePolicy;
  v5 = [(WBSCacheRetainReleasePolicy *)&v14 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1AD115160](v4);
    id purgeBlock = v5->_purgeBlock;
    v5->_id purgeBlock = (id)v6;

    uint64_t v8 = [MEMORY[0x1E4F28BD0] set];
    entryRetainCounts = v5->_entryRetainCounts;
    v5->_entryRetainCounts = (NSCountedSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28BD0] set];
    negativeEntryRetainCounts = v5->_negativeEntryRetainCounts;
    v5->_negativeEntryRetainCounts = (NSCountedSet *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)retainEntriesForKeyStrings:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(WBSCacheRetainReleasePolicy *)self _retainEntryForKeyString:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)retainEntryWithKeyStringProvider:(id)a3
{
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WBSCacheRetainReleasePolicy *)self _retainEntryForKeyString:v4];
}

- (void)_retainEntryForKeyString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if ([(NSCountedSet *)self->_negativeEntryRetainCounts containsObject:v4]) {
      [(NSCountedSet *)self->_negativeEntryRetainCounts removeObject:v4];
    }
    else {
      [(NSCountedSet *)self->_entryRetainCounts addObject:v4];
    }
  }
}

- (void)releaseEntriesForKeyStrings:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(WBSCacheRetainReleasePolicy *)self _releaseEntryForKeyString:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)releaseEntryWithKeyStringProvider:(id)a3
{
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WBSCacheRetainReleasePolicy *)self _releaseEntryForKeyString:v4];
}

- (void)_releaseEntryForKeyString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if ([(NSCountedSet *)self->_entryRetainCounts containsObject:v4])
    {
      [(NSCountedSet *)self->_entryRetainCounts removeObject:v4];
      if (([(NSCountedSet *)self->_entryRetainCounts containsObject:v4] & 1) == 0) {
        (*((void (**)(void))self->_purgeBlock + 2))();
      }
    }
    else
    {
      [(NSCountedSet *)self->_negativeEntryRetainCounts addObject:v4];
    }
  }
}

- (BOOL)isEntryRetainedForKeyString:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    char v5 = [(NSCountedSet *)self->_entryRetainCounts containsObject:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (NSSet)retainedKeyStrings
{
  v2 = (void *)[(NSCountedSet *)self->_entryRetainCounts copy];
  return (NSSet *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeEntryRetainCounts, 0);
  objc_storeStrong((id *)&self->_entryRetainCounts, 0);
  objc_storeStrong(&self->_purgeBlock, 0);
}

@end