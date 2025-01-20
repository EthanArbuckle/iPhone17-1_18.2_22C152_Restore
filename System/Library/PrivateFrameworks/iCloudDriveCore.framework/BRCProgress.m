@interface BRCProgress
+ (id)_progressForDocument:(id)a3 group:(char)a4 sizeInfo:(id)a5;
+ (id)uploadProgressForDocument:(id)a3 sizeInfo:(id)a4;
- (BOOL)isPublished;
- (BRCProgress)initWithGroup:(char)a3 session:(id)a4;
- (BRCProgress)initWithIgnorePublish:(BOOL)a3;
- (void)_setupProgressForDocument:(id)a3 group:(char)a4 sizeInfo:(id)a5;
- (void)_updateToBeProgressForDocument:(id)a3 group:(char)a4 sizeinfo:(id)a5;
- (void)addAliasItem:(id)a3;
- (void)brc_publish;
- (void)brc_unpublish;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setSession:(id)a3 group:(char)a4;
- (void)updateToBeDownloadProgressForDocument:(id)a3 sizeInfo:(id)a4;
@end

@implementation BRCProgress

- (void)setCompletedUnitCount:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BRCProgress;
  -[BRCProgress setCompletedUnitCount:](&v8, sel_setCompletedUnitCount_);
  v5 = self;
  objc_sync_enter(v5);
  progressByAliasContainerID = v5->_progressByAliasContainerID;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__BRCProgress_setCompletedUnitCount___block_invoke;
  v7[3] = &__block_descriptor_40_e27_v32__0_8__NSProgress_16_B24l;
  v7[4] = a3;
  [(NSMutableDictionary *)progressByAliasContainerID enumerateKeysAndObjectsUsingBlock:v7];
  objc_sync_exit(v5);
}

uint64_t __37__BRCProgress_setCompletedUnitCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setCompletedUnitCount:*(void *)(a1 + 32)];
}

- (void)brc_publish
{
  if (!self->_ignorePublish)
  {
    v4.receiver = self;
    v4.super_class = (Class)BRCProgress;
    [(NSProgress *)&v4 brc_publish];
    v3 = self;
    objc_sync_enter(v3);
    v3->_published = 1;
    [(NSMutableDictionary *)v3->_progressByAliasContainerID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_4];
    objc_sync_exit(v3);
  }
}

uint64_t __26__BRCProgress_brc_publish__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "brc_publish");
}

- (void)brc_unpublish
{
  if (!self->_ignorePublish)
  {
    v4.receiver = self;
    v4.super_class = (Class)BRCProgress;
    [(NSProgress *)&v4 brc_unpublish];
    v3 = self;
    objc_sync_enter(v3);
    v3->_published = 0;
    [(NSMutableDictionary *)v3->_progressByAliasContainerID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_38];
    objc_sync_exit(v3);
  }
}

uint64_t __28__BRCProgress_brc_unpublish__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "brc_unpublish");
}

- (void)updateToBeDownloadProgressForDocument:(id)a3 sizeInfo:(id)a4
{
}

+ (id)uploadProgressForDocument:(id)a3 sizeInfo:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [a1 _progressForDocument:v6 group:1 sizeInfo:a4];
  if (v7)
  {
    objc_super v8 = [v6 session];
    v9 = [v8 globalProgress];
    [v9 addProgress:v7 forDocument:v6 inGroup:1];
  }
  else
  {
    objc_super v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] failed getting upload progress for %@%@", (uint8_t *)&v11, 0x16u);
    }
  }

  return v7;
}

- (BRCProgress)initWithGroup:(char)a3 session:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BRCProgress;
  v7 = [(BRCProgress *)&v10 initWithParent:0 userInfo:0];
  objc_super v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_session, v6);
    v8->_group = a3;
  }

  return v8;
}

- (BRCProgress)initWithIgnorePublish:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRCProgress;
  result = [(BRCProgress *)&v5 init];
  if (result) {
    result->_ignorePublish = a3;
  }
  return result;
}

- (void)setSession:(id)a3 group:(char)a4
{
  self->_group = a4;
}

