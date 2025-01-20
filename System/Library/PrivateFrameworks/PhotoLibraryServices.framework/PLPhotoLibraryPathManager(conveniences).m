@interface PLPhotoLibraryPathManager(conveniences)
+ (id)temporaryRenderContentURLForInternalRendersWithExtension:()conveniences appropriateForURL:;
+ (uint64_t)defaultDeferredRenderFileFormatTypeIdentifier;
+ (uint64_t)defaultDeferredRenderFileFormatTypeIdentifierForHDR;
- (BOOL)_shouldRemoveOutboundResourceAtURL:()conveniences withExpiryInterval:;
- (id)URLForMetadataWithExtension:()conveniences forMediaInMainDirectory:withFilename:;
- (id)URLForPartialVideoDirectoryWithAssetUUID:()conveniences;
- (id)URLForPartialVideoWithResourceFingerprint:()conveniences assetUUID:timeRange:;
- (id)_cplLocalModeEnabledMarkerFilePathCreateIfNeeded:()conveniences;
- (id)_dcimAssetPathForResourceDirectoryPathType:()conveniences directory:filename:;
- (id)assetCreationHoldingDirectory;
- (id)assetCreationHoldingDirectoryForAssetUUID:()conveniences;
- (id)cloudServiceEnableLogFileURL;
- (id)cplDownloadFinishedMarkerFilePath;
- (id)cplEnableMarkerFilePath;
- (id)cplInitialSyncMarkerFilePath;
- (id)deletedMemoryUUIDsFilePath;
- (id)directoryPathForInFlightComments:()conveniences;
- (id)disableICloudPhotosFilePath;
- (id)enableICloudPhotosFilePath;
- (id)forceSoftResetSyncPath;
- (id)pauseICloudPhotosFilePath;
- (id)photoStreamsDataDirectory;
- (id)searchIndexDatabaseFilePath;
- (id)searchIndexGraphDataProgressFilePath;
- (id)searchIndexMetadataStoreFilePath;
- (id)searchIndexProgressFilePath;
- (id)searchIndexSpotlightProgressFilePath;
- (id)searchIndexStatusFilePath;
- (id)searchIndexSynonymsFilePath;
- (id)searchIndexSystemInfoFilePath;
- (id)searchIndexZeroKeywordStoreFilePath;
- (id)searchInitialSearchSuggestionsFilePath;
- (id)searchRecentSearchesFilePath;
- (id)spotlightSearchIndexPath;
- (id)temporaryRenderContentURLForInternalRendersWithExtension:()conveniences;
- (id)wipeCPLOnOpenPath;
- (uint64_t)assetPathForComputeDirectoryWithDirectory:()conveniences filename:;
- (uint64_t)assetPathForMutationsDirectoryWithDirectory:()conveniences filename:;
- (uint64_t)cloudSharingArchiveDirectory;
- (uint64_t)cplDataDirectoryCreateIfNeeded:()conveniences;
- (uint64_t)cplInitialSyncMarkerFileExists;
- (uint64_t)cplLocalModeEnabledMarkerFilePathForReading;
- (uint64_t)cplLocalModeEnabledMarkerFilePathForWriting;
- (uint64_t)isAppLibraryPathManager;
- (uint64_t)isCPLSyncablePhotoLibraryPathManager;
- (uint64_t)isSystemPhotoLibraryPathManager;
- (uint64_t)removeCPLDataDirectory;
- (uint64_t)removeComputeDirectory;
- (uint64_t)removePartialVideoDirectory;
- (uint64_t)searchIndexDirectory;
- (void)cleanupOutboundSharingFilesWithExpiryInterval:()conveniences;
@end

@implementation PLPhotoLibraryPathManager(conveniences)

- (id)searchInitialSearchSuggestionsFilePath
{
  v1 = [a1 searchIndexDirectory];
  v2 = [v1 stringByAppendingPathComponent:@"initialSuggestions.bplist"];

  return v2;
}

