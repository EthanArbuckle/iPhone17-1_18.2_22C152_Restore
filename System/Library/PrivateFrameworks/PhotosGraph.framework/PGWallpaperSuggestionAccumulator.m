@interface PGWallpaperSuggestionAccumulator
- (BOOL)accumulationIsComplete;
- (NSArray)suggestions;
- (PGWallpaperSuggestionAccumulator)initWithTargetNumberOfSuggestions:(unint64_t)a3 targetMinimumNumberOfGatedSuggestions:(unint64_t)a4 maximumNumberOfSuggestionsToTryForGating:(unint64_t)a5 loggingConnection:(id)a6;
- (unint64_t)numberOfGatedSuggestions;
- (void)addSuggestion:(id)a3 passingGating:(BOOL)a4;
@end

@implementation PGWallpaperSuggestionAccumulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_gatingOverflow, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

- (unint64_t)numberOfGatedSuggestions
{
  return self->_numberOfGatedSuggestions;
}

- (NSArray)suggestions
{
  unint64_t targetNumberOfSuggestions = self->_targetNumberOfSuggestions;
  uint64_t v4 = [(NSMutableArray *)self->_suggestions count];
  unint64_t v5 = targetNumberOfSuggestions - v4;
  if (targetNumberOfSuggestions != v4)
  {
    uint64_t v6 = [(NSMutableArray *)self->_gatingOverflow count];
    if (v6)
    {
      unint64_t v7 = v6;
      v8 = self->_gatingOverflow;
      v9 = v8;
      if (v7 > v5)
      {
        uint64_t v10 = -[NSMutableArray subarrayWithRange:](v8, "subarrayWithRange:", 0, v5);

        v9 = (void *)v10;
      }
      [(NSMutableArray *)self->_suggestions addObjectsFromArray:v9];
    }
  }
  suggestions = self->_suggestions;
  return (NSArray *)suggestions;
}

- (BOOL)accumulationIsComplete
{
  if ([(NSMutableArray *)self->_suggestions count] >= self->_targetNumberOfSuggestions) {
    return 1;
  }
  if (self->_numberOfSuggestionsReceived < self->_maximumNumberOfSuggestionsToTryForGating) {
    return 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_suggestions count];
  return [(NSMutableArray *)self->_gatingOverflow count] + v4 >= self->_targetNumberOfSuggestions;
}

- (void)addSuggestion:(id)a3 passingGating:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  suggestions = self->_suggestions;
  if (v4)
  {
    [(NSMutableArray *)suggestions addObject:v6];
    ++self->_numberOfGatedSuggestions;
  }
  else
  {
    unint64_t v8 = [(NSMutableArray *)suggestions count];
    v9 = self->_suggestions;
    if (v8 >= self->_targetNumberOfSuggestions
             - self->_targetMinimumNumberOfGatedSuggestions
             + self->_numberOfGatedSuggestions)
    {
      uint64_t v28 = [(NSMutableArray *)v9 count];
      if ([(NSMutableArray *)self->_gatingOverflow count] + v28 >= self->_targetNumberOfSuggestions)
      {
        loggingConnection = self->_loggingConnection;
        if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO)) {
          goto LABEL_20;
        }
        v36 = self->_suggestions;
        v15 = loggingConnection;
        LODWORD(v36) = [(NSMutableArray *)v36 count];
        unint64_t numberOfGatedSuggestions = self->_numberOfGatedSuggestions;
        unint64_t targetNumberOfSuggestions = self->_targetNumberOfSuggestions;
        unint64_t targetMinimumNumberOfGatedSuggestions = self->_targetMinimumNumberOfGatedSuggestions;
        int v40 = [(NSMutableArray *)self->_gatingOverflow count];
        int v41 = 67110144;
        *(_DWORD *)v42 = v36;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = targetNumberOfSuggestions;
        *(_WORD *)v43 = 1024;
        *(_DWORD *)&v43[2] = numberOfGatedSuggestions;
        *(_WORD *)v44 = 1024;
        *(_DWORD *)&v44[2] = targetMinimumNumberOfGatedSuggestions;
        *(_WORD *)v45 = 1024;
        *(_DWORD *)&v45[2] = v40;
        v21 = "[PGWallpaperSuggestionAccumulator] Dropping non-gated suggestion, %d / %d, gated %d / %d, overflow %d";
      }
      else
      {
        [(NSMutableArray *)self->_gatingOverflow addObject:v6];
        v29 = self->_loggingConnection;
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
          goto LABEL_20;
        }
        v30 = self->_suggestions;
        v15 = v29;
        LODWORD(v30) = [(NSMutableArray *)v30 count];
        unint64_t v31 = self->_numberOfGatedSuggestions;
        unint64_t v32 = self->_targetNumberOfSuggestions;
        unint64_t v33 = self->_targetMinimumNumberOfGatedSuggestions;
        int v34 = [(NSMutableArray *)self->_gatingOverflow count];
        int v41 = 67110144;
        *(_DWORD *)v42 = v30;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = v32;
        *(_WORD *)v43 = 1024;
        *(_DWORD *)&v43[2] = v31;
        *(_WORD *)v44 = 1024;
        *(_DWORD *)&v44[2] = v33;
        *(_WORD *)v45 = 1024;
        *(_DWORD *)&v45[2] = v34;
        v21 = "[PGWallpaperSuggestionAccumulator] Sparing non-gated suggestion, %d / %d, gated %d / %d, overflow %d";
      }
      v22 = v15;
      uint32_t v23 = 32;
