@interface PXPeopleSuggestionManager
- (BOOL)_fetchingSuggestions;
- (BOOL)canUndo;
- (BOOL)didReachEnd;
- (BOOL)isLoading;
- (BOOL)isSuggestionConfirmed:(id)a3;
- (BOOL)mute;
- (NSArray)currentSuggestions;
- (NSMutableSet)confirmedSuggestions;
- (NSMutableSet)rejectedSuggestions;
- (NSMutableSet)skippedSuggestions;
- (PXPeoplePagingSuggestionProvider)suggestionProvider;
- (PXPeopleSuggestionManager)init;
- (PXPeopleSuggestionManager)initWithPerson:(id)a3;
- (PXPeopleSuggestionManagerDataSource)dataSource;
- (PXPeopleSuggestionManagerDelegate)delegate;
- (PXPerson)person;
- (PXSuggestionToken)suggestionToken;
- (id)_nonSkippedSuggestionsForSuggestions:(id)a3;
- (id)commitUserResponsesToPerson:(id)a3;
- (unint64_t)autoConfirmationsCount;
- (unint64_t)userConfirmationsCount;
- (unsigned)_soundIdWithFilename:(id)a3;
- (unsigned)confirmNoSoundID;
- (unsigned)confirmYesSoundID;
- (void)_loadMoreSuggestionsWithCompletion:(id)a3;
- (void)_notifyDelegateWeHaveMoreSuggestions:(BOOL)a3;
- (void)_playConfirmNoSound;
- (void)_playConfirmYesSound;
- (void)cancelPendingSuggestionLoading;
- (void)commitUserResponses;
- (void)dealloc;
- (void)markSuggestions:(id)a3 confirmed:(BOOL)a4 wantsSound:(BOOL)a5;
- (void)markSuggestionsAsSkipped:(id)a3;
- (void)preloadSounds;
- (void)removeAllSuggestions;
- (void)requestNextSuggestion;
- (void)requestNextSuggestionsWithPageLimit:(unint64_t)a3;
- (void)setAutoConfirmationsCount:(unint64_t)a3;
- (void)setConfirmNoSoundID:(unsigned int)a3;
- (void)setConfirmYesSoundID:(unsigned int)a3;
- (void)setConfirmedSuggestions:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidReachEnd:(BOOL)a3;
- (void)setMute:(BOOL)a3;
- (void)setPerson:(id)a3;
- (void)setRejectedSuggestions:(id)a3;
- (void)setSkippedSuggestions:(id)a3;
- (void)setSuggestionProvider:(id)a3;
- (void)setSuggestionToken:(id)a3;
- (void)setUserConfirmationsCount:(unint64_t)a3;
- (void)undo;
@end

