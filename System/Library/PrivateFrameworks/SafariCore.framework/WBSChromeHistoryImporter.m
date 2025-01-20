@interface WBSChromeHistoryImporter
- (BOOL)_checkNotAtRootLevel;
- (BOOL)_isParsingVisit;
- (BOOL)_isParsingVisitArray;
- (BOOL)jsonReader:(id)a3 appendKey:(id)a4;
- (BOOL)jsonReader:(id)a3 error:(id)a4;
- (BOOL)jsonReader:(id)a3 scalarValue:(id)a4;
- (BOOL)jsonReaderBeginArray:(id)a3;
- (BOOL)jsonReaderBeginObject:(id)a3;
- (BOOL)jsonReaderEndArray:(id)a3;
- (BOOL)jsonReaderEndObject:(id)a3;
- (BOOL)parseFileHandle:(id)a3 error:(id *)a4;
- (BOOL)parseURL:(id)a3 error:(id *)a4;
- (WBSHistoryImporterDelegate)delegate;
- (double)ageLimit;
- (id)_popKeyFromStackIfPossible;
- (void)setAgeLimit:(double)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WBSChromeHistoryImporter

- (BOOL)parseURL:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28CB0], "safari_fileHandleWithURL:options:createMode:error:", a3, 0, 0, a4);
  if (v6) {
    BOOL v7 = [(WBSChromeHistoryImporter *)self parseFileHandle:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)parseFileHandle:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  id v6 = a3;
  BOOL v7 = objc_alloc_init(WBSJSONReader);
  [(WBSJSONReader *)v7 setDelegate:self];
  lastError = self->_lastError;
  self->_lastError = 0;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  stack = self->_stack;
  self->_stack = v9;

  self->_foundVisitArray = 0;
  BOOL v11 = [(WBSJSONReader *)v7 parseFileHandle:v6 error:a4];

  v12 = self->_lastError;
  if (!self->_foundVisitArray && !v12)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"Could not find chrome history visit array in JSON file";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v15 = [v13 errorWithDomain:@"com.apple.Safari.Core.WBSChromeHistoryImporterErrorDomain" code:2 userInfo:v14];
    v16 = self->_lastError;
    self->_lastError = v15;

    BOOL v11 = 0;
    v12 = self->_lastError;
  }
  if (a4 && !*a4) {
    *a4 = v12;
  }
  if (v12) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v11;
  }

  return v17;
}

- (BOOL)_checkNotAtRootLevel
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_stack count];
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"Root node is expected to be a dictionary";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v6 = [v4 errorWithDomain:@"com.apple.Safari.Core.WBSChromeHistoryImporterErrorDomain" code:1 userInfo:v5];
    lastError = self->_lastError;
    self->_lastError = v6;
  }
  return v3 != 0;
}

- (BOOL)_isParsingVisitArray
{
  v5[3] = *MEMORY[0x1E4F143B8];
  stack = self->_stack;
  v5[0] = &unk_1F1086200;
  v5[1] = @"Browser History";
  v5[2] = &unk_1F1086218;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  LOBYTE(stack) = [(NSMutableArray *)stack isEqual:v3];

  return (char)stack;
}

- (BOOL)_isParsingVisit
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  stack = self->_stack;
  v5[0] = &unk_1F1086200;
  v5[1] = @"Browser History";
  v5[2] = &unk_1F1086218;
  v5[3] = &unk_1F1086200;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  LOBYTE(stack) = [(NSMutableArray *)stack isEqual:v3];

  return (char)stack;
}

- (id)_popKeyFromStackIfPossible
{
  uint64_t v3 = [(NSMutableArray *)self->_stack lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(NSMutableArray *)self->_stack lastObject];
    [(NSMutableArray *)self->_stack removeLastObject];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)jsonReader:(id)a3 appendKey:(id)a4
{
  return 1;
}

- (BOOL)jsonReader:(id)a3 error:(id)a4
{
  return 0;
}

