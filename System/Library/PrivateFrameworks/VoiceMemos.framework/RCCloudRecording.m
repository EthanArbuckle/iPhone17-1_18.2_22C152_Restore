@interface RCCloudRecording
+ (BOOL)isRecordingExported:(id)a3;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (id)savedRecordingURIForSearchableItemIdentifier:(id)a3;
+ (id)searchableItemIdentifierForSavedRecordingURI:(id)a3;
- (AVAsset)avAsset;
- (BOOL)_audioFutureIsCurrent;
- (BOOL)_audioFutureIsOutdated:(id)a3;
- (BOOL)_audioFutureUUIDIsCurrent;
- (BOOL)_composedURLIsCloneOfAudioFuture;
- (BOOL)_copyCustomLabelToEncryptedTitleIfNeeded;
- (BOOL)_copyEncryptedTitleToCustomLabelIfNeeded;
- (BOOL)_getFlag:(unint64_t)a3;
- (BOOL)_isOlderThanMandatoryMigrationAge;
- (BOOL)_isReadyToMigrate;
- (BOOL)_localAssetIsReachable;
- (BOOL)_migrateCustomLabelIfNeeded:(BOOL)a3;
- (BOOL)audioFutureNeedsDownload;
- (BOOL)audioFutureNeedsExport;
- (BOOL)canUpdateWithMultiTrackAsset;
- (BOOL)composedAssetHasMultipleTracks;
- (BOOL)enhanced;
- (BOOL)favorite;
- (BOOL)hasBeenTranscribed;
- (BOOL)isContentBeingModified;
- (BOOL)localAssetIsCurrent;
- (BOOL)manuallyRenamed;
- (BOOL)markRecordingAsExported:(id)a3 error:(id *)a4;
- (BOOL)musicMemo;
- (BOOL)playable;
- (BOOL)recordedOnWatch;
- (BOOL)recreateAudioFutureIfNecessary;
- (BOOL)synchronizeWithExistingAudioFuture:(id *)a3;
- (BOOL)transcriptionContentExists;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (BOOL)watchOS;
- (NSNumber)purgeableAudioFileSize;
- (NSString)fileName;
- (NSString)localTitle;
- (NSString)userFolderUUID;
- (NSURL)URIRepresentation;
- (NSURL)url;
- (RCCloudRecording)initWithContext:(id)a3 andCreationDate:(id)a4;
- (_NSFileBackedFuture)syncedAudioFuture;
- (double)length;
- (double)syncedDuration;
- (float)layerMix;
- (id)_detailLabel;
- (id)_fileNameForSharing;
- (id)_labelAllowingEmptyString:(BOOL)a3;
- (id)_localTitleForWillSave;
- (id)_migratedTitleDateString;
- (id)_uniqueMigratedTitleWithTitleBase:(id)a3;
- (id)copyResourcesForSharingIntoDirectory:(id)a3;
- (id)filePathForSyncingFromExistingAudioFuture;
- (id)purgeAudioFileWithModel:(id)a3 error:(id *)a4;
- (id)recordingsModel;
- (id)subjectForActivityType:(id)a3;
- (unint64_t)syncedSharedFlags;
- (void)_enqueueAudioFutureUUID:(id)a3;
- (void)_evictAudioFuture;
- (void)_fileNameForSharing;
- (void)_setFlag:(unint64_t)a3 value:(BOOL)a4;
- (void)_updateAudioFuture:(id)a3 isRecovery:(BOOL)a4;
- (void)_updateFlagsDerivedFromComposedAsset:(id)a3;
- (void)_updateLocalDurationWithAssetDuration;
- (void)copySharedFlagsFromOriginalRecording:(id)a3;
- (void)migrateCustomLabelIfNeeded;
- (void)migrateLocalProperties;
- (void)migrateSyncedUUIDs;
- (void)setAudioFutureNeedsDownload:(BOOL)a3;
- (void)setAudioFutureNeedsExport:(BOOL)a3;
- (void)setAvAsset:(id)a3;
- (void)setComposedAssetHasMultipleTracks:(BOOL)a3;
- (void)setEnhanced:(BOOL)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setFileName:(id)a3;
- (void)setHasBeenTranscribed:(BOOL)a3;
- (void)setLayerMix:(float)a3;
- (void)setLength:(double)a3;
- (void)setLocalTitle:(id)a3;
- (void)setManuallyRenamed:(BOOL)a3;
- (void)setMusicMemo:(BOOL)a3;
- (void)setPlayable:(BOOL)a3;
- (void)setRecordedOnWatch:(BOOL)a3;
- (void)setSyncedAudioFuture:(id)a3 sourceFileURL:(id)a4;
- (void)setSyncedDuration:(double)a3;
- (void)setSyncedSharedFlags:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTranscriptionContentExists:(BOOL)a3;
- (void)setWatchOS:(BOOL)a3;
- (void)synchronizeRecordingMetadata;
- (void)updateAudioFutureWithLocalAsset;
- (void)updateForLocalTitleChange:(BOOL)a3;
- (void)updateForRemoteTitleChange:(BOOL)a3;
- (void)updateNilTitleFields:(BOOL)a3;
- (void)willSave;
@end

@implementation RCCloudRecording

- (BOOL)playable
{
  return [(RCCloudRecording *)self _getFlag:4];
}

- (BOOL)audioFutureNeedsDownload
{
  return [(RCCloudRecording *)self _getFlag:2];
}

- (BOOL)composedAssetHasMultipleTracks
{
  return ((unint64_t)[(RCCloudRecording *)self flags] >> 11) & 1;
}

- (BOOL)_getFlag:(unint64_t)a3
{
  return (a3 & ~[(RCCloudRecording *)self flags]) == 0;
}

- (double)length
{
  v3 = [(RCCloudRecording *)self localDuration];
  v4 = v3;
  if (v3) {
    [v3 doubleValue];
  }
  else {
    [(RCCloudRecording *)self syncedDuration];
  }
  double v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
}

- (BOOL)localAssetIsCurrent
{
  BOOL v3 = [(RCCloudRecording *)self _localAssetIsReachable];
  if (v3)
  {
    LOBYTE(v3) = [(RCCloudRecording *)self _audioFutureIsCurrent];
  }
  return v3;
}

- (BOOL)_localAssetIsReachable
{
  v2 = [(RCCloudRecording *)self url];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 checkResourceIsReachableAndReturnError:0];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NSURL)url
{
  v2 = [(RCCloudRecording *)self fileName];
  if (v2)
  {
    BOOL v3 = RCRecordingsDirectoryURL();
    char v4 = [v3 URLByAppendingPathComponent:v2];
  }
  else
  {
    char v4 = 0;
  }

  return (NSURL *)v4;
}

