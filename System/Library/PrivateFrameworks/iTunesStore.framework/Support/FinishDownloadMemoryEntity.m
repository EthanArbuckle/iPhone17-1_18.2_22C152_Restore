@interface FinishDownloadMemoryEntity
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)hasRestoreData;
- (BOOL)isDeviceBasedVPP;
- (BOOL)isHLS;
- (BOOL)isPodcastDownload;
- (BOOL)isRentalDownload;
- (BOOL)isRestoreDownload;
- (BOOL)isSampleDownload;
- (BOOL)isSharedDownload;
- (BOOL)isStoreDownload;
- (BOOL)isTvTemplate;
- (FinishDownloadAssetMemoryEntity)mediaAsset;
- (NSArray)secondaryAssets;
- (NSNumber)durationInMilliseconds;
- (NSNumber)handlerIdentifier;
- (NSNumber)storeAccountIdentifier;
- (NSNumber)storeCollectionIdentifier;
- (NSNumber)storeItemIdentifier;
- (NSNumber)storePublicationVersion;
- (NSNumber)storeSagaIdentifier;
- (NSString)ITunesMetadataDestinationPath;
- (NSString)artistName;
- (NSString)artworkTemplateName;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)clientIdentifier;
- (NSString)collectionName;
- (NSString)documentTargetIdentifier;
- (NSString)downloadKind;
- (NSString)downloadPermalink;
- (NSString)genreName;
- (NSString)storeAccountName;
- (NSString)storeFrontIdentifier;
- (NSString)storeTransactionIdentifier;
- (NSString)storeXID;
- (NSString)title;
- (StoreDownload)storeMetadata;
- (id)destinationDirectoryPathForAsset:(id)a3;
- (id)libraryItemIdentifier;
- (id)newITunesMetadataDictionary;
- (id)secondaryAssetForType:(id)a3;
- (int64_t)automaticType;
- (int64_t)priority;
- (int64_t)restoreState;
- (int64_t)transactionID;
- (void)loadAssetsUsingSession:(id)a3;
- (void)setStoreMetadata:(id)a3;
@end

@implementation FinishDownloadMemoryEntity

- (NSString)artistName
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"artist_name"];
}

- (NSString)artworkTemplateName
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"artwork_template_name"];
}

- (int64_t)automaticType
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"is_automatic"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"bundle_id"];
}

- (NSString)bundleVersion
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"bundle_version"];
}

- (int64_t)priority
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"priority"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (NSString)clientIdentifier
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"client_id"];
}

- (NSString)collectionName
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"collection_name"];
}

- (id)destinationDirectoryPathForAsset:(id)a3
{
  v4 = [a3 destinationURLString];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSURL) initWithString:v4];
    v6 = [v5 path];
    v7 = [v6 stringByDeletingLastPathComponent];
  }
  else
  {
    id v5 = [(FinishDownloadMemoryEntity *)self downloadKind];
    v7 = sub_10018A454(v5);
  }

  return v7;
}

- (NSString)documentTargetIdentifier
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"document_target_id"];
}

- (NSString)downloadKind
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"kind"];
}

- (NSString)downloadPermalink
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"download_permalink"];
}

- (NSNumber)durationInMilliseconds
{
  return (NSNumber *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"duration_in_ms"];
}

- (NSString)genreName
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"genre_name"];
}

- (NSNumber)handlerIdentifier
{
  return (NSNumber *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"handler_id"];
}

- (BOOL)hasRestoreData
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"download_state.has_restore_data"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isDeviceBasedVPP
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"is_device_based_vpp"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isHLS
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"is_hls"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isPodcastDownload
{
  v2 = [(FinishDownloadMemoryEntity *)self downloadKind];
  char IsPodcastKind = SSDownloadKindIsPodcastKind();

  return IsPodcastKind;
}

- (BOOL)isRentalDownload
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"is_rental"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isRestoreDownload
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"is_restore"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isSampleDownload
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"is_sample"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isSharedDownload
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"is_shared"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isStoreDownload
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"is_from_store"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isTvTemplate
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"is_tv_template"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)ITunesMetadataDestinationPath
{
  unsigned __int8 v3 = [(FinishDownloadMemoryEntity *)self downloadKind];
  v4 = sub_10018A454(v3);
  id v5 = +[NSString stringWithFormat:@"%lld", [(FinishDownloadMemoryEntity *)self databaseID]];
  v6 = [v4 stringByAppendingPathComponent:v5];

  v7 = [v6 stringByAppendingPathExtension:@"plist"];

  return (NSString *)v7;
}

- (id)libraryItemIdentifier
{
  return [(FinishDownloadMemoryEntity *)self valueForProperty:@"library_id"];
}

