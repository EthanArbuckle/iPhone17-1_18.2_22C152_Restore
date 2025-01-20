@interface PSIWordEmbeddingTable
- (BOOL)isInsertedWithWord:(id)a3;
- (PSIWordEmbeddingTable)initWithDelegate:(id)a3 searchable:(BOOL)a4 writable:(BOOL)a5 locale:(id)a6;
- (id)dumpWordEmbeddingTable;
- (id)matchesForToken:(id)a3;
- (id)wordEmbeddingsForToken:(id)a3;
- (void)cacheSearchableStatements;
- (void)cacheWritableStatements;
- (void)clear;
- (void)finalizze;
- (void)insertWord:(id)a3 synonyms:(id)a4;
- (void)removeWord:(id)a3;
@end

@implementation PSIWordEmbeddingTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectStatement, 0);
  objc_storeStrong((id *)&self->_selectMatchesStatement, 0);
  objc_storeStrong((id *)&self->_checkStatement, 0);
  objc_storeStrong((id *)&self->_deletePrefixStatement, 0);
  objc_storeStrong((id *)&self->_deleteStatement, 0);
  objc_storeStrong((id *)&self->_insertPrefixStatement, 0);
  objc_storeStrong((id *)&self->_insertStatement, 0);
}

- (void)removeWord:(id)a3
{
  id v4 = a3;
  id v5 = [(PSITable *)self delegate];
  [(PSIStatement *)self->_deletePrefixStatement bindText:v4 atIndex:1];
  [v5 executeStatement:self->_deletePrefixStatement];
  [(PSIStatement *)self->_deleteStatement bindText:v4 atIndex:1];

  [v5 executeStatement:self->_deleteStatement];
}

- (void)insertWord:(id)a3 synonyms:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PSITable *)self delegate];
  if (![(PSIWordEmbeddingTable *)self isInsertedWithWord:v6])
  {
    v9 = [v6 lowercaseString];
    v10 = (void *)NLStringEmbeddingCopyNeighbors();
    if ([v10 count])
    {
      id v18 = v6;
      [(PSIStatement *)self->_insertStatement bindText:v6 atIndex:1];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v17 = v10;
      id obj = v10;
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        char v19 = 0;
        uint64_t v13 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            if (([v7 containsObject:v15] & 1) == 0)
            {
              [(PSIStatement *)self->_insertStatement bindText:v15 atIndex:2];
              NLStringEmbeddingGetDistance();
              [(PSIStatement *)self->_insertStatement bindDouble:3 atIndex:v16 * -0.5 + 1.0];
              [v8 executeStatement:self->_insertStatement];
              char v19 = 1;
              -[PSIStatement bindInt64:atIndex:](self->_insertPrefixStatement, "bindInt64:atIndex:", [v8 lastInsertedRowID], 1);
              [(PSIStatement *)self->_insertPrefixStatement bindText:v15 atIndex:2];
              [v8 executeStatement:self->_insertPrefixStatement];
            }
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v12);
      }
      else
      {
        char v19 = 0;
      }

      CFRelease(v9);
      v10 = v17;
      id v6 = v18;
      if (v19) {
        goto LABEL_17;
      }
    }
    else
    {
      CFRelease(v9);
    }
    [(PSIStatement *)self->_insertStatement bindText:v6 atIndex:1];
    [(PSIStatement *)self->_insertStatement bindText:@"__STUB__" atIndex:2];
    [(PSIStatement *)self->_insertStatement bindDouble:3 atIndex:0.0];
    [v8 executeStatement:self->_insertStatement];
LABEL_17:
  }
}

- (BOOL)isInsertedWithWord:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  [(PSIStatement *)self->_checkStatement bindText:v4 atIndex:1];
  id v5 = [(PSITable *)self delegate];
  checkStatement = self->_checkStatement;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PSIWordEmbeddingTable_isInsertedWithWord___block_invoke;
  v8[3] = &unk_1E58734C0;
  v8[4] = &v9;
  [v5 executeStatement:checkStatement withResultEnumerationBlock:v8];
  LOBYTE(self) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

uint64_t __44__PSIWordEmbeddingTable_isInsertedWithWord___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 int64AtColumn:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  *a3 = 1;
  return result;
}

- (id)wordEmbeddingsForToken:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  [(PSIStatement *)self->_selectStatement bindText:v5 atIndex:1];

  id v7 = [(PSITable *)self delegate];
  selectStatement = self->_selectStatement;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__PSIWordEmbeddingTable_wordEmbeddingsForToken___block_invoke;
  v11[3] = &unk_1E5873708;
  id v9 = v6;
  id v12 = v9;
  [v7 executeStatement:selectStatement withResultEnumerationBlock:v11];

  return v9;
}

