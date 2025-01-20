@interface MBBackupAttemptSummary
- (BOOL)snapshotVerificationRan;
- (MBBackupAttemptSummary)init;
- (MBBackupAttemptSummary)initWithDictionaryRepresentation:(id)a3;
- (NSError)error;
- (NSMutableDictionary)durationByEngineState;
- (NSMutableSet)consolidatedDomainsInFileListSynchronization;
- (NSMutableSet)deletedDomainsInCommit;
- (NSMutableSet)deletedDomainsInFileListSynchronization;
- (NSMutableSet)downloadedDomainsInFileListSynchronization;
- (NSMutableSet)modifiedDomainsInCommit;
- (NSMutableSet)modifiedDomainsInTranscription;
- (NSMutableSet)repairedDomains;
- (NSMutableSet)skippedFileListCloneDomains;
- (NSMutableSet)snapshotVerificationFailures;
- (NSMutableSet)uploadedDomains;
- (NSSet)unknownDomainHMACsToRepair;
- (NSString)commitID;
- (NSString)previousSnapshotCommitID;
- (NSString)volumeMapLoadType;
- (double)assetCopyDuration;
- (double)assetUploadDuration;
- (double)uploadedAssetWriteDuration;
- (id)dictionaryRepresentation;
- (int64_t)snapshotFormat;
- (int64_t)snapshotType;
- (int64_t)totalQuotaReservation;
- (int64_t)uploadedAssetSize;
- (int64_t)uploadedFileListSize;
- (unint64_t)compactedSQLiteFileCount;
- (unint64_t)compressedSQLiteFileCount;
- (unint64_t)deletedFileCount;
- (unint64_t)domainsTransitioningVolumesCount;
- (unint64_t)emptyDomainCount;
- (unint64_t)legacyCacheSize;
- (unint64_t)modifiedDirectoryCount;
- (unint64_t)modifiedRegularFileCount;
- (unint64_t)modifiedSymlinkCount;
- (unint64_t)peakMemoryUsage;
- (unint64_t)reusedAssetCount;
- (unint64_t)scrubbedSQLiteFileCount;
- (unint64_t)snapshotDirectoryCloneSize;
- (unint64_t)snapshotDirectorySize;
- (unint64_t)unmodifiedDirectoryCount;
- (unint64_t)unmodifiedRegularFileCount;
- (unint64_t)unmodifiedSymlinkCount;
- (unint64_t)uploadedAssetCount;
- (void)setAssetCopyDuration:(double)a3;
- (void)setAssetUploadDuration:(double)a3;
- (void)setCommitID:(id)a3;
- (void)setCompactedSQLiteFileCount:(unint64_t)a3;
- (void)setCompressedSQLiteFileCount:(unint64_t)a3;
- (void)setConsolidatedDomainsInFileListSynchronization:(id)a3;
- (void)setDeletedDomainsInCommit:(id)a3;
- (void)setDeletedDomainsInFileListSynchronization:(id)a3;
- (void)setDownloadedDomainsInFileListSynchronization:(id)a3;
- (void)setDurationByEngineState:(id)a3;
- (void)setError:(id)a3;
- (void)setLegacyCacheSize:(unint64_t)a3;
- (void)setModifiedDomainsInCommit:(id)a3;
- (void)setModifiedDomainsInTranscription:(id)a3;
- (void)setPeakMemoryUsage:(unint64_t)a3;
- (void)setPreviousSnapshotCommitID:(id)a3;
- (void)setRepairedDomains:(id)a3;
- (void)setScrubbedSQLiteFileCount:(unint64_t)a3;
- (void)setSkippedFileListCloneDomains:(id)a3;
- (void)setSnapshotDirectoryCloneSize:(unint64_t)a3;
- (void)setSnapshotDirectorySize:(unint64_t)a3;
- (void)setSnapshotFormat:(int64_t)a3;
- (void)setSnapshotType:(int64_t)a3;
- (void)setSnapshotVerificationFailures:(id)a3;
- (void)setSnapshotVerificationRan:(BOOL)a3;
- (void)setTotalQuotaReservation:(int64_t)a3;
- (void)setUnknownDomainHMACsToRepair:(id)a3;
- (void)setUploadedAssetCount:(unint64_t)a3;
- (void)setUploadedAssetSize:(int64_t)a3;
- (void)setUploadedAssetWriteDuration:(double)a3;
- (void)setUploadedDomains:(id)a3;
- (void)setUploadedFileListSize:(int64_t)a3;
- (void)setVolumeMapLoadType:(id)a3;
- (void)trackConsolidatedDomainDuringFileListSynchronization:(id)a3;
- (void)trackDeletedDomainDuringFileListSynchronization:(id)a3;
- (void)trackDeletedDomainInCommit:(id)a3;
- (void)trackDomainTranscription:(id)a3;
- (void)trackDownloadedDomainDuringFileListSynchronization:(id)a3;
- (void)trackDuration:(double)a3 forEngineState:(id)a4;
- (void)trackModifiedDomainInCommit:(id)a3;
- (void)trackModifiedDomainInTranscription:(id)a3;
- (void)trackRepairedDomain:(id)a3;
- (void)trackSkippedFileListCloneDomain:(id)a3;
- (void)trackSnapshotVerificationFailure:(id)a3;
- (void)trackUploadedDomain:(id)a3;
@end

