@interface ABSSyncController
- (ABSSyncController)init;
- (void)addSyChanges:(id)a3 forSession:(id)a4;
- (void)clearShadowMarks;
- (void)deleteSyChange:(id)a3;
- (void)deleteUnmarked;
- (void)resetSyncState;
- (void)updateSyChange:(id)a3 forSession:(id)a4;
@end

@implementation ABSSyncController

- (ABSSyncController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ABSSyncController;
  v2 = [(ABSSyncController *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(ABSContactsSyncManager);
    abSyncManager = v2->_abSyncManager;
    v2->_abSyncManager = v3;

    v5 = objc_alloc_init(ABSFavoritesSyncManager);
    favoritesSyncManager = v2->_favoritesSyncManager;
    v2->_favoritesSyncManager = v5;
  }
  return v2;
}

- (void)addSyChanges:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [v6 firstObject];
    v9 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = [v8 pbObject];
      v12 = [v11 contactWrapper];
      v13 = [v12 guid];
      int v18 = 138543362;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "addSyChange for %{public}@", (uint8_t *)&v18, 0xCu);
    }
    v14 = [v8 pbObject];
    unsigned int v15 = [v14 hasContactWrapper];

    if (v15)
    {
      [(ABSContactsSyncManager *)self->_abSyncManager addBatch:v6 forSession:v7];
    }
    else
    {
      v16 = [v8 pbObject];
      unsigned int v17 = [v16 hasFavoritesSyncObject];

      if (v17)
      {
        [(ABSFavoritesSyncManager *)self->_favoritesSyncManager replace:v8];
      }
      else if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR))
      {
        sub_1000385C8();
      }
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_100038594();
  }
}

- (void)updateSyChange:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = [v8 pbObject];
  unsigned int v10 = [v9 hasContactWrapper];

  if (v10)
  {
    v11 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = [v8 pbObject];
      v14 = [v13 contactWrapper];
      unsigned int v15 = [v14 guid];
      int v34 = 138543362;
      v35 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "updateSyChange for contact %{public}@", (uint8_t *)&v34, 0xCu);
    }
    [(ABSContactsSyncManager *)self->_abSyncManager addOrUpdateContactIn:v8 forSession:v7];
    goto LABEL_24;
  }
  v16 = [v8 pbObject];
  unsigned int v17 = [v16 hasFavoritesSyncObject];

  if (v17)
  {
    int v18 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "updateSyChange for favorites", (uint8_t *)&v34, 2u);
    }
    [(ABSFavoritesSyncManager *)self->_favoritesSyncManager replace:v8];
    goto LABEL_24;
  }
  v19 = [v8 pbObject];
  unsigned int v20 = [v19 hasCountValidationObject];

  if (v20)
  {
    v21 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "updateSyChange for validation", (uint8_t *)&v34, 2u);
    }
    v22 = [v8 pbObject];
    v23 = [v22 countValidationObject];
    [v7 setValidationMessage:v23];

    goto LABEL_24;
  }
  v24 = [v8 pbObject];
  unsigned int v25 = [v24 hasAccountsSyncObject];

  if (v25)
  {
    v26 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "updateSyChange for accounts", (uint8_t *)&v34, 2u);
    }
    v27 = [v8 pbObject];
    v28 = [v27 accountsSyncObject];
    [v7 setAccountsMessage:v28];

    v29 = [v7 accountsMessage];
    +[ABSAccountsSyncObject processSyncObjASAPPortion:v29];
LABEL_21:

    goto LABEL_24;
  }
  v30 = [v8 pbObject];
  unsigned int v31 = [v30 hasContainerSyncObject];

  v32 = *(NSObject **)(qword_100069D78 + 8);
  if (v31)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "updateSyChange for container", (uint8_t *)&v34, 2u);
    }
    v33 = objc_opt_class();
    v29 = [v8 pbObject];
    [v33 applyChange:v29];
    goto LABEL_21;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_1000385FC();
  }
LABEL_24:
}

- (void)deleteSyChange:(id)a3
{
  id v4 = a3;
  v5 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [v4 pbObject];
    id v8 = [v7 deleteWrapper];
    v9 = [v8 guid];
    int v12 = 138543362;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "deleteSyChange for %{public}@", (uint8_t *)&v12, 0xCu);
  }
  unsigned int v10 = [v4 pbObject];
  unsigned int v11 = [v10 hasDeleteWrapper];

  if (v11)
  {
    [(ABSContactsSyncManager *)self->_abSyncManager remove:v4];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_100038630();
  }
}

- (void)resetSyncState
{
  [(ABSContactsSyncManager *)self->_abSyncManager deleteShadow];
  favoritesSyncManager = self->_favoritesSyncManager;

  [(ABSFavoritesSyncManager *)favoritesSyncManager deleteShadow];
}

- (void)clearShadowMarks
{
}

- (void)deleteUnmarked
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritesSyncManager, 0);

  objc_storeStrong((id *)&self->_abSyncManager, 0);
}

@end