- (BOOL)jsonReader:(id)a3 scalarValue:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(WBSChromeHistoryImporter *)self _checkNotAtRootLevel];
  if (v7)
  {
    v8 = [(WBSChromeHistoryImporter *)self _popKeyFromStackIfPossible];
    if ([v8 isEqualToString:@"url"]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
      url = self->_url;
      self->_url = v9;

      if (!self->_url)
      {
        BOOL v11 = WBS_LOG_CHANNEL_PREFIXImport();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[WBSChromeHistoryImporter jsonReader:scalarValue:]((uint64_t)v6, v11);
        }
      }
    }
    else if ([v8 isEqualToString:@"title"] {
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    }
    {
      objc_storeStrong((id *)&self->_title, a4);
    }
    else if ([v8 isEqualToString:@"time_usec"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        self->_visitTime = [v6 integerValue];
      }
    }
  }
  return v7;
}

- (BOOL)jsonReaderBeginArray:(id)a3
{
  BOOL v4 = [(WBSChromeHistoryImporter *)self _checkNotAtRootLevel];
  if (v4)
  {
    [(NSMutableArray *)self->_stack addObject:&unk_1F1086218];
    if ([(WBSChromeHistoryImporter *)self _isParsingVisitArray]) {
      self->_foundVisitArray = 1;
    }
  }
  return v4;
}

- (BOOL)jsonReaderBeginObject:(id)a3
{
  [(NSMutableArray *)self->_stack addObject:&unk_1F1086200];
  if ([(WBSChromeHistoryImporter *)self _isParsingVisit])
  {
    url = self->_url;
    self->_url = 0;

    self->_visitTime = 0;
  }
  return 1;
}

- (BOOL)jsonReaderEndArray:(id)a3
{
  [(NSMutableArray *)self->_stack removeLastObject];
  id v4 = [(WBSChromeHistoryImporter *)self _popKeyFromStackIfPossible];
  return 1;
}

- (BOOL)jsonReaderEndObject:(id)a3
{
  id v4 = a3;
  if ([(WBSChromeHistoryImporter *)self _isParsingVisit])
  {
    v5 = (void *)MEMORY[0x1BA9BCF20]();
    if (!self->_url)
    {
      id v6 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[WBSChromeHistoryImporter jsonReaderEndObject:](v6);
      }
    }
    unint64_t visitTime = self->_visitTime;
    if (!visitTime)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[WBSChromeHistoryImporter jsonReaderEndObject:](v8);
      }
      unint64_t visitTime = self->_visitTime;
    }
    double v9 = WBSUnixTimeInMicrosecondsToTimeInterval(visitTime);
    if (self->_url)
    {
      if (self->_visitTime)
      {
        double v10 = v9;
        if (v9 >= self->_ageLimit)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v12 = [(NSURL *)self->_url absoluteString];
          [WeakRetained addVisitWithURLString:v12 visitTime:self->_title title:1 loadSuccessful:0 httpGet:0 redirectSourceURLString:1 redirectSourceVisitTime:v10 visitCount:0.0];
        }
      }
    }
  }
  [(NSMutableArray *)self->_stack removeLastObject];
  id v13 = [(WBSChromeHistoryImporter *)self _popKeyFromStackIfPossible];

  return 1;
}

- (WBSHistoryImporterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSHistoryImporterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)ageLimit
{
  return self->_ageLimit;
}

- (void)setAgeLimit:(double)a3
{
  self->_ageLimit = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
}

- (void)jsonReader:(uint64_t)a1 scalarValue:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138739971;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Invalid URL: %{sensitive}@", (uint8_t *)&v2, 0xCu);
}

- (void)jsonReaderEndObject:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Incomplete visit. Missing timestamp.", v1, 2u);
}

- (void)jsonReaderEndObject:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Incomplete visit. Missing URL.", v1, 2u);
}

@end