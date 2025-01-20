@interface MBDomainTranscriber
+ (id)_cancellationError;
- (BOOL)_collectFileIntoOpenedFileListDatabase:(id)a3 error:(id *)a4;
- (BOOL)_encryptionKeyForFile:(id)a3 existingEncryptionKey:(id)a4 outEncryptionKey:(id *)a5 error:(id *)a6;
- (BOOL)_fetchPreviouslyBackedUpEncryptionKeyForFile:(id)a3 oldMetadata:(id)a4 outEncryptionKey:(id *)a5 error:(id *)a6;
- (BOOL)_fileListContainsValidFileMetadata:(id)a3 forFile:(id)a4 metadata:(id)a5 outModificationType:(unint64_t *)a6;
- (BOOL)_scanDomain:(id)a3 error:(id *)a4;
- (BOOL)_scanDomain:(id)a3 snapshotPathForDomain:(id)a4 error:(id *)a5;
- (BOOL)_shouldPackFile:(id)a3;
- (BOOL)fileScanner:(id)a3 failedToStatFile:(id)a4 withErrno:(int)a5;
- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4;
- (BOOL)isScanningPlaceholderAppDomain;
- (BOOL)isScanningPlaceholderDomain;
- (BOOL)scanDomains:(id)a3 pendingSnapshotDatabase:(id)a4 progress:(id)a5 summary:(id)a6 error:(id *)a7;
- (MBBackupAttemptSummary)attemptSummary;
- (MBCKDevice)device;
- (MBDomainTranscriber)initWithPendingCommitID:(id)a3 snapshotDatabaseDirectory:(id)a4 scanMode:(unint64_t)a5 enginePolicy:(unint64_t)a6 snapshotFormat:(int64_t)a7 device:(id)a8 volumeMap:(id)a9 snapshotTracker:(id)a10 attemptSummary:(id)a11 compatibilityDelegate:(id)a12 delegate:(id)a13;
- (MBDomainTranscriberDelegate)delegate;
- (MBDomainTranscriptionSummary)summary;
- (MBFileListDB)openedFileListDatabase;
- (MBFileScanner)scanner;
- (MBFileScannerDelegate)compatibilityDelegate;
- (MBMissedEncryptionKeysDB)missedEncryptionKeysDB;
- (MBMountedSnapshotTracker)mountedSnapshotTracker;
- (MBPendingSnapshotDB)pendingSnapshotDatabase;
- (NSMutableDictionary)volumeUUIDsByMountPoint;
- (NSString)pendingCommitID;
- (NSString)snapshotDatabaseDirectory;
- (_TtC7backupd11MBVolumeMap)volumeMap;
- (_TtC7backupd18MBVolumeIdentifier)volumeIdentifierForCurrentlyScannedDomain;
- (id)_assetMetadataForRenamedOrHardlinkedFile:(id)a3 error:(id *)a4;
- (id)_assetMetadataFromFile:(id)a3 oldMetadata:(id)a4 modificationType:(unint64_t)a5 outRequiresInvalidation:(BOOL *)a6 error:(id *)a7;
- (id)_metadataFromFile:(id)a3 error:(id *)a4;
- (id)_volumeIdentifierForDomain:(id)a3 error:(id *)a4;
- (id)fileScanner:(id)a3 didFindFile:(id)a4;
- (int64_t)snapshotFormat;
- (unint64_t)modifiedFileCountInCurrentlyScannedDomain;
- (unint64_t)unmodifiedFileCountInCurrentlyScannedDomain;
- (void)_cancel;
- (void)_trackModifiedFile:(id)a3;
- (void)_trackUnmodifiedFile:(id)a3;
- (void)setIsScanningPlaceholderAppDomain:(BOOL)a3;
- (void)setIsScanningPlaceholderDomain:(BOOL)a3;
- (void)setMissedEncryptionKeysDB:(id)a3;
- (void)setModifiedFileCountInCurrentlyScannedDomain:(unint64_t)a3;
- (void)setOpenedFileListDatabase:(id)a3;
- (void)setPendingSnapshotDatabase:(id)a3;
- (void)setSummary:(id)a3;
- (void)setUnmodifiedFileCountInCurrentlyScannedDomain:(unint64_t)a3;
- (void)setVolumeIdentifierForCurrentlyScannedDomain:(id)a3;
@end

@implementation MBDomainTranscriber

- (MBDomainTranscriber)initWithPendingCommitID:(id)a3 snapshotDatabaseDirectory:(id)a4 scanMode:(unint64_t)a5 enginePolicy:(unint64_t)a6 snapshotFormat:(int64_t)a7 device:(id)a8 volumeMap:(id)a9 snapshotTracker:(id)a10 attemptSummary:(id)a11 compatibilityDelegate:(id)a12 delegate:(id)a13
{
  id v17 = a3;
  id v33 = a4;
  id v18 = a4;
  id v35 = a8;
  id v19 = a8;
  id v20 = a9;
  id v37 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  v38 = v17;
  if (!v17) {
    __assert_rtn("-[MBDomainTranscriber initWithPendingCommitID:snapshotDatabaseDirectory:scanMode:enginePolicy:snapshotFormat:device:volumeMap:snapshotTracker:attemptSummary:compatibilityDelegate:delegate:]", "MBDomainTranscriber.m", 111, "pendingCommitID");
  }
  if (!v18) {
    __assert_rtn("-[MBDomainTranscriber initWithPendingCommitID:snapshotDatabaseDirectory:scanMode:enginePolicy:snapshotFormat:device:volumeMap:snapshotTracker:attemptSummary:compatibilityDelegate:delegate:]", "MBDomainTranscriber.m", 112, "snapshotDatabaseDirectory");
  }
  if (!v20) {
    __assert_rtn("-[MBDomainTranscriber initWithPendingCommitID:snapshotDatabaseDirectory:scanMode:enginePolicy:snapshotFormat:device:volumeMap:snapshotTracker:attemptSummary:compatibilityDelegate:delegate:]", "MBDomainTranscriber.m", 113, "volumeMap");
  }
  if (!a5) {
    __assert_rtn("-[MBDomainTranscriber initWithPendingCommitID:snapshotDatabaseDirectory:scanMode:enginePolicy:snapshotFormat:device:volumeMap:snapshotTracker:attemptSummary:compatibilityDelegate:delegate:]", "MBDomainTranscriber.m", 114, "scanMode != MBFileScannerModeUnspecified");
  }
  if (a7 == -1) {
    __assert_rtn("-[MBDomainTranscriber initWithPendingCommitID:snapshotDatabaseDirectory:scanMode:enginePolicy:snapshotFormat:device:volumeMap:snapshotTracker:attemptSummary:compatibilityDelegate:delegate:]", "MBDomainTranscriber.m", 115, "snapshotFormat != MBSnapshotFormatUnspecified");
  }
  if (!v19) {
    __assert_rtn("-[MBDomainTranscriber initWithPendingCommitID:snapshotDatabaseDirectory:scanMode:enginePolicy:snapshotFormat:device:volumeMap:snapshotTracker:attemptSummary:compatibilityDelegate:delegate:]", "MBDomainTranscriber.m", 117, "device");
  }
  unint64_t v24 = a5;
  int64_t v25 = a7;
  v26 = v23;
  v39.receiver = self;
  v39.super_class = (Class)MBDomainTranscriber;
  v27 = [(MBDomainTranscriber *)&v39 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_pendingCommitID, a3);
    objc_storeStrong((id *)&v28->_snapshotDatabaseDirectory, v33);
    v28->_snapshotFormat = v25;
    objc_storeStrong((id *)&v28->_mountedSnapshotTracker, a10);
    v29 = [[MBFileScanner alloc] initWithDelegate:v28 mode:v24 enginePolicy:a6 debugContext:0];
    scanner = v28->_scanner;
    v28->_scanner = v29;

    objc_storeStrong((id *)&v28->_device, v35);
    objc_storeStrong((id *)&v28->_volumeMap, a9);
    objc_storeStrong((id *)&v28->_attemptSummary, a11);
    objc_storeStrong((id *)&v28->_compatibilityDelegate, a12);
    objc_storeStrong((id *)&v28->_delegate, a13);
  }

  return v28;
}

