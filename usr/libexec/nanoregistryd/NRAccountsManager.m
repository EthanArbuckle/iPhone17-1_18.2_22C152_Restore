@interface NRAccountsManager
+ (id)sharedInstance;
- (BOOL)_addCompletionBlock:(id)a3;
- (NRAccountsManager)init;
- (void)fireCompletionBlocks;
- (void)reset;
- (void)signOutAccountsWithKill:(BOOL)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation NRAccountsManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007024;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A1040 != -1) {
    dispatch_once(&qword_1001A1040, block);
  }
  v2 = (void *)qword_1001A1038;

  return v2;
}

- (NRAccountsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)NRAccountsManager;
  result = [(NRAccountsManager *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)_addCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  completions = self->_completions;
  if (!completions)
  {
    v10 = +[NSMutableArray array];
    v11 = self->_completions;
    self->_completions = v10;

    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    v7 = self->_completions;
    id v8 = objc_retainBlock(v5);
    [(NSMutableArray *)v7 addObject:v8];
  }
LABEL_4:

  return completions == 0;
}

- (void)fireCompletionBlocks
{
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_100007378;
  v24[4] = sub_100007388;
  id v25 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100007378;
  v22 = sub_100007388;
  id v23 = 0;
  p_lock = &self->_lock;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v13 = sub_100007390;
  v14 = &unk_100165640;
  v15 = self;
  v16 = v24;
  v17 = &v18;
  objc_super v3 = v12;
  os_unfair_lock_lock_with_options();
  v13(v3);

  os_unfair_lock_unlock(p_lock);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v19[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v26 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v24, 8);
}

- (void)signOutAccountsWithKill:(BOOL)a3 queue:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (void)reset
{
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_100007378;
  v24[4] = sub_100007388;
  id v25 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100007378;
  v22 = sub_100007388;
  id v23 = 0;
  p_lock = &self->_lock;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v13 = sub_10000767C;
  v14 = &unk_100165640;
  v15 = self;
  v16 = v24;
  v17 = &v18;
  objc_super v3 = v12;
  os_unfair_lock_lock_with_options();
  v13(v3);

  os_unfair_lock_unlock(p_lock);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v19[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v26 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v24, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_completions, 0);
}

@end