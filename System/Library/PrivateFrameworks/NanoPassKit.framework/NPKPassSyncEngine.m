@interface NPKPassSyncEngine
+ (BOOL)supportsSecureCoding;
- (BOOL)requireAppleAccountForPaymentPasses;
- (NPKPassSyncChange)candidateChange;
- (NPKPassSyncChange)processingChange;
- (NPKPassSyncEngine)initWithCoder:(id)a3;
- (NPKPassSyncEngine)initWithRole:(unint64_t)a3;
- (NPKPassSyncEngineDataSource)dataSource;
- (NPKPassSyncEngineDelegate)delegate;
- (NPKPassSyncState)backupState;
- (NPKPassSyncState)candidateState;
- (NPKPassSyncState)libraryState;
- (NPKPassSyncState)reconciledState;
- (NSString)engineName;
- (unint64_t)engineRole;
- (void)_engineStateChanged;
- (void)_finishedProcessingChange:(id)a3;
- (void)_handleStateChange:(id)a3 attemptRecoverReconcileStateVersionMismatch:(BOOL)a4;
- (void)_receivedStateChangeProcessed:(id)a3 changeAccepted:(BOOL)a4;
- (void)_requestAddPassData:(id)a3 forSyncStateItem:(id)a4 completion:(id)a5;
- (void)_requestRemovePassWithUniqueID:(id)a3 completion:(id)a4;
- (void)_requestUpdatePassData:(id)a3 forSyncStateItem:(id)a4 baseManifestHashForPartialUpdate:(id)a5 remoteAssetsForPartialUpdate:(id)a6 completion:(id)a7;
- (void)_sendNextStateChange;
- (void)_sendProposedReconciledState:(id)a3;
- (void)_sendReconciledStateAcceptedWithHash:(id)a3;
- (void)_sendReconciledStateUnrecognizedWithHash:(id)a3 version:(unint64_t)a4 currentPassSyncState:(id)a5;
- (void)_sendStateChange:(id)a3;
- (void)_sendStateChangeProcessedWithUUID:(id)a3 changeAccepted:(BOOL)a4 fullPassRequired:(BOOL)a5;
- (void)_shouldProcessAddOrUpdateChangeOfType:(unint64_t)a3 changeSyncStateItem:(id)a4 librarySyncStateItem:(id)a5 reconciledSyncStateItem:(id)a6 candidateChange:(id)a7 shouldApplyToPassLibrary:(BOOL *)a8 shouldApplyToReconciledState:(BOOL *)a9;
- (void)_unexpectedEventOccurred;
- (void)encodeWithCoder:(id)a3;
- (void)handleProposedReconciledState:(id)a3;
- (void)handleReconciledStateAcceptedWithHash:(id)a3;
- (void)handleReconciledStateUnrecognizedWithHash:(id)a3 version:(unint64_t)a4 passSyncState:(id)a5;
- (void)handleStateChange:(id)a3;
- (void)handleStateChangeProcessedWithUUID:(id)a3 changeAccepted:(BOOL)a4 fullPassRequired:(BOOL)a5;
- (void)setBackupState:(id)a3;
- (void)setCandidateChange:(id)a3;
- (void)setCandidateState:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLibraryState:(id)a3;
- (void)setMinSyncStateVersion:(unint64_t)a3;
- (void)setProcessingChange:(id)a3;
- (void)setReconciledState:(id)a3;
- (void)setRequireAppleAccountForPaymentPasses:(BOOL)a3;
- (void)syncIfNecessary;
@end

@implementation NPKPassSyncEngine

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPassSyncEngine)initWithRole:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPassSyncEngine;
  result = [(NPKPassSyncEngine *)&v5 init];
  if (result)
  {
    result->_engineRole = a3;
    result->_requireAppleAccountForPaymentPasses = 1;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  libraryState = self->_libraryState;
  id v5 = a3;
  [v5 encodeObject:libraryState forKey:@"libraryState"];
  [v5 encodeObject:self->_reconciledState forKey:@"reconciledState"];
  [v5 encodeObject:self->_backupState forKey:@"backupState"];
  [v5 encodeObject:self->_candidateState forKey:@"candidateState"];
  id v7 = (id)[(NPKPassSyncChange *)self->_candidateChange copy];
  [v7 setPassData:0];
  [v5 encodeObject:v7 forKey:@"candidateChange"];
  if (self->_engineRole) {
    v6 = @"Companion";
  }
  else {
    v6 = @"Watch";
  }
  [v5 encodeObject:v6 forKey:@"engineRole"];
}

- (NPKPassSyncEngine)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NPKPassSyncEngine;
  id v5 = [(NPKPassSyncEngine *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryState"];
    libraryState = v5->_libraryState;
    v5->_libraryState = (NPKPassSyncState *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reconciledState"];
    reconciledState = v5->_reconciledState;
    v5->_reconciledState = (NPKPassSyncState *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backupState"];
    backupState = v5->_backupState;
    v5->_backupState = (NPKPassSyncState *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidateState"];
    candidateState = v5->_candidateState;
    v5->_candidateState = (NPKPassSyncState *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidateChange"];
    candidateChange = v5->_candidateChange;
    v5->_candidateChange = (NPKPassSyncChange *)v14;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"engineRole"];
    v5->_engineRole = [v16 isEqualToString:@"Companion"];
  }
  return v5;
}

- (NSString)engineName
{
  if (self->_engineRole) {
    return (NSString *)@"Companion";
  }
  else {
    return (NSString *)@"Watch";
  }
}

- (void)syncIfNecessary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(NPKPassSyncEngine *)self libraryState];
  id v4 = [(NPKPassSyncEngine *)self reconciledState];
  char v5 = PKEqualObjects();
  uint64_t v6 = pk_Sync_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = pk_Sync_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [(NPKPassSyncEngine *)self engineName];
        int v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Sync engine (%@): No sync necessary.", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v10 = pk_Sync_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(NPKPassSyncEngine *)self engineName];
        int v12 = 138412802;
        v13 = v11;
        __int16 v14 = 2112;
        v15 = v3;
        __int16 v16 = 2112;
        v17 = v4;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Sync is necessary.\n libraryState:%@\n reconciledState:%@", (uint8_t *)&v12, 0x20u);
      }
    }
    [(NPKPassSyncEngine *)self _sendNextStateChange];
  }
}

- (void)handleStateChange:(id)a3
{
}

