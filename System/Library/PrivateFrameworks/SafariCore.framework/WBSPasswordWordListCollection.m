@interface WBSPasswordWordListCollection
+ (id)commonPasscodeWordListCollection;
+ (id)commonPasswordWordListCollection;
- (WBSPasswordWordListCollection)init;
- (id)entriesForString:(id)a3;
- (void)addWordList:(id)a3;
- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4;
@end

@implementation WBSPasswordWordListCollection

- (WBSPasswordWordListCollection)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSPasswordWordListCollection;
  v2 = [(WBSPasswordWordListCollection *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    wordListsByIdentifiers = v2->_wordListsByIdentifiers;
    v2->_wordListsByIdentifiers = v3;

    v5 = v2;
  }

  return v2;
}

- (void)addWordList:(id)a3
{
  wordListsByIdentifiers = self->_wordListsByIdentifiers;
  id v4 = a3;
  id v5 = [v4 identifier];
  [(NSMutableDictionary *)wordListsByIdentifiers setObject:v4 forKeyedSubscript:v5];
}

- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = [(NSMutableDictionary *)self->_wordListsByIdentifiers allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) enumerateEntriesForString:v6 withBlock:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)entriesForString:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__WBSPasswordWordListCollection_entriesForString___block_invoke;
  v9[3] = &unk_1E615C9B0;
  id v7 = v6;
  id v10 = v7;
  [(WBSPasswordWordListCollection *)self enumerateEntriesForString:v5 withBlock:v9];

  return v7;
}

uint64_t __50__WBSPasswordWordListCollection_entriesForString___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (id)commonPasswordWordListCollection
{
  v2 = objc_alloc_init(WBSPasswordWordListCollection);
  v3 = +[WBSPasswordLexiconWordList lexiconWordListWithIdentifier:@"EnglishLexicon" localeIdentifier:@"en"];
  if (v3) {
    [(WBSPasswordWordListCollection *)v2 addWordList:v3];
  }
  id v4 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariCoreBundle");
  id v5 = [v4 URLForResource:@"WBSCommonPasswords" withExtension:@"plist"];

  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v5];
  id v7 = objc_msgSend(v6, "safari_arrayForKey:", @"CommonPasswords");
  v8 = [[WBSPasswordOrderedSetWordList alloc] initWithIdentifier:@"CommonPasswords" isSensitive:0 orderedWordsArray:v7];
  [(WBSPasswordWordListCollection *)v2 addWordList:v8];
  uint64_t v9 = objc_msgSend(v6, "safari_arrayForKey:", @"CommonSensitivePasswords");
  id v10 = [[WBSPasswordOrderedSetWordList alloc] initWithIdentifier:@"CommonSensitivePasswords" isSensitive:1 orderedWordsArray:v9];
  [(WBSPasswordWordListCollection *)v2 addWordList:v10];

  return v2;
}

+ (id)commonPasscodeWordListCollection
{
  v2 = objc_alloc_init(WBSPasswordWordListCollection);
  objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithObjects:", @"0102", @"0103", @"0111", @"1101", @"1102", @"1103", @"1110", @"1112", @"1123", @"1201", @"1202", @"1203", @"1210", @"1211", @"2229", @"2580", @"5683",
    @"7465",
    @"030379",
    @"101471",
    @"123654",
    @"147258",
    @"159753",
    @"321654",
    @"520131",
    @"789456",
  v3 = 0);
  id v4 = [[WBSPasswordOrderedSetWordList alloc] initWithIdentifier:@"CommonPasscodes" isSensitive:0 orderedWords:v3];
  [(WBSPasswordWordListCollection *)v2 addWordList:v4];

  return v2;
}

- (void).cxx_destruct
{
}

@end