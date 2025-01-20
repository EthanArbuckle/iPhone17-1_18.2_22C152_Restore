@interface InstallMediaDownloadOperation
- (BOOL)_areSourceAndDestinationEqual;
- (BOOL)_installExternalDownload:(id *)a3;
- (BOOL)_isDaemonOwned;
- (id)_installDaemonOwnedDownload:(id *)a3;
- (id)_newIPodLibraryItem;
- (void)_updateRentalsPlist;
- (void)run;
@end

@implementation InstallMediaDownloadOperation

- (void)run
{
  v3 = objc_alloc_init(FinishDownloadResponse);
  [(FinishDownloadResponse *)v3 setResult:4];
  v4 = [(FinishDownloadStepOperation *)self download];
  -[FinishDownloadResponse setDownloadIdentifier:](v3, "setDownloadIdentifier:", [v4 databaseID]);
  v5 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]([DownloadHandle alloc], "initWithTransactionIdentifier:downloadIdentifier:", [v4 transactionID], objc_msgSend(v4, "databaseID"));
  [(FinishDownloadResponse *)v3 setDownloadHandle:v5];
  v6 = [v4 mediaAsset];
  -[FinishDownloadResponse setMediaAssetIdentifier:](v3, "setMediaAssetIdentifier:", [v6 databaseID]);
  v7 = [v4 secondaryAssetForType:SSDownloadAssetTypeArtwork];
  v8 = [v4 secondaryAssetForType:SSDownloadAssetTypeXMLFeed];
  if (v7)
  {
    id v34 = 0;
    unsigned __int8 v9 = [(FinishDownloadStepOperation *)self downloadAndInstallAsset:v7 error:&v34];
    id v10 = v34;
    if ((v9 & 1) == 0)
    {
      unsigned int v11 = [v4 isPodcastDownload];
      if (!v11) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
  }
  else
  {
    id v10 = 0;
  }
  unsigned int v11 = 1;
LABEL_7:
  if (v8) {
    [(FinishDownloadStepOperation *)self downloadAndInstallAsset:v8 error:0];
  }
LABEL_9:
  unsigned __int8 v12 = [(InstallMediaDownloadOperation *)self _areSourceAndDestinationEqual];
  if (!v11 || (v12 & 1) != 0)
  {
    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
    id v33 = v10;
    unsigned __int8 v13 = [(FinishDownloadStepOperation *)self installAsset:v6 error:&v33];
    id v14 = v33;

    id v10 = v14;
    if ((v13 & 1) == 0) {
      goto LABEL_19;
    }
  }
  if (![(InstallMediaDownloadOperation *)self _isDaemonOwned])
  {
    id v32 = v10;
    unsigned __int8 v19 = [(InstallMediaDownloadOperation *)self _installExternalDownload:&v32];
    id v16 = v32;

    id v10 = v16;
    if (v19) {
      goto LABEL_26;
    }
LABEL_19:
    if (!v7)
    {
LABEL_21:
      if (v8) {
        [(FinishDownloadStepOperation *)self rollbackAsset:v8 error:0];
      }
      if (v6) {
        [(FinishDownloadStepOperation *)self rollbackAsset:v6 error:0];
      }
      [(FinishDownloadResponse *)v3 setError:v10];
      [(FinishDownloadResponse *)v3 setResult:0];
      id v16 = v10;
      goto LABEL_26;
    }
LABEL_20:
    [(FinishDownloadStepOperation *)self rollbackAsset:v7 error:0];
    goto LABEL_21;
  }
  id v31 = v10;
  v15 = [(InstallMediaDownloadOperation *)self _installDaemonOwnedDownload:&v31];
  id v16 = v31;

  if (!v15)
  {
    id v10 = v16;
    if (!v7) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if ([v4 isRentalDownload])
  {
    [(InstallMediaDownloadOperation *)self _updateRentalsPlist];
    v17 = +[NSFileManager defaultManager];
    [v4 ITunesMetadataDestinationPath];
    v18 = v29 = v15;
    [v17 removeItemAtPath:v18 error:0];

    v15 = v29;
  }
  else if ([v6 mediaLibraryProtectionType] == (id)2 {
         || ([v4 isHLS] & 1) != 0)
  }
  {
    v30 = v15;
    if (v7)
    {
      uint64_t v20 = [v4 destinationDirectoryPathForAsset:v7];
      uint64_t v21 = [v7 destinationFileName];
      v28 = (void *)v20;
      v22 = (void *)v20;
      v23 = (void *)v21;
      if ([v22 length] && objc_msgSend(v23, "length"))
      {
        v27 = +[NSFileManager defaultManager];
        v24 = [v28 stringByAppendingPathComponent:v23];
        [v27 removeItemAtPath:v24 error:0];
      }
    }
    v25 = +[NSFileManager defaultManager];
    v26 = [v4 ITunesMetadataDestinationPath];
    [v25 removeItemAtPath:v26 error:0];

    v15 = v30;
  }
  else
  {
    [(FinishDownloadStepOperation *)self addPurchaseManifestItemWithLibraryIdentifier:v15];
  }

LABEL_26:
  [(FinishDownloadStepOperation *)self finishWithDownloadResponse:v3];
}

- (BOOL)_areSourceAndDestinationEqual
{
  v2 = [(FinishDownloadStepOperation *)self download];
  v3 = [v2 mediaAsset];
  v4 = [v3 localPath];
  v5 = [v2 destinationDirectoryPathForAsset:v3];
  uint64_t v6 = [v3 destinationFileName];
  v7 = (void *)v6;
  unsigned __int8 v8 = 0;
  unsigned __int8 v9 = 0;
  if (v5)
  {
    if (v6)
    {
      uint64_t v10 = [v5 stringByAppendingPathComponent:v6];
      unsigned __int8 v9 = (void *)v10;
      unsigned __int8 v8 = 0;
      if (v4)
      {
        if (v10) {
          unsigned __int8 v8 = [v4 isEqualToString:v10];
        }
      }
    }
  }

  return v8;
}

- (id)_installDaemonOwnedDownload:(id *)a3
{
  v5 = [(FinishDownloadStepOperation *)self download];
  id v6 = [(InstallMediaDownloadOperation *)self _newIPodLibraryItem];
  v7 = [(FinishDownloadStepOperation *)self download];
  unsigned __int8 v8 = [v7 storeMetadata];
  [v6 setItemMetadata:v8];

  unsigned __int8 v9 = [[AddItemToIPodLibraryOperation alloc] initWithIPodLibraryItem:v6];
  id v27 = 0;
  unsigned __int8 v10 = [(InstallMediaDownloadOperation *)self runSubOperation:v9 returningError:&v27];
  id v11 = v27;
  if (v10)
  {
    unsigned __int8 v12 = [(AddItemToIPodLibraryOperation *)v9 IPodLibraryItem];
    unsigned __int8 v13 = [v12 itemMetadata];
    [v5 setStoreMetadata:v13];

    id v14 = [v5 newITunesMetadataDictionary];
    uint64_t v15 = SSDownloadMetadataKeyAdditionalInfo;
    id v16 = [v14 objectForKey:SSDownloadMetadataKeyAdditionalInfo];
    if (!v16)
    {
      id v16 = objc_alloc_init((Class)NSMutableDictionary);
      [v14 setObject:v16 forKey:v15];
    }
    v17 = [(AddItemToIPodLibraryOperation *)v9 insertedItemPersistentIdentifier];
    [v16 setObject:v17 forKey:SSDownloadMetadataKeyTrackPersistentID];
    v18 = [v5 ITunesMetadataDestinationPath];
    [(FinishDownloadStepOperation *)self writeBinaryPropertyList:v14 toPath:v18 error:0];
  }
  else
  {
    id v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      id v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v19 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    id v16 = [v14 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v20 &= 2u;
    }
    if (v20)
    {
      uint64_t v21 = objc_opt_class();
      id v22 = v21;
      id v23 = [v5 databaseID];
      int v28 = 138412802;
      v29 = v21;
      __int16 v30 = 2048;
      id v31 = v23;
      __int16 v32 = 2112;
      id v33 = v11;
      LODWORD(v26) = 32;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
        v17 = 0;
        goto LABEL_17;
      }
      id v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v28, v26);
      free(v24);
      SSFileLog();
    }
    v17 = 0;
  }

