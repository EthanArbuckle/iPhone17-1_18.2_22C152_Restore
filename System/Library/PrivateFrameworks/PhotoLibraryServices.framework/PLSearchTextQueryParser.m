@interface PLSearchTextQueryParser
+ (id)_dateFilterWithQPDateInfo:(id)a3;
+ (void)enumerateDatesForString:(id)a3 resultsHandler:(id)a4;
- (PLSearchTextQueryParser)initWithDatabase:(id)a3;
- (PSIQueryDelegate)db;
- (PSITokenizer)psiTokenizer;
- (id)parseText:(id)a3;
- (void)setDb:(id)a3;
- (void)setPsiTokenizer:(id)a3;
@end

@implementation PLSearchTextQueryParser

+ (id)_dateFilterWithQPDateInfo:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    v4 = (void *)getQPParseAttributeValueDateComponentsKeySymbolLoc_ptr;
    uint64_t v53 = getQPParseAttributeValueDateComponentsKeySymbolLoc_ptr;
    if (!getQPParseAttributeValueDateComponentsKeySymbolLoc_ptr)
    {
      uint64_t v46 = MEMORY[0x1E4F143A8];
      uint64_t v47 = 3221225472;
      v48 = __getQPParseAttributeValueDateComponentsKeySymbolLoc_block_invoke;
      v49 = &unk_1E5875840;
      ParserLibrary = QueryParserLibrary();
      v51[3] = (uint64_t)dlsym(ParserLibrary, "QPParseAttributeValueDateComponentsKey");
      getQPParseAttributeValueDateComponentsKeySymbolLoc_ptr = v51[3];
      v4 = (void *)v51[3];
    }
    _Block_object_dispose(&v50, 8);
    if (!v4)
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      v45 = [NSString stringWithUTF8String:"NSString *getQPParseAttributeValueDateComponentsKey(void)"];
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"PLSearchTextQueryParser+NLDateParsing.m", 27, @"%s", dlerror(), v46, v47, v48, v49);
      goto LABEL_72;
    }
    v6 = [v3 objectForKeyedSubscript:*v4];
    if (!v6)
    {
      uint64_t v50 = 0;
      v51 = &v50;
      uint64_t v52 = 0x2020000000;
      v22 = (void *)getQPParseAttributeValueDateStartComponentsKeySymbolLoc_ptr;
      uint64_t v53 = getQPParseAttributeValueDateStartComponentsKeySymbolLoc_ptr;
      if (!getQPParseAttributeValueDateStartComponentsKeySymbolLoc_ptr)
      {
        uint64_t v46 = MEMORY[0x1E4F143A8];
        uint64_t v47 = 3221225472;
        v48 = __getQPParseAttributeValueDateStartComponentsKeySymbolLoc_block_invoke;
        v49 = &unk_1E5875840;
        v23 = QueryParserLibrary();
        v51[3] = (uint64_t)dlsym(v23, "QPParseAttributeValueDateStartComponentsKey");
        getQPParseAttributeValueDateStartComponentsKeySymbolLoc_ptr = v51[3];
        v22 = (void *)v51[3];
      }
      _Block_object_dispose(&v50, 8);
      if (!v22)
      {
        v44 = [MEMORY[0x1E4F28B00] currentHandler];
        v45 = [NSString stringWithUTF8String:"NSString *getQPParseAttributeValueDateStartComponentsKey(void)"];
        objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"PLSearchTextQueryParser+NLDateParsing.m", 30, @"%s", dlerror(), v46, v47, v48, v49);
        goto LABEL_72;
      }
      v14 = [v3 objectForKeyedSubscript:*v22];
      uint64_t v50 = 0;
      v51 = &v50;
      uint64_t v52 = 0x2020000000;
      v24 = (void *)getQPParseAttributeValueDateEndComponentsKeySymbolLoc_ptr;
      uint64_t v53 = getQPParseAttributeValueDateEndComponentsKeySymbolLoc_ptr;
      if (!getQPParseAttributeValueDateEndComponentsKeySymbolLoc_ptr)
      {
        uint64_t v46 = MEMORY[0x1E4F143A8];
        uint64_t v47 = 3221225472;
        v48 = __getQPParseAttributeValueDateEndComponentsKeySymbolLoc_block_invoke;
        v49 = &unk_1E5875840;
        v25 = QueryParserLibrary();
        v51[3] = (uint64_t)dlsym(v25, "QPParseAttributeValueDateEndComponentsKey");
        getQPParseAttributeValueDateEndComponentsKeySymbolLoc_ptr = v51[3];
        v24 = (void *)v51[3];
      }
      _Block_object_dispose(&v50, 8);
      if (!v24)
      {
        v44 = [MEMORY[0x1E4F28B00] currentHandler];
        v45 = [NSString stringWithUTF8String:"NSString *getQPParseAttributeValueDateEndComponentsKey(void)"];
        objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"PLSearchTextQueryParser+NLDateParsing.m", 31, @"%s", dlerror(), v46, v47, v48, v49);
        goto LABEL_72;
      }
      v15 = [v3 objectForKeyedSubscript:*v24];
      if (v14) {
        goto LABEL_54;
      }
      goto LABEL_21;
    }
    v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    v8 = (void *)getQPParseAttributeValueDateTypeKeySymbolLoc_ptr;
    uint64_t v53 = getQPParseAttributeValueDateTypeKeySymbolLoc_ptr;
    if (!getQPParseAttributeValueDateTypeKeySymbolLoc_ptr)
    {
      uint64_t v46 = MEMORY[0x1E4F143A8];
      uint64_t v47 = 3221225472;
      v48 = __getQPParseAttributeValueDateTypeKeySymbolLoc_block_invoke;
      v49 = &unk_1E5875840;
      v9 = QueryParserLibrary();
      v51[3] = (uint64_t)dlsym(v9, "QPParseAttributeValueDateTypeKey");
      getQPParseAttributeValueDateTypeKeySymbolLoc_ptr = v51[3];
      v8 = (void *)v51[3];
    }
    _Block_object_dispose(&v50, 8);
    if (!v8)
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      v45 = [NSString stringWithUTF8String:"NSString *getQPParseAttributeValueDateTypeKey(void)"];
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"PLSearchTextQueryParser+NLDateParsing.m", 28, @"%s", dlerror(), v46, v47, v48, v49);
      goto LABEL_72;
    }
    v10 = [v3 objectForKeyedSubscript:*v8];
    int v11 = [v10 integerValue];

    v12 = 0;
    if (v11 > 47)
    {
      if (v11 != 48)
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        if (v11 != 49) {
          goto LABEL_39;
        }
        v27 = [MEMORY[0x1E4F1C9C8] date];
        v18 = [v7 components:24 fromDate:v27];

        objc_msgSend(v6, "setMonth:", objc_msgSend(v18, "month"));
        objc_msgSend(v6, "setDay:", objc_msgSend(v18, "day"));
        v28 = [v7 dateFromComponents:v6];
        v12 = [v7 dateByAddingUnit:16 value:-3 toDate:v28 options:0];
        v13 = [v7 dateByAddingUnit:16 value:3 toDate:v28 options:0];

LABEL_36:
        if (v12)
        {
LABEL_37:
          v14 = [v7 components:28 fromDate:v12];
          if (v13) {
            goto LABEL_38;
          }
          goto LABEL_33;
        }
LABEL_32:
        v14 = 0;
        if (v13)
        {
LABEL_38:
          v15 = [v7 components:28 fromDate:v13];
LABEL_39:
          uint64_t v50 = 0;
          v51 = &v50;
          uint64_t v52 = 0x2020000000;
          v31 = (void *)getQPParseAttributeValueDateTemporalModifierKeySymbolLoc_ptr;
          uint64_t v53 = getQPParseAttributeValueDateTemporalModifierKeySymbolLoc_ptr;
          if (!getQPParseAttributeValueDateTemporalModifierKeySymbolLoc_ptr)
          {
            uint64_t v46 = MEMORY[0x1E4F143A8];
            uint64_t v47 = 3221225472;
            v48 = __getQPParseAttributeValueDateTemporalModifierKeySymbolLoc_block_invoke;
            v49 = &unk_1E5875840;
            v32 = QueryParserLibrary();
            v51[3] = (uint64_t)dlsym(v32, "QPParseAttributeValueDateTemporalModifierKey");
            getQPParseAttributeValueDateTemporalModifierKeySymbolLoc_ptr = v51[3];
            v31 = (void *)v51[3];
          }
          _Block_object_dispose(&v50, 8);
          if (!v31)
          {
            v44 = [MEMORY[0x1E4F28B00] currentHandler];
            v45 = [NSString stringWithUTF8String:"NSString *getQPParseAttributeValueDateTemporalModifierKey(void)"];
            objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"PLSearchTextQueryParser+NLDateParsing.m", 29, @"%s", dlerror(), v46, v47, v48, v49);
            goto LABEL_72;
          }
          v33 = [v3 objectForKeyedSubscript:*v31];
          int v34 = [v33 integerValue];

          if (v34 == 2)
          {
            if (v14) {
              v37 = v14;
            }
            else {
              v37 = v6;
            }
            id v38 = v37;

            id v36 = 0;
            v14 = v38;
          }
          else
          {
            if (v34 != 1) {
              goto LABEL_53;
            }

            if (v15) {
              v35 = v15;
            }
            else {
              v35 = v6;
            }
            id v36 = v35;
            v14 = 0;
          }

          v15 = v36;
LABEL_53:

          if (v14)
          {
LABEL_54:
            v39 = [PSIDateFilter alloc];
            if (v15) {
              v26 = [(PSIDateFilter *)v39 initWithStartDateComponents:v14 endDateComponents:v15];
            }
            else {
              v26 = [(PSIDateFilter *)v39 initWithStartDateComponents:v14];
            }
            goto LABEL_58;
          }
LABEL_21:
          if (v15)
          {
            v26 = [[PSIDateFilter alloc] initWithEndDateComponents:v15];
          }
          else
          {
            if (!v6
              || [v6 day] == 0x7FFFFFFFFFFFFFFFLL
              && [v6 month] == 0x7FFFFFFFFFFFFFFFLL
              && [v6 year] == 0x7FFFFFFFFFFFFFFFLL)
            {
              v21 = 0;
LABEL_59:
              uint64_t v50 = 0;
              v51 = &v50;
              uint64_t v52 = 0x2020000000;
              v40 = (void *)getQPParseAttributeValueDateDisplayKeySymbolLoc_ptr;
              uint64_t v53 = getQPParseAttributeValueDateDisplayKeySymbolLoc_ptr;
              if (!getQPParseAttributeValueDateDisplayKeySymbolLoc_ptr)
              {
                uint64_t v46 = MEMORY[0x1E4F143A8];
                uint64_t v47 = 3221225472;
                v48 = __getQPParseAttributeValueDateDisplayKeySymbolLoc_block_invoke;
                v49 = &unk_1E5875840;
                v41 = QueryParserLibrary();
                v51[3] = (uint64_t)dlsym(v41, "QPParseAttributeValueDateDisplayKey");
                getQPParseAttributeValueDateDisplayKeySymbolLoc_ptr = v51[3];
                v40 = (void *)v51[3];
              }
              _Block_object_dispose(&v50, 8);
              if (v40)
              {
                v42 = [v3 objectForKeyedSubscript:*v40];
                [(PSIDateFilter *)v21 setDisplayString:v42];

                goto LABEL_63;
              }
              v44 = [MEMORY[0x1E4F28B00] currentHandler];
              v45 = [NSString stringWithUTF8String:"NSString *getQPParseAttributeValueDateDisplayKey(void)"];
              objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"PLSearchTextQueryParser+NLDateParsing.m", 32, @"%s", dlerror(), v46, v47, v48, v49);
LABEL_72:

              __break(1u);
              return result;
            }
            v26 = [[PSIDateFilter alloc] initWithSingleDateComponents:v6];
          }