void __48__PSIWordEmbeddingTable_wordEmbeddingsForToken___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 textAtColumn:0];
  if (v3)
  {
    [v10 doubleAtColumn:1];
    double v5 = v4;
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    id v7 = v6;
    if (!v6 || ([v6 doubleValue], v5 > v8))
    {
      id v9 = [NSNumber numberWithDouble:v5];
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v3];
    }
  }
}

- (id)matchesForToken:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 array];
  [(PSIStatement *)self->_selectMatchesStatement bindText:v5 atIndex:1];

  id v7 = [(PSITable *)self delegate];
  selectMatchesStatement = self->_selectMatchesStatement;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__PSIWordEmbeddingTable_matchesForToken___block_invoke;
  v11[3] = &unk_1E5873708;
  id v9 = v6;
  id v12 = v9;
  [v7 executeStatement:selectMatchesStatement withResultEnumerationBlock:v11];

  return v9;
}

void __41__PSIWordEmbeddingTable_matchesForToken___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 textAtColumn:0];
  uint64_t v4 = [v8 textAtColumn:1];
  id v5 = (void *)v4;
  if (v3 && v4)
  {
    [v8 doubleAtColumn:2];
    id v7 = [[PSIWordEmbeddingMatch alloc] initWithWord:v3 extendedWord:v5 score:v6];
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (id)dumpWordEmbeddingTable
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(PSITable *)self delegate];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__PSIWordEmbeddingTable_dumpWordEmbeddingTable__block_invoke;
  v12[3] = &unk_1E5873708;
  id v5 = v3;
  id v13 = v5;
  [v4 executeStatementFromString:@"SELECT rowid, word, extended_word, score from word_embedding", v12 withResultEnumerationBlock];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__PSIWordEmbeddingTable_dumpWordEmbeddingTable__block_invoke_2;
  v10[3] = &unk_1E5873708;
  id v6 = v5;
  id v11 = v6;
  [v4 executeStatementFromString:@"SELECT rowid, extended_word from word_embedding_prefix", v10 withResultEnumerationBlock];
  id v7 = v11;
  id v8 = v6;

  return v8;
}

void __47__PSIWordEmbeddingTable_dumpWordEmbeddingTable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 int64AtColumn:0];
  id v9 = [v3 textAtColumn:1];
  id v5 = [v3 textAtColumn:2];
  [v3 doubleAtColumn:3];
  uint64_t v7 = v6;

  id v8 = [NSString stringWithFormat:@"%llu: %@ <- %@ (%f)", v4, v9, v5, v7];
  [*(id *)(a1 + 32) addObject:v8];
}

void __47__PSIWordEmbeddingTable_dumpWordEmbeddingTable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 int64AtColumn:0];
  id v6 = [v3 textAtColumn:1];

  id v5 = [NSString stringWithFormat:@"%lld: %@", v4, v6];
  [*(id *)(a1 + 32) addObject:v5];
}

- (void)cacheSearchableStatements
{
  id v7 = [(PSITable *)self delegate];
  id v3 = [v7 statementFromString:@"SELECT word, extended_word, score FROM word_embedding WHERE rowid IN (SELECT rowid FROM word_embedding_prefix WHERE extended_word MATCH ?)"];
  selectMatchesStatement = self->_selectMatchesStatement;
  self->_selectMatchesStatement = v3;

  id v5 = [v7 statementFromString:@"SELECT word, score FROM word_embedding WHERE rowid IN (SELECT rowid FROM word_embedding_prefix WHERE extended_word MATCH ?)"];
  selectStatement = self->_selectStatement;
  self->_selectStatement = v5;
}

- (void)cacheWritableStatements
{
  id v13 = [(PSITable *)self delegate];
  id v3 = [v13 statementFromString:@"INSERT INTO word_embedding(word, extended_word, score) VALUES(?, ?, ?)"];
  insertStatement = self->_insertStatement;
  self->_insertStatement = v3;

  id v5 = [v13 statementFromString:@"INSERT INTO word_embedding_prefix(rowid, extended_word) VALUES(?, ?)"];
  insertPrefixStatement = self->_insertPrefixStatement;
  self->_insertPrefixStatement = v5;

  [v13 statementFromString:@"DELETE FROM word_embedding WHERE word = ?"];
  id v7 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
  deleteStatement = self->_deleteStatement;
  self->_deleteStatement = v7;

  [v13 statementFromString:@"DELETE FROM word_embedding_prefix WHERE rowid IN (SELECT rowid FROM word_embedding WHERE word = ?)"];
  id v9 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
  deletePrefixStatement = self->_deletePrefixStatement;
  self->_deletePrefixStatement = v9;

  [v13 statementFromString:@"SELECT rowid FROM word_embedding WHERE word = ?"];
  id v11 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
  checkStatement = self->_checkStatement;
  self->_checkStatement = v11;
}

