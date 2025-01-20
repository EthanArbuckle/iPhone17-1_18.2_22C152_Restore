@interface BRCSyncUpOperationBuilder
- (BOOL)_checkIfShouldDedicateOpToPCSChainingItem:(id)a3;
- (BOOL)_checkIfShouldDedicateOpToSaltingBasehashItem:(id)a3;
- (BOOL)_recoverItemIDChangedWhileUploadingIfNecessary:(id)a3;
- (BOOL)_validateSharedDocumentFieldsForRecord:(id)a3 item:(id)a4;
- (BOOL)checkIfSyncAllowedInSharedZoneForItem:(id)a3;
- (BRCAccountSessionFPFS)session;
- (BRCDirectoryItem)itemNeedingBasehashSalting;
- (BRCLocalItem)itemNeedingPCSChaining;
- (BRCSyncUpOperation)op;
- (BRCSyncUpOperationBuilder)init;
- (BRCUserDefaults)defaults;
- (NSData)rootChildBasehashSalt;
- (float)addDeletionOfAlias:(id)a3;
- (float)addDeletionOfDirectory:(id)a3;
- (float)addDeletionOfDocument:(id)a3;
- (float)addDeletionOfFinderBookmark:(id)a3;
- (float)addDeletionOfItem:(id)a3;
- (float)addDeletionOfRecordID:(id)a3 ckInfo:(id)a4;
- (float)addDeletionOfSharedTopLevelItem:(id)a3;
- (float)addEditOfDirectory:(id)a3;
- (float)addEditOfDocument:(id)a3;
- (float)addEditOfFinderBookmark:(id)a3;
- (float)addEditOfSharedTopLevelItem:(id)a3;
- (float)addEditOfSymlink:(id)a3;
- (float)addItem:(id)a3;
- (float)fakeSyncForItem:(id)a3 serverItem:(id)a4 inZone:(id)a5;
- (id)_generateChildBasehashSaltGetterBlock;
- (id)_generateSaltGetterBlock;
- (id)_getChildBasehashSaltForItem:(id)a3;
- (id)_getChildBasehashSaltForItemID:(id)a3;
- (id)_getSaltForItem:(id)a3;
- (unsigned)shouldPCSChainStatusForItem:(id)a3;
- (void)handleDeletionOfSharedItem:(id)a3;
- (void)handleEditOfSharedItem:(id)a3;
- (void)prepareAppLibraryRootSyncUpForItem:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setOp:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation BRCSyncUpOperationBuilder

- (BRCSyncUpOperationBuilder)init
{
  v10.receiver = self;
  v10.super_class = (Class)BRCSyncUpOperationBuilder;
  v2 = [(BRCSyncUpOperationBuilder *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    fullyChainedParentIDWhitelist = v2->_fullyChainedParentIDWhitelist;
    v2->_fullyChainedParentIDWhitelist = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    halfChainedParentIDWhitelist = v2->_halfChainedParentIDWhitelist;
    v2->_halfChainedParentIDWhitelist = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    parentItemIDToChildBasehashSalt = v2->_parentItemIDToChildBasehashSalt;
    v2->_parentItemIDToChildBasehashSalt = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (unsigned)shouldPCSChainStatusForItem:(id)a3
{
  id v4 = a3;
  if (![v4 isSharedToMeChildItem])
  {
    char v32 = 0;
    int v6 = [v4 isNewToServer:&v32];
    if ([v4 isSharedToMeTopLevelItem])
    {
      uint64_t v7 = [v4 asSharedToMeTopLevelItem];
      v8 = [v7 sharedAliasItemID];
    }
    else
    {
      v8 = [v4 itemID];
    }
    v9 = [v4 st];
    objc_super v10 = [v9 parentID];

    v11 = [v4 appLibrary];
    v12 = [v11 mangledID];
    v13 = +[BRCUserDefaults defaultsForMangledID:v12];

    v14 = [(BRCSyncUpOperationBuilder *)self op];
    v15 = [v14 serverZone];
    v16 = [v15 clientZone];

    if (![v16 isPrivateZone]
      || ([v8 isDocumentsFolder] & 1) != 0
      || ([v4 parentClientZone],
          v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [v17 isEqualToClientZone:v16],
          v17,
          !v18))
    {
      unsigned __int8 v5 = 1;
LABEL_16:

      goto LABEL_17;
    }
    v19 = [v16 asPrivateClientZone];
    if ([v13 optimisticallyPCSChainWithSession:self->_session])
    {
      int v20 = [v13 optimisticallyPCSChainDuringResetWithSession:self->_session];
      if (v32) {
        int v21 = v20;
      }
      else {
        int v21 = 1;
      }
    }
    else
    {
      int v21 = 0;
    }
    int v31 = [v13 should2PhasePCSChain];
    unsigned int v23 = [v19 pcsChainStateForItem:v8];
    if ((v23 & 0xFFFFFFFE) == 2)
    {
      if ([v4 isDirectory]) {
        [(NSMutableSet *)self->_fullyChainedParentIDWhitelist addObject:v8];
      }
      if (v6) {
        unsigned __int8 v5 = 8;
      }
      else {
        unsigned __int8 v5 = 16;
      }
      goto LABEL_56;
    }
    unsigned int v24 = v23;
    if ([(NSMutableSet *)self->_fullyChainedParentIDWhitelist containsObject:v10])
    {
LABEL_26:
      [(NSMutableSet *)self->_fullyChainedParentIDWhitelist addObject:v10];
      if ([v4 isDirectory]) {
        [(NSMutableSet *)self->_fullyChainedParentIDWhitelist addObject:v8];
      }
      unsigned __int8 v5 = 8;
      goto LABEL_56;
    }
    if ([(NSMutableSet *)self->_halfChainedParentIDWhitelist containsObject:v10])
    {
      int v25 = 4;
    }
    else
    {
      int v25 = [v19 pcsChainStateForItem:v10];
      if ((v25 & 0xFFFFFFFE) == 2) {
        goto LABEL_26;
      }
    }
    unsigned int v30 = v25;
    if (v21 && [v4 isInDocumentOrTrashScope])
    {
      if ([v4 isDirectory])
      {
        if (v30 < 2 || ([v19 parentIDHasLiveUnchainedChildren:v8] & 1) != 0)
        {
          if (v24 < 2) {
            int v26 = 1;
          }
          else {
            int v26 = v6;
          }
          if (v26 != 1) {
            goto LABEL_55;
          }
          goto LABEL_46;
        }
        [(NSMutableSet *)self->_fullyChainedParentIDWhitelist addObject:v8];
LABEL_58:
        unsigned __int8 v5 = 4;
        goto LABEL_56;
      }
      if (v24 < 2) {
        int v28 = v31;
      }
      else {
        int v28 = 0;
      }
      if (v30 >= 2 && !v28) {
        goto LABEL_58;
      }
      char v29 = [v4 isDocument];
      if (v24 > 1 || (v29 & 1) == 0)
      {
LABEL_55:
        unsigned __int8 v5 = 1;
        goto LABEL_56;
      }
    }
    else
    {
      char v27 = v6 ^ 1;
      if (v24 < 2) {
        char v27 = 1;
      }
      if (v27) {
        goto LABEL_55;
      }
      if ([v4 isDirectory]) {
LABEL_46:
      }
        [(NSMutableSet *)self->_halfChainedParentIDWhitelist addObject:v8];
    }
    unsigned __int8 v5 = 2;
LABEL_56:

    goto LABEL_16;
  }
  if ([v4 isKnownByServer]) {
    unsigned __int8 v5 = 32;
  }
  else {
    unsigned __int8 v5 = 8;
  }
LABEL_17:

  return v5;
}

- (BOOL)_checkIfShouldDedicateOpToSaltingBasehashItem:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isDead] & 1) == 0)
  {
    BOOL v5 = 0;
    if (![v4 shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:0]) {
      goto LABEL_27;
    }
    int v6 = [v4 st];
    uint64_t v7 = [v6 parentID];

    v8 = [v4 parentClientZone];
    unsigned int v9 = [v8 saltingStateForItemID:v7];
    if (v9 > 2)
    {
      if (v9 == -1 && !self->_rootChildBasehashSalt && [v7 isNonDesktopRoot])
      {
        v15 = [(NSMutableDictionary *)self->_parentItemIDToChildBasehashSalt objectForKeyedSubscript:v7];

        if (v15)
        {
          v41 = brc_bread_crumbs();
          v42 = brc_default_log();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
            -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:]();
          }
        }
        v16 = [v4 parentClientZone];
        v17 = [v16 asPrivateClientZone];
        int v18 = [v17 childBaseSaltForItemID:v7];
        rootChildBasehashSalt = self->_rootChildBasehashSalt;
        self->_rootChildBasehashSalt = v18;

        int v20 = self->_rootChildBasehashSalt;
        if (!v20)
        {
          objc_msgSend(MEMORY[0x263EFF8F8], "brc_generateSaltingKey");
          int v21 = (NSData *)objc_claimAutoreleasedReturnValue();
          v22 = self->_rootChildBasehashSalt;
          self->_rootChildBasehashSalt = v21;

          unsigned int v23 = brc_bread_crumbs();
          unsigned int v24 = brc_default_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            v36 = [(NSData *)self->_rootChildBasehashSalt brc_truncatedSHA256];
            v37 = objc_msgSend(v36, "brc_hexadecimalString");
            v38 = [v7 debugDescription];
            int v43 = 138412802;
            v44 = v37;
            __int16 v45 = 2112;
            v46 = v38;
            __int16 v47 = 2112;
            v48 = v23;
            _os_log_debug_impl(&dword_23FA42000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated root child basehash salt %@ for %@%@", (uint8_t *)&v43, 0x20u);
          }
          int v20 = self->_rootChildBasehashSalt;
        }
        [(NSMutableDictionary *)self->_parentItemIDToChildBasehashSalt setObject:v20 forKeyedSubscript:v7];
      }
    }
    else if (([v4 localDiffs] & 0x1000000060) != 0)
    {
      objc_super v10 = [v8 itemByItemID:v7];
      v11 = [v10 asDirectory];
      itemNeedingBasehashSalting = self->_itemNeedingBasehashSalting;
      self->_itemNeedingBasehashSalting = v11;

      v13 = brc_bread_crumbs();
      BOOL v5 = 1;
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:](v7);
      }
      goto LABEL_24;
    }
    if (![v4 isDirectory])
    {
      BOOL v5 = 0;
      goto LABEL_26;
    }
    int v25 = [v4 clientZone];
    int v26 = [v4 itemID];
    v13 = [v25 childBaseSaltForItemID:v26];

    if (!v13)
    {
      parentItemIDToChildBasehashSalt = self->_parentItemIDToChildBasehashSalt;
      int v28 = [v4 itemID];
      char v29 = [(NSMutableDictionary *)parentItemIDToChildBasehashSalt objectForKeyedSubscript:v28];

      if (v29)
      {
        v39 = brc_bread_crumbs();
        v40 = brc_default_log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
          -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:]();
        }
      }
      v13 = objc_msgSend(MEMORY[0x263EFF8F8], "brc_generateSaltingKey");
      unsigned int v30 = brc_bread_crumbs();
      int v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v34 = [v4 itemID];
        v35 = [v34 debugDescription];
        int v43 = 138412802;
        v44 = v13;
        __int16 v45 = 2112;
        v46 = v35;
        __int16 v47 = 2112;
        v48 = v30;
        _os_log_debug_impl(&dword_23FA42000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated child basehash salt %@ for %@%@", (uint8_t *)&v43, 0x20u);
      }
    }
    char v32 = self->_parentItemIDToChildBasehashSalt;
    v14 = [v4 itemID];
    [(NSMutableDictionary *)v32 setObject:v13 forKeyedSubscript:v14];
    BOOL v5 = 0;