- (void)_cancel
{
  v3 = [(MBDomainTranscriber *)self scanner];

  if (v3)
  {
    id v4 = [(MBDomainTranscriber *)self scanner];
    [v4 cancel];
  }
}

- (BOOL)scanDomains:(id)a3 pendingSnapshotDatabase:(id)a4 progress:(id)a5 summary:(id)a6 error:(id *)a7
{
  id v34 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(MBDomainTranscriber *)self snapshotDatabaseDirectory];
  v16 = [(MBDomainTranscriber *)self pendingCommitID];
  id v17 = +[MBMissedEncryptionKeysDB openOrCreateDatabaseIn:v15 commitID:v16 error:a7];

  if (!v17) {
    goto LABEL_26;
  }
  [(MBDomainTranscriber *)self setMissedEncryptionKeysDB:v17];
  [(MBDomainTranscriber *)self setPendingSnapshotDatabase:v12];
  [(MBDomainTranscriber *)self setSummary:v14];
  if (([v12 setUseFullSynchronization:1 error:a7] & 1) == 0
    || ![v17 removeAllMissedEncryptionKeys:a7])
  {
    goto LABEL_23;
  }
  objc_msgSend(v13, "willScanDomains:", objc_msgSend(v34, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v18 = v34;
  id v19 = [v18 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v18);
        }
        if (![(MBDomainTranscriber *)self _scanDomain:*(void *)(*((void *)&v35 + 1) + 8 * i) error:a7])
        {

          goto LABEL_23;
        }
        [v13 finishedScanningDomain];
      }
      id v19 = [v18 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  id v22 = MBGetDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v24 = [(MBDomainTranscriber *)self scanner];
      int64_t v25 = [v24 loggableStats];
      *(_DWORD *)buf = 138412290;
      v40 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "=transcribing= Finished transcribing all domains - %@", buf, 0xCu);
    }
    v26 = [(MBDomainTranscriber *)self scanner];
    id v33 = [v26 loggableStats];
    _MBLog();
  }
  id v27 = [v17 countMissedEncryptionKeysWithError:a7];
  id v28 = v27;
  if (!v27)
  {
    v32 = [(MBDomainTranscriber *)self summary];
    [v32 setSuccess:1];

    BOOL v30 = 1;
    goto LABEL_24;
  }
  if (v27 == (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_23;
  }
  v29 = MBGetDefaultLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v40 = v28;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "=transcribing= Could not fetch encryption keys for %llu files during transcription", buf, 0xCu);
    id v33 = v28;
    _MBLog();
  }

  if (a7)
  {
    +[MBError errorWithCode:209, @"Could not fetch encryption keys for %lu files during transcription", v28 format];
    BOOL v30 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_23:
    BOOL v30 = 0;
  }
LABEL_24:
  if ((objc_msgSend(v12, "setUseFullSynchronization:error:", 0, a7, v33) & 1) == 0
    || ![v17 close:a7])
  {
LABEL_26:
    BOOL v30 = 0;
  }

  return v30;
}

- (BOOL)_scanDomain:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MBDomainTranscriber *)self mountedSnapshotTracker];
  v8 = [v6 volumeMountPoint];
  v9 = [v7 snapshotMountPointForVolumeMountPoint:v8];

  v10 = [(MBDomainTranscriber *)self mountedSnapshotTracker];

  if (v10 && !v9) {
    __assert_rtn("-[MBDomainTranscriber _scanDomain:error:]", "MBDomainTranscriber.m", 193, "snapshotPathForDomain");
  }
  BOOL v11 = [(MBDomainTranscriber *)self _scanDomain:v6 snapshotPathForDomain:v9 error:a4];
  id v12 = [(MBDomainTranscriber *)self openedFileListDatabase];
  id v13 = v12;
  if (v12)
  {
    id v19 = 0;
    unsigned __int8 v14 = [v12 close:&v19];
    id v15 = v19;
    if ((v14 & 1) == 0)
    {
      v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "=transcribing= Failed to close file list database: %@", buf, 0xCu);
        id v18 = v15;
        _MBLog();
      }
    }
    -[MBDomainTranscriber setOpenedFileListDatabase:](self, "setOpenedFileListDatabase:", 0, v18);
  }
  return v11;
}

- (id)_volumeIdentifierForDomain:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 volumeMountPoint];
  v8 = [(MBDomainTranscriber *)self volumeUUIDsByMountPoint];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9)
  {
    v10 = [v6 volumeMountPoint];
    v9 = +[MBFileSystemManager volumeUUIDWithVolumeMountPoint:v10 error:a4];

    if (!v9)
    {
      id v15 = 0;
      goto LABEL_10;
    }
    BOOL v11 = [(MBDomainTranscriber *)self volumeUUIDsByMountPoint];
    [v11 setObject:v9 forKeyedSubscript:v7];
  }
  id v12 = [(MBDomainTranscriber *)self volumeMap];
  if (!v12) {
    __assert_rtn("-[MBDomainTranscriber _volumeIdentifierForDomain:error:]", "MBDomainTranscriber.m", 221, "volumeMap");
  }
  id v13 = v12;
  unsigned __int8 v14 = [v12 volumeIdentifierForVolumeUUID:v9];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else if (a4)
  {
    *a4 = +[MBError errorWithCode:4, @"Volume identifier not found for uuid:%@ mtpt:%@", v9, v7 format];
  }

LABEL_10:
  return v15;
}

