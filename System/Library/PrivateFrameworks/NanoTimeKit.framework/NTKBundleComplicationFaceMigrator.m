@interface NTKBundleComplicationFaceMigrator
+ (id)sharedInstance;
- (BOOL)_shouldAttemptToMigrateComplicationType:(unint64_t)a3;
- (NTKBundleComplicationFaceMigrator)init;
- (NTKBundleComplicationFaceMigrator)initWithMigrationProvider:(id)a3;
- (void)_enumerateMigratableComplicationsOnFace:(id)a3 withBlock:(id)a4;
- (void)_migrateFace:(id)a3 slot:(id)a4 complication:(id)a5 completion:(id)a6;
- (void)migrateFace:(id)a3 completion:(id)a4;
- (void)migrateFaces:(id)a3 completion:(id)a4;
@end

@implementation NTKBundleComplicationFaceMigrator

- (NTKBundleComplicationFaceMigrator)initWithMigrationProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKBundleComplicationFaceMigrator;
  v6 = [(NTKBundleComplicationFaceMigrator *)&v10 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.NanoTimeKit.NTKBundleComplicationFaceMigrator", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_migrationProvider, a3);
  }

  return v6;
}

- (NTKBundleComplicationFaceMigrator)init
{
  v3 = +[NTKBundleComplicationMigrationProvider cachedInstance];
  v4 = [(NTKBundleComplicationFaceMigrator *)self initWithMigrationProvider:v3];

  return v4;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NTKBundleComplicationFaceMigrator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, block);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

void __51__NTKBundleComplicationFaceMigrator_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;
}

- (void)migrateFace:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  v9 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationFaceMigrator: Migrating face %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x2810000000;
  v30 = &unk_1BC8E8B0B;
  int v31 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __60__NTKBundleComplicationFaceMigrator_migrateFace_completion___block_invoke;
  v20[3] = &unk_1E62C3190;
  objc_super v10 = v8;
  v21 = v10;
  v22 = self;
  id v11 = v6;
  id v23 = v11;
  p_long long buf = &buf;
  v25 = v26;
  [(NTKBundleComplicationFaceMigrator *)self _enumerateMigratableComplicationsOnFace:v11 withBlock:v20];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__NTKBundleComplicationFaceMigrator_migrateFace_completion___block_invoke_3;
  block[3] = &unk_1E62C0740;
  v18 = &buf;
  v19 = v26;
  id v16 = v11;
  id v17 = v7;
  id v13 = v7;
  id v14 = v11;
  dispatch_group_notify(v10, queue, block);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&buf, 8);
}

void __60__NTKBundleComplicationFaceMigrator_migrateFace_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(NSObject **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  dispatch_group_enter(v5);
  dispatch_group_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__NTKBundleComplicationFaceMigrator_migrateFace_completion___block_invoke_2;
  v10[3] = &unk_1E62C3168;
  long long v12 = *(_OWORD *)(a1 + 56);
  id v11 = *(id *)(a1 + 32);
  [v8 _migrateFace:v9 slot:v7 complication:v6 completion:v10];
}

void __60__NTKBundleComplicationFaceMigrator_migrateFace_completion___block_invoke_2(void *a1, int a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  if (a2) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  v4 = a1[4];

  dispatch_group_leave(v4);
}

uint64_t __60__NTKBundleComplicationFaceMigrator_migrateFace_completion___block_invoke_3(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[6] + 8) + 32));
  int v2 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[6] + 8) + 32));
  v3 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 1024;
    int v9 = v2;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationFaceMigrator: Finished migrating face %@, madeChanges=%d", (uint8_t *)&v6, 0x12u);
  }

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)migrateFaces:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [MEMORY[0x1E4F29128] UUID];
  int v9 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 UUIDString];
    *(_DWORD *)long long buf = 138412546;
    v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = [v6 count];
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationFaceMigrator: Starting face batch migration %@ with %lu faces", buf, 0x16u);
  }
  dispatch_group_t v11 = dispatch_group_create();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__NTKBundleComplicationFaceMigrator_migrateFaces_completion___block_invoke;
  v17[3] = &unk_1E62C31E0;
  dispatch_group_t v18 = v11;
  v19 = self;
  id v20 = v8;
  id v12 = v8;
  id v13 = v11;
  [v6 enumerateObjectsUsingBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__NTKBundleComplicationFaceMigrator_migrateFaces_completion___block_invoke_8;
  v15[3] = &unk_1E62C0718;
  id v16 = v7;
  id v14 = v7;
  dispatch_group_notify(v13, MEMORY[0x1E4F14428], v15);
}

void __61__NTKBundleComplicationFaceMigrator_migrateFaces_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__NTKBundleComplicationFaceMigrator_migrateFaces_completion___block_invoke_2;
  v6[3] = &unk_1E62C31B8;
  id v7 = v3;
  uint64_t v4 = *(void **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  [v4 migrateFace:v5 completion:v6];
}