LABEL_24:

LABEL_26:
    goto LABEL_27;
  }
  BOOL v5 = 0;
LABEL_27:

  return v5;
}

- (BOOL)_checkIfShouldDedicateOpToPCSChainingItem:(id)a3
{
  id v5 = a3;
  if ([v5 isDead]) {
    goto LABEL_11;
  }
  int v6 = [v5 appLibrary];
  uint64_t v7 = [v6 mangledID];
  v8 = +[BRCUserDefaults defaultsForMangledID:v7];
  int v9 = [v8 should2PhasePCSChain];

  if (([v5 isDeadOrMissingInServerTruth] & 1) != 0
    || ([v5 localDiffs] & 0x20) == 0
    || ([v5 isDirectory] & 1) == 0 && (objc_msgSend(v5, "isDocument") & v9) != 1)
  {
    goto LABEL_11;
  }
  objc_super v10 = [v5 itemID];
  if ([v10 isDocumentsFolder]) {
    goto LABEL_7;
  }
  v11 = [v5 clientZone];
  int v12 = [v11 isPrivateZone];

  if (!v12) {
    goto LABEL_11;
  }
  v13 = [v5 clientZone];
  objc_super v10 = [v13 asPrivateClientZone];

  fullyChainedParentIDWhitelist = self->_fullyChainedParentIDWhitelist;
  v15 = [v5 st];
  v16 = [v15 parentID];
  if ([(NSMutableSet *)fullyChainedParentIDWhitelist containsObject:v16])
  {
  }
  else
  {
    v19 = [v5 st];
    int v20 = [v19 parentID];
    int v21 = [v10 pcsChainStateForItem:v20] & 0xFFFFFFFE;

    if (v21 != 2)
    {
LABEL_7:

LABEL_11:
      BOOL v17 = 0;
      goto LABEL_12;
    }
  }
  v22 = [v5 itemID];
  unsigned int v23 = [v10 pcsChainStateForItem:v22];

  if (v23 < 2) {
    char v24 = v9;
  }
  else {
    char v24 = 0;
  }
  if ((v24 & 1) == 0)
  {
    if ((v23 & 0xFFFFFFFE) == 2) {
      goto LABEL_7;
    }
    int v25 = [v5 itemID];
    int v26 = [v10 parentIDHasLiveUnchainedChildren:v25];

    if (!v26) {
      goto LABEL_7;
    }
  }
  char v27 = brc_bread_crumbs();
  int v28 = brc_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToPCSChainingItem:](v5);
  }

  objc_storeStrong((id *)&self->_itemNeedingPCSChaining, a3);
  BOOL v17 = 1;
LABEL_12:

  return v17;
}

- (BOOL)checkIfSyncAllowedInSharedZoneForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCSyncUpOperationBuilder *)self op];
  int v6 = [v5 serverZone];

  if (![v6 isSharedZone]
    || [v4 isSharedToMeTopLevelItem] && (objc_msgSend(v4, "isDead") & 1) != 0)
  {
    BOOL v7 = 1;
    goto LABEL_25;
  }
  if ([v4 isDeadOrMissingInServerTruth]
    && [v4 isSharedToMeTopLevelItem])
  {
    v8 = [v4 serverZone];
    if (([v8 state] & 4) != 0)
    {
    }
    else
    {
      uint64_t v9 = [v4 localDiffs];

      if ((v9 & 0x400000000000000) != 0)
      {
        objc_super v10 = brc_bread_crumbs();
        v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:]();
        }

LABEL_24:
        BOOL v7 = 0;
        goto LABEL_25;
      }
    }
    v19 = brc_bread_crumbs();
    int v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:]();
    }

    [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v6];
    goto LABEL_24;
  }
  int v12 = [v4 clientZone];
  v13 = [v4 itemID];
  v14 = [v12 serverItemByItemID:v13];

  if (v14) {
    v15 = v14;
  }
  else {
    v15 = v4;
  }
  char v16 = [v15 sharingOptions];
  BOOL v7 = (v16 & 0x20) == 0;
  if ((v16 & 0x20) != 0)
  {
    BOOL v17 = brc_bread_crumbs();
    int v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:]();
    }

    [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:v14 inZone:v6];
  }

LABEL_25:
  return v7;
}

- (float)addDeletionOfItem:(id)a3
{
  id v4 = a3;
  if ([v4 isSharedToMeTopLevelItem])
  {
    v11 = brc_bread_crumbs();
    int v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpOperationBuilder addDeletionOfItem:]();
    }
  }
  id v5 = [v4 structureRecordID];
  int v6 = [v4 st];

  BOOL v7 = [v6 ckInfo];

  [(BRCSyncUpOperationBuilder *)self addDeletionOfRecordID:v5 ckInfo:v7];
  float v9 = v8;

  return v9;
}

- (float)addDeletionOfRecordID:(id)a3 ckInfo:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v6 = (__CFString *)a3;
  id v7 = a4;
  float v8 = [(BRCSyncUpOperationBuilder *)self op];
  float v9 = [v8 deletedRecordIDs];
  [v9 addObject:v6];

  if ([v7 hasEtag])
  {
    objc_super v10 = [v7 etag];
    v11 = [v8 recordIDsToDeleteToEtags];
    int v12 = v11;
    v13 = v10;
    v14 = v6;
LABEL_7:
    [v11 setObject:v13 forKeyedSubscript:v14];
    goto LABEL_8;
  }
  if ([v7 hasEtagBeforeCrossZoneMove])
  {
    v15 = [v8 pluginFieldsForRecordDeletesByID];
    objc_super v10 = [v15 objectForKeyedSubscript:v6];

    if (!v10)
    {
      objc_super v10 = objc_opt_new();
      char v16 = [v8 pluginFieldsForRecordDeletesByID];
      [v16 setObject:v10 forKeyedSubscript:v6];
    }
    int v12 = [v7 etagBeforeCrossZoneMove];
    v14 = @"br_etagInPreviousZone";
    v11 = v10;
    v13 = v12;
    goto LABEL_7;
  }
  objc_super v10 = brc_bread_crumbs();
  int v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    int v28 = v10;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] item should really have an etag%@", (uint8_t *)&v27, 0xCu);
  }
LABEL_8:

  if ([v7 hasDeletionChangeToken])
  {
    BOOL v17 = [(__CFString *)v6 recordName];
    char v18 = [v17 hasPrefix:@"shareAlias/"];

    if ((v18 & 1) == 0)
    {
      v19 = [v8 pluginFieldsForRecordDeletesByID];
      int v20 = [v19 objectForKeyedSubscript:v6];

      if (!v20)
      {
        int v20 = objc_opt_new();
        int v21 = [v8 pluginFieldsForRecordDeletesByID];
        [v21 setObject:v20 forKeyedSubscript:v6];
      }
      v22 = [v7 deletionChangeToken];
      [v20 setObject:v22 forKeyedSubscript:@"br_deleteChangeToken"];
    }
  }
  unsigned int v23 = [(BRCSyncUpOperationBuilder *)self defaults];
  [v23 syncUpStructureDeleteCost];
  float v25 = v24;

  return v25;
}

- (id)_getChildBasehashSaltForItemID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_parentItemIDToChildBasehashSalt objectForKeyedSubscript:v4];
  if (v5)
  {
    int v6 = (void *)v5;
    id v7 = [MEMORY[0x263EFF9D0] null];

    if (v6 == v7)
    {
      id v8 = 0;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  float v9 = [(BRCSyncUpOperation *)self->_op serverZone];
  objc_super v10 = [v9 clientZone];
  int v6 = [v10 childBaseSaltForItemID:v4];

  if (v6)
  {
    [(NSMutableDictionary *)self->_parentItemIDToChildBasehashSalt setObject:v6 forKeyedSubscript:v4];
LABEL_6:
    id v8 = v6;
    int v6 = v8;
    goto LABEL_7;
  }
  int v12 = [MEMORY[0x263EFF9D0] null];
  [(NSMutableDictionary *)self->_parentItemIDToChildBasehashSalt setObject:v12 forKeyedSubscript:v4];

  id v8 = 0;
  int v6 = 0;
LABEL_7:

  return v8;
}

- (id)_getChildBasehashSaltForItem:(id)a3
{
  id v4 = a3;
  if ([v4 shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:1]
    && [v4 isDirectory])
  {
    uint64_t v5 = [v4 itemID];
    int v6 = [(BRCSyncUpOperationBuilder *)self _getChildBasehashSaltForItemID:v5];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)_getSaltForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[BRCUserDefaults defaultsForMangledID:0];
  int v6 = [v5 supportsEnhancedDrivePrivacy];

  id v7 = 0;
  if (v6)
  {
    if ([v4 isSharedToMeTopLevelItem])
    {
      id v7 = 0;
    }
    else
    {
      id v8 = [v4 st];
      float v9 = [v8 parentID];

      if (!v9)
      {
        v11 = brc_bread_crumbs();
        int v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[BRCSyncUpOperationBuilder _getSaltForItem:]();
        }
      }
      id v7 = [(BRCSyncUpOperationBuilder *)self _getChildBasehashSaltForItemID:v9];
    }
  }

  return v7;
}