- (BOOL)_scanDomain:(id)a3 snapshotPathForDomain:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(MBDomainTranscriber *)self delegate];
  unsigned int v11 = [v10 shouldCancelTranscription];

  if (!v11)
  {
    [(MBDomainTranscriber *)self setModifiedFileCountInCurrentlyScannedDomain:0];
    [(MBDomainTranscriber *)self setUnmodifiedFileCountInCurrentlyScannedDomain:0];
    id v13 = [(MBDomainTranscriber *)self _volumeIdentifierForDomain:v8 error:a5];
    if (!v13)
    {
      char v12 = 0;
LABEL_51:

      goto LABEL_52;
    }
    [(MBDomainTranscriber *)self setVolumeIdentifierForCurrentlyScannedDomain:v13];
    -[MBDomainTranscriber setIsScanningPlaceholderDomain:](self, "setIsScanningPlaceholderDomain:", [v8 isPlaceholderDomain]);
    -[MBDomainTranscriber setIsScanningPlaceholderAppDomain:](self, "setIsScanningPlaceholderAppDomain:", [v8 isPlaceholderAppDomain]);
    unsigned __int8 v14 = [(MBDomainTranscriber *)self scanner];
    id v15 = [v14 scanDomain:v8 snapshotMountPoint:v9];

    if (!MBSnapshotFormatContainsFileLists())
    {
      char v12 = 1;
LABEL_50:

      goto LABEL_51;
    }
    uint64_t v16 = [(MBDomainTranscriber *)self openedFileListDatabase];
    id v17 = (void *)v16;
    if (v15)
    {
      id v18 = MBGetDefaultLog();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 138412290;
      id v58 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "=transcribing= Failed to scan for changes: %@", buf, 0xCu);
      goto LABEL_16;
    }
    if (!v16)
    {
      if ([(MBDomainTranscriber *)self modifiedFileCountInCurrentlyScannedDomain])
      {
        __assert_rtn("-[MBDomainTranscriber _scanDomain:snapshotPathForDomain:error:]", "MBDomainTranscriber.m", 265, "self.modifiedFileCountInCurrentlyScannedDomain == 0");
      }
      if ([(MBDomainTranscriber *)self unmodifiedFileCountInCurrentlyScannedDomain])
      {
        __assert_rtn("-[MBDomainTranscriber _scanDomain:snapshotPathForDomain:error:]", "MBDomainTranscriber.m", 266, "self.unmodifiedFileCountInCurrentlyScannedDomain == 0");
      }
      id v21 = [(MBDomainTranscriber *)self summary];
      objc_msgSend(v21, "setEmptyDomainCount:", (char *)objc_msgSend(v21, "emptyDomainCount") + 1);

      id v22 = [(MBDomainTranscriber *)self snapshotDatabaseDirectory];
      id v23 = [(MBDomainTranscriber *)self pendingCommitID];
      unint64_t v24 = [v8 name];
      int64_t v25 = MBFileListDBPath(v22, (uint64_t)v23, v24);

      v26 = +[NSFileManager defaultManager];
      unsigned int v27 = [v26 fileExistsAtPath:v25];

      if (!v27) {
        goto LABEL_28;
      }
      v52 = v25;
      id v28 = MBGetDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v58 = v8;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "=transcribing= Found domain that went from populated to empty %{public}@", buf, 0xCu);
        id v49 = v8;
        _MBLog();
      }

      v29 = [(MBDomainTranscriber *)self snapshotDatabaseDirectory];
      BOOL v30 = [(MBDomainTranscriber *)self pendingCommitID];
      v31 = [v8 name];
      id v17 = +[MBFileListDB openOrCreateDatabaseIn:v29 commitID:v30 domainName:v31 error:a5];

      int64_t v25 = v52;
      if (!v17)
      {
LABEL_28:
        char v12 = v27 ^ 1;

        id v17 = 0;
        id v15 = 0;
        goto LABEL_49;
      }
      [(MBDomainTranscriber *)self setOpenedFileListDatabase:v17];
      v32 = [(MBDomainTranscriber *)self volumeIdentifierForCurrentlyScannedDomain];
      id v33 = [v32 backupVolumeUUID];
      unsigned int v34 = [v17 beginTranscriptionForVolumeUUID:v33 error:a5];

      if (!v34)
      {
        id v15 = 0;
        goto LABEL_27;
      }
    }
    id v56 = 0;
    unint64_t v19 = (unint64_t)objc_msgSend(v17, "countFilesMarkedAsDeleted:", &v56, v49);
    id v20 = v56;
    if (v20)
    {
      id v15 = v20;
      id v18 = MBGetDefaultLog();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 138412290;
      id v58 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "=transcribing= Failed to count files marked as deleted: %@", buf, 0xCu);
LABEL_16:
      _MBLog();
LABEL_17:

      if (a5)
      {
        id v15 = v15;
        char v12 = 0;
        *a5 = v15;
LABEL_49:

        goto LABEL_50;
      }
LABEL_27:
      char v12 = 0;
      goto LABEL_49;
    }
    long long v35 = [(MBDomainTranscriber *)self summary];
    objc_msgSend(v35, "setDeletedFileCount:", (char *)objc_msgSend(v35, "deletedFileCount") + v19);

    uint64_t v36 = [(MBDomainTranscriber *)self pendingSnapshotDatabase];
    if (!v36) {
      __assert_rtn("-[MBDomainTranscriber _scanDomain:snapshotPathForDomain:error:]", "MBDomainTranscriber.m", 295, "pendingSnapshotDatabase");
    }
    long long v37 = (void *)v36;
    if (v19)
    {
      long long v38 = [v8 name];
      v53 = v37;
      id v55 = 0;
      unsigned __int8 v39 = [v37 markDomainRequiringFileListCopy:v38 error:&v55];
      id v15 = v55;

      if ((v39 & 1) == 0)
      {
        if (a5) {
          *a5 = v15;
        }
        v46 = MBGetDefaultLog();
        long long v37 = v53;
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          char v12 = 0;
          goto LABEL_47;
        }
        v47 = [v8 name];
        *(_DWORD *)buf = 138412546;
        id v58 = v47;
        __int16 v59 = 2112;
        unint64_t v60 = (unint64_t)v15;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "=transcribing= Failed to mark domain %@ as requiring upload after scanning: %@", buf, 0x16u);

        v45 = [v8 name];
        _MBLog();
        char v12 = 0;
LABEL_43:

LABEL_47:
        goto LABEL_48;
      }
      long long v37 = v53;
    }
    else
    {
      id v15 = 0;
    }
    if ([v17 finishTranscription:a5])
    {
      if ([(MBDomainTranscriber *)self modifiedFileCountInCurrentlyScannedDomain] | v19)
      {
        v54 = v37;
        v40 = [(MBDomainTranscriber *)self attemptSummary];
        v41 = [v8 name];
        [v40 trackModifiedDomainInTranscription:v41];

        v42 = MBGetDefaultLog();
        char v12 = 1;
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          long long v37 = v54;
          v46 = v42;
          goto LABEL_47;
        }
        v50 = [v8 name];
        v51 = v42;
        unint64_t v43 = [(MBDomainTranscriber *)self modifiedFileCountInCurrentlyScannedDomain];
        unint64_t v44 = [(MBDomainTranscriber *)self unmodifiedFileCountInCurrentlyScannedDomain];
        *(_DWORD *)buf = 138544130;
        id v58 = v50;
        __int16 v59 = 2048;
        unint64_t v60 = v43;
        __int16 v61 = 2048;
        unint64_t v62 = v44;
        __int16 v63 = 2048;
        unint64_t v64 = v19;
        char v12 = 1;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "=transcribing= Changes found for %{public}@ modifications:%llu unmodified:%llu deletions:%llu", buf, 0x2Au);

        v45 = [v8 name];
        [(MBDomainTranscriber *)self modifiedFileCountInCurrentlyScannedDomain];
        [(MBDomainTranscriber *)self unmodifiedFileCountInCurrentlyScannedDomain];
        _MBLog();
        v46 = v51;
        long long v37 = v54;
        goto LABEL_43;
      }
      char v12 = 1;
    }
    else
    {
      char v12 = 0;
    }
LABEL_48:

    goto LABEL_49;
  }
  [(MBDomainTranscriber *)self _cancel];
  if (a5)
  {
    [(id)objc_opt_class() _cancellationError];
    char v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v12 = 0;
  }
LABEL_52:

  return v12;
}

- (BOOL)_shouldPackFile:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MBDomainTranscriber *)self snapshotFormat];
  unsigned __int8 v6 = 0;
  switch(v5)
  {
    case 0:
      break;
    case 1:
      unsigned __int8 v6 = [v4 isDirectory];
      break;
    case 2:
    case 3:
      unsigned __int8 v6 = 1;
      break;
    default:
      __assert_rtn("-[MBDomainTranscriber _shouldPackFile:]", "MBDomainTranscriber.m", 331, "0");
  }

  return v6;
}

