@interface MusicStoreCuratorPlaylistsRequestOperation
- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4;
- (unint64_t)_requestType;
- (void)_produceIncrementalResponseWithLoadedItemMetadataResponse:(id)a3 completion:(id)a4;
- (void)_produceInitialResponseWithLoadedItemMetadataResponse:(id)a3 completion:(id)a4;
- (void)_setRequestType:(unint64_t)a3;
- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4;
@end

@implementation MusicStoreCuratorPlaylistsRequestOperation

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  v6 = [(MusicStoreCuratorPlaylistsRequestOperation *)self request];
  v7 = [v6 previousResponse];
  v8 = [v7 additionalPlaylistIdentifiers];
  id v9 = [v8 count];
  if (!v9)
  {
    v17 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 curatorStoreAdamID]);
    v18 = MPStoreItemMetadataStringNormalizeStoreIDValue();

    if (v18)
    {
      id v19 = objc_alloc((Class)MPStoreModelRequestConfiguration);
      v22 = v18;
      v20 = +[NSArray arrayWithObjects:&v22 count:1];
      id v15 = [v19 initWithRequestedItemIdentifiers:v20 reason:2];
    }
    else if (a4)
    {
      SSError();
      id v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = 0;
    }

    uint64_t v14 = 0;
    if (!v15) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v10 = v9;
  id v11 = v8;
  id v12 = +[MPStoreItemMetadataRequestController optimalBatchSize];
  if (v10 > v12)
  {
    uint64_t v13 = [v11 subarrayWithRange:0, v12];

    id v11 = (id)v13;
  }
  uint64_t v14 = 1;
  id v15 = [objc_alloc((Class)MPStoreModelRequestConfiguration) initWithRequestedItemIdentifiers:v11 reason:1];

  if (v15)
  {
LABEL_5:
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __100__MusicStoreCuratorPlaylistsRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke;
    v21[3] = &unk_CCBAE0;
    v21[4] = self;
    v21[5] = v14;
    [(MusicStoreCuratorPlaylistsRequestOperation *)self dispatchSync:v21];
  }
LABEL_6:

  return v15;
}

id __100__MusicStoreCuratorPlaylistsRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setRequestType:*(void *)(a1 + 40)];
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __89__MusicStoreCuratorPlaylistsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke;
  v10[3] = &unk_CCB800;
  v10[4] = self;
  v10[5] = &v11;
  [(MusicStoreCuratorPlaylistsRequestOperation *)self dispatchSync:v10];
  uint64_t v9 = v12[3];
  if (v9)
  {
    if (v9 == 1) {
      [(MusicStoreCuratorPlaylistsRequestOperation *)self _produceIncrementalResponseWithLoadedItemMetadataResponse:v8 completion:v7];
    }
  }
  else
  {
    [(MusicStoreCuratorPlaylistsRequestOperation *)self _produceInitialResponseWithLoadedItemMetadataResponse:v8 completion:v7];
  }
  _Block_object_dispose(&v11, 8);
}

id __89__MusicStoreCuratorPlaylistsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _requestType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_produceInitialResponseWithLoadedItemMetadataResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [v6 itemIdentifiers];
  uint64_t v9 = [v8 firstObject];

  if (!v9)
  {
    id v10 = 0;
    goto LABEL_10;
  }
  id v10 = [v6 storeItemMetadataForItemIdentifier:v9];
  if (!v10)
  {
LABEL_10:
    v29 = SSError();
    v7[2](v7, 0, v29);

    goto LABEL_14;
  }
  id v45 = v6;
  uint64_t v11 = [(MusicStoreCuratorPlaylistsRequestOperation *)self request];
  id v12 = [v11 sectionProperties];
  uint64_t v13 = [v11 itemProperties];
  id v14 = [objc_alloc((Class)MPStoreModelCuratorBuilder) initWithRequestedPropertySet:v12];
  id v15 = [(MusicStoreCuratorPlaylistsRequestOperation *)self userIdentity];
  uint64_t v16 = [v14 modelObjectWithStoreItemMetadata:v10 userIdentity:v15];

  if (!v16)
  {

    id v6 = v45;
    goto LABEL_10;
  }
  v17 = (void *)v16;
  v41 = self;
  v42 = v13;
  id v18 = objc_alloc_init((Class)MPMutableSectionedCollection);
  [v18 appendSection:v17];
  id v19 = [[MusicStoreCuratorPlaylistsResponse alloc] initWithRequest:v11];
  v43 = v10;
  v20 = [v10 playlistIdentifiers];
  v21 = [v20 count];
  v44 = v14;
  if (v21)
  {
    v22 = v21;
    v36 = v17;
    v39 = v12;
    id v23 = v20;
    v24 = +[MPStoreItemMetadataRequestController optimalBatchSize];
    BOOL v25 = v22 > v24;
    int64_t v26 = v22 - v24;
    if (v25)
    {
      id v27 = v24;
      uint64_t v28 = [v23 subarrayWithRange:0, v24];

      v31 = [v23 subarrayWithRange:v27, v26];
      id v23 = (id)v28;
    }
    else
    {
      v31 = 0;
    }
    v32 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = __111__MusicStoreCuratorPlaylistsRequestOperation__produceInitialResponseWithLoadedItemMetadataResponse_completion___block_invoke;
    v46[3] = &unk_CCBB08;
    v46[4] = v41;
    v52 = v7;
    v30 = v42;
    id v47 = v42;
    id v48 = v23;
    id v49 = v18;
    v33 = v19;
    v50 = v19;
    id v51 = v31;
    id v34 = v31;
    id v35 = v23;
    [v32 requestStoreItemMetadataForReason:1 withItemIdentifiers:v35 responseHandler:v46];

    id v19 = v33;
    uint64_t v11 = v38;
    id v12 = v40;
    v17 = v37;
  }
  else
  {
    [(MusicStoreCuratorPlaylistsResponse *)v19 setResults:v18];
    ((void (**)(id, MusicStoreCuratorPlaylistsResponse *, void *))v7)[2](v7, v19, 0);
    v30 = v13;
  }

  id v6 = v45;
  id v10 = v43;