@implementation MBBackupAttemptSummary

- (MBBackupAttemptSummary)init
{
  v33.receiver = self;
  v33.super_class = (Class)MBBackupAttemptSummary;
  v2 = [(MBBackupAttemptSummary *)&v33 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    error = v2->_error;
    v2->_error = 0;

    commitID = v3->_commitID;
    v3->_commitID = 0;

    v3->_snapshotType = -1;
    v3->_snapshotFormat = -1;
    previousSnapshotCommitID = v3->_previousSnapshotCommitID;
    v3->_previousSnapshotCommitID = 0;

    uint64_t v7 = objc_opt_new();
    durationByEngineState = v3->_durationByEngineState;
    v3->_durationByEngineState = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    consolidatedDomainsInFileListSynchronization = v3->_consolidatedDomainsInFileListSynchronization;
    v3->_consolidatedDomainsInFileListSynchronization = (NSMutableSet *)v9;

    uint64_t v11 = objc_opt_new();
    deletedDomainsInFileListSynchronization = v3->_deletedDomainsInFileListSynchronization;
    v3->_deletedDomainsInFileListSynchronization = (NSMutableSet *)v11;

    uint64_t v13 = objc_opt_new();
    downloadedDomainsInFileListSynchronization = v3->_downloadedDomainsInFileListSynchronization;
    v3->_downloadedDomainsInFileListSynchronization = (NSMutableSet *)v13;

    volumeMapLoadType = v3->_volumeMapLoadType;
    v3->_volumeMapLoadType = 0;

    uint64_t v16 = objc_opt_new();
    modifiedDomainsInTranscription = v3->_modifiedDomainsInTranscription;
    v3->_modifiedDomainsInTranscription = (NSMutableSet *)v16;

    *(_OWORD *)&v3->_assetCopyDuration = 0u;
    *(_OWORD *)&v3->_reusedAssetCount = 0u;
    *(_OWORD *)&v3->_deletedFileCount = 0u;
    *(_OWORD *)&v3->_modifiedRegularFileCount = 0u;
    *(_OWORD *)&v3->_modifiedSymlinkCount = 0u;
    *(_OWORD *)&v3->_modifiedDirectoryCount = 0u;
    v3->_uploadedAssetWriteDuration = 0.0;
    v3->_uploadedFileListSize = 0;
    uint64_t v18 = objc_opt_new();
    uploadedDomains = v3->_uploadedDomains;
    v3->_uploadedDomains = (NSMutableSet *)v18;

    uint64_t v20 = objc_opt_new();
    modifiedDomainsInCommit = v3->_modifiedDomainsInCommit;
    v3->_modifiedDomainsInCommit = (NSMutableSet *)v20;

    uint64_t v22 = objc_opt_new();
    deletedDomainsInCommit = v3->_deletedDomainsInCommit;
    v3->_deletedDomainsInCommit = (NSMutableSet *)v22;

    uint64_t v24 = objc_opt_new();
    repairedDomains = v3->_repairedDomains;
    v3->_repairedDomains = (NSMutableSet *)v24;

    uint64_t v26 = objc_opt_new();
    unknownDomainHMACsToRepair = v3->_unknownDomainHMACsToRepair;
    v3->_unknownDomainHMACsToRepair = (NSSet *)v26;

    uint64_t v28 = objc_opt_new();
    skippedFileListCloneDomains = v3->_skippedFileListCloneDomains;
    v3->_skippedFileListCloneDomains = (NSMutableSet *)v28;

    *(_OWORD *)&v3->_legacyCacheSize = 0u;
    *(_OWORD *)&v3->_snapshotDirectoryCloneSize = 0u;
    uint64_t v30 = objc_opt_new();
    snapshotVerificationFailures = v3->_snapshotVerificationFailures;
    v3->_snapshotVerificationFailures = (NSMutableSet *)v30;

    v3->_snapshotVerificationRan = 0;
    *(_OWORD *)&v3->_uploadedAssetCount = 0u;
    *(_OWORD *)&v3->_compactedSQLiteFileCount = 0u;
  }
  return v3;
}

