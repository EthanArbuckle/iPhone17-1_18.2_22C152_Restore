@interface PSITokenizer
+ (id)fts5StringFromString:(id)a3 forMatchType:(unint64_t)a4;
+ (id)fts5StringFromString:(id)a3 useWildcard:(BOOL)a4;
+ (id)fts5StringFromString:(id)a3 useWildcard:(BOOL)a4 leadingAnchored:(BOOL)a5;
+ (id)ftsTokenizerName;
- (NSLocale)locale;
- (PSITokenizer)initWithLocale:(id)a3 useCache:(BOOL)a4;
- (id)newTokensFromString:(id)a3 withOptions:(int64_t)a4 outCopyRanges:(id *)a5 error:(id *)a6;
- (id)normalizeString:(id)a3;
- (int)registerFTS5TokenizerForDatabase:(sqlite3 *)a3;
- (void)_tokenizeString:(id)a3 withContext:(id *)a4;
- (void)dealloc;
- (void)setLocale:(id)a3;
- (void)tokenizeString:(id)a3 withOptions:(int64_t)a4 tokenOutput:(tokenOutput_t *)a5;
@end

@implementation PSITokenizer

- (int)registerFTS5TokenizerForDatabase:(sqlite3 *)a3
{
  uint64_t v4 = fts5_api_from_db(a3);
  long long v8 = xmmword_1EEB2BF00;
  v9 = off_1EEB2BF10;
  v5 = *(uint64_t (**)(uint64_t, uint64_t, PSITokenizer *, long long *, void))(v4 + 8);
  objc_msgSend((id)objc_opt_class(), "ftsTokenizerName", xmmword_1EEB2BF00, off_1EEB2BF10);
  id v6 = objc_claimAutoreleasedReturnValue();
  LODWORD(self) = v5(v4, [v6 UTF8String], self, &v8, 0);

  return (int)self;
}

- (PSITokenizer)initWithLocale:(id)a3 useCache:(BOOL)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSITokenizer;
  long long v8 = [(PSITokenizer *)&v13 init];
  if (v8)
  {
    v16[0] = *MEMORY[0x1E4F5C920];
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v14 = *MEMORY[0x1E4F5C950];
    uint64_t v15 = MEMORY[0x1E4F1CC38];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v8->_tagger = (void *)NLTaggerCreate();
    objc_storeStrong((id *)&v8->_locale, a3);
    v8->_useCache = a4;
    if (a4)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
      cache = v8->_cache;
      v8->_cache = (NSMutableDictionary *)v10;
    }
    else
    {
      cache = v8->_cache;
      v8->_cache = 0;
    }
  }
  return v8;
}

+ (id)ftsTokenizerName
{
  return @"PSITokenizer";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (id)newTokensFromString:(id)a3 withOptions:(int64_t)a4 outCopyRanges:(id *)a5 error:(id *)a6
{
  v26[63] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a5) {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v12 = 0;
  }
  v20[0] = 0;
  v20[1] = v11;
  v20[2] = 0;
  v20[3] = &v25;
  v20[4] = 32;
  long long v21 = 0u;
  long long v22 = 0u;
  [(PSITokenizer *)self tokenizeString:v10 withOptions:a4 tokenOutput:v20];
  if (!a5)
  {
LABEL_12:
    a6 = (id *)v11;
    goto LABEL_15;
  }
  uint64_t v13 = v21;
  if (v13 == [v11 count])
  {
    if (v13 >= 1)
    {
      uint64_t v14 = v26;
      do
      {
        if (v12)
        {
          uint64_t v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", *(v14 - 1), *v14);
          [v12 addObject:v15];
        }
        v14 += 2;
        --v13;
      }
      while (v13);
    }
    *a5 = v12;
    goto LABEL_12;
  }
  if (a6)
  {
    v16 = [NSString stringWithFormat:@"Error: Reached token ranges limit (%ld) for string: %@", 32, v10];
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24 = v16;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    *a6 = [v17 errorWithDomain:@"com.apple.photos.search" code:-1 userInfo:v18];

    a6 = 0;
  }
LABEL_15:

  return a6;
}