- (void)_handleStateChange:(id)a3 attemptRecoverReconcileStateVersionMismatch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v143 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = pk_Sync_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    v9 = pk_Sync_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v104 = [(NPKPassSyncEngine *)self engineName];
      v101 = [v6 changeUUID];
      v97 = [v6 reconciledStateHash];
      uint64_t v10 = [v97 hexEncoding];
      uint64_t v94 = [v6 reconciledStateVersion];
      v11 = NPKPassSyncChangeTypeToString([v6 changeType]);
      [v6 uniqueID];
      int v12 = v96 = self;
      v93 = [v6 syncStateItem];
      v95 = [v6 passData];
      v13 = [v95 npkDescription];
      __int16 v14 = [v6 baseManifestHashForPartialUpdate];
      v15 = [v14 hexEncoding];
      [v6 remoteAssetsForPartialUpdate];
      __int16 v16 = v98 = v4;
      *(_DWORD *)buf = 138414594;
      v124 = v104;
      __int16 v125 = 2112;
      v126 = v101;
      __int16 v127 = 2112;
      uint64_t v128 = (uint64_t)v10;
      __int16 v129 = 2048;
      uint64_t v130 = v94;
      __int16 v131 = 2112;
      uint64_t v132 = (uint64_t)v11;
      __int16 v133 = 2112;
      v134 = v12;
      __int16 v135 = 2112;
      v136 = v93;
      __int16 v137 = 2112;
      v138 = v13;
      __int16 v139 = 2112;
      v140 = v15;
      __int16 v141 = 2112;
      v142 = v16;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Received state change\n\tChange UUID: %@\n\tReconciled state hash: %@\n\tVersion:%lu\n\tChange type: %@\n\tunique ID: %@\n\tsync state item: %@\n\tpass data: %@\n\tbase manifest hash for partial update: %@\n\t remote assets for partial update: %@", buf, 0x66u);

      BOOL v4 = v98;
      self = v96;
    }
  }
  v17 = [(NPKPassSyncEngine *)self backupState];
  uint64_t v18 = v17;
  if (v17)
  {
    v19 = [v17 syncStateHash];
    v20 = [(NPKPassSyncEngine *)self reconciledState];
    v21 = [v20 syncStateHash];

    v22 = [v6 reconciledStateHash];
    if (PKEqualObjects())
    {
    }
    else
    {
      v23 = [v6 reconciledStateHash];
      int v24 = PKEqualObjects();

      if (v24)
      {
        v25 = pk_Sync_log();
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

        if (v26)
        {
          v27 = pk_Sync_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [(NPKPassSyncEngine *)self engineName];
            *(_DWORD *)buf = 138412802;
            v124 = v28;
            __int16 v125 = 2112;
            v126 = v19;
            __int16 v127 = 2112;
            uint64_t v128 = (uint64_t)v21;
            _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_DEFAULT, "Warning: Sync state engine (%@): State change based on backup hash (%@), not reconciled hash (%@); moving "
              "backup to reconciled",
              buf,
              0x20u);
          }
        }
        [(NPKPassSyncEngine *)self setReconciledState:v18];
        [(NPKPassSyncEngine *)self setBackupState:0];
        [(NPKPassSyncEngine *)self _unexpectedEventOccurred];
      }
    }
  }
  v29 = [v6 reconciledStateHash];
  v30 = [(NPKPassSyncEngine *)self reconciledState];
  v31 = [v30 syncStateHash];
  if (PKEqualObjects())
  {
    uint64_t v32 = [v6 reconciledStateVersion];
    v33 = [(NPKPassSyncEngine *)self reconciledState];
    BOOL v34 = v4;
    uint64_t v35 = [v33 version];

    BOOL v36 = v32 == v35;
    BOOL v4 = v34;
    if (!v36) {
      goto LABEL_27;
    }
    unint64_t v37 = [v6 changeType];
    v38 = [v6 uniqueID];
    v121[0] = MEMORY[0x263EF8330];
    v121[1] = 3221225472;
    v121[2] = __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke;
    v121[3] = &unk_2644D5500;
    v121[4] = self;
    id v39 = v6;
    id v122 = v39;
    v105 = (void (**)(void, void, void))MEMORY[0x223C37380](v121);
    v117[0] = MEMORY[0x263EF8330];
    v117[1] = 3221225472;
    v117[2] = __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_73;
    v117[3] = &unk_2644D38A8;
    unint64_t v120 = v37;
    v117[4] = self;
    id v40 = v39;
    id v118 = v40;
    id v41 = v38;
    id v119 = v41;
    v102 = (void (**)(void))MEMORY[0x223C37380](v117);
    v113[0] = MEMORY[0x263EF8330];
    v113[1] = 3221225472;
    v113[2] = __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_75;
    v113[3] = &unk_2644D5528;
    unint64_t v116 = v37;
    v113[4] = self;
    id v42 = v40;
    id v114 = v42;
    id v43 = v41;
    id v115 = v43;
    v44 = (void (**)(void, void))MEMORY[0x223C37380](v113);
    __int16 v112 = 0;
    if (v37 >= 2)
    {
      if (v37 != 2) {
        goto LABEL_50;
      }
      __int16 v112 = 257;
    }
    else
    {
      v45 = [(NPKPassSyncEngine *)self libraryState];
      v46 = [v45 syncStateItems];
      v47 = [v46 objectForKey:v43];

      v48 = [(NPKPassSyncEngine *)self reconciledState];
      v49 = [v48 syncStateItems];
      [v49 objectForKey:v43];
      id v99 = v43;
      v51 = v50 = v44;

      v52 = [(NPKPassSyncEngine *)self candidateChange];
      v53 = [v42 syncStateItem];
      [(NPKPassSyncEngine *)self _shouldProcessAddOrUpdateChangeOfType:v37 changeSyncStateItem:v53 librarySyncStateItem:v47 reconciledSyncStateItem:v51 candidateChange:v52 shouldApplyToPassLibrary:(char *)&v112 + 1 shouldApplyToReconciledState:&v112];

      v44 = v50;
      id v43 = v99;

      if (!HIBYTE(v112))
      {
        if ((_BYTE)v112)
        {
          v54 = pk_Sync_log();
          BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);

          if (v55)
          {
            v56 = pk_Sync_log();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              v57 = [(NPKPassSyncEngine *)self engineName];
              v58 = [v42 changeUUID];
              *(_DWORD *)buf = 138412546;
              v124 = v57;
              __int16 v125 = 2112;
              v126 = v58;
              _os_log_impl(&dword_21E92F000, v56, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Not applying change to pass library, but applying to reconciled state and accepting\n\tChange UUID: %@", buf, 0x16u);
            }
          }
          v59 = v102;
          v102[2](v102);
          v60 = v105;
          v105[2](v105, 1, 0);
LABEL_55:

          goto LABEL_56;
        }
LABEL_50:
        v88 = pk_Sync_log();
        BOOL v89 = os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT);

        if (v89)
        {
          v90 = pk_Sync_log();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            v91 = [(NPKPassSyncEngine *)self engineName];
            v92 = [v42 changeUUID];
            *(_DWORD *)buf = 138412546;
            v124 = v91;
            __int16 v125 = 2112;
            v126 = v92;
            _os_log_impl(&dword_21E92F000, v90, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Rejecting change\n\tChange UUID: %@", buf, 0x16u);
          }
        }
        v60 = v105;
        v105[2](v105, 0, 0);
        v59 = v102;
        goto LABEL_55;
      }
    }
    v83 = pk_Sync_log();
    BOOL v84 = os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT);

    if (v84)
    {
      v85 = pk_Sync_log();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = [(NPKPassSyncEngine *)self engineName];
        v87 = [v42 changeUUID];
        *(_DWORD *)buf = 138412546;
        v124 = v86;
        __int16 v125 = 2112;
        v126 = v87;
        _os_log_impl(&dword_21E92F000, v85, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Applying change to pass library\n\tChange UUID: %@", buf, 0x16u);
      }
    }
    [(NPKPassSyncEngine *)self setProcessingChange:v42];
    v107[0] = MEMORY[0x263EF8330];
    v107[1] = 3221225472;
    v107[2] = __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_78;
    v107[3] = &unk_2644D5550;
    v107[4] = self;
    id v108 = v42;
    v60 = v105;
    v109 = v105;
    char v111 = v112;
    v59 = v102;
    v110 = v102;
    ((void (**)(void, void *))v44)[2](v44, v107);

    goto LABEL_55;
  }