+ (id)_cancellationError
{
  return +[MBError errorWithCode:202 format:@"Domain transcription cancelled"];
}

- (id)fileScanner:(id)a3 didFindFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MBDomainTranscriber *)self delegate];
  unsigned int v9 = [v8 shouldCancelTranscription];

  if (v9)
  {
    [(MBDomainTranscriber *)self _cancel];
    id v10 = [(id)objc_opt_class() _cancellationError];
  }
  else if ([v7 isTopLevelDirectoryToExcludeFromiCloud])
  {
    id v10 = 0;
  }
  else
  {
    if (![(MBDomainTranscriber *)self _shouldPackFile:v7]
      || [(MBDomainTranscriber *)self isScanningPlaceholderAppDomain]
      || (id v15 = 0,
          [(MBDomainTranscriber *)self _collectFileIntoOpenedFileListDatabase:v7 error:&v15], (id v11 = v15) == 0))
    {
      id v11 = [(MBDomainTranscriber *)self compatibilityDelegate];
      if (v11)
      {
        unsigned __int8 v12 = [(MBDomainTranscriber *)self isScanningPlaceholderDomain];

        if (v12)
        {
          id v11 = 0;
        }
        else
        {
          id v13 = [(MBDomainTranscriber *)self compatibilityDelegate];
          id v11 = [v13 fileScanner:v6 didFindFile:v7];
        }
      }
    }
    id v10 = v11;
  }
  return v10;
}

- (id)_metadataFromFile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  [v5 getNode:v15];
  id v6 = +[MBFileMetadata fileMetadataExcludingXattrsAndAssetFromNode:v15 error:a4];
  if (v6)
  {
    if (![v5 isSymbolicLink])
    {
LABEL_5:
      id v9 = v6;
      goto LABEL_10;
    }
    id v14 = 0;
    id v7 = +[MBFileOperation symbolicLinkTargetWithPathFSR:error:](MBFileOperation, "symbolicLinkTargetWithPathFSR:error:", [v5 absolutePathFSR], &v14);
    id v8 = v14;
    if (v7)
    {
      [v6 setLinkTarget:v7];

      goto LABEL_5;
    }
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v5 absolutePath];
      *(_DWORD *)buf = 138412546;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=transcribing= Failed to get link target for file %@: %@", buf, 0x16u);

      id v13 = [v5 absolutePath];
      _MBLog();
    }
  }
  id v9 = 0;
LABEL_10:

  return v9;
}

- (void)_trackModifiedFile:(id)a3
{
  id v6 = a3;
  [(MBDomainTranscriber *)self setModifiedFileCountInCurrentlyScannedDomain:(char *)[(MBDomainTranscriber *)self modifiedFileCountInCurrentlyScannedDomain]+ 1];
  unint64_t v4 = (unint64_t)[v6 mode] & 0xF000;
  switch(v4)
  {
    case 0x4000:
      id v5 = [(MBDomainTranscriber *)self summary];
      objc_msgSend(v5, "setModifiedDirectories:", (char *)objc_msgSend(v5, "modifiedDirectories") + 1);
      break;
    case 0xA000:
      id v5 = [(MBDomainTranscriber *)self summary];
      objc_msgSend(v5, "setModifiedSymlinks:", (char *)objc_msgSend(v5, "modifiedSymlinks") + 1);
      break;
    case 0x8000:
      id v5 = [(MBDomainTranscriber *)self summary];
      objc_msgSend(v5, "setModifiedRegularFiles:", (char *)objc_msgSend(v5, "modifiedRegularFiles") + 1);
      break;
    default:
      __assert_rtn("-[MBDomainTranscriber _trackModifiedFile:]", "MBDomainTranscriber.m", 395, "0");
  }
}

- (void)_trackUnmodifiedFile:(id)a3
{
  id v6 = a3;
  [(MBDomainTranscriber *)self setUnmodifiedFileCountInCurrentlyScannedDomain:(char *)[(MBDomainTranscriber *)self unmodifiedFileCountInCurrentlyScannedDomain]+ 1];
  unint64_t v4 = (unint64_t)[v6 mode] & 0xF000;
  switch(v4)
  {
    case 0x4000:
      id v5 = [(MBDomainTranscriber *)self summary];
      objc_msgSend(v5, "setUnmodifiedDirectories:", (char *)objc_msgSend(v5, "unmodifiedDirectories") + 1);
      break;
    case 0xA000:
      id v5 = [(MBDomainTranscriber *)self summary];
      objc_msgSend(v5, "setUnmodifiedSymlinks:", (char *)objc_msgSend(v5, "unmodifiedSymlinks") + 1);
      break;
    case 0x8000:
      id v5 = [(MBDomainTranscriber *)self summary];
      objc_msgSend(v5, "setUnmodifiedRegularFiles:", (char *)objc_msgSend(v5, "unmodifiedRegularFiles") + 1);
      break;
    default:
      __assert_rtn("-[MBDomainTranscriber _trackUnmodifiedFile:]", "MBDomainTranscriber.m", 412, "0");
  }
}

- (BOOL)_encryptionKeyForFile:(id)a3 existingEncryptionKey:(id)a4 outEncryptionKey:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a5) {
    *a5 = 0;
  }
  if (+[MBProtectionClassUtils canOpenWhenLocked:](MBProtectionClassUtils, "canOpenWhenLocked:", [v10 protectionClass]))
  {
    BOOL v12 = 1;
    goto LABEL_13;
  }
  if ([v10 size])
  {
    unint64_t v20 = 0;
    id v13 = [(MBDomainTranscriber *)self missedEncryptionKeysDB];
    id v14 = [(MBDomainTranscriber *)self device];
    id v19 = 0;
    id v15 = MBFetchEncryptionKeyForFile(v10, v11, v13, v14, &v20, &v19);
    id v16 = v19;

    BOOL v12 = v15 != 0;
    if (v15)
    {
      id v17 = v15;
      a6 = a5;
      if (!a5)
      {
LABEL_9:

        goto LABEL_13;
      }
    }
    else
    {
      id v17 = v16;
      if (!a6) {
        goto LABEL_9;
      }
    }
    *a6 = v17;
    goto LABEL_9;
  }
  BOOL v12 = 1;
  if (v11 && a5) {
    *a5 = v11;
  }
LABEL_13:

  return v12;
}