LABEL_17:
  if (a3 && !v17) {
    *a3 = v11;
  }

  return v17;
}

- (BOOL)_installExternalDownload:(id *)a3
{
  uint64_t v4 = (uint64_t)self;
  v5 = [(FinishDownloadStepOperation *)self download];
  id v6 = [v5 libraryItemIdentifier];
  if (v6)
  {
    v7 = objc_alloc_init(IPodLibraryItem);
    -[IPodLibraryItem setLibraryPersistentIdentifier:](v7, "setLibraryPersistentIdentifier:", [v6 longLongValue]);
    [(IPodLibraryItem *)v7 setUpdateType:1];
    if ([v5 isRestoreDownload]) {
      [(IPodLibraryItem *)v7 setDownloadType:1];
    }
    v24 = a3;
    uint64_t v8 = [v5 isHLS] ^ 1;
    unsigned __int8 v9 = [v5 mediaAsset];
    unsigned __int8 v10 = [v9 localPath];
    [(IPodLibraryItem *)v7 setItemMediaPath:v10];
    -[IPodLibraryItem setProtectionType:](v7, "setProtectionType:", [v9 mediaLibraryProtectionType]);
    [(IPodLibraryItem *)v7 loadPropertiesFromMediaPath:v10 includeTracks:v8];
    id v11 = [v5 secondaryAssetForType:SSDownloadAssetTypeArtwork];
    unsigned __int8 v12 = [v11 localPath];

    if (v12) {
      id v13 = [objc_alloc((Class)NSData) initWithContentsOfFile:v12];
    }
    else {
      id v13 = 0;
    }
    [(IPodLibraryItem *)v7 setItemArtworkData:v13];
    uint64_t v21 = [[AddItemToIPodLibraryOperation alloc] initWithIPodLibraryItem:v7];
    id v25 = 0;
    LOBYTE(v4) = [(id)v4 runSubOperation:v21 returningError:&v25];
    id v20 = v25;

    a3 = v24;
  }
  else
  {
    v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [(IPodLibraryItem *)v7 shouldLog];
    if ([(IPodLibraryItem *)v7 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    id v16 = [(IPodLibraryItem *)v7 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      int v17 = v15;
    }
    else {
      int v17 = v15 & 2;
    }
    if (v17)
    {
      v18 = objc_opt_class();
      id v19 = v18;
      int v26 = 138412546;
      id v27 = v18;
      __int16 v28 = 2048;
      id v29 = [v5 databaseID];
      LODWORD(v23) = 22;
      uint64_t v4 = _os_log_send_and_compose_impl();

      if (!v4)
      {
        id v20 = 0;
        goto LABEL_20;
      }
      id v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v4, 4, &v26, v23);
      free((void *)v4);
      SSFileLog();
    }

    id v20 = 0;
    LOBYTE(v4) = 0;
  }
LABEL_20:

  if (a3 && (v4 & 1) == 0) {
    *a3 = v20;
  }

  return v4;
}

- (BOOL)_isDaemonOwned
{
  v2 = [(FinishDownloadStepOperation *)self download];
  if ([v2 isStoreDownload])
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    id v4 = [v2 databaseID];
    v5 = [v2 downloadKind];
    id v6 = +[ScratchManager directoryPathForDownloadID:v4 kind:v5 createIfNeeded:1];

    v7 = [v2 mediaAsset];
    uint64_t v8 = [v7 localPath];

    unsigned __int8 v3 = [v8 hasPrefix:v6];
  }

  return v3;
}

