@interface MFMailMessageLibraryMigrator
+ (OS_os_log)log;
+ (int)currentVersion;
- (BOOL)_checkForeignKeysWithConnection:(id)a3;
- (BOOL)_runAddBusinessColumnsUpgradeStepForConnection:(id)a3 db:(sqlite3 *)a4;
- (BOOL)migrateWithDatabaseConnection:(id)a3 schema:(id)a4;
- (BOOL)needsRebuildMessageInfoIndex;
- (BOOL)needsRebuildTriggers;
- (BOOL)needsSpotlightReindex;
- (MFMailMessageLibraryMigrator)initWithDelegate:(id)a3;
- (MFMailMessageLibraryMigratorDelegate)delegate;
- (NSConditionLock)migrationState;
- (OS_dispatch_queue)contentProtectionQueue;
- (int64_t)_checkContentProtectionState;
- (int64_t)_runMigrationStepsFromVersion:(int)a3 connection:(id)a4 schema:(id)a5;
- (int64_t)attachProtectedDatabaseWithConnection:(id)a3;
- (void)addPostMigrationBlock:(id)a3;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)detachProtectedDatabaseWithConnection:(id)a3;
- (void)noteNeedsRebuildTriggers;
- (void)noteNeedsSpotlightReindex;
- (void)noteRebuildMessageInfoIndex;
- (void)resetTTRPromptAndForceReindex;
- (void)runPostMigrationBlocksWithConnection:(id)a3;
@end

@implementation MFMailMessageLibraryMigrator

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MFMailMessageLibraryMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_17 != -1) {
    dispatch_once(&log_onceToken_17, block);
  }
  v2 = (void *)log_log_17;
  return (OS_os_log *)v2;
}

void __35__MFMailMessageLibraryMigrator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_17;
  log_log_17 = (uint64_t)v1;
}

- (MFMailMessageLibraryMigrator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFMailMessageLibraryMigrator;
  v5 = [(MFMailMessageLibraryMigrator *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.message.MFMailMessageLibraryMigrator.contentProtectionQueue", v7);
    contentProtectionQueue = v6->_contentProtectionQueue;
    v6->_contentProtectionQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    migrationState = v6->_migrationState;
    v6->_migrationState = (NSConditionLock *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    postMigrationBlocks = v6->_postMigrationBlocks;
    v6->_postMigrationBlocks = v12;
  }
  return v6;
}

+ (int)currentVersion
{
  return 222007;
}

- (BOOL)migrateWithDatabaseConnection:(id)a3 schema:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && ([v6 isValid] & 1) != 0)
  {
    id v27 = 0;
    char v8 = [v6 performWithOptions:6 transactionError:&v27 block:&__block_literal_global_41];
    v9 = v27;
    if (v8)
    {
      uint64_t v10 = _LibraryVersion((sqlite3 *)[v6 sqlDB]);
      if (v10 == 222007)
      {
        v11 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v29 = 222007;
          v12 = "Database is already at current version %lld. No migration needed.";
          v13 = v11;
          uint32_t v14 = 12;
LABEL_26:
          _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
          goto LABEL_27;
        }
        goto LABEL_27;
      }
      v17 = +[MFMailMessageLibraryMigrator log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "Starting migration", buf, 2u);
      }

      objc_msgSend(v6, "executeStatementString:errorMessage:", @"PRAGMA foreign_keys = OFF;",
        @"disabling foreign keys");
      EFRegisterContentProtectionObserver();
      unint64_t v18 = 0;
      *(void *)&long long v19 = 134218240;
      long long v26 = v19;
      do
      {
        v20 = [(MFMailMessageLibraryMigrator *)self migrationState];
        [v20 lockWhenCondition:0];

        v21 = [(MFMailMessageLibraryMigrator *)self migrationState];
        [v21 unlock];

        v22 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          uint64_t v29 = (int)v10;
          __int16 v30 = 2048;
          unint64_t v31 = v18;
          _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "Starting migration steps from version %lld, attempt %lu", buf, 0x16u);
        }

        int64_t v23 = [(MFMailMessageLibraryMigrator *)self _runMigrationStepsFromVersion:v10 connection:v6 schema:v7];
        if (v23 != 1) {
          break;
        }
      }
      while (v18++ < 5);
      EFUnregisterContentProtectionObserver();
      objc_msgSend(v6, "executeStatementString:errorMessage:", @"PRAGMA foreign_keys = ON;",
        @"reënable foreign keys");
      if (!v23)
      {
        v11 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v12 = "Finished migration";
          v13 = v11;
          uint32_t v14 = 2;
          goto LABEL_26;
        }
LABEL_27:
        BOOL v15 = 1;
        goto LABEL_28;
      }
      v11 = +[MFMailMessageLibraryMigrator log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[MFMailMessageLibraryMigrator migrateWithDatabaseConnection:schema:](v11);
      }
    }
    else
    {
      v11 = +[MFMailMessageLibraryMigrator log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = [v9 ef_publicDescription];
        -[MFMailMessageLibraryMigrator migrateWithDatabaseConnection:schema:](v16, buf, v11);
      }
    }
    BOOL v15 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v9 = +[MFMailMessageLibraryMigrator log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MFMailMessageLibraryMigrator migrateWithDatabaseConnection:schema:](v9);
  }
  BOOL v15 = 0;
LABEL_29:

  return v15;
}

BOOL __69__MFMailMessageLibraryMigrator_migrateWithDatabaseConnection_schema___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (sqlite3 *)[v2 sqlDB];
  int v4 = sqlite3_exec_retry(v3, "PRAGMA page_size = 4096;", 0, 0, 0);
  _HandleSQLiteError(v3, @"setting page_size");
  if (v4
    || (int v5 = sqlite3_exec_retry(v3, "PRAGMA auto_vacuum=2", 0, 0, 0),
        _HandleSQLiteError(v3, @"setting auto_vacuum"),
        v5))
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = sqlite3_exec_retry(v3, "PRAGMA journal_mode=WAL", 0, 0, 0) == 0;
    _HandleSQLiteError(v3, @"setting journal mode");
  }

  return v6;
}

- (int64_t)_runMigrationStepsFromVersion:(int)a3 connection:(id)a4 schema:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v10 addIndex:170010];
  [v10 addIndex:170054];
  [v10 addIndex:200006];
  [v10 addIndex:200009];
  [v10 addIndex:200010];
  [v10 addIndex:200011];
  [v10 addIndex:200012];
  [v10 addIndex:200019];
  [v10 addIndex:220004];
  [v10 addIndex:220005];
  [v10 addIndex:220008];
  [v10 addIndex:220019];
  [v10 addIndex:220020];
  [v10 addIndex:222001];
  [v10 addIndex:222005];
  [v10 addIndex:222006];
  if (a3 && [v10 indexGreaterThanOrEqualToIndex:a3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v11 = [(MFMailMessageLibraryMigrator *)self attachProtectedDatabaseWithConnection:v8];
    if (v11) {
      goto LABEL_14;
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke;
    v32[3] = &unk_1E5D3F520;
    objc_copyWeak(&v33, &location);
    [(MFMailMessageLibraryMigrator *)self addPostMigrationBlock:v32];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  id location = 0;
  p_id location = &location;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_2;
  unint64_t v18 = &unk_1E5D3F568;
  v22 = &v24;
  int64_t v23 = &location;
  id v19 = v9;
  v20 = self;
  id v12 = v8;
  id v21 = v12;
  [v12 performWithOptions:7 transactionError:0 block:&v15];
  -[MFMailMessageLibraryMigrator runPostMigrationBlocksWithConnection:](self, "runPostMigrationBlocksWithConnection:", v12, v15, v16, v17, v18);
  if (*((unsigned char *)p_location + 24)
    && [(MFMailMessageLibraryMigrator *)self needsSpotlightReindex])
  {
    v13 = [(MFMailMessageLibraryMigrator *)self delegate];
    [v13 mailMessageLibraryMigratorScheduleSpotlightReindex:self];
  }
  if (*((unsigned char *)p_location + 24))
  {
    int64_t v11 = 0;
  }
  else if ([v10 containsIndex:*((int *)v25 + 6)])
  {
    int64_t v11 = [(MFMailMessageLibraryMigrator *)self _checkContentProtectionState];
  }
  else
  {
    int64_t v11 = 2;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&location, 8);
LABEL_14:

  return v11;
}

void __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained detachProtectedDatabaseWithConnection:v3];
}

