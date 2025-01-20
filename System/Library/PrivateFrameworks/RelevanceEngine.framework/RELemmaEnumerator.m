@interface RELemmaEnumerator
- (BOOL)enumerateLemmasInString:(id)a3 withBlock:(id)a4;
- (RELemmaEnumerator)init;
- (uint64_t)init;
@end

@implementation RELemmaEnumerator

- (RELemmaEnumerator)init
{
  v24[2] = *(id *)MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)RELemmaEnumerator;
  v2 = [(RELemmaEnumerator *)&v14 init];
  if (v2 && NaturalLanguageLibraryCore())
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    v3 = (id *)getNLTagSchemeLanguageSymbolLoc_ptr;
    uint64_t v23 = getNLTagSchemeLanguageSymbolLoc_ptr;
    if (!getNLTagSchemeLanguageSymbolLoc_ptr)
    {
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      v17 = __getNLTagSchemeLanguageSymbolLoc_block_invoke;
      v18 = &unk_2644BC768;
      v19 = &v20;
      v4 = (void *)NaturalLanguageLibrary();
      v5 = dlsym(v4, "NLTagSchemeLanguage");
      *(void *)(v19[1] + 24) = v5;
      getNLTagSchemeLanguageSymbolLoc_ptr = *(void *)(v19[1] + 24);
      v3 = (id *)v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v3)
    {
      -[RELemmaEnumerator init]();
      __break(1u);
    }
    v24[0] = *v3;
    id v6 = v24[0];
    v7 = getNLTagSchemeLemma();
    v24[1] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v9 = (void *)getNLTaggerClass_softClass;
    uint64_t v23 = getNLTaggerClass_softClass;
    if (!getNLTaggerClass_softClass)
    {
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      v17 = __getNLTaggerClass_block_invoke;
      v18 = &unk_2644BC768;
      v19 = &v20;
      __getNLTaggerClass_block_invoke((uint64_t)&v15);
      v9 = (void *)v21[3];
    }
    v10 = v9;
    _Block_object_dispose(&v20, 8);
    uint64_t v11 = [[v10 alloc] initWithTagSchemes:v8];
    tagger = v2->_tagger;
    v2->_tagger = (NLTagger *)v11;
  }
  return v2;
}

- (BOOL)enumerateLemmasInString:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    tagger = self->_tagger;
    if (tagger)
    {
      [(NLTagger *)tagger setString:v6];
      v9 = [(NLTagger *)self->_tagger dominantLanguage];
      v10 = v9;
      if (v9 && ([v9 isEqualToString:@"und"] & 1) == 0)
      {
        v12 = self->_tagger;
        uint64_t v13 = [v6 length];
        objc_super v14 = getNLTagSchemeLemma();
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __55__RELemmaEnumerator_enumerateLemmasInString_withBlock___block_invoke;
        v16[3] = &unk_2644BC728;
        id v17 = v6;
        id v18 = v7;
        -[NLTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](v12, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v13, 0, v14, 14, v16);

        BOOL v11 = 1;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

void __55__RELemmaEnumerator_enumerateLemmasInString_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v10 = v7;
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

- (uint64_t)init
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getNLTaggerClass_block_invoke_cold_1(v0);
}

@end