- (NSString)fileName
{
  return (NSString *)[(RCCloudRecording *)self valueForKey:@"path"];
}

- (BOOL)transcriptionContentExists
{
  return [(RCCloudRecording *)self _getFlag:1024];
}

- (BOOL)manuallyRenamed
{
  return [(RCCloudRecording *)self _getFlag:8];
}

- (BOOL)enhanced
{
  return ([(RCCloudRecording *)self syncedSharedFlags] >> 1) & 1;
}

- (BOOL)favorite
{
  return [(RCCloudRecording *)self syncedSharedFlags] & 1;
}

- (unint64_t)syncedSharedFlags
{
  v2 = [(RCCloudRecording *)self sharedFlags];
  unint64_t v3 = [v2 longLongValue];

  return v3;
}

- (NSString)localTitle
{
  return (NSString *)[(RCCloudRecording *)self valueForKey:@"customLabelForSorting"];
}

- (BOOL)_audioFutureIsCurrent
{
  if ([(RCCloudRecording *)self _audioFutureUUIDIsCurrent]) {
    return 1;
  }
  return [(RCCloudRecording *)self _composedURLIsCloneOfAudioFuture];
}

- (BOOL)_audioFutureUUIDIsCurrent
{
  unint64_t v3 = [(RCCloudRecording *)self audioFutureUUIDs];
  char v4 = [v3 lastObject];
  double v5 = [(RCCloudRecording *)self syncedAudioFuture];
  double v6 = [v5 UUID];
  char v7 = [v4 isEqual:v6];

  return v7;
}

- (_NSFileBackedFuture)syncedAudioFuture
{
  unint64_t v3 = [(RCCloudRecording *)self audioFuture];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(RCCloudRecording *)self mtAudioFuture];
  }
  double v6 = v5;

  return (_NSFileBackedFuture *)v6;
}

- (RCCloudRecording)initWithContext:(id)a3 andCreationDate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RCCloudRecording;
  char v7 = [(RCCloudRecording *)&v10 initWithContext:a3];
  v8 = v7;
  if (v7) {
    [(RCCloudRecording *)v7 setValue:v6 forKey:@"date"];
  }

  return v8;
}

- (void)migrateLocalProperties
{
  unint64_t v3 = [(RCCloudRecording *)self encryptedTitle];
  if (v3)
  {
    [(RCCloudRecording *)self setLocalTitle:v3];
  }
  else
  {
    char v4 = [(RCCloudRecording *)self valueForKey:@"customLabel"];
    [(RCCloudRecording *)self setLocalTitle:v4];
  }
  [(RCCloudRecording *)self _updateLocalDurationWithAssetDuration];
}

- (void)_updateLocalDurationWithAssetDuration
{
  unint64_t v3 = [(RCCloudRecording *)self url];
  char v4 = v3;
  if (v3)
  {
    v8 = v3;
    unint64_t v3 = (void *)[v3 checkResourceIsReachableAndReturnError:0];
    char v4 = v8;
    if (v3)
    {
      id v5 = objc_msgSend(MEMORY[0x1E4F166C8], "rc_preciseTimingAssetWithURL:", v8);
      objc_msgSend(v5, "rc_durationInSeconds");
      if (v6 > 0.0)
      {
        char v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
        [(RCCloudRecording *)self setLocalDuration:v7];
      }
      char v4 = v8;
    }
  }
  MEMORY[0x1F41817F8](v3, v4);
}

- (id)_localTitleForWillSave
{
  if ([(RCCloudRecording *)self isInserted])
  {
    unint64_t v3 = self;
  }
  else
  {
    if (![(RCCloudRecording *)self hasChanges])
    {
LABEL_12:
      id v5 = 0;
      goto LABEL_13;
    }
    unint64_t v3 = [(RCCloudRecording *)self changedValues];
  }
  char v4 = v3;
  if (!v3) {
    goto LABEL_12;
  }
  id v5 = [(RCCloudRecording *)v3 valueForKey:@"encryptedTitle"];
  if ((isNotNullAndNotNSNull(v5) & 1) == 0)
  {
    double v6 = [(RCCloudRecording *)v4 valueForKey:@"customLabel"];
    if (!isNotNullAndNotNSNull(v6)
      || ([(RCCloudRecording *)self valueForKey:@"encryptedTitle"],
          char v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {

      double v6 = 0;
    }

    id v5 = v6;
  }

LABEL_13:
  return v5;
}

- (void)willSave
{
  v1 = [a1 uuid];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1(&dword_1C3964000, v2, v3, "%s -- no path for recording when saving - uniqueID = %@", v4, v5, v6, v7, 2u);
}

- (BOOL)validateForInsert:(id *)a3
{
  uint64_t v3 = [(RCCloudRecording *)self creationDate];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)validateForUpdate:(id *)a3
{
  uint64_t v3 = [(RCCloudRecording *)self creationDate];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)synchronizeRecordingMetadata
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RCCloudRecording *)self url];
  if ([v3 checkResourceIsReachableAndReturnError:0]
    && [(RCCloudRecording *)self playable])
  {
    BOOL v4 = [MEMORY[0x1E4F166C8] assetWithURL:v3];
    uint64_t v5 = objc_msgSend(v4, "rc_recordingMetadata");
    uint64_t v6 = (void *)[v5 mutableCopy];

    uint64_t v7 = [(RCCloudRecording *)self title];
    [v6 setObject:v7 forKeyedSubscript:@"title"];

    id v14 = 0;
    int v8 = objc_msgSend(MEMORY[0x1E4F16330], "rc_updateMetadataInFile:withRecordingMetadata:error:", v3, v6, &v14);
    id v9 = v14;
    if (v8)
    {
      id v10 = v3;
      v11 = (const char *)[v10 fileSystemRepresentation];
      if (audioDigestAttribute_onceToken != -1)
      {
        v13 = v11;
        dispatch_once(&audioDigestAttribute_onceToken, &__block_literal_global_9);
        v11 = v13;
      }
      removexattr(v11, (const char *)audioDigestAttribute__audioDigestAttribute, 0);
      [(RCCloudRecording *)self _updateLocalDurationWithAssetDuration];
      [(RCCloudRecording *)self _updateAudioFuture:v10 isRecovery:0];
    }
    else
    {
      v12 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[RCCloudRecording synchronizeRecordingMetadata]";
        __int16 v17 = 2112;
        id v18 = v9;
        _os_log_impl(&dword_1C3964000, v12, OS_LOG_TYPE_DEFAULT, "%s -- ERROR:  synchronizing file metadata (error = %@)", buf, 0x16u);
      }
    }
  }
}