- (MBBackupAttemptSummary)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)MBBackupAttemptSummary;
  v5 = [(MBBackupAttemptSummary *)&v71 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 objectForKeyedSubscript:@"Error"];
    error = v6->_error;
    v6->_error = (NSError *)v7;

    uint64_t v9 = [v4 objectForKeyedSubscript:@"CommitID"];
    commitID = v6->_commitID;
    v6->_commitID = (NSString *)v9;

    uint64_t v11 = [v4 objectForKeyedSubscript:@"SnapshotType"];
    v6->_snapshotType = (int64_t)[v11 longLongValue];

    v12 = [v4 objectForKeyedSubscript:@"SnapshotFormat"];
    v6->_snapshotFormat = (int64_t)[v12 longLongValue];

    uint64_t v13 = [v4 objectForKeyedSubscript:@"PreviousSnapshot"];
    previousSnapshotCommitID = v6->_previousSnapshotCommitID;
    v6->_previousSnapshotCommitID = (NSString *)v13;

    uint64_t v15 = [v4 objectForKeyedSubscript:@"DurationsByEngineState"];
    durationByEngineState = v6->_durationByEngineState;
    v6->_durationByEngineState = (NSMutableDictionary *)v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:@"ConsolidatedDomainsInFileListSynchronization"];
    consolidatedDomainsInFileListSynchronization = v6->_consolidatedDomainsInFileListSynchronization;
    v6->_consolidatedDomainsInFileListSynchronization = (NSMutableSet *)v17;

    uint64_t v19 = [v4 objectForKeyedSubscript:@"DeletedDomainsInFileListSynchronization"];
    deletedDomainsInFileListSynchronization = v6->_deletedDomainsInFileListSynchronization;
    v6->_deletedDomainsInFileListSynchronization = (NSMutableSet *)v19;

    uint64_t v21 = [v4 objectForKeyedSubscript:@"DownloadedDomainsInFileListSynchronization"];
    downloadedDomainsInFileListSynchronization = v6->_downloadedDomainsInFileListSynchronization;
    v6->_downloadedDomainsInFileListSynchronization = (NSMutableSet *)v21;

    uint64_t v23 = [v4 objectForKeyedSubscript:@"ModifiedDomainsInTranscription"];
    modifiedDomainsInTranscription = v6->_modifiedDomainsInTranscription;
    v6->_modifiedDomainsInTranscription = (NSMutableSet *)v23;

    uint64_t v25 = [v4 objectForKeyedSubscript:@"VolumeMapLoadType"];
    volumeMapLoadType = v6->_volumeMapLoadType;
    v6->_volumeMapLoadType = (NSString *)v25;

    v27 = [v4 objectForKeyedSubscript:@"EmptyDomainCount"];
    v6->_emptyDomainCount = (unint64_t)[v27 unsignedLongLongValue];

    uint64_t v28 = [v4 objectForKeyedSubscript:@"ModifiedDirectoryCount"];
    v6->_modifiedDirectoryCount = (unint64_t)[v28 unsignedLongValue];

    v29 = [v4 objectForKeyedSubscript:@"DeletedFileCount"];
    v6->_deletedFileCount = (unint64_t)[v29 unsignedLongValue];

    uint64_t v30 = [v4 objectForKeyedSubscript:@"UnmodifiedDirectoryCount"];
    v6->_unmodifiedDirectoryCount = (unint64_t)[v30 unsignedLongValue];

    v31 = [v4 objectForKeyedSubscript:@"ModifiedDirectoryCount"];
    v6->_modifiedDirectoryCount = (unint64_t)[v31 unsignedLongValue];

    v32 = [v4 objectForKeyedSubscript:@"UnmodifiedSymlinkCount"];
    v6->_unmodifiedSymlinkCount = (unint64_t)[v32 unsignedLongLongValue];

    objc_super v33 = [v4 objectForKeyedSubscript:@"ModifiedSymlinkCount"];
    v6->_modifiedSymlinkCount = (unint64_t)[v33 unsignedLongLongValue];

    v34 = [v4 objectForKeyedSubscript:@"ReusedAssetCount"];
    v6->_reusedAssetCount = (unint64_t)[v34 unsignedLongLongValue];

    v35 = [v4 objectForKeyedSubscript:@"DomainsTransitioningVolumeCount"];
    v6->_domainsTransitioningVolumesCount = (unint64_t)[v35 unsignedLongLongValue];

    v36 = [v4 objectForKeyedSubscript:@"UnmodifiedRegularFileCount"];
    v6->_unmodifiedRegularFileCount = (unint64_t)[v36 unsignedLongLongValue];

    v37 = [v4 objectForKeyedSubscript:@"ModifiedRegularFileCount"];
    v6->_modifiedRegularFileCount = (unint64_t)[v37 unsignedLongLongValue];

    v38 = [v4 objectForKeyedSubscript:@"DeletedFileCount"];
    v6->_deletedFileCount = (unint64_t)[v38 unsignedLongValue];

    v39 = [v4 objectForKeyedSubscript:@"AssetCopyDuration"];
    [v39 doubleValue];
    v6->_assetCopyDuration = v40;

    v41 = [v4 objectForKeyedSubscript:@"TotalQuotaReservation"];
    v6->_totalQuotaReservation = (int64_t)[v41 unsignedLongLongValue];

    v42 = [v4 objectForKeyedSubscript:@"UploadedAssetWriteDuration"];
    [v42 doubleValue];
    v6->_uploadedAssetWriteDuration = v43;

    v44 = [v4 objectForKeyedSubscript:@"UploadedFileListSize"];
    v6->_uploadedFileListSize = (int64_t)[v44 unsignedLongLongValue];

    uint64_t v45 = [v4 objectForKeyedSubscript:@"UploadedDomains"];
    uploadedDomains = v6->_uploadedDomains;
    v6->_uploadedDomains = (NSMutableSet *)v45;

    uint64_t v47 = [v4 objectForKeyedSubscript:@"ModifiedDomainsInCommit"];
    modifiedDomainsInCommit = v6->_modifiedDomainsInCommit;
    v6->_modifiedDomainsInCommit = (NSMutableSet *)v47;

    uint64_t v49 = [v4 objectForKeyedSubscript:@"DeletedDomainsInCommit"];
    deletedDomainsInCommit = v6->_deletedDomainsInCommit;
    v6->_deletedDomainsInCommit = (NSMutableSet *)v49;

    uint64_t v51 = [v4 objectForKeyedSubscript:@"RepairedDomains"];
    repairedDomains = v6->_repairedDomains;
    v6->_repairedDomains = (NSMutableSet *)v51;

    uint64_t v53 = [v4 objectForKeyedSubscript:@"UnknownDomainHMACsToRepair"];
    unknownDomainHMACsToRepair = v6->_unknownDomainHMACsToRepair;
    v6->_unknownDomainHMACsToRepair = (NSSet *)v53;

    uint64_t v55 = [v4 objectForKeyedSubscript:@"SkippedFileListCloneDomains"];
    skippedFileListCloneDomains = v6->_skippedFileListCloneDomains;
    v6->_skippedFileListCloneDomains = (NSMutableSet *)v55;

    v57 = [v4 objectForKeyedSubscript:@"LegacyCacheSize"];
    v6->_legacyCacheSize = (unint64_t)[v57 unsignedLongLongValue];

    v58 = [v4 objectForKeyedSubscript:@"SnapshotDirectorySize"];
    v6->_snapshotDirectorySize = (unint64_t)[v58 unsignedLongLongValue];

    v59 = [v4 objectForKeyedSubscript:@"SnapshotDirectoryCloneSize"];
    v6->_snapshotDirectoryCloneSize = (unint64_t)[v59 unsignedLongLongValue];

    v60 = [v4 objectForKeyedSubscript:@"PeakMemoryUsage"];
    v6->_peakMemoryUsage = (unint64_t)[v60 unsignedLongLongValue];

    uint64_t v61 = [v4 objectForKeyedSubscript:@"SnapshotVerificationFailures"];
    snapshotVerificationFailures = v6->_snapshotVerificationFailures;
    v6->_snapshotVerificationFailures = (NSMutableSet *)v61;

    v63 = [v4 objectForKeyedSubscript:@"SnapshotVerificationRan"];
    v6->_snapshotVerificationRan = [v63 BOOLValue];

    v64 = [v4 objectForKeyedSubscript:@"AssetUploadDuration"];
    v6->_assetUploadDuration = (double)(unint64_t)[v64 unsignedLongLongValue];

    v65 = [v4 objectForKeyedSubscript:@"UploadedAssetSize"];
    v6->_uploadedAssetSize = (int64_t)[v65 unsignedLongLongValue];

    v66 = [v4 objectForKeyedSubscript:@"UploadedAssetCount"];
    v6->_uploadedAssetCount = (unint64_t)[v66 unsignedLongLongValue];

    v67 = [v4 objectForKeyedSubscript:@"ScrubbedSQLiteDatabaseCount"];
    v6->_scrubbedSQLiteFileCount = (unint64_t)[v67 unsignedLongLongValue];

    v68 = [v4 objectForKeyedSubscript:@"CompactedSQLiteDatabaseCount"];
    v6->_compactedSQLiteFileCount = (unint64_t)[v68 unsignedLongLongValue];

    v69 = [v4 objectForKeyedSubscript:@"CompressedSQLiteDatabaseCount"];
    v6->_compressedSQLiteFileCount = (unint64_t)[v69 unsignedLongLongValue];
  }
  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(MBBackupAttemptSummary *)self error];
  v6 = +[MBError dictionaryRepresentationForError:v5];
  [v3 setObject:v6 forKeyedSubscript:@"Error"];

  [v3 setObject:self->_commitID forKeyedSubscript:@"CommitID"];
  uint64_t v7 = +[NSNumber numberWithInteger:self->_snapshotType];
  [v3 setObject:v7 forKeyedSubscript:@"SnapshotType"];

  v8 = +[NSNumber numberWithLongLong:self->_snapshotFormat];
  [v3 setObject:v8 forKeyedSubscript:@"SnapshotFormat"];

  [v3 setObject:self->_previousSnapshotCommitID forKeyedSubscript:@"PreviousSnapshot"];
  [v3 setObject:self->_durationByEngineState forKeyedSubscript:@"DurationsByEngineState"];
  uint64_t v9 = [(NSMutableSet *)self->_consolidatedDomainsInFileListSynchronization allObjects];
  v10 = [v9 sortedArrayUsingSelector:"compare:"];
  [v3 setObject:v10 forKeyedSubscript:@"ConsolidatedDomainsInFileListSynchronization"];

  uint64_t v11 = [(NSMutableSet *)self->_deletedDomainsInFileListSynchronization allObjects];
  v12 = [v11 sortedArrayUsingSelector:"compare:"];
  [v3 setObject:v12 forKeyedSubscript:@"DeletedDomainsInFileListSynchronization"];

  uint64_t v13 = [(NSMutableSet *)self->_downloadedDomainsInFileListSynchronization allObjects];
  v14 = [v13 sortedArrayUsingSelector:"compare:"];
  [v3 setObject:v14 forKeyedSubscript:@"DownloadedDomainsInFileListSynchronization"];

  [v3 setObject:self->_volumeMapLoadType forKeyedSubscript:@"VolumeMapLoadType"];
  uint64_t v15 = [(NSMutableSet *)self->_modifiedDomainsInTranscription allObjects];
  uint64_t v16 = [v15 sortedArrayUsingSelector:"compare:"];
  [v3 setObject:v16 forKeyedSubscript:@"ModifiedDomainsInTranscription"];

  uint64_t v17 = +[NSNumber numberWithUnsignedLongLong:self->_emptyDomainCount];
  [v3 setObject:v17 forKeyedSubscript:@"EmptyDomainCount"];

  uint64_t v18 = +[NSNumber numberWithUnsignedLongLong:self->_modifiedDirectoryCount];
  [v3 setObject:v18 forKeyedSubscript:@"ModifiedDirectoryCount"];

  uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:self->_deletedFileCount];
  [v3 setObject:v19 forKeyedSubscript:@"DeletedFileCount"];

  uint64_t v20 = +[NSNumber numberWithUnsignedLongLong:self->_unmodifiedDirectoryCount];
  [v3 setObject:v20 forKeyedSubscript:@"UnmodifiedDirectoryCount"];

  uint64_t v21 = +[NSNumber numberWithUnsignedLongLong:self->_modifiedDirectoryCount];
  [v3 setObject:v21 forKeyedSubscript:@"ModifiedDirectoryCount"];

  uint64_t v22 = +[NSNumber numberWithUnsignedLongLong:self->_unmodifiedSymlinkCount];
  [v3 setObject:v22 forKeyedSubscript:@"UnmodifiedSymlinkCount"];

  uint64_t v23 = +[NSNumber numberWithUnsignedLongLong:self->_modifiedSymlinkCount];
  [v3 setObject:v23 forKeyedSubscript:@"ModifiedSymlinkCount"];

  uint64_t v24 = +[NSNumber numberWithUnsignedLongLong:self->_unmodifiedRegularFileCount];
  [v3 setObject:v24 forKeyedSubscript:@"UnmodifiedRegularFileCount"];

  uint64_t v25 = +[NSNumber numberWithUnsignedLongLong:self->_modifiedRegularFileCount];
  [v3 setObject:v25 forKeyedSubscript:@"ModifiedRegularFileCount"];

  uint64_t v26 = +[NSNumber numberWithUnsignedLongLong:self->_deletedFileCount];
  [v3 setObject:v26 forKeyedSubscript:@"DeletedFileCount"];

  v27 = +[NSNumber numberWithUnsignedLongLong:self->_reusedAssetCount];
  [v3 setObject:v27 forKeyedSubscript:@"ReusedAssetCount"];

  uint64_t v28 = +[NSNumber numberWithUnsignedLongLong:self->_domainsTransitioningVolumesCount];
  [v3 setObject:v28 forKeyedSubscript:@"DomainsTransitioningVolumeCount"];

  v29 = +[NSNumber numberWithDouble:self->_assetCopyDuration];
  [v3 setObject:v29 forKeyedSubscript:@"AssetCopyDuration"];

  uint64_t v30 = +[NSNumber numberWithLongLong:self->_totalQuotaReservation];
  [v3 setObject:v30 forKeyedSubscript:@"TotalQuotaReservation"];

  v31 = +[NSNumber numberWithDouble:self->_uploadedAssetWriteDuration];
  [v3 setObject:v31 forKeyedSubscript:@"UploadedAssetWriteDuration"];

  v32 = +[NSNumber numberWithLongLong:[(MBBackupAttemptSummary *)self uploadedFileListSize]];
  [v3 setObject:v32 forKeyedSubscript:@"UploadedFileListSize"];

  objc_super v33 = [(NSMutableSet *)self->_uploadedDomains allObjects];
  v34 = [v33 sortedArrayUsingSelector:"compare:"];
  [v3 setObject:v34 forKeyedSubscript:@"UploadedDomains"];

  v35 = [(NSMutableSet *)self->_modifiedDomainsInCommit allObjects];
  v36 = [v35 sortedArrayUsingSelector:"compare:"];
  [v3 setObject:v36 forKeyedSubscript:@"ModifiedDomainsInCommit"];

  v37 = [(NSMutableSet *)self->_deletedDomainsInCommit allObjects];
  v38 = [v37 sortedArrayUsingSelector:"compare:"];
  [v3 setObject:v38 forKeyedSubscript:@"DeletedDomainsInCommit"];

  v39 = [(NSMutableSet *)self->_repairedDomains allObjects];
  double v40 = [v39 sortedArrayUsingSelector:"compare:"];
  [v3 setObject:v40 forKeyedSubscript:@"RepairedDomains"];

  v41 = [(NSSet *)self->_unknownDomainHMACsToRepair allObjects];
  v42 = [v41 sortedArrayUsingSelector:"compare:"];
  [v3 setObject:v42 forKeyedSubscript:@"UnknownDomainHMACsToRepair"];

  double v43 = [(NSMutableSet *)self->_skippedFileListCloneDomains allObjects];
  v44 = [v43 sortedArrayUsingSelector:"compare:"];
  [v3 setObject:v44 forKeyedSubscript:@"SkippedFileListCloneDomains"];

  uint64_t v45 = +[NSNumber numberWithUnsignedLongLong:self->_legacyCacheSize];
  [v3 setObject:v45 forKeyedSubscript:@"LegacyCacheSize"];

  v46 = +[NSNumber numberWithUnsignedLongLong:self->_snapshotDirectorySize];
  [v3 setObject:v46 forKeyedSubscript:@"SnapshotDirectorySize"];

  uint64_t v47 = +[NSNumber numberWithUnsignedLongLong:self->_snapshotDirectoryCloneSize];
  [v3 setObject:v47 forKeyedSubscript:@"SnapshotDirectoryCloneSize"];

  v48 = +[NSNumber numberWithUnsignedLongLong:self->_peakMemoryUsage];
  [v3 setObject:v48 forKeyedSubscript:@"PeakMemoryUsage"];

  uint64_t v49 = [(NSMutableSet *)self->_snapshotVerificationFailures allObjects];
  v50 = [v49 sortedArrayUsingSelector:"compare:"];
  [v3 setObject:v50 forKeyedSubscript:@"SnapshotVerificationFailures"];

  uint64_t v51 = +[NSNumber numberWithBool:self->_snapshotVerificationRan];
  [v3 setObject:v51 forKeyedSubscript:@"SnapshotVerificationRan"];

  v52 = +[NSNumber numberWithDouble:self->_assetUploadDuration];
  [v3 setObject:v52 forKeyedSubscript:@"AssetUploadDuration"];

  uint64_t v53 = +[NSNumber numberWithLongLong:self->_uploadedAssetSize];
  [v3 setObject:v53 forKeyedSubscript:@"UploadedAssetSize"];

  v54 = +[NSNumber numberWithUnsignedLongLong:self->_uploadedAssetCount];
  [v3 setObject:v54 forKeyedSubscript:@"UploadedAssetCount"];

  uint64_t v55 = +[NSNumber numberWithUnsignedLongLong:self->_scrubbedSQLiteFileCount];
  [v3 setObject:v55 forKeyedSubscript:@"ScrubbedSQLiteDatabaseCount"];

  v56 = +[NSNumber numberWithUnsignedLongLong:self->_compactedSQLiteFileCount];
  [v3 setObject:v56 forKeyedSubscript:@"CompactedSQLiteDatabaseCount"];

  v57 = +[NSNumber numberWithUnsignedLongLong:self->_compressedSQLiteFileCount];
  [v3 setObject:v57 forKeyedSubscript:@"CompressedSQLiteDatabaseCount"];

  os_unfair_lock_unlock(p_lock);
  return v3;
}