LABEL_58:
          v21 = v26;
          goto LABEL_59;
        }
LABEL_33:
        v15 = 0;
        goto LABEL_39;
      }
      v29 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v30 = [v7 component:16 fromDate:v29];

      [v6 setDay:v30];
      v18 = [v7 dateFromComponents:v6];
      v12 = [v7 dateByAddingUnit:16 value:-3 toDate:v18 options:0];
      v19 = v7;
      uint64_t v20 = 3;
    }
    else
    {
      if (v11 == 12)
      {
        v12 = [v7 dateFromComponents:v6];
        v13 = [v7 dateByAddingUnit:16 value:6 toDate:v12 options:0];
        if (v12) {
          goto LABEL_37;
        }
        goto LABEL_32;
      }
      v13 = 0;
      v14 = 0;
      v15 = 0;
      if (v11 != 47) {
        goto LABEL_39;
      }
      v16 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v17 = [v7 component:512 fromDate:v16];

      [v6 setWeekday:v17];
      v18 = [v7 dateFromComponents:v6];
      v12 = [v7 dateByAddingUnit:16 value:-1 toDate:v18 options:0];
      v19 = v7;
      uint64_t v20 = 1;
    }
    v13 = [v19 dateByAddingUnit:16 value:v20 toDate:v18 options:0];
    goto LABEL_36;
  }
  v21 = 0;