LABEL_27:
  uint64_t v61 = [v6 reconciledStateVersion];
  v62 = [(NPKPassSyncEngine *)self reconciledState];
  uint64_t v63 = [v62 version];

  v64 = pk_Sync_log();
  BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);

  if (!v4 || v63 == v61)
  {
    if (v65)
    {
      v73 = pk_Sync_log();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        v74 = [(NPKPassSyncEngine *)self engineName];
        v106 = [v6 reconciledStateHash];
        v75 = [v106 hexEncoding];
        uint64_t v100 = [v6 reconciledStateVersion];
        v103 = [(NPKPassSyncEngine *)self reconciledState];
        v76 = [v103 syncStateHash];
        v77 = [v76 hexEncoding];
        v78 = [(NPKPassSyncEngine *)self reconciledState];
        uint64_t v79 = [v78 version];
        *(_DWORD *)buf = 138413314;
        v124 = v74;
        __int16 v125 = 2112;
        v126 = v75;
        __int16 v127 = 2048;
        uint64_t v128 = v100;
        __int16 v129 = 2112;
        uint64_t v130 = (uint64_t)v77;
        __int16 v131 = 2048;
        uint64_t v132 = v79;
        _os_log_impl(&dword_21E92F000, v73, OS_LOG_TYPE_DEFAULT, "Warning: Sync state engine (%@): Unrecognized reconciled state hash %@ version:%lu, current state hash:%@ version:%lu", buf, 0x34u);
      }
    }
    v80 = [v6 reconciledStateHash];
    uint64_t v81 = [v6 reconciledStateVersion];
    v82 = [(NPKPassSyncEngine *)self reconciledState];
    [(NPKPassSyncEngine *)self _sendReconciledStateUnrecognizedWithHash:v80 version:v81 currentPassSyncState:v82];

    [(NPKPassSyncEngine *)self _unexpectedEventOccurred];
  }
  else
  {
    if (v65)
    {
      v66 = pk_Sync_log();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        v67 = [(NPKPassSyncEngine *)self engineName];
        *(_DWORD *)buf = 138412290;
        v124 = v67;
        _os_log_impl(&dword_21E92F000, v66, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Attempt to recover from mismatch reconcile state", buf, 0xCu);
      }
    }
    -[NPKPassSyncEngine setMinSyncStateVersion:](self, "setMinSyncStateVersion:", [v6 reconciledStateVersion]);
    v68 = pk_Sync_log();
    BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);

    if (v69)
    {
      v70 = pk_Sync_log();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        v71 = [(NPKPassSyncEngine *)self engineName];
        v72 = [v6 uniqueID];
        *(_DWORD *)buf = 138412546;
        v124 = v71;
        __int16 v125 = 2112;
        v126 = v72;
        _os_log_impl(&dword_21E92F000, v70, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): handle second time change with UUID:%@", buf, 0x16u);
      }
    }
    [(NPKPassSyncEngine *)self _handleStateChange:v6 attemptRecoverReconcileStateVersionMismatch:0];
  }
LABEL_56:
}

void __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = pk_Sync_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    BOOL v8 = pk_Sync_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [*(id *)(a1 + 32) engineName];
      uint64_t v10 = [*(id *)(a1 + 40) changeUUID];
      v11 = [*(id *)(a1 + 32) reconciledState];
      int v14 = 138413314;
      v15 = v9;
      __int16 v16 = 1024;
      int v17 = a2;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 2112;
      v21 = v10;
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): State change processed\n\tChange accepted: %d\n\tFull pass required: %d\n\tChange UUID: %@\n\tNew reconciled state: %@", (uint8_t *)&v14, 0x2Cu);
    }
  }
  int v12 = *(void **)(a1 + 32);
  v13 = [*(id *)(a1 + 40) changeUUID];
  [v12 _sendStateChangeProcessedWithUUID:v13 changeAccepted:a2 fullPassRequired:a3];
}

void __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_73(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 2)
  {
    if (v2 != 2)
    {
      char v5 = 0;
      goto LABEL_7;
    }
    v3 = [*(id *)(a1 + 32) reconciledState];
    char v5 = [v3 passSyncStateByRemovingPassWithUniqueID:*(void *)(a1 + 48)];
  }
  else
  {
    v3 = [*(id *)(a1 + 32) reconciledState];
    BOOL v4 = [*(id *)(a1 + 40) syncStateItem];
    char v5 = [v3 passSyncStateByAddingOrUpdatingSyncStateItem:v4];
  }
LABEL_7:
  id v6 = [*(id *)(a1 + 32) reconciledState];
  BOOL v7 = pk_Sync_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    v9 = pk_Sync_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 32) engineName];
      v11 = [v6 syncStateHash];
      int v12 = [v11 hexEncoding];
      v13 = [v5 syncStateHash];
      int v14 = [v13 hexEncoding];
      int v15 = 138412802;
      __int16 v16 = v10;
      __int16 v17 = 2112;
      __int16 v18 = v12;
      __int16 v19 = 2112;
      __int16 v20 = v14;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Setting new backup and reconciled state\n\tBackup state hash: %@\n\tReconciled state hash: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  [*(id *)(a1 + 32) setBackupState:v6];
  [*(id *)(a1 + 32) setReconciledState:v5];
}

void __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  uint64_t v5 = *(void *)(a1 + 56);
  switch(v5)
  {
    case 2:
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 48);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_3;
      v17[3] = &unk_2644D4150;
      id v18 = v3;
      [v10 _requestRemovePassWithUniqueID:v11 completion:v17];
      v9 = v18;
      goto LABEL_6;
    case 1:
      int v12 = *(void **)(a1 + 32);
      v13 = [*(id *)(a1 + 40) passData];
      int v14 = [*(id *)(a1 + 40) syncStateItem];
      int v15 = [*(id *)(a1 + 40) baseManifestHashForPartialUpdate];
      __int16 v16 = [*(id *)(a1 + 40) remoteAssetsForPartialUpdate];
      [v12 _requestUpdatePassData:v13 forSyncStateItem:v14 baseManifestHashForPartialUpdate:v15 remoteAssetsForPartialUpdate:v16 completion:v4];

      break;
    case 0:
      id v6 = *(void **)(a1 + 32);
      BOOL v7 = [*(id *)(a1 + 40) passData];
      BOOL v8 = [*(id *)(a1 + 40) syncStateItem];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_2;
      v19[3] = &unk_2644D4150;
      id v20 = v4;
      [v6 _requestAddPassData:v7 forSyncStateItem:v8 completion:v19];

      v9 = v20;
LABEL_6:

      break;
  }
}

uint64_t __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_78(uint64_t a1, char a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v4 = [*(id *)(a1 + 32) processingChange];
  int v5 = [v4 isEqual:*(void *)(a1 + 40)];

  if (v5) {
    [*(id *)(a1 + 32) setProcessingChange:0];
  }
  if (a2)
  {
    int v6 = *(unsigned __int8 *)(a1 + 64);
    BOOL v7 = pk_Sync_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      if (v8)
      {
        v9 = pk_Sync_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [*(id *)(a1 + 32) engineName];
          uint64_t v11 = [*(id *)(a1 + 40) changeUUID];
          int v22 = 138412546;
          v23 = v10;
          __int16 v24 = 2112;
          v25 = v11;
          _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Applying change to reconciled state and accepting\n\tChange UUID: %@", (uint8_t *)&v22, 0x16u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else if (v8)
    {
      id v18 = pk_Sync_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = [*(id *)(a1 + 32) engineName];
        id v20 = [*(id *)(a1 + 40) changeUUID];
        int v22 = 138412546;
        v23 = v19;
        __int16 v24 = 2112;
        v25 = v20;
        _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Not applying change to reconciled state and accepting\n\tChange UUID: %@", (uint8_t *)&v22, 0x16u);
      }
    }
    __int16 v17 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    int v12 = pk_Sync_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      int v14 = pk_Sync_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [*(id *)(a1 + 32) engineName];
        __int16 v16 = [*(id *)(a1 + 40) syncStateItem];
        int v22 = 138412546;
        v23 = v15;
        __int16 v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Warning: Sync state engine (%@): Not applying change to reconciled state because we failed to apply it to the pass library\n\tSync state item: %@", (uint8_t *)&v22, 0x16u);
      }
    }
    __int16 v17 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v17();
  return [*(id *)(a1 + 32) _finishedProcessingChange:*(void *)(a1 + 40)];
}

