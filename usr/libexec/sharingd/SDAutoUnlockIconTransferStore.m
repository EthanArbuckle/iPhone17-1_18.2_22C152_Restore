@interface SDAutoUnlockIconTransferStore
- (BOOL)imageCachedForHash:(id)a3 device:(id)a4;
- (SDAutoUnlockIconTransferStore)init;
- (void)_loadTransferStore;
- (void)storeCachedImageForHash:(id)a3 device:(id)a4 appName:(id)a5;
@end

@implementation SDAutoUnlockIconTransferStore

- (SDAutoUnlockIconTransferStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDAutoUnlockIconTransferStore;
  v2 = [(SDAutoUnlockIconTransferStore *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(SDAutoUnlockIconTransferStore *)v2 _loadTransferStore];
    v4 = v3;
  }

  return v3;
}

- (void)storeCachedImageForHash:(id)a3 device:(id)a4 appName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = SFHexStringForData();
  v12 = [(NSMutableDictionary *)self->_transferStore objectForKeyedSubscript:v9];
  id v13 = [v12 mutableCopy];

  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v14 = objc_opt_new();

    id v13 = (id)v14;
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1000F72B4;
  v29 = sub_1000F72C4;
  id v30 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000F72CC;
  v22[3] = &unk_1008CD350;
  id v15 = v10;
  id v23 = v15;
  v24 = &v25;
  [v13 enumerateKeysAndObjectsUsingBlock:v22];
  if (v26[5]) {
    [v13 removeObjectForKey:];
  }
  [v13 setObject:v15 forKeyedSubscript:v11];
  id v16 = [v13 copy];
  [(NSMutableDictionary *)self->_transferStore setObject:v16 forKeyedSubscript:v9];

  if (dword_100967808 <= 50 && (dword_100967808 != -1 || _LogCategory_Initialize()))
  {
    id v20 = v9;
    v21 = v11;
    id v19 = v15;
    LogPrintF();
  }
  v17 = +[NSUserDefaults standardUserDefaults];
  id v18 = [(NSMutableDictionary *)self->_transferStore copy];
  [v17 setObject:v18 forKey:@"AUIconTransferStore"];

  [v17 synchronize];
  _Block_object_dispose(&v25, 8);
}

- (BOOL)imageCachedForHash:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_transferStore objectForKeyedSubscript:v7];
  id v9 = [v8 mutableCopy];

  if (!v9)
  {
    if (dword_100967808 > 50 || dword_100967808 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_17;
    }
LABEL_11:
    LogPrintF();
LABEL_17:
    BOOL v12 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (dword_100967808 > 90 || dword_100967808 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  id v10 = SFHexStringForData();
  v11 = [v9 objectForKeyedSubscript:v10];
  if (dword_100967808 <= 50 && (dword_100967808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v12 = v11 != 0;

LABEL_18:
  return v12;
}

- (void)_loadTransferStore
{
  id v7 = +[NSUserDefaults standardUserDefaults];
  v3 = [v7 objectForKey:@"AUIconTransferStore"];
  v4 = (NSMutableDictionary *)[v3 mutableCopy];

  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = objc_opt_new();

    v4 = (NSMutableDictionary *)v5;
  }
  transferStore = self->_transferStore;
  self->_transferStore = v4;
}

- (void).cxx_destruct
{
}

@end