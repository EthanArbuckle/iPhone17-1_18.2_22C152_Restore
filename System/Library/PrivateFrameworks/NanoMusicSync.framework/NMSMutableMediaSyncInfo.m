@interface NMSMutableMediaSyncInfo
+ (id)requiredUserInfoPropertiesForModelKind:(id)a3;
- (BOOL)hasItemsOverStorageLimit;
- (BOOL)hasItemsOverStorageLimitForContainer:(id)a3;
- (BOOL)hasItemsWaitingWithoutPauseReason;
- (NMSMutableMediaSyncInfo)initWithTarget:(unint64_t)a3;
- (float)progress;
- (float)progressForContainer:(id)a3;
- (id)_info;
- (id)_infoForContainer:(id)a3;
- (id)_infoForItem:(id)a3;
- (unint64_t)_persistingOptions;
- (unint64_t)downloadPauseReason;
- (unint64_t)downloadPauseReasonForContainer:(id)a3;
- (unint64_t)playabilityForContainer:(id)a3;
- (unint64_t)status;
- (unint64_t)statusForContainer:(id)a3;
- (void)_notifyInfoChanged;
- (void)_updateAggregateInfoIfNeeded;
- (void)_writeInfo;
- (void)setDownloadPauseReason:(unint64_t)a3 forItem:(id)a4;
- (void)setItems:(id)a3 forContainer:(id)a4;
- (void)setOverStorageLimit:(BOOL)a3 forItem:(id)a4;
- (void)setOverStorageLimitBehavior:(unint64_t)a3 forContainer:(id)a4;
- (void)setProgressBytes:(unint64_t)a3 totalBytes:(unint64_t)a4 forItem:(id)a5;
- (void)setStatus:(unint64_t)a3 forItem:(id)a4;
- (void)setUserInfo:(id)a3 forContainer:(id)a4;
- (void)setUserInfo:(id)a3 forItem:(id)a4;
- (void)setUserInfoForModelObject:(id)a3 manuallyPinned:(BOOL)a4;
- (void)synchronize;
@end

@implementation NMSMutableMediaSyncInfo

- (NMSMutableMediaSyncInfo)initWithTarget:(unint64_t)a3
{
  return (NMSMutableMediaSyncInfo *)[(NMSMediaSyncInfo *)self _initWithTarget:a3 readAndObserveChanges:0];
}

- (unint64_t)statusForContainer:(id)a3
{
  id v4 = a3;
  [(NMSMutableMediaSyncInfo *)self _updateAggregateInfoIfNeeded];
  v7.receiver = self;
  v7.super_class = (Class)NMSMutableMediaSyncInfo;
  id v5 = [(NMSMediaSyncInfo *)&v7 statusForContainer:v4];

  return (unint64_t)v5;
}

- (unint64_t)playabilityForContainer:(id)a3
{
  id v4 = a3;
  [(NMSMutableMediaSyncInfo *)self _updateAggregateInfoIfNeeded];
  v7.receiver = self;
  v7.super_class = (Class)NMSMutableMediaSyncInfo;
  id v5 = [(NMSMediaSyncInfo *)&v7 playabilityForContainer:v4];

  return (unint64_t)v5;
}

- (float)progressForContainer:(id)a3
{
  id v4 = a3;
  [(NMSMutableMediaSyncInfo *)self _updateAggregateInfoIfNeeded];
  v8.receiver = self;
  v8.super_class = (Class)NMSMutableMediaSyncInfo;
  [(NMSMediaSyncInfo *)&v8 progressForContainer:v4];
  float v6 = v5;

  return v6;
}

- (unint64_t)downloadPauseReasonForContainer:(id)a3
{
  id v4 = a3;
  [(NMSMutableMediaSyncInfo *)self _updateAggregateInfoIfNeeded];
  v7.receiver = self;
  v7.super_class = (Class)NMSMutableMediaSyncInfo;
  id v5 = [(NMSMediaSyncInfo *)&v7 downloadPauseReasonForContainer:v4];

  return (unint64_t)v5;
}

- (BOOL)hasItemsOverStorageLimitForContainer:(id)a3
{
  id v4 = a3;
  [(NMSMutableMediaSyncInfo *)self _updateAggregateInfoIfNeeded];
  v6.receiver = self;
  v6.super_class = (Class)NMSMutableMediaSyncInfo;
  LOBYTE(self) = [(NMSMediaSyncInfo *)&v6 hasItemsOverStorageLimitForContainer:v4];

  return (char)self;
}

