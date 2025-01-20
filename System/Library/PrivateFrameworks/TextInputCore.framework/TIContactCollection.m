@interface TIContactCollection
- (BOOL)sourceHasRelevancyScore;
- (TIContactCollection)initWithRelevanceScoreType:(BOOL)a3;
- (int64_t)count;
- (void)addContact:(id)a3;
- (void)enumerateContactsUsingBlock:(id)a3;
@end

@implementation TIContactCollection

- (void).cxx_destruct
{
}

- (int64_t)count
{
  return self->_count;
}

- (BOOL)sourceHasRelevancyScore
{
  return self->_sourceHasRelevancyScore;
}

- (void)enumerateContactsUsingBlock:(id)a3
{
  id v4 = a3;
  contacts = self->_contacts;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__TIContactCollection_enumerateContactsUsingBlock___block_invoke;
  v7[3] = &unk_1E6E2BB00;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)contacts enumerateObjectsUsingBlock:v7];
}

uint64_t __51__TIContactCollection_enumerateContactsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addContact:(id)a3
{
}

- (TIContactCollection)initWithRelevanceScoreType:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TIContactCollection;
  id v4 = [(TIContactCollection *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    contacts = v4->_contacts;
    v4->_contacts = v5;

    v4->_sourceHasRelevancyScore = a3;
    v4->_count = 0;
  }
  return v4;
}

@end