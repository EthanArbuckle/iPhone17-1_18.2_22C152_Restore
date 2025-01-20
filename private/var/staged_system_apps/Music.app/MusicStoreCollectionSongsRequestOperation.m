@interface MusicStoreCollectionSongsRequestOperation
- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4;
- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4;
@end

@implementation MusicStoreCollectionSongsRequestOperation

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  v5 = [(MusicStoreCollectionSongsRequestOperation *)self request];
  v6 = [v5 collectionIdentifiers];
  v7 = [v6 universalStore];
  v8 = [v7 globalPlaylistID];

  if ([v8 length])
  {
    if (v8)
    {
LABEL_3:
      id v9 = objc_alloc((Class)MPStoreModelRequestConfiguration);
      v16 = v8;
      v10 = +[NSArray arrayWithObjects:&v16 count:1];
      id v11 = [v9 initWithRequestedItemIdentifiers:v10 reason:2];

      goto LABEL_8;
    }
  }
  else
  {
    v12 = [v6 universalStore];
    v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 adamID]);
    uint64_t v14 = MPStoreItemMetadataStringNormalizeStoreIDValue();

    v8 = (void *)v14;
    if (v14) {
      goto LABEL_3;
    }
  }
  if (a4)
  {
    SSError();
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
LABEL_8:

  return v11;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = [v6 itemIdentifiers];
  id v9 = [v8 firstObject];

  if (!v9)
  {
    v10 = 0;
    goto LABEL_8;
  }
  v10 = [v6 storeItemMetadataForItemIdentifier:v9];
  if (!v10)
  {
LABEL_8:
    id v11 = SSError();
    v7[2](v7, 0, v11);
    goto LABEL_11;
  }
  id v11 = [(MusicStoreCollectionSongsRequestOperation *)self request];
  v12 = [v11 sectionProperties];
  v27 = [v11 itemProperties];
  id v13 = [objc_alloc((Class)MPModelStoreBrowseContentItemBuilder) initWithRequestedPropertySet:v12];
  uint64_t v14 = [(MusicStoreCollectionSongsRequestOperation *)self userIdentity];
  v15 = [v13 modelObjectWithStoreItemMetadata:v10 userIdentity:v14];

  if (!v15)
  {

    goto LABEL_8;
  }
  v25 = v13;
  id v16 = objc_alloc_init((Class)MPMutableSectionedCollection);
  [v16 appendSection:v15];
  v17 = [[MusicStoreCollectionSongsResponse alloc] initWithRequest:v11];
  v26 = [v10 childrenStoreIDs];
  if ([v26 count])
  {
    v24 = v17;
    v18 = v16;
    id v19 = v26;
    +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
    v20 = v23 = v12;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100088374;
    v28[3] = &unk_100FC3668;
    v28[4] = self;
    v33 = v7;
    id v29 = v27;
    id v30 = v19;
    id v31 = v18;
    v32 = v24;
    id v21 = v19;
    id v16 = v18;
    v17 = v24;
    id v22 = v21;
    [v20 requestStoreItemMetadataForReason:1 withItemIdentifiers:v21 responseHandler:v28];

    v12 = v23;
  }
  else
  {
    [(MusicStoreCollectionSongsResponse *)v17 setResults:v16];
    ((void (**)(id, MusicStoreCollectionSongsResponse *, void *))v7)[2](v7, v17, 0);
  }

LABEL_11:
}

@end