- (unint64_t)status
{
  [(NMSMutableMediaSyncInfo *)self _updateAggregateInfoIfNeeded];
  v4.receiver = self;
  v4.super_class = (Class)NMSMutableMediaSyncInfo;
  return [(NMSMediaSyncInfo *)&v4 status];
}

- (float)progress
{
  [(NMSMutableMediaSyncInfo *)self _updateAggregateInfoIfNeeded];
  v4.receiver = self;
  v4.super_class = (Class)NMSMutableMediaSyncInfo;
  [(NMSMediaSyncInfo *)&v4 progress];
  return result;
}

- (unint64_t)downloadPauseReason
{
  [(NMSMutableMediaSyncInfo *)self _updateAggregateInfoIfNeeded];
  v4.receiver = self;
  v4.super_class = (Class)NMSMutableMediaSyncInfo;
  return [(NMSMediaSyncInfo *)&v4 downloadPauseReason];
}

- (BOOL)hasItemsWaitingWithoutPauseReason
{
  [(NMSMutableMediaSyncInfo *)self _updateAggregateInfoIfNeeded];
  v4.receiver = self;
  v4.super_class = (Class)NMSMutableMediaSyncInfo;
  return [(NMSMediaSyncInfo *)&v4 hasItemsWaitingWithoutPauseReason];
}

- (BOOL)hasItemsOverStorageLimit
{
  [(NMSMutableMediaSyncInfo *)self _updateAggregateInfoIfNeeded];
  v4.receiver = self;
  v4.super_class = (Class)NMSMutableMediaSyncInfo;
  return [(NMSMediaSyncInfo *)&v4 hasItemsOverStorageLimit];
}

- (void)setItems:(id)a3 forContainer:(id)a4
{
  id v6 = a3;
  id v10 = [(NMSMutableMediaSyncInfo *)self _infoForContainer:a4];
  [v10 setObject:v6 forKeyedSubscript:@"itemsIdentifiers"];
  objc_super v7 = NSNumber;
  uint64_t v8 = [v6 count];

  v9 = [v7 numberWithUnsignedInteger:v8];
  [v10 setObject:v9 forKeyedSubscript:@"itemCount"];

  self->_needsUpdateAggregateInfo = 1;
}

- (void)setOverStorageLimitBehavior:(unint64_t)a3 forContainer:(id)a4
{
  id v7 = [(NMSMutableMediaSyncInfo *)self _infoForContainer:a4];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v7 setObject:v6 forKeyedSubscript:@"overStorageLimitBehavior"];

  self->_needsUpdateAggregateInfo = 1;
}

- (void)setStatus:(unint64_t)a3 forItem:(id)a4
{
  id v7 = [(NMSMutableMediaSyncInfo *)self _infoForItem:a4];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v7 setObject:v6 forKeyedSubscript:@"status"];

  self->_needsUpdateAggregateInfo = 1;
}

- (void)setProgressBytes:(unint64_t)a3 totalBytes:(unint64_t)a4 forItem:(id)a5
{
  id v10 = [(NMSMutableMediaSyncInfo *)self _infoForItem:a5];
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:a4];
  [v10 setObject:v8 forKeyedSubscript:@"totalBytes"];

  v9 = [NSNumber numberWithUnsignedLongLong:a3];
  [v10 setObject:v9 forKeyedSubscript:@"progressBytes"];

  self->_needsUpdateAggregateInfo = 1;
}

- (void)setDownloadPauseReason:(unint64_t)a3 forItem:(id)a4
{
  id v7 = [(NMSMutableMediaSyncInfo *)self _infoForItem:a4];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v7 setObject:v6 forKeyedSubscript:@"downloadPauseReason"];

  self->_needsUpdateAggregateInfo = 1;
}

- (void)setOverStorageLimit:(BOOL)a3 forItem:(id)a4
{
  BOOL v4 = a3;
  id v7 = [(NMSMutableMediaSyncInfo *)self _infoForItem:a4];
  id v6 = [NSNumber numberWithBool:v4];
  [v7 setObject:v6 forKeyedSubscript:@"overStorageLimit"];

  self->_needsUpdateAggregateInfo = 1;
}