- (void)handleStateChangeProcessedWithUUID:(id)a3 changeAccepted:(BOOL)a4 fullPassRequired:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = [(NPKPassSyncEngine *)self candidateChange];
  uint64_t v10 = pk_Sync_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    int v12 = pk_Sync_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [(NPKPassSyncEngine *)self engineName];
      *(_DWORD *)v54 = 138413314;
      int v14 = @"no";
      *(void *)&v54[4] = v13;
      *(_WORD *)&v54[12] = 2112;
      if (v5) {
        int v14 = @"yes";
      }
      *(void *)&v54[14] = v8;
      __int16 v55 = 1024;
      *(_DWORD *)v56 = v6;
      *(_WORD *)&v56[4] = 2112;
      *(void *)&v56[6] = v14;
      __int16 v57 = 2112;
      v58 = v9;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Received state change processed\n\tChange UUID: %@\n\tAccepted: %d\n\tFull pass required: %@\n\tOur candidate change: %@", v54, 0x30u);
    }
  }
  int v15 = objc_msgSend(v9, "changeUUID", *(_OWORD *)v54);
  if (PKEqualObjects())
  {
    if (v6)
    {
      unint64_t v16 = [v9 changeType];
      __int16 v17 = [(NPKPassSyncEngine *)self reconciledState];
      if (v16 > 1)
      {
        id v18 = [v9 uniqueID];
        [v17 passSyncStateByRemovingPassWithUniqueID:v18];
      }
      else
      {
        id v18 = [v9 syncStateItem];
        [v17 passSyncStateByAddingOrUpdatingSyncStateItem:v18];
      uint64_t v32 = };

      [(NPKPassSyncEngine *)self setReconciledState:v32];
      [(NPKPassSyncEngine *)self setCandidateChange:0];
      v33 = pk_Sync_log();
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      if (v34)
      {
        uint64_t v35 = pk_Sync_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v36 = [(NPKPassSyncEngine *)self engineName];
          *(_DWORD *)v54 = 138412546;
          *(void *)&v54[4] = v36;
          *(_WORD *)&v54[12] = 2112;
          *(void *)&v54[14] = v32;
          _os_log_impl(&dword_21E92F000, v35, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Reconciled state after state change processed: %@", v54, 0x16u);
        }
      }

      [(NPKPassSyncEngine *)self _receivedStateChangeProcessed:v9 changeAccepted:1];
LABEL_30:
      [(NPKPassSyncEngine *)self _sendNextStateChange];
      goto LABEL_47;
    }
    uint64_t v23 = [v9 uniqueID];
    __int16 v24 = (void *)v23;
    if (v5)
    {
      v25 = [v9 baseManifestHashForPartialUpdate];

      if (!v25)
      {
        v46 = pk_Sync_log();
        BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);

        if (v47)
        {
          v48 = pk_Sync_log();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = [(NPKPassSyncEngine *)self engineName];
            *(_DWORD *)v54 = 138412290;
            *(void *)&v54[4] = v49;
            _os_log_impl(&dword_21E92F000, v48, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): got request for full pass, but we sent the full pass last time", v54, 0xCu);
          }
        }
        [(NPKPassSyncEngine *)self _unexpectedEventOccurred];
        goto LABEL_46;
      }
      uint64_t v26 = [v9 copy];
      [v26 setBaseManifestHashForPartialUpdate:0];
      [v26 setRemoteAssetsForPartialUpdate:0];
      v27 = [(NPKPassSyncEngine *)self dataSource];
      v28 = [v27 passSyncEngine:self dataForPassWithUniqueID:v24];
      [v26 setPassData:v28];

      v29 = pk_Sync_log();
      LODWORD(v28) = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

      if (v28)
      {
        v30 = pk_Sync_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = [(NPKPassSyncEngine *)self engineName];
          *(_DWORD *)v54 = 138412546;
          *(void *)&v54[4] = v31;
          *(_WORD *)&v54[12] = 2112;
          *(void *)&v54[14] = v26;
          _os_log_impl(&dword_21E92F000, v30, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Resending change with full pass\n\tFull pass change: %@", v54, 0x16u);
        }
      }
      [(NPKPassSyncEngine *)self setCandidateChange:v26];
      [(NPKPassSyncEngine *)self _sendStateChange:v26];
      goto LABEL_23;
    }
    if (!v23)
    {
      v50 = pk_Sync_log();
      BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);

      if (!v51) {
        goto LABEL_46;
      }
      uint64_t v26 = pk_Sync_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v54 = 0;
        _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_ERROR, "Error: Candidate change has no unique ID!", v54, 2u);
      }
LABEL_23:

LABEL_46:
      [(NPKPassSyncEngine *)self _receivedStateChangeProcessed:v9 changeAccepted:0];
      goto LABEL_47;
    }
    unint64_t v37 = [(NPKPassSyncEngine *)self libraryState];
    v38 = [v37 syncStateItems];
    id v39 = [v38 objectForKey:v24];

    id v40 = [v9 syncStateItem];
    char v41 = PKEqualObjects();
    id v42 = pk_Sync_log();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

    if (v41)
    {
      if (v43)
      {
        v44 = pk_Sync_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = [(NPKPassSyncEngine *)self engineName];
          *(_DWORD *)v54 = 138412802;
          *(void *)&v54[4] = v45;
          *(_WORD *)&v54[12] = 2112;
          *(void *)&v54[14] = v39;
          __int16 v55 = 2112;
          *(void *)v56 = v40;
          _os_log_impl(&dword_21E92F000, v44, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): change not being accepted is unexpected\n\tCurrent library sync state item: %@\n\tChange sync state item: %@", v54, 0x20u);
        }
      }
      [(NPKPassSyncEngine *)self _unexpectedEventOccurred];
    }
    else if (v43)
    {
      v52 = pk_Sync_log();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = [(NPKPassSyncEngine *)self engineName];
        *(_DWORD *)v54 = 138412802;
        *(void *)&v54[4] = v53;
        *(_WORD *)&v54[12] = 2112;
        *(void *)&v54[14] = v39;
        __int16 v55 = 2112;
        *(void *)v56 = v40;
        _os_log_impl(&dword_21E92F000, v52, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): change not being accepted is expected because current library sync state item (%@) no longer matches change sync state item (%@)", v54, 0x20u);
      }
    }
    [(NPKPassSyncEngine *)self setCandidateChange:0];

    [(NPKPassSyncEngine *)self _receivedStateChangeProcessed:v9 changeAccepted:0];
    if ((v41 & 1) == 0) {
      goto LABEL_30;
    }
  }
  else
  {
    __int16 v19 = pk_Sync_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      uint64_t v21 = pk_Sync_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = [(NPKPassSyncEngine *)self engineName];
        *(_DWORD *)v54 = 138412802;
        *(void *)&v54[4] = v22;
        *(_WORD *)&v54[12] = 2112;
        *(void *)&v54[14] = v8;
        __int16 v55 = 2112;
        *(void *)v56 = v15;
        _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Warning: Sync state engine (%@): Did not recognize change UUID (%@) in change state accepted message; candidat"
          "e change UUID is %@",
          v54,
          0x20u);
      }
    }
    [(NPKPassSyncEngine *)self _unexpectedEventOccurred];
  }
LABEL_47:
}

- (void)handleReconciledStateUnrecognizedWithHash:(id)a3 version:(unint64_t)a4 passSyncState:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = pk_Sync_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    int v12 = pk_Sync_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [(NPKPassSyncEngine *)self engineName];
      int v14 = [v8 hexEncoding];
      int v22 = 138413058;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      v25 = v14;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Received reconciled state unrecognized\n\tReconciled state hash: %@\n\tversion:%lu\n\tPass sync state: %@", (uint8_t *)&v22, 0x2Au);
    }
  }
  uint64_t v15 = [v9 version];
  unint64_t v16 = [(NPKPassSyncEngine *)self reconciledState];
  uint64_t v17 = [v16 version];

  if (v17 == v15)
  {
    id v18 = [(NPKPassSyncEngine *)self reconciledState];
  }
  else
  {
    [(NPKPassSyncEngine *)self setMinSyncStateVersion:v15];
    __int16 v19 = [(NPKPassSyncEngine *)self reconciledState];
    BOOL v20 = [(NPKPassSyncEngine *)self libraryState];
    id v18 = [v19 commonBaselinePassSyncStateWithState:v20 version:v15];
  }
  [(NPKPassSyncEngine *)self setCandidateState:0];
  [(NPKPassSyncEngine *)self setReconciledState:0];
  if (v9)
  {
    uint64_t v21 = objc_msgSend(v18, "commonBaselinePassSyncStateWithState:version:", v9, objc_msgSend(v18, "version"));
    [(NPKPassSyncEngine *)self setCandidateState:v21];
    [(NPKPassSyncEngine *)self _sendProposedReconciledState:v21];
  }
}