- (void)trackDeletedDomainDuringFileListSynchronization:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_deletedDomainsInFileListSynchronization addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)trackDeletedDomainInCommit:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_deletedDomainsInCommit addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)trackModifiedDomainInTranscription:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_modifiedDomainsInTranscription addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)trackDomainTranscription:(id)a3
{
  id v4 = a3;
  self->_unmodifiedDirectoryCount = (unint64_t)[v4 unmodifiedDirectories];
  self->_modifiedDirectoryCount = (unint64_t)[v4 modifiedDirectories];
  self->_unmodifiedSymlinkCount = (unint64_t)[v4 unmodifiedSymlinks];
  self->_modifiedSymlinkCount = (unint64_t)[v4 modifiedSymlinks];
  self->_unmodifiedRegularFileCount = (unint64_t)[v4 unmodifiedRegularFiles];
  self->_modifiedRegularFileCount = (unint64_t)[v4 modifiedRegularFiles];
  self->_deletedFileCount = (unint64_t)[v4 deletedFileCount];
  self->_emptyDomainCount = (unint64_t)[v4 emptyDomainCount];
  self->_reusedAssetCount = (unint64_t)[v4 reusedAssetRecords];
  id v5 = [v4 domainsTransitioningVolumes];

  self->_domainsTransitioningVolumesCount = (unint64_t)v5;
}