- (id)searchRecentSearchesFilePath
{
  v1 = [a1 searchIndexDirectory];
  v2 = [v1 stringByAppendingPathComponent:@"recentSearches.bplist"];

  return v2;
}

- (uint64_t)searchIndexDirectory
{
  return [a1 photoDirectoryWithType:3];
}

- (uint64_t)cplLocalModeEnabledMarkerFilePathForReading
{
  return [a1 _cplLocalModeEnabledMarkerFilePathCreateIfNeeded:0];
}

- (id)_cplLocalModeEnabledMarkerFilePathCreateIfNeeded:()conveniences
{
  if (a3) {
    uint64_t v4 = [a1 validateCreationRequestWithError:0];
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = [a1 photoDirectoryWithType:32 createIfNeeded:v4 error:0];
  v6 = [v5 stringByAppendingPathComponent:@"cpl_local_mode_enabled"];

  return v6;
}

- (id)searchIndexMetadataStoreFilePath
{
  v1 = [a1 searchIndexDirectory];
  v2 = [v1 stringByAppendingPathComponent:@"searchMetadata.plist"];

  return v2;
}

- (id)searchIndexDatabaseFilePath
{
  v1 = [a1 searchIndexDirectory];
  v2 = [v1 stringByAppendingPathComponent:@"psi.sqlite"];

  return v2;
}

- (id)temporaryRenderContentURLForInternalRendersWithExtension:()conveniences
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [a1 libraryURL];
  v7 = [v5 temporaryRenderContentURLForInternalRendersWithExtension:v4 appropriateForURL:v6];

  return v7;
}

- (BOOL)_shouldRemoveOutboundResourceAtURL:()conveniences withExpiryInterval:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v16 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C518];
  id v15 = 0;
  int v7 = [v5 getResourceValue:&v16 forKey:v6 error:&v15];
  id v8 = v16;
  id v9 = v15;
  if (v7)
  {
    v10 = [v8 dateByAddingTimeInterval:a1];
    [v10 timeIntervalSinceNow];
    BOOL v12 = v11 <= 0.0;
  }
  else
  {
    v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = [v5 lastPathComponent];
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "cleanupOutboundSharingFilesWithExpiryTimeout: Cannot get the creation date on outgoing resource file %{public}@. Marking for deletion anyway, error: %@", buf, 0x16u);
    }
    BOOL v12 = 1;
  }

  return v12;
}

