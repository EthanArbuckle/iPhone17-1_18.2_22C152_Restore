@interface MFMailMessageStoreSearchResult
- (MFMailMessageStoreSearchResult)init;
- (NSDate)continueOffset;
- (NSMutableDictionary)mailboxToRemoteIdDictionary;
- (unint64_t)count;
- (void)addRemoteID:(id)a3 mailbox:(id)a4;
- (void)dealloc;
- (void)enumerateMailboxesAndRemoteIDsUsingBlock:(id)a3;
- (void)setContinueOffset:(id)a3;
- (void)setMailboxToRemoteIdDictionary:(id)a3;
@end

@implementation MFMailMessageStoreSearchResult

- (MFMailMessageStoreSearchResult)init
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailMessageStoreSearchResult;
  v2 = [(MFMailMessageStoreSearchResult *)&v4 init];
  if (v2) {
    v2->_mailboxToRemoteIdDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailMessageStoreSearchResult;
  [(MFMailMessageStoreSearchResult *)&v3 dealloc];
}

- (void)addRemoteID:(id)a3 mailbox:(id)a4
{
  id v7 = (id)[(NSMutableDictionary *)[(MFMailMessageStoreSearchResult *)self mailboxToRemoteIdDictionary] objectForKeyedSubscript:a4];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(NSMutableDictionary *)[(MFMailMessageStoreSearchResult *)self mailboxToRemoteIdDictionary] setObject:v7 forKeyedSubscript:a4];
  }
  [v7 addObject:a3];
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(MFMailMessageStoreSearchResult *)self mailboxToRemoteIdDictionary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MFMailMessageStoreSearchResult_count__block_invoke;
  v5[3] = &unk_1E6867538;
  v5[4] = &v6;
  [(NSMutableDictionary *)v2 enumerateKeysAndObjectsUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__MFMailMessageStoreSearchResult_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)enumerateMailboxesAndRemoteIDsUsingBlock:(id)a3
{
  objc_super v4 = [(MFMailMessageStoreSearchResult *)self mailboxToRemoteIdDictionary];
  [(NSMutableDictionary *)v4 enumerateKeysAndObjectsUsingBlock:a3];
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

@end