@implementation PXPeopleSuggestionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skippedSuggestions, 0);
  objc_storeStrong((id *)&self->_rejectedSuggestions, 0);
  objc_storeStrong((id *)&self->_confirmedSuggestions, 0);
  objc_storeStrong((id *)&self->_suggestionProvider, 0);
  objc_storeStrong((id *)&self->_suggestionToken, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSkippedSuggestions:(id)a3
{
}

- (NSMutableSet)skippedSuggestions
{
  return self->_skippedSuggestions;
}

- (void)setRejectedSuggestions:(id)a3
{
}

- (NSMutableSet)rejectedSuggestions
{
  return self->_rejectedSuggestions;
}

- (void)setConfirmedSuggestions:(id)a3
{
}

- (NSMutableSet)confirmedSuggestions
{
  return self->_confirmedSuggestions;
}

- (void)setSuggestionProvider:(id)a3
{
}

- (PXPeoplePagingSuggestionProvider)suggestionProvider
{
  return self->_suggestionProvider;
}

- (void)setConfirmNoSoundID:(unsigned int)a3
{
  self->_confirmNoSoundID = a3;
}

- (unsigned)confirmNoSoundID
{
  return self->_confirmNoSoundID;
}

- (void)setConfirmYesSoundID:(unsigned int)a3
{
  self->_confirmYesSoundID = a3;
}

- (unsigned)confirmYesSoundID
{
  return self->_confirmYesSoundID;
}

- (void)setSuggestionToken:(id)a3
{
}

- (PXSuggestionToken)suggestionToken
{
  return self->_suggestionToken;
}

- (void)setDidReachEnd:(BOOL)a3
{
  self->_didReachEnd = a3;
}

- (BOOL)didReachEnd
{
  return self->_didReachEnd;
}

- (void)setAutoConfirmationsCount:(unint64_t)a3
{
  self->_autoConfirmationsCount = a3;
}

- (unint64_t)autoConfirmationsCount
{
  return self->_autoConfirmationsCount;
}

- (void)setUserConfirmationsCount:(unint64_t)a3
{
  self->_userConfirmationsCount = a3;
}

- (unint64_t)userConfirmationsCount
{
  return self->_userConfirmationsCount;
}

- (void)setPerson:(id)a3
{
}

- (PXPerson)person
{
  return self->_person;
}

- (void)setMute:(BOOL)a3
{
  self->_mute = a3;
}

- (BOOL)mute
{
  return self->_mute;
}

- (PXPeopleSuggestionManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDelegate:(id)a3
{
}

- (PXPeopleSuggestionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPeopleSuggestionManagerDelegate *)WeakRetained;
}

- (BOOL)_fetchingSuggestions
{
  v2 = [(PXPeopleSuggestionManager *)self suggestionToken];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_nonSkippedSuggestionsForSuggestions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXPeopleSuggestionManager *)self skippedSuggestions];
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "px_localIdentifier", (void)v16);
        char v14 = [v5 containsObject:v13];

        if ((v14 & 1) == 0) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)_notifyDelegateWeHaveMoreSuggestions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v5 = [(PXPeopleSuggestionManager *)self delegate];
  if (v3)
  {
    v6 = [(PXPeopleSuggestionManager *)self currentSuggestions];
    [v5 suggestionManager:self hasNewSuggestionsAvailable:v6];
  }
  else
  {
    if (PFOSVariantHasInternalUI())
    {
      id v7 = [(PXPeopleSuggestionManager *)self confirmedSuggestions];
      uint64_t v8 = [(PXPeopleSuggestionManager *)self rejectedSuggestions];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v41 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = 0;
        uint64_t v13 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v9);
            }
            v12 += [*(id *)(*((void *)&v28 + 1) + 8 * i) numberOfAssets];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v41 count:16];
        }
        while (v11);
      }
      else
      {
        uint64_t v12 = 0;
      }

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = v8;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v40 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = 0;
        uint64_t v19 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v15);
            }
            v18 += objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "numberOfAssets", (void)v24);
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v40 count:16];
        }
        while (v17);
      }
      else
      {
        uint64_t v18 = 0;
      }

      uint64_t v21 = PLUIGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = [v9 count];
        uint64_t v23 = [v15 count];
        *(_DWORD *)buf = 134218752;
        uint64_t v33 = v22;
        __int16 v34 = 2048;
        uint64_t v35 = v12;
        __int16 v36 = 2048;
        uint64_t v37 = v23;
        __int16 v38 = 2048;
        uint64_t v39 = v18;
        _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_DEBUG, "[People Suggestions Done] Confirmed:%lu Suggestions (%lu faces)   Rejected:%lu Suggestions (%lu faces)", buf, 0x2Au);
      }
    }
    objc_msgSend(v5, "noMoreSuggestionsAvailableForSuggestionManager:", self, (void)v24);
  }
}