- (void)cleanupOutboundSharingFilesWithExpiryInterval:()conveniences
{
  v55[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F1C628];
  v55[0] = *MEMORY[0x1E4F1C518];
  v55[1] = v4;
  uint64_t v42 = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  uint64_t v6 = [a1 privateDirectoryWithSubType:2];
  if (![a1 isDCIM]) {
    goto LABEL_4;
  }
  int v7 = [a1 libraryURL];
  id v8 = [v7 path];
  id v9 = [v8 stringByAppendingPathComponent:@"PhotoData/OutgoingTemp"];

  if ([v6 isEqualToString:v9])
  {

LABEL_4:
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    double v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1];
    BOOL v12 = [v10 enumeratorAtURL:v11 includingPropertiesForKeys:v5 options:12 errorHandler:&__block_literal_global_89057];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (!v14)
    {
      id v9 = v13;
      goto LABEL_37;
    }
    uint64_t v15 = v14;
    v40 = v6;
    v41 = v5;
    uint64_t v16 = *(void *)v47;
    v17 = v13;
    while (1)
    {
      uint64_t v18 = 0;
      uint64_t v43 = v15;
      do
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(v17);
        }
        __int16 v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
        id v20 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v21 = [v19 lastPathComponent];
        if ([a1 _shouldRemoveOutboundResourceAtURL:v19 withExpiryInterval:a2])
        {
          uint64_t v22 = v16;
          v23 = a1;
          v24 = v17;
          id v44 = 0;
          id v45 = 0;
          char v25 = [v19 getResourceValue:&v45 forKey:v42 error:&v44];
          id v26 = v45;
          v27 = v44;
          if ((v25 & 1) == 0)
          {
            v29 = PLBackendGetLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v51 = v21;
              __int16 v52 = 2112;
              v53 = v27;
              _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "cleanupOutboundSharingFilesWithExpiryTimeout: Cannot check if file URL is a directory, skipping: %{public}@, error: %@", buf, 0x16u);
            }
            v17 = v24;
            a1 = v23;
            uint64_t v16 = v22;
            uint64_t v15 = v43;
LABEL_29:

LABEL_30:
            goto LABEL_31;
          }
          if ([v26 BOOLValue])
          {
            v17 = v24;
            int v28 = [v24 isEnumeratingDirectoryPostOrder];
            a1 = v23;
            uint64_t v16 = v22;
            uint64_t v15 = v43;
            if (v28
              && rmdir((const char *)[v19 fileSystemRepresentation]) == -1
              && *__error() != 66)
            {
              v29 = PLBackendGetLog();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                v30 = __error();
                v31 = strerror(*v30);
                *(_DWORD *)buf = 138543618;
                v51 = v21;
                __int16 v52 = 2080;
                v53 = v31;
                _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "cleanupOutboundSharingFilesWithExpiryTimeout: could not remove directory: %{public}@, error: %s", buf, 0x16u);
              }
              goto LABEL_29;
            }
            goto LABEL_30;
          }
          int v32 = unlink((const char *)[v19 fileSystemRepresentation]);
          v33 = PLBackendGetLog();
          v29 = v33;
          if (v32 == -1)
          {
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v38 = __error();
              v39 = strerror(*v38);
              *(_DWORD *)buf = 138543618;
              v51 = v21;
              __int16 v52 = 2080;
              v53 = v39;
              v34 = v29;
              os_log_type_t v35 = OS_LOG_TYPE_ERROR;
              v36 = "cleanupOutboundSharingFilesWithExpiryTimeout: Unable to delete expired outbound file '%{public}@' error: %s";
              uint32_t v37 = 22;
LABEL_27:
              _os_log_impl(&dword_19B3C7000, v34, v35, v36, buf, v37);
            }
          }
          else if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v51 = v21;
            v34 = v29;
            os_log_type_t v35 = OS_LOG_TYPE_INFO;
            v36 = "cleanupOutboundSharingFilesWithExpiryTimeout: Successfully deleted expired outbound file '%{public}@'";
            uint32_t v37 = 12;
            goto LABEL_27;
          }
          v17 = v24;
          a1 = v23;
          uint64_t v16 = v22;
          uint64_t v15 = v43;
          goto LABEL_29;
        }
        v27 = PLBackendGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v51 = v21;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_INFO, "cleanupOutboundSharingFilesWithExpiryTimeout: Skip deleting non-expired file: %{public}@", buf, 0xCu);
        }
LABEL_31:

        ++v18;
      }
      while (v15 != v18);
      uint64_t v15 = [v17 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (!v15)
      {
        id v9 = v17;
        v13 = v17;
        uint64_t v6 = v40;
        id v5 = v41;
        goto LABEL_37;
      }
    }
  }
  v13 = PLBackendGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v6;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "cleanupOutboundSharingFilesWithExpiryTimeout: unexpected outbound sharing path: %@", buf, 0xCu);
  }
LABEL_37:
}

- (id)assetCreationHoldingDirectoryForAssetUUID:()conveniences
{
  id v4 = a3;
  id v5 = [a1 assetCreationHoldingDirectory];
  uint64_t v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (id)assetCreationHoldingDirectory
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  uint64_t v2 = [a1 validateCreationRequestWithError:&v9];
  id v3 = v9;
  id v8 = v3;
  id v4 = [a1 externalDirectoryWithSubType:2 leafType:1 additionalPathComponents:0 createIfNeeded:v2 error:&v8];
  id v5 = v8;

  if (v5 && ([MEMORY[0x1E4F8B908] isFileExistsError:v5] & 1) == 0)
  {
    uint64_t v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to create external directory for asset creation: %@", buf, 0xCu);
    }
  }
  return v4;
}