- (void)loadAssetsUsingSession:(id)a3
{
  id v4 = a3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_10007B340;
  v35 = sub_10007B350;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_10007B340;
  v29 = sub_10007B350;
  id v30 = 0;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"download_id" equalToLongLong:[(FinishDownloadMemoryEntity *)self databaseID]];
  v7 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"IFNULL(asset.blocked_reason, 0)" equalToLongLong:0];
  v38[0] = v6;
  v38[1] = v7;
  v8 = +[NSArray arrayWithObjects:v38 count:2];
  v9 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  v10 = [v4 database];
  CFStringRef v37 = @"asset_order";
  v11 = +[NSArray arrayWithObjects:&v37 count:1];
  v12 = +[FinishDownloadAssetMemoryEntity queryWithDatabase:v10 predicate:v9 orderingProperties:v11];

  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_10007B358;
  v20 = &unk_1003A4D80;
  v23 = &v25;
  v24 = &v31;
  id v13 = v5;
  id v21 = v13;
  v22 = self;
  [v12 enumerateMemoryEntitiesUsingBlock:&v17];
  v14 = (void *)v32[5];
  if (!v14) {
    v14 = (void *)v26[5];
  }
  objc_storeStrong((id *)&self->_mediaAsset, v14);
  v15 = (NSArray *)objc_msgSend(v13, "copy", v17, v18, v19, v20);
  secondaryAssets = self->_secondaryAssets;
  self->_secondaryAssets = v15;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

- (id)newITunesMetadataDictionary
{
  id v3 = [(StoreDownload *)self->_storeMetadata copyWritableMetadata];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = SSDownloadMetadataKeyPurchaseDate;
  v6 = [(StoreDownload *)self->_storeMetadata valueForMetadataKey:SSDownloadMetadataKeyPurchaseDate];
  if (v6) {
    [v4 setObject:v6 forKey:v5];
  }
  v7 = [DownloadDRM alloc];
  v8 = [(StoreDownload *)self->_storeMetadata sinfs];
  v9 = [(DownloadDRM *)v7 initWithSinfArray:v8];

  v10 = [(DownloadDRM *)v9 sinfsArray];
  id v11 = [v10 copyValueForProperty:@"SinfPropertyAccountIdentifier" error:0];

  if (v11
    || ([(DownloadDRM *)v9 pinfsArray],
        v12 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v12 copyValueForProperty:@"SinfPropertyAccountIdentifier" error:0],
        v12,
        v11)
    || ([(FinishDownloadMemoryEntity *)self valueForProperty:@"store_account_id"],
        (id v11 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v40 = v3;
    v41 = v9;
    v42 = v4;
    id v13 = +[SSAccountStore defaultStore];
    v14 = [v13 accountWithUniqueIdentifier:v11];

    id v15 = [v14 copyLockdownRepresentation];
    if (!v15)
    {
      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      [v15 setObject:v11 forKey:kSSLockdownKeyAccountDSPersonID];
    }
    v16 = v6;
    v17 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"store_account_name"];
    uint64_t v18 = kSSLockdownKeyAccountID;
    v19 = [v15 objectForKey:kSSLockdownKeyAccountID];

    if (v19) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = v17 == 0;
    }
    if (!v20) {
      [v15 setObject:v17 forKey:v18];
    }
    id v21 = [(StoreDownload *)self->_storeMetadata downloaderAccountIdentifier];
    if (v21) {
      [v15 setObject:v21 forKey:@"DownloaderID"];
    }
    v22 = [(StoreDownload *)self->_storeMetadata familyAccountIdentifier];
    if (v22) {
      [v15 setObject:v22 forKey:@"FamilyID"];
    }
    v23 = [(StoreDownload *)self->_storeMetadata purchaserAccountIdentifier];
    if (v23) {
      [v15 setObject:v23 forKey:@"PurchaserID"];
    }
    [v42 setObject:v15 forKey:SSDownloadMetadataKeyAccountInfo];

    id v4 = v42;
    v6 = v16;
    id v3 = v40;
    v9 = v41;
  }
  v24 = [(FinishDownloadMemoryEntity *)self downloadKind];
  int IsToneKind = SSDownloadKindIsToneKind();

  if (IsToneKind)
  {
    v26 = +[NSString stringWithFormat:@"%llx", [(FinishDownloadMemoryEntity *)self databaseID]];
    [v4 setObject:v26 forKey:SSDownloadMetadataKeyRingtoneGUID];
  }
  uint64_t v27 = SSDownloadMetadataKeyIsPurchaseRedownload;
  v28 = [v3 objectForKey:SSDownloadMetadataKeyIsPurchaseRedownload];

  if (!v28)
  {
    v29 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"is_redownload"];
    unsigned int v30 = [v29 BOOLValue];

    if (v30) {
      [v3 setObject:&__kCFBooleanTrue forKey:v27];
    }
  }
  uint64_t v31 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"ref_app"];

  if (v31) {
    [v4 setObject:v31 forKey:SSDownloadMetadataKeyReferrerAppName];
  }
  v32 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"ref_url"];

  if (v32) {
    [v4 setObject:v32 forKey:SSDownloadMetadataKeyReferrerURL];
  }
  uint64_t v33 = [v3 objectForKey:@"sourceApp"];

  if (!v33)
  {
    v34 = [(FinishDownloadMemoryEntity *)self clientIdentifier];
    if (v34) {
      [v3 setObject:v34 forKey:@"sourceApp"];
    }
  }
  v35 = [v3 objectForKey:SSDownloadMetadataKeyVariantIdentifier];

  if (!v35)
  {
    id v36 = [(FinishDownloadMemoryEntity *)self mediaAsset];
    CFStringRef v37 = [v36 variantIdentifier];

    if (v37
      || ([(FinishDownloadMemoryEntity *)self valueForProperty:@"variant_id"],
          (CFStringRef v37 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [v3 setObject:v37 forKey:@"variantID"];
    }
  }
  v38 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"beta_external_version_identifier"];
  if (v38) {
    [v3 setObject:v38 forKey:SSDownloadMetadataKeyBetaExternalVersionIdentifier];
  }
  [v3 setObject:v4 forKey:SSDownloadMetadataKeyAdditionalInfo];

  return v3;
}