LABEL_19:
      _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v41, v23);

      goto LABEL_20;
    }
    [(NSMutableArray *)v9 addObject:v6];
  }
  unint64_t v10 = self->_targetMinimumNumberOfGatedSuggestions;
  v11 = self->_loggingConnection;
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      if (v4) {
        v13 = @"gated";
      }
      else {
        v13 = @"non-gated";
      }
      v14 = self->_suggestions;
      v15 = v11;
      int v16 = [(NSMutableArray *)v14 count];
      unint64_t v17 = self->_numberOfGatedSuggestions;
      unint64_t v18 = self->_targetNumberOfSuggestions;
      unint64_t v19 = self->_targetMinimumNumberOfGatedSuggestions;
      int v20 = [(NSMutableArray *)self->_gatingOverflow count];
      int v41 = 138413570;
      *(void *)v42 = v13;
      *(_WORD *)&v42[8] = 1024;
      *(_DWORD *)v43 = v16;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)v44 = v18;
      *(_WORD *)&v44[4] = 1024;
      *(_DWORD *)v45 = v17;
      *(_WORD *)&v45[4] = 1024;
      int v46 = v19;
      __int16 v47 = 1024;
      int v48 = v20;
      v21 = "[PGWallpaperSuggestionAccumulator] Adding %@ suggestion, %d / %d, gated %d / %d, overflow %d";
      v22 = v15;
      uint32_t v23 = 42;
      goto LABEL_19;
    }
  }
  else if (v12)
  {
    v24 = self->_suggestions;
    v25 = v11;
    int v26 = [(NSMutableArray *)v24 count];
    unint64_t v27 = self->_targetNumberOfSuggestions;
    int v41 = 67109376;
    *(_DWORD *)v42 = v26;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v27;
    _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAccumulator] Adding suggestion, %d / %d", (uint8_t *)&v41, 0xEu);
  }
LABEL_20:
  ++self->_numberOfSuggestionsReceived;
}

- (PGWallpaperSuggestionAccumulator)initWithTargetNumberOfSuggestions:(unint64_t)a3 targetMinimumNumberOfGatedSuggestions:(unint64_t)a4 maximumNumberOfSuggestionsToTryForGating:(unint64_t)a5 loggingConnection:(id)a6
{
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PGWallpaperSuggestionAccumulator;
  BOOL v12 = [(PGWallpaperSuggestionAccumulator *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_unint64_t targetNumberOfSuggestions = a3;
    v12->_unint64_t targetMinimumNumberOfGatedSuggestions = a4;
    v12->_maximumNumberOfSuggestionsToTryForGating = a5;
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    suggestions = v13->_suggestions;
    v13->_suggestions = v14;

    int v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    gatingOverflow = v13->_gatingOverflow;
    v13->_gatingOverflow = v16;

    objc_storeStrong((id *)&v13->_loggingConnection, a6);
  }

  return v13;
}

@end