- (void)_tokenizeString:(id)a3 withContext:(id *)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_useCache)
  {
    id v7 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v6];
    if ([v7 count])
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v72 objects:v79 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v73 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            CFStringRef v14 = (const __CFString *)[v13 string];
            uint64_t v15 = [v13 range];
            enumerateToken(v14, v15, v16, (uint64_t)a4);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v72 objects:v79 count:16];
        }
        while (v10);
      }
      id v17 = v8;
      goto LABEL_31;
    }
    [(NSMutableDictionary *)self->_cache removeAllObjects];
  }
  v18 = [MEMORY[0x1E4F1CA48] array];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __44__PSITokenizer__tokenizeString_withContext___block_invoke;
  v70[3] = &unk_1E5869848;
  id v19 = v18;
  id v71 = v19;
  v20 = (void *)MEMORY[0x19F38D650](v70);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __44__PSITokenizer__tokenizeString_withContext___block_invoke_2;
  v67[3] = &unk_1E5869870;
  id v54 = v6;
  id v21 = v6;
  id v68 = v21;
  id v53 = v20;
  id v69 = v53;
  long long v22 = (void *)MEMORY[0x19F38D650](v67);
  uint64_t v23 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".-_"];
  NLTaggerSetString();
  [v21 length];
  NLTaggerSetLocaleForRange();
  uint64_t v60 = MEMORY[0x1E4F143A8];
  uint64_t v61 = 3221225472;
  v62 = __44__PSITokenizer__tokenizeString_withContext___block_invoke_3;
  v63 = &unk_1E5869898;
  CFStringRef v24 = (const __CFString *)v21;
  v64 = (__CFString *)v24;
  id v52 = v23;
  id v65 = v52;
  id v51 = v22;
  id v66 = v51;
  NLTaggerEnumerateTokens();
  BOOL useCache = self->_useCache;
  v55 = self;
  if ((a4->var1 & 4) != 0 && (unint64_t)[v19 count] >= 9)
  {
    if ((a4->var1 & 8) != 0) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = 1;
    }
    v27 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v19, "count") - v26);
    uint64_t v28 = [v27 range];
    uint64_t v30 = v29;

    uint64_t v31 = 8 - v26;
    v32 = [v19 objectAtIndexedSubscript:8 - v26];
    CFIndex v33 = [v32 range];

    CFIndex v34 = v28 + v30 - v33;
    v81.location = v33;
    v81.length = v34;
    CFStringRef v35 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v24, v81);
    v36 = -[PSIToken initWithString:range:]([PSIToken alloc], "initWithString:range:", v35, v33, v34);
    CFRelease(v35);
    uint64_t v37 = [v19 count] - 7;
    v78 = v36;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
    objc_msgSend(v19, "replaceObjectsInRange:withObjectsFromArray:", v31, v37, v38);

    goto LABEL_20;
  }
  if (!useCache)
  {
LABEL_20:
    int v39 = 0;
    goto LABEL_21;
  }
  [(NSMutableDictionary *)self->_cache setObject:v19 forKeyedSubscript:v24];
  int v39 = 1;
LABEL_21:
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v17 = v19;
  uint64_t v40 = [v17 countByEnumeratingWithState:&v56 objects:v77 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v57 != v42) {
          objc_enumerationMutation(v17);
        }
        v44 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        CFStringRef v45 = (const __CFString *)[v44 string];
        uint64_t v46 = [v44 range];
        enumerateToken(v45, v46, v47, (uint64_t)a4);
        if (v39)
        {
          CFStringRef v48 = (const __CFString *)[v44 string];
          v49 = -[PSIToken initWithString:range:]([PSIToken alloc], "initWithString:range:", v48, 0, CFStringGetLength(v48));
          v76 = v49;
          v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
          [(NSMutableDictionary *)v55->_cache setObject:v50 forKeyedSubscript:v48];
        }
      }
      uint64_t v41 = [v17 countByEnumeratingWithState:&v56 objects:v77 count:16];
    }
    while (v41);
  }

  id v8 = v71;
  id v6 = v54;
LABEL_31:
}

void __44__PSITokenizer__tokenizeString_withContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void **)(a1 + 32);
  v5 = -[PSIToken initWithString:range:]([PSIToken alloc], "initWithString:range:", a2, a3, a4);
  [v4 addObject:v5];
}

void __44__PSITokenizer__tokenizeString_withContext___block_invoke_2(uint64_t a1, CFRange range)
{
  CFIndex length = range.length;
  v6.location = range.location;
  v6.CFIndex length = length;
  CFStringRef v4 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFStringRef *)(a1 + 32), v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  CFRelease(v4);
}