- (id)_assetMetadataForRenamedOrHardlinkedFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MBDomainTranscriber *)self openedFileListDatabase];
  if (([v7 isTransitioningVolumes] & 1) != 0
    || ([v6 hasOverriddenModifiedDate] & 1) != 0)
  {

LABEL_4:
    id v8 = 0;
    goto LABEL_5;
  }
  id v10 = [v6 size];

  if (!v10) {
    goto LABEL_4;
  }
  id v11 = [(MBDomainTranscriber *)self openedFileListDatabase];
  id v34 = 0;
  unsigned int v12 = objc_msgSend(v11, "fetchAssetMetdataWithInode:genCount:outAssetMetadata:error:", objc_msgSend(v6, "inodeNumber"), objc_msgSend(v6, "genCount"), &v34, a4);
  id v13 = v34;

  id v8 = 0;
  if (v12 && v13)
  {
    id v14 = [v13 encryptionKey];
    id v33 = 0;
    unsigned __int8 v15 = [(MBDomainTranscriber *)self _encryptionKeyForFile:v6 existingEncryptionKey:v14 outEncryptionKey:&v33 error:a4];
    id v16 = v33;

    if (v15)
    {
      id v17 = [v13 encryptionKey];
      char v18 = sub_10020A0C4(v17, v16);

      if (v18)
      {
        id v19 = [v13 encryptionKey];

        if (v19)
        {
          unint64_t v20 = MBGetDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = [v6 domain];
            id v22 = [v6 relativePath];
            *(_DWORD *)buf = 138412546;
            uint64_t v36 = v21;
            __int16 v37 = 2112;
            long long v38 = v22;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "=transcribing= Reusing encryption key for renamed or hardlinked file %@:%@", buf, 0x16u);

            id v23 = [v6 domain];
            [v6 relativePath];
            v32 = v31 = v23;
            _MBLog();
          }
        }
        unint64_t v24 = objc_msgSend(v13, "recordIDSuffix", v31, v32);
        int64_t v25 = [v13 assetSignature];
        id v8 = +[MBAssetMetadata assetMetadataFromRecordIDSuffix:signature:size:type:compressionMethod:encryptionKey:](MBAssetMetadata, "assetMetadataFromRecordIDSuffix:signature:size:type:compressionMethod:encryptionKey:", v24, v25, [v13 assetSize], objc_msgSend(v13, "assetType"), objc_msgSend(v13, "compressionMethod"), v16);
        goto LABEL_23;
      }
      unint64_t v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [v6 domain];
        BOOL v30 = [v6 relativePath];
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = v29;
        __int16 v37 = 2112;
        long long v38 = v30;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=transcribing= Cannot reuse asset for renamed or hardlinked file %@:%@ - encryption key changed", buf, 0x16u);

        int64_t v25 = [v6 domain];
        id v28 = [v6 relativePath];
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [v6 domain];
        unsigned int v27 = [v6 relativePath];
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = v26;
        __int16 v37 = 2112;
        long long v38 = v27;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=transcribing= Cannot reuse asset for renamed or hardlinked file %@:%@ - failed to fetch encryption key", buf, 0x16u);

        int64_t v25 = [v6 domain];
        id v28 = [v6 relativePath];
LABEL_22:
        _MBLog();

        id v8 = 0;
LABEL_23:

LABEL_25:
        goto LABEL_26;
      }
    }
    id v8 = 0;
    goto LABEL_25;
  }
LABEL_26:

LABEL_5:
  return v8;
}

- (BOOL)_fileListContainsValidFileMetadata:(id)a3 forFile:(id)a4 metadata:(id)a5 outModificationType:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = +[MBFileMetadata modificationTypeForMetadata:a5 oldMetadata:v10];
  *a6 = v12;
  id v13 = [(MBDomainTranscriber *)self openedFileListDatabase];
  unsigned __int8 v14 = [v13 isTransitioningVolumes];

  char v15 = 0;
  if ((v14 & 1) == 0 && !v12)
  {
    id v16 = [v10 assetMetadata];
    if ([v16 isPendingUpload]
      && ([v16 encryptionKey], id v17 = objc_claimAutoreleasedReturnValue(), v17, v17))
    {
      char v18 = [v16 encryptionKey];
      id v28 = 0;
      id v29 = 0;
      unsigned __int8 v19 = [(MBDomainTranscriber *)self _encryptionKeyForFile:v11 existingEncryptionKey:v18 outEncryptionKey:&v29 error:&v28];
      id v20 = v29;
      id v21 = v28;

      if (v19)
      {
        id v22 = [v16 encryptionKey];
        char v15 = sub_10020A0C4(v22, v20);
      }
      else
      {
        id v22 = MBGetDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v11 domain];
          unint64_t v24 = [v11 relativePath];
          *(_DWORD *)buf = 138412802;
          v31 = v23;
          __int16 v32 = 2112;
          id v33 = v24;
          __int16 v34 = 2112;
          id v35 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "=transcribing= Could not determine if encryption key in file list for %@:%@ is still valid: %@", buf, 0x20u);

          int64_t v25 = [v11 domain];
          unsigned int v27 = [v11 relativePath];
          _MBLog();
        }
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 1;
    }
  }
  return v15;
}

- (BOOL)_fetchPreviouslyBackedUpEncryptionKeyForFile:(id)a3 oldMetadata:(id)a4 outEncryptionKey:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!a5) {
    __assert_rtn("-[MBDomainTranscriber _fetchPreviouslyBackedUpEncryptionKeyForFile:oldMetadata:outEncryptionKey:error:]", "MBDomainTranscriber.m", 511, "outEncryptionKey");
  }
  unint64_t v12 = v11;
  *a5 = 0;
  id v13 = [v10 inodeNumber];
  unsigned __int8 v14 = [(MBDomainTranscriber *)self openedFileListDatabase];
  unsigned int v15 = [v14 isTransitioningVolumes];

  if (v15)
  {
    *a5 = 0;
    id v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [v10 domain];
      char v18 = [v17 name];
      unsigned __int8 v19 = [v10 relativePath];
      *(_DWORD *)buf = 138412802;
      id v28 = v18;
      __int16 v29 = 2112;
      BOOL v30 = v19;
      __int16 v31 = 2048;
      id v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "=transcribing= Not reusing encryption key for file %@:%@ (inode:%llu) during volume transition", buf, 0x20u);

      id v20 = [v10 domain];
      id v21 = [v20 name];
      v26 = [v10 relativePath];
      _MBLog();
    }
  }
  else
  {
    if (v13 != [v12 inode])
    {
      unint64_t v24 = [(MBDomainTranscriber *)self openedFileListDatabase];
      unsigned __int8 v23 = [v24 fetchEncryptionKeyForInode:v13 outEncryptionKey:a5 error:a6];

      goto LABEL_10;
    }
    id v22 = [v12 assetMetadata];
    *a5 = [v22 encryptionKey];
  }
  unsigned __int8 v23 = 1;
LABEL_10:

  return v23;
}

- (id)_assetMetadataFromFile:(id)a3 oldMetadata:(id)a4 modificationType:(unint64_t)a5 outRequiresInvalidation:(BOOL *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  if (!a6) {
    __assert_rtn("-[MBDomainTranscriber _assetMetadataFromFile:oldMetadata:modificationType:outRequiresInvalidation:error:]", "MBDomainTranscriber.m", 534, "outRequiresInvalidation");
  }
  unsigned __int8 v14 = v13;
  unsigned int v15 = [(MBDomainTranscriber *)self openedFileListDatabase];
  unsigned int v16 = [v15 isTransitioningVolumes];

  if (a5 & 0x201) == 0 || (v16) {
    goto LABEL_10;
  }
  id v69 = 0;
  id v17 = [(MBDomainTranscriber *)self _assetMetadataForRenamedOrHardlinkedFile:v12 error:&v69];
  id v18 = v69;
  if (!v18)
  {
    if (v17)
    {
      id v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = [v12 domain];
        id v22 = [v12 relativePath];
        id v23 = [v12 inodeNumber];
        unsigned int v24 = [v12 genCount];
        *(_DWORD *)buf = 138413314;
        os_log_t v71 = v17;
        __int16 v72 = 2112;
        uint64_t v73 = (uint64_t)v21;
        __int16 v74 = 2112;
        v75 = v22;
        __int16 v76 = 2048;
        unint64_t v77 = (unint64_t)v23;
        __int16 v78 = 1024;
        unsigned int v79 = v24;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "=transcribing= Reusing asset %@ for renamed or hardlinked file %@:%@ (inode:%llu gc:%d)", buf, 0x30u);

        int64_t v25 = [v12 domain];
        v26 = [v12 relativePath];
        [v12 inodeNumber];
        [v12 genCount];
        _MBLog();
      }
      unsigned int v27 = [(MBDomainTranscriber *)self summary];
      objc_msgSend(v27, "setReusedAssetRecords:", (char *)objc_msgSend(v27, "reusedAssetRecords") + 1);

      id v17 = v17;
      id v19 = 0;
      id v28 = v17;
      goto LABEL_34;
    }