- (id)_generateSaltGetterBlock
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__BRCSyncUpOperationBuilder__generateSaltGetterBlock__block_invoke;
  v5[3] = &unk_265083760;
  v5[4] = self;
  v2 = (void *)MEMORY[0x2455D9A50](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x2455D9A50]();

  return v3;
}

uint64_t __53__BRCSyncUpOperationBuilder__generateSaltGetterBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getSaltForItem:a2];
}

- (id)_generateChildBasehashSaltGetterBlock
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__BRCSyncUpOperationBuilder__generateChildBasehashSaltGetterBlock__block_invoke;
  v5[3] = &unk_265083760;
  v5[4] = self;
  v2 = (void *)MEMORY[0x2455D9A50](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x2455D9A50]();

  return v3;
}

uint64_t __66__BRCSyncUpOperationBuilder__generateChildBasehashSaltGetterBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getChildBasehashSaltForItem:a2];
}

- (float)addEditOfSharedTopLevelItem:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(BRCSyncUpOperationBuilder *)self op];
  int v6 = [v5 serverZone];
  int v7 = [v6 isSharedZone];

  if (!v7)
  {
    __int16 v10 = [v4 localDiffs];
    v11 = [v4 parentClientZone];
    int v12 = [v5 serverZone];
    v13 = [v12 clientZone];
    char v14 = [v11 isEqualToClientZone:v13];

    if ((v14 & 1) == 0)
    {
      float v25 = brc_bread_crumbs();
      int v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 138412546;
        v36 = (const char *)v4;
        __int16 v37 = 2112;
        v38 = v25;
        _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] Fake syncing up share alias in the wrong zone! %@%@", (uint8_t *)&v35, 0x16u);
      }
      goto LABEL_15;
    }
    if ((v10 & 0x1A69) == 0)
    {
LABEL_16:
      id v8 = [v5 serverZone];
      [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v8];
      goto LABEL_17;
    }
    v15 = [v4 session];
    char v16 = [v5 serverZone];
    BOOL v17 = [v15 serverAliasItemForSharedItem:v4 inZone:v16];

    uint64_t v18 = [(BRCSyncUpOperationBuilder *)self shouldPCSChainStatusForItem:v4];
    v19 = [v5 serverZone];
    id v8 = [v4 structureRecordBeingDeadInServerTruth:v17 == 0 shouldPCSChainStatus:v18 inZone:v19];

    int v20 = brc_bread_crumbs();
    int v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      if ((v18 & 0x2C) != 0) {
        v33 = "pcs chained ";
      }
      else {
        v33 = "";
      }
      v34 = [v8 description];
      int v35 = 136315650;
      v36 = v33;
      __int16 v37 = 2112;
      v38 = v34;
      __int16 v39 = 2112;
      v40 = v20;
      _os_log_debug_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sshared document alias record %@%@", (uint8_t *)&v35, 0x20u);
    }
    if (v8)
    {
      v22 = [v5 recordsToSave];
      [v22 addObject:v8];

      if ([v4 isFromInitialScan])
      {
        unsigned int v23 = [(BRCSyncUpOperationBuilder *)self defaults];
        [v23 syncUpInitialItemCost];
      }
      else
      {
        int v31 = [v4 isKnownByServer];
        char v32 = [(BRCSyncUpOperationBuilder *)self defaults];
        unsigned int v23 = v32;
        if (v31) {
          [v32 syncUpStructureEditCost];
        }
        else {
          [v32 syncUpStructureCreateCost];
        }
      }
      float v27 = v24;

      goto LABEL_18;
    }
LABEL_23:
    float v27 = -1.0;
    goto LABEL_19;
  }
  if (![v4 isDocument])
  {
    if ([v4 isDirectory])
    {
      float v25 = brc_bread_crumbs();
      int v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncUpOperationBuilder addEditOfSharedTopLevelItem:]();
      }
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v29 = brc_bread_crumbs();
    unsigned int v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpOperationBuilder addEditOfSharedTopLevelItem:]();
    }

    goto LABEL_23;
  }
  id v8 = [v4 asDocument];
  [(BRCSyncUpOperationBuilder *)self addEditOfDocument:v8];
LABEL_17:
  float v27 = v9;
LABEL_18:

LABEL_19:
  return v27;
}

- (float)addDeletionOfSharedTopLevelItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(BRCSyncUpOperationBuilder *)self op];
  int v6 = [v5 serverZone];
  int v7 = [v6 isSharedZone];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263EFD7E8]);
    float v9 = [v4 asShareableItem];
    __int16 v10 = (void *)[v8 initShareIDWithShareableItem:v9];

    v11 = [(BRCSyncUpOperationBuilder *)self op];
    int v12 = [v11 deletedRecordIDs];
    [v12 addObject:v10];

    v13 = [(BRCSyncUpOperationBuilder *)self defaults];
    [v13 syncUpDocumentDeleteCost];
    float v15 = v14;
  }
  else
  {
    char v16 = [(BRCSyncUpOperationBuilder *)self op];
    BOOL v17 = [v16 serverZone];
    __int16 v10 = [v4 structureRecordIDInZone:v17];

    if (v10)
    {
      uint64_t v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncUpOperationBuilder addDeletionOfSharedTopLevelItem:]();
      }

      int v20 = [v4 st];
      int v21 = [v20 ckInfo];
      [(BRCSyncUpOperationBuilder *)self addDeletionOfRecordID:v10 ckInfo:v21];
    }
    else
    {
      unsigned int v23 = brc_bread_crumbs();
      float v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138412290;
        float v27 = v23;
        _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] syncing the structure of an item without an alias item%@", (uint8_t *)&v26, 0xCu);
      }

      int v20 = [(BRCSyncUpOperationBuilder *)self op];
      int v21 = [v20 serverZone];
      [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v21];
    }
    float v15 = v22;
  }
  return v15;
}

- (void)prepareAppLibraryRootSyncUpForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 appLibrary];
  int v6 = [v5 mangledID];

  if (v6)
  {
    int v7 = [v4 clientZone];
    if (([v7 isPrivateZone] & 1) == 0)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v8 = [v4 appLibrary];
    if (([v8 state] & 0x300002) != 0x200000)
    {
LABEL_9:

      goto LABEL_10;
    }
    float v9 = [(BRCSyncUpOperationBuilder *)self op];
    __int16 v10 = [v9 createdAppLibraryNames];
    v11 = [v6 appLibraryOrZoneName];
    if ([v10 containsObject:v11])
    {
LABEL_8:

      goto LABEL_9;
    }
    int v12 = [v4 clientZone];
    v13 = [v12 zoneName];
    if (![v13 isEqualToString:*MEMORY[0x263F324E8]]
      || ([v6 isCloudDocsMangledID] & 1) != 0)
    {

      goto LABEL_8;
    }
    __int16 v39 = [v4 appLibrary];
    char v40 = [v39 isiCloudDesktopAppLibrary];

    if ((v40 & 1) == 0)
    {
      id v14 = objc_alloc(MEMORY[0x263EFD808]);
      float v15 = [v4 clientZone];
      char v16 = [v15 zoneName];
      BOOL v17 = (void *)[v14 initWithZoneName:v16 ownerName:*MEMORY[0x263EFD488]];

      uint64_t v18 = [v4 appLibrary];
      v19 = [v18 childBasehashSalt];

      int v20 = [MEMORY[0x263EFD7C8] rootAppLibraryRecordForAppLibraryID:v6 zoneID:v17];
      int v21 = v20;
      if (v19)
      {
        objc_msgSend(v20, "brc_fillWithChildBasehashSalt:", v19);
        float v22 = [v4 appLibrary];
        unsigned int v23 = [v22 saltingState];

        if (v23 <= 1) {
          uint64_t v24 = 3;
        }
        else {
          uint64_t v24 = v23;
        }
        float v25 = [NSNumber numberWithUnsignedInt:v24];
        [v21 setObject:v25 forKeyedSubscript:@"saltingState"];
      }
      int v26 = [v4 appLibrary];
      if ([v26 includesDataScope])
      {
      }
      else
      {
        [v4 appLibrary];
        uint64_t v41 = v19;
        v28 = float v27 = v17;
        uint64_t v29 = [v28 mangledID];
        unsigned int v30 = +[BRCUserDefaults defaultsForMangledID:v29];
        int v31 = [v30 optimisticallyPCSChainWithSession:self->_session];

        BOOL v17 = v27;
        v19 = v41;

        if (v31) {
          [v21 setWantsChainPCS:1];
        }
      }
      if (v21)
      {
        char v32 = brc_bread_crumbs();
        v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          -[BRCSyncUpOperationBuilder prepareAppLibraryRootSyncUpForItem:]();
        }

        v34 = [(BRCSyncUpOperationBuilder *)self op];
        int v35 = [v34 recordsToSave];
        [v35 addObject:v21];

        v36 = [(BRCSyncUpOperationBuilder *)self op];
        __int16 v37 = [v36 createdAppLibraryNames];
        v38 = [v6 appLibraryOrZoneName];
        [v37 addObject:v38];
      }
    }
  }
LABEL_11:
}