- (id)_newIPodLibraryItem
{
  unsigned __int8 v3 = objc_alloc_init(IPodLibraryItem);
  id v4 = [(FinishDownloadStepOperation *)self download];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", [v4 databaseID]);
  [(IPodLibraryItem *)v3 setItemDownloadIdentifier:v5];

  id v6 = [v4 storeAccountIdentifier];
  [(IPodLibraryItem *)v3 setValue:v6 forAdditionalEntityProperty:ML3TrackPropertyStoreAccountID];

  v7 = [v4 libraryItemIdentifier];
  uint64_t v8 = v7;
  if (v7) {
    -[IPodLibraryItem setLibraryPersistentIdentifier:](v3, "setLibraryPersistentIdentifier:", [v7 longLongValue]);
  }
  if ([v4 isRestoreDownload]) {
    [(IPodLibraryItem *)v3 setDownloadType:1];
  }
  unsigned __int8 v9 = [v4 mediaAsset];
  -[IPodLibraryItem setProtectionType:](v3, "setProtectionType:", [v9 mediaLibraryProtectionType]);
  unsigned int v10 = [v4 isHLS];
  id v11 = [v4 downloadKind];
  unsigned __int8 v12 = sub_10018A454(v11);

  id v13 = [v9 destinationFileName];
  if (v13)
  {
    unsigned int v14 = [v12 stringByAppendingPathComponent:v13];
    [(IPodLibraryItem *)v3 setItemMediaPath:v14];
    [(IPodLibraryItem *)v3 loadPropertiesFromMediaPath:v14 includeTracks:v10 ^ 1];
  }
  int v15 = [v4 secondaryAssetForType:SSDownloadAssetTypeArtwork];
  id v16 = [v15 destinationFileName];

  if (v16)
  {
    id v17 = objc_alloc((Class)NSData);
    v18 = [v12 stringByAppendingPathComponent:v16];
    id v19 = [v17 initWithContentsOfFile:v18];

    [(IPodLibraryItem *)v3 setItemArtworkData:v19];
  }

  return v3;
}

