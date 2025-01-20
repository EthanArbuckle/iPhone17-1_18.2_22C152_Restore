@interface WBSURLSuffixChecker
- (BOOL)hasSuffix:(id)a3;
- (BOOL)insertString:(id)a3 intoTrieWithCache:(id *)a4;
- (WBSURLSuffixChecker)initWithSuffixes:(id)a3;
- (void)addStringToFailedSuffixes:(id)a3;
- (void)dealloc;
@end

@implementation WBSURLSuffixChecker

- (WBSURLSuffixChecker)initWithSuffixes:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WBSURLSuffixChecker;
  v5 = [(WBSURLSuffixChecker *)&v20 init];
  if (v5)
  {
    v5->_trie = ($BB8B2815F19B946069E0C78052E8954D *)malloc_type_calloc(0x36uLL, 2uLL, 0x4266D233uLL);
    v5->_trieNodeCount = 2;
    memset(v18, 0, sizeof(v18));
    WORD1(v18[0]) = 1;
    uint64_t v19 = 1;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (!-[WBSURLSuffixChecker insertString:intoTrieWithCache:](v5, "insertString:intoTrieWithCache:", v11, v18, (void)v14))[(WBSURLSuffixChecker *)v5 addStringToFailedSuffixes:v11]; {
        }
          }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v21 count:16];
      }
      while (v8);
    }

    v12 = v5;
  }

  return v5;
}

- (BOOL)insertString:(id)a3 intoTrieWithCache:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  unint64_t Length = CFStringGetLength(v6);
  if (Length > 0x20) {
    goto LABEL_33;
  }
  unint64_t v8 = Length;
  CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  if (!CStringPtr)
  {
    CStringPtr = buffer;
    if (!CFStringGetCString(v6, buffer, 32, 0x600u)) {
      goto LABEL_33;
    }
  }
  maxunint64_t Length = self->_maxLength;
  if (maxLength <= v8) {
    maxunint64_t Length = v8;
  }
  self->_maxunint64_t Length = maxLength;
  if (*CStringPtr == 46)
  {
    unint64_t var1 = a4->var1;
    if (v8 >= var1) {
      unint64_t v12 = a4->var1;
    }
    else {
      unint64_t v12 = v8;
    }
    if (v12 >= 2)
    {
      v13 = &a4->var0[1];
      unint64_t v14 = 1;
      do
      {
        int v15 = (char)CStringPtr[v14];
        int v16 = (v15 | 0x20) - 96;
        if ((v15 | 0x20u) - 123 < 0xFFFFFFE6) {
          int v16 = -1;
        }
        if (v15 == 46) {
          int v17 = 0;
        }
        else {
          int v17 = v16;
        }
        if (v17 != v13->var0)
        {
          a4->unint64_t var1 = v14;
          unint64_t var1 = v14;
        }
        ++v14;
        if (v8 >= var1) {
          unint64_t v18 = var1;
        }
        else {
          unint64_t v18 = v8;
        }
        ++v13;
      }
      while (v14 < v18);
    }
    unint64_t v19 = var1 - 1;
    trie = self->_trie;
    a4->unint64_t var1 = v8;
    unint64_t v21 = v8 - 1;
    if (v8 - 1 <= var1 - 1)
    {
      v23 = trie;
    }
    else
    {
      p_unint64_t var1 = &a4->var0[v8 - 1].var1;
      v23 = trie;
      do
      {
        int v24 = (char)CStringPtr[v21];
        if (v24 == 46)
        {
          unsigned int v25 = 0;
        }
        else
        {
          int v26 = v24 | 0x20;
          if ((v26 - 123) < 0xFFFFFFE6) {
            goto LABEL_33;
          }
          unsigned int v25 = v26 - 96;
        }
        unsigned int trieNodeCount = v23->var0[v25];
        unsigned __int16 v28 = v25;
        if (!v23->var0[v25])
        {
          unsigned int trieNodeCount = self->_trieNodeCount;
          self->_unsigned int trieNodeCount = trieNodeCount + 1;
          v23->var0[v25] = trieNodeCount;
          v29 = ($BB8B2815F19B946069E0C78052E8954D *)malloc_type_realloc(trie, 54 * (trieNodeCount + 1), 0x10000409C08D13AuLL);
          self->_trie = v29;
          v30 = &v29[trieNodeCount];
          *(void *)&v30->var0[23] = 0;
          *(_OWORD *)&v30->var0[8] = 0u;
          *(_OWORD *)&v30->var0[16] = 0u;
          *(_OWORD *)v30->var0 = 0u;
          trie = self->_trie;
        }
        *(p_var1 - 1) = v28;
        *p_unint64_t var1 = trieNodeCount;
        p_var1 -= 2;
        v23 = &trie[trieNodeCount];
        --v21;
      }
      while (v21 > v19);
    }
    int v33 = (char)CStringPtr[v19];
    LODWORD(v34) = (v33 | 0x20) - 96;
    if ((v33 | 0x20u) - 123 < 0xFFFFFFE6) {
      uint64_t v34 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v34 = v34;
    }
    if (v33 == 46) {
      uint64_t v35 = 0;
    }
    else {
      uint64_t v35 = v34;
    }
    v23->var0[v35] = a4->var0[v19].var1;
    BOOL v31 = 1;
  }
  else
  {
LABEL_33:
    BOOL v31 = 0;
  }

  return v31;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  free(self->_trie);
  v3.receiver = self;
  v3.super_class = (Class)WBSURLSuffixChecker;
  [(WBSURLSuffixChecker *)&v3 dealloc];
}