- (float)fakeSyncForItem:(id)a3 serverItem:(id)a4 inZone:(id)a5
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = [v7 st];
  v11 = [v10 ckInfo];
  int v12 = [v11 etag];
  if (v12 || ![v7 isSharedToMeChildItem])
  {
  }
  else
  {
    int v13 = [v9 isSharedZone];

    if (v13)
    {
      id v14 = brc_bread_crumbs();
      float v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:]();
      }

      [v7 prepareForSyncUpSideCarZone];
      [v7 markLatestSyncRequestAcknowledgedInZone:&unk_26F3DD2F8];
    }
  }
  uint64_t v16 = objc_msgSend(v7, "localDiffs", self);
  BOOL v17 = [v65 session];
  uint64_t v18 = [v17 syncUpScheduler];
  v19 = [v9 dbRowID];
  uint64_t v20 = [v18 inFlightDiffsForItem:v7 zoneRowID:v19];

  if ([v7 isSharedToMeChildItem])
  {
    int v21 = objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", v7);
    float v22 = objc_msgSend(v21, "brc_shareItemID");
    unsigned int v23 = [v7 clientZone];
    uint64_t v24 = [v23 serverItemByItemID:v22];
    int v25 = [v24 isLive];

    int v26 = v25 ^ 1;
    if ((v25 & 1) == 0)
    {
      float v27 = brc_bread_crumbs();
      uint64_t v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v68 = (uint64_t)v7;
        __int16 v69 = 2112;
        id v70 = v27;
        _os_log_impl(&dword_23FA42000, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as rejected because the root share is dead%@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (![v7 isSharedToMeTopLevelItem]) {
      goto LABEL_15;
    }
    uint64_t v29 = [v7 clientZone];
    unsigned int v30 = [v7 itemID];
    int v31 = [v29 serverItemByItemID:v30];
    char v32 = [v31 isLive];

    if (v32)
    {
LABEL_15:
      int v26 = 0;
      goto LABEL_20;
    }
    int v21 = brc_bread_crumbs();
    float v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v68 = (uint64_t)v7;
      __int16 v69 = 2112;
      id v70 = v21;
      _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as rejected because the server item is dead%@", buf, 0x16u);
    }
    int v26 = 1;
  }

LABEL_20:
  if ([v7 isDocumentBeingCopiedToNewZone])
  {
    v33 = brc_bread_crumbs();
    v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:]();
    }
  }
  uint64_t v35 = v20 | v16;
  if (v26)
  {
    [v7 markForceRejected];
    goto LABEL_38;
  }
  if (([v7 isKnownByServer] & 1) != 0 || !objc_msgSend(v7, "isSharedToMeChildItem"))
  {
    [v7 prepareForSyncUpInZone:v9];
    char v40 = [v9 dbRowID];
    [v7 markLatestSyncRequestAcknowledgedInZone:v40];

    if (([v8 sharingOptions] & 0x20) != 0 && objc_msgSend(v7, "isDocument"))
    {
      uint64_t v41 = [v7 asDocument];
      v42 = [v41 currentVersion];
      int v43 = [v42 ckInfo];
      if (v43)
      {

        if ((v35 & 0x180000) != 0)
        {
          v44 = [v7 asDocument];
          __int16 v45 = [v44 currentVersion];
          v46 = (void *)MEMORY[0x263F087E8];
          __int16 v47 = [v7 asDocument];
          v48 = [v47 fileIDForUpload];
          uint64_t v49 = objc_msgSend(v46, "brc_errorItemIneligibleFromSyncForInode:", v48);
          [v45 setUploadError:v49];
        }
      }
      else
      {
      }
    }
LABEL_38:
    int v39 = 0;
    if ((v35 & 0x1000000000000000) != 0) {
      goto LABEL_50;
    }
    goto LABEL_39;
  }
  if ([v7 isDocument])
  {
    v36 = [v7 asDocument];
    __int16 v37 = [v36 currentVersion];
    v38 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemIneligibleFromSyncForInode:", 0);
    [v37 setUploadError:v38];
  }
  int v39 = 1;
  if ((v35 & 0x1000000000000000) == 0)
  {
LABEL_39:
    if (v8) {
      goto LABEL_41;
    }
    v50 = [v9 clientZone];
    v51 = [v7 itemID];
    id v8 = [v50 serverItemByItemID:v51];

    if (v8)
    {
LABEL_41:
      memset(v66, 0, sizeof(v66));
      __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:]", 555, v66);
      v52 = brc_bread_crumbs();
      v53 = brc_default_log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v68 = v66[0];
        __int16 v69 = 2112;
        id v70 = v8;
        __int16 v71 = 2112;
        v72 = v52;
        _os_log_debug_impl(&dword_23FA42000, v53, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx re-scheduling apply jobs for %@ because it finished sync-up%@", buf, 0x20u);
      }

      int v54 = [v7 isDead];
      if (v54) {
        v55 = 0;
      }
      else {
        v55 = v7;
      }
      id v56 = v55;
      v57 = [v65[5] applyScheduler];
      v58 = v57;
      if (v54) {
        uint64_t v59 = 1;
      }
      else {
        uint64_t v59 = 2;
      }
      [v57 createApplyJobFromServerItem:v8 localItem:v56 state:1 kind:v59];

      __brc_leave_section(v66);
    }
  }
LABEL_50:
  [v7 saveToDB];
  if (v39)
  {
    v60 = [v9 session];
    v61 = [v60 syncUpScheduler];
    v62 = [v9 dbRowID];
    [v61 setState:52 forItem:v7 zone:v62];
  }
  return -1.0;
}

- (void)handleDeletionOfSharedItem:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFD7E8];
  id v5 = a3;
  id v8 = (id)[[v4 alloc] initShareIDWithShareableItem:v5];

  int v6 = [(BRCSyncUpOperationBuilder *)self op];
  id v7 = [v6 deletedRecordIDs];
  [v7 addObject:v8];
}

- (void)handleEditOfSharedItem:(id)a3
{
  id v4 = a3;
  if ([v4 itemScope] == 3)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initShareIDWithShareableItem:v4];
    int v6 = [v4 st];
    int v7 = [v6 iWorkShareable];

    id v8 = [(BRCSyncUpOperationBuilder *)self op];
    id v9 = v8;
    if (v7) {
      [v8 iworkUnsharedShareIDs];
    }
    else {
    uint64_t v16 = [v8 deletedRecordIDs];
    }
    [v16 addObject:v5];

    id v14 = brc_bread_crumbs();
    float v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperationBuilder handleEditOfSharedItem:]();
    }
LABEL_10:

    goto LABEL_11;
  }
  if (([v4 localDiffs] & 0x40) != 0)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initShareIDWithShareableItem:v4];
    __int16 v10 = [v4 st];
    v11 = [v10 logicalName];
    int v12 = [(BRCSyncUpOperationBuilder *)self op];
    int v13 = [v12 renamedShareIDsToNames];
    [v13 setObject:v11 forKeyedSubscript:v5];

    id v14 = brc_bread_crumbs();
    float v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperationBuilder handleEditOfSharedItem:]();
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (float)addEditOfDirectory:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 isDeadOrMissingInServerTruth];
  BOOL v6 = (v5 & 1) != 0 || ([v4 localDiffs] & 0x3FFE) != 0;
  int v7 = [v4 isKnownByServer];
  id v8 = [v4 itemID];
  if (([v8 isDocumentsFolder] & 1) == 0)
  {

LABEL_10:
    if ([v4 hasShareIDAndIsOwnedByMe])
    {
      v11 = [v4 asShareableItem];
      [(BRCSyncUpOperationBuilder *)self handleEditOfSharedItem:v11];
    }
    if (v6)
    {
      uint64_t v12 = [(BRCSyncUpOperationBuilder *)self shouldPCSChainStatusForItem:v4];
      int v13 = [(BRCSyncUpOperationBuilder *)self op];
      id v14 = [v13 stageID];
      float v15 = [(BRCSyncUpOperationBuilder *)self _generateSaltGetterBlock];
      uint64_t v16 = [(BRCSyncUpOperationBuilder *)self _generateChildBasehashSaltGetterBlock];
      BOOL v17 = [v4 structureRecordBeingDeadInServerTruth:v5 stageID:v14 shouldPCSChainStatus:v12 saltGetter:v15 childBasehashSaltGetter:v16];

      if (v17)
      {
        if ([v4 shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:0]
          && [v4 isNewToServer:0])
        {
          uint64_t v18 = [v17 encryptedValues];
          v19 = [v18 objectForKeyedSubscript:@"childBasehashSalt"];

          if (!v19)
          {
            __int16 v37 = brc_bread_crumbs();
            v38 = brc_default_log();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
              -[BRCSyncUpOperationBuilder addEditOfDirectory:]();
            }
          }
          [v17 setObject:&unk_26F3DD310 forKeyedSubscript:@"saltingState"];
        }
        uint64_t v20 = brc_bread_crumbs();
        int v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          char v32 = "half chained ";
          if (v12 != 2) {
            char v32 = "";
          }
          if ((v12 & 0x2C) != 0) {
            v33 = "pcs chained ";
          }
          else {
            v33 = v32;
          }
          uint64_t v34 = [v17 description];
          uint64_t v35 = (void *)v34;
          v36 = "\n(dead in server truth)";
          int v39 = 136315906;
          char v40 = v33;
          if (!v5) {
            v36 = "";
          }
          __int16 v41 = 2112;
          uint64_t v42 = v34;
          __int16 v43 = 2080;
          v44 = v36;
          __int16 v45 = 2112;
          v46 = v20;
          _os_log_debug_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sdirectory record %@%s%@", (uint8_t *)&v39, 0x2Au);
        }
        float v22 = [(BRCSyncUpOperationBuilder *)self op];
        unsigned int v23 = [v22 recordsToSave];
        [v23 addObject:v17];

        if ([v4 isFromInitialScan])
        {
          uint64_t v24 = [(BRCSyncUpOperationBuilder *)self defaults];
          [v24 syncUpInitialItemCost];
        }
        else
        {
          int v29 = [v4 isKnownByServer];
          unsigned int v30 = [(BRCSyncUpOperationBuilder *)self defaults];
          uint64_t v24 = v30;
          if (v29) {
            [v30 syncUpStructureEditCost];
          }
          else {
            [v30 syncUpStructureCreateCost];
          }
        }
        float v10 = v25;
      }
      else
      {
        float v10 = -1.0;
      }
    }
    else
    {
      int v26 = [(BRCSyncUpOperationBuilder *)self op];
      float v27 = [v26 serverZone];
      [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v27];
      float v10 = v28;
    }
    goto LABEL_28;
  }
  id v9 = [v4 appLibrary];
  if (([v9 state] & 0x40000) == 0) {
    int v7 = 1;
  }

  float v10 = -1.0;
  if (v7 == 1) {
    goto LABEL_10;
  }
LABEL_28:

  return v10;
}

- (float)addDeletionOfDirectory:(id)a3
{
  id v4 = a3;
  if ([v4 hasShareIDAndIsOwnedByMe])
  {
    uint64_t v5 = [v4 asShareableItem];
    [(BRCSyncUpOperationBuilder *)self handleDeletionOfSharedItem:v5];
  }
  if ([v4 isSharedToMeTopLevelItem])
  {
    id v9 = brc_bread_crumbs();
    float v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpOperationBuilder addDeletionOfItem:]();
    }
  }
  [(BRCSyncUpOperationBuilder *)self addDeletionOfItem:v4];
  float v7 = v6;

  return v7;
}

- (float)addDeletionOfAlias:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 targetClientZone];
  if ([v5 isSharedZone])
  {
    float v6 = [v4 targetItemID];
    float v7 = [v5 itemByItemID:v6];
    id v8 = [v7 asSharedToMeTopLevelItem];

    id v9 = [v8 parentClientZone];
    float v10 = [v4 clientZone];
    int v11 = [v9 isEqualToClientZone:v10];

    if (v11)
    {
      uint64_t v12 = brc_bread_crumbs();
      int v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412546;
        id v22 = v4;
        __int16 v23 = 2112;
        uint64_t v24 = v12;
        _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Faking sync for alias item alive in the same zone as the target %@%@", (uint8_t *)&v21, 0x16u);
      }

      id v14 = [v4 serverZone];
      [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v14];
      float v16 = v15;

      goto LABEL_9;
    }
  }
  if ([v4 isSharedToMeTopLevelItem])
  {
    v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpOperationBuilder addDeletionOfItem:]();
    }
  }
  [(BRCSyncUpOperationBuilder *)self addDeletionOfItem:v4];
  float v16 = v17;
