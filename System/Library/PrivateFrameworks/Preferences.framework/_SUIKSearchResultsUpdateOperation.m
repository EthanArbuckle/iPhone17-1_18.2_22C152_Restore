@interface _SUIKSearchResultsUpdateOperation
- (NSArray)results;
- (SUIKSearchResultsCollectionViewControllerDelegate)delegate;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (_SUIKSearchResultsUpdateOperation)initWithResults:(id)a3 diffableDataSource:(id)a4 delegate:(id)a5;
- (void)main;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation _SUIKSearchResultsUpdateOperation

- (_SUIKSearchResultsUpdateOperation)initWithResults:(id)a3 diffableDataSource:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_SUIKSearchResultsUpdateOperation;
  v11 = [(_SUIKSearchResultsUpdateOperation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_results, v8);
    objc_storeWeak((id *)&v12->_diffableDataSource, v9);
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (void)main
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (([(_SUIKSearchResultsUpdateOperation *)self isCancelled] & 1) == 0)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F42650]);
    objc_initWeak(&location, self);
    v4 = [(_SUIKSearchResultsUpdateOperation *)self results];
    BOOL v5 = [v4 count] == 0;

    if (v5) {
      goto LABEL_22;
    }
    v6 = [MEMORY[0x1E4F1CA80] set];
    v7 = [(_SUIKSearchResultsUpdateOperation *)self results];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __41___SUIKSearchResultsUpdateOperation_main__block_invoke;
    v31[3] = &unk_1E5C60288;
    v31[4] = self;
    id v8 = objc_msgSend(v7, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", v31);

    if ([(_SUIKSearchResultsUpdateOperation *)self isCancelled])
    {
      int v9 = 1;
    }
    else
    {
      id v10 = [v8 allKeys];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __41___SUIKSearchResultsUpdateOperation_main__block_invoke_2;
      v30[3] = &unk_1E5C602B0;
      v30[4] = self;
      v19 = [v10 sortedArrayUsingComparator:v30];

      if ([(_SUIKSearchResultsUpdateOperation *)self isCancelled])
      {
LABEL_19:
        int v9 = 1;
      }
      else
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id obj = v19;
        uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v27;
          while (2)
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v27 != v12) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
              if ([(_SUIKSearchResultsUpdateOperation *)self isCancelled]) {
                goto LABEL_18;
              }
              uint64_t v33 = v14;
              v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
              [v3 appendSectionsWithIdentifiers:v15];

              if ([(_SUIKSearchResultsUpdateOperation *)self isCancelled]) {
                goto LABEL_18;
              }
              v16 = [v8 objectForKeyedSubscript:v14];
              v24[0] = MEMORY[0x1E4F143A8];
              v24[1] = 3221225472;
              v24[2] = __41___SUIKSearchResultsUpdateOperation_main__block_invoke_3;
              v24[3] = &unk_1E5C602D8;
              id v25 = v6;
              v17 = objc_msgSend(v16, "na_filter:", v24);

              v23[0] = MEMORY[0x1E4F143A8];
              v23[1] = 3221225472;
              v23[2] = __41___SUIKSearchResultsUpdateOperation_main__block_invoke_4;
              v23[3] = &unk_1E5C60300;
              v23[4] = self;
              v18 = [v17 sortedArrayUsingComparator:v23];
              if ([(_SUIKSearchResultsUpdateOperation *)self isCancelled])
              {

LABEL_18:
                goto LABEL_19;
              }
              [v3 appendItemsWithIdentifiers:v18 intoSectionWithIdentifier:v14];

              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        int v9 = [(_SUIKSearchResultsUpdateOperation *)self isCancelled];
      }
    }
    if (!v9)
    {
LABEL_22:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41___SUIKSearchResultsUpdateOperation_main__block_invoke_5;
      block[3] = &unk_1E5C5DDD0;
      block[4] = self;
      id v22 = v3;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    objc_destroyWeak(&location);
  }
}

- (NSArray)results
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_results);
  return (NSArray *)WeakRetained;
}

- (void)setResults:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diffableDataSource);
  return (UICollectionViewDiffableDataSource *)WeakRetained;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (SUIKSearchResultsCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUIKSearchResultsCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_diffableDataSource);
  objc_destroyWeak((id *)&self->_results);
}

@end