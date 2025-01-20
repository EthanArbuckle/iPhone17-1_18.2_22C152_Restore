@interface _WBSFieldLabelPatternMatcherFactory
+ (__WBSFieldLabelPatternMatcherArray)createFieldLabelPatternMatcherArrayFromWordArrays:(id)a3 allowingEndOfWordMatches:(BOOL)a4;
- (_WBSFieldLabelPatternMatcherFactory)init;
- (void)_addWord:(id)a3 allowingEndOfWordMatch:(BOOL)a4;
@end

@implementation _WBSFieldLabelPatternMatcherFactory

- (_WBSFieldLabelPatternMatcherFactory)init
{
  v7.receiver = self;
  v7.super_class = (Class)_WBSFieldLabelPatternMatcherFactory;
  v2 = [(_WBSFieldLabelPatternMatcherFactory *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trie = v2->_trie;
    v2->_trie = v3;

    v5 = v2;
  }

  return v2;
}

- (void)_addWord:(id)a3 allowingEndOfWordMatch:(BOOL)a4
{
  id v19 = a3;
  uint64_t v6 = [v19 length];
  objc_super v7 = self->_trie;
  if (a4
    || !SafariShared::FieldLabelPatternMatcher::isWordCharacter((SafariShared::FieldLabelPatternMatcher *)[v19 characterAtIndex:0]))
  {
    v10 = v7;
    if (!v6)
    {
LABEL_13:
      v14 = v10;
      goto LABEL_14;
    }
  }
  else
  {
    v8 = [NSNumber numberWithUnsignedShort:0xFFFFLL];
    v9 = [(NSMutableDictionary *)v7 objectForKey:v8];

    if (v9)
    {
      v10 = [(NSMutableDictionary *)v7 objectForKey:v8];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA60] dictionary];
      v15 = [NSNumber numberWithUnsignedShort:0xFFFFLL];
      [(NSMutableDictionary *)v7 setObject:v10 forKey:v15];
    }
    if (!v6) {
      goto LABEL_13;
    }
  }
  for (uint64_t i = 0; i != v6; ++i)
  {
    uint64_t v12 = [v19 characterAtIndex:i];
    v13 = [NSNumber numberWithUnsignedShort:v12];
    v14 = [v10 objectForKey:v13];
    if (!v14)
    {
      v14 = [MEMORY[0x1E4F1CA60] dictionary];
      [v10 setObject:v14 forKey:v13];
    }

    v10 = v14;
  }
LABEL_14:
  __int16 isWordCharacter = SafariShared::FieldLabelPatternMatcher::isWordCharacter((SafariShared::FieldLabelPatternMatcher *)[v19 characterAtIndex:v6 - 1]);
  v17 = [MEMORY[0x1E4F1CA60] dictionary];
  v18 = [NSNumber numberWithUnsignedShort:(unsigned __int16)((__int16)(isWordCharacter << 15) >> 15)];
  [v14 setObject:v17 forKey:v18];
}

+ (__WBSFieldLabelPatternMatcherArray)createFieldLabelPatternMatcherArrayFromWordArrays:(id)a3 allowingEndOfWordMatches:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v37 = 0;
  uint64_t v38 = 0;
  v35 = 0;
  uint64_t v36 = 0;
  v33 = 0;
  uint64_t v34 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v9 = objc_alloc_init(_WBSFieldLabelPatternMatcherFactory);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v39 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(v10);
              }
              v14 = [*(id *)(*((void *)&v25 + 1) + 8 * j) lowercaseString];
              [(_WBSFieldLabelPatternMatcherFactory *)v9 _addWord:v14 allowingEndOfWordMatch:v4];
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v39 count:16];
          }
          while (v11);
        }

        LOWORD(v22) = addInitializersForTrie(v9->_trie, (uint64_t)&v37, (uint64_t)&v35);
        *(void *)&long long v23 = HIDWORD(v38);
        uint64_t v24 = HIDWORD(v36);
        int v15 = HIDWORD(v34);
        if (HIDWORD(v34) == v34)
        {
          unint64_t v16 = WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v33, HIDWORD(v34) + 1, (unint64_t)&v22);
          int v15 = HIDWORD(v34);
          v17 = (char *)v33 + 40 * HIDWORD(v34);
          long long v18 = *(_OWORD *)v16;
          long long v19 = *(_OWORD *)(v16 + 16);
          *((void *)v17 + 4) = *(void *)(v16 + 32);
        }
        else
        {
          v17 = (char *)v33 + 40 * HIDWORD(v34);
          long long v18 = v22;
          long long v19 = v23;
          *((void *)v17 + 4) = v24;
        }
        *(_OWORD *)v17 = v18;
        *((_OWORD *)v17 + 1) = v19;
        HIDWORD(v34) = v15 + 1;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v40 count:16];
    }
    while (v5);
  }

  WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA::State,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&v37, HIDWORD(v38));
  WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA::State,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&v35, HIDWORD(v36));
  WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&v33, HIDWORD(v34));
  operator new();
}

- (void).cxx_destruct
{
}

@end