LABEL_9:

  return v16;
}

- (float)addDeletionOfDocument:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(BRCSyncUpOperationBuilder *)self op];
  if ([v4 hasShareIDAndIsOwnedByMe])
  {
    float v6 = [v4 asShareableItem];
    [(BRCSyncUpOperationBuilder *)self handleDeletionOfSharedItem:v6];
  }
  float v7 = [v4 currentVersion];
  id v8 = [v7 ckInfo];

  if (([v8 hasEtag] & 1) != 0 || objc_msgSend(v8, "hasEtagBeforeCrossZoneMove"))
  {
    id v9 = [v4 documentRecordID];
    [(BRCSyncUpOperationBuilder *)self addDeletionOfRecordID:v9 ckInfo:v8];
    [(BRCSyncUpOperationBuilder *)self addDeletionOfItem:v4];
    int v10 = [v4 isInDocumentScope];
    int v11 = [(BRCSyncUpOperationBuilder *)self defaults];
    uint64_t v12 = v11;
    if (v10) {
      [v11 syncUpDocumentDeleteCost];
    }
    else {
      [v11 syncUpDataDeleteCost];
    }
    float v14 = v13;
  }
  else
  {
    float v15 = brc_bread_crumbs();
    float v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      float v27 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Not syncing deletion of ETag-less version: %@%@", (uint8_t *)&v24, 0x16u);
    }

    float v17 = [v4 clientZone];
    uint64_t v18 = [v4 itemID];
    id v9 = [v17 serverItemByItemID:v18];

    if ([v9 isLive])
    {
      v19 = [v4 session];
      uint64_t v20 = [v19 applyScheduler];
      [v20 createApplyJobFromServerItem:v9 localItem:0 state:1 kind:1];
    }
    int v21 = [v5 serverZone];
    [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:v9 inZone:v21];
    float v14 = v22;
  }
  return v14;
}

- (BOOL)_recoverItemIDChangedWhileUploadingIfNecessary:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 currentVersion];
  float v6 = [v5 uploadedAssets];

  if (v6)
  {
    float v7 = [v6 recordID];
    id v8 = objc_msgSend(v7, "brc_itemIDWithSession:", self->_session);

    if (v8
      && ([v4 itemID],
          id v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v8 isEqualToItemID:v9],
          v9,
          (v10 & 1) == 0))
    {
      uint64_t v12 = brc_bread_crumbs();
      float v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        float v16 = [v4 itemID];
        int v17 = 138412802;
        uint64_t v18 = v8;
        __int16 v19 = 2112;
        uint64_t v20 = v16;
        __int16 v21 = 2112;
        float v22 = v12;
        _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ItemID changed while uploading (%@ -> %@), starting over%@", (uint8_t *)&v17, 0x20u);
      }
      float v14 = [v4 currentVersion];
      [v14 clearUploadedAssets];

      [v4 markNeedsUploadOrSyncingUp];
      [v4 saveToDB];
      BOOL v11 = 1;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_validateSharedDocumentFieldsForRecord:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BRCSyncUpOperationBuilder *)self _recoverItemIDChangedWhileUploadingIfNecessary:v7])
  {
    goto LABEL_5;
  }
  id v8 = [v7 session];
  char v9 = [v6 validateEnhancedDrivePrivacyFieldsWithSession:v8 error:0];

  if ((v9 & 1) == 0)
  {
    BOOL v11 = [v7 currentVersion];
    [v11 clearUploadedAssets];

    [v7 markNeedsUploadOrSyncingUp];
    [v7 saveToDB];
LABEL_5:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (float)addEditOfDocument:(id)a3
{
  uint64_t v168 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(BRCSyncUpOperationBuilder *)self op];
  uint64_t v6 = [v4 isDeadOrMissingInServerTruth];
  int v7 = [v4 localDiffs];
  id v8 = [v4 st];
  char v9 = [v8 ckInfo];
  BOOL v10 = v9;
  if (!v9 || (v6 & 1) != 0)
  {
    BOOL v11 = [v4 st];
    int v12 = [v11 iWorkShareable];

    if ((v12 & v6) == 1)
    {
      char v13 = [v4 sharingOptions];
      BOOL v14 = (v13 & 4) == 0;
      unint64_t v158 = (unint64_t)(v13 & 4) >> 2;
      goto LABEL_8;
    }
    LOBYTE(v158) = v12;
  }
  else
  {

    LOBYTE(v158) = 0;
  }
  BOOL v14 = 0;
LABEL_8:
  uint64_t v15 = v7 & 0x3FFE;
  uint64_t v16 = v7 & 0x1FE0000;
  if (![v4 sharingOptions]) {
    goto LABEL_17;
  }
  int v17 = [v4 currentVersion];
  uint64_t v18 = [v17 ckInfo];
  if (v18)
  {

    goto LABEL_17;
  }
  __int16 v19 = [v4 clientZone];
  if ([v19 isPrivateZone])
  {
  }
  else
  {
    int v20 = [v4 isSharedToMeTopLevelItem];

    if (!v20) {
      goto LABEL_17;
    }
  }
  __int16 v21 = brc_bread_crumbs();
  float v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.8();
  }

  LOBYTE(v158) = 1;
LABEL_17:
  v159 = (void *)v5;
  unint64_t v23 = [v4 localDiffs];
  BOOL v24 = v16 == 0;
  uint64_t v25 = (v23 >> 59) & 1;
  if (v24) {
    int v26 = v25 | v6;
  }
  else {
    int v26 = 1;
  }
  if (v15) {
    int v27 = 1;
  }
  else {
    int v27 = v25 | v6;
  }
  uint64_t v28 = [v4 serverZone];
  int v29 = [v28 isSharedZone];

  if (v29)
  {
    int v27 = [v4 isSharedToMeChildItem];
    unsigned int v30 = [v4 clientZone];
    int v31 = [v4 itemID];
    char v32 = [v30 serverItemByItemID:v31];

    if (v6 && ([v4 isSharedToMeTopLevelItem] & 1) != 0
      || (v32 ? (v33 = v32) : (v33 = v4), ([v33 sharingOptions] & 0x20) != 0))
    {
      uint64_t v34 = brc_bread_crumbs();
      uint64_t v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.7();
      }

      int v26 = 0;
    }
  }
  int v36 = v25 | v14;
  int v37 = [(BRCSyncUpOperationBuilder *)self shouldPCSChainStatusForItem:v4];
  if ((v37 & 6) != 0) {
    int v38 = v27;
  }
  else {
    int v38 = 1;
  }
  if ((v37 & 4) != 0) {
    int v39 = v26;
  }
  else {
    int v39 = 1;
  }
  if (v39) {
    int v40 = v37;
  }
  else {
    int v40 = 2;
  }
  if (v38) {
    int v41 = v40;
  }
  else {
    int v41 = 1;
  }
  unsigned int v157 = v41;
  if ((v41 & 0xC) != 0)
  {
    uint64_t v42 = brc_bread_crumbs();
    __int16 v43 = brc_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.6();
    }

    int v27 = 1;
  }
  else if (!v26)
  {
    int v153 = v36;
    id v154 = 0;
    v46 = 0;
    BOOL v54 = 0;
    v44 = v159;
    goto LABEL_62;
  }
  v44 = v159;
  __int16 v45 = [v4 currentVersion];
  v46 = [v45 uploadedAssets];

  if (objc_msgSend(v46, "brc_isfakeRecordWithErrorMarkerFor20716676"))
  {
    uint64_t v47 = brc_bread_crumbs();
    v48 = brc_default_log();
    if (os_log_type_enabled(v48, (os_log_type_t)0x90u)) {
      -[BRCSyncUpOperationBuilder addEditOfDocument:]();
    }

    [v4 markForceUpload];
    [v4 saveToDB];
    uint64_t v49 = 0;
LABEL_55:
    float v50 = -1.0;
    goto LABEL_182;
  }
  if (v46)
  {
    float v50 = -1.0;
    if (![(BRCSyncUpOperationBuilder *)self _validateSharedDocumentFieldsForRecord:v46 item:v4])
    {
      uint64_t v49 = 0;
      goto LABEL_182;
    }
    v51 = [v46 objectForKeyedSubscript:@"thumb1024"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    int v153 = v36;
    if (isKindOfClass)
    {
      v53 = [v46 objectForKeyedSubscript:@"thumb1024"];
      if ([v53 isRereferencedAssetUpload])
      {
        uint64_t v49 = 0;
      }
      else
      {
        v76 = [v53 fileURL];
        id v161 = 0;
        char v77 = [v76 checkResourceIsReachableAndReturnError:&v161];
        id v154 = v161;

        if ((v77 & 1) == 0)
        {
          v110 = brc_bread_crumbs();
          v111 = brc_default_log();
          if (os_log_type_enabled(v111, (os_log_type_t)0x90u)) {
            -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.5();
          }

          [v4 markForceUpload];
          [v4 saveToDB];
LABEL_122:

          goto LABEL_166;
        }
        uint64_t v49 = v154;
      }
    }
    else
    {
      uint64_t v49 = 0;
    }
    v78 = [v4 currentVersion];
    int v79 = [v78 isPackage];

    if (v79)
    {
      uint64_t v80 = [v46 objectForKeyedSubscript:@"pkgContent"];
      if (v80)
      {
        v81 = (void *)v80;
        v155 = v49;
        v82 = @"pkgManifest";
        uint64_t v83 = [v46 objectForKeyedSubscript:@"pkgManifest"];
        if (v83)
        {
          v84 = (void *)v83;
          v85 = [v46 objectForKeyedSubscript:@"pkgSignature"];

          uint64_t v49 = v155;
          if (v85)
          {
            v86 = [v46 objectForKeyedSubscript:@"pkgContent"];
            v87 = [v46 objectForKeyedSubscript:@"pkgManifest"];
            v88 = [v46 objectForKeyedSubscript:@"thumb1024"];
            v150 = v86;
            [v86 earliestUploadReceiptExpiration];
            double v90 = v89;
            double Current = CFAbsoluteTimeGetCurrent();
            double v92 = Current;
            v151 = v88;
            if (v90 == 0.0) {
              goto LABEL_138;
            }
            if (v90 >= Current)
            {
              v86 = [v87 deviceID];
              uint64_t v93 = [v86 longLongValue];
              v82 = [(BRCAccountSessionFPFS *)self->_session volume];
              if (v93 == (int)[(__CFString *)v82 deviceID])
              {
                v88 = v151;
LABEL_138:
                if ([v87 size] && (objc_msgSend(v87, "uploadReceiptExpiration"), v116 < v92))
                {
                  BOOL v117 = 1;
                }
                else if ([v88 size])
                {
                  [v88 uploadReceiptExpiration];
                  BOOL v117 = v118 < v92;
                }
                else
                {
                  BOOL v117 = 0;
                }
                if (v90 == 0.0)
                {
                  if (v117) {
                    goto LABEL_178;
                  }
                }
                else
                {

                  if (v117) {
                    goto LABEL_178;
                  }
                }

                goto LABEL_154;
              }
            }
LABEL_178:
            brc_bread_crumbs();
            v144 = (char *)objc_claimAutoreleasedReturnValue();
            v145 = brc_default_log();
            if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v163 = (const char *)v4;
              __int16 v164 = 2112;
              v165 = v144;
              _os_log_impl(&dword_23FA42000, v145, OS_LOG_TYPE_DEFAULT, "[WARNING] Forcing re-upload of an item which has an expired put receipt - %@%@", buf, 0x16u);
            }

            [v4 markForceUpload];
            [v4 saveToDB];

            goto LABEL_181;
          }
        }
        else
        {
        }
      }
      v112 = brc_bread_crumbs();
      v113 = brc_default_log();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_FAULT)) {
        -[BRCSyncUpOperationBuilder addEditOfDocument:]();
      }