- (uint64_t)removeComputeDirectory
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v1 = [a1 photoDirectoryWithType:18];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = 0;
  uint64_t v3 = [v2 removeItemAtPath:v1 error:&v7];
  id v4 = v7;
  if (v3)
  {
LABEL_6:

    goto LABEL_7;
  }
  char v5 = PLIsErrorFileNotFound();

  if ((v5 & 1) == 0)
  {
    uint64_t v2 = PLBackendGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Failed to remove compute directory: %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
  uint64_t v3 = 1;
LABEL_7:

  return v3;
}

- (uint64_t)removePartialVideoDirectory
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v2 = [a1 photoDirectoryWithType:19];
  uint64_t v3 = 1;
  id v4 = [v1 fileURLWithPath:v2 isDirectory:1];

  char v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = 0;
  char v6 = [v5 removeItemAtURL:v4 error:&v10];
  id v7 = v10;
  if ((v6 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v8 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Failed to remove partial video directory: %@", buf, 0xCu);
      }
    }
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)URLForPartialVideoDirectoryWithAssetUUID:()conveniences
{
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = a3;
  char v6 = [a1 photoDirectoryWithType:19];
  id v7 = [v4 fileURLWithPath:v6 isDirectory:1];

  id v8 = [v5 substringToIndex:1];
  id v9 = [v8 uppercaseString];

  id v10 = [v7 URLByAppendingPathComponent:v9];
  id v11 = [v10 URLByAppendingPathComponent:v5];

  return v11;
}

- (id)URLForPartialVideoWithResourceFingerprint:()conveniences assetUUID:timeRange:
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [v8 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

    id v8 = (id)v10;
  }
  id v11 = NSString;
  uint64_t v12 = *a5;
  uint64_t v13 = a5[3];
  uint64_t v14 = *((unsigned int *)a5 + 2);
  uint64_t v15 = *((unsigned int *)a5 + 8);
  uint64_t v16 = [(id)*MEMORY[0x1E4F44438] preferredFilenameExtension];
  v17 = [v11 stringWithFormat:@"%@_%lld_%d-%lld_%d.%@", v8, v12, v14, v13, v15, v16];

  uint64_t v18 = [a1 URLForPartialVideoDirectoryWithAssetUUID:v9];

  __int16 v19 = [v18 URLByAppendingPathComponent:v17];

  return v19;
}

- (uint64_t)cloudSharingArchiveDirectory
{
  return [a1 photoDirectoryWithType:22 additionalPathComponents:@"INFLIGHT_JOBS"];
}

- (id)directoryPathForInFlightComments:()conveniences
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int v4 = [a1 validateCreationRequestWithError:0];
    id v5 = [a1 photoDirectoryWithType:22 additionalPathComponents:@"INFLIGHTCOMMENTS"];
    if (v4)
    {
      char v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
      id v16 = 0;
      char v7 = [v6 getResourceValue:&v16 forKey:*MEMORY[0x1E4F1C5C0] error:0];
      id v8 = v16;
      if ((v7 & 1) == 0)
      {
        id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v15 = 0;
        char v10 = [v9 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v15];
        id v11 = v15;

        if ((v10 & 1) == 0)
        {
          uint64_t v12 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = [v6 path];
            *(_DWORD *)buf = 138412546;
            uint64_t v18 = v13;
            __int16 v19 = 2112;
            id v20 = v11;
            _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory \"%@\": %@", buf, 0x16u);
          }
          id v5 = 0;
        }
      }
    }
  }
  else
  {
    id v5 = [a1 photoDirectoryWithType:22 additionalPathComponents:@"INFLIGHTCOMMENTS"];
  }
  return v5;
}

- (id)cloudServiceEnableLogFileURL
{
  uint64_t v2 = [a1 validateCreationRequestWithError:0];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
  int v4 = [a1 photoDirectoryWithType:5 createIfNeeded:v2 error:0];
  id v5 = [v4 stringByAppendingPathComponent:@"cloudServiceEnableLog.plist"];
  char v6 = [v3 fileURLWithPath:v5 isDirectory:0];

  return v6;
}

