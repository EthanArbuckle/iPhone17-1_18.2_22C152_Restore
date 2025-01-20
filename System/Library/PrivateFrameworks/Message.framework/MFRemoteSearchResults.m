@interface MFRemoteSearchResults
- (MFRemoteSearchResults)init;
- (NSDate)continueOffset;
- (NSMutableDictionary)mailboxToRemoteIdDictionary;
- (unint64_t)count;
- (void)addRemoteID:(id)a3 mailbox:(id)a4;
- (void)addRemoteIDs:(id)a3 mailbox:(id)a4;
- (void)enumerateMailboxesAndRemoteIDsUsingBlock:(id)a3;
- (void)setContinueOffset:(id)a3;
- (void)setMailboxToRemoteIdDictionary:(id)a3;
@end

@implementation MFRemoteSearchResults

- (MFRemoteSearchResults)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFRemoteSearchResults;
  v2 = [(MFRemoteSearchResults *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mailboxToRemoteIdDictionary = v2->_mailboxToRemoteIdDictionary;
    v2->_mailboxToRemoteIdDictionary = v3;
  }
  return v2;
}

- (void)addRemoteID:(id)a3 mailbox:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(MFRemoteSearchResults *)self mailboxToRemoteIdDictionary];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v10 = [(MFRemoteSearchResults *)self mailboxToRemoteIdDictionary];
    [v10 setObject:v9 forKeyedSubscript:v6];

    v8 = v9;
  }
  [v8 addObject:v11];
}

- (void)addRemoteIDs:(id)a3 mailbox:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "stringValue", (void)v13);
        [(MFRemoteSearchResults *)self addRemoteID:v12 mailbox:v7];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(MFRemoteSearchResults *)self mailboxToRemoteIdDictionary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__MFRemoteSearchResults_count__block_invoke;
  v5[3] = &unk_1E5D40798;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __30__MFRemoteSearchResults_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v4 count];
}

- (void)enumerateMailboxesAndRemoteIDsUsingBlock:(id)a3
{
  id v5 = a3;
  id v4 = [(MFRemoteSearchResults *)self mailboxToRemoteIdDictionary];
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

- (NSDate)continueOffset
{
  return self->_continueOffset;
}

- (void)setContinueOffset:(id)a3
{
}

- (NSMutableDictionary)mailboxToRemoteIdDictionary
{
  return self->_mailboxToRemoteIdDictionary;
}

- (void)setMailboxToRemoteIdDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxToRemoteIdDictionary, 0);
  objc_storeStrong((id *)&self->_continueOffset, 0);
}

@end