- (void)trackDownloadedDomainDuringFileListSynchronization:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_downloadedDomainsInFileListSynchronization addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)trackDuration:(double)a3 forEngineState:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_lock(p_lock);
  v8 = +[NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)self->_durationByEngineState setObject:v8 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)trackModifiedDomainInCommit:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_modifiedDomainsInCommit addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)trackConsolidatedDomainDuringFileListSynchronization:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_consolidatedDomainsInFileListSynchronization addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)trackUploadedDomain:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_uploadedDomains addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)trackSnapshotVerificationFailure:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_snapshotVerificationFailures addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)trackRepairedDomain:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_repairedDomains addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)trackSkippedFileListCloneDomain:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_skippedFileListCloneDomains addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSString)commitID
{
  return self->_commitID;
}

- (void)setCommitID:(id)a3
{
}

- (int64_t)snapshotType
{
  return self->_snapshotType;
}

- (void)setSnapshotType:(int64_t)a3
{
  self->_snapshotType = a3;
}

- (int64_t)snapshotFormat
{
  return self->_snapshotFormat;
}

- (void)setSnapshotFormat:(int64_t)a3
{
  self->_snapshotFormat = a3;
}

- (NSString)previousSnapshotCommitID
{
  return self->_previousSnapshotCommitID;
}