- (void)clear
{
  id v2 = [(PSITable *)self delegate];
  [v2 executeStatementFromString:@"DROP TABLE IF EXISTS word_embedding_prefix"];
  [v2 executeStatementFromString:@"DROP TABLE IF EXISTS word_embedding"];
}

- (void)finalizze
{
  insertStatement = self->_insertStatement;
  if (insertStatement)
  {
    [(PSIStatement *)insertStatement finalizze];
    uint64_t v4 = self->_insertStatement;
    self->_insertStatement = 0;
  }
  insertPrefixStatement = self->_insertPrefixStatement;
  if (insertPrefixStatement)
  {
    [(PSIStatement *)insertPrefixStatement finalizze];
    id v6 = self->_insertPrefixStatement;
    self->_insertPrefixStatement = 0;
  }
  deleteStatement = self->_deleteStatement;
  if (deleteStatement)
  {
    [(PSIStatement *)deleteStatement finalizze];
    id v8 = self->_deleteStatement;
    self->_deleteStatement = 0;
  }
  deletePrefixStatement = self->_deletePrefixStatement;
  if (deletePrefixStatement)
  {
    [(PSIStatement *)deletePrefixStatement finalizze];
    id v10 = self->_deletePrefixStatement;
    self->_deletePrefixStatement = 0;
  }
  checkStatement = self->_checkStatement;
  if (checkStatement)
  {
    [(PSIStatement *)checkStatement finalizze];
    id v12 = self->_checkStatement;
    self->_checkStatement = 0;
  }
  selectMatchesStatement = self->_selectMatchesStatement;
  if (selectMatchesStatement)
  {
    [(PSIStatement *)selectMatchesStatement finalizze];
    v14 = self->_selectMatchesStatement;
    self->_selectMatchesStatement = 0;
  }
  selectStatement = self->_selectStatement;
  if (selectStatement)
  {
    [(PSIStatement *)selectStatement finalizze];
    float v16 = self->_selectStatement;
    self->_selectStatement = 0;
  }
  locale = self->_locale;
  if (locale)
  {
    CFRelease(locale);
    self->_locale = 0;
  }
  embeddingRef = self->_embeddingRef;
  if (embeddingRef)
  {
    CFRelease(embeddingRef);
    self->_embeddingRef = 0;
  }
  v19.receiver = self;
  v19.super_class = (Class)PSIWordEmbeddingTable;
  [(PSITable *)&v19 finalizze];
}

- (PSIWordEmbeddingTable)initWithDelegate:(id)a3 searchable:(BOOL)a4 writable:(BOOL)a5 locale:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v25[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PSIWordEmbeddingTable;
  id v12 = [(PSITable *)&v23 initWithDelegate:v10 searchable:v8 writable:v7];
  if (v12)
  {
    if (v7)
    {
      [v10 executeStatementFromString:@"CREATE TABLE IF NOT EXISTS word_embedding(word TEXT, extended_word TEXT, score DOUBLE)"];
      [v10 executeStatementFromString:@"CREATE INDEX IF NOT EXISTS word_embedding_index ON word_embedding(word)"];
      [v10 executeStatementFromString:@"CREATE VIRTUAL TABLE IF NOT EXISTS word_embedding_prefix USING fts5(extended_word)"];
      [(PSIWordEmbeddingTable *)v12 cacheWritableStatements];
    }
    if (v8)
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __69__PSIWordEmbeddingTable_initWithDelegate_searchable_writable_locale___block_invoke;
      v18[3] = &unk_1E58734C0;
      v18[4] = &v19;
      [v10 executeStatementFromString:@"SELECT name FROM sqlite_master WHERE type='table' AND name='word_embedding'" withResultEnumerationBlock:v18];
      if (*((unsigned char *)v20 + 24))
      {
        [(PSIWordEmbeddingTable *)v12 cacheSearchableStatements];
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Word Embedding table doesn't exist, probably racing with assetsd", v17, 2u);
      }
      _Block_object_dispose(&v19, 8);
    }
    id v13 = (__CFLocale *)CFRetain(v11);
    v12->_locale = v13;
    uint64_t v14 = *MEMORY[0x1E4F5C890];
    v24[0] = *MEMORY[0x1E4F5C8A0];
    v24[1] = v14;
    v25[0] = *MEMORY[0x1E4F5C8A8];
    v25[1] = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    v12->_embeddingRef = (void *)NLStringEmbeddingCreateWithOptions();
  }
  return v12;
}

uint64_t __69__PSIWordEmbeddingTable_initWithDelegate_searchable_writable_locale___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

@end