- (int64_t)restoreState
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"IFNULL(download_state.restore_state, 0)"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)secondaryAssetForType:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_secondaryAssets;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "assetType", (void)v13);
        unsigned int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSNumber)storeAccountIdentifier
{
  return (NSNumber *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"store_account_id"];
}

- (NSString)storeAccountName
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"store_account_name"];
}

- (NSNumber)storeCollectionIdentifier
{
  return (NSNumber *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"store_collection_id"];
}

- (NSString)storeFrontIdentifier
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"store_front_id"];
}

- (NSNumber)storeItemIdentifier
{
  return (NSNumber *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"store_item_id"];
}

- (NSNumber)storePublicationVersion
{
  return (NSNumber *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"store_publication_version"];
}

- (NSNumber)storeSagaIdentifier
{
  return (NSNumber *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"store_saga_id"];
}

- (NSString)storeTransactionIdentifier
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"store_transaction_id"];
}

- (NSString)storeXID
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"store_xid"];
}

- (NSString)title
{
  return (NSString *)[(FinishDownloadMemoryEntity *)self valueForProperty:@"title"];
}

- (int64_t)transactionID
{
  v2 = [(FinishDownloadMemoryEntity *)self valueForProperty:@"transaction_id"];
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  v4[0] = @"artist_name";
  v4[1] = @"artwork_template_name";
  v4[2] = @"is_automatic";
  v4[3] = @"bundle_id";
  v4[4] = @"bundle_version";
  v4[5] = @"client_id";
  v4[6] = @"collection_name";
  v4[7] = @"document_target_id";
  v4[8] = @"download_permalink";
  v4[9] = @"duration_in_ms";
  v4[10] = @"handler_id";
  v4[11] = @"genre_name";
  v4[12] = @"has_4k";
  v4[13] = @"has_dolby_vision";
  v4[14] = @"has_hdr";
  v4[15] = @"download_state.has_restore_data";
  v4[16] = @"is_device_based_vpp";
  v4[17] = @"is_hls";
  v4[18] = @"is_redownload";
  v4[19] = @"is_rental";
  v4[20] = @"is_restore";
  v4[21] = @"is_sample";
  v4[22] = @"is_shared";
  v4[23] = @"is_from_store";
  v4[24] = @"is_tv_template";
  v4[25] = @"is_device_based_vpp";
  v4[26] = @"kind";
  v4[27] = @"library_id";
  v4[28] = @"ref_app";
  v4[29] = @"ref_url";
  v4[30] = @"IFNULL(download_state.restore_state, 0)";
  v4[31] = @"store_account_name";
  v4[32] = @"store_account_id";
  v4[33] = @"store_collection_id";
  v4[34] = @"store_front_id";
  v4[35] = @"store_item_id";
  v4[36] = @"store_publication_version";
  v4[37] = @"store_saga_id";
  v4[38] = @"store_transaction_id";
  v4[39] = @"store_xid";
  v4[40] = @"title";
  v4[41] = @"transaction_id";
  v4[42] = @"priority";
  v2 = +[NSArray arrayWithObjects:v4 count:43];

  return v2;
}

- (FinishDownloadAssetMemoryEntity)mediaAsset
{
  return self->_mediaAsset;
}

- (StoreDownload)storeMetadata
{
  return self->_storeMetadata;
}

- (void)setStoreMetadata:(id)a3
{
}

- (NSArray)secondaryAssets
{
  return self->_secondaryAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeMetadata, 0);
  objc_storeStrong((id *)&self->_secondaryAssets, 0);

  objc_storeStrong((id *)&self->_mediaAsset, 0);
}

@end