- (uint64_t)removeCPLDataDirectory
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v1 = [a1 cplDataDirectoryCreateIfNeeded:0];
  uint64_t v2 = [v1 stringByDeletingPathExtension];
  uint64_t v3 = [v2 stringByAppendingString:@"-aside"];
  int v4 = [v1 pathExtension];
  id v5 = [v3 stringByAppendingPathExtension:v4];

  char v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v8 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v1;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Removing CPL directory: %@", buf, 0xCu);
    }
  }
  id v23 = 0;
  char v9 = [v6 removeItemAtPath:v5 error:&v23];
  id v10 = v23;
  if (v9)
  {
    if (*v7) {
      goto LABEL_15;
    }
    id v11 = __CPLAssetsdOSLogDomain();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Existing CPL aside directory removed";
    uint64_t v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    uint32_t v15 = 2;
    goto LABEL_13;
  }
  if ((PLIsErrorFileNotFound() & 1) == 0 && !*v7)
  {
    id v11 = __CPLAssetsdOSLogDomain();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      goto LABEL_15;
    }
    *(_DWORD *)buf = 138412290;
    id v25 = v10;
    uint64_t v12 = "Failed to remove existing aside CPL directory: %@";
    uint64_t v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 12;
LABEL_13:
    _os_log_impl(&dword_19B3C7000, v13, v14, v12, buf, v15);
    goto LABEL_14;
  }
LABEL_15:
  id v22 = v10;
  char v16 = [v6 removeItemAtPath:v1 error:&v22];
  id v17 = v22;

  if (v16)
  {
    if (!*v7)
    {
      uint64_t v18 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        __int16 v19 = "CPL directory removed";
LABEL_23:
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
LABEL_31:
    uint64_t v20 = 1;
    goto LABEL_30;
  }
  if ((PLIsErrorFileNotFound() & 1) == 0)
  {
    if (*v7)
    {
      uint64_t v20 = 0;
      goto LABEL_30;
    }
    uint64_t v18 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v17;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to remove CPL directory: %@", buf, 0xCu);
    }
    uint64_t v20 = 0;
    goto LABEL_29;
  }
  if (*v7) {
    goto LABEL_31;
  }
  uint64_t v18 = __CPLAssetsdOSLogDomain();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    __int16 v19 = "CPL directory does not exist";
    goto LABEL_23;
  }
LABEL_24:
  uint64_t v20 = 1;
LABEL_29:

LABEL_30:
  return v20;
}

- (uint64_t)cplInitialSyncMarkerFileExists
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [a1 cplInitialSyncMarkerFilePath];
  uint64_t v4 = [v2 fileExistsAtPath:v3];

  return v4;
}

- (id)cplInitialSyncMarkerFilePath
{
  v1 = [a1 photoDirectoryWithType:13 leafType:3 createIfNeeded:0 error:0];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"initialsync_marker"];

  return v2;
}

- (uint64_t)cplLocalModeEnabledMarkerFilePathForWriting
{
  return [a1 _cplLocalModeEnabledMarkerFilePathCreateIfNeeded:1];
}

- (id)cplDownloadFinishedMarkerFilePath
{
  v1 = objc_msgSend(a1, "photoDirectoryWithType:createIfNeeded:error:", 32, objc_msgSend(a1, "validateCreationRequestWithError:", 0), 0);
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"cpl_download_finished_marker"];

  return v2;
}

- (id)cplEnableMarkerFilePath
{
  v1 = objc_msgSend(a1, "photoDirectoryWithType:createIfNeeded:error:", 32, objc_msgSend(a1, "validateCreationRequestWithError:", 0), 0);
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"cpl_enabled_marker"];

  return v2;
}

- (id)wipeCPLOnOpenPath
{
  v1 = objc_msgSend(a1, "photoDirectoryWithType:createIfNeeded:error:", 34, objc_msgSend(a1, "validateCreationRequestWithError:", 0), 0);
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"wipeCPLOnOpen"];

  return v2;
}