- (void)setPreviousSnapshotCommitID:(id)a3
{
}

- (NSMutableDictionary)durationByEngineState
{
  return self->_durationByEngineState;
}

- (void)setDurationByEngineState:(id)a3
{
}

- (NSMutableSet)consolidatedDomainsInFileListSynchronization
{
  return self->_consolidatedDomainsInFileListSynchronization;
}

- (void)setConsolidatedDomainsInFileListSynchronization:(id)a3
{
}

- (NSMutableSet)deletedDomainsInFileListSynchronization
{
  return self->_deletedDomainsInFileListSynchronization;
}

- (void)setDeletedDomainsInFileListSynchronization:(id)a3
{
}

- (NSMutableSet)downloadedDomainsInFileListSynchronization
{
  return self->_downloadedDomainsInFileListSynchronization;
}

- (void)setDownloadedDomainsInFileListSynchronization:(id)a3
{
}

- (NSString)volumeMapLoadType
{
  return self->_volumeMapLoadType;
}

- (void)setVolumeMapLoadType:(id)a3
{
}

- (NSMutableSet)modifiedDomainsInTranscription
{
  return self->_modifiedDomainsInTranscription;
}

- (void)setModifiedDomainsInTranscription:(id)a3
{
}

- (unint64_t)modifiedDirectoryCount
{
  return self->_modifiedDirectoryCount;
}