LABEL_126:

      [v4 markForceUpload];
      [v4 saveToDB];
LABEL_181:
      v44 = v159;
      goto LABEL_182;
    }
    v94 = [v46 objectForKeyedSubscript:@"fileContent"];
    if (v94)
    {
    }
    else
    {
      v95 = [v46 objectForKeyedSubscript:@"bookmarkContent"];

      if (!v95)
      {
        v112 = brc_bread_crumbs();
        v113 = brc_default_log();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_FAULT)) {
          -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.4();
        }
        goto LABEL_126;
      }
    }
    v96 = [v46 objectForKeyedSubscript:@"fileContent"];
    v97 = [v46 objectForKeyedSubscript:@"thumb1024"];
    double v98 = CFAbsoluteTimeGetCurrent();
    if ([v96 size])
    {
      [v96 uploadReceiptExpiration];
      if (v99 >= v98)
      {
        v156 = v49;
        v100 = [v96 deviceID];
        uint64_t v101 = [v100 longLongValue];
        v102 = [(BRCAccountSessionFPFS *)self->_session volume];
        if (v101 == (int)[v102 deviceID])
        {
          if (![v97 size])
          {

            uint64_t v49 = v156;
LABEL_153:

LABEL_154:
            v44 = v159;
            goto LABEL_155;
          }
          [v97 uploadReceiptExpiration];
          double v104 = v103;

          uint64_t v49 = v156;
          if (v104 >= v98) {
            goto LABEL_153;
          }
        }
        else
        {

          uint64_t v49 = v156;
        }
      }
    }
    else
    {
      if (![v97 size]) {
        goto LABEL_153;
      }
      [v97 uploadReceiptExpiration];
      if (v105 >= v98) {
        goto LABEL_153;
      }
    }
    brc_bread_crumbs();
    v114 = (char *)objc_claimAutoreleasedReturnValue();
    v115 = brc_default_log();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v163 = (const char *)v4;
      __int16 v164 = 2112;
      v165 = v114;
      _os_log_impl(&dword_23FA42000, v115, OS_LOG_TYPE_DEFAULT, "[WARNING] Forcing re-upload of an item which has an expired put receipt - %@%@", buf, 0x16u);
    }

    [v4 markForceUpload];
    [v4 saveToDB];

    goto LABEL_181;
  }
  if ([v4 contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:v6])
  {
    v65 = brc_bread_crumbs();
    v66 = brc_default_log();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperationBuilder addEditOfDocument:]();
    }

    [v4 markForceUpload];
    [v4 saveToDB];
    uint64_t v49 = 0;
    v46 = 0;
    goto LABEL_55;
  }
  int v153 = v36;
  v46 = [v4 baseRecord];
  uint64_t v49 = 0;
LABEL_155:
  uint64_t v123 = [v4 localDiffs];
  v124 = [(BRCSyncUpOperationBuilder *)self _getSaltForItem:v4];
  id v160 = v49;
  LOBYTE(v123) = [v46 serializeVersion:v4 diffs:v123 deadInServerTruth:v6 basehashSalt:v124 error:&v160];
  id v154 = v160;

  if ((v123 & 1) == 0)
  {
    v141 = brc_bread_crumbs();
    v142 = brc_default_log();
    uint64_t v49 = v154;
    if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v163 = (const char *)v154;
      __int16 v164 = 2112;
      v165 = (const char *)v4;
      __int16 v166 = 2112;
      v167 = v141;
      _os_log_debug_impl(&dword_23FA42000, v142, OS_LOG_TYPE_DEBUG, "[DEBUG] Error creating record %@ for item %@%@", buf, 0x20u);
    }

    goto LABEL_55;
  }
  v125 = [v4 session];
  int v126 = [v46 validateEnhancedDrivePrivacyFieldsWithSession:v125 error:0];

  float v50 = -1.0;
  if (!v126)
  {
LABEL_166:
    uint64_t v49 = v154;
    goto LABEL_182;
  }
  v127 = [v4 resolvedConflictLoserEtags];
  v152 = v127;
  if ([v127 count])
  {
    v128 = [v127 allObjects];
    v129 = [v44 conflictLosersToResolveByRecordID];
    v130 = [v46 recordID];
    [v129 setObject:v128 forKeyedSubscript:v130];

    v127 = v152;
  }
  BOOL v54 = v46 != 0;
  if (!v46) {
    goto LABEL_173;
  }
  if ((v157 & 0x2C) != 0)
  {
    v131 = [v4 itemID];
    v132 = [v4 serverZone];
    v133 = [v132 zoneID];
    v134 = [v131 pcsChainDocumentStructureReferenceInZoneID:v133];
    [v46 setParent:v134];

    v127 = v152;
  }
  v135 = brc_bread_crumbs();
  v136 = brc_default_log();
  if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
  {
    if ((v157 & 0x2C) != 0) {
      v147 = "pcs chained ";
    }
    else {
      v147 = "";
    }
    v148 = [v46 description];
    *(_DWORD *)buf = 136315650;
    v163 = v147;
    __int16 v164 = 2112;
    v165 = v148;
    __int16 v166 = 2112;
    v167 = v135;
    _os_log_debug_impl(&dword_23FA42000, v136, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sversion record %@%@", buf, 0x20u);

    v127 = v152;
  }

  v137 = brc_bread_crumbs();
  v138 = brc_default_log();
  if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
  {
    v149 = "";
    *(_DWORD *)buf = 138412802;
    v163 = (const char *)v4;
    if (v6) {
      v149 = "\n(dead in server truth)";
    }
    __int16 v164 = 2080;
    v165 = v149;
    __int16 v166 = 2112;
    v167 = v137;
    _os_log_debug_impl(&dword_23FA42000, v138, OS_LOG_TYPE_DEBUG, "[DEBUG] for %@%s%@", buf, 0x20u);
  }

  v44 = v159;
  v139 = [v159 recordsToSave];
  [v139 addObject:v46];

  if (v158)
  {
    v140 = [v159 recordsNeedingUpdatedSharingProtectionInfo];
LABEL_172:
    v143 = v140;
    [v140 addObject:v46];

    goto LABEL_173;
  }
  if (v153)
  {
    v140 = [v159 recordsNeedingNewSharingProtectionInfo];
    goto LABEL_172;
  }
LABEL_173:

LABEL_62:
  if ([v4 hasShareIDAndIsOwnedByMe])
  {
    v55 = [v4 asShareableItem];
    [(BRCSyncUpOperationBuilder *)self handleEditOfSharedItem:v55];
  }
  if (!v27)
  {
    if (v54)
    {
LABEL_85:
      char v69 = [v4 isInDocumentScope];
      uint64_t v49 = v154;
      if ([v4 isFromInitialScan])
      {
        id v70 = [(BRCSyncUpOperationBuilder *)self defaults];
        [v70 syncUpInitialItemCost];
      }
      else
      {
        int v72 = [v4 isKnownByServer];
        uint64_t v73 = [(BRCSyncUpOperationBuilder *)self defaults];
        id v70 = v73;
        if (v72)
        {
          if (v69) {
            [v73 syncUpDocumentEditCost];
          }
          else {
            [v73 syncUpDataEditCost];
          }
        }
        else if (v69)
        {
          [v73 syncUpDocumentCreateCost];
        }
        else
        {
          [v73 syncUpDataCreateCost];
        }
      }
      float v50 = v71;

      goto LABEL_182;
    }
    v53 = [v44 serverZone];
    [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v53];
    float v50 = v67;
    goto LABEL_122;
  }
  id v56 = [v44 stageID];
  v57 = [(BRCSyncUpOperationBuilder *)self _generateSaltGetterBlock];
  v58 = [v4 structureRecordBeingDeadInServerTruth:v6 stageID:v56 shouldPCSChainStatus:v157 saltGetter:v57 childBasehashSaltGetter:0];

  if (!v58)
  {
    v46 = 0;
    float v50 = -1.0;
    goto LABEL_166;
  }
  uint64_t v59 = brc_bread_crumbs();
  v60 = brc_default_log();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    v119 = "";
    if (v157 == 2) {
      v119 = "half chained ";
    }
    if ((v157 & 0x2C) != 0) {
      v120 = "pcs chained ";
    }
    else {
      v120 = v119;
    }
    v121 = [v58 description];
    *(_DWORD *)buf = 136315650;
    v163 = v120;
    __int16 v164 = 2112;
    v165 = v121;
    __int16 v166 = 2112;
    v167 = v59;
    _os_log_debug_impl(&dword_23FA42000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sdocument structure record %@%@", buf, 0x20u);
  }
  v61 = brc_bread_crumbs();
  v62 = brc_default_log();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    v122 = "";
    *(_DWORD *)buf = 138412802;
    v163 = (const char *)v4;
    if (v6) {
      v122 = "\n(dead in server truth)";
    }
    __int16 v164 = 2080;
    v165 = v122;
    __int16 v166 = 2112;
    v167 = v61;
    _os_log_debug_impl(&dword_23FA42000, v62, OS_LOG_TYPE_DEBUG, "[DEBUG] for %@%s%@", buf, 0x20u);
  }

  v63 = [v44 recordsToSave];
  [v63 addObject:v58];

  if (v158)
  {
    v64 = [v44 recordsNeedingUpdatedSharingProtectionInfo];
  }
  else
  {
    if (!v153) {
      goto LABEL_83;
    }
    v64 = [v44 recordsNeedingNewSharingProtectionInfo];
  }
  uint64_t v68 = v64;
  [v64 addObject:v58];