- (void)_updateAudioFuture:(id)a3 isRecovery:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 checkResourceIsReachableAndReturnError:0])
  {
    uint64_t v7 = [(RCCloudRecording *)self url];
    int v8 = computeAudioDigest(v7);
    id v9 = 0;

    if (!v8)
    {
      id v10 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[RCCloudRecording _updateAudioFuture:isRecovery:]();
      }
    }
    v11 = [(RCCloudRecording *)self audioDigest];
    v12 = [(RCCloudRecording *)self syncedAudioFuture];
    if (!v12 || !v11 || ![v11 isEqualToData:v8] || v4)
    {
      v13 = (void *)[MEMORY[0x1E4F1C110] createFutureForFileAtURL:v6];
      id v14 = OSLogForCategory(@"Service");
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v16 = [(RCCloudRecording *)self uuid];
          *(_DWORD *)buf = 136315906;
          uint64_t v19 = "-[RCCloudRecording _updateAudioFuture:isRecovery:]";
          __int16 v20 = 2112;
          v21 = v16;
          __int16 v22 = 2112;
          v23 = v11;
          __int16 v24 = 2112;
          v25 = v8;
          _os_log_impl(&dword_1C3964000, v15, OS_LOG_TYPE_DEFAULT, "%s -- uniqueID = %@, oldDigest = %@, newDigest = %@", buf, 0x2Au);
        }
        [(RCCloudRecording *)self setSyncedAudioFuture:v13 sourceFileURL:v6];
        [(RCCloudRecording *)self setAudioDigest:v8];
        __int16 v17 = [v13 UUID];
        [(RCCloudRecording *)self _enqueueAudioFutureUUID:v17];

        [(RCCloudRecording *)self setFlags:[(RCCloudRecording *)self flags] & 0xFFFFFFFFFFFFFFF9 | 4];
        [(RCCloudRecording *)self _updateFlagsDerivedFromComposedAsset:v6];
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[RCCloudRecording _updateAudioFuture:isRecovery:]();
        }
      }
    }
    [(RCCloudRecording *)self setAvAsset:0];
  }
  else
  {
    id v9 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RCCloudRecording _updateAudioFuture:isRecovery:]();
    }
  }
}

- (void)_updateFlagsDerivedFromComposedAsset:(id)a3
{
  BOOL v4 = [MEMORY[0x1E4F166C8] assetWithURL:a3];
  uint64_t v5 = objc_msgSend(v4, "rc_transcriptionData");
  if (v5)
  {
    id v12 = 0;
    id v6 = +[TranscriptionDecoder decodeTransciptionData:v5 error:&v12];
    id v7 = v12;
    BOOL v8 = v6 != 0;
    if (v6)
    {
      BOOL v9 = [v6 length] != 0;
    }
    else
    {
      id v10 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[RCCloudRecording _updateFlagsDerivedFromComposedAsset:]();
      }

      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
    BOOL v8 = 0;
  }
  [(RCCloudRecording *)self setHasBeenTranscribed:v8];
  [(RCCloudRecording *)self setTranscriptionContentExists:v9];
  v11 = objc_msgSend(v4, "rc_audioTracks");
  -[RCCloudRecording setComposedAssetHasMultipleTracks:](self, "setComposedAssetHasMultipleTracks:", (unint64_t)[v11 count] > 1);
}

- (void)migrateSyncedUUIDs
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- failed to evict audio future - error = %@", v2, v3, v4, v5, 2u);
}

- (void)_enqueueAudioFutureUUID:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    uint64_t v4 = [(RCCloudRecording *)self audioFutureUUIDs];
    char v5 = [v4 containsObject:v11];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = [(RCCloudRecording *)self audioFutureUUIDs];
      id v7 = (void *)v6;
      BOOL v8 = (void *)MEMORY[0x1E4F1CBF0];
      if (v6) {
        BOOL v8 = (void *)v6;
      }
      id v9 = v8;

      id v10 = [v9 arrayByAddingObject:v11];

      [(RCCloudRecording *)self setAudioFutureUUIDs:v10];
    }
  }
}

- (void)copySharedFlagsFromOriginalRecording:(id)a3
{
  uint64_t v4 = [a3 syncedSharedFlags];
  [(RCCloudRecording *)self setSyncedSharedFlags:v4];
}

- (BOOL)recreateAudioFutureIfNecessary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RCCloudRecording *)self syncedAudioFuture];
  uint64_t v4 = [(RCCloudRecording *)self url];
  char v5 = v4;
  if (v4
    && [v4 checkResourceIsReachableAndReturnError:0]
    && (!v3 || [(RCCloudRecording *)self _audioFutureIsOutdated:v3]))
  {
    uint64_t v6 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(RCCloudRecording *)self uuid];
      int v10 = 136315394;
      id v11 = "-[RCCloudRecording recreateAudioFutureIfNecessary]";
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1C3964000, v6, OS_LOG_TYPE_DEFAULT, "%s -- Recreating audio future - recording uuid = %@", (uint8_t *)&v10, 0x16u);
    }
    [(RCCloudRecording *)self updateAudioFutureWithLocalAsset];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)updateAudioFutureWithLocalAsset
{
  id v3 = [(RCCloudRecording *)self url];
  [(RCCloudRecording *)self _updateAudioFuture:v3 isRecovery:1];
}