- (void)_loadMoreSuggestionsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PXPeopleSuggestionManager *)self dataSource];
  v6 = [(PXPeopleSuggestionManager *)self delegate];
  id v7 = [(PXPeopleSuggestionManager *)self person];
  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      [v6 willLoadMoreSuggestionsForSuggestionManager:self];
    }
    char v14 = v6;
    objc_initWeak(&location, self);
    uint64_t v8 = [(PXPeopleSuggestionManager *)self confirmedSuggestions];
    id v9 = [v8 allObjects];
    uint64_t v10 = [(PXPeopleSuggestionManager *)self rejectedSuggestions];
    uint64_t v11 = [v10 allObjects];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__PXPeopleSuggestionManager__loadMoreSuggestionsWithCompletion___block_invoke;
    v15[3] = &unk_1E5DCB600;
    objc_copyWeak(&v17, &location);
    id v16 = v4;
    uint64_t v12 = v5;
    uint64_t v13 = [v5 suggestionsForPerson:v7 withConfirmedSuggestions:v9 andRejectedSuggestions:v11 completion:v15];
    [(PXPeopleSuggestionManager *)self setSuggestionToken:v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    v5 = v12;
    v6 = v14;
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __64__PXPeopleSuggestionManager__loadMoreSuggestionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setSuggestionToken:0];

  id v6 = objc_loadWeakRetained(v3);
  id v11 = [v6 _nonSkippedSuggestionsForSuggestions:v4];

  uint64_t v7 = [v11 count];
  if (v7)
  {
    id v8 = objc_loadWeakRetained(v3);
    id v9 = [v8 suggestionProvider];
    [v9 appendSuggestionArray:v11];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, BOOL))(v10 + 16))(v10, v7 != 0);
  }
}

- (void)_playConfirmNoSound
{
  LODWORD(v3) = [(PXPeopleSuggestionManager *)self confirmNoSoundID];
  if (!v3)
  {
    uint64_t v3 = [(PXPeopleSuggestionManager *)self _soundIdWithFilename:@"PXPeopleConfirmNo"];
    [(PXPeopleSuggestionManager *)self setConfirmNoSoundID:v3];
  }
  BOOL v4 = [(PXPeopleSuggestionManager *)self mute];
  if (v3 && !v4)
  {
    AudioServicesPlaySystemSound(v3);
  }
}

- (void)_playConfirmYesSound
{
  LODWORD(v3) = [(PXPeopleSuggestionManager *)self confirmYesSoundID];
  if (!v3)
  {
    uint64_t v3 = [(PXPeopleSuggestionManager *)self _soundIdWithFilename:@"PXPeopleConfirmYes"];
    [(PXPeopleSuggestionManager *)self setConfirmYesSoundID:v3];
  }
  BOOL v4 = [(PXPeopleSuggestionManager *)self mute];
  if (v3 && !v4)
  {
    AudioServicesPlaySystemSound(v3);
  }
}

- (unsigned)_soundIdWithFilename:(id)a3
{
  SystemSoundID outSystemSoundID = 0;
  uint64_t v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = objc_msgSend(v3, "px_bundle");
  id v6 = [v5 pathForResource:v4 ofType:@"caf"];

  if ([v6 length])
  {
    CFURLRef v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
    AudioServicesCreateSystemSoundID(v7, &outSystemSoundID);

    SystemSoundID v8 = outSystemSoundID;
  }
  else
  {
    SystemSoundID v8 = 0;
  }

  return v8;
}

- (void)cancelPendingSuggestionLoading
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXPeopleSuggestionManager *)self suggestionToken];
  if (v3)
  {
    id v4 = [(PXPeopleSuggestionManager *)self dataSource];
    v5 = [(PXPeopleSuggestionManager *)self person];
    id v10 = 0;
    int v6 = [v4 cancelSuggestionForPerson:v5 withToken:v3 error:&v10];
    id v7 = v10;

    SystemSoundID v8 = PLUIGetLog();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "Suggestions UI: Cancel loading more suggestions", buf, 2u);
      }

      [(PXPeopleSuggestionManager *)self setSuggestionToken:0];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Error cancelling suggestion request %@", buf, 0xCu);
      }
    }
  }
}