- (void)_updateRentalsPlist
{
  unsigned __int8 v3 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Media"];
  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v3, @"iTunes_Control", @"iTunes", @"Rentals.plist", 0);
  v5 = +[NSString pathWithComponents:v4];
  id v6 = [objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:v5];
  if (v6
    || ([v5 stringByDeletingLastPathComponent],
        id v25 = objc_claimAutoreleasedReturnValue(),
        v26 = +[NSFileManager ensureDirectoryExists:v25], v25, v26)&& (id v6 = objc_alloc_init((Class)NSMutableDictionary)) != 0)
  {
    id v29 = v4;
    v7 = [(FinishDownloadStepOperation *)self download];
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v9 = [v7 title];
    if (v9) {
      [v8 setObject:v9 forKey:@"Name"];
    }
    __int16 v30 = (void *)v9;
    unsigned int v10 = [v7 downloadKind];
    if (v10) {
      [v8 setObject:v10 forKey:@"Kind"];
    }
    id v11 = sub_10018A454(v10);
    unsigned __int8 v12 = [v7 mediaAsset];
    id v13 = [v12 destinationFileName];
    unsigned int v14 = [v11 stringByAppendingPathComponent:v13];

    if (v14)
    {
      int v15 = (char *)[v14 rangeOfString:v3 options:8];
      if (v15 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = [v14 substringFromIndex:&v15[v16]];

        unsigned int v14 = (void *)v17;
      }
      [v8 setObject:v14 forKey:@"Path"];
    }
    id v18 = [v6 objectForKey:@"Rentals"];
    if (!v18)
    {
      id v18 = objc_alloc_init((Class)NSMutableArray);
      [v6 setObject:v18 forKey:@"Rentals"];
    }
    [v18 addObject:v8];
    if (![v6 writeToFile:v5 atomically:1]) {
      goto LABEL_24;
    }
    id v19 = +[SSLogConfig sharedDaemonConfig];
    if (!v19)
    {
      id v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      v20 |= 2u;
    }
    uint64_t v21 = [v19 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      v20 &= 2u;
    }
    if (v20)
    {
      int v31 = 138412546;
      id v32 = (id)objc_opt_class();
      __int16 v33 = 2112;
      id v34 = v30;
      __int16 v28 = v3;
      id v22 = v32;
      LODWORD(v27) = 22;
      uint64_t v23 = (void *)_os_log_send_and_compose_impl();

      unsigned __int8 v3 = v28;
      if (!v23)
      {
LABEL_23:

        v24 = +[DistributedNotificationCenter defaultCenter];
        [v24 postNotificationName:@"com.apple.itunesstored.RentalAdded"];

LABEL_24:
        id v4 = v29;
        goto LABEL_27;
      }
      uint64_t v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v31, v27);
      free(v23);
      SSFileLog();
    }

    goto LABEL_23;
  }
LABEL_27:
}

@end