- (id)forceSoftResetSyncPath
{
  v1 = objc_msgSend(a1, "photoDirectoryWithType:createIfNeeded:error:", 32, objc_msgSend(a1, "validateCreationRequestWithError:", 0), 0);
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"forceSoftResetSync"];

  return v2;
}

- (id)disableICloudPhotosFilePath
{
  v1 = objc_msgSend(a1, "photoDirectoryWithType:createIfNeeded:error:", 34, objc_msgSend(a1, "validateCreationRequestWithError:", 0), 0);
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"disableICloudPhotos"];

  return v2;
}

- (id)pauseICloudPhotosFilePath
{
  v1 = [a1 cplDataDirectoryCreateIfNeeded:1];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"pauseICloudPhotos"];

  return v2;
}

- (id)enableICloudPhotosFilePath
{
  v1 = [a1 cplDataDirectoryCreateIfNeeded:1];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"enableICloudPhotos"];

  return v2;
}

- (uint64_t)cplDataDirectoryCreateIfNeeded:()conveniences
{
  if (a3) {
    uint64_t v4 = [a1 validateCreationRequestWithError:0];
  }
  else {
    uint64_t v4 = 0;
  }
  return [a1 photoDirectoryWithType:13 leafType:3 createIfNeeded:v4 error:0];
}

- (id)deletedMemoryUUIDsFilePath
{
  v1 = [a1 photoDirectoryWithType:6];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"deleted_memory_uuids.plist"];

  return v2;
}

- (id)searchIndexStatusFilePath
{
  v1 = [a1 searchIndexDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"searchIndexStatus.plist"];

  return v2;
}

- (id)spotlightSearchIndexPath
{
  v1 = [a1 searchIndexDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Spotlight"];

  return v2;
}

- (id)searchIndexSpotlightProgressFilePath
{
  v1 = [a1 searchIndexDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"spotlightProgress.plist"];

  return v2;
}

- (id)searchIndexSynonymsFilePath
{
  v1 = [a1 searchIndexDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"synonyms.plist"];

  return v2;
}

- (id)searchIndexGraphDataProgressFilePath
{
  v1 = [a1 searchIndexDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"graphDataProgress.plist"];

  return v2;
}

- (id)searchIndexZeroKeywordStoreFilePath
{
  v1 = [a1 searchIndexDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"zeroKeywords.data"];

  return v2;
}

- (id)searchIndexProgressFilePath
{
  v1 = [a1 searchIndexDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"searchProgress.plist"];

  return v2;
}

- (id)searchIndexSystemInfoFilePath
{
  v1 = [a1 searchIndexDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"searchSystemInfo.plist"];

  return v2;
}

- (id)photoStreamsDataDirectory
{
  v1 = [a1 baseDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:*MEMORY[0x1E4F8C4F8]];

  return v2;
}

- (id)URLForMetadataWithExtension:()conveniences forMediaInMainDirectory:withFilename:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v12 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v13 = [a1 photoDirectoryWithType:10];
  os_log_type_t v14 = [v12 fileURLWithPath:v13 isDirectory:1];

  if (v9)
  {
    uint32_t v15 = [a1 assetAbbreviatedMetadataDirectoryForDirectory:v9 type:31 bundleScope:0];
    uint64_t v16 = [v14 URLByAppendingPathComponent:v15 isDirectory:1];

    os_log_type_t v14 = (void *)v16;
  }
  if (v10)
  {
    id v17 = [v10 stringByDeletingPathExtension];
    uint64_t v18 = [v14 URLByAppendingPathComponent:v17 isDirectory:0];

    if (v8)
    {
      uint64_t v19 = [v18 URLByAppendingPathExtension:v8];

      uint64_t v18 = (void *)v19;
    }

    os_log_type_t v14 = v18;
  }

  return v14;
}