- (void)setUserInfo:(id)a3 forContainer:(id)a4
{
  id v6 = a3;
  id v7 = [(NMSMutableMediaSyncInfo *)self _infoForContainer:a4];
  [v7 setObject:v6 forKeyedSubscript:@"userInfo"];
}

- (void)setUserInfo:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = [(NMSMutableMediaSyncInfo *)self _infoForItem:a4];
  [v7 setObject:v6 forKeyedSubscript:@"userInfo"];
}

- (void)synchronize
{
  [(NMSMutableMediaSyncInfo *)self _updateAggregateInfoIfNeeded];
  [(NMSMutableMediaSyncInfo *)self _writeInfo];

  [(NMSMutableMediaSyncInfo *)self _notifyInfoChanged];
}

- (id)_info
{
  v3 = [(NMSMediaSyncInfo *)self info];

  if (!v3)
  {
    BOOL v4 = [MEMORY[0x263EFF9A0] dictionary];
    [(NMSMediaSyncInfo *)self setInfo:v4];
  }

  return [(NMSMediaSyncInfo *)self info];
}

- (id)_infoForContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(NMSMediaSyncInfo *)self info];
  id v6 = [v5 objectForKeyedSubscript:@"containers"];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v8 = [(NMSMutableMediaSyncInfo *)self _info];
    v9 = [v8 objectForKeyedSubscript:@"containers"];

    if (!v9)
    {
      id v10 = [MEMORY[0x263EFF9A0] dictionary];
      [v8 setObject:v10 forKeyedSubscript:@"containers"];
    }
    v11 = [v8 objectForKeyedSubscript:@"containers"];
    [v11 setObject:v7 forKeyedSubscript:v4];
  }

  return v7;
}

- (id)_infoForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(NMSMediaSyncInfo *)self info];
  id v6 = [v5 objectForKeyedSubscript:@"items"];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v8 = [(NMSMutableMediaSyncInfo *)self _info];
    v9 = [v8 objectForKeyedSubscript:@"items"];

    if (!v9)
    {
      id v10 = [MEMORY[0x263EFF9A0] dictionary];
      [v8 setObject:v10 forKeyedSubscript:@"items"];
    }
    v11 = [v8 objectForKeyedSubscript:@"items"];
    [v11 setObject:v7 forKeyedSubscript:v4];
  }

  return v7;
}

- (void)_updateAggregateInfoIfNeeded
{
  if (self->_needsUpdateAggregateInfo)
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    v3 = [(NMSMediaSyncInfo *)self info];
    id v4 = [v3 objectForKeyedSubscript:@"containers"];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __55__NMSMutableMediaSyncInfo__updateAggregateInfoIfNeeded__block_invoke;
    v46[3] = &unk_264634188;
    v46[4] = self;
    v46[5] = &v47;
    [v4 enumerateKeysAndObjectsUsingBlock:v46];

    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 1;
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0;
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    id v5 = [(NMSMediaSyncInfo *)self info];
    id v6 = [v5 objectForKeyedSubscript:@"items"];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __55__NMSMutableMediaSyncInfo__updateAggregateInfoIfNeeded__block_invoke_3;
    v21[3] = &unk_2646341B0;
    v21[4] = &v42;
    v21[5] = &v38;
    v21[6] = &v34;
    v21[7] = &v30;
    v21[8] = &v26;
    v21[9] = &v22;
    [v6 enumerateKeysAndObjectsUsingBlock:v21];

    if (*((unsigned char *)v43 + 24)) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = v39[3];
    }
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
    v9 = [(NMSMediaSyncInfo *)self info];
    [v9 setObject:v8 forKeyedSubscript:@"status"];

    unint64_t v11 = v35[3];
    if (v11)
    {
      double v12 = (double)(unint64_t)v31[3] / (double)v11;
    }
    else
    {
      LOBYTE(v10) = *((unsigned char *)v43 + 24);
      double v12 = (double)v10;
    }
    v13 = [NSNumber numberWithDouble:v12];
    v14 = [(NMSMediaSyncInfo *)self info];
    [v14 setObject:v13 forKeyedSubscript:@"cachedProgress"];

    v15 = [NSNumber numberWithUnsignedInteger:v27[3]];
    v16 = [(NMSMediaSyncInfo *)self info];
    [v16 setObject:v15 forKeyedSubscript:@"downloadPauseReason"];

    v17 = [NSNumber numberWithBool:*((unsigned __int8 *)v23 + 24)];
    v18 = [(NMSMediaSyncInfo *)self info];
    [v18 setObject:v17 forKeyedSubscript:@"hasItemsWaitingWithoutPauseReason"];

    v19 = [NSNumber numberWithBool:*((unsigned __int8 *)v48 + 24)];
    v20 = [(NMSMediaSyncInfo *)self info];
    [v20 setObject:v19 forKeyedSubscript:@"hasItemsOverStorageLimit"];

    self->_needsUpdateAggregateInfo = 0;
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v47, 8);
  }
}

