@interface BRCDataOrDocsScopeGatherer
- (BRCDataOrDocsScopeGatherer)initWithNotificationPipe:(id)a3 appLibraries:(id)a4 startingRank:(unint64_t)a5 maxRank:(unint64_t)a6 withDeadItems:(BOOL)a7 gatherReply:(id)a8;
- (BRCItemGlobalID)gatheredChildrenItemGlobalID;
- (id)_popGatherReply;
- (void)dealloc;
- (void)done;
- (void)gatherWithBatchSize:(int64_t)a3 completion:(id)a4;
- (void)invalidate;
- (void)setGatheredChildrenItemGlobalID:(id)a3;
@end

@implementation BRCDataOrDocsScopeGatherer

- (BRCDataOrDocsScopeGatherer)initWithNotificationPipe:(id)a3 appLibraries:(id)a4 startingRank:(unint64_t)a5 maxRank:(unint64_t)a6 withDeadItems:(BOOL)a7 gatherReply:(id)a8
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v14 = (id *)a3;
  id v15 = a4;
  id v16 = a8;
  v39.receiver = self;
  v39.super_class = (Class)BRCDataOrDocsScopeGatherer;
  v17 = [(BRCDataOrDocsScopeGatherer *)&v39 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_pipe, v14);
    v19 = [v14 queue];
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    v35 = __115__BRCDataOrDocsScopeGatherer_initWithNotificationPipe_appLibraries_startingRank_maxRank_withDeadItems_gatherReply___block_invoke;
    v36 = &unk_265080B38;
    id v20 = v19;
    id v37 = v20;
    id v38 = v16;
    uint64_t v21 = MEMORY[0x2455D9A50](&v33);
    id gatherReply = v18->_gatherReply;
    v18->_id gatherReply = (id)v21;

    v23 = objc_msgSend(v14, "manager", v33, v34, v35, v36);
    uint64_t v24 = [v23 session];
    session = v18->_session;
    v18->_session = (BRCAccountSessionFPFS *)v24;

    v18->_gatheringRankMin = a5;
    v18->_gatheringRankMax = a6;
    uint64_t v26 = [v15 mutableCopy];
    gatheringAppLibraries = v18->_gatheringAppLibraries;
    v18->_gatheringAppLibraries = (NSMutableArray *)v26;

    objc_storeStrong((id *)&v18->_gatheringNamePrefix, v14[18]);
    v18->_includesDeadItems = a7;
    v18->_invalidated = 0;
    v28 = brc_bread_crumbs();
    v29 = brc_notifications_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v41 = v14;
      __int16 v42 = 2048;
      unint64_t v43 = a5;
      __int16 v44 = 2048;
      unint64_t v45 = a6;
      __int16 v46 = 2112;
      v47 = v28;
      _os_log_debug_impl(&dword_23FA42000, v29, OS_LOG_TYPE_DEBUG, "[NOTIF] %@: gathering from %lld to %lld%@", buf, 0x2Au);
    }

    if (v18->_gatheringNamePrefix)
    {
      v30 = brc_bread_crumbs();
      v31 = brc_notifications_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[BRCDataOrDocsScopeGatherer initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:]();
      }
    }
  }

  return v18;
}

void __115__BRCDataOrDocsScopeGatherer_initWithNotificationPipe_appLibraries_startingRank_maxRank_withDeadItems_gatherReply___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  objc_msgSend(v4, "brc_wrappedError");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

- (void)gatherWithBatchSize:(int64_t)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v25 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipe);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v24 = (void *)a3;
    v8 = [WeakRetained manager];
    uint64_t v26 = [v8 session];

    v9 = [v26 readOnlyDB];
    objc_initWeak(&location, self);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke;
    v34[3] = &unk_265080B60;
    objc_copyWeak(&v36, &location);
    id v10 = v25;
    id v35 = v10;
    v11 = (void *)MEMORY[0x2455D9A50](v34);
    v12 = [v9 serialQueue];
    if (v12)
    {
      v13 = [v26 personaIdentifier];
      if (v13)
      {
        v14 = [v26 personaIdentifier];
        id v15 = [MEMORY[0x263F841B0] sharedManager];
        id v16 = objc_msgSend(v15, "br_currentPersonaID");
        char v17 = [v14 isEqualToString:v16];

        if ((v17 & 1) == 0) {
          goto LABEL_5;
        }
      }
      else
      {
      }
      v22 = [v9 serialQueue];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2;
      v27[3] = &unk_265080BB0;
      objc_copyWeak(v31, &location);
      v31[1] = v24;
      id v29 = v11;
      v28 = v9;
      id v30 = v10;
      id v23 = v11;
      dispatch_async(v22, v27);

      objc_destroyWeak(v31);
LABEL_12:

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
      goto LABEL_13;
    }
