@interface NPDDemoModePassCopier
- (BOOL)_shouldReplaceExistingPaymentPass:(id)a3 withCompanionPass:(id)a4;
- (NPDCompanionPaymentPassDatabase)database;
- (NPDDemoModePassCopier)initWithCompanionPaymentPassDatabase:(id)a3;
- (void)_addCompanionPaymentPass:(id)a3;
- (void)noteCompanionPassAddedOrUpdated:(id)a3;
- (void)performFullSyncWithPassLibrary:(id)a3;
- (void)setDatabase:(id)a3;
@end

@implementation NPDDemoModePassCopier

- (NPDDemoModePassCopier)initWithCompanionPaymentPassDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPDDemoModePassCopier;
  v6 = [(NPDDemoModePassCopier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_database, a3);
  }

  return v7;
}

- (void)performFullSyncWithPassLibrary:(id)a3
{
  id v4 = a3;
  if (NPKIsRunningInDemoMode())
  {
    id v23 = v4;
    id v5 = [v4 npkPassesOfType:1];
    v6 = [(NPDDemoModePassCopier *)self database];
    v7 = [v6 uniqueIDs];

    v8 = +[NSMutableArray array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v5;
    id v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v12) paymentPass];
          v14 = v13;
          if (v13)
          {
            v15 = [v13 uniqueID];
            if ([v7 containsObject:v15])
            {
              v16 = [(NPDDemoModePassCopier *)self database];
              v17 = [v16 paymentPassWithUniqueID:v15];

              if ([(NPDDemoModePassCopier *)self _shouldReplaceExistingPaymentPass:v17 withCompanionPass:v14])
              {
                [v8 addObject:v14];
              }
            }
            else
            {
              [v8 addObject:v14];
            }
          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v10);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v8;
    id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          [(NPDDemoModePassCopier *)self _addCompanionPaymentPass:*(void *)(*((void *)&v25 + 1) + 8 * (void)v22)];
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v20);
    }

    id v4 = v23;
  }
}

- (void)noteCompanionPassAddedOrUpdated:(id)a3
{
  id v9 = a3;
  if (NPKIsRunningInDemoMode())
  {
    id v4 = [(NPDDemoModePassCopier *)self database];
    id v5 = [v9 uniqueID];
    v6 = [v4 paymentPassWithUniqueID:v5];

    v7 = [v9 paymentPass];
    LODWORD(v5) = [(NPDDemoModePassCopier *)self _shouldReplaceExistingPaymentPass:v6 withCompanionPass:v7];

    if (v5)
    {
      v8 = [v9 paymentPass];
      [(NPDDemoModePassCopier *)self _addCompanionPaymentPass:v8];
    }
  }
}

- (void)_addCompanionPaymentPass:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueID];
  v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: DEMO MODE: saving pass with unique ID %@ from companion pass library", buf, 0xCu);
    }
  }
  id v9 = [(NPDDemoModePassCopier *)self database];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000442EC;
  v11[3] = &unk_10006DC50;
  id v12 = v5;
  id v10 = v5;
  [v9 savePaymentPass:v4 requireExisting:0 requireNewer:0 completion:v11];
}

- (BOOL)_shouldReplaceExistingPaymentPass:(id)a3 withCompanionPass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v8 = [v5 sequenceCounter];
      uint64_t v9 = [v7 sequenceCounter];
      id v10 = (void *)v9;
      BOOL v11 = 1;
      if (v8 && v9) {
        BOOL v11 = [v8 compare:v9] == (id)-1;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (NPDCompanionPaymentPassDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
}

@end