void __55__NMSMutableMediaSyncInfo__updateAggregateInfoIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 1;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"overStorageLimitBehavior"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  BOOL v9 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  BOOL v29 = 0;
  if (v8 == 2)
  {
    unint64_t v10 = [v6 objectForKeyedSubscript:@"itemsIdentifiers"];
    BOOL v9 = [v10 count] != 0;
  }
  BOOL v29 = v9;
  unint64_t v11 = [v6 objectForKeyedSubscript:@"itemsIdentifiers"];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __55__NMSMutableMediaSyncInfo__updateAggregateInfoIfNeeded__block_invoke_2;
  v25[3] = &unk_264634160;
  v25[4] = *(void *)(a1 + 32);
  v25[5] = &v58;
  v25[6] = &v54;
  v25[7] = &v50;
  v25[8] = &v46;
  v25[9] = &v42;
  v25[10] = &v38;
  v25[11] = &v34;
  v25[12] = &v26;
  v25[13] = &v30;
  v25[14] = v8;
  [v11 enumerateObjectsUsingBlock:v25];

  if (*((unsigned char *)v59 + 24)) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = v55[3];
  }
  v13 = [NSNumber numberWithUnsignedInteger:v12];
  [v6 setObject:v13 forKeyedSubscript:@"status"];

  unint64_t v15 = v47[3];
  if (v15)
  {
    double v16 = (double)(unint64_t)v43[3] / (double)v15;
  }
  else
  {
    LOBYTE(v14) = *((unsigned char *)v59 + 24);
    double v16 = (double)v14;
  }
  v17 = [NSNumber numberWithDouble:v16];
  [v6 setObject:v17 forKeyedSubscript:@"cachedProgress"];

  v18 = [NSNumber numberWithUnsignedInteger:v39[3]];
  [v6 setObject:v18 forKeyedSubscript:@"downloadPauseReason"];

  v19 = [NSNumber numberWithBool:*((unsigned __int8 *)v35 + 24)];
  [v6 setObject:v19 forKeyedSubscript:@"hasItemsWaitingWithoutPauseReason"];

  v20 = [NSNumber numberWithUnsignedInteger:v51[3]];
  [v6 setObject:v20 forKeyedSubscript:@"playability"];

  v21 = [NSNumber numberWithBool:*((unsigned __int8 *)v27 + 24)];
  [v6 setObject:v21 forKeyedSubscript:@"hasItemsOverStorageLimit"];

  uint64_t v22 = [NSNumber numberWithBool:*((unsigned __int8 *)v31 + 24)];
  [v6 setObject:v22 forKeyedSubscript:@"hasDownloadableItemsWithinStorageLimitKey"];

  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v23 + 24)) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = *((unsigned char *)v27 + 24) != 0;
  }
  *(unsigned char *)(v23 + 24) = v24;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
}