LABEL_83:
  if (v54)
  {
    v46 = v58;
    goto LABEL_85;
  }
  if ([v4 isFromInitialScan])
  {
    v74 = [(BRCSyncUpOperationBuilder *)self defaults];
    [v74 syncUpInitialItemCost];
    float v50 = v75;

    v46 = v58;
    goto LABEL_166;
  }
  int v106 = [v4 isKnownByServer];
  v107 = [(BRCSyncUpOperationBuilder *)self defaults];
  v108 = v107;
  uint64_t v49 = v154;
  if (v106) {
    [v107 syncUpStructureEditCost];
  }
  else {
    [v107 syncUpStructureCreateCost];
  }
  float v50 = v109;

  v46 = v58;
LABEL_182:

  return v50;
}

- (float)addEditOfFinderBookmark:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 isDeadOrMissingInServerTruth];
  if (v5)
  {
    BOOL v6 = 1;
    BOOL v7 = 1;
  }
  else
  {
    BOOL v6 = ([v4 localDiffs] & 0x3FFE) != 0;
    BOOL v7 = ([v4 localDiffs] & 0x1FE0000) != 0;
  }
  uint64_t v8 = [(BRCSyncUpOperationBuilder *)self shouldPCSChainStatusForItem:v4];
  char v9 = v8 & 0x2C;
  int v10 = (v8 & 0x2C) != 0 || v6;
  BOOL v11 = [v4 currentVersion];
  int v12 = [v11 uploadedAssets];

  if (v12)
  {
LABEL_13:
    if (((v7 | v10) & 1) == 0)
    {
      __int16 v21 = [(BRCSyncUpOperationBuilder *)self op];
      float v22 = [v21 serverZone];
      [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v22];
      float v15 = v23;

LABEL_38:
      goto LABEL_39;
    }
    uint64_t v16 = [(BRCSyncUpOperationBuilder *)self _getSaltForItem:v4];
    if (v7)
    {
      id v46 = 0;
      char v17 = objc_msgSend(v12, "serializeVersion:diffs:deadInServerTruth:basehashSalt:error:", v4, objc_msgSend(v4, "localDiffs"), v5, v16, &v46);
      uint64_t v18 = (char *)v46;
      if ((v17 & 1) == 0)
      {
        brc_bread_crumbs();
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        int v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v48 = v18;
          __int16 v49 = 2112;
          float v50 = (const char *)v4;
          __int16 v51 = 2112;
          id v52 = v19;
          _os_log_debug_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Error creating record %@ for item %@%@", buf, 0x20u);
        }

        float v15 = -1.0;
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    if (v10)
    {
      char v43 = v8 & 0x2C;
      v44 = v18;
      uint64_t v24 = [v4 localDiffs];
      uint64_t v25 = [(BRCSyncUpOperationBuilder *)self op];
      int v26 = [v25 stageID];
      int v27 = [(BRCSyncUpOperationBuilder *)self _generateSaltGetterBlock];
      id v45 = 0;
      LOBYTE(v24) = [v12 serializeStatInfo:v4 diffs:v24 stageID:v26 deadInServerTruth:v5 shouldPCSChainStatus:v8 basehashSaltGetter:v27 childBasehashSaltGetter:0 error:&v45];
      id v19 = v45;

      if ((v24 & 1) == 0)
      {
        uint64_t v35 = brc_bread_crumbs();
        int v36 = brc_default_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v48 = (const char *)v19;
          __int16 v49 = 2112;
          float v50 = (const char *)v4;
          __int16 v51 = 2112;
          id v52 = v35;
          _os_log_debug_impl(&dword_23FA42000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] Error creating record %@ for item %@%@", buf, 0x20u);
        }

        float v15 = -1.0;
        uint64_t v18 = v44;
        goto LABEL_36;
      }

      uint64_t v18 = v44;
      char v9 = v43;
    }
    float v15 = -1.0;
    if (![(BRCSyncUpOperationBuilder *)self _validateSharedDocumentFieldsForRecord:v12 item:v4])
    {
LABEL_37:

      goto LABEL_38;
    }
    uint64_t v28 = brc_bread_crumbs();
    int v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      if (v9) {
        int v40 = "pcs chained ";
      }
      else {
        int v40 = "";
      }
      int v41 = [v12 description];
      *(_DWORD *)buf = 136315650;
      v48 = v40;
      __int16 v49 = 2112;
      float v50 = v41;
      __int16 v51 = 2112;
      id v52 = v28;
      _os_log_debug_impl(&dword_23FA42000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sfinder alias record %@%@", buf, 0x20u);
    }
    unsigned int v30 = brc_bread_crumbs();
    int v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v42 = "";
      *(_DWORD *)buf = 138412802;
      v48 = (const char *)v4;
      if (v5) {
        uint64_t v42 = "\n(dead in server truth)";
      }
      __int16 v49 = 2080;
      float v50 = v42;
      __int16 v51 = 2112;
      id v52 = v30;
      _os_log_debug_impl(&dword_23FA42000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] for %@%s%@", buf, 0x20u);
    }

    char v32 = [(BRCSyncUpOperationBuilder *)self op];
    v33 = [v32 recordsToSave];
    [v33 addObject:v12];

    if ([v4 isFromInitialScan])
    {
      id v19 = [(BRCSyncUpOperationBuilder *)self defaults];
      [v19 syncUpInitialItemCost];
    }
    else
    {
      int v37 = [v4 isKnownByServer];
      int v38 = [(BRCSyncUpOperationBuilder *)self defaults];
      id v19 = v38;
      if (v37) {
        [v38 syncUpStructureEditCost];
      }
      else {
        [v38 syncUpStructureCreateCost];
      }
    }
    float v15 = v34;
LABEL_36:

    goto LABEL_37;
  }
  if (![v4 contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:v5])
  {
    int v12 = [v4 baseRecord];
    goto LABEL_13;
  }
  char v13 = brc_bread_crumbs();
  BOOL v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[BRCSyncUpOperationBuilder addEditOfDocument:]();
  }

  [v4 markForceUpload];
  [v4 saveToDB];
  float v15 = -1.0;
LABEL_39:

  return v15;
}

- (float)addDeletionOfFinderBookmark:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCSyncUpOperationBuilder *)self op];
  BOOL v6 = [v5 deletedRecordIDs];
  BOOL v7 = [v4 documentRecordID];

  [v6 addObject:v7];
  uint64_t v8 = [(BRCSyncUpOperationBuilder *)self defaults];
  [v8 syncUpDocumentDeleteCost];
  float v10 = v9;

  return v10;
}

- (float)addEditOfSymlink:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 isDeadOrMissingInServerTruth];
  uint64_t v6 = [(BRCSyncUpOperationBuilder *)self shouldPCSChainStatusForItem:v4];
  BOOL v7 = [(BRCSyncUpOperationBuilder *)self op];
  uint64_t v8 = [v7 stageID];
  float v9 = [(BRCSyncUpOperationBuilder *)self _generateSaltGetterBlock];
  float v10 = [v4 structureRecordBeingDeadInServerTruth:v5 stageID:v8 shouldPCSChainStatus:v6 saltGetter:v9 childBasehashSaltGetter:0];

  if (v10)
  {
    BOOL v11 = brc_bread_crumbs();
    int v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if ((v6 & 0x2C) != 0) {
        __int16 v21 = "pcs chained ";
      }
      else {
        __int16 v21 = "";
      }
      uint64_t v22 = [v10 description];
      float v23 = (void *)v22;
      uint64_t v24 = "\n(dead in server truth)";
      int v25 = 136315906;
      int v26 = v21;
      if (!v5) {
        uint64_t v24 = "";
      }
      __int16 v27 = 2112;
      uint64_t v28 = v22;
      __int16 v29 = 2080;
      unsigned int v30 = v24;
      __int16 v31 = 2112;
      char v32 = v11;
      _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %ssymlink record %@%s%@", (uint8_t *)&v25, 0x2Au);
    }
    char v13 = [(BRCSyncUpOperationBuilder *)self op];
    BOOL v14 = [v13 recordsToSave];
    [v14 addObject:v10];

    if ([v4 isFromInitialScan])
    {
      float v15 = [(BRCSyncUpOperationBuilder *)self defaults];
      [v15 syncUpInitialItemCost];
    }
    else
    {
      int v18 = [v4 isKnownByServer];
      id v19 = [(BRCSyncUpOperationBuilder *)self defaults];
      float v15 = v19;
      if (v18) {
        [v19 syncUpStructureEditCost];
      }
      else {
        [v19 syncUpStructureCreateCost];
      }
    }
    float v17 = v16;
  }
  else
  {
    float v17 = -1.0;
  }

  return v17;
}

