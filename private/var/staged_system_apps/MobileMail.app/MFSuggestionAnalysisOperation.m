@interface MFSuggestionAnalysisOperation
- (BOOL)isCancelled;
- (EFScheduler)scheduler;
- (MFSuggestionAnalysisOperation)initWithDelegate:(id)a3 presenter:(id)a4 scheduler:(id)a5;
- (SGFoundInSuggestionPresenter)suggestionPresenter;
- (SGSuggestionDelegate)delegate;
- (id)_concatenatedStringFromContent:(id)a3;
- (id)_unsubscribeSuggestionForContentRepresentation:(id)a3;
- (void)cancel;
- (void)handleContentRepresentation:(id)a3 allowUnsubscribe:(BOOL)a4;
- (void)setCancelled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSuggestionPresenter:(id)a3;
@end

@implementation MFSuggestionAnalysisOperation

- (MFSuggestionAnalysisOperation)initWithDelegate:(id)a3 presenter:(id)a4 scheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MFSuggestionAnalysisOperation;
  v11 = [(MFSuggestionAnalysisOperation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeWeak((id *)&v12->_suggestionPresenter, v9);
    objc_storeWeak((id *)&v12->_scheduler, v10);
  }

  return v12;
}

- (void)cancel
{
  unsigned __int8 v3 = [(MFSuggestionAnalysisOperation *)self isCancelled];
  [(MFSuggestionAnalysisOperation *)self setCancelled:1];
  if ((v3 & 1) == 0)
  {
    v4 = [(MFSuggestionAnalysisOperation *)self suggestionPresenter];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v5 = [v4 suggestions];
    id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          [v4 removeSuggestion:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)handleContentRepresentation:(id)a3 allowUnsubscribe:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned __int8 v7 = [(MFSuggestionAnalysisOperation *)self isCancelled];
  if (v6) {
    char v8 = v7;
  }
  else {
    char v8 = 1;
  }
  if ((v8 & 1) == 0)
  {
    long long v9 = [(MFSuggestionAnalysisOperation *)self suggestionPresenter];
    long long v10 = [v6 searchableItem];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v11 = [v9 suggestions];
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          [v9 removeSuggestion:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        }
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }

    if (v10
      && +[MSSiriIntelligenceSettings canShowSiriSuggestions])
    {
      id v15 = [v10 copy];
      id v22 = v15;
      v16 = +[NSArray arrayWithObjects:&v22 count:1];
      [v9 addSuggestionsFromSearchableItems:v16 options:0 filter:0];
    }
    if (v4)
    {
      v17 = [(MFSuggestionAnalysisOperation *)self _unsubscribeSuggestionForContentRepresentation:v6];
      if (v17) {
        [v9 addSuggestion:v17];
      }
    }
    else
    {
      v17 = 0;
    }
  }
}

- (id)_concatenatedStringFromContent:(id)a3
{
  id v16 = a3;
  id v17 = objc_alloc_init((Class)MFStringAccumulator);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = v16;
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        unsigned __int8 v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          long long v9 = [v8 htmlData];
          if (v9)
          {
            long long v10 = [v8 preferredCharacterSet];
            int v11 = MFEncodingForCharset();
            id v12 = (void *)MFCreateStringWithData();
            if (v12) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = v11 == -1;
            }
            if (!v13) {
              id v12 = (void *)MFCreateStringWithData();
            }
            if (v12) {
              [v17 appendString:v12];
            }
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  objc_super v14 = [v17 string];

  return v14;
}

- (id)_unsubscribeSuggestionForContentRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 unsubscribeCommand];
  if (v5)
  {
    id v6 = objc_alloc_init(MFListUnsubscribeSuggestion_iOS);
    unsigned __int8 v7 = [(MFSuggestionAnalysisOperation *)self delegate];
    id v8 = [(MFListUnsubscribeSuggestion_iOS *)v6 suggestion];
    [v8 setSuggestionDelegate:v7];

    [(MFListUnsubscribeSuggestion_iOS *)v6 setListUnsubscribeCommand:v5];
    long long v9 = [(MFSuggestionAnalysisOperation *)self suggestionPresenter];
    [(MFListUnsubscribeSuggestion_iOS *)v6 setSuggestionPresenter:v9];

    [(MFListUnsubscribeSuggestion_iOS *)v6 setContentRepresentation:v4];
    long long v10 = [(MFListUnsubscribeSuggestion_iOS *)v6 suggestion];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (SGSuggestionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SGSuggestionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EFScheduler)scheduler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);

  return (EFScheduler *)WeakRetained;
}

- (void)setScheduler:(id)a3
{
}

- (SGFoundInSuggestionPresenter)suggestionPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionPresenter);

  return (SGFoundInSuggestionPresenter *)WeakRetained;
}

- (void)setSuggestionPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionPresenter);
  objc_destroyWeak((id *)&self->_scheduler);

  objc_destroyWeak((id *)&self->_delegate);
}

@end