- (void)_setupProgressForDocument:(id)a3 group:(char)a4 sizeInfo:(id)a5
{
  int v6 = a4;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v6 == 1)
  {
    objc_super v10 = [v8 st];
    v40 = [v10 logicalName];

    int v11 = NSNumber;
    id v12 = [v9 objectForKeyedSubscript:@"BRCSizeInfoTotalUnitCountKey"];
    __int16 v13 = objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "longLongValue"));
    [(BRCProgress *)self setUserInfoObject:v13 forKey:*MEMORY[0x263F08460]];

    v14 = [v8 fileObjectID];
    uint64_t v15 = [v14 asString];
    [(BRCProgress *)self setUserInfoObject:v15 forKey:@"ICDProgressObjectID"];
  }
  else
  {
    v40 = 0;
  }
  v16 = [v9 objectForKeyedSubscript:@"BRCSizeInfoCompletedUnitCountKey"];
  -[BRCProgress setCompletedUnitCount:](self, "setCompletedUnitCount:", [v16 longLongValue]);

  v17 = [v9 objectForKeyedSubscript:@"BRCSizeInfoTotalUnitCountKey"];
  -[BRCProgress setTotalUnitCount:](self, "setTotalUnitCount:", [v17 longLongValue]);

  if ([(BRCProgress *)self completedUnitCount] < 0
    || [(BRCProgress *)self totalUnitCount] < 0)
  {
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v48 = (BRCProgress *)[(BRCProgress *)self totalUnitCount];
      __int16 v49 = 2048;
      uint64_t v50 = [(BRCProgress *)self completedUnitCount];
      __int16 v51 = 2112;
      v52 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress initialized with negative values. total [%lld] completed [%lld]%@", buf, 0x20u);
    }
  }
  [(BRCProgress *)self setKind:*MEMORY[0x263F084A0]];
  [(BRCProgress *)self setUserInfoObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32470]];
  [(BRCProgress *)self setCancellable:0];
  v20 = (id *)MEMORY[0x263F08478];
  if (v40)
  {
    -[BRCProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:");
    if (v6 == 1) {
      id v21 = (id)*MEMORY[0x263F08488];
    }
    else {
      id v21 = *v20;
    }
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = _BRLocalizedStringWithFormat();
    -[BRCProgress setLocalizedDescription:](self, "setLocalizedDescription:", v23, v40);
  }
  else
  {
    if (v6 == 1) {
      v24 = (void *)*MEMORY[0x263F08488];
    }
    else {
      v24 = (void *)*MEMORY[0x263F08478];
    }
    id v21 = v24;
  }
  [(BRCProgress *)self setUserInfoObject:v21 forKey:*MEMORY[0x263F08480]];
  if ([v21 isEqualToString:*v20])
  {
    [(BRCProgress *)self setCancellable:1];
    v25 = [v8 clientZone];
    v26 = (void *)[v8 dbRowID];
    objc_initWeak((id *)buf, self);
    v27 = [v8 st];
    v28 = [v27 filename];

    v29 = [v8 clientZone];
    v30 = [v29 taskTracker];

    v31 = [v25 db];
    v32 = [v31 serialQueue];

    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke;
    v41[3] = &unk_26507F038;
    id v33 = v28;
    id v42 = v33;
    id v34 = v30;
    id v43 = v34;
    id v35 = v32;
    id v44 = v35;
    id v36 = v25;
    id v45 = v36;
    v46[1] = v26;
    objc_copyWeak(v46, (id *)buf);
    [(BRCProgress *)self setCancellationHandler:v41];
    objc_destroyWeak(v46);

    objc_destroyWeak((id *)buf);
  }
  v37 = brc_bread_crumbs();
  v38 = brc_notifications_log();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    v39 = [v8 fileObjectID];
    *(_DWORD *)buf = 138412802;
    v48 = self;
    __int16 v49 = 2112;
    uint64_t v50 = (uint64_t)v39;
    __int16 v51 = 2112;
    v52 = v37;
    _os_log_debug_impl(&dword_23FA42000, v38, OS_LOG_TYPE_DEBUG, "[NOTIF] Added progress %@ for %@%@", buf, 0x20u);
  }
}

void __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x2455D97F0]();
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCProgress _setupProgressForDocument:group:sizeInfo:]_block_invoke", 290, v18);
  v3 = brc_bread_crumbs();
  objc_super v4 = brc_notifications_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = v18[0];
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    v24 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx User requested to cancel download for %@%@", buf, 0x20u);
  }

  objc_super v5 = *(void **)(a1 + 40);
  int v6 = *(void **)(a1 + 48);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke_58;
  uint64_t v15 = &unk_26507F010;
  id v7 = *(id *)(a1 + 56);
  id v8 = *(void **)(a1 + 72);
  id v16 = v7;
  v17[1] = v8;
  id v9 = (id *)(a1 + 64);
  objc_copyWeak(v17, v9);
  brc_task_tracker_async_with_logs(v5, v6, &v12, 0);
  id WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "brc_unpublish", v12, v13, v14, v15);

  objc_destroyWeak(v17);
  __brc_leave_section(v18);
}

void __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke_58(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) itemByRowID:*(void *)(a1 + 48)];
  id v9 = [v2 asDocument];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_super v4 = [WeakRetained userInfo];
    objc_super v5 = [v4 objectForKeyedSubscript:@"BRProgressEtagIfLoserKey"];

    int v6 = [WeakRetained userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"BRProgressDownloadKindKey"];
    uint64_t v8 = [v7 longLongValue];

    [v9 cancelDownloadWithEtag:v5 downloadKind:v8];
  }
}

- (void)_updateToBeProgressForDocument:(id)a3 group:(char)a4 sizeinfo:(id)a5
{
  uint64_t v6 = a4;
  id v10 = a3;
  id v8 = a5;
  if ([v10 isOnDisk])
  {
    id v9 = [v10 session];
    [(BRCProgress *)self setSession:v9 group:v6];

    [(BRCProgress *)self _setupProgressForDocument:v10 group:v6 sizeInfo:v8];
  }
}

+ (id)_progressForDocument:(id)a3 group:(char)a4 sizeInfo:(id)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if ([v7 isOnDisk])
  {
    id v9 = [BRCProgress alloc];
    id v10 = [v7 session];
    uint64_t v11 = [(BRCProgress *)v9 initWithGroup:v6 session:v10];

    if (v11) {
      [(BRCProgress *)v11 _setupProgressForDocument:v7 group:v6 sizeInfo:v8];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)addAliasItem:(id)a3
{
  id v11 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  objc_super v5 = [v11 clientZone];
  uint64_t v6 = [v5 mangledID];
  id v7 = [v6 aliasTargetContainerString];

  progressByAliasContainerID = v4->_progressByAliasContainerID;
  if (!progressByAliasContainerID)
  {
    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v10 = v4->_progressByAliasContainerID;
    v4->_progressByAliasContainerID = v9;

    progressByAliasContainerID = v4->_progressByAliasContainerID;
  }
  [(NSMutableDictionary *)progressByAliasContainerID objectForKeyedSubscript:v7];

  objc_sync_exit(v4);
}

- (BOOL)isPublished
{
  return self->_published;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_progressByAliasContainerID, 0);
}

@end