void __55__NMSMutableMediaSyncInfo__updateAggregateInfoIfNeeded__block_invoke_2(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 info];
  id v6 = [v5 objectForKeyedSubscript:@"items"];
  id v21 = [v6 objectForKeyedSubscript:v4];

  uint64_t v7 = [v21 objectForKeyedSubscript:@"status"];
  unint64_t v8 = [v7 integerValue];

  if (v8)
  {
    if (v8 == 4)
    {
      *(void *)(*(void *)(a1[7] + 8) + 24) = 1;
    }
    else
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
      uint64_t v9 = *(void *)(a1[6] + 8);
      unint64_t v10 = *(void *)(v9 + 24);
      if (v10 != 3)
      {
        if (v10 <= v8) {
          unint64_t v10 = v8;
        }
        if (v8 == 3) {
          unint64_t v10 = 3;
        }
        *(void *)(v9 + 24) = v10;
      }
    }
    unint64_t v11 = [v21 objectForKeyedSubscript:@"totalBytes"];
    *(void *)(*(void *)(a1[8] + 8) + 24) += [v11 unsignedLongLongValue];

    uint64_t v12 = [v21 objectForKeyedSubscript:@"progressBytes"];
    *(void *)(*(void *)(a1[9] + 8) + 24) += [v12 unsignedLongLongValue];
  }
  v13 = [v21 objectForKeyedSubscript:@"downloadPauseReason"];
  uint64_t v14 = [v13 integerValue];

  *(void *)(*(void *)(a1[10] + 8) + 24) |= v14;
  if (v8 == 2 && v14 == 0) {
    *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = 1;
  }
  double v16 = [v21 objectForKeyedSubscript:@"overStorageLimit"];
  int v17 = [v16 BOOLValue];

  uint64_t v18 = a1[14];
  if (v18 == 2)
  {
    v19 = v21;
    if (v17) {
      goto LABEL_28;
    }
    *(unsigned char *)(*(void *)(a1[12] + 8) + 24) = 0;
  }
  else if (v18 == 1)
  {
    v19 = v21;
    if (v17)
    {
      uint64_t v20 = a1[12];
      goto LABEL_27;
    }
  }
  else
  {
    v19 = v21;
    if (v17) {
      goto LABEL_28;
    }
  }
  if ((v8 | 4) == 4) {
    goto LABEL_28;
  }
  uint64_t v20 = a1[13];
LABEL_27:
  *(unsigned char *)(*(void *)(v20 + 8) + 24) = 1;
LABEL_28:
}

void __55__NMSMutableMediaSyncInfo__updateAggregateInfoIfNeeded__block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  id v4 = [v12 objectForKeyedSubscript:@"status"];
  unint64_t v5 = [v4 integerValue];

  if (v5)
  {
    if (v5 != 4)
    {
      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
      uint64_t v6 = *(void *)(a1[5] + 8);
      unint64_t v7 = *(void *)(v6 + 24);
      if (v7 != 3)
      {
        if (v7 <= v5) {
          unint64_t v7 = v5;
        }
        if (v5 == 3) {
          unint64_t v7 = 3;
        }
        *(void *)(v6 + 24) = v7;
      }
    }
    unint64_t v8 = [v12 objectForKeyedSubscript:@"totalBytes"];
    *(void *)(*(void *)(a1[6] + 8) + 24) += [v8 unsignedLongLongValue];

    uint64_t v9 = [v12 objectForKeyedSubscript:@"progressBytes"];
    *(void *)(*(void *)(a1[7] + 8) + 24) += [v9 unsignedLongLongValue];
  }
  unint64_t v10 = [v12 objectForKeyedSubscript:@"downloadPauseReason"];
  uint64_t v11 = [v10 integerValue];

  *(void *)(*(void *)(a1[8] + 8) + 24) |= v11;
  if (v5 == 2 && !v11) {
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }
}