void __61__NTKBundleComplicationFaceMigrator_migrateFaces_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) UUIDString];
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationFaceMigrator: Finished face %@ in batch %@", (uint8_t *)&v5, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __61__NTKBundleComplicationFaceMigrator_migrateFaces_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_enumerateMigratableComplicationsOnFace:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__NTKBundleComplicationFaceMigrator__enumerateMigratableComplicationsOnFace_withBlock___block_invoke;
  v10[3] = &unk_1E62C3208;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [v9 enumerateComplicationSlotsWithBlock:v10];
}

void __87__NTKBundleComplicationFaceMigrator__enumerateMigratableComplicationsOnFace_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 complication];

    uint64_t v3 = (void *)v4;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_shouldAttemptToMigrateComplicationType:", objc_msgSend(v3, "complicationType")))(*(void (**)(void))(*(void *)(a1 + 48) + 16))(); {
}
  }

- (BOOL)_shouldAttemptToMigrateComplicationType:(unint64_t)a3
{
  return (a3 > 0x38) | (0xFFFFFF7FFFFFFEuLL >> a3) & 1;
}

- (void)_migrateFace:(id)a3 slot:(id)a4 complication:(id)a5 completion:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, void))a6;
  id v14 = [v10 device];
  char v15 = [v14 supportsWidgetMigration];

  if (v15)
  {
    id v16 = [v10 rankedComplicationFamiliesForSlot:v11];
    uint64_t v17 = [v12 complicationType];
    dispatch_group_t v18 = [v10 device];
    BOOL v19 = +[NTKWidgetComplicationMigrationDefines hasMigratedComplicationType:v17 forDevice:v18];

    if (v19)
    {
      int v31 = self;
      uint64_t v32 = v16;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v20 = v16;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v51 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v40;
        while (2)
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v40 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = +[NTKWidgetComplicationMigrationDefines migrateComplication:forFamily:](NTKWidgetComplicationMigrationDefines, "migrateComplication:forFamily:", v12, [*(id *)(*((void *)&v39 + 1) + 8 * v24) integerValue]);
            if (v25)
            {
              uint64_t v29 = (void *)v25;
              [v10 setComplication:v25 forSlot:v11];
              v30 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138413058;
                id v44 = v10;
                __int16 v45 = 2112;
                id v46 = v11;
                __int16 v47 = 2112;
                id v48 = v12;
                __int16 v49 = 2112;
                v50 = v29;
                _os_log_impl(&dword_1BC5A9000, v30, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationFaceMigrator: Performed defined migration on face %@ slot %@ of %@ to %@", buf, 0x2Au);
              }

              v13[2](v13, 1, 0);
              id v16 = v32;
              goto LABEL_17;
            }
            ++v24;
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      self = v31;
      id v16 = v32;
    }
    v26 = [v10 device];
    char v27 = +[NTKBundleComplicationMigrationFallbackRequest requestWithComplication:v12 families:v16 device:v26];

    migrationProvider = self->_migrationProvider;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __79__NTKBundleComplicationFaceMigrator__migrateFace_slot_complication_completion___block_invoke;
    v33[3] = &unk_1E62C3258;
    v34 = v27;
    v38 = v13;
    id v35 = v10;
    id v36 = v11;
    id v37 = v12;
    id v20 = v27;
    [(NTKBundleComplicationMigrationProvider *)migrationProvider serviceRequest:v20 completion:v33];

    uint64_t v29 = v34;
LABEL_17:
  }
  else
  {
    v13[2](v13, 0, 0);
  }
}

void __79__NTKBundleComplicationFaceMigrator__migrateFace_slot_complication_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__NTKBundleComplicationFaceMigrator__migrateFace_slot_complication_completion___block_invoke_2;
  block[3] = &unk_1E62C3230;
  id v10 = v5;
  id v11 = v6;
  id v12 = a1[4];
  id v16 = a1[8];
  id v13 = a1[5];
  id v14 = a1[6];
  id v15 = a1[7];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__NTKBundleComplicationFaceMigrator__migrateFace_slot_complication_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    int v2 = +[NTKWidgetComplication complicationWithDescriptor:](NTKWidgetComplication, "complicationWithDescriptor:");
    [*(id *)(a1 + 56) setComplication:v2 forSlot:*(void *)(a1 + 64)];
    uint64_t v3 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 64);
      uint64_t v6 = *(void *)(a1 + 72);
      int v8 = 138413058;
      uint64_t v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v2;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationFaceMigrator: Performed remote migration on face %@ slot %@ of %@ to %@", (uint8_t *)&v8, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    if (*(void *)(a1 + 40))
    {
      id v7 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __79__NTKBundleComplicationFaceMigrator__migrateFace_slot_complication_completion___block_invoke_2_cold_1(a1, (uint64_t *)(a1 + 40), v7);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationProvider, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __79__NTKBundleComplicationFaceMigrator__migrateFace_slot_complication_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "NTKBundleComplicationFaceMigrator: Request %@ completed with error %@", (uint8_t *)&v5, 0x16u);
}

@end