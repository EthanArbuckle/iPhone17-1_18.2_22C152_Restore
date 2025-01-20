@interface PMLLexicon
+ (BOOL)serializeLexiconToFile:(id)a3 tokenToWordIDDict:(id)a4;
- (PMLLexicon)init;
- (PMLLexicon)initWithPath:(id)a3;
- (unint64_t)getTotalEntries;
- (unint64_t)getWordIDforToken:(id)a3;
@end

@implementation PMLLexicon

- (void).cxx_destruct
{
}

- (unint64_t)getTotalEntries
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lexicon = self->_lexicon;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__PMLLexicon_getTotalEntries__block_invoke;
  v5[3] = &unk_26459F6B8;
  v5[4] = &v6;
  [(_PASCFBurstTrie *)lexicon runBlockWithTrie:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__PMLLexicon_getTotalEntries__block_invoke(uint64_t a1)
{
  uint64_t result = CFBurstTrieGetCount();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)getWordIDforToken:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v5 = [(_PASCFBurstTrie *)self->_lexicon payloadForString:v4];
  if (v5 == -1)
  {
    v7 = PML_LogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_debug_impl(&dword_2212A0000, v7, OS_LOG_TYPE_DEBUG, "Returning 0 for word id since token is not in lexicon: %@", (uint8_t *)&v9, 0xCu);
    }

    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = v5;
  }

  return v6;
}

- (PMLLexicon)initWithPath:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PMLLexicon.m", 37, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  unint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  if (([v6 fileExistsAtPath:v5] & 1) == 0)
  {

    goto LABEL_9;
  }
  v7 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v8 = [v7 attributesOfItemAtPath:v5 error:0];
  uint64_t v9 = [v8 fileSize];

  if (!v9)
  {
LABEL_9:
    v14 = PML_LogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_2212A0000, v14, OS_LOG_TYPE_DEFAULT, "Falling back to default system lexicon since lexicon at following path is invalid in existence: %@", buf, 0xCu);
    }

    v13 = [(PMLLexicon *)self init];
    goto LABEL_12;
  }
  v19.receiver = self;
  v19.super_class = (Class)PMLLexicon;
  id v10 = [(PMLLexicon *)&v19 init];
  if (!v10
    || (uint64_t v11 = [objc_alloc(MEMORY[0x263F61E18]) initWithPath:v5],
        lexicon = v10->_lexicon,
        v10->_lexicon = (_PASCFBurstTrie *)v11,
        lexicon,
        v10->_lexicon))
  {
    v13 = v10;
LABEL_12:
    id v10 = v13;
    v15 = v13;
    goto LABEL_13;
  }
  v17 = PML_LogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_2212A0000, v17, OS_LOG_TYPE_ERROR, "Returning nil for PMLLexicon since unable to initialize lexicon", buf, 2u);
  }

  v15 = 0;
LABEL_13:

  return v15;
}

- (PMLLexicon)init
{
  v9.receiver = self;
  v9.super_class = (Class)PMLLexicon;
  v2 = [(PMLLexicon *)&v9 init];
  if (v2
    && (uint64_t v3 = [objc_alloc(MEMORY[0x263F61E18]) initWithPath:&stru_26D329A58],
        lexicon = v2->_lexicon,
        v2->_lexicon = (_PASCFBurstTrie *)v3,
        lexicon,
        !v2->_lexicon))
  {
    unint64_t v6 = PML_LogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_2212A0000, v6, OS_LOG_TYPE_ERROR, "Returning nil for PMLLexicon since unable to initialize lexicon", v8, 2u);
    }

    id v5 = 0;
  }
  else
  {
    id v5 = v2;
  }

  return v5;
}

+ (BOOL)serializeLexiconToFile:(id)a3 tokenToWordIDDict:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v7 = CFBurstTrieCreate();
  v16[3] = v7;
  if (v7)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__PMLLexicon_serializeLexiconToFile_tokenToWordIDDict___block_invoke;
    v10[3] = &unk_26459F6E0;
    v10[4] = &v11;
    v10[5] = &v15;
    [v6 enumerateKeysAndObjectsUsingBlock:v10];
    if (*((unsigned char *)v12 + 24))
    {
      CFBurstTrieRelease();
      BOOL v8 = 0;
    }
    else
    {
      BOOL v8 = CFBurstTrieSerialize() != 0;
      if (v16[3]) {
        CFBurstTrieRelease();
      }
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v8 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __55__PMLLexicon_serializeLexiconToFile_tokenToWordIDDict___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if ((int)[v7 intValue] <= 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    [v8 length];
    [v7 unsignedIntegerValue];
    CFBurstTrieAdd();
  }
}

@end