- (uint64_t)assetPathForComputeDirectoryWithDirectory:()conveniences filename:
{
  return [a1 _dcimAssetPathForResourceDirectoryPathType:18 directory:a3 filename:a4];
}

- (uint64_t)assetPathForMutationsDirectoryWithDirectory:()conveniences filename:
{
  return [a1 _dcimAssetPathForResourceDirectoryPathType:9 directory:a3 filename:a4];
}

- (id)_dcimAssetPathForResourceDirectoryPathType:()conveniences directory:filename:
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x19F38D3B0]();
  id v11 = [a1 assetAbbreviatedMetadataDirectoryForDirectory:v8 type:31 bundleScope:0];
  uint64_t v12 = [v9 stringByDeletingPathExtension];
  if (!v11)
  {
LABEL_7:
    uint64_t v13 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = 0;
  if ([v11 length] && v12)
  {
    if ([v12 length])
    {
      os_log_type_t v14 = [a1 photoDirectoryWithType:a3];
      if (v14)
      {
        uint32_t v15 = v14;
        uint64_t v16 = [v14 stringByAppendingPathComponent:v11];

        uint64_t v13 = [v16 stringByAppendingPathComponent:v12];

        goto LABEL_8;
      }
    }
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (uint64_t)isCPLSyncablePhotoLibraryPathManager
{
  if ([a1 isSystemPhotoLibraryPathManager]) {
    return 1;
  }
  return [a1 isAppLibraryPathManager];
}

- (uint64_t)isAppLibraryPathManager
{
  v1 = +[PLCPLSettings settingsWithPathManager:a1];
  uint64_t v2 = [v1 isAppLibrary];

  return v2;
}

- (uint64_t)isSystemPhotoLibraryPathManager
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLPhotoLibraryBundleController sharedBundleController];
  uint64_t v3 = [a1 libraryURL];
  uint64_t v4 = [v2 bundleForLibraryURL:v3];

  if (v4)
  {
    uint64_t v5 = [v4 isSystemPhotoLibrary];
  }
  else
  {
    char v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v7 = [a1 libraryURL];
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = objc_opt_class();
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "PLPhotoLibraryBundle is not available for %@. Falling back to %{public}@ isSystemPhotoLibraryURL:", (uint8_t *)&v11, 0x16u);
    }
    id v8 = objc_opt_class();
    id v9 = [a1 libraryURL];
    uint64_t v5 = [v8 isSystemPhotoLibraryURL:v9];
  }
  return v5;
}

+ (uint64_t)defaultDeferredRenderFileFormatTypeIdentifierForHDR
{
  return [(id)*MEMORY[0x1E4F443E0] identifier];
}

+ (uint64_t)defaultDeferredRenderFileFormatTypeIdentifier
{
  return [(id)*MEMORY[0x1E4F44410] identifier];
}

+ (id)temporaryRenderContentURLForInternalRendersWithExtension:()conveniences appropriateForURL:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = [MEMORY[0x1E4F8CDF8] typeWithFilenameExtension:v5];
  id v8 = [v7 identifier];
  if (!+[PLManagedAsset isPrimaryImageFormatForUTI:v8])
  {
    char v9 = [v7 conformsToType:*MEMORY[0x1E4F44490]];

    if (v9) {
      goto LABEL_6;
    }
    id v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v5;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Unexpected non-primary filename extension %{public}@ for render content URL", buf, 0xCu);
    }
  }

LABEL_6:
  id v10 = NSTemporaryDirectory();
  if (v10)
  {
    int v11 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v10 isDirectory:1];
    uint64_t v12 = NSString;
    __int16 v13 = [MEMORY[0x1E4F8BA08] UUIDString];
    uint64_t v14 = [v12 stringWithFormat:@"render.%@", v13];
    uint64_t v15 = [v14 stringByAppendingPathExtension:v5];

    uint64_t v16 = [v11 URLByAppendingPathComponent:v15];
  }
  else
  {
    int v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "error finding temporary directory for %@", buf, 0xCu);
    }
    uint64_t v16 = 0;
  }

  return v16;
}

@end