- (void)handleProposedReconciledState:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Sync_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Sync_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(NPKPassSyncEngine *)self engineName];
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Received proposed reconciled state\n\tProposed pass sync state: %@", buf, 0x16u);
    }
  }
  uint64_t v9 = [v4 version];
  uint64_t v10 = [(NPKPassSyncEngine *)self libraryState];
  if (v9 != [v10 version])
  {

    goto LABEL_9;
  }
  BOOL v11 = [(NPKPassSyncEngine *)self candidateState];
  int v12 = [(NPKPassSyncEngine *)self libraryState];
  v16[1] = v12;
  BOOL v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  int v14 = [v4 stateIsSubsetOfUnionOfPassSyncStates:v13];

  if (!v14)
  {
LABEL_9:
    uint64_t v15 = [v4 syncStateHash];
    -[NPKPassSyncEngine _sendReconciledStateUnrecognizedWithHash:version:currentPassSyncState:](self, "_sendReconciledStateUnrecognizedWithHash:version:currentPassSyncState:", v15, [v4 version], 0);
    goto LABEL_10;
  }
  [(NPKPassSyncEngine *)self setBackupState:0];
  [(NPKPassSyncEngine *)self setReconciledState:v4];
  uint64_t v15 = [v4 syncStateHash];
  [(NPKPassSyncEngine *)self _sendReconciledStateAcceptedWithHash:v15];
LABEL_10:
}

- (void)handleReconciledStateAcceptedWithHash:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Sync_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Sync_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(NPKPassSyncEngine *)self engineName];
      uint64_t v9 = [v4 hexEncoding];
      int v19 = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      int v22 = v9;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Received proposed reconciled state accepted\n\tReconciled state hash: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  uint64_t v10 = [(NPKPassSyncEngine *)self candidateState];
  BOOL v11 = [v10 syncStateHash];
  int v12 = PKEqualObjects();

  if (v12)
  {
    [(NPKPassSyncEngine *)self setReconciledState:v10];
    [(NPKPassSyncEngine *)self setCandidateState:0];
    [(NPKPassSyncEngine *)self _sendNextStateChange];
  }
  else
  {
    BOOL v13 = pk_Sync_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      uint64_t v15 = pk_Sync_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v16 = [(NPKPassSyncEngine *)self engineName];
        uint64_t v17 = [v4 hexEncoding];
        id v18 = [v10 syncStateHash];
        int v19 = 138412802;
        id v20 = v16;
        __int16 v21 = 2112;
        int v22 = v17;
        __int16 v23 = 2112;
        __int16 v24 = v18;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Warning: Sync state engine (%@): Did not recognize hash (%@) in reconciled state accepted message; reconciled "
          "state hash is %@",
          (uint8_t *)&v19,
          0x20u);
      }
    }
    [(NPKPassSyncEngine *)self _unexpectedEventOccurred];
  }
}

- (void)setMinSyncStateVersion:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v5 = [(NPKPassSyncEngine *)self libraryState];
  uint64_t v6 = [v5 version];

  BOOL v7 = [(NPKPassSyncEngine *)self reconciledState];
  uint64_t v8 = [v7 version];

  backupState = self->_backupState;
  if (backupState) {
    uint64_t v10 = [(NPKPassSyncState *)backupState version];
  }
  else {
    uint64_t v10 = v8;
  }
  if (v8 != a3 || v6 != a3 || v6 != v8 || v8 != v10)
  {
    BOOL v11 = pk_Sync_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      BOOL v13 = pk_Sync_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 134217984;
        unint64_t v34 = a3;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Requested to move to sync state version:%lu", (uint8_t *)&v33, 0xCu);
      }
    }
    +[NPKPassSyncState setMinRemoteDevicePassSyncStateVersionSupport:a3];
    BOOL v14 = [(NPKPassSyncEngine *)self dataSource];
    uint64_t v15 = [v14 passSyncEngineNeedsUpdatedPassLibraryState:self];

    unint64_t v16 = [v15 passSyncStateWithVersion:a3];
    [(NPKPassSyncEngine *)self setLibraryState:v16];
    uint64_t v17 = pk_Sync_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      int v19 = pk_Sync_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [(NPKPassSyncEngine *)self engineName];
        int v33 = 138412546;
        unint64_t v34 = (unint64_t)v20;
        __int16 v35 = 2112;
        BOOL v36 = v16;
        _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): updated library state to match expected version:%@", (uint8_t *)&v33, 0x16u);
      }
    }
    __int16 v21 = [(NPKPassSyncEngine *)self reconciledState];
    int v22 = [v15 updateReconcileState:v21 expectedVersion:a3];

    [(NPKPassSyncEngine *)self setReconciledState:v22];
    __int16 v23 = pk_Sync_log();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

    if (v24)
    {
      uint64_t v25 = pk_Sync_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = [(NPKPassSyncEngine *)self engineName];
        int v33 = 138412546;
        unint64_t v34 = (unint64_t)v26;
        __int16 v35 = 2112;
        BOOL v36 = v22;
        _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): updated reconciled state to match expected version:%@", (uint8_t *)&v33, 0x16u);
      }
    }
    unint64_t v27 = self->_backupState;
    if (v27)
    {
      __int16 v28 = [v15 updateReconcileState:v27 expectedVersion:a3];
      [(NPKPassSyncEngine *)self setBackupState:v28];
      id v29 = pk_Sync_log();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

      if (v30)
      {
        v31 = pk_Sync_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = [(NPKPassSyncEngine *)self engineName];
          int v33 = 138412546;
          unint64_t v34 = (unint64_t)v32;
          __int16 v35 = 2112;
          BOOL v36 = v28;
          _os_log_impl(&dword_21E92F000, v31, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): updated backup state to match expected version:%@", (uint8_t *)&v33, 0x16u);
        }
      }
    }
    [(NPKPassSyncEngine *)self setCandidateChange:0];
  }
}

- (void)setLibraryState:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    uint64_t v6 = [v5 version];
    if (v6 != +[NPKPassSyncState minRemoteDevicePassSyncStateVersionSupport])
    {
      BOOL v7 = pk_Sync_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        uint64_t v9 = pk_Sync_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [(NPKPassSyncEngine *)self engineName];
          int v11 = 138412802;
          BOOL v12 = v10;
          __int16 v13 = 2048;
          uint64_t v14 = [v5 version];
          __int16 v15 = 2048;
          unint64_t v16 = +[NPKPassSyncState minRemoteDevicePassSyncStateVersionSupport];
          _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Sync state engine (%@): setting new library state with version:%lu, expected:%lu", (uint8_t *)&v11, 0x20u);
        }
      }
    }
    objc_storeStrong((id *)&self->_libraryState, a3);
    [(NPKPassSyncEngine *)self _engineStateChanged];
  }
}

- (NPKPassSyncState)libraryState
{
  libraryState = self->_libraryState;
  if (libraryState) {
    id v3 = libraryState;
  }
  else {
    id v3 = [[NPKPassSyncState alloc] initWithVersion:+[NPKPassSyncState minRemoteDevicePassSyncStateVersionSupport]];
  }
  return v3;
}

- (void)setBackupState:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backupState, a3);
    [(NPKPassSyncEngine *)self _engineStateChanged];
  }
}

- (void)setReconciledState:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_reconciledState, a3);
    [(NPKPassSyncEngine *)self _engineStateChanged];
  }
}

- (NPKPassSyncState)reconciledState
{
  reconciledState = self->_reconciledState;
  if (reconciledState) {
    id v3 = reconciledState;
  }
  else {
    id v3 = [[NPKPassSyncState alloc] initWithVersion:+[NPKPassSyncState minRemoteDevicePassSyncStateVersionSupport]];
  }
  return v3;
}

- (void)setCandidateState:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_candidateState, a3);
    [(NPKPassSyncEngine *)self _engineStateChanged];
  }
}