LABEL_5:
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v39 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't gather anymore because the personaID is incorrect or db has no serial queue%@", buf, 0xCu);
    }

    id v20 = [v7 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_14;
    block[3] = &unk_265080B88;
    id v33 = v11;
    id v21 = v11;
    dispatch_async(v20, block);

    goto LABEL_12;
  }
  uint64_t v26 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v39 = v26;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Notification pipe got deallocated. Nothing to do%@", buf, 0xCu);
  }
LABEL_13:
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v3 = brc_bread_crumbs();
    id v4 = brc_notifications_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_cold_1();
    }
  }
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v65 = (uint64_t)objc_loadWeakRetained(WeakRetained + 1);
    if (v65)
    {
      unint64_t v63 = *(void *)(a1 + 64);
      if ((v63 & 0x8000000000000000) != 0)
      {
        v55 = brc_bread_crumbs();
        v56 = brc_default_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
          __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_6();
        }
      }
      if ([v2[3] count])
      {
        v66 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v63];
        v62 = [v2[3] lastObject];
        if (!v62)
        {
          v57 = brc_bread_crumbs();
          v58 = brc_default_log();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT)) {
            __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_5();
          }
        }
        v3 = (char *)v2[6];
        if (v3 + 1 > v2[4]) {
          id v4 = v3 + 1;
        }
        else {
          id v4 = v2[4];
        }
        memset(v77, 0, sizeof(v77));
        __brc_create_section(0, (uint64_t)"-[BRCDataOrDocsScopeGatherer gatherWithBatchSize:completion:]_block_invoke", 200, v77);
        uint64_t v5 = brc_bread_crumbs();
        id v6 = brc_notifications_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v47 = v77[0];
          uint64_t v48 = [v62 logName];
          v49 = BRCPrettyPrintBitmap();
          *(_DWORD *)buf = 134219266;
          uint64_t v83 = v47;
          __int16 v84 = 2048;
          unint64_t v85 = (unint64_t)v4;
          __int16 v86 = 2112;
          v87 = v48;
          __int16 v88 = 2048;
          unint64_t v89 = v63;
          __int16 v90 = 2112;
          v91 = v49;
          __int16 v92 = 2112;
          v93 = v5;
          _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx Looking for item with ranks >= %lld in %@ (%ld kind %@)%@", buf, 0x3Eu);
        }
        unsigned int v7 = *(_DWORD *)(v65 + 136);
        if (v7)
        {
          v8 = v2[10];
          if (!v8)
          {
            v11 = 0;
            v61 = 0;
            int v21 = 1;
            goto LABEL_35;
          }
          if ((*(_WORD *)(v65 + 140) & 2) != 0)
          {
            id v46 = [v62 itemsEnumeratorChildOf:v2[10] withDeadItems:*((unsigned __int8 *)v2 + 72) rankMin:v4 rankMax:v2[5] count:v63 db:*(void *)(a1 + 32)];
            if (!v46)
            {
              v50 = brc_bread_crumbs();
              v51 = brc_default_log();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
                __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_3();
              }

              v52 = [(id)v65 queue];
              v75[0] = MEMORY[0x263EF8330];
              v75[1] = 3221225472;
              v75[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_18;
              v75[3] = &unk_265080B88;
              id v76 = *(id *)(a1 + 40);
              dispatch_async(v52, v75);

              id v22 = 0;
              v61 = 0;
              goto LABEL_74;
            }
            v11 = v46;
            int v60 = 0;
            v61 = v46;
LABEL_36:

            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            id v22 = v11;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v70 objects:v80 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v71;
              do
              {
                uint64_t v25 = 0;
                do
                {
                  if (*(void *)v71 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v26 = *(void **)(*((void *)&v70 + 1) + 8 * v25);
                  v27 = (void *)MEMORY[0x2455D97F0]();
                  v2[6] = (id)[v26 notifsRank];
                  if (![v26 isZoneRoot])
                  {
                    id v30 = +[BRCNotification notificationGatheredFromItem:v26];
                    v28 = v30;
                    if (*((unsigned char *)v2 + 72) || ![v30 isDead])
                    {
                      [v66 addObject:v28];
                      id v29 = brc_bread_crumbs();
                      v31 = brc_notifications_log();
                      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412802;
                        uint64_t v83 = (uint64_t)v2;
                        __int16 v84 = 2112;
                        unint64_t v85 = (unint64_t)v28;
                        __int16 v86 = 2112;
                        v87 = v29;
                        v32 = v31;
                        id v33 = "[NOTIF] %@: queued gathered notification %@%@";
                        uint32_t v34 = 32;
LABEL_53:
                        _os_log_debug_impl(&dword_23FA42000, v32, OS_LOG_TYPE_DEBUG, v33, buf, v34);
                      }
                    }
                    else
                    {
                      id v29 = brc_bread_crumbs();
                      v31 = brc_notifications_log();
                      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        uint64_t v83 = (uint64_t)v28;
                        __int16 v84 = 2112;
                        unint64_t v85 = (unint64_t)v29;
                        v32 = v31;
                        id v33 = "[NOTIF] Ignoring dead update %@%@";
                        uint32_t v34 = 22;
                        goto LABEL_53;
                      }
                    }

                    goto LABEL_50;
                  }
                  v28 = brc_bread_crumbs();
                  id v29 = brc_notifications_log();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v83 = (uint64_t)v26;
                    __int16 v84 = 2112;
                    unint64_t v85 = (unint64_t)v28;
                    _os_log_debug_impl(&dword_23FA42000, v29, OS_LOG_TYPE_DEBUG, "[NOTIF] Ignoring zone root item %@%@", buf, 0x16u);
                  }
LABEL_50:

                  ++v25;
                }
                while (v23 != v25);
                uint64_t v35 = [v22 countByEnumeratingWithState:&v70 objects:v80 count:16];
                uint64_t v23 = v35;
              }
              while (v35);
            }

            if (v61) {
              char v36 = v60;
            }
            else {
              char v36 = 1;
            }
            if (v36)
            {
              if (v60)
              {
LABEL_60:
                [v2[3] removeLastObject];
                v2[6] = 0;
                char v37 = 1;
LABEL_63:
                if (![v66 count])
                {
                  if ((v37 & 1) == 0)
                  {
                    uint64_t v40 = brc_bread_crumbs();
                    v41 = brc_default_log();
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v42 = [v61 rowNumber];
                      *(_DWORD *)buf = 134218498;
                      uint64_t v83 = v42;
                      __int16 v84 = 2048;
                      unint64_t v85 = v63;
                      __int16 v86 = 2112;
                      v87 = v40;
                      _os_log_impl(&dword_23FA42000, v41, OS_LOG_TYPE_DEFAULT, "[WARNING] Strange... No updates received and phase isn't done %lu vs %ld%@", buf, 0x20u);
                    }
                  }
                  [v2 gatherWithBatchSize:v63 completion:*(void *)(a1 + 48)];
                  goto LABEL_75;
                }
                id v38 = [(id)v65 queue];
                objc_super v39 = v67;
                v67[0] = MEMORY[0x263EF8330];
                v67[1] = 3221225472;
                v67[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_24;
                v67[3] = &unk_26507F918;
                v67[4] = v66;
                id v68 = (id)v65;
                id v69 = *(id *)(a1 + 40);
                dispatch_async(v38, v67);

                goto LABEL_73;
              }
            }
            else if ([v61 rowNumber] < v63)
            {
              goto LABEL_60;
            }
            char v37 = 0;
            goto LABEL_63;
          }
          uint64_t v9 = [v2[8] itemByItemGlobalID:v8 db:*(void *)(a1 + 32)];
          id v10 = v9;
          if (v9)
          {
            uint64_t v81 = v9;
            v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v81 count:1];
            v61 = 0;
          }
          else
          {
            v61 = 0;
            v11 = (void *)MEMORY[0x263EFFA68];
          }
        }
        else
        {
          unsigned int v17 = (v7 >> 7) & 1;
          if ((v7 & 8) == 0) {
            unsigned int v17 = 0;
          }
          BOOL v18 = (v7 & 6) == 0 || (*(_DWORD *)(v65 + 136) & 8) != 0;
          if ((v7 & 6) != 0) {
            uint64_t v19 = v17;
          }
          else {
            uint64_t v19 = 0;
          }
          BYTE3(v59) = (*(_DWORD *)(v65 + 136) & 0x40) != 0;
          BYTE2(v59) = (*(_DWORD *)(v65 + 136) & 0x20) != 0;
          BYTE1(v59) = (*(_DWORD *)(v65 + 136) & 4) != 0;
          LOBYTE(v59) = (*(_DWORD *)(v65 + 136) & 2) != 0;
          objc_msgSend(v62, "itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:", v4, v2[5], v2[7], *((unsigned __int8 *)v2 + 72), v18, v19, v59, v63, *(void *)(a1 + 32));
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            unint64_t v43 = brc_bread_crumbs();
            __int16 v44 = brc_default_log();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
              __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_3();
            }

            unint64_t v45 = [(id)v65 queue];
            objc_super v39 = v74;
            v74[0] = MEMORY[0x263EF8330];
            v74[1] = 3221225472;
            v74[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_20;
            v74[3] = &unk_265080B88;
            v74[4] = *(id *)(a1 + 40);
            dispatch_async(v45, v74);

            id v22 = 0;
            v61 = 0;
LABEL_73:
            v8 = v39[4];
LABEL_74:

LABEL_75:
            __brc_leave_section(v77);

            v13 = v66;
            goto LABEL_76;
          }
          v11 = v20;
          v8 = brc_bread_crumbs();
          id v10 = brc_notifications_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            int v53 = *((unsigned __int8 *)v2 + 72);
            *(_DWORD *)buf = 134218498;
            if (v53) {
              v54 = "yes";
            }
            else {
              v54 = "no";
            }
            uint64_t v83 = (uint64_t)v11;
            __int16 v84 = 2080;
            unint64_t v85 = (unint64_t)v54;
            __int16 v86 = 2112;
            v87 = v8;
            _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[NOTIF] Creating enumertor %p including dead items: %s%@", buf, 0x20u);
          }
          v61 = v11;
        }

        int v21 = v7 & 1;