LABEL_14:
}

void __111__MusicStoreCuratorPlaylistsRequestOperation__produceInitialResponseWithLoadedItemMetadataResponse_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
    else if ([v5 isFinalResponse])
    {
      id v7 = [objc_alloc((Class)MPStoreModelPlaylistBuilder) initWithRequestedPropertySet:*(void *)(a1 + 40)];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = *(id *)(a1 + 48);
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = [v5 storeItemMetadataForItemIdentifier:*(void *)(*((void *)&v16 + 1) + 8 * i)];
            if (v13)
            {
              id v14 = [*(id *)(a1 + 32) userIdentity];
              id v15 = [v7 modelObjectWithStoreItemMetadata:v13 userIdentity:v14];

              if (v15)
              {
                [*(id *)(a1 + 56) appendItem:v15];
              }
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }

      [*(id *)(a1 + 64) setResults:*(void *)(a1 + 56)];
      [*(id *)(a1 + 64) setAdditionalPlaylistIdentifiers:*(void *)(a1 + 72)];
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();

      id v6 = 0;
    }
  }
}

- (void)_produceIncrementalResponseWithLoadedItemMetadataResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v45 = (void (**)(id, MusicStoreCuratorPlaylistsResponse *, void))a4;
  id v49 = self;
  id v7 = [(MusicStoreCuratorPlaylistsRequestOperation *)self request];
  id v8 = [v7 previousResponse];
  id v9 = [v8 additionalPlaylistIdentifiers];
  id v10 = [v9 count];
  uint64_t v11 = +[MPStoreItemMetadataRequestController optimalBatchSize];
  id v12 = v9;
  uint64_t v13 = v12;
  BOOL v14 = v10 > v11;
  int64_t v15 = v10 - v11;
  if (v14)
  {
    long long v16 = [v12 subarrayWithRange:0, v11];

    v41 = [v13 subarrayWithRange:v11, v15];
  }
  else
  {
    v41 = 0;
    long long v16 = v12;
  }
  long long v17 = [v8 request];
  long long v18 = [v17 itemProperties];
  long long v19 = v18;
  v44 = v7;
  v42 = v13;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [v7 itemProperties];
  }
  id v21 = v20;

  v43 = v8;
  v22 = [v8 results];
  id v23 = [v22 mutableCopy];

  v46 = (char *)[v23 numberOfSections] - 1;
  id v47 = v23;
  v24 = [v23 numberOfItemsInSection:];
  id v25 = objc_alloc_init((Class)NSMutableArray);
  v40 = v21;
  id v26 = [objc_alloc((Class)MPStoreModelPlaylistBuilder) initWithRequestedPropertySet:v21];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v16;
  id v27 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v53;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v53 != v29) {
          objc_enumerationMutation(obj);
        }
        v31 = [v6 storeItemMetadataForItemIdentifier:*(void *)(*((void *)&v52 + 1) + 8 * i)];
        if (v31)
        {
          v32 = [(MusicStoreCuratorPlaylistsRequestOperation *)v49 userIdentity];
          v33 = [v26 modelObjectWithStoreItemMetadata:v31 userIdentity:v32];

          if (v33)
          {
            [v47 appendItem:v33];
            id v34 = +[NSIndexPath indexPathForItem:v24 inSection:v46];
            [v25 addObject:v34];

            ++v24;
          }
        }
      }
      id v28 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v28);
  }

  id v35 = v25;
  if ([v25 count])
  {
    id v36 = objc_alloc((Class)MPChangeDetails);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = __115__MusicStoreCuratorPlaylistsRequestOperation__produceIncrementalResponseWithLoadedItemMetadataResponse_completion___block_invoke;
    v50[3] = &unk_CCBB30;
    id v51 = v35;
    id v37 = [v36 initWithBlock:v50];
  }
  else
  {
    id v37 = 0;
  }
  v38 = v35;
  v39 = [[MusicStoreCuratorPlaylistsResponse alloc] initWithRequest:v44];
  [(MusicStoreCuratorPlaylistsResponse *)v39 setResults:v47];
  [(MusicStoreCuratorPlaylistsResponse *)v39 setChangeDetails:v37];
  [(MusicStoreCuratorPlaylistsResponse *)v39 setAdditionalPlaylistIdentifiers:v41];
  v45[2](v45, v39, 0);
}

id __115__MusicStoreCuratorPlaylistsRequestOperation__produceIncrementalResponseWithLoadedItemMetadataResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInsertedItemIndexPaths:*(void *)(a1 + 32)];
}

- (unint64_t)_requestType
{
  return self->__requestType;
}

- (void)_setRequestType:(unint64_t)a3
{
  self->__requestType = a3;
}

@end