- (NPKPassSyncState)candidateState
{
  candidateState = self->_candidateState;
  if (candidateState) {
    id v3 = candidateState;
  }
  else {
    id v3 = [[NPKPassSyncState alloc] initWithVersion:+[NPKPassSyncState minRemoteDevicePassSyncStateVersionSupport]];
  }
  return v3;
}

- (void)setCandidateChange:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_candidateChange, a3);
    [(NPKPassSyncEngine *)self _engineStateChanged];
  }
}

- (void)_sendNextStateChange
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v3 = [(NPKPassSyncEngine *)self libraryState];
  id v4 = [(NPKPassSyncEngine *)self reconciledState];
  id v62 = 0;
  id v63 = 0;
  id v61 = 0;
  [v3 compareWithBaselinePassSyncState:v4 outAddedSyncItems:&v63 outUpdatedSyncItems:&v62 outRemovedSyncItems:&v61];
  id v5 = v63;
  id v6 = v62;
  id v59 = v61;

  uint64_t v7 = [MEMORY[0x263F08C38] UUID];
  BOOL v8 = [(NPKPassSyncEngine *)self reconciledState];
  uint64_t v57 = [v8 syncStateHash];

  uint64_t v9 = [(NPKPassSyncEngine *)self reconciledState];
  uint64_t v55 = [v9 version];

  uint64_t v10 = pk_Sync_log();
  LODWORD(v4) = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  v58 = (void *)v7;
  if (v4)
  {
    int v11 = pk_Sync_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = [(NPKPassSyncEngine *)self engineName];
      v53 = [(NPKPassSyncEngine *)self libraryState];
      [v53 syncStateHash];
      uint64_t v14 = v13 = v6;
      __int16 v15 = [v14 hexEncoding];
      unint64_t v16 = [(NPKPassSyncEngine *)self reconciledState];
      uint64_t v17 = [v16 syncStateHash];
      BOOL v18 = [v17 hexEncoding];
      *(_DWORD *)buf = 138413570;
      BOOL v65 = v12;
      __int16 v66 = 2112;
      v67 = v15;
      __int16 v68 = 2112;
      BOOL v69 = v18;
      __int16 v70 = 2112;
      id v71 = v5;
      __int16 v72 = 2112;
      id v73 = v13;
      __int16 v74 = 2112;
      id v75 = v59;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Compared library state with manifestHash:%@ with reconcileState:%@\n addedID:%@\n updatedIDs:%@\n removedIDs:%@\n", buf, 0x3Eu);

      uint64_t v7 = (uint64_t)v58;
      id v6 = v13;
    }
  }
  v56 = v5;
  if ([v5 count] || objc_msgSend(v6, "count"))
  {
    id v54 = v6;
    if ([v6 count])
    {
      int v19 = [v6 firstObject];
      id v20 = [(NPKPassSyncEngine *)self reconciledState];
      __int16 v21 = [v20 syncStateItems];
      int v22 = [v19 uniqueID];
      __int16 v23 = [v21 objectForKey:v22];

      BOOL v24 = [v23 manifest];
      uint64_t v25 = [v23 manifestHash];

      if (v24)
      {
        __int16 v26 = [(NPKPassSyncEngine *)self dataSource];
        unint64_t v27 = [v19 uniqueID];
        id v60 = 0;
        __int16 v28 = [v26 passSyncEngine:self partialDataForPassWithUniqueID:v27 baseManifest:v24 outRemoteAssets:&v60];
        id v29 = v60;

        uint64_t v30 = 1;
        if (v28)
        {
LABEL_14:
          int v33 = [NPKPassSyncChange alloc];
          unint64_t v34 = [v19 uniqueID];
          __int16 v35 = v33;
          BOOL v36 = (void *)v57;
          uint64_t v37 = [(NPKPassSyncChange *)v35 initWithChangeUUID:v7 reconciledStateHash:v57 reconciledStateVersion:v55 changeType:v30 uniqueID:v34 syncStateItem:v19 passData:v28 baseManifestHashForPartialUpdate:v25 remoteAssetsForPartialUpdate:v29];

          id v6 = v54;
          v38 = v59;
          goto LABEL_15;
        }
      }
      else
      {
        id v29 = 0;
        uint64_t v30 = 1;
      }
    }
    else
    {
      int v19 = [v5 firstObject];
      id v29 = 0;
      uint64_t v30 = 0;
      BOOL v24 = 0;
      uint64_t v25 = 0;
    }

    v31 = [(NPKPassSyncEngine *)self dataSource];
    uint64_t v32 = [v19 uniqueID];
    __int16 v28 = [v31 passSyncEngine:self dataForPassWithUniqueID:v32];

    uint64_t v25 = 0;
    id v29 = 0;
    goto LABEL_14;
  }
  v38 = v59;
  if (![v59 count])
  {
    BOOL v47 = pk_Sync_log();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

    BOOL v36 = (void *)v57;
    if (!v48) {
      goto LABEL_25;
    }
    uint64_t v37 = pk_Sync_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v49 = [(NPKPassSyncEngine *)self engineName];
      v50 = [(NPKPassSyncEngine *)self reconciledState];
      BOOL v51 = [v50 syncStateHash];
      v52 = [v51 hexEncoding];
      *(_DWORD *)buf = 138412546;
      BOOL v65 = v49;
      __int16 v66 = 2112;
      v67 = v52;
      _os_log_impl(&dword_21E92F000, v37, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): No state changes to send; settling on reconciled state hash %@.",
        buf,
        0x16u);

      BOOL v36 = (void *)v57;
      v38 = v59;
    }
    goto LABEL_24;
  }
  int v19 = [v59 firstObject];
  v45 = [NPKPassSyncChange alloc];
  BOOL v24 = [v19 uniqueID];
  v46 = v45;
  BOOL v36 = (void *)v57;
  uint64_t v37 = [(NPKPassSyncChange *)v46 initWithChangeUUID:v7 reconciledStateHash:v57 reconciledStateVersion:v55 changeType:2 uniqueID:v24 syncStateItem:0 passData:0];
LABEL_15:

  if (v37)
  {
    id v39 = [(NPKPassSyncEngine *)self candidateChange];
    if (v39 && [v37 isEqualToChangeIgnoringUUID:v39])
    {
      id v40 = pk_Sync_log();
      BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

      if (v41)
      {
        id v42 = pk_Sync_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v43 = [(NPKPassSyncEngine *)self engineName];
          *(_DWORD *)buf = 138412802;
          BOOL v65 = v43;
          __int16 v66 = 2112;
          v67 = v39;
          __int16 v68 = 2112;
          BOOL v69 = v37;
          _os_log_impl(&dword_21E92F000, v42, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Outgoing change is identical to candidate change except for UUID; changing U"
            "UID to match candidate change\n"
            "\tCandidate change: %@\n"
            "\tOutgoing change: %@",
            buf,
            0x20u);
        }
      }
      v44 = [v39 changeUUID];
      [v37 setChangeUUID:v44];

      BOOL v36 = (void *)v57;
    }
    [(NPKPassSyncEngine *)self setCandidateChange:v37];
    [(NPKPassSyncEngine *)self _sendStateChange:v37];

LABEL_24:
  }
LABEL_25:
}