LABEL_10:
    if (+[MBProtectionClassUtils canOpenWhenLocked:](MBProtectionClassUtils, "canOpenWhenLocked:", [v12 protectionClass]))
    {
      id v19 = 0;
    }
    else
    {
      id v68 = 0;
      unsigned int v29 = [(MBDomainTranscriber *)self _fetchPreviouslyBackedUpEncryptionKeyForFile:v12 oldMetadata:v14 outEncryptionKey:&v68 error:a7];
      id v19 = v68;
      id v28 = 0;
      if (!v29) {
        goto LABEL_35;
      }
    }
    id v67 = 0;
    unsigned int v30 = [(MBDomainTranscriber *)self _encryptionKeyForFile:v12 existingEncryptionKey:v19 outEncryptionKey:&v67 error:a7];
    id v17 = v67;
    if (!v30) {
      goto LABEL_23;
    }
    __int16 v31 = [v14 assetMetadata];
    os_log_t v32 = v31;
    if (!v31) {
      goto LABEL_29;
    }
    os_log_t v65 = v31;
    id v33 = [v31 encryptionKey];
    id v34 = v12;
    id v35 = v17;
    if (a5 != 1)
    {
      __int16 v61 = v35;
      __int16 v63 = v34;
      if (sub_10020A0C4(v35, v33))
      {
        if (!v16)
        {
          unsigned int v47 = [v34 hasOverriddenModifiedDate];
          unsigned int v48 = (a5 >> 1) & 1;
          uint64_t v49 = 2560;
          if (v47) {
            uint64_t v49 = 2562;
          }
          else {
            LOBYTE(v48) = 0;
          }
          unint64_t v60 = v49 & a5;
          *a6 = v48;

          os_log_t v32 = v65;
          if (!v60)
          {
LABEL_42:
            if (*a6) {
              __assert_rtn("-[MBDomainTranscriber _assetMetadataFromFile:oldMetadata:modificationType:outRequiresInvalidation:error:]", "MBDomainTranscriber.m", 566, "*outRequiresInvalidation == NO");
            }
            v50 = MBGetDefaultLog();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              unint64_t v62 = [v34 domain];
              unint64_t v64 = [v34 relativePath];
              os_log_t v66 = v50;
              *(_DWORD *)buf = 138413314;
              os_log_t v71 = v32;
              __int16 v72 = 2112;
              uint64_t v73 = (uint64_t)v62;
              __int16 v74 = 2112;
              v75 = v64;
              __int16 v76 = 2048;
              unint64_t v77 = a5;
              __int16 v78 = 1024;
              unsigned int v79 = v16;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "=transcribing= Reusing asset %@ for %@:%@ because of metadata-only change 0x%lx (isTransitioningVolumeUUIDs %d)", buf, 0x30u);

              v51 = [v34 domain];
              id v56 = [v34 relativePath];
              _MBLog();

              v50 = v66;
            }

            v52 = [(MBDomainTranscriber *)self summary];
            objc_msgSend(v52, "setReusedAssetRecords:", (char *)objc_msgSend(v52, "reusedAssetRecords") + 1);

            v45 = v32;
            goto LABEL_33;
          }
LABEL_29:
          if (objc_msgSend(v12, "size", v53, v54)) {
            +[MBAssetMetadata assetMetadataForFilePendingUploadWithEncryptionKey:size:](MBAssetMetadata, "assetMetadataForFilePendingUploadWithEncryptionKey:size:", v17, [v12 size]);
          }
          else {
          v45 = +[MBAssetMetadata assetMetadataForEmptyFileWithEncryptionKey:v17];
          }
LABEL_33:
          id v28 = v45;

          goto LABEL_34;
        }
        unint64_t v36 = (unint64_t)[v34 inodeNumber];
        if ((a5 & 0xCE) == 0 && (v36 & 0x8000000000000000) == 0)
        {
          __int16 v59 = v33;
          __int16 v37 = MBGetDefaultLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            log = v37;
            v57 = [v34 domain];
            uint64_t v38 = [v34 relativePath];
            *(_DWORD *)buf = 138412546;
            os_log_t v71 = v57;
            __int16 v72 = 2112;
            uint64_t v73 = v38;
            unsigned __int8 v39 = (void *)v38;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "=transcribing= Can re-use asset for file %@:%@ across volumeUUID transition", buf, 0x16u);

            v40 = [v34 domain];
            __int16 v37 = log;
            id v55 = [v63 relativePath];
            _MBLog();
          }
          *a6 = 0;

          id v34 = v63;
          os_log_t v32 = v65;
          goto LABEL_42;
        }
        *a6 = 1;
      }
      else
      {
        v41 = MBGetDefaultLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = [v34 domain];
          unint64_t v43 = [v34 relativePath];
          *(_DWORD *)buf = 138412546;
          os_log_t v71 = v42;
          __int16 v72 = 2112;
          uint64_t v73 = (uint64_t)v43;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "=transcribing= File %@:%@ requires asset upload - encryption keys are not equal", buf, 0x16u);

          unint64_t v44 = [v34 domain];
          [v34 relativePath];
          v54 = v53 = v44;
          _MBLog();
        }
      }
      id v35 = v61;
    }

    os_log_t v32 = v65;
    goto LABEL_29;
  }
  id v19 = v18;
LABEL_23:
  id v28 = 0;
LABEL_34:

LABEL_35:
  return v28;
}

