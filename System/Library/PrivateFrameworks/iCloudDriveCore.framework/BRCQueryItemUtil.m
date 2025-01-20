@interface BRCQueryItemUtil
+ (id)sharedQueryItemUtil;
- (BRCQueryItemUtil)initWithMacOS:(BOOL)a3;
- (int64_t)contentPolicyForItemInfo:(id)a3 sessionContext:(id)a4;
- (int64_t)contentPolicyForRootContainerWithSessionContext:(id)a3;
@end

@implementation BRCQueryItemUtil

- (BRCQueryItemUtil)initWithMacOS:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRCQueryItemUtil;
  result = [(BRCQueryItemUtil *)&v5 init];
  if (result) {
    result->_isMacOS = a3;
  }
  return result;
}

+ (id)sharedQueryItemUtil
{
  if (sharedQueryItemUtil_onceToken != -1) {
    dispatch_once(&sharedQueryItemUtil_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)sharedQueryItemUtil_obj;
  return v2;
}

void __39__BRCQueryItemUtil_sharedQueryItemUtil__block_invoke()
{
  v0 = [[BRCQueryItemUtil alloc] initWithMacOS:0];
  v1 = (void *)sharedQueryItemUtil_obj;
  sharedQueryItemUtil_obj = (uint64_t)v0;
}

- (int64_t)contentPolicyForItemInfo:(id)a3 sessionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  LODWORD(self) = self->_isMacOS;
  int v8 = [v6 isZoneRoot];
  if (!self)
  {
    if (v8 && [v6 isAppInstalled] && (objc_msgSend(v6, "isWallet") & 1) != 0)
    {
      int64_t v9 = 3;
      goto LABEL_24;
    }
    v10 = +[BRCUserDefaults defaultsForMangledID:0];
    int v11 = [v10 fpfsSpeculativeSetDownload];

    if (v11
      && [v7 isOptimizeStorage]
      && ([v6 isZoneRoot] && (objc_msgSend(v6, "isDefaultZone") & 1) != 0
       || [v6 isAppInstalled] && (objc_msgSend(v6, "isDocumentsFolder") & 1) != 0))
    {
      int64_t v9 = 502;
      goto LABEL_24;
    }
LABEL_22:
    int64_t v9 = 0;
    goto LABEL_24;
  }
  if (!v8)
  {
    v12 = +[BRCUserDefaults defaultsForMangledID:0];
    if ([v12 fpfsOptimizeStorageAndSpeculativeDownload]
      && [v6 isAppInstalled]
      && ([v6 isWallet] & 1) == 0)
    {
      char v14 = [v6 isGreedyDocument];

      if (v14)
      {
        int64_t v9 = 501;
        goto LABEL_24;
      }
    }
    else
    {
    }
    goto LABEL_22;
  }
  if ([v6 isAppInstalled])
  {
    if ([v6 isWallet]) {
      int64_t v9 = 3;
    }
    else {
      int64_t v9 = 0;
    }
  }
  else
  {
    int64_t v9 = 2;
  }
LABEL_24:

  return v9;
}

- (int64_t)contentPolicyForRootContainerWithSessionContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_isMacOS)
  {
    if (([v4 isOptimizeStorage] & 1) != 0 || objc_msgSend(v5, "isDataSeparated"))
    {
      id v6 = +[BRCUserDefaults defaultsForMangledID:0];
      int v7 = [v6 fpfsOptimizeStorageAndSpeculativeDownload];

      if (v7) {
        int64_t v8 = 500;
      }
      else {
        int64_t v8 = 1;
      }
    }
    else
    {
      int64_t v8 = 3;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

@end