- (void)_shouldProcessAddOrUpdateChangeOfType:(unint64_t)a3 changeSyncStateItem:(id)a4 librarySyncStateItem:(id)a5 reconciledSyncStateItem:(id)a6 candidateChange:(id)a7 shouldApplyToPassLibrary:(BOOL *)a8 shouldApplyToReconciledState:(BOOL *)a9
{
  __int16 v15 = a9;
  uint64_t v72 = *MEMORY[0x263EF8340];
  unint64_t v16 = a4;
  uint64_t v17 = a5;
  BOOL v18 = a6;
  int v19 = a7;
  if (a3 != 1 || v17)
  {
    if (PKEqualObjects())
    {
      LOBYTE(v26) = 1;
      goto LABEL_44;
    }
    unint64_t v27 = pk_Sync_log();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

    if (v28)
    {
      id v29 = pk_Sync_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = [(NPKPassSyncEngine *)self engineName];
        *(_DWORD *)buf = 138413058;
        BOOL v65 = v30;
        __int16 v66 = 2112;
        v67 = v18;
        __int16 v68 = 2112;
        BOOL v69 = v17;
        __int16 v70 = 2112;
        id v71 = v16;
        _os_log_impl(&dword_21E92F000, v29, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Pass has been added/updated in local library also.\n\tReconciled sync state item: %@\n\tLocal library sync state item: %@\n\tChange sync state item: %@", buf, 0x2Au);
      }
    }
    int v22 = [v17 sequenceCounter];
    uint64_t v31 = [v16 sequenceCounter];
    __int16 v26 = v31;
    if (v22 || !v31)
    {
      if (v22 && v31)
      {
        if ([v22 compare:v31] == 1)
        {
          id v63 = a9;
          uint64_t v32 = pk_Sync_log();
          BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

          if (v33)
          {
            unint64_t v34 = pk_Sync_log();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v35 = [(NPKPassSyncEngine *)self engineName];
              *(_DWORD *)buf = 138412802;
              BOOL v65 = v35;
              __int16 v66 = 2112;
              v67 = v22;
              __int16 v68 = 2112;
              BOOL v69 = v26;
              BOOL v36 = "Notice: Sync state engine (%@): local pass has higher sequence counter (%@) than change (%@); not ap"
                    "plying change to local library";
              uint64_t v37 = v34;
              uint32_t v38 = 32;
LABEL_24:
              _os_log_impl(&dword_21E92F000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);

              goto LABEL_25;
            }
            goto LABEL_25;
          }
          goto LABEL_26;
        }
      }
      else
      {
        id v62 = v22;
        id v63 = a9;
        id v39 = self;
        id v40 = v16;
        BOOL v41 = a8;
        id v42 = v18;
        BOOL v43 = v19;
        v44 = v39;
        unint64_t engineRole = v39->_engineRole;
        v46 = pk_Sync_log();
        BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);

        if (engineRole)
        {
          int v19 = v43;
          BOOL v18 = v42;
          a8 = v41;
          unint64_t v16 = v40;
          self = v44;
          int v22 = v62;
          if (v47)
          {
            unint64_t v34 = pk_Sync_log();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v35 = [(NPKPassSyncEngine *)self engineName];
              *(_DWORD *)buf = 138412290;
              BOOL v65 = v35;
              BOOL v36 = "Notice: Sync state engine (%@): Not applying change in the absence of sync state counters";
              uint64_t v37 = v34;
              uint32_t v38 = 12;
              goto LABEL_24;
            }
LABEL_25:
          }
LABEL_26:

          __int16 v15 = v63;
          goto LABEL_27;
        }
        int v19 = v43;
        BOOL v18 = v42;
        a8 = v41;
        unint64_t v16 = v40;
        id v59 = v44;
        int v22 = v62;
        __int16 v15 = a9;
        if (v47)
        {
          id v60 = pk_Sync_log();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            id v61 = [(NPKPassSyncEngine *)v59 engineName];
            *(_DWORD *)buf = 138412290;
            BOOL v65 = v61;
            _os_log_impl(&dword_21E92F000, v60, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Applying change in the absence of sync state counters", buf, 0xCu);
          }
        }
      }
    }

    LOBYTE(v26) = 1;
    goto LABEL_51;
  }
  id v20 = pk_Sync_log();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (!v21) {
    goto LABEL_28;
  }
  int v22 = pk_Sync_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v23 = [(NPKPassSyncEngine *)self engineName];
    BOOL v24 = [v16 uniqueID];
    uint64_t v25 = [(NPKPassSyncEngine *)self libraryState];
    *(_DWORD *)buf = 138412802;
    BOOL v65 = v23;
    __int16 v66 = 2112;
    v67 = v24;
    __int16 v68 = 2112;
    BOOL v69 = v25;
    _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Ignoring request to apply pass update with unique ID %@ to local library since the pass is not in our library state: %@", buf, 0x20u);

    __int16 v15 = a9;
  }
LABEL_27:

LABEL_28:
  if (self->_engineRole != 1)
  {
LABEL_43:
    LOBYTE(v26) = 0;
    goto LABEL_44;
  }
  if (PKEqualObjects())
  {
    BOOL v48 = pk_Sync_log();
    LODWORD(v26) = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      int v22 = pk_Sync_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v49 = [(NPKPassSyncEngine *)self engineName];
        *(_DWORD *)buf = 138413058;
        BOOL v65 = v49;
        __int16 v66 = 2112;
        v67 = v17;
        __int16 v68 = 2112;
        BOOL v69 = v16;
        __int16 v70 = 2112;
        id v71 = v19;
        _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Applying change to reconciled state because it matches our library state\n\tLocal library sync state item: %@\n\tChange sync state item: %@\n\tCandidate change: %@", buf, 0x2Au);
LABEL_41:

        goto LABEL_42;
      }
      goto LABEL_42;
    }
LABEL_44:
    char v57 = 1;
    goto LABEL_53;
  }
  v50 = [v19 uniqueID];
  BOOL v51 = [v16 uniqueID];
  int v52 = [v50 isEqualToString:v51];

  v53 = pk_Sync_log();
  BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);

  if (!v52)
  {
    if (v54)
    {
      int v22 = pk_Sync_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v49 = [(NPKPassSyncEngine *)self engineName];
        v58 = [v16 uniqueID];
        *(_DWORD *)buf = 138412802;
        BOOL v65 = v49;
        __int16 v66 = 2112;
        v67 = v58;
        __int16 v68 = 2112;
        BOOL v69 = v19;
        _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Applying change to reconciled state even though we have an outstanding candidate change for pass with unique ID %@: %@", buf, 0x20u);

        goto LABEL_41;
      }
LABEL_42:
      LOBYTE(v26) = 0;
LABEL_51:
      char v57 = 1;
      goto LABEL_52;
    }
    goto LABEL_43;
  }
  if (!v54)
  {
    LOBYTE(v26) = 0;
    char v57 = 0;
    goto LABEL_53;
  }
  int v22 = pk_Sync_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v55 = [(NPKPassSyncEngine *)self engineName];
    v56 = [v16 uniqueID];
    *(_DWORD *)buf = 138412802;
    BOOL v65 = v55;
    __int16 v66 = 2112;
    v67 = v56;
    __int16 v68 = 2112;
    BOOL v69 = v19;
    _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Not applying change to reconciled state since we are not applying it to the local library and have an outstanding candidate change for pass with unique ID %@: %@", buf, 0x20u);
  }
  LOBYTE(v26) = 0;
  char v57 = 0;
LABEL_52:

LABEL_53:
  if (a8) {
    *a8 = (char)v26;
  }
  if (v15) {
    BOOL *v15 = v57;
  }
}

- (void)_sendStateChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Sync_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Sync_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(NPKPassSyncEngine *)self engineName];
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Sending state change\n\tChange: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v9 = [(NPKPassSyncEngine *)self delegate];
  [v9 passSyncEngine:self sendStateChange:v4];
}

- (void)_sendStateChangeProcessedWithUUID:(id)a3 changeAccepted:(BOOL)a4 fullPassRequired:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = pk_Sync_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    int v11 = pk_Sync_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = [(NPKPassSyncEngine *)self engineName];
      id v13 = @"no";
      *(_DWORD *)unint64_t v16 = 138413058;
      *(void *)&v16[4] = v12;
      if (v6) {
        uint64_t v14 = @"yes";
      }
      else {
        uint64_t v14 = @"no";
      }
      if (v5) {
        id v13 = @"yes";
      }
      *(_WORD *)&v16[12] = 2112;
      *(void *)&v16[14] = v8;
      __int16 v17 = 2112;
      BOOL v18 = v14;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Sending state change processed\n\tChange UUID: %@\n\tChange accepted: %@\n\tFull pass required: %@", v16, 0x2Au);
    }
  }
  __int16 v15 = [(NPKPassSyncEngine *)self delegate];
  [v15 passSyncEngine:self sendStateChangeProcessedWithUUID:v8 changeAccepted:v6 fullPassRequired:v5];
}