- (BOOL)_collectFileIntoOpenedFileListDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MBDomainTranscriber *)self openedFileListDatabase];
  if (v7) {
    goto LABEL_2;
  }
  id v13 = [(MBDomainTranscriber *)self snapshotDatabaseDirectory];
  unsigned __int8 v14 = [(MBDomainTranscriber *)self pendingCommitID];
  unsigned int v15 = [v6 domain];
  unsigned int v16 = [v15 name];
  id v7 = +[MBFileListDB openOrCreateDatabaseIn:v13 commitID:v14 domainName:v16 error:a4];

  if (v7)
  {
    [(MBDomainTranscriber *)self setOpenedFileListDatabase:v7];
    id v17 = [(MBDomainTranscriber *)self volumeIdentifierForCurrentlyScannedDomain];
    id v18 = [v17 backupVolumeUUID];
    unsigned int v19 = [v7 beginTranscriptionForVolumeUUID:v18 error:a4];

    if (v19)
    {
      if ([v7 isTransitioningVolumes])
      {
        id v20 = [(MBDomainTranscriber *)self summary];
        objc_msgSend(v20, "setDomainsTransitioningVolumes:", (char *)objc_msgSend(v20, "domainsTransitioningVolumes") + 1);
      }
LABEL_2:
      id v8 = [v6 relativePath];
      id v113 = 0;
      id v9 = [v7 fileMetadataForPath:v8 fetchXattrs:0 error:&v113];
      id v10 = v113;

      if (v10)
      {
        id v11 = MBGetDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v115 = v6;
          __int16 v116 = 2112;
          uint64_t v117 = (uint64_t)v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "=transcribing= Failed to fetch old metadata for file %@: %@", buf, 0x16u);
          _MBLog();
        }

        if (a4)
        {
          id v10 = v10;
          BOOL v12 = 0;
          *a4 = v10;
        }
        else
        {
          BOOL v12 = 0;
        }
        goto LABEL_80;
      }
      id v112 = 0;
      id v21 = [(MBDomainTranscriber *)self _metadataFromFile:v6 error:&v112];
      id v22 = v112;
      id v10 = v22;
      if (!v21)
      {
        if (a4) {
          *a4 = v22;
        }
        unsigned int v24 = MBGetDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v115 = v6;
          __int16 v116 = 2112;
          uint64_t v117 = (uint64_t)v10;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "=transcribing= Failed to create metadata from file %@: %@", buf, 0x16u);
          _MBLog();
        }

        BOOL v12 = 0;
        goto LABEL_79;
      }
      v111 = 0;
      if ([(MBDomainTranscriber *)self _fileListContainsValidFileMetadata:v9 forFile:v6 metadata:v21 outModificationType:&v111])
      {
        id v23 = [v6 relativePath];
        [v7 markFileAsPresent:v23 error:a4];

        [(MBDomainTranscriber *)self _trackUnmodifiedFile:v6];
        BOOL v12 = 1;
LABEL_79:

LABEL_80:
        goto LABEL_81;
      }
      int64_t v25 = [v6 absolutePath];
      v103 = v25;
      if ([v6 hasXattrs])
      {
        id v110 = 0;
        v26 = +[MBExtendedAttributes attributesForPathFSR:error:](MBExtendedAttributes, "attributesForPathFSR:error:", [v6 absolutePathFSR], &v110);
        id v27 = v110;
        if (v27)
        {
          id v28 = v27;
          unsigned int v29 = MBGetDefaultLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v115 = v25;
            __int16 v116 = 2112;
            uint64_t v117 = (uint64_t)v28;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "=transcribing= Failed to fetch xattrs for %{public}@: %@", buf, 0x16u);
            _MBLog();
          }

          if (a4) {
            *a4 = v28;
          }

          BOOL v12 = 0;
          goto LABEL_78;
        }
        [v21 setXattrs:v26];
        unsigned int v30 = MBGetDefaultLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          __int16 v31 = [v6 domain];
          [v6 relativePath];
          os_log_t v32 = v95 = v26;
          v98 = [v21 xattrs];
          id v33 = [v98 count];
          *(_DWORD *)buf = 138412802;
          id v115 = v31;
          __int16 v116 = 2114;
          uint64_t v117 = (uint64_t)v32;
          __int16 v118 = 2048;
          id v119 = v33;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "=transcribing= Fetched xattrs for %@:%{public}@ count:%llu", buf, 0x20u);

          v26 = v95;
          v99 = [v6 domain];
          id v34 = [v6 relativePath];
          [v21 xattrs];
          id v35 = v96 = v30;
          v87 = v34;
          id v91 = [v35 count];
          v84 = v99;
          _MBLog();

          unsigned int v30 = v96;
        }
      }
      char v109 = 0;
      if (objc_msgSend(v6, "isRegularFile", v84, v87, v91))
      {
        id v108 = v10;
        unint64_t v36 = [(MBDomainTranscriber *)self _assetMetadataFromFile:v6 oldMetadata:v9 modificationType:v111 outRequiresInvalidation:&v109 error:&v108];
        id v37 = v108;

        if (!v36)
        {
          unsigned int v66 = +[MBError isError:v37 withCode:209];
          id v67 = MBGetDefaultLog();
          id v68 = v67;
          if (v66)
          {
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              id v69 = [v6 domain];
              v70 = [v69 name];
              os_log_t v71 = [v6 relativePath];
              *(_DWORD *)buf = 138412546;
              id v115 = v70;
              __int16 v116 = 2112;
              uint64_t v117 = (uint64_t)v71;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "=transcribing= Not updating metadata for file %@:%@ with missing encryption key", buf, 0x16u);

              __int16 v72 = [v6 domain];
              uint64_t v73 = [v72 name];
              v89 = [v6 relativePath];
              _MBLog();
            }
            BOOL v12 = 1;
          }
          else
          {
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              __int16 v78 = [v6 domain];
              unsigned int v79 = [v78 name];
              v80 = [v6 absolutePath];
              *(_DWORD *)buf = 138412546;
              id v115 = v79;
              __int16 v116 = 2112;
              uint64_t v117 = (uint64_t)v80;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "=transcribing= Failed to fetch asset metadata for %@:%@", buf, 0x16u);

              v81 = [v6 domain];
              v82 = [v81 name];
              v90 = [v6 absolutePath];
              _MBLog();
            }
            if (a4)
            {
              id v37 = v37;
              BOOL v12 = 0;
              *a4 = v37;
            }
            else
            {
              BOOL v12 = 0;
            }
          }