- (BOOL)_audioFutureIsOutdated:(id)a3
{
  uint64_t v4 = [a3 UUID];
  if (v4)
  {
    char v5 = [(RCCloudRecording *)self audioFutureUUIDs];
    if ([v5 containsObject:v4])
    {
      uint64_t v6 = [(RCCloudRecording *)self audioFutureUUIDs];
      id v7 = [v6 lastObject];
      int v8 = [v4 isEqual:v7] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_composedURLIsCloneOfAudioFuture
{
  id v3 = [(RCCloudRecording *)self syncedAudioFuture];
  uint64_t v4 = [v3 fileURL];

  char v5 = [(RCCloudRecording *)self url];
  uint64_t v6 = v5;
  BOOL v7 = 0;
  if (v4 && v5) {
    BOOL v7 = identicalClones(v4, v5);
  }

  return v7;
}

- (BOOL)synchronizeWithExistingAudioFuture:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char v5 = [(RCCloudRecording *)self syncedAudioFuture];
  uint64_t v6 = [v5 fileURL];
  BOOL v7 = v6;
  if (v6)
  {
    int v8 = [v6 path];
    id v9 = [(RCCloudRecording *)self url];
    id v10 = [v9 path];

    if (v10)
    {
      id v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
      if (identicalClones(v11, v7)) {
        goto LABEL_4;
      }
      memset(&v32, 0, sizeof(v32));
      memset(&v31, 0, sizeof(v31));
      id v10 = v10;
      if (!stat((const char *)[v10 fileSystemRepresentation], &v32)
        && !stat((const char *)[v8 fileSystemRepresentation], &v31)
        && !(v32.st_size | v31.st_size))
      {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v13 = [(RCCloudRecording *)self filePathForSyncingFromExistingAudioFuture];
      if (!v13)
      {
        v15 = OSLogForCategory(@"Default");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          -[RCCloudRecording synchronizeWithExistingAudioFuture:](v15);
        }

        id v11 = 0;
        id v10 = 0;
        goto LABEL_20;
      }
      id v10 = (id)v13;
      id v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];
    }
    +[RCComposition deleteFromFilesystem:v11];
    uint64_t v14 = (const char *)[v8 fileSystemRepresentation];
    id v10 = v10;
    if (clonefile(v14, (const char *)[v10 fileSystemRepresentation], 0)
      || (id v10 = v10, chmod((const char *)[v10 fileSystemRepresentation], 0x1A4u)))
    {
      if (a3)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
        BOOL v12 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
LABEL_20:
      BOOL v12 = 0;
      goto LABEL_21;
    }
    v30[1] = 0;
    __int16 v17 = computeAudioDigest(v11);
    id v18 = 0;
    if (!v17)
    {
      uint64_t v19 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v32.st_dev = 136315394;
        *(void *)&v32.st_mode = "-[RCCloudRecording synchronizeWithExistingAudioFuture:]";
        WORD2(v32.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&v32.st_ino + 6) = (__darwin_ino64_t)v18;
        _os_log_impl(&dword_1C3964000, v19, OS_LOG_TYPE_DEFAULT, "%s -- digestError = %@", (uint8_t *)&v32, 0x16u);
      }
    }
    v29 = v18;
    [(RCCloudRecording *)self setAudioDigest:v17];
    __int16 v20 = [v10 lastPathComponent];
    [(RCCloudRecording *)self setFileName:v20];

    [(RCCloudRecording *)self setFlags:[(RCCloudRecording *)self flags] & 0xFFFFFFFFFFFFFFF9 | 4];
    v21 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      [(RCCloudRecording *)self uuid];
      __int16 v22 = v28 = v17;
      v23 = [v10 lastPathComponent];
      v32.st_dev = 136315650;
      *(void *)&v32.st_mode = "-[RCCloudRecording synchronizeWithExistingAudioFuture:]";
      WORD2(v32.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v32.st_ino + 6) = (__darwin_ino64_t)v22;
      HIWORD(v32.st_gid) = 2112;
      *(void *)&v32.st_rdev = v23;
      _os_log_impl(&dword_1C3964000, v21, OS_LOG_TYPE_DEFAULT, "%s -- synchronized recording uuid = %@ audioFuture to %@", (uint8_t *)&v32, 0x20u);

      __int16 v17 = v28;
    }

    __int16 v24 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[RCCloudRecording synchronizeWithExistingAudioFuture:]((uint64_t)v10, v24);
    }

    [(RCCloudRecording *)self _updateLocalDurationWithAssetDuration];
    uint64_t v25 = [v5 UUID];
    [(RCCloudRecording *)self _enqueueAudioFutureUUID:v25];

    [(RCCloudRecording *)self _updateFlagsDerivedFromComposedAsset:v11];
    v30[0] = 0;
    LOBYTE(v25) = [(RCCloudRecording *)self markRecordingAsExported:v11 error:v30];
    id v26 = v30[0];
    if ((v25 & 1) == 0)
    {
      v27 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[RCCloudRecording synchronizeWithExistingAudioFuture:]();
      }
    }
LABEL_4:
    BOOL v12 = 1;
LABEL_21:

    goto LABEL_22;
  }
  if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:0];
    BOOL v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_22:

  return v12;
}

+ (BOOL)isRecordingExported:(id)a3
{
  id v3 = a3;
  if (isAudioFilePurgeable(v3))
  {
    uint64_t v4 = *MEMORY[0x1E4F1CE10];
    id v11 = 0;
    id v12 = 0;
    int v5 = [v3 getResourceValue:&v12 forKey:v4 error:&v11];
    id v6 = v12;
    id v7 = v11;
    if (v5)
    {
      char v8 = [v6 BOOLValue];
    }
    else
    {
      id v9 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[RCCloudRecording isRecordingExported:]();
      }

      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)markRecordingAsExported:(id)a3 error:(id *)a4
{
  uint64_t value = 1;
  id v6 = a3;
  id v7 = (const char *)[v6 fileSystemRepresentation];
  if (audioFileFlagsAttribute_onceToken != -1) {
    dispatch_once(&audioFileFlagsAttribute_onceToken, &__block_literal_global_193);
  }
  int v8 = setxattr(v7, (const char *)audioFileFlagsAttribute__audioFileFlagsAttribute, &value, 8uLL, 0, 0);
  if (a4 && v8)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v8 {
         || !+[RCComposition excludeFromBackup:v6 error:a4])
  }
  {
    BOOL v9 = 0;
  }
  else
  {
    [(RCCloudRecording *)self _evictAudioFuture];
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_evictAudioFuture
{
  id v3 = [a1 UUID];
  id v10 = [a2 audioFutureUUIDs];
  OUTLINED_FUNCTION_1_0(&dword_1C3964000, v4, v5, "%s -- Audio future is not current, UUID = %@ audioFutureUUIDs %@", v6, v7, v8, v9, 2u);
}

- (NSNumber)purgeableAudioFileSize
{
  uint64_t v2 = [(RCCloudRecording *)self url];
  if (isAudioFilePurgeable(v2))
  {
    id v7 = 0;
    char v3 = [v2 getResourceValue:&v7 forKey:*MEMORY[0x1E4F1C5F8] error:0];
    id v4 = v7;
    uint64_t v5 = v4;
    if (v3) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = 0;
LABEL_5:

  return (NSNumber *)v5;
}

- (id)purgeAudioFileWithModel:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(RCCloudRecording *)self url];
  if (isAudioFilePurgeable(v7))
  {
    id v22 = 0;
    int v8 = [v7 getResourceValue:&v22 forKey:*MEMORY[0x1E4F1C5F8] error:a4];
    id v9 = v22;
    id v10 = 0;
    if (v8)
    {
      [(RCCloudRecording *)self setFileName:0];
      [(RCCloudRecording *)self setPlayable:0];
      id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v21 = 0;
      char v12 = [v11 removeItemAtURL:v7 error:&v21];
      id v13 = v21;

      if (v12)
      {
        uint64_t v14 = [(RCCloudRecording *)self syncedAudioFuture];
        if (v14)
        {
          v15 = [v6 context];
          id v20 = 0;
          char v16 = [v15 evictFuture:v14 withError:&v20];
          id v17 = v20;
          if ((v16 & 1) == 0)
          {
            id v18 = OSLogForCategory(@"Service");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              __int16 v24 = "-[RCCloudRecording purgeAudioFileWithModel:error:]";
              __int16 v25 = 2112;
              id v26 = v17;
              _os_log_impl(&dword_1C3964000, v18, OS_LOG_TYPE_DEFAULT, "%s -- evictError = %@", buf, 0x16u);
            }
          }
        }
        id v10 = v9;
      }
      else
      {
        id v10 = 0;
        if (a4) {
          *a4 = v13;
        }
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)setAudioFutureNeedsDownload:(BOOL)a3
{
}

- (BOOL)audioFutureNeedsExport
{
  return [(RCCloudRecording *)self _getFlag:256];
}

- (void)setAudioFutureNeedsExport:(BOOL)a3
{
}

- (BOOL)hasBeenTranscribed
{
  return [(RCCloudRecording *)self _getFlag:512];
}

- (void)setHasBeenTranscribed:(BOOL)a3
{
}

- (void)setTranscriptionContentExists:(BOOL)a3
{
}

- (void)_setFlag:(unint64_t)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(RCCloudRecording *)self flags];
  if (v4) {
    unint64_t v8 = v7 | a3;
  }
  else {
    unint64_t v8 = v7 & ~a3;
  }
  [(RCCloudRecording *)self setFlags:v8];
}

- (void)setPlayable:(BOOL)a3
{
  BOOL v3 = a3;
  [(RCCloudRecording *)self _setFlag:4 value:a3];
  if (v3)
  {
    uint64_t v5 = [(RCCloudRecording *)self url];
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = [v5 path];
    int v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

    if (v8)
    {
      id v9 = [MEMORY[0x1E4F166C8] assetWithURL:v5];
      id v10 = [(RCCloudRecording *)self title];
      id v11 = objc_msgSend(v9, "rc_recordingMetadata");
      char v12 = (void *)[v11 mutableCopy];

      id v13 = [v12 objectForKeyedSubscript:@"title"];
      char v14 = [v10 isEqualToString:v13];

      if ((v14 & 1) == 0)
      {
        [v12 setObject:v10 forKeyedSubscript:@"title"];
        id v18 = 0;
        char v15 = objc_msgSend(MEMORY[0x1E4F16330], "rc_updateMetadataInFile:withRecordingMetadata:error:", v5, v12, &v18);
        id v16 = v18;
        if ((v15 & 1) == 0)
        {
          id v17 = OSLogForCategory(@"Service");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[RCCloudRecording setPlayable:]();
          }
        }
      }
      [(RCCloudRecording *)self _updateLocalDurationWithAssetDuration];
      [(RCCloudRecording *)self _updateAudioFuture:v5 isRecovery:0];
    }
  }
}