LABEL_35:
        int v60 = v21;
        goto LABEL_36;
      }
      id v15 = [(id)v65 queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_16;
      block[3] = &unk_26507F450;
      id v16 = *(id *)(a1 + 40);
      void block[4] = v2;
      id v79 = v16;
      dispatch_async(v15, block);

      v13 = v79;
    }
    else
    {
      v13 = brc_bread_crumbs();
      v14 = brc_notifications_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_2();
      }
    }
  }
  else
  {
    uint64_t v65 = brc_bread_crumbs();
    v12 = brc_notifications_log();
    v13 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_cold_1();
      v13 = v12;
    }
  }
LABEL_76:
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_16(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 done];
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_24(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x2455D97F0](v3);
        objc_msgSend(*(id *)(a1 + 40), "addNotification:asDead:", v7, 0, (void)v10);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_popGatherReply
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)MEMORY[0x2455D9A50](v2->_gatherReply);
  id gatherReply = v2->_gatherReply;
  v2->_id gatherReply = 0;

  uint64_t v5 = (void *)MEMORY[0x2455D9A50](v3);
  objc_sync_exit(v2);

  return v5;
}

- (void)done
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[NOTIF] %@: gather phase ends%@");
}

void __34__BRCDataOrDocsScopeGatherer_done__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __34__BRCDataOrDocsScopeGatherer_done__block_invoke_2;
  v2[3] = &unk_265080B88;
  os_log_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 addDequeueCallback:v2];
}