LABEL_63:

  return v21;
}

+ (void)enumerateDatesForString:(id)a3 resultsHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v8 = (void *)getQPQueryParserManagerClass_softClass;
  uint64_t v22 = getQPQueryParserManagerClass_softClass;
  if (!getQPQueryParserManagerClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getQPQueryParserManagerClass_block_invoke;
    v18[3] = &unk_1E5875840;
    v18[4] = &v19;
    __getQPQueryParserManagerClass_block_invoke((uint64_t)v18);
    v8 = (void *)v20[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v19, 8);
  v10 = [v9 photosParserManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PLSearchTextQueryParser_NLDateParsing__enumerateDatesForString_resultsHandler___block_invoke;
  v12[3] = &unk_1E5865FA8;
  v14 = v16;
  id v15 = a1;
  id v11 = v7;
  id v13 = v11;
  [v10 enumerateParseResultsForString:v6 options:0 withBlock:v12];

  _Block_object_dispose(v16, 8);
}

void __81__PLSearchTextQueryParser_NLDateParsing__enumerateDatesForString_resultsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
  }
  else
  {
    id v5 = a2;
    uint64_t v6 = [v5 length];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__PLSearchTextQueryParser_NLDateParsing__enumerateDatesForString_resultsHandler___block_invoke_2;
    v9[3] = &unk_1E5865F80;
    uint64_t v12 = *(void *)(a1 + 48);
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v10 = v7;
    uint64_t v11 = v8;
    objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v9);
  }
}