- (void)setManuallyRenamed:(BOOL)a3
{
}

- (BOOL)recordedOnWatch
{
  return [(RCCloudRecording *)self _getFlag:64];
}

- (void)setRecordedOnWatch:(BOOL)a3
{
}

- (BOOL)watchOS
{
  return ([(RCCloudRecording *)self syncedSharedFlags] >> 6) & 1;
}

- (void)setWatchOS:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(RCCloudRecording *)self syncedSharedFlags] & 0xFFFFFFFFFFFFFFBFLL;
  uint64_t v6 = 64;
  if (!v3) {
    uint64_t v6 = 0;
  }
  [(RCCloudRecording *)self setSyncedSharedFlags:v5 | v6];
}

- (BOOL)musicMemo
{
  return ([(RCCloudRecording *)self syncedSharedFlags] >> 2) & 1;
}

- (void)setMusicMemo:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(RCCloudRecording *)self syncedSharedFlags] & 0xFFFFFFFFFFFFFFFBLL;
  uint64_t v6 = 4;
  if (!v3) {
    uint64_t v6 = 0;
  }
  [(RCCloudRecording *)self setSyncedSharedFlags:v5 | v6];
}

- (void)setFavorite:(BOOL)a3
{
  unint64_t v4 = [(RCCloudRecording *)self syncedSharedFlags] & 0xFFFFFFFFFFFFFFFELL | a3;
  [(RCCloudRecording *)self setSyncedSharedFlags:v4];
}

- (void)setEnhanced:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(RCCloudRecording *)self syncedSharedFlags] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v6 = 2;
  if (!v3) {
    uint64_t v6 = 0;
  }
  [(RCCloudRecording *)self setSyncedSharedFlags:v5 | v6];
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___RCCloudRecording;
  id v3 = a3;
  unint64_t v4 = objc_msgSendSuper2(&v9, sel_keyPathsForValuesAffectingValueForKey_, v3);
  int v5 = objc_msgSend(v3, "isEqualToString:", @"enhanced", v9.receiver, v9.super_class);

  if (v5)
  {
    v10[0] = @"sharedFlags";
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v7 = [v4 setByAddingObjectsFromArray:v6];

    unint64_t v4 = (void *)v7;
  }
  return v4;
}

- (void)setFileName:(id)a3
{
}

- (NSURL)URIRepresentation
{
  uint64_t v2 = [(RCCloudRecording *)self objectID];
  id v3 = [v2 URIRepresentation];

  return (NSURL *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  [(RCCloudRecording *)self setLocalTitle:v4];
  [(RCCloudRecording *)self setEncryptedTitle:v4];
}

- (BOOL)isContentBeingModified
{
  uint64_t v2 = [(RCCloudRecording *)self url];
  BOOL v3 = +[RCComposition _isSessionWithModificationAccessActiveForComposedAVURL:v2];

  return v3;
}

- (void)setComposedAssetHasMultipleTracks:(BOOL)a3
{
}

- (id)_labelAllowingEmptyString:(BOOL)a3
{
  id v4 = [(RCCloudRecording *)self title];
  int v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    if (a3)
    {
      int v8 = 0;
      goto LABEL_6;
    }
    uint64_t v9 = RCLocalizedFrameworkString(@"UNNAMED_RECORDING_LABEL");

    id v4 = (void *)v9;
    if (v9)
    {
LABEL_3:
      int v8 = RCDisplayStringForString(v4);
LABEL_6:

      goto LABEL_9;
    }
  }
  int v8 = 0;
LABEL_9:
  return v8;
}

- (id)_detailLabel
{
  BOOL v3 = [(RCCloudRecording *)self _labelAllowingEmptyString:1];
  if (!v3)
  {
    id v4 = (void *)_detailLabel___timeFormatter;
    if (!_detailLabel___timeFormatter)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      uint64_t v6 = (void *)_detailLabel___timeFormatter;
      _detailLabel___timeFormatter = (uint64_t)v5;

      [(id)_detailLabel___timeFormatter setTimeStyle:1];
      [(id)_detailLabel___timeFormatter setDateStyle:0];
      id v4 = (void *)_detailLabel___timeFormatter;
    }
    uint64_t v7 = [(RCCloudRecording *)self creationDate];
    BOOL v3 = [v4 stringFromDate:v7];
  }
  return v3;
}