BOOL __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v273 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = (sqlite3 *)[v3 sqlDB];
  int v5 = _LibraryVersion(v4);
  uint64_t v6 = a1 + 56;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
  id v7 = +[MFMailMessageLibraryMigrator log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Starting write transaction at version %lld", buf, 0xCu);
  }

  if (v5 > 179999)
  {
    if (v5 <= 210000)
    {
      if (v5 > 200000)
      {
        switch(v5)
        {
          case 200001:
            goto LABEL_427;
          case 200002:
            goto LABEL_430;
          case 200003:
            goto LABEL_433;
          case 200004:
            goto LABEL_436;
          case 200005:
            goto LABEL_439;
          case 200006:
            goto LABEL_442;
          case 200007:
            goto LABEL_445;
          case 200008:
            goto LABEL_448;
          case 200009:
            goto LABEL_451;
          case 200010:
            goto LABEL_454;
          case 200011:
            goto LABEL_457;
          case 200012:
            goto LABEL_461;
          case 200013:
            goto LABEL_464;
          case 200014:
            goto LABEL_467;
          case 200015:
            goto LABEL_470;
          case 200016:
            goto LABEL_473;
          case 200017:
            goto LABEL_480;
          case 200018:
            goto LABEL_483;
          case 200019:
            goto LABEL_486;
          case 200020:
            goto LABEL_490;
          case 200021:
            goto LABEL_493;
          case 200022:
            goto LABEL_496;
          case 200023:
            goto LABEL_500;
          case 200024:
            goto LABEL_503;
          case 200025:
            goto LABEL_507;
          case 200026:
            goto LABEL_510;
          case 200027:
            goto LABEL_513;
          case 200028:
            goto LABEL_516;
          default:
            goto LABEL_29;
        }
      }
      switch(v5)
      {
        case 180500:
          goto LABEL_381;
        case 180501:
          goto LABEL_384;
        case 180502:
          goto LABEL_387;
        case 180503:
          goto LABEL_390;
        case 180504:
          goto LABEL_394;
        case 180505:
          goto LABEL_397;
        case 180506:
          goto LABEL_400;
        case 180507:
          goto LABEL_403;
        case 180508:
          goto LABEL_406;
        case 180509:
          goto LABEL_410;
        default:
          JUMPOUT(0);
      }
    }
    if (v5 > 220000)
    {
      switch(v5)
      {
        case 220001:
          goto LABEL_544;
        case 220002:
          goto LABEL_547;
        case 220003:
          goto LABEL_551;
        case 220004:
          goto LABEL_554;
        case 220005:
          goto LABEL_557;
        case 220006:
          goto LABEL_29;
        case 220007:
          goto LABEL_560;
        case 220008:
          goto LABEL_563;
        case 220009:
          goto LABEL_566;
        case 220010:
          goto LABEL_569;
        case 220011:
          goto LABEL_572;
        case 220012:
          goto LABEL_575;
        case 220013:
          goto LABEL_578;
        case 220014:
          goto LABEL_581;
        case 220015:
          goto LABEL_584;
        case 220016:
          goto LABEL_587;
        case 220017:
          goto LABEL_591;
        case 220018:
          goto LABEL_594;
        case 220019:
          goto LABEL_597;
        case 220020:
          goto LABEL_600;
        case 220021:
          goto LABEL_603;
        case 220022:
          goto LABEL_606;
        case 220023:
          goto LABEL_610;
        case 220024:
          goto LABEL_613;
        default:
          switch(v5)
          {
            case 222001:
              goto LABEL_616;
            case 222002:
              goto LABEL_621;
            case 222003:
              goto LABEL_624;
            case 222004:
              goto LABEL_627;
            case 222005:
              goto LABEL_630;
            case 222006:
              goto LABEL_633;
            case 222007:
              goto LABEL_636;
            default:
              goto LABEL_29;
          }
      }
    }
    switch(v5)
    {
      case 210001:
        goto LABEL_519;
      case 210002:
        goto LABEL_522;
      case 210003:
        goto LABEL_525;
      case 210004:
        goto LABEL_528;
      case 210005:
        goto LABEL_531;
      case 210006:
        goto LABEL_535;
      default:
        if (v5 == 212001) {
          goto LABEL_538;
        }
        if (v5 != 214001) {
          goto LABEL_29;
        }
        goto LABEL_541;
    }
  }
  if (v5 <= 159999)
  {
    switch(v5)
    {
      case 0:
        id v8 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "Initializing schema", buf, 2u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _InitializeSchema(v4, *(void **)(a1 + 32));
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          [*(id *)(a1 + 40) noteNeedsSpotlightReindex];
          id v9 = [*(id *)(a1 + 40) delegate];
          [v9 mailMessageLibraryMigrator:*(void *)(a1 + 40) isInitializingDatabaseWithConnection:v3];
        }
        goto LABEL_642;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 53:
      case 55:
      case 56:
        goto LABEL_29;
      case 22:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 22;
        int64_t v11 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 22;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TellurideVersion";
          _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _FixZeroedConversationHashes(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_35;
        }
        goto LABEL_642;
      case 23:
LABEL_35:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 23;
        id v12 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 23;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "SundanceConversationHashesMustBeNonZeroVersion";
          _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        [*(id *)(a1 + 40) noteRebuildMessageInfoIndex];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _DropMessageDeletedIndex(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_38;
        }
        goto LABEL_642;
      case 24:
LABEL_38:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 24;
        v13 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 24;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "SundanceCreateMessageInfosCoveringIndexVersion";
          _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        [*(id *)(a1 + 40) noteRebuildMessageInfoIndex];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddVIPSenderColumn(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_41;
        }
        goto LABEL_642;
      case 25:
LABEL_41:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 25;
        uint32_t v14 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 25;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "SundanceMessagesHaveVIPSenderFlag";
          _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddUniqueRemoteIDColumn(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_44;
        }
        goto LABEL_642;
      case 26:
LABEL_44:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 26;
        uint64_t v15 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 26;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "InnsbruckMessagesHaveUniqueRemoteID";
          _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddContentTransactionIDColumn(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_47;
        }
        goto LABEL_642;
      case 27:
LABEL_47:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 27;
        uint64_t v16 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 27;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "InnsbruckMessagesHaveContentTransactionID";
          _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _ImproveMessageConversationIndexes(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_50;
        }
        goto LABEL_642;
      case 28:
LABEL_50:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 28;
        v17 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 28;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "InnsbruckBetterMessageConversationIndexes";
          _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddSequenceIdentifierIndex(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_53;
        }
        goto LABEL_642;
      case 29:
LABEL_53:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 29;
        unint64_t v18 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 29;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "InnsbruckCondStoreSequenceIdentifierIndex";
          _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddFlaggedAndAttachmentColumnsAndTriggers(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_56;
        }
        goto LABEL_642;
      case 30:
LABEL_56:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 30;
        id v19 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 30;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "InnsbruckFlaggedAndAttachmentCounts";
          _os_log_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddToCcCountColumnAndTriggers(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_59;
        }
        goto LABEL_642;
      case 31:
LABEL_59:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 31;
        v20 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 31;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "InnsbruckToCcCounts";
          _os_log_impl(&dword_1A7EFF000, v20, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddServerOnlyUnreadCountColumn(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_62;
        }
        goto LABEL_642;
      case 32:
LABEL_62:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 32;
        id v21 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 32;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "InnsbruckServerOnlyUnreadCounts";
          _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_65;
      case 33:
LABEL_65:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 33;
        v22 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 33;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "SochiFixFlaggedCount";
          _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _SochiFixFlaggedCount(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_68;
        }
        goto LABEL_642;
      case 34:
LABEL_68:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 34;
        int64_t v23 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 34;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "SochiFixFlaggedCount2";
          _os_log_impl(&dword_1A7EFF000, v23, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddConversationFlags(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_71;
        }
        goto LABEL_642;
      case 35:
LABEL_71:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 35;
        uint64_t v24 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 35;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "OkemoConversationFlags";
          _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_74;
      case 36:
LABEL_74:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 36;
        v25 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 36;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "MonarchAddSuggestionsProcessingStateColumn";
          _os_log_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_77;
      case 37:
LABEL_77:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 37;
        uint64_t v26 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 37;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "MonarchResetSuggestionsProcessingStateColumn";
          _os_log_impl(&dword_1A7EFF000, v26, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_80;
      case 38:
LABEL_80:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 38;
        int v27 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 38;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "MonarchDuplicatesSuppression";
          _os_log_impl(&dword_1A7EFF000, v27, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        [*(id *)(a1 + 40) noteNeedsRebuildTriggers];
        goto LABEL_83;
      case 39:
LABEL_83:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 39;
        v28 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 39;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "MonarchRestoreTriggers";
          _os_log_impl(&dword_1A7EFF000, v28, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        [*(id *)(a1 + 40) noteRebuildMessageInfoIndex];
        goto LABEL_86;
      case 40:
LABEL_86:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 40;
        uint64_t v29 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 40;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "MonarchUpdateMessageInfoCoveringIndex";
          _os_log_impl(&dword_1A7EFF000, v29, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        [*(id *)(a1 + 40) noteNeedsRebuildTriggers];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v4, (uint64_t)off_1E5D3F608, 6, @"updating mailboxes counts");
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_89;
        }
        goto LABEL_642;
      case 41:
LABEL_89:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 41;
        uint64_t v30 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 41;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "MonarchUnreadCountDuplicateSuppression";
          _os_log_impl(&dword_1A7EFF000, v30, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_92;
      case 42:
LABEL_92:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 42;
        char v31 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 42;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "MonarchUnreadCountIgnoreSearchResult";
          _os_log_impl(&dword_1A7EFF000, v31, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        [*(id *)(a1 + 40) noteNeedsRebuildTriggers];
        int v32 = sqlite3_exec(v4, "UPDATE mailboxes SET unread_count = (SELECT COUNT(DISTINCT(message_id)) FROM messages WHERE (flags&1 = 0 AND flags&128 = 0 AND flags&1048576 = 0) AND (mailbox = mailboxes.ROWID));",
                0,
                0,
                0);
        _HandleSQLiteError(v4, @"updating mailboxes unread_count");
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v32 == 0;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_95;
        }
        goto LABEL_642;
      case 43:
LABEL_95:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 43;
        id v33 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 43;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "MonarchUnreadCountPreventNegativeValue";
          _os_log_impl(&dword_1A7EFF000, v33, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v4, (uint64_t)off_1E5D3F638, 2, @"updating message_content_index_transaction_id");
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_98;
        }
        goto LABEL_642;
      case 44:
LABEL_98:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 44;
        v34 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 44;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "MonarchFasterSpotlightIndexing";
          _os_log_impl(&dword_1A7EFF000, v34, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(void *)buf = "CREATE INDEX message_mailbox_content_index ON messages (mailbox, content_index_transaction_id, "
                         "flags, date_received ASC)";
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v4, (uint64_t)buf, 1, @"adding message_mailbox_content_index");
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_101;
        }
        goto LABEL_642;
      case 45:
LABEL_101:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 45;
        v35 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 45;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "MonarchOldestNonIndexedMessagesLookup";
          _os_log_impl(&dword_1A7EFF000, v35, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_104;
      case 46:
LABEL_104:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 46;
        v36 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 46;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "MonarchForceSpotlightReindex";
          _os_log_impl(&dword_1A7EFF000, v36, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v4, (uint64_t)off_1E5D3F648, 3, @"adding spotlight tombstones table");
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_107;
        }
        goto LABEL_642;
      case 47:
LABEL_107:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 47;
        v37 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 47;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "BoulderAddSpotlightTombstones";
          _os_log_impl(&dword_1A7EFF000, v37, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_110;
      case 48:
LABEL_110:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 48;
        v38 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 48;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "BoulderForceSpotlightReindex";
          _os_log_impl(&dword_1A7EFF000, v38, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_113;
      case 49:
LABEL_113:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 49;
        v39 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 49;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "BoulderForceSpotlightReindex2";
          _os_log_impl(&dword_1A7EFF000, v39, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_116;
      case 50:
LABEL_116:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 50;
        v40 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 50;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "BoulderForceSpotlightReindex3";
          _os_log_impl(&dword_1A7EFF000, v40, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        int v41 = sqlite3_exec(v4, "UPDATE mailboxes SET server_unread_count = 0 WHERE url LIKE \"pop:%\";", 0, 0, 0);
        _HandleSQLiteError(v4, @"updating mailboxes unread_count");
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v41 == 0;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_119;
        }
        goto LABEL_642;
      case 51:
LABEL_119:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 51;
        v42 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 51;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "BoulderZeroOutPOPServerUnreadCount";
          _os_log_impl(&dword_1A7EFF000, v42, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_122;
      case 52:
LABEL_122:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 52;
        v43 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 52;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "BoulderForceSpotlightReindex4";
          _os_log_impl(&dword_1A7EFF000, v43, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        int v44 = sqlite3_exec(v4, "ALTER TABLE messages ADD COLUMN list_id_hash INTEGER;", 0, 0, 0);
        _HandleSQLiteError(v4, @"adding list_id_hash column");
        if (v44)
        {
          LOBYTE(v45) = 0;
        }
        else
        {
          BOOL v45 = sqlite3_exec(v4, "CREATE INDEX message_list_id_hash_index ON messages(list_id_hash);", 0, 0, 0) == 0;
          _HandleSQLiteError(v4, @"adding message_list_id_hash_index index");
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v45;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_128;
        }
        goto LABEL_642;
      case 54:
LABEL_128:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 54;
        v46 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 54;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "WhitetailAddListIDColumn";
          _os_log_impl(&dword_1A7EFF000, v46, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        goto LABEL_131;
      case 57:
LABEL_131:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 57;
        v47 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 57;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "WhitetailRemoveDecluttering";
          _os_log_impl(&dword_1A7EFF000, v47, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_134;
      case 58:
LABEL_134:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 58;
        v48 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 58;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "WhitetailForceSpotlightReindex";
          _os_log_impl(&dword_1A7EFF000, v48, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_137;
      case 59:
LABEL_137:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 59;
        v49 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 59;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "WhitetailForceSpotlightReindex2";
          _os_log_impl(&dword_1A7EFF000, v49, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        [*(id *)(a1 + 40) resetTTRPromptAndForceReindex];
        goto LABEL_140;
      case 60:
LABEL_140:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 60;
        v50 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 60;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisForceSpotlightReindexConversationID";
          _os_log_impl(&dword_1A7EFF000, v50, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        if (_ExecuteQueries(v4, (uint64_t)off_1E5D3F660, 2, @"adding mailboxes status count columns"))
        {
          *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
          int v51 = sqlite3_prepare_v2(v4, "SELECT DISTINCT mailbox FROM messages WHERE flags&64 = 64;",
                  -1,
                  (sqlite3_stmt **)buf,
                  0);
          id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          BOOL v53 = v51 == 0;
          if (!v51)
          {
            v54 = *(sqlite3_stmt **)buf;
            if (*(void *)buf)
            {
              while (1)
              {
                int v55 = sqlite3_step(v54);
                if (v55 != 100) {
                  break;
                }
                v56 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", sqlite3_column_int64(*(sqlite3_stmt **)buf, 0));
                [v52 addObject:v56];

                v54 = *(sqlite3_stmt **)buf;
              }
              _HandleSQLiteError(v4, @"finding mailbox IDs of draft mailboxes");
              BOOL v53 = v55 == 101;
              sqlite3_finalize(*(sqlite3_stmt **)buf);
            }
          }
          if (v53)
          {
            if ([v52 count])
            {
              id v58 = [v52 componentsJoinedByString:@", "];
              v59 = (const char *)[v58 UTF8String];

              v60 = sqlite3_mprintf("UPDATE mailboxes SET last_sync_status_count = unread_count + server_unread_count, most_recent_status_count = unread_count + server_unread_count WHERE url LIKE 'imap:%%' AND rowid NOT IN (%s)", v59);
              LODWORD(v59) = sqlite3_exec(v4, v60, 0, 0, 0);
              sqlite3_free(v60);
              BOOL v57 = v59 == 0;
              _HandleSQLiteError(v4, @"updating count columns for non-draft mailboxes");
            }
            else
            {
              int v61 = sqlite3_exec(v4, "UPDATE mailboxes SET last_sync_status_count = unread_count + server_unread_count, most_recent_status_count = unread_count + server_unread_count WHERE url LIKE 'imap:%'", 0, 0, 0);
              _HandleSQLiteError(v4, @"updating count columns");
              BOOL v57 = v61 == 0;
            }
          }
          else
          {
            BOOL v57 = 0;
          }
        }
        else
        {
          BOOL v57 = 0;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v57;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_156;
        }
        goto LABEL_642;
      case 61:
LABEL_156:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 61;
        v62 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 61;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisAddUnseenCountColumn";
          _os_log_impl(&dword_1A7EFF000, v62, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        int v63 = sqlite3_exec(v4, "ALTER TABLE mailboxes ADD COLUMN reconcile;", 0, 0, 0);
        _HandleSQLiteError(v4, @"adding reconcile column");
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v63 == 0;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_159;
        }
        goto LABEL_642;
      case 62:
LABEL_159:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 62;
        v64 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 62;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisAddReconcileColumn";
          _os_log_impl(&dword_1A7EFF000, v64, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        [*(id *)(a1 + 40) noteNeedsRebuildTriggers];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v4, (uint64_t)off_1E5D3F670, 3, @"adding spotlight message reindex table");
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_162;
        }
        goto LABEL_642;
      case 63:
LABEL_162:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 63;
        v65 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 63;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisAddSpotlightReindexTable";
          _os_log_impl(&dword_1A7EFF000, v65, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_165;
      case 64:
LABEL_165:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 64;
        v66 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 64;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisAddMBLQueueTable";
          _os_log_impl(&dword_1A7EFF000, v66, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        [*(id *)(a1 + 40) noteNeedsSpotlightReindex];
        goto LABEL_168;
      case 65:
LABEL_168:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 65;
        v67 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 65;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisForceSpotlightReindexSupportDND";
          _os_log_impl(&dword_1A7EFF000, v67, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(void *)buf = "DROP TABLE IF EXISTS mbl_queue;";
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v4, (uint64_t)buf, 1, @"removing mbl_queue table");
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_171;
        }
        goto LABEL_642;
      case 66:
LABEL_171:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 66;
        v68 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 66;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisRemoveMBDLQueueTable";
          _os_log_impl(&dword_1A7EFF000, v68, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        [*(id *)(a1 + 40) noteRebuildMessageInfoIndex];
        int v69 = sqlite3_exec(v4, "ALTER TABLE messages ADD COLUMN journaled DEFAULT '0';", 0, 0, 0);
        _HandleSQLiteError(v4, @"adding journaled column");
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v69 == 0;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_174;
        }
        goto LABEL_642;
      case 67:
LABEL_174:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 67;
        v70 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 67;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisAddUnmergedColumn";
          _os_log_impl(&dword_1A7EFF000, v70, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        if (v5 < 60) {
          goto LABEL_178;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _ResetStatusCountsForDrafts(v4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          goto LABEL_178;
        }
        goto LABEL_642;
      case 68:
LABEL_178:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 68;
        v71 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 68;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisResetStatusCountsForDrafts";
          _os_log_impl(&dword_1A7EFF000, v71, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_181;
      case 69:
LABEL_181:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 69;
        v72 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 69;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisSetSpotlightDataTypes";
          _os_log_impl(&dword_1A7EFF000, v72, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        [*(id *)(a1 + 40) noteNeedsSpotlightReindex];
        goto LABEL_184;
      case 70:
LABEL_184:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 70;
        v73 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 70;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisUpgradePadding70";
          _os_log_impl(&dword_1A7EFF000, v73, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_187;
      case 71:
LABEL_187:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 71;
        v74 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 71;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisUpgradePadding71";
          _os_log_impl(&dword_1A7EFF000, v74, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_190;
      case 72:
LABEL_190:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 72;
        v75 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 72;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "TigrisUpgradePadding72";
          _os_log_impl(&dword_1A7EFF000, v75, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_193;
      case 73:
LABEL_193:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 73;
        v76 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 73;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "LastDeprecatedNumberingScheme";
          _os_log_impl(&dword_1A7EFF000, v76, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_196;
      default:
        if (v5 == 155000)
        {
LABEL_196:
          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 155000;
          v77 = +[MFMailMessageLibraryMigrator log];
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)&uint8_t buf[4] = 155000;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "EmetBaseline";
            _os_log_impl(&dword_1A7EFF000, v77, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
          }
        }
        else if (v5 != 155001)
        {
          goto LABEL_29;
        }
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 155001;
        v78 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 155001;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "EmetSetSpotlightDataOwner";
          _os_log_impl(&dword_1A7EFF000, v78, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        v79 = [[MFMailMessageLibraryMailboxURLMigrationStep alloc] initWithSQLiteConnection:*(void *)(a1 + 48)];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [(MFMailMessageLibraryMailboxURLMigrationStep *)v79 performMigrationStep];
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          [*(id *)(a1 + 40) noteNeedsSpotlightReindex];

          goto LABEL_203;
        }

        break;
    }
    goto LABEL_642;
  }
  if (v5 > 169999)
  {
    switch(v5)
    {
      case 170000:
        goto LABEL_212;
      case 170001:
        goto LABEL_215;
      case 170002:
        goto LABEL_218;
      case 170003:
        goto LABEL_221;
      case 170004:
        goto LABEL_224;
      case 170005:
        goto LABEL_227;
      case 170006:
        goto LABEL_230;
      case 170007:
        goto LABEL_234;
      case 170008:
        goto LABEL_237;
      case 170009:
        goto LABEL_240;
      case 170010:
        goto LABEL_244;
      case 170011:
        goto LABEL_247;
      case 170012:
        goto LABEL_251;
      case 170013:
        goto LABEL_254;
      case 170014:
        goto LABEL_257;
      case 170015:
        goto LABEL_261;
      case 170016:
        goto LABEL_264;
      case 170017:
        goto LABEL_267;
      case 170018:
        goto LABEL_270;
      case 170019:
        goto LABEL_273;
      case 170020:
        goto LABEL_276;
      case 170021:
        goto LABEL_279;
      case 170022:
        goto LABEL_282;
      case 170023:
        goto LABEL_286;
      case 170024:
        goto LABEL_289;
      case 170025:
        goto LABEL_293;
      case 170026:
        goto LABEL_296;
      case 170027:
        goto LABEL_299;
      case 170028:
        goto LABEL_302;
      case 170029:
        goto LABEL_305;
      case 170030:
        goto LABEL_308;
      case 170031:
        goto LABEL_311;
      case 170032:
        goto LABEL_314;
      case 170033:
        goto LABEL_317;
      case 170034:
        goto LABEL_320;
      case 170035:
        goto LABEL_323;
      case 170036:
        goto LABEL_326;
      case 170037:
        goto LABEL_329;
      case 170038:
        goto LABEL_332;
      case 170039:
        goto LABEL_336;
      case 170050:
        goto LABEL_340;
      case 170051:
        goto LABEL_343;
      case 170052:
        goto LABEL_346;
      case 170053:
        goto LABEL_349;
      case 170054:
        goto LABEL_352;
      case 170055:
        goto LABEL_356;
      case 170056:
        goto LABEL_359;
      case 170057:
        goto LABEL_362;
      case 170058:
        goto LABEL_365;
      case 170059:
        goto LABEL_368;
      default:
        goto LABEL_29;
    }
  }
  switch(v5)
  {
    case 160000:
LABEL_203:
      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 160000;
      v80 = +[MFMailMessageLibraryMigrator log];
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = 160000;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "PeaceBaseline";
        _os_log_impl(&dword_1A7EFF000, v80, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
      }

      break;
    case 160001:
      break;
    case 160002:
      goto LABEL_209;
    default:
LABEL_29:
      if (v5 <= 222007)
      {
        id v10 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_2_cold_2(v5, v10);
        }
      }
      else
      {
        id v10 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_2_cold_1(v5, v10);
        }
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      goto LABEL_642;
  }
  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 160001;
  v81 = +[MFMailMessageLibraryMigrator log];
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = 160001;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "PeaceAddMessageJournaledIndex";
    _os_log_impl(&dword_1A7EFF000, v81, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
  }

LABEL_209:
  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 160002;
  v82 = +[MFMailMessageLibraryMigrator log];
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = 160002;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "PeaceAddMessageJournaledConversationIndex";
    _os_log_impl(&dword_1A7EFF000, v82, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
  }

LABEL_212:
  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170000;
  v83 = +[MFMailMessageLibraryMigrator log];
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = 170000;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "YukonBaseline";
    _os_log_impl(&dword_1A7EFF000, v83, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
  }

LABEL_215:
  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170001;
  v84 = +[MFMailMessageLibraryMigrator log];
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = 170001;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "YukonAddDocumentIDColumn";
    _os_log_impl(&dword_1A7EFF000, v84, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
  }

LABEL_218:
  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170002;
  v85 = +[MFMailMessageLibraryMigrator log];
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = 170002;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "YukonUpdateMuteThreadFlagBit";
    _os_log_impl(&dword_1A7EFF000, v85, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
  }

LABEL_221:
  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170003;
  v86 = +[MFMailMessageLibraryMigrator log];
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = 170003;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "YukonAddMessageJournaledIndex";
    _os_log_impl(&dword_1A7EFF000, v86, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
  }

  v87 = [[MFMailMessageLibraryLocalActionsTablesMigrationStep alloc] initWithSQLiteConnection:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)v87 performMigrationStep];
  BOOL v88 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 0;

  if (!v88)
  {
LABEL_224:
    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170004;
    v89 = +[MFMailMessageLibraryMigrator log];
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = 170004;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "YukonAddLocalMessageActionsTables";
      _os_log_impl(&dword_1A7EFF000, v89, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
    }

LABEL_227:
    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170005;
    v90 = +[MFMailMessageLibraryMigrator log];
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = 170005;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "YukonMessageInteractionMetricsColumns";
      _os_log_impl(&dword_1A7EFF000, v90, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
    }

LABEL_230:
    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170006;
    v91 = +[MFMailMessageLibraryMigrator log];
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = 170006;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "YukonAddCategoryColumnsNoLongerUsed";
      _os_log_impl(&dword_1A7EFF000, v91, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
    }

    if (v5 <= 169999
      || (v92 = [[MFMailMessageLibraryLocalActionsTablesMigrationStep alloc] initWithSQLiteConnection:*(void *)(a1 + 48)], *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)v92 performMigrationStep], BOOL v93 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 0, v92, !v93))
    {
LABEL_234:
      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170007;
      v94 = +[MFMailMessageLibraryMigrator log];
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = 170007;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "YukonFixBrokenUpgradesFromPeace";
        _os_log_impl(&dword_1A7EFF000, v94, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
      }

LABEL_237:
      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170008;
      v95 = +[MFMailMessageLibraryMigrator log];
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = 170008;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "YukonAddCategoryColumns";
        _os_log_impl(&dword_1A7EFF000, v95, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
      }

      int v96 = sqlite3_exec(v4, "DROP TABLE IF EXISTS offline_cache_operations;\n"
              "DROP TABLE IF EXISTS offline_cache_replay_data;\n"
              "DROP TRIGGER after_delete_account;\n",
              0,
              0,
              0);
      _HandleSQLiteError(v4, @"removing offline cache tables");
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v96 == 0;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
LABEL_240:
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170009;
        v97 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = 170009;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "YukonRemoveOfflineCacheTables";
          _os_log_impl(&dword_1A7EFF000, v97, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        if (v5 <= 170003
          || (v98 = [[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep alloc] initWithSQLiteConnection:*(void *)(a1 + 48)], *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [(MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *)v98 performMigrationStep], BOOL v99 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 0, v98, !v99))
        {
LABEL_244:
          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170010;
          v100 = +[MFMailMessageLibraryMigrator log];
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)&uint8_t buf[4] = 170010;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "YukonModifyColumnDefinitions";
            _os_log_impl(&dword_1A7EFF000, v100, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
          }

          [*(id *)(a1 + 40) noteNeedsRebuildTriggers];
          [*(id *)(a1 + 40) addPostMigrationBlock:&__block_literal_global_103];
          v101 = [[MFMailMessageLibraryAdoptSharedSchemaMigrationStep alloc] initWithSQLiteConnection:*(void *)(a1 + 48) protectedDatabaseName:@"protected"];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)v101 performMigrationStep];
          BOOL v102 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 0;

          if (!v102)
          {
LABEL_247:
            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170011;
            v103 = +[MFMailMessageLibraryMigrator log];
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              *(void *)&uint8_t buf[4] = 170011;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "YukonAdoptSharedSchema";
              _os_log_impl(&dword_1A7EFF000, v103, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
            }

            if (v5 != 170011
              || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddProtectedDataIndexes(v4)) != 0)
            {
LABEL_251:
              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170012;
              v104 = +[MFMailMessageLibraryMigrator log];
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(void *)&uint8_t buf[4] = 170012;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "YukonAddProtectedDataIndexes";
                _os_log_impl(&dword_1A7EFF000, v104, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
              }

LABEL_254:
              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170013;
              v105 = +[MFMailMessageLibraryMigrator log];
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(void *)&uint8_t buf[4] = 170013;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "YukonAddInteractionLogTable";
                _os_log_impl(&dword_1A7EFF000, v105, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
              }

LABEL_257:
              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170014;
              v106 = +[MFMailMessageLibraryMigrator log];
              if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(void *)&uint8_t buf[4] = 170014;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "YukonAddReadLaterTable";
                _os_log_impl(&dword_1A7EFF000, v106, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
              }

              if (v5 <= 170010
                || ([*(id *)(a1 + 40) noteNeedsRebuildTriggers],
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60BF0] runWithConnection:v3] == 0, _HandleSQLiteError(v4, @"Renaming threads to message_references"), *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)))
              {
LABEL_261:
                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170015;
                v107 = +[MFMailMessageLibraryMigrator log];
                if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  *(void *)&uint8_t buf[4] = 170015;
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "YukonRenameThreadsTable";
                  _os_log_impl(&dword_1A7EFF000, v107, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                }

                *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A08] runWithConnection:v3] == 0;
                _HandleSQLiteError(v4, @"Creating messages deleted date received index");
                if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                {
LABEL_264:
                  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170016;
                  v108 = +[MFMailMessageLibraryMigrator log];
                  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218242;
                    *(void *)&uint8_t buf[4] = 170016;
                    *(_WORD *)&buf[12] = 2080;
                    *(void *)&buf[14] = "YukonAddMessageDeletedDateReceivedIndex";
                    _os_log_impl(&dword_1A7EFF000, v108, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                  }

                  [*(id *)(a1 + 40) noteNeedsRebuildTriggers];
                  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryAddSearchableIndexTablesUpgradeStep runWithConnection:v3] == 0;
                  _HandleSQLiteError(v4, @"Creating searchable index tables");
                  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                  {
LABEL_267:
                    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170017;
                    v109 = +[MFMailMessageLibraryMigrator log];
                    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134218242;
                      *(void *)&uint8_t buf[4] = 170017;
                      *(_WORD *)&buf[12] = 2080;
                      *(void *)&buf[14] = "YukonAddSearchableIndexTables";
                      _os_log_impl(&dword_1A7EFF000, v109, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                    }

                    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryAddJournaledConversationIDDateReceivedUpgradeStep runWithConnection:v3] == 0;
                    _HandleSQLiteError(v4, @"Creating messages_journaled_conversation_id_date_received_index");
                    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                    {
LABEL_270:
                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170018;
                      v110 = +[MFMailMessageLibraryMigrator log];
                      if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134218242;
                        *(void *)&uint8_t buf[4] = 170018;
                        *(_WORD *)&buf[12] = 2080;
                        *(void *)&buf[14] = "YukonAddJournaledConversationIDDateReceivedIndex";
                        _os_log_impl(&dword_1A7EFF000, v110, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                      }

                      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A68] runWithConnection:v3] == 0;
                      _HandleSQLiteError(v4, @"Adding thread tables");
                      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                      {
LABEL_273:
                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170019;
                        v111 = +[MFMailMessageLibraryMigrator log];
                        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 134218242;
                          *(void *)&uint8_t buf[4] = 170019;
                          *(_WORD *)&buf[12] = 2080;
                          *(void *)&buf[14] = "YukonAddThreadTables";
                          _os_log_impl(&dword_1A7EFF000, v111, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                        }

LABEL_276:
                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170020;
                        v112 = +[MFMailMessageLibraryMigrator log];
                        if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 134218242;
                          *(void *)&uint8_t buf[4] = 170020;
                          *(_WORD *)&buf[12] = 2080;
                          *(void *)&buf[14] = "YukonAddThreadsScopeConverationDateIndex";
                          _os_log_impl(&dword_1A7EFF000, v112, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                        }

                        char v113 = [MEMORY[0x1E4F60B70] run];
                        v114 = [MEMORY[0x1E4F60B70] propertiesToMigrate];
                        +[MFUserDefaultMigrator migrateDefaults:v114];

                        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v113;
                        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                        {
LABEL_279:
                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170021;
                          v115 = +[MFMailMessageLibraryMigrator log];
                          if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 134218242;
                            *(void *)&uint8_t buf[4] = 170021;
                            *(_WORD *)&buf[12] = 2080;
                            *(void *)&buf[14] = "YukonMigrateEmailUserDefaults";
                            _os_log_impl(&dword_1A7EFF000, v115, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                          }

                          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibrarySetThreadSendersRecipientsConflictResolutionUpgradeStep runWithConnection:v3] == 0;
                          _HandleSQLiteError(v4, @"Setting conflict resolution for primary key of thread_senders and thread_recipients");
                          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                          {
LABEL_282:
                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170022;
                            v116 = +[MFMailMessageLibraryMigrator log];
                            if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 134218242;
                              *(void *)&uint8_t buf[4] = 170022;
                              *(_WORD *)&buf[12] = 2080;
                              *(void *)&buf[14] = "YukonSetConflictResolutionForThreadSendersAndRecipients";
                              _os_log_impl(&dword_1A7EFF000, v116, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                            }

                            if (v5 <= 170010
                              || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryResetSequenceNumberMigrationStep runWithConnection:v3] == 0, _HandleSQLiteError(v4, @"Reset sequence_identifier for messages"), *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)))
                            {
LABEL_286:
                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170023;
                              v117 = +[MFMailMessageLibraryMigrator log];
                              if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 134218242;
                                *(void *)&uint8_t buf[4] = 170023;
                                *(_WORD *)&buf[12] = 2080;
                                *(void *)&buf[14] = "YukonResetSequenceIdentifierForFlagColors";
                                _os_log_impl(&dword_1A7EFF000, v117, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                              }

                              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddThreadsSendersAndRecipientsIndexes(v4);
                              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                              {
LABEL_289:
                                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170024;
                                v118 = +[MFMailMessageLibraryMigrator log];
                                if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)buf = 134218242;
                                  *(void *)&uint8_t buf[4] = 170024;
                                  *(_WORD *)&buf[12] = 2080;
                                  *(void *)&buf[14] = "YukonAddThreadSendersAndRecipientsIndexes";
                                  _os_log_impl(&dword_1A7EFF000, v118, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                }

                                if (v5 <= 170010
                                  || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryThreadFlagColorsUpgradeStep runWithConnection:v3] == 0, _HandleSQLiteError(v4, @"Adding flag support to threads"), *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)))
                                {
LABEL_293:
                                  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170025;
                                  v119 = +[MFMailMessageLibraryMigrator log];
                                  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_DWORD *)buf = 134218242;
                                    *(void *)&uint8_t buf[4] = 170025;
                                    *(_WORD *)&buf[12] = 2080;
                                    *(void *)&buf[14] = "YukonAddThreadFlagColorsColumns";
                                    _os_log_impl(&dword_1A7EFF000, v119, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                  }

                                  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddThreadsJournaledColumn(v4);
                                  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                  {
LABEL_296:
                                    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170026;
                                    v120 = +[MFMailMessageLibraryMigrator log];
                                    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
                                    {
                                      *(_DWORD *)buf = 134218242;
                                      *(void *)&uint8_t buf[4] = 170026;
                                      *(_WORD *)&buf[12] = 2080;
                                      *(void *)&buf[14] = "YukonAddThreadJournaledColumn";
                                      _os_log_impl(&dword_1A7EFF000, v120, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                    }

                                    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddMessageIndexesForThreadQueries(v4);
                                    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                    {
LABEL_299:
                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170027;
                                      v121 = +[MFMailMessageLibraryMigrator log];
                                      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
                                      {
                                        *(_DWORD *)buf = 134218242;
                                        *(void *)&uint8_t buf[4] = 170027;
                                        *(_WORD *)&buf[12] = 2080;
                                        *(void *)&buf[14] = "YukonAddMessageIndexesForThreadQueries";
                                        _os_log_impl(&dword_1A7EFF000, v121, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                      }

                                      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddMessageIDIndex(v4);
                                      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                      {
LABEL_302:
                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170028;
                                        v122 = +[MFMailMessageLibraryMigrator log];
                                        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                                        {
                                          *(_DWORD *)buf = 134218242;
                                          *(void *)&uint8_t buf[4] = 170028;
                                          *(_WORD *)&buf[12] = 2080;
                                          *(void *)&buf[14] = "YukonAddMessageIDIndex";
                                          _os_log_impl(&dword_1A7EFF000, v122, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                        }

                                        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddSenderVIPUnreadCountQueryIndex(v4);
                                        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                        {
LABEL_305:
                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170029;
                                          v123 = +[MFMailMessageLibraryMigrator log];
                                          if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
                                          {
                                            *(_DWORD *)buf = 134218242;
                                            *(void *)&uint8_t buf[4] = 170029;
                                            *(_WORD *)&buf[12] = 2080;
                                            *(void *)&buf[14] = "YukonSenderVIPCountQueryIndex";
                                            _os_log_impl(&dword_1A7EFF000, v123, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                          }

LABEL_308:
                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170030;
                                          v124 = +[MFMailMessageLibraryMigrator log];
                                          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                                          {
                                            *(_DWORD *)buf = 134218242;
                                            *(void *)&uint8_t buf[4] = 170030;
                                            *(_WORD *)&buf[12] = 2080;
                                            *(void *)&buf[14] = "YukonRemoveCategorySchema";
                                            _os_log_impl(&dword_1A7EFF000, v124, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                          }

                                          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _UpdateDeletedMailboxIndex(v4);
                                          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                          {
LABEL_311:
                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170031;
                                            v125 = +[MFMailMessageLibraryMigrator log];
                                            if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
                                            {
                                              *(_DWORD *)buf = 134218242;
                                              *(void *)&uint8_t buf[4] = 170031;
                                              *(_WORD *)&buf[12] = 2080;
                                              *(void *)&buf[14] = "YukonModifyDeletedMailboxIndex";
                                              _os_log_impl(&dword_1A7EFF000, v125, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                            }

                                            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddJournaledUndeletedIndex(v4);
                                            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                            {
LABEL_314:
                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170032;
                                              v126 = +[MFMailMessageLibraryMigrator log];
                                              if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
                                              {
                                                *(_DWORD *)buf = 134218242;
                                                *(void *)&uint8_t buf[4] = 170032;
                                                *(_WORD *)&buf[12] = 2080;
                                                *(void *)&buf[14] = "YukonAddJournaledUndeletedIndex";
                                                _os_log_impl(&dword_1A7EFF000, v126, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                              }

LABEL_317:
                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170033;
                                              v127 = +[MFMailMessageLibraryMigrator log];
                                              if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                                              {
                                                *(_DWORD *)buf = 134218242;
                                                *(void *)&uint8_t buf[4] = 170033;
                                                *(_WORD *)&buf[12] = 2080;
                                                *(void *)&buf[14] = "YukonCachedMetadataTableUnused1";
                                                _os_log_impl(&dword_1A7EFF000, v127, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                              }

                                              [*(id *)(a1 + 40) noteNeedsRebuildTriggers];
                                              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60BE8] runWithConnection:v3] == 0;
                                              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                              {
LABEL_320:
                                                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170034;
                                                v128 = +[MFMailMessageLibraryMigrator log];
                                                if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
                                                {
                                                  *(_DWORD *)buf = 134218242;
                                                  *(void *)&uint8_t buf[4] = 170034;
                                                  *(_WORD *)&buf[12] = 2080;
                                                  *(void *)&buf[14] = "YukonRemoveReadLaterSchema";
                                                  _os_log_impl(&dword_1A7EFF000, v128, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                }

LABEL_323:
                                                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170035;
                                                v129 = +[MFMailMessageLibraryMigrator log];
                                                if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
                                                {
                                                  *(_DWORD *)buf = 134218242;
                                                  *(void *)&uint8_t buf[4] = 170035;
                                                  *(_WORD *)&buf[12] = 2080;
                                                  *(void *)&buf[14] = "YukonRemoveReadLaterSchemaDotsubmission";
                                                  _os_log_impl(&dword_1A7EFF000, v129, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                }

LABEL_326:
                                                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170036;
                                                v130 = +[MFMailMessageLibraryMigrator log];
                                                if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
                                                {
                                                  *(_DWORD *)buf = 134218242;
                                                  *(void *)&uint8_t buf[4] = 170036;
                                                  *(_WORD *)&buf[12] = 2080;
                                                  *(void *)&buf[14] = "YukonCachedMetadataTableUnused2";
                                                  _os_log_impl(&dword_1A7EFF000, v130, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                }

                                                *(void *)buf = "CREATE TABLE IF NOT EXISTS table_metadata (table_name T"
                                                                 "EXT COLLATE BINARY NOT NULL,\n"
                                                                 "                                           largest_dele"
                                                                 "ted_rowid INTEGER NOT NULL DEFAULT 0,\n"
                                                                 "                                           PRIMARY KEY("
                                                                 "table_name)) WITHOUT ROWID;";
                                                *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v4, (uint64_t)buf, 1, @"creating table_metadata table");
                                                if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                {
LABEL_329:
                                                  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170037;
                                                  v131 = +[MFMailMessageLibraryMigrator log];
                                                  if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    *(_DWORD *)buf = 134218242;
                                                    *(void *)&uint8_t buf[4] = 170037;
                                                    *(_WORD *)&buf[12] = 2080;
                                                    *(void *)&buf[14] = "YukonAddTableMetadataTable";
                                                    _os_log_impl(&dword_1A7EFF000, v131, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                  }

                                                  [*(id *)(a1 + 40) noteNeedsRebuildTriggers];
                                                  int v132 = executeQuery(1, v4, "DROP TABLE IF EXISTS message_metadata;",
                                                           @"Dropping table message_metadata.");
                                                  int v133 = executeQuery(v132, v4, "CREATE TABLE message_metadata (message_id INTEGER PRIMARY KEY, timestamp INTEGER NOT NULL, json_values TEXT COLLATE BINARY NOT NULL);",
                                                           @"Creating message_metadata table.");
                                                  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = executeQuery(v133, v4, "CREATE INDEX message_metadata_timestamp_index ON message_metadata(timestamp);", @"Creating message_metadata index.");
                                                  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                  {
LABEL_332:
                                                    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170038;
                                                    v134 = +[MFMailMessageLibraryMigrator log];
                                                    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      *(_DWORD *)buf = 134218242;
                                                      *(void *)&uint8_t buf[4] = 170038;
                                                      *(_WORD *)&buf[12] = 2080;
                                                      *(void *)&buf[14] = "YukonCachedMetadataTable";
                                                      _os_log_impl(&dword_1A7EFF000, v134, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                    }

                                                    if (v5 <= 170010
                                                      || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryFixPopUidsUniquenessConstraintUpgradeStep runWithConnection:v3] == 0) != 0)
                                                    {
LABEL_336:
                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170039;
                                                      v135 = +[MFMailMessageLibraryMigrator log];
                                                      if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        *(_DWORD *)buf = 134218242;
                                                        *(void *)&uint8_t buf[4] = 170039;
                                                        *(_WORD *)&buf[12] = 2080;
                                                        *(void *)&buf[14] = "YukonFixPopUidsUniquenessConstraint";
                                                        _os_log_impl(&dword_1A7EFF000, v135, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                      }

                                                      if (v5 <= 170025
                                                        || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddThreadJournaledDateIndex(v4)) != 0)
                                                      {
LABEL_340:
                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170050;
                                                        v136 = +[MFMailMessageLibraryMigrator log];
                                                        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
                                                        {
                                                          *(_DWORD *)buf = 134218242;
                                                          *(void *)&uint8_t buf[4] = 170050;
                                                          *(_WORD *)&buf[12] = 2080;
                                                          *(void *)&buf[14] = "YukonAddThreadJournaledDateIndex";
                                                          _os_log_impl(&dword_1A7EFF000, v136, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                        }

                                                        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60B58] run];
                                                        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                        {
LABEL_343:
                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170051;
                                                          v137 = +[MFMailMessageLibraryMigrator log];
                                                          if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            *(_DWORD *)buf = 134218242;
                                                            *(void *)&uint8_t buf[4] = 170051;
                                                            *(_WORD *)&buf[12] = 2080;
                                                            *(void *)&buf[14] = "YukonMigrateBlockedSenderEnabledToActionEnum";
                                                            _os_log_impl(&dword_1A7EFF000, v137, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                          }

                                                          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddUnreadCountJournalIndexes(v4);
                                                          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                          {
LABEL_346:
                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170052;
                                                            v138 = +[MFMailMessageLibraryMigrator log];
                                                            if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                                                            {
                                                              *(_DWORD *)buf = 134218242;
                                                              *(void *)&uint8_t buf[4] = 170052;
                                                              *(_WORD *)&buf[12] = 2080;
                                                              *(void *)&buf[14] = "YukonAddUnreadCountIndexes";
                                                              _os_log_impl(&dword_1A7EFF000, v138, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                            }

                                                            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddAppBadgeCountIndexes(v4);
                                                            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 24))
                                                            {
LABEL_349:
                                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170053;
                                                              v139 = +[MFMailMessageLibraryMigrator log];
                                                              if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
                                                              {
                                                                *(_DWORD *)buf = 134218242;
                                                                *(void *)&uint8_t buf[4] = 170053;
                                                                *(_WORD *)&buf[12] = 2080;
                                                                *(void *)&buf[14] = "YukonAddAppBadgeCountIndexes";
                                                                _os_log_impl(&dword_1A7EFF000, v139, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                              }

LABEL_352:
                                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170054;
                                                              v140 = +[MFMailMessageLibraryMigrator log];
                                                              if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
                                                              {
                                                                *(_DWORD *)buf = 134218242;
                                                                *(void *)&uint8_t buf[4] = 170054;
                                                                *(_WORD *)&buf[12] = 2080;
                                                                *(void *)&buf[14] = "YukonResetThreadScopes";
                                                                _os_log_impl(&dword_1A7EFF000, v140, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                              }

                                                              if (!_protectedIndexHasBeenInitialized(*(void **)(a1 + 48))
                                                                || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                             + 24) = _ResetSummary(v4)) != 0)
                                                              {
LABEL_356:
                                                                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170055;
                                                                v141 = +[MFMailMessageLibraryMigrator log];
                                                                if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
                                                                {
                                                                  *(_DWORD *)buf = 134218242;
                                                                  *(void *)&uint8_t buf[4] = 170055;
                                                                  *(_WORD *)&buf[12] = 2080;
                                                                  *(void *)&buf[14] = "YukonResetSummary";
                                                                  _os_log_impl(&dword_1A7EFF000, v141, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                }

                                                                v142 = (void *)[objc_alloc(MEMORY[0x1E4F60EB0]) initWithTableName:@"messages" columnNames:&unk_1EFF50730];
                                                                *(void *)buf = v142;
                                                                v143 = (void *)[objc_alloc(MEMORY[0x1E4F60EB0]) initWithTableName:@"messages" columnNames:&unk_1EFF50748];
                                                                *(void *)&buf[8] = v143;
                                                                v144 = (void *)[objc_alloc(MEMORY[0x1E4F60EB0]) initWithTableName:@"messages" columnNames:&unk_1EFF50760];
                                                                *(void *)&buf[16] = v144;
                                                                v145 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

                                                                v146 = objc_msgSend(v145, "ef_map:", &__block_literal_global_916);
                                                                id v147 = [v146 componentsJoinedByString:@"\n"];
                                                                v148 = (const char *)[v147 UTF8String];

                                                                LODWORD(v146) = sqlite3_exec(v4, v148, 0, 0, 0);
                                                                _HandleSQLiteError(v4, @"Adding sender_vip/conversation message indexes");

                                                                *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v146 == 0;
                                                                if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24))
                                                                {
LABEL_359:
                                                                  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170056;
                                                                  v149 = +[MFMailMessageLibraryMigrator log];
                                                                  if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
                                                                  {
                                                                    *(_DWORD *)buf = 134218242;
                                                                    *(void *)&uint8_t buf[4] = 170056;
                                                                    *(_WORD *)&buf[12] = 2080;
                                                                    *(void *)&buf[14] = "YukonAddSenderVIPAndConversationIndexes";
                                                                    _os_log_impl(&dword_1A7EFF000, v149, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                  }

                                                                  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                           + 24) = _AddDeletedToMessagesConversationIDIndexes(v4);
                                                                  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 24))
                                                                  {
LABEL_362:
                                                                    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170057;
                                                                    v150 = +[MFMailMessageLibraryMigrator log];
                                                                    if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
                                                                    {
                                                                      *(_DWORD *)buf = 134218242;
                                                                      *(void *)&uint8_t buf[4] = 170057;
                                                                      *(_WORD *)&buf[12] = 2080;
                                                                      *(void *)&buf[14] = "YukonResetThreadScopes2";
                                                                      _os_log_impl(&dword_1A7EFF000, v150, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                    }

                                                                    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                             + 24) = _AddFilterIndexesAndRemoveTriggers(v4);
                                                                    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64)
                                                                                              + 8)
                                                                                  + 24))
                                                                    {
LABEL_365:
                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 170058;
                                                                      v151 = +[MFMailMessageLibraryMigrator log];
                                                                      if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
                                                                      {
                                                                        *(_DWORD *)buf = 134218242;
                                                                        *(void *)&uint8_t buf[4] = 170058;
                                                                        *(_WORD *)&buf[12] = 2080;
                                                                        *(void *)&buf[14] = "YukonAddFilterIndexesAndRemoveTriggers";
                                                                        _os_log_impl(&dword_1A7EFF000, v151, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                      }

                                                                      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                               + 24) = +[MFMailMessageLibraryRebuildThreadsTableUpgradeStep runWithConnection:v3] == 0;
                                                                      _HandleSQLiteError(v4, @"Removing deleted column from threads");
                                                                      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64)
                                                                                                + 8)
                                                                                    + 24))
                                                                      {
LABEL_368:
                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                  + 24) = 170059;
                                                                        v152 = +[MFMailMessageLibraryMigrator log];
                                                                        if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
                                                                        {
                                                                          *(_DWORD *)buf = 134218242;
                                                                          *(void *)&uint8_t buf[4] = 170059;
                                                                          *(_WORD *)&buf[12] = 2080;
                                                                          *(void *)&buf[14] = "YukonResetThreadScopes3";
                                                                          _os_log_impl(&dword_1A7EFF000, v152, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                        }

                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                  + 24) = 180000;
                                                                        v153 = +[MFMailMessageLibraryMigrator log];
                                                                        if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
                                                                        {
                                                                          *(_DWORD *)buf = 134218242;
                                                                          *(void *)&uint8_t buf[4] = 180000;
                                                                          *(_WORD *)&buf[12] = 2080;
                                                                          *(void *)&buf[14] = "YukonCDEBaseline";
                                                                          _os_log_impl(&dword_1A7EFF000, v153, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                        }

                                                                        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                 + 24) = [MEMORY[0x1E4F60A18] runWithConnection:v3] == 0;
                                                                        _HandleSQLiteError(v4, @"Adding searchable_message column to messages");
                                                                        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64)
                                                                                                  + 8)
                                                                                      + 24))
                                                                        {
                                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                    + 24) = 180001;
                                                                          v154 = +[MFMailMessageLibraryMigrator log];
                                                                          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
                                                                          {
                                                                            *(_DWORD *)buf = 134218242;
                                                                            *(void *)&uint8_t buf[4] = 180001;
                                                                            *(_WORD *)&buf[12] = 2080;
                                                                            *(void *)&buf[14] = "YukonCDEAddMessagesSea"
                                                                                                  "rchableMessageColumn";
                                                                            _os_log_impl(&dword_1A7EFF000, v154, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                          }

                                                                          *(unsigned char *)(*(void *)(*(void *)(a1 + 64)
                                                                                               + 8)
                                                                                   + 24) = _ModifyMessagesSearchableMessageIndex(v4);
                                                                          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                        + 24))
                                                                          {
                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                      + 24) = 180002;
                                                                            v155 = +[MFMailMessageLibraryMigrator log];
                                                                            if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
                                                                            {
                                                                              *(_DWORD *)buf = 134218242;
                                                                              *(void *)&uint8_t buf[4] = 180002;
                                                                              *(_WORD *)&buf[12] = 2080;
                                                                              *(void *)&buf[14] = "YukonCDEModifyMessagesSearchableMessageIndex";
                                                                              _os_log_impl(&dword_1A7EFF000, v155, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                            }

                                                                            *(unsigned char *)(*(void *)(*(void *)(a1 + 64)
                                                                                                 + 8)
                                                                                     + 24) = _AddMessagesMailboxDeletedDateReceivedIndex(v4);
                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                      + 24) = 180003;
                                                                            v156 = +[MFMailMessageLibraryMigrator log];
                                                                            if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
                                                                            {
                                                                              *(_DWORD *)buf = 134218242;
                                                                              *(void *)&uint8_t buf[4] = 180003;
                                                                              *(_WORD *)&buf[12] = 2080;
                                                                              *(void *)&buf[14] = "YukonCDEAddInMemoryThreadIndex";
                                                                              _os_log_impl(&dword_1A7EFF000, v156, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                            }

LABEL_381:
                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                      + 24) = 180500;
                                                                            v157 = +[MFMailMessageLibraryMigrator log];
                                                                            if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
                                                                            {
                                                                              *(_DWORD *)buf = 134218242;
                                                                              *(void *)&uint8_t buf[4] = 180500;
                                                                              *(_WORD *)&buf[12] = 2080;
                                                                              *(void *)&buf[14] = "AzulBaseline";
                                                                              _os_log_impl(&dword_1A7EFF000, v157, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                            }

                                                                            *(unsigned char *)(*(void *)(*(void *)(a1 + 64)
                                                                                                 + 8)
                                                                                     + 24) = +[MFMailMessageLibraryGlobalDataUpgradeStep runWithConnection:v3] == 0;
                                                                            _HandleSQLiteError(v4, @"Adding global data table");
                                                                            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                          + 24))
                                                                            {
LABEL_384:
                                                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                        + 24) = 180501;
                                                                              v158 = +[MFMailMessageLibraryMigrator log];
                                                                              if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
                                                                              {
                                                                                *(_DWORD *)buf = 134218242;
                                                                                *(void *)&uint8_t buf[4] = 180501;
                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                *(void *)&buf[14] = "AzulAddMessageGlobalData";
                                                                                _os_log_impl(&dword_1A7EFF000, v158, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                              }

                                                                              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                       + 24) = executeQuery(1, v4, "DELETE FROM message_metadata;",
                                                                                                   @"Removing all entries from message_metadata.");
                                                                              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                            + 24))
                                                                              {
LABEL_387:
                                                                                *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                          + 24) = 180502;
                                                                                v159 = +[MFMailMessageLibraryMigrator log];
                                                                                if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
                                                                                {
                                                                                  *(_DWORD *)buf = 134218242;
                                                                                  *(void *)&uint8_t buf[4] = 180502;
                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                  *(void *)&buf[14] = "AzulResetMessageMetadata";
                                                                                  _os_log_impl(&dword_1A7EFF000, v159, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                }

                                                                                *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                         + 24) = [MEMORY[0x1E4F60A38] runWithConnection:v3] == 0;
                                                                                _HandleSQLiteError(v4, @"Adding remote_content_links table");
                                                                                if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                              + 24))
                                                                                {
LABEL_390:
                                                                                  *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                            + 24) = 180503;
                                                                                  v160 = +[MFMailMessageLibraryMigrator log];
                                                                                  if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
                                                                                  {
                                                                                    *(_DWORD *)buf = 134218242;
                                                                                    *(void *)&uint8_t buf[4] = 180503;
                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                    *(void *)&buf[14] = "AzulAddRemoteContentLinksTable";
                                                                                    _os_log_impl(&dword_1A7EFF000, v160, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                  }

                                                                                  if (v5 <= 180500
                                                                                    || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                                 + 24) = +[MFMailMessageLibraryRecreateMessageIndicesUpgradeStep runWithConnection:v3]) != 0)
                                                                                  {
LABEL_394:
                                                                                    *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                              + 24) = 180504;
                                                                                    v161 = +[MFMailMessageLibraryMigrator log];
                                                                                    if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
                                                                                    {
                                                                                      *(_DWORD *)buf = 134218242;
                                                                                      *(void *)&uint8_t buf[4] = 180504;
                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                      *(void *)&buf[14] = "AzulRecreateMessageIndices";
                                                                                      _os_log_impl(&dword_1A7EFF000, v161, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                    }

                                                                                    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                             + 24) = executeQuery(1, v4, "INSERT INTO properties (key, value) VALUES ('UseLegacyMessageIDHashFormat', 1) ON CONFLICT(key) DO UPDATE SET value = 1;", @"Inserting UseLegacyMessageIDHashFormat property.");
                                                                                    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                                  + 24))
                                                                                    {
LABEL_397:
                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                                + 24) = 180505;
                                                                                      v162 = +[MFMailMessageLibraryMigrator log];
                                                                                      if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
                                                                                      {
                                                                                        *(_DWORD *)buf = 134218242;
                                                                                        *(void *)&uint8_t buf[4] = 180505;
                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                        *(void *)&buf[14] = "AzulSetUseLegacyMessageIDHashFormat";
                                                                                        _os_log_impl(&dword_1A7EFF000, v162, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                      }

                                                                                      [*(id *)(a1 + 40) noteNeedsSpotlightReindex];
LABEL_400:
                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                                + 24) = 180506;
                                                                                      v163 = +[MFMailMessageLibraryMigrator log];
                                                                                      if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
                                                                                      {
                                                                                        *(_DWORD *)buf = 134218242;
                                                                                        *(void *)&uint8_t buf[4] = 180506;
                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                        *(void *)&buf[14] = "AzulReindexMessagesMailMessageID";
                                                                                        _os_log_impl(&dword_1A7EFF000, v163, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                      }

                                                                                      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                               + 24) = executeQuery(1, v4, "DROP TABLE IF EXISTS remote_content_links;", @"Removing remote_content_links table.");
                                                                                      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                      {
LABEL_403:
                                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8)
                                                                                                  + 24) = 180507;
                                                                                        v164 = +[MFMailMessageLibraryMigrator log];
                                                                                        if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
                                                                                        {
                                                                                          *(_DWORD *)buf = 134218242;
                                                                                          *(void *)&uint8_t buf[4] = 180507;
                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                          *(void *)&buf[14] = "AzulRemoveRemoteContentLinksTable";
                                                                                          _os_log_impl(&dword_1A7EFF000, v164, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                        }

                                                                                        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                                 + 24) = [MEMORY[0x1E4F60C58] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                        _HandleSQLiteError(v4, @"Adding searchable_messages index");
                                                                                        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                        {
LABEL_406:
                                                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 180508;
                                                                                          v165 = +[MFMailMessageLibraryMigrator log];
                                                                                          if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
                                                                                          {
                                                                                            *(_DWORD *)buf = 134218242;
                                                                                            *(void *)&uint8_t buf[4] = 180508;
                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                            *(void *)&buf[14] = "AzulUpdateSearchableMessagesIndex";
                                                                                            _os_log_impl(&dword_1A7EFF000, v165, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                          }

                                                                                          if (v5 <= 180500
                                                                                            || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _UpdateGlobalIDIndex(*(void **)(a1 + 48)),
                                                                                                _HandleSQLiteError(v4, @"Updating globalMessageID index"), *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)))
                                                                                          {
LABEL_410:
                                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 180509;
                                                                                            v166 = +[MFMailMessageLibraryMigrator log];
                                                                                            if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
                                                                                            {
                                                                                              *(_DWORD *)buf = 134218242;
                                                                                              *(void *)&uint8_t buf[4] = 180509;
                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                              *(void *)&buf[14] = "AzulUpdateGlobalMessageIDIndex";
                                                                                              _os_log_impl(&dword_1A7EFF000, v166, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                            }

                                                                                            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A38] runWithConnection:v3] == 0;
                                                                                            _HandleSQLiteError(v4, @"Adding remote_content_links table");
                                                                                            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                            {
                                                                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 190001;
                                                                                              v167 = +[MFMailMessageLibraryMigrator log];
                                                                                              if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
                                                                                              {
                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                *(void *)&uint8_t buf[4] = 190001;
                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                *(void *)&buf[14] = "SkyAddRemoteContentLinksTable";
                                                                                                _os_log_impl(&dword_1A7EFF000, v167, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                              }

                                                                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 190002;
                                                                                              v168 = +[MFMailMessageLibraryMigrator log];
                                                                                              if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
                                                                                              {
                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                *(void *)&uint8_t buf[4] = 190002;
                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                *(void *)&buf[14] = "SkyMigrateRemoteContentDefault";
                                                                                                _os_log_impl(&dword_1A7EFF000, v168, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                              }

                                                                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 190003;
                                                                                              v169 = +[MFMailMessageLibraryMigrator log];
                                                                                              if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
                                                                                              {
                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                *(void *)&uint8_t buf[4] = 190003;
                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                *(void *)&buf[14] = "SkyBogusStep";
                                                                                                _os_log_impl(&dword_1A7EFF000, v169, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                              }

                                                                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 190004;
                                                                                              v170 = +[MFMailMessageLibraryMigrator log];
                                                                                              if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
                                                                                              {
                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                *(void *)&uint8_t buf[4] = 190004;
                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                *(void *)&buf[14] = "SkyBogusStep2";
                                                                                                _os_log_impl(&dword_1A7EFF000, v170, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                              }

                                                                                              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60C70] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                              _HandleSQLiteError(v4, @"Adding message_attachments table and update attachment table");
                                                                                              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                              {
                                                                                                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 190005;
                                                                                                v171 = +[MFMailMessageLibraryMigrator log];
                                                                                                if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
                                                                                                {
                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                  *(void *)&uint8_t buf[4] = 190005;
                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                  *(void *)&buf[14] = "SkyAddMessageAttachmentsAndUpdateAttachmentsTable";
                                                                                                  _os_log_impl(&dword_1A7EFF000, v171, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                }

                                                                                                [*(id *)(a1 + 40) noteNeedsSpotlightReindex];
                                                                                                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 190006;
                                                                                                v172 = +[MFMailMessageLibraryMigrator log];
                                                                                                if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
                                                                                                {
                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                  *(void *)&uint8_t buf[4] = 190006;
                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                  *(void *)&buf[14] = "SkyBIndexSpotlightWithGlobalMessageID";
                                                                                                  _os_log_impl(&dword_1A7EFF000, v172, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                }

                                                                                                *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A28] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                _HandleSQLiteError(v4, @"Adding read_later table");
                                                                                                if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                {
LABEL_427:
                                                                                                  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200001;
                                                                                                  v173 = +[MFMailMessageLibraryMigrator log];
                                                                                                  if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                                                                                                  {
                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                    *(void *)&uint8_t buf[4] = 200001;
                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                    *(void *)&buf[14] = "SydneyAddReadLaterTable";
                                                                                                    _os_log_impl(&dword_1A7EFF000, v173, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                  }

                                                                                                  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A70] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                  _HandleSQLiteError(v4, @"Adding unsubscribe_type column");
                                                                                                  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                  {
LABEL_430:
                                                                                                    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200002;
                                                                                                    v174 = +[MFMailMessageLibraryMigrator log];
                                                                                                    if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
                                                                                                    {
                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                      *(void *)&uint8_t buf[4] = 200002;
                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                      *(void *)&buf[14] = "SydneyAddUnsubscribeFlags";
                                                                                                      _os_log_impl(&dword_1A7EFF000, v174, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                    }

                                                                                                    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A50] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                    _HandleSQLiteError(v4, @"Adding send_later table");
                                                                                                    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                    {
LABEL_433:
                                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200003;
                                                                                                      v175 = +[MFMailMessageLibraryMigrator log];
                                                                                                      if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
                                                                                                      {
                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                        *(void *)&uint8_t buf[4] = 200003;
                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                        *(void *)&buf[14] = "SydneyAddSendLaterTable";
                                                                                                        _os_log_impl(&dword_1A7EFF000, v175, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                      }

LABEL_436:
                                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200004;
                                                                                                      v176 = +[MFMailMessageLibraryMigrator log];
                                                                                                      if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
                                                                                                      {
                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                        *(void *)&uint8_t buf[4] = 200004;
                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                        *(void *)&buf[14] = "SydneyAddDataDetectionTable";
                                                                                                        _os_log_impl(&dword_1A7EFF000, v176, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                      }

                                                                                                      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryAddMailboxActionsUpgradeStep runWithConnection:*(void *)(a1 + 48)] == 0;
LABEL_439:
                                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200005;
                                                                                                      v177 = +[MFMailMessageLibraryMigrator log];
                                                                                                      if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
                                                                                                      {
                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                        *(void *)&uint8_t buf[4] = 200005;
                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                        *(void *)&buf[14] = "SydneyAddMailboxActionsTable";
                                                                                                        _os_log_impl(&dword_1A7EFF000, v177, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                      }

                                                                                                      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A48] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                      _HandleSQLiteError(v4, @"Adding searchable data detection table");
                                                                                                      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                      {
LABEL_442:
                                                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200006;
                                                                                                        v178 = +[MFMailMessageLibraryMigrator log];
                                                                                                        if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
                                                                                                        {
                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                          *(void *)&uint8_t buf[4] = 200006;
                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                          *(void *)&buf[14] = "SydneyAddSearchableDataDetectionTable";
                                                                                                          _os_log_impl(&dword_1A7EFF000, v178, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                        }

                                                                                                        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A00] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                        _HandleSQLiteError(v4, @"Adding brand_indicator column to messages table");
                                                                                                        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                        {
LABEL_445:
                                                                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200007;
                                                                                                          v179 = +[MFMailMessageLibraryMigrator log];
                                                                                                          if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
                                                                                                          {
                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                            *(void *)&uint8_t buf[4] = 200007;
                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                            *(void *)&buf[14] = "SydneyAddBrandIndicatorTable";
                                                                                                            _os_log_impl(&dword_1A7EFF000, v179, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                          }

                                                                                                          [*(id *)(a1 + 40) noteNeedsSpotlightReindex];
LABEL_448:
                                                                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200008;
                                                                                                          v180 = +[MFMailMessageLibraryMigrator log];
                                                                                                          if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
                                                                                                          {
                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                            *(void *)&uint8_t buf[4] = 200008;
                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                            *(void *)&buf[14] = "SydneyReindexSenderAttachmentItems";
                                                                                                            _os_log_impl(&dword_1A7EFF000, v180, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                          }

                                                                                                          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A10] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                          _HandleSQLiteError(v4, @"Adding follow_up_date column to message_global_data table");
                                                                                                          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                          {
LABEL_451:
                                                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200009;
                                                                                                            v181 = +[MFMailMessageLibraryMigrator log];
                                                                                                            if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
                                                                                                            {
                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                              *(void *)&uint8_t buf[4] = 200009;
                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                              *(void *)&buf[14] = "SydneyAddMessagesFollowUpColumnUpgradeStep";
                                                                                                              _os_log_impl(&dword_1A7EFF000, v181, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                            }

LABEL_454:
                                                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200010;
                                                                                                            v182 = +[MFMailMessageLibraryMigrator log];
                                                                                                            if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
                                                                                                            {
                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                              *(void *)&uint8_t buf[4] = 200010;
                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                              *(void *)&buf[14] = "SydneyAddSendersTableUpgradeStep";
                                                                                                              _os_log_impl(&dword_1A7EFF000, v182, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                            }

                                                                                                            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A60] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                            _HandleSQLiteError(v4, @"Adding senders and sender_addresses tables");
                                                                                                            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                            {
LABEL_457:
                                                                                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200011;
                                                                                                              v183 = +[MFMailMessageLibraryMigrator log];
                                                                                                              if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
                                                                                                              {
                                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                                *(void *)&uint8_t buf[4] = 200011;
                                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                                *(void *)&buf[14] = "SydneyRepopulateSendersTableUpgradeStep";
                                                                                                                _os_log_impl(&dword_1A7EFF000, v183, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                              }

                                                                                                              if (!_protectedIndexHasBeenInitialized(*(void **)(a1 + 48)) || (v184 = (void *)MEMORY[0x1E4F609A8], uint64_t v185 = *(void *)(a1 + 48), +[MFProtectedDatabasePersistence_iOS protectedDatabaseName](MFProtectedDatabasePersistence_iOS, "protectedDatabaseName"), v186 = objc_claimAutoreleasedReturnValue(), *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v184 runWithConnection:v185 databaseName:v186] == 0, v186, _HandleSQLiteError(v4, @"Re-adding brand_indicators table"), *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)))
                                                                                                              {
LABEL_461:
                                                                                                                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200012;
                                                                                                                v187 = +[MFMailMessageLibraryMigrator log];
                                                                                                                if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
                                                                                                                {
                                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                                  *(void *)&uint8_t buf[4] = 200012;
                                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                                  *(void *)&buf[14] = "SydneyReAddBrandIndicatorsTableUpgradeStep";
                                                                                                                  _os_log_impl(&dword_1A7EFF000, v187, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                }

                                                                                                                *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = executeQuery(1, v4, "DROP INDEX IF EXISTS brand_indicators_indicator_url_indicator_hash_hash_algorithm_index;", @"Removing brand_indicators_indicator_url_indicator_hash_hash_algorithm_index.");
                                                                                                                if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                {
LABEL_464:
                                                                                                                  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200013;
                                                                                                                  v188 = +[MFMailMessageLibraryMigrator log];
                                                                                                                  if (os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT))
                                                                                                                  {
                                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                                    *(void *)&uint8_t buf[4] = 200013;
                                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                                    *(void *)&buf[14] = "SydneyRemoveIncompatibleBrandIndicatorsIndexUpgradeStep";
                                                                                                                    _os_log_impl(&dword_1A7EFF000, v188, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                  }

                                                                                                                  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = executeQuery(1, v4, "ALTER TABLE mailbox_actions ADD COLUMN new_mailbox_name TEXT;", @"Adding new_mailbox_name column.");
                                                                                                                  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                  {
LABEL_467:
                                                                                                                    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200014;
                                                                                                                    v189 = +[MFMailMessageLibraryMigrator log];
                                                                                                                    if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
                                                                                                                    {
                                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                                      *(void *)&uint8_t buf[4] = 200014;
                                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                                      *(void *)&buf[14] = "SydneyAddMailboxRenameActionStep";
                                                                                                                      _os_log_impl(&dword_1A7EFF000, v189, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                    }

                                                                                                                    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A30] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                    _HandleSQLiteError(v4, @"Adding rebuild table");
                                                                                                                    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                    {
LABEL_470:
                                                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200015;
                                                                                                                      v190 = +[MFMailMessageLibraryMigrator log];
                                                                                                                      if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
                                                                                                                      {
                                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                                        *(void *)&uint8_t buf[4] = 200015;
                                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                                        *(void *)&buf[14] = "SydneyAddRebuildTableUpgradeStep";
                                                                                                                        _os_log_impl(&dword_1A7EFF000, v190, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                      }

                                                                                                                      [*(id *)(a1 + 40) noteNeedsSpotlightReindex];
                                                                                                                      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
LABEL_473:
                                                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200016;
                                                                                                                      v191 = +[MFMailMessageLibraryMigrator log];
                                                                                                                      if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
                                                                                                                      {
                                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                                        *(void *)&uint8_t buf[4] = 200016;
                                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                                        *(void *)&buf[14] = "SydneyTriggerSpotlightReIndexUpgradeStep";
                                                                                                                        _os_log_impl(&dword_1A7EFF000, v191, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                      }

                                                                                                                      id v192 = *(id *)(a1 + 48);
                                                                                                                      if ([MEMORY[0x1E4F609D0] runWithConnection:v192]) {
                                                                                                                        BOOL v193 = 0;
                                                                                                                      }
                                                                                                                      else {
                                                                                                                        BOOL v193 = sqlite3_exec((sqlite3 *)[v192 sqlDB], "CREATE INDEX IF NOT EXISTS messages_mailbox_deleted_display_date_index ON messages(mailbox, deleted, display_date) WHERE journaled = 0;CREATE INDEX IF NOT EXISTS messages_deleted_conversation_id_display_date_index ON messages(deleted, conversation_id, display_date);", 0, 0, 0) == 0;
                                                                                                                      }

                                                                                                                      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v193;
                                                                                                                      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                      {
LABEL_480:
                                                                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200017;
                                                                                                                        v194 = +[MFMailMessageLibraryMigrator log];
                                                                                                                        if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
                                                                                                                        {
                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                          *(void *)&uint8_t buf[4] = 200017;
                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                          *(void *)&buf[14] = "SydneyAddDisplayDateColumnUpgradeStep";
                                                                                                                          _os_log_impl(&dword_1A7EFF000, v194, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                        }

LABEL_483:
                                                                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200018;
                                                                                                                        v195 = +[MFMailMessageLibraryMigrator log];
                                                                                                                        if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
                                                                                                                        {
                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                          *(void *)&uint8_t buf[4] = 200018;
                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                          *(void *)&buf[14] = "SydneyAddRichLinkTable";
                                                                                                                          _os_log_impl(&dword_1A7EFF000, v195, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                        }

                                                                                                                        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A40] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                        _HandleSQLiteError(v4, @"Adding rich links table");
                                                                                                                        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                        {
LABEL_486:
                                                                                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200019;
                                                                                                                          v196 = +[MFMailMessageLibraryMigrator log];
                                                                                                                          if (os_log_type_enabled(v196, OS_LOG_TYPE_DEFAULT))
                                                                                                                          {
                                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                                            *(void *)&uint8_t buf[4] = 200019;
                                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                                            *(void *)&buf[14] = "SydneyAddSearchableRichLinkTable";
                                                                                                                            _os_log_impl(&dword_1A7EFF000, v196, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                          }

                                                                                                                          if (!_protectedIndexHasBeenInitialized(*(void **)(a1 + 48)) || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryPopulateSendersTableMigrationStep runWithConnection:*(void *)(a1 + 48)] == 0, _HandleSQLiteError(v4, @"Populating senders and sender_addresses tables"), *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)))
                                                                                                                          {
LABEL_490:
                                                                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200020;
                                                                                                                            v197 = +[MFMailMessageLibraryMigrator log];
                                                                                                                            if (os_log_type_enabled(v197, OS_LOG_TYPE_DEFAULT))
                                                                                                                            {
                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                              *(void *)&uint8_t buf[4] = 200020;
                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                              *(void *)&buf[14] = "SydneyRepopulateSendersTableUpgradeStep2";
                                                                                                                              _os_log_impl(&dword_1A7EFF000, v197, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                            }

                                                                                                                            [*(id *)(a1 + 40) noteNeedsSpotlightReindex];
                                                                                                                            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
LABEL_493:
                                                                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200021;
                                                                                                                            v198 = +[MFMailMessageLibraryMigrator log];
                                                                                                                            if (os_log_type_enabled(v198, OS_LOG_TYPE_DEFAULT))
                                                                                                                            {
                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                              *(void *)&uint8_t buf[4] = 200021;
                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                              *(void *)&buf[14] = "SydneyAddSearchableFlagColorsUpgradeStep";
                                                                                                                              _os_log_impl(&dword_1A7EFF000, v198, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                            }

                                                                                                                            [*(id *)(a1 + 40) noteNeedsSpotlightReindex];
                                                                                                                            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
LABEL_496:
                                                                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200022;
                                                                                                                            v199 = +[MFMailMessageLibraryMigrator log];
                                                                                                                            if (os_log_type_enabled(v199, OS_LOG_TYPE_DEFAULT))
                                                                                                                            {
                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                              *(void *)&uint8_t buf[4] = 200022;
                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                              *(void *)&buf[14] = "SydneyAddSearchableMailAttachmentTypeUpgradeStep";
                                                                                                                              _os_log_impl(&dword_1A7EFF000, v199, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                            }

                                                                                                                            if (v5 > 200002)
                                                                                                                            {
                                                                                                                              _resetLocalAccountMboxCache();
                                                                                                                              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
                                                                                                                            }
LABEL_500:
                                                                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200023;
                                                                                                                            v200 = +[MFMailMessageLibraryMigrator log];
                                                                                                                            if (os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT))
                                                                                                                            {
                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                              *(void *)&uint8_t buf[4] = 200023;
                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                              *(void *)&buf[14] = "SydneyCleanUpLocalMboxCacheUpgradeStep";
                                                                                                                              _os_log_impl(&dword_1A7EFF000, v200, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                            }

                                                                                                                            id v201 = *(id *)(a1 + 48);
                                                                                                                            BOOL v202 = sqlite3_exec((sqlite3 *)[v201 sqlDB], "ALTER TABLE threads ADD COLUMN display_date INTEGER NOT NULL DEFAULT 0;UPDATE threads SET display_date = date;CREATE INDEX IF NOT EXISTS threads_scope_display_date_conversation_index ON threads(scope, display_date, conversation);", 0, 0, 0) == 0;

                                                                                                                            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v202;
                                                                                                                            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                            {
LABEL_503:
                                                                                                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200024;
                                                                                                                              v203 = +[MFMailMessageLibraryMigrator log];
                                                                                                                              if (os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT))
                                                                                                                              {
                                                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                                                *(void *)&uint8_t buf[4] = 200024;
                                                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                                                *(void *)&buf[14] = "SydneyAddThreadsDisplayDateColumn";
                                                                                                                                _os_log_impl(&dword_1A7EFF000, v203, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                              }

                                                                                                                              if (v5 >= 200000 || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddFilterPredicateToInboxThreadScopes(*(void **)(a1 + 48), 1)) != 0)
                                                                                                                              {
LABEL_507:
                                                                                                                                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200025;
                                                                                                                                v204 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                if (os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
                                                                                                                                {
                                                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                                                  *(void *)&uint8_t buf[4] = 200025;
                                                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                                                  *(void *)&buf[14] = "SydneySetThreadScopePredicateFilter";
                                                                                                                                  _os_log_impl(&dword_1A7EFF000, v204, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                }

                                                                                                                                id v205 = *(id *)(a1 + 48);
                                                                                                                                BOOL v206 = sqlite3_exec((sqlite3 *)[v205 sqlDB], "ALTER TABLE message_global_data ADD COLUMN follow_up_jsonstringformodelevaluationforsuggestions TEXT COLLATE BINARY;CREATE INDEX IF NOT EXISTS message_global_data_follow_up_jsonstringformodelevaluationforsuggestions_index ON message_global_data(follow_up_jsonstringformodelevaluationforsuggestions);", 0, 0, 0) == 0;

                                                                                                                                *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v206;
                                                                                                                                if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                {
LABEL_510:
                                                                                                                                  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200026;
                                                                                                                                  v207 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                  if (os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
                                                                                                                                  {
                                                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                                                    *(void *)&uint8_t buf[4] = 200026;
                                                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                                                    *(void *)&buf[14] = "SydneyAddFollowUpJsonStringForModelEvaluationForSuggestionsColumnUpgradeStep";
                                                                                                                                    _os_log_impl(&dword_1A7EFF000, v207, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                  }

                                                                                                                                  v208 = (void *)MEMORY[0x1E4F60A78];
                                                                                                                                  v209 = [MEMORY[0x1E4F60410] baseMailDirectory];
                                                                                                                                  v210 = [v208 attachmentDirectoryURLWithBasePath:v209];

                                                                                                                                  v211 = [[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep alloc] initWithBaseAttachmentsDirectory:v210];
                                                                                                                                  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [(MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep *)v211 performMigrationStep];
                                                                                                                                  BOOL v212 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 0;

                                                                                                                                  if (!v212)
                                                                                                                                  {
LABEL_513:
                                                                                                                                    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200027;
                                                                                                                                    v213 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                    if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
                                                                                                                                    {
                                                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                                                      *(void *)&uint8_t buf[4] = 200027;
                                                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                                                      *(void *)&buf[14] = "SydneyMarkAttachmentsAsClassBProtected";
                                                                                                                                      _os_log_impl(&dword_1A7EFF000, v213, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                    }

LABEL_516:
                                                                                                                                    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 200028;
                                                                                                                                    v214 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                    if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
                                                                                                                                    {
                                                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                                                      *(void *)&uint8_t buf[4] = 200028;
                                                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                                                      *(void *)&buf[14] = "SydneyAddDownloadStateToMessageGlobalDataUpgradeStep";
                                                                                                                                      _os_log_impl(&dword_1A7EFF000, v214, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                    }

                                                                                                                                    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60BE0] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                    _HandleSQLiteError(v4, @"Removing send later and read later tables");
                                                                                                                                    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                    {
LABEL_519:
                                                                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 210001;
                                                                                                                                      v215 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                      if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
                                                                                                                                      {
                                                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                                                        *(void *)&uint8_t buf[4] = 210001;
                                                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                                                        *(void *)&buf[14] = "DawnDropReadAndSendLaterTables";
                                                                                                                                        _os_log_impl(&dword_1A7EFF000, v215, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                      }

                                                                                                                                      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F609D8] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                      _HandleSQLiteError(v4, @"Adding download state to message_global_data");
                                                                                                                                      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                      {
LABEL_522:
                                                                                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 210002;
                                                                                                                                        v216 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                        if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT))
                                                                                                                                        {
                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                          *(void *)&uint8_t buf[4] = 210002;
                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                          *(void *)&buf[14] = "DawnAddDownloadStateToMessageGlobalDataUpgradeStep";
                                                                                                                                          _os_log_impl(&dword_1A7EFF000, v216, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                        }

LABEL_525:
                                                                                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 210003;
                                                                                                                                        v217 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                        if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
                                                                                                                                        {
                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                          *(void *)&uint8_t buf[4] = 210003;
                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                          *(void *)&buf[14] = "DawnEncryptedMailAddressMetadataUpgradeStep";
                                                                                                                                          _os_log_impl(&dword_1A7EFF000, v217, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                        }

                                                                                                                                        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F609F0] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                        _HandleSQLiteError(v4, @"Adding download state to message_global_data");
                                                                                                                                        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                        {
LABEL_528:
                                                                                                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 210004;
                                                                                                                                          v218 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                          if (os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT))
                                                                                                                                          {
                                                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                                                            *(void *)&uint8_t buf[4] = 210004;
                                                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                                                            *(void *)&buf[14] = "DawnMailboxDatabaseIDInActionsUpgradeStep";
                                                                                                                                            _os_log_impl(&dword_1A7EFF000, v218, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                          }

                                                                                                                                          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60AE0] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                          _HandleSQLiteError(v4, @"Removing messages_read_index");
                                                                                                                                          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                          {
LABEL_531:
                                                                                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 210005;
                                                                                                                                            v219 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                            if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
                                                                                                                                            {
                                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                                              *(void *)&uint8_t buf[4] = 210005;
                                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                                              *(void *)&buf[14] = "DawnDropMessagesReadIndexUpgradeStep";
                                                                                                                                              _os_log_impl(&dword_1A7EFF000, v219, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                            }

                                                                                                                                            if (v5 <= 210000 || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60C98] runWithConnection:*(void *)(a1 + 48)] == 0, _HandleSQLiteError(v4, @"Truncate mailboxes to 10K messages"), *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)))
                                                                                                                                            {
LABEL_535:
                                                                                                                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 210006;
                                                                                                                                              v220 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                              if (os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT))
                                                                                                                                              {
                                                                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                                                                *(void *)&uint8_t buf[4] = 210006;
                                                                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                                                                *(void *)&buf[14] = "DawnCheckMailboxSize";
                                                                                                                                                _os_log_impl(&dword_1A7EFF000, v220, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                              }

                                                                                                                                              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddMessagesGlobalMessageIDUnreadUndeletedIndex(*(void **)(a1 + 48));
                                                                                                                                              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                              {
LABEL_538:
                                                                                                                                                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 212001;
                                                                                                                                                v221 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                {
                                                                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                                                                  *(void *)&uint8_t buf[4] = 212001;
                                                                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                                                                  *(void *)&buf[14] = "DawnCAddUnreadCountIndex";
                                                                                                                                                  _os_log_impl(&dword_1A7EFF000, v221, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                }

                                                                                                                                                *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = _AddFilterPredicateToInboxThreadScopes(*(void **)(a1 + 48), 2);
                                                                                                                                                if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                {
LABEL_541:
                                                                                                                                                  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 214001;
                                                                                                                                                  v222 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                  if (os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                  {
                                                                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                                                                    *(void *)&uint8_t buf[4] = 214001;
                                                                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                                                                    *(void *)&buf[14] = "DawnEUpdateThreadScopesForRemindMeEverywhere";
                                                                                                                                                    _os_log_impl(&dword_1A7EFF000, v222, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                  }

LABEL_544:
                                                                                                                                                  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220001;
                                                                                                                                                  v223 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                  if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                  {
                                                                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                                                                    *(void *)&uint8_t buf[4] = 220001;
                                                                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                                                                    *(void *)&buf[14] = "CrystalAddMessagesValidationStateUpgradeStep";
                                                                                                                                                    _os_log_impl(&dword_1A7EFF000, v223, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                  }

                                                                                                                                                  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A20] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                                  _HandleSQLiteError(v4, @"Adding validation state to message_global_data table");
                                                                                                                                                  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                  {
LABEL_547:
                                                                                                                                                    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220002;
                                                                                                                                                    v224 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                    if (os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                    {
                                                                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                                                                      *(void *)&uint8_t buf[4] = 220002;
                                                                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                                                                      *(void *)&buf[14] = "CrystalAddMessagesValidationStateToMessageGlobalDataUpgradeStep";
                                                                                                                                                      _os_log_impl(&dword_1A7EFF000, v224, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                    }

                                                                                                                                                    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60B38] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                                    _HandleSQLiteError(v4, @"Adding category column to messages_global_data");
                                                                                                                                                    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                    {
                                                                                                                                                      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60A58] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                                      _HandleSQLiteError(v4, @"Adding category column to senders table");
                                                                                                                                                      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                      {
LABEL_551:
                                                                                                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220003;
                                                                                                                                                        v225 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                        if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                        {
                                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                                          *(void *)&uint8_t buf[4] = 220003;
                                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                                          *(void *)&buf[14] = "CrystalAddBlackPearlCategoryColumnsUpgradeStep";
                                                                                                                                                          _os_log_impl(&dword_1A7EFF000, v225, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                        }

LABEL_554:
                                                                                                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220004;
                                                                                                                                                        v226 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                        if (os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                        {
                                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                                          *(void *)&uint8_t buf[4] = 220004;
                                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                                          *(void *)&buf[14] = "CrystalAddBusinessesTableUpgradeStep";
                                                                                                                                                          _os_log_impl(&dword_1A7EFF000, v226, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                        }

LABEL_557:
                                                                                                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220005;
                                                                                                                                                        v227 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                        if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                        {
                                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                                          *(void *)&uint8_t buf[4] = 220005;
                                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                                          *(void *)&buf[14] = "CrystalAddDomainAndBusinessColumnsUpgradeStep";
                                                                                                                                                          _os_log_impl(&dword_1A7EFF000, v227, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                        }

                                                                                                                                                        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F609C0] runWithConnection:*(void *)(a1 + 48) databaseName:@"protected" updateProtectedSchema:_protectedIndexHasBeenInitialized(*(void **)(a1 + 48))] == 0;
                                                                                                                                                        _HandleSQLiteError(v4, @"Creating new business schema");
                                                                                                                                                        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                        {
LABEL_560:
                                                                                                                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220007;
                                                                                                                                                          v228 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                          if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                          {
                                                                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                                                                            *(void *)&uint8_t buf[4] = 220007;
                                                                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                                                                            *(void *)&buf[14] = "CrystalAddNewBusinessesSchemaUpgradeStep";
                                                                                                                                                            _os_log_impl(&dword_1A7EFF000, v228, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                          }

                                                                                                                                                          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60B60] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                                          _HandleSQLiteError(v4, @"Update category columns in messages_global_data");
                                                                                                                                                          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                          {
LABEL_563:
                                                                                                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220008;
                                                                                                                                                            v229 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                            if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                            {
                                                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                                                              *(void *)&uint8_t buf[4] = 220008;
                                                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                                                              *(void *)&buf[14] = "CrystalMigrateCategoryTypeUpgradeStep";
                                                                                                                                                              _os_log_impl(&dword_1A7EFF000, v229, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                            }

LABEL_566:
                                                                                                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220009;
                                                                                                                                                            v230 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                            if (os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                            {
                                                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                                                              *(void *)&uint8_t buf[4] = 220009;
                                                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                                                              *(void *)&buf[14] = "CrystalPopulateBusinessSchema";
                                                                                                                                                              _os_log_impl(&dword_1A7EFF000, v230, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                            }

                                                                                                                                                            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60AB8] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                                            _HandleSQLiteError(v4, @"Clean model version column in messages_global_data");
                                                                                                                                                            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                            {
LABEL_569:
                                                                                                                                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220010;
                                                                                                                                                              v231 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                              if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                              {
                                                                                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                                                                                *(void *)&uint8_t buf[4] = 220010;
                                                                                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                *(void *)&buf[14] = "CrystalCleanModelVersionColumnUpgradeStep";
                                                                                                                                                                _os_log_impl(&dword_1A7EFF000, v231, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                              }

                                                                                                                                                              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F609E0] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                                              _HandleSQLiteError(v4, @"Add frecency and server_metadata to mailboxes");
                                                                                                                                                              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                              {
LABEL_572:
                                                                                                                                                                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220011;
                                                                                                                                                                v232 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                {
                                                                                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                                                                                  *(void *)&uint8_t buf[4] = 220011;
                                                                                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                  *(void *)&buf[14] = "CrystalFrecencyAndServerMetadata";
                                                                                                                                                                  _os_log_impl(&dword_1A7EFF000, v232, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                }

                                                                                                                                                                *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60B68] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                                                _HandleSQLiteError(v4, @"Add frecency and server_metadata to mailboxes");
                                                                                                                                                                if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                                {
LABEL_575:
                                                                                                                                                                  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220012;
                                                                                                                                                                  v233 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                  if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                  {
                                                                                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                                                                                    *(void *)&uint8_t buf[4] = 220012;
                                                                                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                    *(void *)&buf[14] = "CrystalMigratedServerMetadataFromPList";
                                                                                                                                                                    _os_log_impl(&dword_1A7EFF000, v233, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                  }

                                                                                                                                                                  [*(id *)(a1 + 40) noteNeedsSpotlightReindex];
                                                                                                                                                                  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
LABEL_578:
                                                                                                                                                                  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220013;
                                                                                                                                                                  v234 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                  if (os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                  {
                                                                                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                                                                                    *(void *)&uint8_t buf[4] = 220013;
                                                                                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                    *(void *)&buf[14] = "CrystalSemanticSearchReindexStep";
                                                                                                                                                                    _os_log_impl(&dword_1A7EFF000, v234, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                  }

                                                                                                                                                                  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F60CA0] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                                                  _HandleSQLiteError(v4, @"Failed to update category type for messages categorized as others");
                                                                                                                                                                  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                                  {
LABEL_581:
                                                                                                                                                                    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220014;
                                                                                                                                                                    v235 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                    if (os_log_type_enabled(v235, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                    {
                                                                                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                                                                                      *(void *)&uint8_t buf[4] = 220014;
                                                                                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                      *(void *)&buf[14] = "CrystalUpdateOthersCategoryUpgradeStep";
                                                                                                                                                                      _os_log_impl(&dword_1A7EFF000, v235, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                    }

                                                                                                                                                                    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F609E8] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                                                    _HandleSQLiteError(v4, @"Failed generated summary upgrade step");
                                                                                                                                                                    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                                    {
LABEL_584:
                                                                                                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220015;
                                                                                                                                                                      v236 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                      if (os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                      {
                                                                                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                                                                                        *(void *)&uint8_t buf[4] = 220015;
                                                                                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                        *(void *)&buf[14] = "CrystalAddGeneratedSummaryUpgradeStep";
                                                                                                                                                                        _os_log_impl(&dword_1A7EFF000, v236, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                      }

LABEL_587:
                                                                                                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220016;
                                                                                                                                                                      v237 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                      if (os_log_type_enabled(v237, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                      {
                                                                                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                                                                                        *(void *)&uint8_t buf[4] = 220016;
                                                                                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                        *(void *)&buf[14] = "CrystalAddAddressesColumnBusinessCategories";
                                                                                                                                                                        _os_log_impl(&dword_1A7EFF000, v237, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                      }

                                                                                                                                                                      if (v5 <= 220004 || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F609B0] runWithConnection:*(void *)(a1 + 48)] == 0, _HandleSQLiteError(v4, @"Failed to populate address column to business_categories"), *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)))
                                                                                                                                                                      {
LABEL_591:
                                                                                                                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220017;
                                                                                                                                                                        v238 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                        if (os_log_type_enabled(v238, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                        {
                                                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                                                          *(void *)&uint8_t buf[4] = 220017;
                                                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                          *(void *)&buf[14] = "CrystalPopulateBusinessCategoriesTable";
                                                                                                                                                                          _os_log_impl(&dword_1A7EFF000, v238, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                        }

                                                                                                                                                                        id v239 = *(id *)(a1 + 48);
                                                                                                                                                                        BOOL v240 = sqlite3_exec((sqlite3 *)[v239 sqlDB], "ALTER TABLE threads ADD COLUMN newest_message INTEGER REFERENCES messages(ROWID) ON DELETE SET NULL;CREATE INDEX IF NOT EXISTS threads_newest_message_index ON threads(newest_message);", 0, 0, 0) == 0;

                                                                                                                                                                        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v240;
                                                                                                                                                                        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                                        {
LABEL_594:
                                                                                                                                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220018;
                                                                                                                                                                          v241 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                          if (os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                          {
                                                                                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                                                                                            *(void *)&uint8_t buf[4] = 220018;
                                                                                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                            *(void *)&buf[14] = "CrystalAddThreadNewestMessageUpgradeStep";
                                                                                                                                                                            _os_log_impl(&dword_1A7EFF000, v241, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                          }

                                                                                                                                                                          [*(id *)(a1 + 40) noteNeedsSpotlightReindex];
                                                                                                                                                                          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
LABEL_597:
                                                                                                                                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220019;
                                                                                                                                                                          v242 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                          if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                          {
                                                                                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                                                                                            *(void *)&uint8_t buf[4] = 220019;
                                                                                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                            *(void *)&buf[14] = "CrystalRedonateToSpotlightWithGlobalMessageID";
                                                                                                                                                                            _os_log_impl(&dword_1A7EFF000, v242, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                          }

LABEL_600:
                                                                                                                                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220020;
                                                                                                                                                                          v243 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                          if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                          {
                                                                                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                                                                                            *(void *)&uint8_t buf[4] = 220020;
                                                                                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                            *(void *)&buf[14] = "CrystalChangeBusinessesToSmartGroupingUpgradeStep";
                                                                                                                                                                            _os_log_impl(&dword_1A7EFF000, v243, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                          }

                                                                                                                                                                          [*(id *)(a1 + 40) noteNeedsSpotlightReindex];
                                                                                                                                                                          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
LABEL_603:
                                                                                                                                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220021;
                                                                                                                                                                          v244 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                          if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                          {
                                                                                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                                                                                            *(void *)&uint8_t buf[4] = 220021;
                                                                                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                            *(void *)&buf[14] = "CrystalRedonateToSpotlightWithEncodedEntityInstanceIdentifier";
                                                                                                                                                                            _os_log_impl(&dword_1A7EFF000, v244, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                          }

                                                                                                                                                                          id v245 = *(id *)(a1 + 48);
                                                                                                                                                                          BOOL v246 = sqlite3_exec((sqlite3 *)[v245 sqlDB], "CREATE INDEX IF NOT EXISTS message_global_data_validation_state_equals_zero_index ON message_global_data(validation_state) WHERE validation_state = 0;", 0, 0, 0) == 0;

                                                                                                                                                                          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v246;
                                                                                                                                                                          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                                          {
LABEL_606:
                                                                                                                                                                            *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220022;
                                                                                                                                                                            v247 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                            if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                            {
                                                                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                                                                              *(void *)&uint8_t buf[4] = 220022;
                                                                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                              *(void *)&buf[14] = "CrystalAddMessageGlobalDataValidationStateIndexUpgradeStep";
                                                                                                                                                                              _os_log_impl(&dword_1A7EFF000, v247, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                            }

                                                                                                                                                                            if (v5 <= 219999) {
                                                                                                                                                                              goto LABEL_610;
                                                                                                                                                                            }
                                                                                                                                                                            uint64_t v248 = *(void *)(a1 + 48);
                                                                                                                                                                            id v271 = 0;
                                                                                                                                                                            char v249 = [MEMORY[0x1E4F60AF0] runWithConnection:v248 error:&v271];
                                                                                                                                                                            id v250 = v271;
                                                                                                                                                                            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v249;
                                                                                                                                                                            _HandleSQLiteError(v4, @"Failed to force recategorization");
                                                                                                                                                                            BOOL v251 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 0;

                                                                                                                                                                            if (!v251)
                                                                                                                                                                            {
LABEL_610:
                                                                                                                                                                              *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220023;
                                                                                                                                                                              v252 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                              if (os_log_type_enabled(v252, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                              {
                                                                                                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                                                                                                *(void *)&uint8_t buf[4] = 220023;
                                                                                                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                                *(void *)&buf[14] = "CrystalForceRecategorizationUpgradeStep";
                                                                                                                                                                                _os_log_impl(&dword_1A7EFF000, v252, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                              }

                                                                                                                                                                              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F609F8] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                                                              _HandleSQLiteError(v4, @"Add sync_info to mailboxes");
                                                                                                                                                                              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                                              {
LABEL_613:
                                                                                                                                                                                *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 220024;
                                                                                                                                                                                v253 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                                if (os_log_type_enabled(v253, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                                {
                                                                                                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                                                                                                  *(void *)&uint8_t buf[4] = 220024;
                                                                                                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                                  *(void *)&buf[14] = "CrystalAddMailboxSyncInfo";
                                                                                                                                                                                  _os_log_impl(&dword_1A7EFF000, v253, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                                }

                                                                                                                                                                                *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [MEMORY[0x1E4F609C8] runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                                                                _HandleSQLiteError(v4, @"Add categorization state");
                                                                                                                                                                                if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                                                {
LABEL_616:
                                                                                                                                                                                  *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 222001;
                                                                                                                                                                                  v254 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                                  if (os_log_type_enabled(v254, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                                  {
                                                                                                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                                                                                                    *(void *)&uint8_t buf[4] = 222001;
                                                                                                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                                    *(void *)&buf[14] = "CrystalCAddCategorizationState";
                                                                                                                                                                                    _os_log_impl(&dword_1A7EFF000, v254, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                                  }

                                                                                                                                                                                  if (v5 <= 220004 || !_protectedIndexHasBeenInitialized(*(void **)(a1 + 48)) || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryAddBrandIDColumnUpgradeStep runWithConnection:*(void *)(a1 + 48) databaseName:@"protected"] == 0, _HandleSQLiteError(v4, @"Failed to add brand_id column to businesses table"), *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)))
                                                                                                                                                                                  {
LABEL_621:
                                                                                                                                                                                    *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 222002;
                                                                                                                                                                                    v255 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                                    if (os_log_type_enabled(v255, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                                    {
                                                                                                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                                                                                                      *(void *)&uint8_t buf[4] = 222002;
                                                                                                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                                      *(void *)&buf[14] = "CrystalCAddBrandIDColumnUpgradeStep";
                                                                                                                                                                                      _os_log_impl(&dword_1A7EFF000, v255, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                                    }

                                                                                                                                                                                    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = +[MFAddLastModifiedColumnUpgradeStep runWithConnection:*(void *)(a1 + 48)] == 0;
                                                                                                                                                                                    _HandleSQLiteError(v4, @"Add last_modified column in business_addresses");
                                                                                                                                                                                    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                                                    {
LABEL_624:
                                                                                                                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 222003;
                                                                                                                                                                                      v256 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                                      if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                                      {
                                                                                                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                                                                                                        *(void *)&uint8_t buf[4] = 222003;
                                                                                                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                                        *(void *)&buf[14] = "CrystalCAddLastModifiedUpgradeStep";
                                                                                                                                                                                        _os_log_impl(&dword_1A7EFF000, v256, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                                      }

LABEL_627:
                                                                                                                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 222004;
                                                                                                                                                                                      v257 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                                      if (os_log_type_enabled(v257, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                                      {
                                                                                                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                                                                                                        *(void *)&uint8_t buf[4] = 222004;
                                                                                                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                                        *(void *)&buf[14] = "CrystalCAddBusinessColumnsAndCommonPrefixGroupingUpgradeStep";
                                                                                                                                                                                        _os_log_impl(&dword_1A7EFF000, v257, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                                      }

LABEL_630:
                                                                                                                                                                                      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 222005;
                                                                                                                                                                                      v258 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                                      if (os_log_type_enabled(v258, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                                      {
                                                                                                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                                                                                                        *(void *)&uint8_t buf[4] = 222005;
                                                                                                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                                        *(void *)&buf[14] = "CrystalCNullableBusinessAddressCommentColumnUpgradeStep";
                                                                                                                                                                                        _os_log_impl(&dword_1A7EFF000, v258, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                                      }

                                                                                                                                                                                      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 40) _runAddBusinessColumnsUpgradeStepForConnection:*(void *)(a1 + 48) db:v4];
                                                                                                                                                                                      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                                                      {
LABEL_633:
                                                                                                                                                                                        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 222006;
                                                                                                                                                                                        v259 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                                        if (os_log_type_enabled(v259, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                                        {
                                                                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                                                                          *(void *)&uint8_t buf[4] = 222006;
                                                                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                                          *(void *)&buf[14] = "CrystalCRedoBusinessGrouping";
                                                                                                                                                                                          _os_log_impl(&dword_1A7EFF000, v259, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                                        }

                                                                                                                                                                                        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 40) _runAddBusinessColumnsUpgradeStepForConnection:*(void *)(a1 + 48) db:v4];
                                                                                                                                                                                        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                                                                                                                                                        {
LABEL_636:
                                                                                                                                                                                          *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = 222007;
                                                                                                                                                                                          v260 = +[MFMailMessageLibraryMigrator log];
                                                                                                                                                                                          if (os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                                          {
                                                                                                                                                                                            *(_DWORD *)buf = 134217984;
                                                                                                                                                                                            *(void *)&uint8_t buf[4] = 222007;
                                                                                                                                                                                            _os_log_impl(&dword_1A7EFF000, v260, OS_LOG_TYPE_DEFAULT, "Migrated to current version %lu", buf, 0xCu);
                                                                                                                                                                                          }

                                                                                                                                                                                          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
                                                                                                                                                                                        }
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_642:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 40) _checkForeignKeysWithConnection:v3];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if ([*(id *)(a1 + 40) needsRebuildTriggers])
      {
        v261 = +[MFMailMessageLibraryMigrator log];
        if (os_log_type_enabled(v261, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7EFF000, v261, OS_LOG_TYPE_DEFAULT, "Rebuilding triggers", buf, 2u);
        }

        v262 = _SQLFromFile();
        char v263 = _ExecuteSQL(v4, v262, @"performing statements from file \"triggers.sql\"");

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v263;
      }
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && [*(id *)(a1 + 40) needsRebuildMessageInfoIndex])
  {
    v264 = +[MFMailMessageLibraryMigrator log];
    if (os_log_type_enabled(v264, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v264, OS_LOG_TYPE_DEFAULT, "Rebuilding Message Info Index", buf, 2u);
    }

    int v265 = sqlite3_exec(v4, "DROP INDEX IF EXISTS message_infos_index;\n"
             "CREATE INDEX message_infos_index ON messages(mailbox, deleted, journaled, sender_vip, flags, conversation_i"
             "d, date_sent, message_id, date_received DESC, ROWID DESC);",
             0,
             0,
             0);
    _HandleSQLiteError(v4, @"updating message_infos_index covering index");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v265 == 0;
  }
  int v266 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    BOOL v267 = v5 == 222007;
  }
  else {
    BOOL v267 = 1;
  }
  if (!v267)
  {
    v268 = +[MFMailMessageLibraryMigrator log];
    if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v268, OS_LOG_TYPE_DEFAULT, "Updating library version", buf, 2u);
    }

    *(void *)buf = 0;
    if (sqlite3_prepare_v2(v4, "INSERT OR REPLACE INTO properties (key, value) values ('version', ?)", -1, (sqlite3_stmt **)buf, 0))
    {
      _HandleSQLiteError(v4, @"preparing library version insert statement");
    }
    else
    {
      sqlite3_bind_int(*(sqlite3_stmt **)buf, 1, 222007);
      sqlite3_step(*(sqlite3_stmt **)buf);
      _HandleSQLiteError(v4, @"setting library version");
      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }
    int v266 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  BOOL v269 = v266 != 0;

  return v269;
}

uint64_t __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_101(uint64_t a1, uint64_t a2)
{
  return +[MFMailMessageLibraryAdoptSharedSchemaMigrationStep cleanUpAfterMigrationWithConnection:a2];
}

- (BOOL)_runAddBusinessColumnsUpgradeStepForConnection:(id)a3 db:(sqlite3 *)a4
{
  id v5 = a3;
  uint64_t HasBeenInitialized = _protectedIndexHasBeenInitialized(v5);
  char v7 = [MEMORY[0x1E4F609B8] runWithConnection:v5 protectedIndexInitialized:HasBeenInitialized protectedDatabaseName:@"protected"];
  _HandleSQLiteError(a4, @"Add business columns businesses.localized_brand_name, business_addresses.last_bcs_sync");
  if (HasBeenInitialized)
  {
    id v17 = 0;
    char v7 = [MEMORY[0x1E4F60A98] runWithConnection:v5 error:&v17];
    id v8 = v17;
    if ((v7 & 1) == 0)
    {
      id v9 = +[MFMailMessageLibraryMigrator log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MFMailMessageLibraryMigrator _runAddBusinessColumnsUpgradeStepForConnection:db:]((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }

  return v7;
}

- (int64_t)_checkContentProtectionState
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v3 = [(MFMailMessageLibraryMigrator *)self contentProtectionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MFMailMessageLibraryMigrator__checkContentProtectionState__block_invoke;
  block[3] = &unk_1E5D3F590;
  block[4] = &v11;
  dispatch_sync(v3, block);

  if (*((unsigned char *)v12 + 24))
  {
    int64_t v4 = 2;
  }
  else
  {
    id v5 = [(MFMailMessageLibraryMigrator *)self migrationState];
    [v5 lock];

    uint64_t v6 = [(MFMailMessageLibraryMigrator *)self migrationState];
    [v6 unlockWithCondition:1];

    char v7 = +[MFMailMessageLibraryMigrator log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Protected Index unavailable", v9, 2u);
    }

    int64_t v4 = 1;
  }
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t __60__MFMailMessageLibraryMigrator__checkContentProtectionState__block_invoke(uint64_t a1)
{
  uint64_t result = EFProtectedDataAvailable();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)_checkForeignKeysWithConnection:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int64_t v4 = [v3 preparedStatementForQueryString:@"PRAGMA foreign_key_check"];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v5 = +[MFMailMessageLibraryMigrator log];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  uint64_t v15 = __64__MFMailMessageLibraryMigrator__checkForeignKeysWithConnection___block_invoke;
  uint64_t v16 = &unk_1E5D3F5B8;
  id v19 = &v21;
  id v6 = v4;
  id v17 = v6;
  v20 = &v25;
  id v7 = v3;
  id v18 = v7;
  id v8 = v5;
  id v9 = v14;
  uint64_t v10 = mach_absolute_time();
  v15((uint64_t)v9);
  uint64_t v11 = mach_absolute_time();
  if (EFGetElapsedTimeSinceAbsoluteTime_onceToken_0 != -1) {
    dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken_0, &__block_literal_global_542);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v30 = @"PRAGMA foreign_key_check";
    __int16 v31 = 2048;
    double v32 = (double)((v11 - v10)
                 * EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo_0
                 / *(unsigned int *)algn_1E9767334)
        / 1000000000.0;
    _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "%@ : took %fs", buf, 0x16u);
  }

  if (*((unsigned char *)v22 + 24)) {
    BOOL v12 = v26[3] == 0;
  }
  else {
    BOOL v12 = 0;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __64__MFMailMessageLibraryMigrator__checkForeignKeysWithConnection___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v5 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__MFMailMessageLibraryMigrator__checkForeignKeysWithConnection___block_invoke_2;
  v6[3] = &unk_1E5D3C7E8;
  v6[4] = *(void *)(a1 + 56);
  char v3 = [v2 executeUsingBlock:v6 error:&v5];
  id v4 = v5;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 40) handleError:v4 message:@"Checking foreign keys"];
  }
}

void __64__MFMailMessageLibraryMigrator__checkForeignKeysWithConnection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  *a4 = ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > 9;
  id v7 = +[MFMailMessageLibraryMigrator log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = [v6 objectAtIndexedSubscript:1];
    uint64_t v9 = [v8 int64Value];
    uint64_t v10 = [v6 objectAtIndexedSubscript:0];
    uint64_t v11 = [v10 stringValue];
    BOOL v12 = [v6 objectAtIndexedSubscript:2];
    uint64_t v13 = [v12 stringValue];
    int v14 = 134218498;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    id v17 = v11;
    __int16 v18 = 2114;
    id v19 = v13;
    _os_log_error_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_ERROR, "Foreign key violation on row %lld of table %{public}@ with reference to table %{public}@", (uint8_t *)&v14, 0x20u);
  }
}

- (void)noteNeedsRebuildTriggers
{
  self->_needsRebuildTriggers = 1;
}

- (BOOL)needsRebuildTriggers
{
  return self->_needsRebuildTriggers;
}

- (void)noteRebuildMessageInfoIndex
{
  self->_needsRebuildMessageInfoIndex = 1;
}

- (BOOL)needsRebuildMessageInfoIndex
{
  return self->_needsRebuildMessageInfoIndex;
}

- (void)resetTTRPromptAndForceReindex
{
  MFMobileMailPreferenceDomain();
  MFMobileMailContainerPath();
  _CFPreferencesSetValueWithContainer();
  _CFPreferencesSetValueWithContainer();
  [(MFMailMessageLibraryMigrator *)self noteNeedsSpotlightReindex];
}

- (void)noteNeedsSpotlightReindex
{
  self->_needsSpotlightReindex = 1;
}

- (BOOL)needsSpotlightReindex
{
  return self->_needsSpotlightReindex;
}

- (void)addPostMigrationBlock:(id)a3
{
  postMigrationBlocks = self->_postMigrationBlocks;
  id v4 = _Block_copy(a3);
  -[NSMutableArray addObject:](postMigrationBlocks, "addObject:");
}

- (void)runPostMigrationBlocksWithConnection:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(NSMutableArray *)self->_postMigrationBlocks copy];
  [(NSMutableArray *)self->_postMigrationBlocks removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int64_t)attachProtectedDatabaseWithConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMailMessageLibraryMigrator *)self delegate];
  id v20 = 0;
  char v6 = [v5 mailMessageLibraryMigrator:self attachProtectedDatabaseWithName:@"protected" connection:v4 error:&v20];
  id v7 = v20;

  if (v6)
  {
    int64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = +[MFMailMessageLibraryMigrator log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MFMailMessageLibraryMigrator attachProtectedDatabaseWithConnection:]((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
    }

    __int16 v16 = [v7 domain];
    char v17 = [v16 isEqualToString:*MEMORY[0x1E4F60D10]];

    if (v17)
    {
      unint64_t v18 = [v7 code];
      int64_t v8 = 2;
      if (v18 <= 0x17 && ((1 << v18) & 0x804400) != 0) {
        int64_t v8 = [(MFMailMessageLibraryMigrator *)self _checkContentProtectionState];
      }
    }
    else
    {
      int64_t v8 = 2;
    }
  }

  return v8;
}

- (void)detachProtectedDatabaseWithConnection:(id)a3
{
  id v5 = a3;
  id v4 = [(MFMailMessageLibraryMigrator *)self delegate];
  [v4 mailMessageLibraryMigrator:self detachProtectedDatabaseWithConnection:v5];
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  id v5 = [(MFMailMessageLibraryMigrator *)self contentProtectionQueue];
  dispatch_assert_queue_V2(v5);

  if (EFProtectedDataAvailable())
  {
    char v6 = +[MFMailMessageLibraryMigrator log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Protected Index became available", v9, 2u);
    }

    id v7 = [(MFMailMessageLibraryMigrator *)self migrationState];
    [v7 lock];

    int64_t v8 = [(MFMailMessageLibraryMigrator *)self migrationState];
    [v8 unlockWithCondition:0];
  }
}

- (MFMailMessageLibraryMigratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFMailMessageLibraryMigratorDelegate *)WeakRetained;
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (NSConditionLock)migrationState
{
  return self->_migrationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationState, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_postMigrationBlocks, 0);
}

- (void)migrateWithDatabaseConnection:(os_log_t)log schema:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Error: invalid connection", v1, 2u);
}

- (void)migrateWithDatabaseConnection:(os_log_t)log schema:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_FAULT, "Failed migration", v1, 2u);
}

- (void)migrateWithDatabaseConnection:(os_log_t)log schema:.cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Error initializing database parameters: %{public}@", buf, 0xCu);
}

void __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_2_cold_1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 2048;
  uint64_t v4 = 222007;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Error: Downgrading from version %d to version %ld is not supported", (uint8_t *)v2, 0x12u);
}

void __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_2_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Error: Migration is not supported for version %d", (uint8_t *)v2, 8u);
}

- (void)_runAddBusinessColumnsUpgradeStepForConnection:(uint64_t)a3 db:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)attachProtectedDatabaseWithConnection:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end