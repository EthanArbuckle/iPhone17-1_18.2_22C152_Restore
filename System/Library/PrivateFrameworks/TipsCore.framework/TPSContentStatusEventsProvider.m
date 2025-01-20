@interface TPSContentStatusEventsProvider
- (BOOL)_isStatusType:(int64_t)a3 observedInStatus:(id)a4;
- (BOOL)_isStatusType:(int64_t)a3 observedInStatuses:(id)a4;
- (TPSContentStatusEventsProvider)init;
- (void)queryEvents:(id)a3;
@end

@implementation TPSContentStatusEventsProvider

- (void).cxx_destruct
{
}

uint64_t __67__TPSContentStatusEventsProvider__isStatusType_observedInStatuses___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) _isStatusType:*(void *)(a1 + 48) observedInStatus:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_isStatusType:(int64_t)a3 observedInStatus:(id)a4
{
  id v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 1:
      if ([v5 isDesiredOutcomePerformed]) {
        goto LABEL_9;
      }
      goto LABEL_3;
    case 2:
      if (([v5 isDesiredOutcomePerformed] & 1) != 0
        || ([v6 isHintDisplayedOnAnyDevice] & 1) != 0)
      {
LABEL_9:
        LOBYTE(v8) = 1;
      }
      else
      {
        char v7 = [v6 isHintInelgibile];
LABEL_15:
        LOBYTE(v8) = v7;
      }
      break;
    case 3:
      char v7 = [v5 isHintDisplayedOnAnyDevice];
      goto LABEL_15;
    case 4:
LABEL_3:
      char v7 = [v6 isHintDisplayed];
      goto LABEL_15;
    case 5:
      if (![v5 isHintDisplayedOnAnyDevice]) {
        goto LABEL_6;
      }
      int v8 = [v6 isHintDisplayed] ^ 1;
      break;
    case 6:
      char v7 = [v5 isHintDismissed];
      goto LABEL_15;
    case 7:
      char v7 = [v5 isContentViewed];
      goto LABEL_15;
    case 8:
      char v7 = [v5 isDesiredOutcomePerformed];
      goto LABEL_15;
    default:
LABEL_6:
      LOBYTE(v8) = 0;
      break;
  }

  return v8;
}

- (void)queryEvents:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v32;
    *(void *)&long long v5 = 138412290;
    long long v28 = v5;
    int v8 = &off_1E5906000;
    unint64_t v9 = 0x1E4F1C000;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
        context = (void *)MEMORY[0x19F39E0E0]();
        unsigned int v12 = [v11 minObservationCount];
        if (v12 <= [v11 currentObservationCount])
        {
          LOBYTE(v19) = 0;
        }
        else
        {
          uint64_t v13 = v6;
          uint64_t v14 = v7;
          v15 = v8;
          id v16 = v11;
          uint64_t v19 = [v16 statusType];
          v17 = [v16 contentID];
          v18 = [(TPSTipStatusController *)self->_tipStatusController statusesForCorrelationIdentifier:v17];

          LODWORD(v19) = [(TPSContentStatusEventsProvider *)self _isStatusType:v19 observedInStatuses:v18];
          if (v19)
          {
            uint64_t v19 = +[TPSLogger default];
            int v8 = v15;
            if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = [v16 description];
              *(_DWORD *)buf = v28;
              v39 = v20;
              _os_log_impl(&dword_19C8DC000, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "Status observed for event: %@", buf, 0xCu);
            }
            LOBYTE(v19) = 1;
          }
          else
          {
            int v8 = v15;
          }
          uint64_t v7 = v14;
          uint64_t v6 = v13;
          unint64_t v9 = 0x1E4F1C000uLL;
        }
        id v21 = objc_alloc_init((Class)v8[92]);
        v22 = [v11 identifier];
        [v21 setIdentifier:v22];
        v23 = [*(id *)(v9 + 2504) date];
        [v21 setResultDate:v23];

        if (v19)
        {
          v36 = v22;
          v24 = [v21 resultDate];
          v37 = v24;
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          [v21 setObservationMap:v25];
        }
        else
        {
          [v21 setObservationMap:0];
        }
        v26 = [(TPSEventsProvider *)self delegate];
        id v35 = v21;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
        [v26 dataProvider:self didFinishQueryWithResults:v27];

        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v6);
  }
}

- (BOOL)_isStatusType:(int64_t)a3 observedInStatuses:(id)a4
{
  id v6 = a4;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__TPSContentStatusEventsProvider__isStatusType_observedInStatuses___block_invoke;
  v8[3] = &unk_1E59065C8;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  [v6 enumerateObjectsUsingBlock:v8];
  LOBYTE(a3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return a3;
}

- (TPSContentStatusEventsProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)TPSContentStatusEventsProvider;
  v2 = [(TPSContentStatusEventsProvider *)&v7 init];
  if (v2)
  {
    v3 = +[TPSCommonDefines sharedInstance];
    uint64_t v4 = [v3 tipStatusController];
    tipStatusController = v2->_tipStatusController;
    v2->_tipStatusController = (TPSTipStatusController *)v4;
  }
  return v2;
}

@end