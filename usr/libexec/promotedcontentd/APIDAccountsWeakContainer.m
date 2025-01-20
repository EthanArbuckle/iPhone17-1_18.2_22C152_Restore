@interface APIDAccountsWeakContainer
+ (id)sharedInstance;
- (APIDAccountsWeakContainer)init;
- (APUnfairLock)lock;
- (NSPointerArray)idAccounts;
- (id)addIDAccount:(id)a3;
- (void)setIdAccounts:(id)a3;
- (void)setLock:(id)a3;
@end

@implementation APIDAccountsWeakContainer

+ (id)sharedInstance
{
  if (qword_10028D258 != -1) {
    dispatch_once(&qword_10028D258, &stru_100238B10);
  }
  v2 = (void *)qword_10028D250;

  return v2;
}

- (APIDAccountsWeakContainer)init
{
  v8.receiver = self;
  v8.super_class = (Class)APIDAccountsWeakContainer;
  v2 = [(APIDAccountsWeakContainer *)&v8 init];
  if (v2)
  {
    v3 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
    lock = v2->_lock;
    v2->_lock = v3;

    uint64_t v5 = +[NSPointerArray weakObjectsPointerArray];
    idAccounts = v2->_idAccounts;
    v2->_idAccounts = (NSPointerArray *)v5;
  }
  return v2;
}

- (id)addIDAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v17 = [(APIDAccountsWeakContainer *)self lock];
    [v17 lock];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [(APIDAccountsWeakContainer *)self idAccounts];
    id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        v11 = [v10 iAdID];
        v12 = [v4 iAdID];
        unsigned __int8 v13 = [v11 isEqual:v12];

        if (v13) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v14 = v10;

      if (v14) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:
    }
    v15 = [(APIDAccountsWeakContainer *)self idAccounts];
    [v15 addPointer:v4];

    id v14 = v4;
LABEL_13:
    [v17 unlock];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (NSPointerArray)idAccounts
{
  return self->_idAccounts;
}

- (void)setIdAccounts:(id)a3
{
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_idAccounts, 0);
}

@end