- (AVAsset)avAsset
{
  if (!self->_avAsset)
  {
    BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v4 = [(RCCloudRecording *)self url];
    id v5 = [v4 path];
    int v6 = [v3 fileExistsAtPath:v5];

    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F166C8];
      int v8 = [(RCCloudRecording *)self url];
      objc_msgSend(v7, "rc_preciseTimingAssetWithURL:", v8);
      uint64_t v9 = (AVAsset *)objc_claimAutoreleasedReturnValue();
      avAsset = self->_avAsset;
      self->_avAsset = v9;
    }
  }
  id v11 = self->_avAsset;
  return v11;
}

- (id)_fileNameForSharing
{
  BOOL v3 = [(RCCloudRecording *)self title];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];

  id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  int v6 = [v4 stringByTrimmingCharactersInSet:v5];

  uint64_t v7 = NSString;
  id v8 = v6;
  uint64_t v9 = objc_msgSend(v7, "stringWithUTF8String:", objc_msgSend(v8, "fileSystemRepresentation"));

  if ([v9 length]) {
    goto LABEL_4;
  }
  id v10 = [(RCCloudRecording *)self url];
  id v11 = [v10 lastPathComponent];
  id v12 = [v11 stringByDeletingPathExtension];

  if ([v12 length])
  {
    uint64_t v9 = v12;
LABEL_4:
    id v12 = v9;
    id v13 = v12;
    goto LABEL_5;
  }
  char v15 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[RCCloudRecording _fileNameForSharing](v15);
  }

  id v13 = 0;
LABEL_5:

  return v13;
}

- (id)copyResourcesForSharingIntoDirectory:(id)a3
{
  id v4 = a3;
  id v5 = [(RCCloudRecording *)self url];
  int v6 = [(RCCloudRecording *)self _fileNameForSharing];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = [v4 URLByAppendingPathComponent:v6];
    uint64_t v9 = [v5 pathExtension];
    id v10 = [(id)v8 URLByAppendingPathExtension:v9];

    id v24 = 0;
    LOBYTE(v8) = [v7 copyItemAtURL:v5 toURL:v10 error:&v24];
    id v11 = v24;
    if (v8)
    {
      id v12 = objc_msgSend(v5, "rc_URLByReplacingPathExtensionWithExtension:", @"waveform");
      id v13 = [v12 lastPathComponent];
      uint64_t v14 = [v4 URLByAppendingPathComponent:v13];

      id v22 = (void *)v14;
      [v7 copyItemAtURL:v12 toURL:v14 error:0];
      id v21 = [MEMORY[0x1E4F166C8] assetWithURL:v10];
      char v15 = objc_msgSend(v21, "rc_recordingMetadata");
      id v16 = (void *)[v15 mutableCopy];

      [v16 setObject:0 forKeyedSubscript:@"title"];
      id v23 = v11;
      LOBYTE(v14) = objc_msgSend(MEMORY[0x1E4F16330], "rc_updateMetadataInFile:withRecordingMetadata:error:", v10, v16, &v23);
      id v17 = v23;

      if (v14)
      {
        id v18 = v10;
      }
      else
      {
        uint64_t v19 = OSLogForCategory(@"Default");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[RCCloudRecording copyResourcesForSharingIntoDirectory:]();
        }

        id v18 = 0;
      }
    }
    else
    {
      id v12 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[RCCloudRecording copyResourcesForSharingIntoDirectory:]();
      }
      id v18 = 0;
      id v17 = v11;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)subjectForActivityType:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"com.apple.UIKit.activity.AirDrop"])
  {
    v11[0] = @"SFAirDropActivitySubjectMain";
    id v4 = [(RCCloudRecording *)self _detailLabel];
    v11[1] = @"SFAirDropActivitySubjectDuration";
    v12[0] = v4;
    id v5 = (void *)MEMORY[0x1E4F28ED0];
    [(RCCloudRecording *)self length];
    int v6 = objc_msgSend(v5, "numberWithDouble:");
    v12[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

    uint64_t v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:0];
    uint64_t v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
  }
  else
  {
    uint64_t v9 = [(RCCloudRecording *)self _detailLabel];
  }
  return v9;
}

- (void)setLength:(double)a3
{
  -[RCCloudRecording setSyncedDuration:](self, "setSyncedDuration:");
  id v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [(RCCloudRecording *)self setLocalDuration:v5];

  avAsset = self->_avAsset;
  self->_avAsset = 0;
}

- (NSString)userFolderUUID
{
  uint64_t v2 = [(RCCloudRecording *)self folder];
  BOOL v3 = [v2 uuid];

  return (NSString *)v3;
}

- (void)setLocalTitle:(id)a3
{
}

- (void)setAvAsset:(id)a3
{
}

- (id)filePathForSyncingFromExistingAudioFuture
{
  BOOL v3 = [(RCCloudRecording *)self audioFuture];

  if (v3)
  {
    id v4 = RCAudioFileExtensionM4A;
LABEL_5:
    int v6 = *v4;
    uint64_t v7 = [(RCCloudRecording *)self creationDate];
    uint64_t v8 = [(RCCloudRecording *)self uuid];
    uint64_t v9 = +[RCSavedRecordingsModel standardPathForRecordingWithCreationDate:v7 uniqueID:v8 fileExtension:v6];

    goto LABEL_6;
  }
  id v5 = [(RCCloudRecording *)self mtAudioFuture];

  if (v5)
  {
    id v4 = RCAudioFileExtensionQTA;
    goto LABEL_5;
  }
  uint64_t v9 = 0;
LABEL_6:
  return v9;
}

- (void)setSyncedAudioFuture:(id)a3 sourceFileURL:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 pathExtension];
  int v8 = [v7 isEqualToString:@"qta"];

  if (v8) {
    [(RCCloudRecording *)self setMtAudioFuture:v6];
  }
  else {
    [(RCCloudRecording *)self setAudioFuture:v6];
  }

  uint64_t v9 = [(RCCloudRecording *)self mtAudioFuture];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [(RCCloudRecording *)self audioFuture];

    if (v11)
    {
      id v12 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[RCCloudRecording(SyncedProperties) setSyncedAudioFuture:sourceFileURL:](v8, v12);
      }
    }
  }
}

- (BOOL)canUpdateWithMultiTrackAsset
{
  uint64_t v2 = [(RCCloudRecording *)self audioFuture];
  BOOL v3 = v2 == 0;

  return v3;
}

- (double)syncedDuration
{
  uint64_t v2 = [(RCCloudRecording *)self duration];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setSyncedDuration:(double)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [(RCCloudRecording *)self setDuration:v4];
}