- (id)commitUserResponsesToPerson:(id)a3
{
  id v4 = a3;
  if ([(PXPeopleSuggestionManager *)self _fetchingSuggestions]) {
    [(PXPeopleSuggestionManager *)self cancelPendingSuggestionLoading];
  }
  v5 = [(PXPeopleSuggestionManager *)self confirmedSuggestions];
  int v6 = [(PXPeopleSuggestionManager *)self rejectedSuggestions];
  uint64_t v7 = [(PXPeopleSuggestionManager *)self person];
  SystemSoundID v8 = v4;
  if (v7)
  {
    id v9 = (void *)v7;
    if ([v5 count])
    {
    }
    else
    {
      uint64_t v10 = [v6 count];

      SystemSoundID v8 = v4;
      if (!v10) {
        goto LABEL_8;
      }
    }
    id v11 = [(PXPeopleSuggestionManager *)self dataSource];
    id v12 = [v5 allObjects];
    uint64_t v13 = [v6 allObjects];
    SystemSoundID v8 = [v11 commitSuggestionsForPerson:v4 withConfirmedSuggestions:v12 andRejectedSuggestions:v13];
  }
LABEL_8:

  return v8;
}

- (void)commitUserResponses
{
  id v4 = [(PXPeopleSuggestionManager *)self person];
  id v3 = [(PXPeopleSuggestionManager *)self commitUserResponsesToPerson:v4];
}

- (void)undo
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(PXPeopleSuggestionManager *)self canUndo])
  {
    if ([(PXPeopleSuggestionManager *)self _fetchingSuggestions]) {
      [(PXPeopleSuggestionManager *)self cancelPendingSuggestionLoading];
    }
    id v3 = [(PXPeopleSuggestionManager *)self delegate];
    id v4 = [(PXPeopleSuggestionManager *)self confirmedSuggestions];
    v5 = [(PXPeopleSuggestionManager *)self suggestionProvider];
    if ([(PXPeopleSuggestionManager *)self didReachEnd]) {
      [v5 currentSuggestions];
    }
    else {
    int v6 = [v5 previousSuggestions];
    }
    id v17 = v5;
    [(PXPeopleSuggestionManager *)self setDidReachEnd:0];
    uint64_t v7 = [(PXPeopleSuggestionManager *)self rejectedSuggestions];
    SystemSoundID v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    [v7 minusSet:v8];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v9);
          }
          id v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v4 containsObject:v16])
          {
            [v4 removeObject:v16];
            ++v13;
            uint64_t v12 = v12 + [v16 numberOfAssets] - 1;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }

    [(PXPeopleSuggestionManager *)self setAutoConfirmationsCount:[(PXPeopleSuggestionManager *)self autoConfirmationsCount] - v12];
    [(PXPeopleSuggestionManager *)self setUserConfirmationsCount:[(PXPeopleSuggestionManager *)self userConfirmationsCount] - v13];
    if (objc_opt_respondsToSelector()) {
      [v3 confirmationCountUpdatedForSuggestionManager:self undoing:1];
    }
    [v3 suggestionManager:self hasNewSuggestionsAvailable:v9];
  }
}

- (void)removeAllSuggestions
{
  id v3 = [(PXPeopleSuggestionManager *)self rejectedSuggestions];
  [v3 removeAllObjects];

  id v4 = [(PXPeopleSuggestionManager *)self confirmedSuggestions];
  [v4 removeAllObjects];

  v5 = [(PXPeopleSuggestionManager *)self skippedSuggestions];
  [v5 removeAllObjects];

  int v6 = [(PXPeopleSuggestionManager *)self suggestionProvider];
  [v6 removeAllSuggestions];

  [(PXPeopleSuggestionManager *)self setUserConfirmationsCount:0];
  [(PXPeopleSuggestionManager *)self setAutoConfirmationsCount:0];
  [(PXPeopleSuggestionManager *)self setDidReachEnd:0];
  id v7 = [(PXPeopleSuggestionManager *)self delegate];
  [v7 confirmationCountUpdatedForSuggestionManager:self undoing:1];
}

