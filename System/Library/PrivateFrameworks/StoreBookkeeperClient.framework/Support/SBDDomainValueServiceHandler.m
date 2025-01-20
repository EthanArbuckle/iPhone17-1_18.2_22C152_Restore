@interface SBDDomainValueServiceHandler
- (SBDDomainValueServiceHandler)initWithDomain:(id)a3;
- (SBKUniversalPlaybackPositionStore)cloudStore;
- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
@end

@implementation SBDDomainValueServiceHandler

- (void).cxx_destruct
{
}

- (SBKUniversalPlaybackPositionStore)cloudStore
{
  return self->_cloudStore;
}

- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 bookmarkTime];
  double v9 = v8;
  [v6 bookmarkTimestamp];
  double v11 = v10;
  id v12 = [v6 hasBeenPlayed];
  id v13 = [v6 userPlayCount];
  v14 = [v6 ubiquitousIdentifier];
  v15 = +[SBKUniversalPlaybackPositionMetadata metadataWithItemIdentifier:v14 bookmarkTime:v12 bookmarkTimestamp:v13 hasBeenPlayed:v9 playCount:v11];

  cloudStore = self->_cloudStore;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100013AE0;
  v19[3] = &unk_100021220;
  id v20 = v6;
  id v21 = v7;
  id v17 = v7;
  id v18 = v6;
  [(SBKUniversalPlaybackPositionStore *)cloudStore pushMetadataItem:v15 completionBlock:v19];
}

- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  cloudStore = self->_cloudStore;
  double v9 = [v6 ubiquitousIdentifier];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100013C58;
  v12[3] = &unk_100021220;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SBKUniversalPlaybackPositionStore *)cloudStore pullMetadataItemWithItemIdentifier:v9 completionBlock:v12];
}

- (SBDDomainValueServiceHandler)initWithDomain:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBDDomainValueServiceHandler;
  v5 = [(SBDDomainServiceHandler *)&v16 initWithDomain:v4];
  if (v5)
  {
    id v6 = [v4 foreignDatabasePath];

    if (!v6) {
      goto LABEL_5;
    }
    id v7 = [v4 foreignDatabasePath];
    double v8 = SBKStoreAccountIdentifierFromDatabasePath();

    id v9 = objc_alloc((Class)SBKUniversalPlaybackPositionStore);
    id v10 = [v4 domainIdentifier];
    id v11 = [v9 initWithDomain:v10 dataSource:0 automaticSynchronizeOptions:0 accountIdentifier:v8 isActive:0];

    if (v11)
    {
      int v12 = 0;
      id v13 = v11;
    }
    else
    {
LABEL_5:
      id v14 = objc_alloc((Class)SBKUniversalPlaybackPositionStore);
      double v8 = [v4 domainIdentifier];
      id v13 = [v14 initWithDomain:v8 dataSource:0 automaticSynchronizeOptions:0 isActive:0];
      id v11 = 0;
      int v12 = 1;
    }
    objc_storeStrong((id *)&v5->_cloudStore, v13);
    if (v12)
    {
    }
  }

  return v5;
}

@end