- (void)setSyncedSharedFlags:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  [(RCCloudRecording *)self setSharedFlags:v4];
}

- (void)setLayerMix:(float)a3
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(RCCloudRecording *)self setMtLayerMix:v4];
}

- (float)layerMix
{
  uint64_t v2 = [(RCCloudRecording *)self mtLayerMix];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (id)recordingsModel
{
  uint64_t v2 = [(RCCloudRecording *)self managedObjectContext];
  float v3 = [v2 recordingsModel];

  return v3;
}

- (BOOL)_copyCustomLabelToEncryptedTitleIfNeeded
{
  float v3 = [(RCCloudRecording *)self customLabel];
  if (v3
    && ([(RCCloudRecording *)self _migratedTitleDateString],
        float v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v3 isEqualToString:v4],
        v4,
        (v5 & 1) == 0))
  {
    uint64_t v7 = [(RCCloudRecording *)self customLabel];
    [(RCCloudRecording *)self setEncryptedTitle:v7];

    int v8 = [(RCCloudRecording *)self customLabel];
    [(RCCloudRecording *)self setLocalTitle:v8];

    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_copyEncryptedTitleToCustomLabelIfNeeded
{
  float v3 = [(RCCloudRecording *)self localTitle];
  if (v3)
  {
  }
  else
  {
    float v4 = [(RCCloudRecording *)self encryptedTitle];

    if (!v4) {
      return 0;
    }
  }
  char v5 = [(RCCloudRecording *)self encryptedTitle];
  if (v5)
  {
    [(RCCloudRecording *)self setCustomLabel:v5];
  }
  else
  {
    BOOL v6 = [(RCCloudRecording *)self localTitle];
    [(RCCloudRecording *)self setCustomLabel:v6];
  }
  return 1;
}

- (void)updateForRemoteTitleChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(RCCloudRecording *)self _isReadyToMigrate])
  {
    if (v3)
    {
      if (![(RCCloudRecording *)self _migrateCustomLabelIfNeeded:1]) {
        return;
      }
      char v5 = OSLogForCategory(@"Service");
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      BOOL v6 = [(RCCloudRecording *)self uuid];
      int v8 = 136315394;
      uint64_t v9 = "-[RCCloudRecording(SyncedProperties) updateForRemoteTitleChange:]";
      __int16 v10 = 2112;
      id v11 = v6;
      uint64_t v7 = "%s -- Migrated customLabel to encryptedTitle for recording %@";
    }
    else
    {
      if (![(RCCloudRecording *)self _copyCustomLabelToEncryptedTitleIfNeeded])return; {
      char v5 = OSLogForCategory(@"Service");
      }
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      BOOL v6 = [(RCCloudRecording *)self uuid];
      int v8 = 136315394;
      uint64_t v9 = "-[RCCloudRecording(SyncedProperties) updateForRemoteTitleChange:]";
      __int16 v10 = 2112;
      id v11 = v6;
      uint64_t v7 = "%s -- Copied customLabel to encryptedTitle for recording %@";
    }
    _os_log_impl(&dword_1C3964000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v8, 0x16u);

LABEL_10:
  }
}

- (void)updateForLocalTitleChange:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (![(RCCloudRecording *)self _migrateCustomLabelIfNeeded:0]) {
      return;
    }
    float v4 = OSLogForCategory(@"Service");
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    char v5 = [(RCCloudRecording *)self uuid];
    int v7 = 136315394;
    int v8 = "-[RCCloudRecording(SyncedProperties) updateForLocalTitleChange:]";
    __int16 v9 = 2112;
    __int16 v10 = v5;
    BOOL v6 = "%s -- Migrated customLabel to encryptedTitle for recording %@";
    goto LABEL_8;
  }
  if (![(RCCloudRecording *)self _copyEncryptedTitleToCustomLabelIfNeeded]) {
    return;
  }
  float v4 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = [(RCCloudRecording *)self uuid];
    int v7 = 136315394;
    int v8 = "-[RCCloudRecording(SyncedProperties) updateForLocalTitleChange:]";
    __int16 v9 = 2112;
    __int16 v10 = v5;
    BOOL v6 = "%s -- Copied encryptedTitle to customLabel for recording %@";
LABEL_8:
    _os_log_impl(&dword_1C3964000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0x16u);
  }
LABEL_9:
}

- (void)updateNilTitleFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(RCCloudRecording *)self _isReadyToMigrate])
  {
    char v5 = [(RCCloudRecording *)self encryptedTitle];

    if (!v5)
    {
      BOOL v6 = [(RCCloudRecording *)self localTitle];
      [(RCCloudRecording *)self setEncryptedTitle:v6];
    }
    int v7 = [(RCCloudRecording *)self customLabel];

    if (!v7)
    {
      if (v3)
      {
        int v8 = [(RCCloudRecording *)self _migratedTitleDateString];
        [(RCCloudRecording *)self setCustomLabel:v8];

        __int16 v9 = OSLogForCategory(@"Service");
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
LABEL_12:

          return;
        }
        __int16 v10 = [(RCCloudRecording *)self uuid];
        int v12 = 136315394;
        id v13 = "-[RCCloudRecording(SyncedProperties) updateNilTitleFields:]";
        __int16 v14 = 2112;
        char v15 = v10;
        uint64_t v11 = "%s -- Updated nil customLabel to date string for recording %@";
      }
      else
      {
        if (![(RCCloudRecording *)self _copyEncryptedTitleToCustomLabelIfNeeded])return; {
        __int16 v9 = OSLogForCategory(@"Service");
        }
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        __int16 v10 = [(RCCloudRecording *)self uuid];
        int v12 = 136315394;
        id v13 = "-[RCCloudRecording(SyncedProperties) updateNilTitleFields:]";
        __int16 v14 = 2112;
        char v15 = v10;
        uint64_t v11 = "%s -- Copied encryptedTitle to customLabel for recording %@";
      }
      _os_log_impl(&dword_1C3964000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0x16u);

      goto LABEL_12;
    }
  }
}

