@interface WBSPasswordWordList
- (NSString)identifier;
- (WBSPasswordWordList)initWithIdentifier:(id)a3;
- (id)entriesForString:(id)a3;
@end

@implementation WBSPasswordWordList

- (WBSPasswordWordList)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasswordWordList;
  v5 = [(WBSPasswordWordList *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)entriesForString:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__WBSPasswordWordList_entriesForString___block_invoke;
  v9[3] = &unk_1E615C9B0;
  id v7 = v6;
  id v10 = v7;
  [(WBSPasswordWordList *)self enumerateEntriesForString:v5 withBlock:v9];

  return v7;
}

uint64_t __40__WBSPasswordWordList_entriesForString___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end