- (float)addItem:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 appLibrary];

  if (!v5)
  {
    id v19 = +[BRCAutoBugCaptureReporter sharedABCReporter];
    [v19 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"SyncUp" withContext:@"AppLibrary is nil"];

    int v20 = [(BRCSyncUpOperationBuilder *)self session];
    __int16 v21 = [v20 analyticsReporter];
    [v21 aggregateReportForAppTelemetryIdentifier:216 error:0];

    float v6 = -1.0;
    goto LABEL_18;
  }
  [(BRCSyncUpOperationBuilder *)self prepareAppLibraryRootSyncUpForItem:v4];
  float v6 = -1.0;
  if ([(BRCSyncUpOperationBuilder *)self checkIfSyncAllowedInSharedZoneForItem:v4]&& ![(BRCSyncUpOperationBuilder *)self _checkIfShouldDedicateOpToSaltingBasehashItem:v4]&& ![(BRCSyncUpOperationBuilder *)self _checkIfShouldDedicateOpToPCSChainingItem:v4])
  {
    BOOL v7 = [(BRCSyncUpOperationBuilder *)self op];
    uint64_t v8 = [v7 serverZone];
    float v9 = [v8 mangledID];
    float v10 = +[BRCUserDefaults defaultsForMangledID:v9];
    int v11 = [v10 preventRecordSyncWithoutDiffs];

    if (!v11) {
      goto LABEL_10;
    }
    int v12 = [v4 clientZone];
    char v13 = [v4 itemID];
    BOOL v14 = [v12 serverItemByItemID:v13];

    if (!v14
      || (uint64_t v15 = [v4 diffAgainstServerItem:v14],
          ([v4 metadataSyncUpMask:1] & v15) != 0)
      || ([v4 forceNeedsSyncUpWithoutDiffs] & 1) != 0)
    {

LABEL_10:
      if ([v4 isDead])
      {
        if ([v4 isDeadOrMissingInServerTruth])
        {
          if ([v4 isSharedToMeTopLevelItem])
          {
            float v16 = [v4 asSharedToMeTopLevelItem];
            [v16 insertTombstoneAliasRecordInZone:0];
          }
          float v17 = brc_bread_crumbs();
          int v18 = brc_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[BRCSyncUpOperationBuilder addItem:]();
          }

          [v4 markNeedsDeleteWhenAlreadyDeadInServerTruth];
          [v4 saveToDB];
          goto LABEL_18;
        }
        uint64_t v46 = 0;
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperationBuilder addItem:]", 1156, &v46);
        __int16 v27 = brc_bread_crumbs();
        uint64_t v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v42 = v46;
          char v43 = [v4 st];
          v44 = BRCPrettyPrintEnumWithContext((int)[v43 type], (uint64_t)&brc_item_type_pretty_entries, 0);
          *(_DWORD *)buf = 134218754;
          uint64_t v50 = v42;
          __int16 v51 = 2112;
          id v52 = v44;
          __int16 v53 = 2112;
          id v54 = v4;
          __int16 v55 = 2112;
          id v56 = v27;
          _os_log_debug_impl(&dword_23FA42000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Deleting %@ record for %@%@", buf, 0x2Au);
        }
        if ([v4 isSharedToMeTopLevelItem])
        {
          __int16 v29 = [v4 asSharedToMeTopLevelItem];
          [(BRCSyncUpOperationBuilder *)self addDeletionOfSharedTopLevelItem:v29];
        }
        else if ([v4 isFinderBookmark])
        {
          __int16 v29 = [v4 asFinderBookmark];
          [(BRCSyncUpOperationBuilder *)self addDeletionOfFinderBookmark:v29];
        }
        else if ([v4 isDocument])
        {
          __int16 v29 = [v4 asDocument];
          [(BRCSyncUpOperationBuilder *)self addDeletionOfDocument:v29];
        }
        else if ([v4 isDirectory])
        {
          __int16 v29 = [v4 asDirectory];
          [(BRCSyncUpOperationBuilder *)self addDeletionOfDirectory:v29];
        }
        else
        {
          if (![v4 isBRAlias])
          {
            [(BRCSyncUpOperationBuilder *)self addDeletionOfItem:v4];
            float v6 = v45;
            goto LABEL_49;
          }
          __int16 v29 = [v4 asBRAlias];
          [(BRCSyncUpOperationBuilder *)self addDeletionOfAlias:v29];
        }
        float v6 = v30;

LABEL_49:
        __brc_leave_section(&v46);
LABEL_50:
        if (v6 >= 0.0)
        {
          int v39 = [(BRCSyncUpOperationBuilder *)self op];
          int v40 = [v39 serverZone];
          [v4 prepareForSyncUpInZone:v40];
        }
        goto LABEL_18;
      }
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperationBuilder addItem:]", 1172, &v46);
      float v23 = brc_bread_crumbs();
      uint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v36 = v46;
        int v37 = [v4 itemID];
        int v38 = [v37 debugItemIDString];
        *(_DWORD *)buf = 134218498;
        uint64_t v50 = v36;
        __int16 v51 = 2112;
        id v52 = v38;
        __int16 v53 = 2112;
        id v54 = v23;
        _os_log_debug_impl(&dword_23FA42000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx preparing sync-up of %@%@", buf, 0x20u);
      }
      if ([v4 isSharedToMeTopLevelItem])
      {
        int v25 = [v4 asSharedToMeTopLevelItem];
        [(BRCSyncUpOperationBuilder *)self addEditOfSharedTopLevelItem:v25];
      }
      else if ([v4 isFinderBookmark])
      {
        int v25 = [v4 asFinderBookmark];
        [(BRCSyncUpOperationBuilder *)self addEditOfFinderBookmark:v25];
      }
      else if ([v4 isSymLink])
      {
        int v25 = [v4 asSymlink];
        [(BRCSyncUpOperationBuilder *)self addEditOfSymlink:v25];
      }
      else if ([v4 isDocument])
      {
        int v25 = [v4 asDocument];
        [(BRCSyncUpOperationBuilder *)self addEditOfDocument:v25];
      }
      else
      {
        if (![v4 isDirectory])
        {
          int v25 = brc_bread_crumbs();
          int v41 = brc_default_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
            -[BRCSyncUpOperationBuilder addItem:]();
          }

          float v6 = 0.0;
          goto LABEL_45;
        }
        int v25 = [v4 asDirectory];
        [(BRCSyncUpOperationBuilder *)self addEditOfDirectory:v25];
      }
      float v6 = v26;
LABEL_45:

      __brc_leave_section(&v46);
      goto LABEL_50;
    }
    __int16 v31 = brc_bread_crumbs();
    char v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v50 = (uint64_t)v4;
      __int16 v51 = 2112;
      id v52 = v14;
      __int16 v53 = 2112;
      id v54 = v31;
      _os_log_impl(&dword_23FA42000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Faking sync for item because it doesn't have field differences with the server item %@ vs %@%@", buf, 0x20u);
    }

    uint64_t v33 = [(BRCSyncUpOperationBuilder *)self op];
    float v34 = [v33 serverZone];
    [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:v14 inZone:v34];
    float v6 = v35;
  }
LABEL_18:

  return v6;
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BRCSyncUpOperation)op
{
  return self->_op;
}

- (void)setOp:(id)a3
{
}

- (BRCUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (BRCLocalItem)itemNeedingPCSChaining
{
  return self->_itemNeedingPCSChaining;
}

- (BRCDirectoryItem)itemNeedingBasehashSalting
{
  return self->_itemNeedingBasehashSalting;
}

- (NSData)rootChildBasehashSalt
{
  return self->_rootChildBasehashSalt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemNeedingBasehashSalting, 0);
  objc_storeStrong((id *)&self->_itemNeedingPCSChaining, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_op, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_rootChildBasehashSalt, 0);
  objc_storeStrong((id *)&self->_parentItemIDToChildBasehashSalt, 0);
  objc_storeStrong((id *)&self->_halfChainedParentIDWhitelist, 0);
  objc_storeStrong((id *)&self->_fullyChainedParentIDWhitelist, 0);
}

- (void)_checkIfShouldDedicateOpToSaltingBasehashItem:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _parentItemIDToChildBasehashSalt[item.itemID] == nil%@", v2, v3, v4, v5, v6);
}

- (void)_checkIfShouldDedicateOpToSaltingBasehashItem:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 debugItemIDString];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] Sync: Dedicating sync op to metadata salting %@%@", v4, v5, v6, v7, v8);
}

- (void)_checkIfShouldDedicateOpToSaltingBasehashItem:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _parentItemIDToChildBasehashSalt[parentItemID] == nil%@", v2, v3, v4, v5, v6);
}

- (void)_checkIfShouldDedicateOpToPCSChainingItem:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 itemID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] Sync: Dedicating sync op to pcs chaining %@%@", v4, v5, v6, v7, v8);
}

- (void)checkIfSyncAllowedInSharedZoneForItem:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Not allowing re-creation of shared to me top level item when the item is dead in the server truth%@", v2, v3, v4, v5, v6);
}

- (void)checkIfSyncAllowedInSharedZoneForItem:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Waiting on server full sync before we fake sync shared to me top level item which is missing in the server truth%@", v2, v3, v4, v5, v6);
}

- (void)checkIfSyncAllowedInSharedZoneForItem:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] shared document is read-only, do not sync%@", v2, v3, v4, v5, v6);
}

- (void)addDeletionOfItem:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !item.isSharedToMeTopLevelItem%@", v2, v3, v4, v5, v6);
}

- (void)_getSaltForItem:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: parentItemID != nil%@", v2, v3, v4, v5, v6);
}

- (void)addEditOfSharedTopLevelItem:.cold.1()
{
  v0 = [0 description];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v1, v2, "[DEBUG] Fake syncing up shared folder record %@%@", v3, v4, v5, v6, v7);
}

- (void)addEditOfSharedTopLevelItem:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: unsupported top level item kind%@", v2, v3, v4, v5, v6);
}

- (void)addDeletionOfSharedTopLevelItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Deleting alias in private zone %@%@");
}

- (void)prepareAppLibraryRootSyncUpForItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Syncing up root app library record %@%@");
}

- (void)fakeSyncForItem:serverItem:inZone:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: We should never fake sync for an item being copied to a new zone that isn't a fault: %@%@");
}

- (void)fakeSyncForItem:serverItem:inZone:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Also faking sync in side car for child item not known to the server %@%@");
}

- (void)handleEditOfSharedItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Unsharing %@%@");
}

- (void)handleEditOfSharedItem:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Editing name on shareID %@%@");
}

- (void)addEditOfDirectory:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: record.encryptedValues[kBRRecordKeyChildBasehashSalt]%@", v2, v3, v4, v5, v6);
}

- (void)addEditOfDocument:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] re-uploading uploaded record: %@%@", v1, 0x16u);
}

- (void)addEditOfDocument:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] forcing upload of %@\n(dead in server truth)%@");
}

- (void)addEditOfDocument:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: package with no uploaded content - %@%@");
}

- (void)addEditOfDocument:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: File with no content signature - %@%@");
}

- (void)addEditOfDocument:.cold.5()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] thumbnail not found.  Force upload again%@", v1, 0xCu);
}

- (void)addEditOfDocument:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] will pcs chain records%@", v2, v3, v4, v5, v6);
}

- (void)addEditOfDocument:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] shared document is read-only, do not sync its version%@", v2, v3, v4, v5, v6);
}

- (void)addEditOfDocument:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] We need to update sharing info for this reset item%@", v2, v3, v4, v5, v6);
}

- (void)addItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Deleting dead record already dead in the server truth %@%@");
}

- (void)addItem:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: asked to syncup an unkown item type: %@%@");
}

@end