uint64_t __34__BRCDataOrDocsScopeGatherer_done__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] %@: EINTR: client gather phase was invalidated%@");
}

void __40__BRCDataOrDocsScopeGatherer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 4);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)dealloc
{
  [(BRCDataOrDocsScopeGatherer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BRCDataOrDocsScopeGatherer;
  [(BRCDataOrDocsScopeGatherer *)&v3 dealloc];
}

- (BRCItemGlobalID)gatheredChildrenItemGlobalID
{
  return self->_gatheredChildrenItemGlobalID;
}

- (void)setGatheredChildrenItemGlobalID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatheredChildrenItemGlobalID, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_gatheringNamePrefix, 0);
  objc_storeStrong((id *)&self->_gatheringAppLibraries, 0);
  objc_storeStrong(&self->_gatherReply, 0);
  objc_destroyWeak((id *)&self->_pipe);
}

- (void)initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:.cold.1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[NOTIF] matching prefix: %@%@", (void)v3, DWORD2(v3));
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[NOTIF] Self got deallocated. Nothing to do%@", v2, v3, v4, v5, v6);
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[NOTIF] Notification pipe got deallocated. Nothing to do%@", v2, v3, v4, v5, v6);
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: No gathered items enumerator - bailing out%@", v2, v3, v4, v5, v6);
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: appLibrary%@", v2, v3, v4, v5, v6);
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: count >= 0%@", v2, v3, v4, v5, v6);
}

@end