- (id)_migratedTitleDateString
{
  BOOL v3 = [(RCCloudRecording *)self managedObjectContext];
  float v4 = [v3 recordingsModel];

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__11;
  uint64_t v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__RCCloudRecording_SyncedProperties___migratedTitleDateString__block_invoke;
  v8[3] = &unk_1E64963C8;
  uint64_t v11 = &v12;
  id v5 = v4;
  id v9 = v5;
  __int16 v10 = self;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __62__RCCloudRecording_SyncedProperties___migratedTitleDateString__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) syncedDate];
  uint64_t v3 = [v2 unencryptedTitleDateStringFromDate:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)migrateCustomLabelIfNeeded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(RCCloudRecording *)self _isReadyToMigrate]
    && [(RCCloudRecording *)self _migrateCustomLabelIfNeeded:0])
  {
    uint64_t v3 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(RCCloudRecording *)self uuid];
      int v5 = 136315394;
      id v6 = "-[RCCloudRecording(SyncedProperties) migrateCustomLabelIfNeeded]";
      __int16 v7 = 2112;
      int v8 = v4;
      _os_log_impl(&dword_1C3964000, v3, OS_LOG_TYPE_DEFAULT, "%s -- Migrated customLabel to encryptedTitle for recording %@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (BOOL)_migrateCustomLabelIfNeeded:(BOOL)a3
{
  uint64_t v5 = [(RCCloudRecording *)self _migratedTitleDateString];
  id v6 = (void *)v5;
  __int16 v7 = &stru_1F1F06468;
  if (v5) {
    __int16 v7 = (__CFString *)v5;
  }
  int v8 = v7;

  uint64_t v9 = [(RCCloudRecording *)self customLabel];
  if (v9 && ([(__CFString *)v8 isEqualToString:v9] & 1) == 0)
  {
    uint64_t v11 = [(RCCloudRecording *)self encryptedTitle];
    char v12 = [v11 isEqualToString:v9];

    if ((v12 & 1) == 0)
    {
      if (a3)
      {
        id v13 = [(RCCloudRecording *)self _uniqueMigratedTitleWithTitleBase:v9];
      }
      else
      {
        id v13 = v9;
      }
      uint64_t v14 = v13;
      [(RCCloudRecording *)self setEncryptedTitle:v13];
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }
  char v15 = [(RCCloudRecording *)self customLabel];
  char v16 = [v15 isEqualToString:v8];

  if ((v16 & 1) == 0) {
    [(RCCloudRecording *)self setCustomLabel:v8];
  }
  uint64_t v17 = [(RCCloudRecording *)self encryptedTitle];
  if (v17)
  {
    id v18 = (void *)v17;
    uint64_t v19 = [(RCCloudRecording *)self localTitle];
    id v20 = [(RCCloudRecording *)self encryptedTitle];
    int v21 = [v19 isEqualToString:v20];

    if (v21)
    {
      id v22 = [(RCCloudRecording *)self encryptedTitle];
      [(RCCloudRecording *)self setLocalTitle:v22];
    }
  }

  return v10;
}

- (id)_uniqueMigratedTitleWithTitleBase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RCCloudRecording *)self managedObjectContext];
  id v6 = [v5 recordingsModel];

  __int16 v7 = [v6 recordingsWithTitle:v4];
  if ([v7 count] != 1) {
    goto LABEL_4;
  }
  int v8 = [v7 firstObject];
  uint64_t v9 = [v8 uuid];
  BOOL v10 = [(RCCloudRecording *)self uuid];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    id v12 = v4;
  }
  else
  {
LABEL_4:
    id v12 = [v6 nextRecordingDefaultLabelWithCustomTitleBase:v4];
  }
  id v13 = v12;

  return v13;
}

- (BOOL)_isReadyToMigrate
{
  uint64_t v3 = [(RCCloudRecording *)self audioFuture];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(RCCloudRecording *)self _isOlderThanMandatoryMigrationAge];
  }

  return v4;
}

- (BOOL)_isOlderThanMandatoryMigrationAge
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RCCloudRecording *)self date];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  double v6 = 3600.0;
  if (RCIsInternalInstall())
  {
    __int16 v7 = [MEMORY[0x1E4F1CB18] sharedSettingsUserDefaults];
    uint64_t v8 = [v7 integerForKey:@"com.apple.VoiceMemos.mandatoryMigrationAgeOverride"];

    if (v8 >= 1)
    {
      uint64_t v9 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = [(RCCloudRecording *)self uuid];
        int v12 = 136315650;
        id v13 = "-[RCCloudRecording(SyncedProperties) _isOlderThanMandatoryMigrationAge]";
        __int16 v14 = 2048;
        uint64_t v15 = v8;
        __int16 v16 = 2112;
        uint64_t v17 = v10;
        _os_log_impl(&dword_1C3964000, v9, OS_LOG_TYPE_DEFAULT, "%s -- com.apple.VoiceMemos.mandatoryMigrationAgeOverride was used with value of %li for recording with uuid %@", (uint8_t *)&v12, 0x20u);
      }
      double v6 = (double)v8;
    }
  }
  return v6 < -v5;
}

+ (id)savedRecordingURIForSearchableItemIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:a3];
}

+ (id)searchableItemIdentifierForSavedRecordingURI:(id)a3
{
  return (id)[a3 absoluteString];
}

- (void)_updateAudioFuture:isRecovery:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- Failed to create audio future for file at = %@", v2, v3, v4, v5, 2u);
}

- (void)_updateAudioFuture:isRecovery:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- Could not create audio digest - error = %@", v2, v3, v4, v5, 2u);
}

- (void)_updateAudioFuture:isRecovery:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- File does not exist at = %@", v2, v3, v4, v5, 2u);
}

- (void)_updateFlagsDerivedFromComposedAsset:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- Failed to decode transcription, error = %@", v2, v3, v4, v5, 2u);
}

- (void)synchronizeWithExistingAudioFuture:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[RCCloudRecording synchronizeWithExistingAudioFuture:]";
  _os_log_fault_impl(&dword_1C3964000, log, OS_LOG_TYPE_FAULT, "%s -- Audio Future was set to nil during synchronizeWithExistingAudioFuture", (uint8_t *)&v1, 0xCu);
}

- (void)synchronizeWithExistingAudioFuture:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- failed to mark as exported = %@", v2, v3, v4, v5, 2u);
}

- (void)synchronizeWithExistingAudioFuture:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [v4 attributesOfItemAtPath:a1 error:0];
  v6[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1C3964000, a2, OS_LOG_TYPE_DEBUG, "%s -- attributes = %@", (uint8_t *)v6, 0x16u);
}

+ (void)isRecordingExported:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- ERROR reading exclusion flag: %@", v2, v3, v4, v5, 2u);
}

- (void)setPlayable:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- Faied to update audio file metadata: error = %@", v2, v3, v4, v5, 2u);
}

- (void)_fileNameForSharing
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[RCCloudRecording _fileNameForSharing]";
  _os_log_error_impl(&dword_1C3964000, log, OS_LOG_TYPE_ERROR, "%s -- No filename exists for sharing", (uint8_t *)&v1, 0xCu);
}

- (void)copyResourcesForSharingIntoDirectory:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- Failed to remove title metadata - error = %@", v2, v3, v4, v5, 2u);
}

- (void)copyResourcesForSharingIntoDirectory:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- Failed to copy asset for sharing - error = %@", v2, v3, v4, v5, 2u);
}

@end