uint64_t __44__PSITokenizer__tokenizeString_withContext___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  CFIndex location = *(void *)a2;
  CFIndex v4 = *(void *)(a2 + 8);
  if ((*(unsigned char *)(a2 + 16) & 0x10) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(v2 + 48) + 16))();
  }
  v6.CFIndex location = 0;
  v6.CFIndex length = 0;
  if (v4 >= 1)
  {
    while (1)
    {
      v7.CFIndex location = location;
      v7.CFIndex length = v4;
      result = CFStringFindCharacterFromSet(*(CFStringRef *)(v2 + 32), *(CFCharacterSetRef *)(v2 + 40), v7, 0, &v6);
      if (!result) {
        break;
      }
      if (v6.location != location)
      {
        result = (*(uint64_t (**)(void))(*(void *)(v2 + 48) + 16))();
        CFIndex location = v6.location;
      }
      location += v6.length;
      CFIndex v4 = *(void *)a2 - location + *(void *)(a2 + 8);
      if (v4 <= 0) {
        return result;
      }
    }
    return (*(uint64_t (**)(void))(*(void *)(v2 + 48) + 16))();
  }
  return result;
}

- (void)tokenizeString:(id)a3 withOptions:(int64_t)a4 tokenOutput:(tokenOutput_t *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CFStringRef v8 = (const __CFString *)a3;
  uint64_t v9 = (__CFString *)v8;
  if (v8)
  {
    CFIndex Length = CFStringGetLength(v8);
    uint64_t v11 = 3 * Length + 4;
    if (Length >= 85) {
      id v12 = (uint8_t *)malloc_type_malloc(2 * v11, 0x1000040BDFB0063uLL);
    }
    else {
      id v12 = buf;
    }
    v13[0] = v9;
    v13[1] = a4;
    v13[2] = a5;
    CFStringRef v14 = v12;
    uint64_t v15 = v12;
    uint64_t v16 = v11;
    [(PSITokenizer *)self _tokenizeString:v9 withContext:v13];
    if (v14 && v14 != v12) {
      free(v14);
    }
    if (v12 && v12 != buf) {
      free(v12);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Attempted to tokenize nil string", buf, 2u);
  }
}

- (id)normalizeString:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  if ([(__CFString *)v3 length])
  {
    CFIndex v4 = 3 * [(__CFString *)v3 length] + 1;
    if (v4 >= 257) {
      v5 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
    }
    else {
      v5 = v10;
    }
    CFIndex numChars = 0;
    if (!_normalizeString(v3, (UniChar *)v5, v4, &numChars))
    {
      if (v5 != v10) {
        free(v5);
      }
      CFIndex v7 = numChars + 1;
      v5 = malloc_type_malloc(2 * (numChars + 1), 0x1000040BDFB0063uLL);
      _normalizeString(v3, (UniChar *)v5, v7, 0);
    }
    CFRange v6 = (__CFString *)CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UniChar *)v5, numChars);
    if (v5 != v10) {
      free(v5);
    }
  }
  else
  {
    CFRange v6 = v3;
  }

  return v6;
}

- (void)dealloc
{
  tagger = self->_tagger;
  if (tagger)
  {
    CFRelease(tagger);
    self->_tagger = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PSITokenizer;
  [(PSITokenizer *)&v4 dealloc];
}

+ (id)fts5StringFromString:(id)a3 useWildcard:(BOOL)a4 leadingAnchored:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  CFIndex v7 = [a3 stringByReplacingOccurrencesOfString:@"\" withString:@"\"\"];
  CFStringRef v8 = &stru_1EEB2EB80;
  if (v6) {
    CFStringRef v8 = @"*";
  }
  if (v5) {
    uint64_t v9 = @"^\"%@\"%@";
  }
  else {
    uint64_t v9 = @"\"%@\"%@";
  }
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v7, v8);

  return v10;
}

+ (id)fts5StringFromString:(id)a3 useWildcard:(BOOL)a4
{
  return (id)[a1 fts5StringFromString:a3 useWildcard:a4 leadingAnchored:0];
}

+ (id)fts5StringFromString:(id)a3 forMatchType:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Should not be calling normalize on matchType DateFilter", v10, 2u);
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = a4 == 0;
  }
  CFStringRef v8 = [a1 fts5StringFromString:v6 useWildcard:v7];

  return v8;
}

@end