- (void)markSuggestionsAsSkipped:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v11), "px_localIdentifier", (void)v19);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(PXPeopleSuggestionManager *)self skippedSuggestions];
  [v13 addObjectsFromArray:v6];

  uint64_t v14 = [(PXPeopleSuggestionManager *)self confirmedSuggestions];
  id v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  [v14 minusSet:v15];

  id v16 = [(PXPeopleSuggestionManager *)self rejectedSuggestions];
  id v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  [v16 minusSet:v17];

  long long v18 = [(PXPeopleSuggestionManager *)self suggestionProvider];
  [v18 removeSuggestions:v7];
}

- (void)markSuggestions:(id)a3 confirmed:(BOOL)a4 wantsSound:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [v8 count];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "px_localIdentifier");
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v13);
  }

  if (!v6)
  {
    if (v5) {
      [(PXPeopleSuggestionManager *)self _playConfirmNoSound];
    }
    long long v29 = [(PXPeopleSuggestionManager *)self skippedSuggestions];
    long long v30 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
    [v29 minusSet:v30];

    long long v31 = [(PXPeopleSuggestionManager *)self confirmedSuggestions];
    v32 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
    [v31 minusSet:v32];

    uint64_t v33 = [(PXPeopleSuggestionManager *)self rejectedSuggestions];
    [v33 addObjectsFromArray:v11];
    goto LABEL_25;
  }
  if (v5) {
    [(PXPeopleSuggestionManager *)self _playConfirmYesSound];
  }
  id v17 = [(PXPeopleSuggestionManager *)self skippedSuggestions];
  long long v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  [v17 minusSet:v18];

  long long v19 = [(PXPeopleSuggestionManager *)self rejectedSuggestions];
  uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  [v19 minusSet:v20];

  long long v21 = [(PXPeopleSuggestionManager *)self confirmedSuggestions];
  [v21 addObjectsFromArray:v11];

  long long v22 = [(PXPeopleSuggestionManager *)self delegate];
  LOBYTE(v20) = objc_opt_respondsToSelector();

  if (v20)
  {
    [(PXPeopleSuggestionManager *)self setUserConfirmationsCount:[(PXPeopleSuggestionManager *)self userConfirmationsCount] + v9];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v23 = v11;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = 0;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v23);
          }
          v26 += objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * j), "numberOfAssets", (void)v34);
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v25);
    }
    else
    {
      uint64_t v26 = 0;
    }

    [(PXPeopleSuggestionManager *)self setAutoConfirmationsCount:v26 - v9 + [(PXPeopleSuggestionManager *)self autoConfirmationsCount]];
    uint64_t v33 = [(PXPeopleSuggestionManager *)self delegate];
    [v33 confirmationCountUpdatedForSuggestionManager:self undoing:0];
LABEL_25:
  }
}

- (BOOL)isSuggestionConfirmed:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXPeopleSuggestionManager *)self confirmedSuggestions];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)requestNextSuggestionsWithPageLimit:(unint64_t)a3
{
  if (![(PXPeopleSuggestionManager *)self _fetchingSuggestions])
  {
    BOOL v5 = [(PXPeopleSuggestionManager *)self suggestionProvider];
    if ([v5 hasNextSuggestions])
    {
      id v6 = (id)[v5 nextSuggestionsWithPageLimit:a3];
      [(PXPeopleSuggestionManager *)self _notifyDelegateWeHaveMoreSuggestions:1];
    }
    else
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __65__PXPeopleSuggestionManager_requestNextSuggestionsWithPageLimit___block_invoke;
      v7[3] = &unk_1E5DCB5D8;
      objc_copyWeak(v8, &location);
      v8[1] = (id)a3;
      v7[4] = self;
      [(PXPeopleSuggestionManager *)self _loadMoreSuggestionsWithCompletion:v7];
      objc_destroyWeak(v8);
      objc_destroyWeak(&location);
    }
  }
}

void __65__PXPeopleSuggestionManager_requestNextSuggestionsWithPageLimit___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    BOOL v5 = [WeakRetained suggestionProvider];
    id v6 = (id)[v5 nextSuggestionsWithPageLimit:*(void *)(a1 + 48)];
  }
  else
  {
    [*(id *)(a1 + 32) setDidReachEnd:1];
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  [v7 _notifyDelegateWeHaveMoreSuggestions:a2];
}