- (void)_writeInfo
{
  v38[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v5 = [(NMSMutableMediaSyncInfo *)self _persistingOptions];
  uint64_t v6 = [(NMSMediaSyncInfo *)self info];
  unint64_t v7 = [v6 objectForKeyedSubscript:@"containers"];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __37__NMSMutableMediaSyncInfo__writeInfo__block_invoke;
  v34[3] = &unk_2646341D8;
  unint64_t v36 = v5;
  id v8 = v4;
  id v35 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v34];

  if ([v8 count]) {
    [v3 setObject:v8 forKeyedSubscript:@"containers"];
  }
  if ((v5 & 4) != 0)
  {
    uint64_t v9 = [(NMSMediaSyncInfo *)self info];
    unint64_t v10 = [v9 objectForKeyedSubscript:@"status"];
    [v3 setObject:v10 forKeyedSubscript:@"status"];

    uint64_t v11 = [(NMSMediaSyncInfo *)self info];
    id v12 = [v11 objectForKeyedSubscript:@"cachedProgress"];
    [v3 setObject:v12 forKeyedSubscript:@"cachedProgress"];

    v13 = [(NMSMediaSyncInfo *)self info];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"downloadPauseReason"];
    [v3 setObject:v14 forKeyedSubscript:@"downloadPauseReason"];

    unint64_t v15 = [(NMSMediaSyncInfo *)self info];
    double v16 = [v15 objectForKeyedSubscript:@"hasItemsWaitingWithoutPauseReason"];
    [v3 setObject:v16 forKeyedSubscript:@"hasItemsWaitingWithoutPauseReason"];

    int v17 = NSNumber;
    uint64_t v18 = [(NMSMediaSyncInfo *)self info];
    v19 = [v18 objectForKeyedSubscript:@"items"];
    uint64_t v20 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
    [v3 setObject:v20 forKeyedSubscript:@"itemCount"];

    id v21 = [(NMSMediaSyncInfo *)self info];
    uint64_t v22 = [v21 objectForKeyedSubscript:@"hasItemsOverStorageLimit"];
    [v3 setObject:v22 forKeyedSubscript:@"hasItemsOverStorageLimit"];
  }
  uint64_t v23 = +[NMSyncDefaults sharedDefaults];
  int v24 = [v23 debugSyncInfoEnabled];

  if (v24)
  {
    char v25 = [(NMSMediaSyncInfo *)self info];
    [v3 setObject:v25 forKeyedSubscript:@"debug-info"];
  }
  uint64_t v26 = +[NMSyncDefaults sharedDefaults];
  switch([(NMSMediaSyncInfo *)self target])
  {
    case 0uLL:
      [v26 setMusicSyncInfo:v3];
      break;
    case 1uLL:
      [v26 setPodcastsSyncInfo:v3];
      uint64_t v28 = [(NMSMediaSyncInfo *)self info];
      BOOL v29 = [v28 objectForKeyedSubscript:@"items"];
      if (v29)
      {
        char v37 = @"items";
        uint64_t v30 = [(NMSMediaSyncInfo *)self info];
        v31 = [v30 objectForKeyedSubscript:@"items"];
        v38[0] = v31;
        uint64_t v32 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
      }
      else
      {
        uint64_t v32 = (void *)MEMORY[0x263EFFA78];
      }

      char v33 = [(NMSMediaSyncInfo *)self _syncInfoFilePath];
      [v32 writeToFile:v33 atomically:1];

      break;
    case 2uLL:
      [v26 setAudiobooksSyncInfo:v3];
      break;
    case 3uLL:
    case 4uLL:
      v27 = [(NMSMediaSyncInfo *)self _syncInfoFilePath];
      [v3 writeToFile:v27 atomically:1];

      break;
    default:
      break;
  }
}

void __37__NMSMutableMediaSyncInfo__writeInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    id v8 = [v5 objectForKeyedSubscript:@"itemsIdentifiers"];
    [v6 setObject:v8 forKeyedSubscript:@"itemsIdentifiers"];

    uint64_t v7 = *(void *)(a1 + 40);
  }
  if ((v7 & 2) != 0)
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:@"status"];
    [v6 setObject:v9 forKeyedSubscript:@"status"];

    unint64_t v10 = [v5 objectForKeyedSubscript:@"playability"];
    [v6 setObject:v10 forKeyedSubscript:@"playability"];

    uint64_t v11 = [v5 objectForKeyedSubscript:@"cachedProgress"];
    [v6 setObject:v11 forKeyedSubscript:@"cachedProgress"];

    id v12 = [v5 objectForKeyedSubscript:@"downloadPauseReason"];
    [v6 setObject:v12 forKeyedSubscript:@"downloadPauseReason"];

    v13 = [v5 objectForKeyedSubscript:@"hasItemsWaitingWithoutPauseReason"];
    [v6 setObject:v13 forKeyedSubscript:@"hasItemsWaitingWithoutPauseReason"];

    uint64_t v14 = [v5 objectForKeyedSubscript:@"itemCount"];
    [v6 setObject:v14 forKeyedSubscript:@"itemCount"];

    unint64_t v15 = [v5 objectForKeyedSubscript:@"hasItemsOverStorageLimit"];
    [v6 setObject:v15 forKeyedSubscript:@"hasItemsOverStorageLimit"];

    double v16 = [v5 objectForKeyedSubscript:@"hasDownloadableItemsWithinStorageLimitKey"];
    [v6 setObject:v16 forKeyedSubscript:@"hasDownloadableItemsWithinStorageLimitKey"];

    int v17 = [v5 objectForKeyedSubscript:@"userInfo"];
    [v6 setObject:v17 forKeyedSubscript:@"userInfo"];
  }
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v18];
}