- (unint64_t)unmodifiedDirectoryCount
{
  return self->_unmodifiedDirectoryCount;
}

- (unint64_t)modifiedSymlinkCount
{
  return self->_modifiedSymlinkCount;
}

- (unint64_t)unmodifiedSymlinkCount
{
  return self->_unmodifiedSymlinkCount;
}

- (unint64_t)modifiedRegularFileCount
{
  return self->_modifiedRegularFileCount;
}

- (unint64_t)unmodifiedRegularFileCount
{
  return self->_unmodifiedRegularFileCount;
}

- (unint64_t)deletedFileCount
{
  return self->_deletedFileCount;
}

- (unint64_t)emptyDomainCount
{
  return self->_emptyDomainCount;
}

- (unint64_t)reusedAssetCount
{
  return self->_reusedAssetCount;
}

- (unint64_t)domainsTransitioningVolumesCount
{
  return self->_domainsTransitioningVolumesCount;
}

- (double)assetCopyDuration
{
  return self->_assetCopyDuration;
}

- (void)setAssetCopyDuration:(double)a3
{
  self->_assetCopyDuration = a3;
}

- (int64_t)totalQuotaReservation
{
  return self->_totalQuotaReservation;
}

- (void)setTotalQuotaReservation:(int64_t)a3
{
  self->_totalQuotaReservation = a3;
}

- (unint64_t)uploadedAssetCount
{
  return self->_uploadedAssetCount;
}

- (void)setUploadedAssetCount:(unint64_t)a3
{
  self->_uploadedAssetCount = a3;
}

- (unint64_t)scrubbedSQLiteFileCount
{
  return self->_scrubbedSQLiteFileCount;
}

- (void)setScrubbedSQLiteFileCount:(unint64_t)a3
{
  self->_scrubbedSQLiteFileCount = a3;
}

