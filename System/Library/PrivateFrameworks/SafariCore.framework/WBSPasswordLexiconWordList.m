@interface WBSPasswordLexiconWordList
+ (id)lexiconWordListWithIdentifier:(id)a3 localeIdentifier:(id)a4;
- (WBSPasswordLexiconWordList)initWithIdentifier:(id)a3 lexicon:(_LXLexicon *)a4;
- (void)dealloc;
- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4;
@end

@implementation WBSPasswordLexiconWordList

- (WBSPasswordLexiconWordList)initWithIdentifier:(id)a3 lexicon:(_LXLexicon *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WBSPasswordLexiconWordList;
  v5 = [(WBSPasswordWordList *)&v8 initWithIdentifier:a3];
  if (v5)
  {
    v5->_lexicon = (_LXLexicon *)CFRetain(a4);
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  CFRelease(self->_lexicon);
  v3.receiver = self;
  v3.super_class = (Class)WBSPasswordLexiconWordList;
  [(WBSPasswordLexiconWordList *)&v3 dealloc];
}

- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10 = [(WBSPasswordWordList *)self identifier];
  v11 = v6;
  id v8 = v6;
  id v9 = v10;
  LXLexiconEnumerateEntriesForString();
}

void __66__WBSPasswordLexiconWordList_enumerateEntriesForString_withBlock___block_invoke(uint64_t a1)
{
  id v5 = (id)LXEntryCopyString();
  LXEntryGetProbability();
  double v3 = 1.0 / __exp10(v2);
  if (v3 < 1.0) {
    double v3 = 1.0;
  }
  v4 = [[WBSPasswordWordListEntry alloc] initWithWord:v5 isSensitive:(LXEntryGetMetaFlags() & 0x3800000) != 0 wordListIdentifier:*(void *)(a1 + 32) guessesRequired:(unint64_t)v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)lexiconWordListWithIdentifier:(id)a3 localeIdentifier:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = *MEMORY[0x1E4F72458];
  v14[0] = v7;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v8 = LXLexiconCreate();
  if (v8)
  {
    id v9 = (const void *)v8;
    v10 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v6 lexicon:v8];
    CFRelease(v9);
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[WBSPasswordLexiconWordList lexiconWordListWithIdentifier:localeIdentifier:](v11, 0);
    }

    v10 = 0;
  }

  return v10;
}

+ (void)lexiconWordListWithIdentifier:(void *)a1 localeIdentifier:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Failed to create lexicon word list: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end