- (void)requestNextSuggestion
{
}

- (void)preloadSounds
{
  [(PXPeopleSuggestionManager *)self setConfirmYesSoundID:[(PXPeopleSuggestionManager *)self _soundIdWithFilename:@"PXPeopleConfirmYes"]];
  uint64_t v3 = [(PXPeopleSuggestionManager *)self _soundIdWithFilename:@"PXPeopleConfirmNo"];
  [(PXPeopleSuggestionManager *)self setConfirmNoSoundID:v3];
}

- (void)setDataSource:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_dataSource, a3);
  id v6 = [(PXPeopleSuggestionManager *)self suggestionProvider];
  [v6 removeAllSuggestions];

  if (objc_opt_respondsToSelector())
  {
    unint64_t v7 = [v5 initialPageLimit];
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__PXPeopleSuggestionManager_setDataSource___block_invoke;
  v9[3] = &unk_1E5DCB5B0;
  objc_copyWeak(v10, &location);
  v10[1] = (id)v8;
  [(PXPeopleSuggestionManager *)self _loadMoreSuggestionsWithCompletion:v9];
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __43__PXPeopleSuggestionManager_setDataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [WeakRetained suggestionProvider];
    id v6 = (id)[v5 nextSuggestionsWithPageLimit:*(void *)(a1 + 40)];
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 32));
  [v7 _notifyDelegateWeHaveMoreSuggestions:a2];
}

- (BOOL)isLoading
{
  v2 = [(PXPeopleSuggestionManager *)self suggestionToken];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canUndo
{
  BOOL v3 = [(PXPeopleSuggestionManager *)self suggestionProvider];
  if ([(PXPeopleSuggestionManager *)self didReachEnd])
  {
    id v4 = [v3 currentSuggestions];
    char v5 = [v4 count] != 0;
  }
  else
  {
    char v5 = [v3 hasPreviousSuggestions];
  }

  return v5;
}

- (NSArray)currentSuggestions
{
  v2 = [(PXPeopleSuggestionManager *)self suggestionProvider];
  BOOL v3 = [v2 currentSuggestions];

  return (NSArray *)v3;
}

- (void)dealloc
{
  SystemSoundID confirmYesSoundID = self->_confirmYesSoundID;
  if (confirmYesSoundID)
  {
    AudioServicesDisposeSystemSoundID(confirmYesSoundID);
    self->_SystemSoundID confirmYesSoundID = 0;
  }
  SystemSoundID confirmNoSoundID = self->_confirmNoSoundID;
  if (confirmNoSoundID)
  {
    AudioServicesDisposeSystemSoundID(confirmNoSoundID);
    self->_SystemSoundID confirmNoSoundID = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleSuggestionManager;
  [(PXPeopleSuggestionManager *)&v5 dealloc];
}

- (PXPeopleSuggestionManager)init
{
  return [(PXPeopleSuggestionManager *)self initWithPerson:0];
}

- (PXPeopleSuggestionManager)initWithPerson:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPeopleSuggestionManager;
  id v6 = [(PXPeopleSuggestionManager *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    v6->_SystemSoundID confirmYesSoundID = 0;
    v6->_SystemSoundID confirmNoSoundID = 0;
    objc_storeStrong((id *)&v6->_person, a3);
    uint64_t v8 = objc_alloc_init(PXPeoplePagingSuggestionProvider);
    suggestionProvider = v7->_suggestionProvider;
    v7->_suggestionProvider = v8;

    uint64_t v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    confirmedSuggestions = v7->_confirmedSuggestions;
    v7->_confirmedSuggestions = v10;

    uint64_t v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    rejectedSuggestions = v7->_rejectedSuggestions;
    v7->_rejectedSuggestions = v12;

    uint64_t v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    skippedSuggestions = v7->_skippedSuggestions;
    v7->_skippedSuggestions = v14;

    v7->_mute = 0;
    v7->_userConfirmationsCount = 0;
    v7->_autoConfirmationsCount = 0;
  }

  return v7;
}

@end