- (unint64_t)compactedSQLiteFileCount
{
  return self->_compactedSQLiteFileCount;
}

- (void)setCompactedSQLiteFileCount:(unint64_t)a3
{
  self->_compactedSQLiteFileCount = a3;
}

- (unint64_t)compressedSQLiteFileCount
{
  return self->_compressedSQLiteFileCount;
}

- (void)setCompressedSQLiteFileCount:(unint64_t)a3
{
  self->_compressedSQLiteFileCount = a3;
}

- (int64_t)uploadedAssetSize
{
  return self->_uploadedAssetSize;
}

- (void)setUploadedAssetSize:(int64_t)a3
{
  self->_uploadedAssetSize = a3;
}

- (double)assetUploadDuration
{
  return self->_assetUploadDuration;
}

- (void)setAssetUploadDuration:(double)a3
{
  self->_assetUploadDuration = a3;
}

- (double)uploadedAssetWriteDuration
{
  return self->_uploadedAssetWriteDuration;
}

- (void)setUploadedAssetWriteDuration:(double)a3
{
  self->_uploadedAssetWriteDuration = a3;
}

- (int64_t)uploadedFileListSize
{
  return self->_uploadedFileListSize;
}

- (void)setUploadedFileListSize:(int64_t)a3
{
  self->_uploadedFileListSize = a3;
}

- (NSMutableSet)uploadedDomains
{
  return self->_uploadedDomains;
}

- (void)setUploadedDomains:(id)a3
{
}

- (NSMutableSet)modifiedDomainsInCommit
{
  return self->_modifiedDomainsInCommit;
}

- (void)setModifiedDomainsInCommit:(id)a3
{
}

- (NSMutableSet)deletedDomainsInCommit
{
  return self->_deletedDomainsInCommit;
}

- (void)setDeletedDomainsInCommit:(id)a3
{
}

- (NSMutableSet)repairedDomains
{
  return self->_repairedDomains;
}

- (void)setRepairedDomains:(id)a3
{
}

- (NSSet)unknownDomainHMACsToRepair
{
  return self->_unknownDomainHMACsToRepair;
}

- (void)setUnknownDomainHMACsToRepair:(id)a3
{
}

- (NSMutableSet)skippedFileListCloneDomains
{
  return self->_skippedFileListCloneDomains;
}

- (void)setSkippedFileListCloneDomains:(id)a3
{
}

- (NSMutableSet)snapshotVerificationFailures
{
  return self->_snapshotVerificationFailures;
}

- (void)setSnapshotVerificationFailures:(id)a3
{
}

- (BOOL)snapshotVerificationRan
{
  return self->_snapshotVerificationRan;
}

- (void)setSnapshotVerificationRan:(BOOL)a3
{
  self->_snapshotVerificationRan = a3;
}

- (unint64_t)legacyCacheSize
{
  return self->_legacyCacheSize;
}

- (void)setLegacyCacheSize:(unint64_t)a3
{
  self->_legacyCacheSize = a3;
}

- (unint64_t)snapshotDirectorySize
{
  return self->_snapshotDirectorySize;
}

- (void)setSnapshotDirectorySize:(unint64_t)a3
{
  self->_snapshotDirectorySize = a3;
}

- (unint64_t)snapshotDirectoryCloneSize
{
  return self->_snapshotDirectoryCloneSize;
}

- (void)setSnapshotDirectoryCloneSize:(unint64_t)a3
{
  self->_snapshotDirectoryCloneSize = a3;
}

- (unint64_t)peakMemoryUsage
{
  return self->_peakMemoryUsage;
}

- (void)setPeakMemoryUsage:(unint64_t)a3
{
  self->_peakMemoryUsage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotVerificationFailures, 0);
  objc_storeStrong((id *)&self->_skippedFileListCloneDomains, 0);
  objc_storeStrong((id *)&self->_unknownDomainHMACsToRepair, 0);
  objc_storeStrong((id *)&self->_repairedDomains, 0);
  objc_storeStrong((id *)&self->_deletedDomainsInCommit, 0);
  objc_storeStrong((id *)&self->_modifiedDomainsInCommit, 0);
  objc_storeStrong((id *)&self->_uploadedDomains, 0);
  objc_storeStrong((id *)&self->_modifiedDomainsInTranscription, 0);
  objc_storeStrong((id *)&self->_volumeMapLoadType, 0);
  objc_storeStrong((id *)&self->_downloadedDomainsInFileListSynchronization, 0);
  objc_storeStrong((id *)&self->_deletedDomainsInFileListSynchronization, 0);
  objc_storeStrong((id *)&self->_consolidatedDomainsInFileListSynchronization, 0);
  objc_storeStrong((id *)&self->_durationByEngineState, 0);
  objc_storeStrong((id *)&self->_previousSnapshotCommitID, 0);
  objc_storeStrong((id *)&self->_commitID, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end