void __81__PLSearchTextQueryParser_NLDateParsing__enumerateDatesForString_resultsHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 count])
  {
LABEL_8:

    return;
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v4 = (void *)getQPParseAttributeDateKeySymbolLoc_ptr;
  uint64_t v13 = getQPParseAttributeDateKeySymbolLoc_ptr;
  if (!getQPParseAttributeDateKeySymbolLoc_ptr)
  {
    ParserLibrary = QueryParserLibrary();
    v11[3] = (uint64_t)dlsym(ParserLibrary, "QPParseAttributeDateKey");
    getQPParseAttributeDateKeySymbolLoc_ptr = v11[3];
    v4 = (void *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v4)
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:*v4];
    id v7 = [(id)objc_opt_class() _dateFilterWithQPDateInfo:v6];
    if (v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }

    goto LABEL_8;
  }
  uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
  id v9 = [NSString stringWithUTF8String:"NSString *getQPParseAttributeDateKey(void)"];
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PLSearchTextQueryParser+NLDateParsing.m", 26, @"%s", dlerror());

  __break(1u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psiTokenizer, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)setPsiTokenizer:(id)a3
{
}

- (PSITokenizer)psiTokenizer
{
  return self->_psiTokenizer;
}

- (void)setDb:(id)a3
{
}

- (PSIQueryDelegate)db
{
  return self->_db;
}

- (id)parseText:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v30 = objc_opt_new();
  v27 = v4;
  uint64_t v5 = [(PSITokenizer *)self->_psiTokenizer normalizeString:v4];
  v29 = self;
  psiTokenizer = self->_psiTokenizer;
  id v35 = 0;
  id v36 = 0;
  v26 = (void *)v5;
  id v7 = -[PSITokenizer newTokensFromString:withOptions:outCopyRanges:error:](psiTokenizer, "newTokensFromString:withOptions:outCopyRanges:error:");
  id v25 = v36;
  id v24 = v35;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v28 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v13 = [v8 lastObject];

        v14 = +[PSITokenizer fts5StringFromString:v12 useWildcard:v12 == v13];
        CFSetRef v15 = (const __CFSet *)[(PSIQueryDelegate *)v29->_db groupIdsMatchingString:v14 categories:0 textIsSearchable:1];
        CFIndex Count = CFSetGetCount(v15);
        char v17 = (const void **)malloc_type_malloc(8 * Count, 0x100004000313F17uLL);
        CFSetGetValues(v15, v17);
        id v18 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        for (j = v17; Count; --Count)
        {
          uint64_t v20 = (uint64_t)*j++;
          [v18 addIndex:v20];
        }
        free(v17);
        uint64_t v21 = [[PSIQueryToken alloc] initWithText:v12 normalizedText:v12 userCategory:0 matchType:v12 != v13];
        [v30 addObject:v21];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v10);
  }

  uint64_t v22 = (void *)[v30 copy];
  return v22;
}

- (PLSearchTextQueryParser)initWithDatabase:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLSearchTextQueryParser;
  uint64_t v6 = [(PLSearchTextQueryParser *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, a3);
    id v8 = [PSITokenizer alloc];
    uint64_t v9 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    uint64_t v10 = [(PSITokenizer *)v8 initWithLocale:v9 useCache:0];
    psiTokenizer = v7->_psiTokenizer;
    v7->_psiTokenizer = (PSITokenizer *)v10;
  }
  return v7;
}

@end