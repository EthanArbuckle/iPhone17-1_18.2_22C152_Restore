@interface SPUAProgressItem
+ (void)initialize;
+ (void)queueRelatedDelete:(id)a3 forBundleID:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleID;
- (NSString)relatedID;
- (NSString)uaID;
- (SPUAProgressItem)initWithBundleID:(id)a3 uaID:(id)a4 relatedID:(id)a5;
- (unint64_t)hash;
- (unsigned)completeCount;
- (unsigned)deleteCount;
- (unsigned)errorCount;
- (unsigned)expectedCount;
- (void)add;
- (void)setBundleID:(id)a3;
- (void)setCompleteCount:(unsigned int)a3;
- (void)setDeleteCount:(unsigned int)a3;
- (void)setErrorCount:(unsigned int)a3;
- (void)setExpectedCount:(unsigned int)a3;
- (void)setRelatedID:(id)a3;
- (void)setUaID:(id)a3;
- (void)update:(int)a3;
@end

@implementation SPUAProgressItem

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = dispatch_queue_attr_make_with_qos_class(v2, (dispatch_qos_class_t)5u, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.spotlight.index.buckets", v3);
    v5 = (void *)sBatchDeleteQueue;
    sBatchDeleteQueue = (uint64_t)v4;

    uint64_t v6 = objc_opt_new();
    v7 = (void *)sDeleteBatches;
    sDeleteBatches = v6;

    uint64_t v8 = objc_opt_new();
    v9 = (void *)sUserActionItems;
    sUserActionItems = v8;

    sTotalOutstandingDeletes = 0;
  }
}

- (SPUAProgressItem)initWithBundleID:(id)a3 uaID:(id)a4 relatedID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SPUAProgressItem;
  v12 = [(SPUAProgressItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleID, a3);
    objc_storeStrong((id *)&v13->_uaID, a4);
    objc_storeStrong((id *)&v13->_relatedID, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    bundleID = self->_bundleID;
    v7 = [v5 bundleID];
    if ([(NSString *)bundleID isEqual:v7])
    {
      uaID = self->_uaID;
      id v9 = [v5 uaID];
      if ([(NSString *)uaID isEqual:v9])
      {
        relatedID = self->_relatedID;
        id v11 = [v5 relatedID];
        char v12 = [(NSString *)relatedID isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v2 = [(SPUAProgressItem *)self uaID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)add
{
  if (self->_expectedCount)
  {
    v2 = sBatchDeleteQueue;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __23__SPUAProgressItem_add__block_invoke;
    v4[3] = &unk_2645063F8;
    v4[4] = self;
    unint64_t v3 = _setup_block(v4, 0, 18535);
    dispatch_async(v2, v3);
  }
}

void __23__SPUAProgressItem_add__block_invoke(uint64_t a1)
{
  v2 = [(id)sUserActionItems member:*(void *)(a1 + 32)];
  id v3 = v2;
  if (v2) {
    objc_msgSend(v2, "setExpectedCount:", *(_DWORD *)(*(void *)(a1 + 32) + 8) + objc_msgSend(v2, "expectedCount"));
  }
  else {
    [(id)sUserActionItems addObject:*(void *)(a1 + 32)];
  }
}

+ (void)queueRelatedDelete:(id)a3 forBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sBatchDeleteQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__SPUAProgressItem_queueRelatedDelete_forBundleID___block_invoke;
  v11[3] = &unk_2645065E8;
  id v12 = v6;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = _setup_block(v11, 0, 18542);
  dispatch_async(v7, v10);
}

void __51__SPUAProgressItem_queueRelatedDelete_forBundleID___block_invoke(uint64_t a1)
{
}

- (void)update:(int)a3
{
  id v3 = sBatchDeleteQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__SPUAProgressItem_update___block_invoke;
  v5[3] = &unk_264506EA8;
  v5[4] = self;
  int v6 = a3;
  id v4 = _setup_block(v5, 0, 18574);
  dispatch_async(v3, v4);
}

void __27__SPUAProgressItem_update___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = [(id)sUserActionItems member:*(void *)(a1 + 32)];
  id v3 = v2;
  if (v2)
  {
    LODWORD(v4) = [v2 deleteCount];
    LODWORD(v5) = [v3 completeCount];
    int v6 = [v3 errorCount];
    LODWORD(v7) = v6;
    int v8 = *(_DWORD *)(a1 + 40);
    if (v8 == 2)
    {
      uint64_t v4 = (v4 + 1);
      [v3 setDeleteCount:v4];
    }
    else if (v8)
    {
      uint64_t v7 = (v6 + 1);
      [v3 setErrorCount:v7];
    }
    else
    {
      uint64_t v5 = (v5 + 1);
      [v3 setCompleteCount:v5];
    }
    id v9 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v13 = *(_DWORD *)(a1 + 40);
      v14 = [v3 bundleID];
      objc_super v15 = [v3 relatedID];
      v16 = [v3 uaID];
      v17[0] = 67111170;
      v17[1] = v13;
      __int16 v18 = 2112;
      v19 = v14;
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      __int16 v24 = 1024;
      int v25 = v7;
      __int16 v26 = 1024;
      int v27 = [v3 expectedCount];
      __int16 v28 = 1024;
      int v29 = v5;
      __int16 v30 = 1024;
      int v31 = v4;
      __int16 v32 = 1024;
      int v33 = v7;
      _os_log_debug_impl(&dword_21F1CE000, v9, OS_LOG_TYPE_DEBUG, "update relatedItem(%d) %@:%@:%@ %d:%d:%d:%d:%d", (uint8_t *)v17, 0x44u);
    }
    unsigned int v10 = v5 + v4 + [v3 errorCount];
    if (v10 >= [v3 expectedCount])
    {
      [(id)sUserActionItems removeObject:v3];
      if (v4)
      {
        if (!v5)
        {
          id v11 = [v3 bundleID];
          id v12 = [v3 relatedID];
          _queueRelatedDelete(v11, v12);
        }
      }
    }
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)uaID
{
  return self->_uaID;
}

- (void)setUaID:(id)a3
{
}

- (NSString)relatedID
{
  return self->_relatedID;
}

- (void)setRelatedID:(id)a3
{
}

- (unsigned)expectedCount
{
  return self->_expectedCount;
}

- (void)setExpectedCount:(unsigned int)a3
{
  self->_expectedCount = a3;
}

- (unsigned)completeCount
{
  return self->_completeCount;
}

- (void)setCompleteCount:(unsigned int)a3
{
  self->_completeCount = a3;
}

- (unsigned)errorCount
{
  return self->_errorCount;
}

- (void)setErrorCount:(unsigned int)a3
{
  self->_errorCount = a3;
}

- (unsigned)deleteCount
{
  return self->_deleteCount;
}

- (void)setDeleteCount:(unsigned int)a3
{
  self->_deleteCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedID, 0);
  objc_storeStrong((id *)&self->_uaID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end