- (void)addStringToFailedSuffixes:(id)a3
{
  id v4 = a3;
  failedSuffixes = self->_failedSuffixes;
  id v8 = v4;
  if (!failedSuffixes)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_failedSuffixes;
    self->_failedSuffixes = v6;

    id v4 = v8;
    failedSuffixes = self->_failedSuffixes;
  }
  [(NSMutableArray *)failedSuffixes addObject:v4];
}

- (BOOL)hasSuffix:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  CFStringRef v4 = (const __CFString *)a3;
  v5 = (__CFString *)v4;
  if (!v4) {
    goto LABEL_30;
  }
  unint64_t Length = CFStringGetLength(v4);
  CStringPtr = (char *)CFStringGetCStringPtr(v5, 0x600u);
  if (CStringPtr || (CStringPtr = buffer, CFStringGetCString(v5, buffer, 32, 0x600u)))
  {
    if (Length >= self->_maxLength) {
      maxunint64_t Length = self->_maxLength;
    }
    else {
      maxunint64_t Length = Length;
    }
    if (maxLength)
    {
      uint64_t v9 = &CStringPtr[Length - 1];
      trie = self->_trie;
      while (1)
      {
        int v12 = *v9--;
        int v11 = v12;
        if (v12 == 46)
        {
          int v13 = 0;
        }
        else
        {
          int v14 = v11 | 0x20;
          if ((v14 - 123) < 0xFFFFFFE6) {
            break;
          }
          int v13 = v14 - 96;
        }
        int v15 = trie->var0[v13];
        if (!v15) {
          break;
        }
        if (v15 == 1) {
          goto LABEL_19;
        }
        trie = &self->_trie[v15];
        if (!--maxLength) {
          goto LABEL_18;
        }
      }
    }
    else
    {
      trie = self->_trie;
LABEL_18:
      if (trie->var0[0] == 1)
      {
LABEL_19:
        LOBYTE(v16) = 1;
        goto LABEL_33;
      }
    }
  }
  failedSuffixes = self->_failedSuffixes;
  if (!failedSuffixes)
  {
LABEL_30:
    LOBYTE(v16) = 0;
    goto LABEL_33;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unint64_t v18 = failedSuffixes;
  uint64_t v16 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v19 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v18);
        }
        if (-[__CFString rangeOfString:options:](v5, "rangeOfString:options:", *(void *)(*((void *)&v22 + 1) + 8 * i), 15, (void)v22) != 0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v16) = 1;
          goto LABEL_32;
        }
      }
      uint64_t v16 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_32:

LABEL_33:
  return v16;
}

@end