LABEL_76:
          int64_t v25 = v103;
          goto LABEL_77;
        }
        [v21 setAssetMetadata:v36];

        id v10 = v37;
      }
      if (![(MBDomainTranscriber *)self modifiedFileCountInCurrentlyScannedDomain])
      {
        uint64_t v38 = [(MBDomainTranscriber *)self pendingSnapshotDatabase];
        unsigned __int8 v39 = [v6 domain];
        v40 = [v39 name];
        id v107 = v10;
        unsigned __int8 v100 = [v38 markDomainRequiringFileListCopy:v40 error:&v107];
        id v97 = v107;

        if ((v100 & 1) == 0)
        {
          int64_t v25 = v103;
          id v37 = v97;
          if (a4) {
            *a4 = v97;
          }
          os_log_t v65 = MBGetDefaultLog();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            __int16 v74 = [v6 domain];
            v75 = [v74 name];
            *(_DWORD *)buf = 138412546;
            id v115 = v75;
            __int16 v116 = 2112;
            uint64_t v117 = (uint64_t)v97;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "=transcribing= Failed to mark domain %@ as requiring upload during scanning: %@", buf, 0x16u);

            __int16 v76 = [v6 domain];
            v86 = [v76 name];
            _MBLog();

            int64_t v25 = v103;
          }
          goto LABEL_63;
        }
        id v10 = v97;
      }
      [(MBDomainTranscriber *)self _trackModifiedFile:v6];
      if (MBIsInternalInstall())
      {
        v41 = [v21 assetMetadata];
        unsigned int v42 = [v41 isPendingUpload];

        unint64_t v43 = MBGetDefaultLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          unint64_t v44 = [v6 domain];
          uint64_t v45 = [v44 name];
          unsigned int v46 = v42;
          unsigned int v101 = v42;
          unsigned int v47 = (void *)v45;
          *(_DWORD *)buf = 138413314;
          id v115 = v21;
          __int16 v116 = 2112;
          uint64_t v117 = v45;
          __int16 v118 = 2112;
          id v119 = v103;
          __int16 v120 = 2048;
          v121 = v111;
          __int16 v122 = 1024;
          unsigned int v123 = v46;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "=transcribing= Updating metadata %@ for file %@:%@ m:0x%lx u:%d", buf, 0x30u);

          unsigned int v48 = [v6 domain];
          uint64_t v49 = [v48 name];
          v93 = v111;
          uint64_t v94 = v101;
          v88 = v49;
          v92 = v103;
          v85 = v21;
          _MBLog();
        }
      }
      if (v109)
      {
        v102 = v21;
        v50 = MBGetDefaultLog();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v51 = [v6 domain];
          v52 = [v51 name];
          *(_DWORD *)buf = 138412802;
          id v115 = v52;
          __int16 v116 = 2112;
          uint64_t v117 = (uint64_t)v103;
          __int16 v118 = 2048;
          id v119 = v111;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "=transcribing= Invalidating upload state in pending snapshot database for %@:%@ m:0x%lx", buf, 0x20u);

          v53 = [v6 domain];
          v54 = [v53 name];
          v88 = v103;
          v92 = v111;
          v85 = v54;
          _MBLog();
        }
        id v55 = [(MBDomainTranscriber *)self pendingSnapshotDatabase];
        id v56 = [v6 domain];
        v57 = [v56 name];
        id v106 = v10;
        unsigned __int8 v58 = objc_msgSend(v55, "invalidateUploadedAssetForDomain:inode:error:", v57, objc_msgSend(v6, "inodeNumber"), &v106);
        id v59 = v106;

        if ((v58 & 1) == 0)
        {
          int64_t v25 = v103;
          if (a4)
          {
            id v37 = v59;
            BOOL v12 = 0;
            *a4 = v37;
          }
          else
          {
            BOOL v12 = 0;
            id v37 = v59;
          }
          id v21 = v102;
          goto LABEL_77;
        }
        id v10 = v59;
        id v21 = v102;
      }
      unint64_t v60 = objc_msgSend(v6, "relativePath", v85, v88, v92, v93, v94);
      id v105 = v10;
      unsigned __int8 v61 = [v7 setFileMetadata:v21 forPath:v60 error:&v105];
      id v37 = v105;

      if (v61)
      {
        unint64_t v62 = [v6 relativePath];
        id v104 = v37;
        unsigned __int8 v63 = [v7 markFileAsPresent:v62 error:&v104];
        id v64 = v104;

        if ((v63 & 1) == 0)
        {
          if (a4) {
            *a4 = v64;
          }
          unint64_t v77 = MBGetDefaultLog();
          int64_t v25 = v103;
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v115 = v6;
            __int16 v116 = 2112;
            uint64_t v117 = (uint64_t)v64;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "=transcribing= Failed to mark file %@ as unmodified: %@", buf, 0x16u);
            _MBLog();
          }

          BOOL v12 = 0;
          id v37 = v64;
          goto LABEL_77;
        }
        BOOL v12 = 1;
        id v37 = v64;
        goto LABEL_76;
      }
      if (a4) {
        *a4 = v37;
      }
      os_log_t v65 = MBGetDefaultLog();
      int64_t v25 = v103;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v115 = v6;
        __int16 v116 = 2112;
        uint64_t v117 = (uint64_t)v37;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "=transcribing= Failed to add file %@ to FileListDatabase: %@", buf, 0x16u);
        _MBLog();
      }
LABEL_63:

      BOOL v12 = 0;
LABEL_77:
      id v10 = v37;
LABEL_78:

      goto LABEL_79;
    }
  }
  BOOL v12 = 0;
LABEL_81:

  return v12;
}

- (BOOL)fileScanner:(id)a3 failedToStatFile:(id)a4 withErrno:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MBDomainTranscriber *)self compatibilityDelegate];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v11 = [(MBDomainTranscriber *)self compatibilityDelegate];
    unsigned __int8 v12 = [v11 fileScanner:v8 failedToStatFile:v9 withErrno:v5];
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MBDomainTranscriber *)self compatibilityDelegate];

  if (v8)
  {
    id v9 = [(MBDomainTranscriber *)self compatibilityDelegate];
    unsigned __int8 v10 = [v9 fileScanner:v6 isFileAddedOrModified:v7];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (NSString)pendingCommitID
{
  return self->_pendingCommitID;
}

- (NSString)snapshotDatabaseDirectory
{
  return self->_snapshotDatabaseDirectory;
}

- (int64_t)snapshotFormat
{
  return self->_snapshotFormat;
}

- (MBMountedSnapshotTracker)mountedSnapshotTracker
{
  return self->_mountedSnapshotTracker;
}

- (MBFileScannerDelegate)compatibilityDelegate
{
  return self->_compatibilityDelegate;
}

- (MBDomainTranscriberDelegate)delegate
{
  return self->_delegate;
}

- (MBBackupAttemptSummary)attemptSummary
{
  return self->_attemptSummary;
}

- (MBFileScanner)scanner
{
  return self->_scanner;
}

- (MBCKDevice)device
{
  return self->_device;
}

- (_TtC7backupd11MBVolumeMap)volumeMap
{
  return self->_volumeMap;
}

- (NSMutableDictionary)volumeUUIDsByMountPoint
{
  return self->_volumeUUIDsByMountPoint;
}

- (MBMissedEncryptionKeysDB)missedEncryptionKeysDB
{
  return self->_missedEncryptionKeysDB;
}

- (void)setMissedEncryptionKeysDB:(id)a3
{
}

- (MBPendingSnapshotDB)pendingSnapshotDatabase
{
  return self->_pendingSnapshotDatabase;
}

- (void)setPendingSnapshotDatabase:(id)a3
{
}

- (MBDomainTranscriptionSummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (MBFileListDB)openedFileListDatabase
{
  return self->_openedFileListDatabase;
}

- (void)setOpenedFileListDatabase:(id)a3
{
}

- (_TtC7backupd18MBVolumeIdentifier)volumeIdentifierForCurrentlyScannedDomain
{
  return self->_volumeIdentifierForCurrentlyScannedDomain;
}

- (void)setVolumeIdentifierForCurrentlyScannedDomain:(id)a3
{
}

- (unint64_t)modifiedFileCountInCurrentlyScannedDomain
{
  return self->_modifiedFileCountInCurrentlyScannedDomain;
}

- (void)setModifiedFileCountInCurrentlyScannedDomain:(unint64_t)a3
{
  self->_modifiedFileCountInCurrentlyScannedDomain = a3;
}

- (unint64_t)unmodifiedFileCountInCurrentlyScannedDomain
{
  return self->_unmodifiedFileCountInCurrentlyScannedDomain;
}

- (void)setUnmodifiedFileCountInCurrentlyScannedDomain:(unint64_t)a3
{
  self->_unmodifiedFileCountInCurrentlyScannedDomain = a3;
}

- (BOOL)isScanningPlaceholderDomain
{
  return self->_isScanningPlaceholderDomain;
}

- (void)setIsScanningPlaceholderDomain:(BOOL)a3
{
  self->_isScanningPlaceholderDomain = a3;
}

- (BOOL)isScanningPlaceholderAppDomain
{
  return self->_isScanningPlaceholderAppDomain;
}

- (void)setIsScanningPlaceholderAppDomain:(BOOL)a3
{
  self->_isScanningPlaceholderAppDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeIdentifierForCurrentlyScannedDomain, 0);
  objc_storeStrong((id *)&self->_openedFileListDatabase, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_pendingSnapshotDatabase, 0);
  objc_storeStrong((id *)&self->_missedEncryptionKeysDB, 0);
  objc_storeStrong((id *)&self->_volumeUUIDsByMountPoint, 0);
  objc_storeStrong((id *)&self->_volumeMap, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_attemptSummary, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_compatibilityDelegate, 0);
  objc_storeStrong((id *)&self->_mountedSnapshotTracker, 0);
  objc_storeStrong((id *)&self->_snapshotDatabaseDirectory, 0);
  objc_storeStrong((id *)&self->_pendingCommitID, 0);
}

@end