- (unint64_t)_persistingOptions
{
  unint64_t v2 = [(NMSMediaSyncInfo *)self target];
  if (v2 > 4) {
    return 0;
  }
  else {
    return qword_222950568[v2];
  }
}

- (void)_notifyInfoChanged
{
  id v2 = [(NMSMediaSyncInfo *)self _notificationName];
  notify_post((const char *)[v2 UTF8String]);
}

+ (id)requiredUserInfoPropertiesForModelKind:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 identityKind];
  id v5 = [MEMORY[0x263F11E88] identityKind];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263F12180];
    uint64_t v8 = *MEMORY[0x263F114A8];
    v19[0] = *MEMORY[0x263F114C0];
    v19[1] = v8;
    uint64_t v9 = (void *)MEMORY[0x263EFF8C0];
    unint64_t v10 = v19;
LABEL_5:
    unint64_t v15 = [v9 arrayWithObjects:v10 count:2];
    double v16 = [v7 propertySetWithProperties:v15];

    goto LABEL_7;
  }
  uint64_t v11 = [v3 identityKind];
  id v12 = [MEMORY[0x263F11FB8] identityKind];
  int v13 = [v11 isEqual:v12];

  uint64_t v7 = (void *)MEMORY[0x263F12180];
  if (v13)
  {
    uint64_t v14 = *MEMORY[0x263F11660];
    v18[0] = *MEMORY[0x263F11670];
    v18[1] = v14;
    uint64_t v9 = (void *)MEMORY[0x263EFF8C0];
    unint64_t v10 = v18;
    goto LABEL_5;
  }
  double v16 = [MEMORY[0x263F12180] emptyPropertySet];
LABEL_7:

  return v16;
}

- (void)setUserInfoForModelObject:(id)a3 manuallyPinned:(BOOL)a4
{
  id v33 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v33;
    uint64_t v8 = (void *)MEMORY[0x263F573E8];
    uint64_t v9 = NSNumber;
    unint64_t v10 = [v7 identifiers];
    uint64_t v11 = [v10 library];
    id v12 = objc_msgSend(v9, "numberWithLongLong:", objc_msgSend(v11, "persistentID"));
    int v13 = [v8 midDataFromAlbumPID:v12];
    [v6 setObject:v13 forKey:@"midData"];

    if (a4)
    {
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "keepLocalEnableState"));
      [v6 setObject:v14 forKey:@"keepLocal"];
    }
    else
    {
      [v6 setObject:&unk_26D51D160 forKey:@"keepLocal"];
    }
    uint64_t v23 = [MEMORY[0x263F11E88] identityKind];
    int v24 = [(NMSMediaSyncInfo *)self _syncInfoModelKindForMPModelKind:v23];
    [v6 setObject:v24 forKey:@"modelKind"];

    char v25 = [v7 title];

    if (!v25) {
      goto LABEL_14;
    }
    uint64_t v26 = [v7 title];
    v27 = @"title";
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  id v15 = v33;
  double v16 = (void *)MEMORY[0x263F573E8];
  int v17 = NSNumber;
  id v18 = [v15 identifiers];
  v19 = [v18 library];
  uint64_t v20 = objc_msgSend(v17, "numberWithLongLong:", objc_msgSend(v19, "persistentID"));
  id v21 = [v16 midDataFromPlaylistPID:v20];
  [v6 setObject:v21 forKey:@"midData"];

  if (a4)
  {
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "keepLocalEnableState"));
    [v6 setObject:v22 forKey:@"keepLocal"];
  }
  else
  {
    [v6 setObject:&unk_26D51D160 forKey:@"keepLocal"];
  }
  uint64_t v28 = [MEMORY[0x263F11FB8] identityKind];
  BOOL v29 = [(NMSMediaSyncInfo *)self _syncInfoModelKindForMPModelKind:v28];
  [v6 setObject:v29 forKey:@"modelKind"];

  uint64_t v30 = [v15 name];

  if (v30)
  {
    uint64_t v26 = [v15 name];
    v27 = @"name";
LABEL_13:
    [v6 setObject:v26 forKey:v27];
  }
LABEL_14:

LABEL_15:
  v31 = (void *)[v6 copy];
  uint64_t v32 = objc_msgSend(v33, "nms_syncInfoContainerIdentifier");
  [(NMSMutableMediaSyncInfo *)self setUserInfo:v31 forContainer:v32];
}

@end