- (void)_sendReconciledStateUnrecognizedWithHash:(id)a3 version:(unint64_t)a4 currentPassSyncState:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = pk_Sync_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    __int16 v12 = pk_Sync_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(NPKPassSyncEngine *)self engineName];
      uint64_t v14 = [v8 hexEncoding];
      int v16 = 138413058;
      __int16 v17 = v13;
      __int16 v18 = 2112;
      __int16 v19 = v14;
      __int16 v20 = 2048;
      unint64_t v21 = a4;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Sending reconciled state unrecognized\n\tReconciled state hash: %@\n\tversion:%lu\n\tPass sync state: %@", (uint8_t *)&v16, 0x2Au);
    }
  }
  __int16 v15 = [(NPKPassSyncEngine *)self delegate];
  [v15 passSyncEngine:self sendReconciledStateUnrecognizedWithHash:v8 version:a4 currentPassSyncState:v9];
}

- (void)_sendReconciledStateAcceptedWithHash:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Sync_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Sync_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(NPKPassSyncEngine *)self engineName];
      id v9 = [v4 hexEncoding];
      int v11 = 138412546;
      __int16 v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Sending reconciled state accepted\n\tReconciled state hash: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  BOOL v10 = [(NPKPassSyncEngine *)self delegate];
  [v10 passSyncEngine:self sendReconciledStateAcceptedWithHash:v4];
}

- (void)_sendProposedReconciledState:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Sync_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Sync_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(NPKPassSyncEngine *)self engineName];
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Sending proposed reconciled state\n\tProposed pass sync state: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  id v9 = [(NPKPassSyncEngine *)self delegate];
  [v9 passSyncEngine:self sendProposedReconciledState:v4];
}

- (void)_requestAddPassData:(id)a3 forSyncStateItem:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = pk_Sync_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Sync_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(NPKPassSyncEngine *)self engineName];
      uint64_t v15 = [v8 npkDescription];
      *(_DWORD *)buf = 138412802;
      id v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Requesting that delegate add pass to local pass library\n\tData: %@\n\tSync state item: %@", buf, 0x20u);
    }
  }
  int v16 = [(NPKPassSyncEngine *)self delegate];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __69__NPKPassSyncEngine__requestAddPassData_forSyncStateItem_completion___block_invoke;
  v19[3] = &unk_2644D5578;
  void v19[4] = self;
  id v20 = v9;
  id v21 = v10;
  id v17 = v10;
  id v18 = v9;
  [v16 passSyncEngine:self requestsAddPassData:v8 forSyncStateItem:v18 completion:v19];
}

uint64_t __69__NPKPassSyncEngine__requestAddPassData_forSyncStateItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = pk_Sync_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Sync_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) engineName];
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138412802;
      int v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 1024;
      int v15 = a2;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Delegate invoked add completion\n\tsync state item: %@\n\tadded: %d", (uint8_t *)&v10, 0x1Cu);
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)_requestUpdatePassData:(id)a3 forSyncStateItem:(id)a4 baseManifestHashForPartialUpdate:(id)a5 remoteAssetsForPartialUpdate:(id)a6 completion:(id)a7
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = pk_Sync_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    __int16 v19 = pk_Sync_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [(NPKPassSyncEngine *)self engineName];
      id v21 = [v12 npkDescription];
      *(_DWORD *)buf = 138413314;
      id v29 = v20;
      __int16 v30 = 2112;
      uint64_t v31 = v21;
      __int16 v32 = 2112;
      id v33 = v13;
      __int16 v34 = 2112;
      id v35 = v14;
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Requesting that delegate update pass in local pass library\n\tData: %@\n\tSync state item: %@\n\tBase manifest hash for partial update: %@\n\tRemote assets for partial update: %@", buf, 0x34u);
    }
  }
  __int16 v22 = [(NPKPassSyncEngine *)self delegate];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __134__NPKPassSyncEngine__requestUpdatePassData_forSyncStateItem_baseManifestHashForPartialUpdate_remoteAssetsForPartialUpdate_completion___block_invoke;
  v25[3] = &unk_2644D55A0;
  v25[4] = self;
  id v26 = v13;
  id v27 = v16;
  id v23 = v16;
  id v24 = v13;
  [v22 passSyncEngine:self requestsUpdatePassData:v12 forSyncStateItem:v24 baseManifestHashForPartialUpdate:v14 remoteAssetsForPartialUpdate:v15 completion:v25];
}

uint64_t __134__NPKPassSyncEngine__requestUpdatePassData_forSyncStateItem_baseManifestHashForPartialUpdate_remoteAssetsForPartialUpdate_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v6 = pk_Sync_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = pk_Sync_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) engineName];
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138412802;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 1024;
      int v17 = a2;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Delegate invoked update completion\n\tsync state item: %@\n\tupdated: %d", (uint8_t *)&v12, 0x1Cu);
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  }
  return result;
}

- (void)_requestRemovePassWithUniqueID:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = pk_Sync_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_Sync_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(NPKPassSyncEngine *)self engineName];
      *(_DWORD *)buf = 138412546;
      __int16 v19 = v11;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Requesting that delegate remove pass in local pass library\n\tunique ID: %@", buf, 0x16u);
    }
  }
  int v12 = [(NPKPassSyncEngine *)self delegate];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__NPKPassSyncEngine__requestRemovePassWithUniqueID_completion___block_invoke;
  v15[3] = &unk_2644D5578;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [v12 passSyncEngine:self requestsRemovePassWithUniqueID:v14 completion:v15];
}

uint64_t __63__NPKPassSyncEngine__requestRemovePassWithUniqueID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = pk_Sync_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Sync_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) engineName];
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138412802;
      int v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 1024;
      int v15 = a2;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Delegate invoked remove completion\n\tunique ID: %@\n\tremoved: %d", (uint8_t *)&v10, 0x1Cu);
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)_unexpectedEventOccurred
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = pk_Sync_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Sync_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(NPKPassSyncEngine *)self engineName];
      int v8 = 138412290;
      BOOL v9 = v6;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): encountered unexpected event", (uint8_t *)&v8, 0xCu);
    }
  }
  id v7 = [(NPKPassSyncEngine *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 passSyncEngineEncounteredUnexpectedEvent:self];
  }
}

- (void)_engineStateChanged
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = pk_Sync_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Sync_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(NPKPassSyncEngine *)self engineName];
      int v8 = 138412290;
      BOOL v9 = v6;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Engine state changed", (uint8_t *)&v8, 0xCu);
    }
  }
  id v7 = [(NPKPassSyncEngine *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 passSyncEngineStateChanged:self];
  }
}

- (void)_receivedStateChangeProcessed:(id)a3 changeAccepted:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [(NPKPassSyncEngine *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 passSyncEngine:self receivedStateChangeProcessed:v7 changeAccepted:v4];
  }
}

- (void)_finishedProcessingChange:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(NPKPassSyncEngine *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 passSyncEngine:self finishedProcessingChange:v5];
  }
}

- (NPKPassSyncState)backupState
{
  return self->_backupState;
}

- (unint64_t)engineRole
{
  return self->_engineRole;
}

- (NPKPassSyncEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKPassSyncEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NPKPassSyncEngineDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (NPKPassSyncEngineDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NPKPassSyncChange)candidateChange
{
  return self->_candidateChange;
}

- (NPKPassSyncChange)processingChange
{
  return self->_processingChange;
}

- (void)setProcessingChange:(id)a3
{
}

- (BOOL)requireAppleAccountForPaymentPasses
{
  return self->_requireAppleAccountForPaymentPasses;
}

- (void)setRequireAppleAccountForPaymentPasses:(BOOL)a3
{
  self->_requireAppleAccountForPaymentPasses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingChange, 0);
  objc_storeStrong((id *)&self->_candidateChange, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_candidateState, 0);
  objc_storeStrong((id *)&self->_reconciledState, 0);
  objc_storeStrong((id *)&self->_backupState, 0);
  objc_storeStrong((id *)&self->_libraryState, 0);
}

@end