@interface Download
+ (Class)databaseEntityClass;
- (BOOL)_setAssetsWithExternalAssets:(id)a3 error:(id *)a4;
- (BOOL)_setAssetsWithExternalThinnedAssets:(id)a3 error:(id *)a4;
- (BOOL)_setDatabasePropertiesWithExternalMetadata:(id)a3 error:(id *)a4;
- (BOOL)_setThumbnailImageWithExternalAssets:(id)a3 error:(id *)a4;
- (Download)initWithClientXPCDownload:(id)a3;
- (Download)initWithExternalManifestDictionary:(id)a3;
- (Download)initWithMicroPaymentDownload:(id)a3 clientID:(id)a4;
- (Download)initWithStoreDownload:(id)a3;
- (NSArray)assets;
- (SSDownloadPolicy)downloadPolicy;
- (id)_copyValidAssetsWithExternalAssets:(id)a3 validateVariants:(BOOL)a4;
- (id)_newAssetArrayWithDownloadAssets:(id)a3;
- (id)anyAssetForAssetType:(id)a3;
- (id)assetForAssetIdentifier:(int64_t)a3;
- (id)copyInMemoryStoreDownloadMetadata;
- (id)copyJobActivity;
- (id)copyStoreDownloadMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)removeAssetsWithAssetType:(id)a3;
- (void)setAssets:(id)a3;
- (void)setDownloadPolicy:(id)a3;
- (void)unionNetworkConstraints:(id)a3;
@end

@implementation Download

- (id)copyJobActivity
{
  id v3 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  v4 = [(Download *)self valueForProperty:@"store_artist_id"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 copy];
    [v3 setArtistID:v5];
  }
  v6 = [(Download *)self valueForProperty:@"artist_name"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 copy];
    [v3 setArtistName:v7];
  }
  v8 = [(Download *)self valueForProperty:@"bundle_id"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 copy];
    [v3 setBundleID:v9];
  }
  v10 = [(Download *)self valueForProperty:@"beta_external_version_identifier"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v10 copy];
    [v3 setBetaExternalVersionIdentifier:v11];
  }
  v12 = [(Download *)self valueForProperty:@"bundle_version"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v12 copy];
    [v3 setBundleVersion:v13];
  }
  v14 = [(Download *)self valueForProperty:@"is32BitOnly"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v3, "setThirtyTwoBitOnly:", objc_msgSend(v14, "BOOLValue"));
  }
  v15 = [(Download *)self valueForProperty:@"store_redownload_parameters"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = [v15 copy];
    [v3 setBuyParams:v16];
  }
  v17 = [(Download *)self valueForProperty:@"cancel_url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = [v17 copy];
    [v3 setCancelDownloadURL:v18];
  }
  v19 = [(Download *)self valueForProperty:@"cancel_if_duplicate"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setCancelIfDuplicate:", objc_msgSend(v19, "BOOLValue"));
  }
  v20 = [(Download *)self valueForProperty:@"client_id"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = [v20 copy];
    [v3 setClientID:v21];
  }
  v22 = [(Download *)self valueForProperty:@"collection_name"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = [v22 copy];
    [v3 setCollectionName:v23];
  }
  v24 = +[NSNumber numberWithLongLong:[(Download *)self databaseID]];
  if ([(Download *)self databaseID]) {
    [v3 setDivertedTrackingID:v24];
  }
  v25 = [(Download *)self valueForProperty:@"is_device_based_vpp"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setIsDeviceBasedVPP:", objc_msgSend(v25, "BOOLValue"));
  }
  v26 = [(Download *)self valueForProperty:@"enable_extensions"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = [v26 copy];
    [v3 setEnableExtensions:v27];
  }
  v28 = [(Download *)self valueForProperty:@"is_explicit"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setExplicitContent:", objc_msgSend(v28, "BOOLValue"));
  }
  v29 = [(Download *)self valueForProperty:@"is_from_store"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setIsFromStore:", objc_msgSend(v29, "BOOLValue"));
  }
  v30 = [(Download *)self valueForProperty:@"is_tv_template"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setIsTVTemplate:", objc_msgSend(v30, "BOOLValue"));
  }
  v31 = [(Download *)self valueForProperty:@"genre_name"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = [v31 copy];
    [v3 setGenre:v32];
  }
  v33 = [(Download *)self valueForProperty:@"store_genre_id"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v34 = [v33 copy];
    [v3 setGenreID:v34];
  }
  v35 = [(Download *)self valueForProperty:@"is_store_queued"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setIsInQueue:", objc_msgSend(v35, "BOOLValue"));
  }
  v36 = [(Download *)self valueForProperty:@"is_redownload"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setIsPurchasedRedownload:", objc_msgSend(v36, "BOOLValue"));
  }
  v37 = [(Download *)self valueForProperty:@"is_restore"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setIsRestore:", objc_msgSend(v37, "BOOLValue"));
  }
  v38 = [(Download *)self valueForProperty:@"store_item_id"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = [v38 copy];
    [v3 setItemID:v39];
  }
  v40 = [(Download *)self valueForProperty:@"kind"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = [v40 copy];
    [v3 setKind:v41];
  }
  v42 = [(Download *)self valueForProperty:@"has_messages_extension"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setHasMessagesExtension:", objc_msgSend(v42, "BOOLValue"));
  }
  v43 = [(Download *)self valueForProperty:@"launch_prohibited"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setLaunchProhibited:", objc_msgSend(v43, "BOOLValue"));
  }
  v44 = [(Download *)self valueForProperty:@"messages_artwork_url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v45 = [v44 copy];
    [v3 setMessagesArtworkURL:v45];
  }
  v46 = [(Download *)self valueForProperty:@"order_key"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setExternalOrderKey:v46];
  }
  v47 = [(Download *)self valueForProperty:@"store_purchase_date"];

  if (objc_opt_respondsToSelector())
  {
    [v47 doubleValue];
    v48 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v3 setPurchaseDate:v48];
  }
  v49 = [(Download *)self valueForProperty:@"rating_label"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v50 = [v49 copy];
    [v3 setRatingLabel:v50];
  }
  v51 = [(Download *)self valueForProperty:@"rating_rank"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v52 = [v51 copy];
    [v3 setRatingRank:v52];
  }
  v53 = [(Download *)self valueForProperty:@"release_date"];

  if (objc_opt_respondsToSelector())
  {
    [v53 doubleValue];
    v54 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v3 setReleaseDate:v54];
  }
  v55 = [(Download *)self valueForProperty:@"store_account_id"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v56 = [v55 copy];
    [v3 setStoreAccountID:v56];
  }
  v57 = [(Download *)self valueForProperty:@"store_account_name"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v58 = [v57 copy];
    [v3 setStoreAccountName:v58];
  }
  v59 = [(Download *)self valueForProperty:@"store_front_id"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v60 = [v59 copy];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_74;
    }
    id v60 = [v59 stringValue];
  }
  v61 = v60;
  [v3 setStorefront:v60];

LABEL_74:
  v62 = [(Download *)self valueForProperty:@"store_download_key"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v63 = [v62 copy];
    [v3 setStoreDownloadKey:v63];
  }
  v64 = [(Download *)self valueForProperty:@"store_transaction_id"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v65 = [v64 copy];
    [v3 setStoreTransactionID:v65];
  }
  v66 = [(Download *)self valueForProperty:@"artwork_is_prerendered"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setSoftwareIconNeedsShine:", objc_msgSend(v66, "BOOLValue"));
  }
  v67 = [(Download *)self valueForProperty:@"store_software_version_id"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v68 = [v67 copy];
    [v3 setSoftwareVersionExternalIdentifier:v68];
  }
  v69 = [(Download *)self valueForProperty:@"store_cohort"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v70 = [v69 copy];
    [v3 setStoreCohort:v70];
  }
  v71 = [(Download *)self valueForProperty:@"thumbnail_url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v72 = [v71 copy];
    [v3 setThumbnailURL:v72];
  }
  v73 = [(Download *)self valueForProperty:@"title"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v74 = [v73 copy];
    [v3 setTitle:v74];
  }
  v75 = [(Download *)self valueForProperty:@"variant_id"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v76 = [v75 copy];
    [v3 setVariantID:v76];
  }
  v77 = [(Download *)self assets];
  id v78 = [(Download *)self _newAssetArrayWithDownloadAssets:v77];

  [v3 setAssets:v78];
  id v79 = v3;

  return v79;
}

- (id)_newAssetArrayWithDownloadAssets:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "copyJobAsset", (void)v13);
        [v4 addObject:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];
  return v11;
}

- (Download)initWithClientXPCDownload:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)Download;
  v4 = [(Download *)&v28 init];
  if (v4)
  {
    int64_t int64 = xpc_dictionary_get_int64(a3, "0");
    [(Download *)v4 setDatabaseID:int64];
    objc_opt_class();
    uint64_t v6 = SSXPCDictionaryCopyCFObjectWithClass();
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = +[DownloadEntity copyDatabaseDictionaryToSetClientDictionary:v6];
      id v9 = +[NSNumber numberWithLongLong:int64];
      [v8 setObject:v9 forKey:SSSQLEntityPropertyPersistentID];
      [(Download *)v4 setValuesWithDictionary:v8];
    }
    objc_opt_class();
    uint64_t v10 = SSXPCDictionaryCopyCFObjectWithClass();
    if (v10)
    {
      id v11 = (void *)v10;
      [(Download *)v4 setExternalValuesWithDictionary:v10];
    }
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    xpc_object_t value = xpc_dictionary_get_value(a3, "2");
    long long v13 = value;
    if (value)
    {
      if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_dictionary)
      {
        id v14 = objc_alloc_init((Class)NSMutableArray);
        uint64_t v20 = 0;
        id v21 = &v20;
        uint64_t v22 = 0x2020000000;
        uint64_t v23 = 0;
        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472;
        applier[2] = sub_100128A38;
        applier[3] = &unk_1003A7220;
        applier[5] = &v20;
        applier[6] = &v24;
        applier[4] = v14;
        xpc_dictionary_apply(v13, applier);
        id v15 = [v14 count];
        LOBYTE(v13) = v15 == (id)v21[3];
        [(Download *)v4 setAssets:v14];

        _Block_object_dispose(&v20, 8);
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    if ([(Download *)v4 valueForExternalProperty:SSDownloadExternalPropertyPolicy]) {
      char v16 = 1;
    }
    else {
      char v16 = (char)v13;
    }
    if ((v16 & 1) == 0)
    {
      v4->_downloadPolicy = (SSDownloadPolicy *)objc_msgSend(objc_alloc((Class)SSDownloadPolicy), "initWithDownloadKind:URLBagType:", -[Download valueForProperty:](v4, "valueForProperty:", @"kind"), 2 * *((unsigned __int8 *)v25 + 24));
      if (objc_msgSend(-[Download valueForProperty:](v4, "valueForProperty:", @"is_automatic"), "integerValue") == (id)2)
      {
        id v17 = objc_alloc_init((Class)SSDownloadPolicyRule);
        [v17 addNetworkType:1000];
        [(SSDownloadPolicy *)v4->_downloadPolicy unionPolicyRule:v17];
      }
    }
    _Block_object_dispose(&v24, 8);
  }
  return v4;
}

- (Download)initWithExternalManifestDictionary:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)Download;
  v4 = [(Download *)&v13 init];
  if (v4)
  {
    v12 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_15;
    }
    id v5 = [a3 objectForKey:@"metadata"];
    id v6 = [a3 objectForKey:@"assets"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(Download *)v4 _setDatabasePropertiesWithExternalMetadata:v5 error:&v12]&& [(Download *)v4 _setAssetsWithExternalAssets:v6 error:&v12])
    {
      unsigned int v7 = [(Download *)v4 _setThumbnailImageWithExternalAssets:v6 error:&v12];
    }
    else
    {
      unsigned int v7 = 0;
    }
    id v8 = [a3 objectForKey:@"thinned-assets"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v7) {
      unsigned int v7 = [(Download *)v4 _setAssetsWithExternalThinnedAssets:v8 error:&v12];
    }
    if (v7)
    {
      v4->_downloadPolicy = (SSDownloadPolicy *)objc_msgSend(objc_alloc((Class)SSDownloadPolicy), "initWithDownloadKind:URLBagType:", -[Download valueForProperty:](v4, "valueForProperty:", @"kind"), 2);
      [(Download *)v4 setValue:&__kCFBooleanTrue forProperty:@"download_state.can_cancel"];
      return v4;
    }
    if (!v12) {
LABEL_15:
    }
      v12 = +[NSError errorWithDomain:SSErrorDomain code:200 userInfo:0];
    uint64_t ArchivableData = SSCodingCreateArchivableData();
    if (ArchivableData)
    {
      uint64_t v10 = (void *)ArchivableData;
      [(Download *)v4 setValue:ArchivableData forProperty:@"download_state.download_error"];
    }
  }
  return v4;
}

- (Download)initWithStoreDownload:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)Download;
  v4 = [(Download *)&v21 init];
  if (!v4) {
    return v4;
  }
  id v5 = +[DownloadEntity copyValueDictionaryWithMetadata:a3];
  unsigned int v6 = objc_msgSend(objc_msgSend(v5, "objectForKey:", @"is_automatic"), "BOOLValue");
  if (v6)
  {
    if (![v5 objectForKey:@"cancel_if_duplicate"]) {
      objc_msgSend(v5, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"cancel_if_duplicate");
    }
    if (![v5 objectForKey:@"suppress_error_dialogs"]) {
      objc_msgSend(v5, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"suppress_error_dialogs");
    }
    if (![v5 objectForKey:@"priority"]) {
      objc_msgSend(v5, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -1), @"priority");
    }
  }
  [a3 kind];
  if (SSDownloadKindIsSoftwareKind())
  {
    id v7 = [a3 contentRating];
    if ([v7 ratingLabel]) {
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v7, "ratingLabel"), @"rating_label");
    }
    if ([v7 rank]) {
      objc_msgSend(v5, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "rank")), @"rating_rank");
    }
    if ([a3 is32BitOnly]) {
      [(Download *)v4 setValue:&__kCFBooleanTrue forProperty:@"is32BitOnly"];
    }
  }
  [(Download *)v4 setValuesWithDictionary:v5];

  -[Download setAssets:](v4, "setAssets:", [a3 assets]);
  id v8 = [a3 valueForMetadataKey:SSDownloadMetadataKeyNetworkConstraints];
  id v9 = [(Download *)v4 valueForProperty:@"kind"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = objc_alloc_init((Class)SSNetworkConstraints);
    [v10 setSizeLimitsWithStoreConstraintDictionary:v8];
    v4->_downloadPolicy = (SSDownloadPolicy *)[objc_alloc((Class)SSDownloadPolicy) initWithNetworkConstraints:v10];

    downloadPolicy = v4->_downloadPolicy;
  }
  else
  {
    downloadPolicy = (SSDownloadPolicy *)[objc_alloc((Class)SSDownloadPolicy) initWithDownloadKind:v9 URLBagType:0];
    v4->_downloadPolicy = downloadPolicy;
  }
  id v12 = objc_msgSend(-[SSDownloadPolicy policyRules](downloadPolicy, "policyRules"), "mutableCopy");
  if (!v12) {
    id v12 = objc_alloc_init((Class)NSMutableArray);
  }
  id v13 = [a3 valueForMetadataKey:SSDownloadMetadataKeyRequiresPluggedIn];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!v6) {
      goto LABEL_37;
    }
LABEL_28:
    id v15 = objc_alloc_init((Class)SSDownloadPolicyRule);
    [v15 setCellularDataStates:2];
    [v15 setPowerStates:2];
    [v12 addObject:v15];

    goto LABEL_29;
  }
  if (![v13 BOOLValue])
  {
    if ((v6 & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_28;
  }
  id v14 = objc_alloc_init((Class)SSDownloadPolicyRule);
  [v14 setDownloadSizeLimit:SSDownloadSizeLimitDisabled];
  [v14 setPowerStates:1];
  [v12 addObject:v14];

  if ((v6 & 1) == 0) {
    goto LABEL_37;
  }
LABEL_29:
  id v16 = objc_alloc_init((Class)SSDownloadPolicyRule);
  [v16 setCellularDataStates:2];
  [v12 addObject:v16];

  if (![(Download *)v4 valueForProperty:@"client_id"])
  {
    if (SSDownloadKindIsSoftwareKind())
    {
      CFStringRef v17 = @"com.apple.AppStore";
LABEL_36:
      [(Download *)v4 setValue:v17 forProperty:@"client_id"];
      goto LABEL_37;
    }
    if (SSDownloadKindIsEBookKind())
    {
      CFStringRef v17 = @"com.apple.iBooks";
      goto LABEL_36;
    }
    if (SSDownloadKindIsMediaKind())
    {
      CFStringRef v17 = @"com.apple.MobileStore";
      goto LABEL_36;
    }
  }
LABEL_37:
  id v18 = [v12 count];
  v19 = v4->_downloadPolicy;
  if (v18)
  {
    [(SSDownloadPolicy *)v19 setPolicyRules:v12];
  }
  else if (![(SSDownloadPolicy *)v19 downloadKind])
  {

    v4->_downloadPolicy = 0;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)Download;
  [(Download *)&v3 dealloc];
}

- (id)anyAssetForAssetType:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  assets = self->_assets;
  id result = [(NSArray *)assets countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(assets);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_msgSend(objc_msgSend(v9, "valueForProperty:", @"asset_type"), "isEqualToString:", a3))return v9; {
        id v8 = (char *)v8 + 1;
        }
      }
      while (v6 != v8);
      id result = [(NSArray *)assets countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)assetForAssetIdentifier:(int64_t)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  assets = self->_assets;
  id result = [(NSArray *)assets countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(assets);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if ([v9 databaseID] == (id)a3) {
          return v9;
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = [(NSArray *)assets countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)copyStoreDownloadMetadata
{
  id v2 = objc_msgSend(+[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:](ScratchManager, "directoryPathForDownloadID:kind:createIfNeeded:", -[Download databaseID](self, "databaseID"), -[Download valueForProperty:](self, "valueForProperty:", @"kind"), 0), "stringByAppendingPathComponent:", @"iTunesMetadata.plist");
  objc_super v3 = [StoreDownload alloc];

  return [(StoreDownload *)v3 initWithContentsOfFile:v2];
}

- (id)copyInMemoryStoreDownloadMetadata
{
  objc_super v3 = [StoreDownload alloc];
  id v4 = [(Download *)self propertyValues];

  return [(StoreDownload *)v3 initWithDictionary:v4];
}

- (void)removeAssetsWithAssetType:(id)a3
{
  id v7 = [(NSArray *)self->_assets mutableCopy];
  uint64_t v5 = (uint64_t)[v7 count];
  if (v5 >= 1)
  {
    unint64_t v6 = v5 + 1;
    do
    {
      if (objc_msgSend(objc_msgSend(objc_msgSend(v7, "objectAtIndex:", v6 - 2), "valueForProperty:", @"asset_type"), "isEqualToString:", a3))objc_msgSend(v7, "removeObjectAtIndex:", v6 - 2); {
      --v6;
      }
    }
    while (v6 > 1);
  }
  [(Download *)self setAssets:v7];
}

- (void)unionNetworkConstraints:(id)a3
{
  if (!self->_downloadPolicy) {
    self->_downloadPolicy = (SSDownloadPolicy *)objc_alloc_init((Class)SSDownloadPolicy);
  }
  SSNetworkTypeApplyBlock();
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

- (id)_copyValidAssetsWithExternalAssets:(id)a3 validateVariants:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v12 = [[DownloadAsset alloc] initWithExternalManifestDictionary:v11 validateVariants:v4];
          if (v12)
          {
            long long v13 = v12;
            [v6 addObject:v12];
          }
        }
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  return v6;
}

- (BOOL)_setAssetsWithExternalAssets:(id)a3 error:(id *)a4
{
  id v6 = [(Download *)self _copyValidAssetsWithExternalAssets:a3 validateVariants:0];
  id v7 = [v6 count];
  if (v7)
  {
    [(Download *)self setAssets:v6];
  }
  else if (a4)
  {
    *a4 = +[NSError errorWithDomain:SSErrorDomain code:401 userInfo:0];
  }

  return v7 != 0;
}

- (BOOL)_setAssetsWithExternalThinnedAssets:(id)a3 error:(id *)a4
{
  id v5 = [(Download *)self _copyValidAssetsWithExternalAssets:a3 validateVariants:1];
  if ([v5 count])
  {
    id v6 = +[SSDevice currentDevice];
    id v20 = [v6 productType];
    id v21 = [v6 compatibleProductType];
    v19 = self;
    objc_msgSend(v5, "addObjectsFromArray:", -[Download assets](self, "assets"));
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      id obj = v5;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v13 = [v12 valueForProperty:@"asset_type"];
          id v14 = [v7 objectForKey:v13];
          if (v14)
          {
            id v15 = [v14 valueForProperty:@"variant_id"];
            id v16 = [v12 valueForProperty:@"variant_id"];
            if (!v16) {
              continue;
            }
            if (v15)
            {
              long long v17 = v16;
              if (![v15 isEqualToString:v21]
                || ![v17 isEqualToString:v20])
              {
                continue;
              }
            }
          }
          [v7 setObject:v12 forKey:v13];
        }
        id v5 = obj;
        id v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }
    -[Download setAssets:](v19, "setAssets:", [v7 allValues]);
  }
  return 1;
}

- (BOOL)_setDatabasePropertiesWithExternalMetadata:(id)a3 error:(id *)a4
{
  id v7 = [a3 objectForKey:@"kind"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"software"])
  {
    uint64_t v8 = SSDownloadKindSoftwareApplication;
LABEL_7:
    [(Download *)self setValue:v8 forProperty:@"kind"];
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"vpn-plugin"])
  {
    uint64_t v8 = SSDownloadKindVPNPlugin;
    goto LABEL_7;
  }
LABEL_8:
  id v9 = [(Download *)self valueForProperty:@"kind"];
  if (v9)
  {
    id v10 = [a3 objectForKey:@"bundle-identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(Download *)self setValue:v10 forProperty:@"bundle_id"];
    }
    id v11 = [a3 objectForKey:@"bundle-version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(Download *)self setValue:v11 forProperty:@"bundle_version"];
    }
    id v12 = [a3 objectForKey:@"has-messages-extension"];
    if (objc_opt_respondsToSelector()) {
      [(Download *)self setValue:v12 forProperty:@"has_messages_extension"];
    }
    id v13 = [a3 objectForKey:@"launch-prohibited"];
    if (objc_opt_respondsToSelector()) {
      [(Download *)self setValue:v13 forProperty:@"launch_prohibited"];
    }
    id v14 = [a3 objectForKey:@"subtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(Download *)self setValue:v14 forProperty:@"artist_name"];
    }
    id v15 = [a3 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(Download *)self setValue:v15 forProperty:@"title"];
    }
    id v16 = [a3 objectForKey:@"UINewsstandApp"];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v16 BOOLValue]) {
      [(Download *)self setValue:SSDownloadSoftwareTypeNewsstand forProperty:@"software_type"];
    }
    id v9 = [(Download *)self valueForProperty:@"title"];
    if (v9)
    {
      id v17 = [(Download *)self valueForProperty:@"kind"];
      if (![v17 isEqualToString:SSDownloadKindSoftwareApplication])
      {
        LOBYTE(v9) = 1;
        return (char)v9;
      }
      LOBYTE(v9) = [(Download *)self valueForProperty:@"bundle_id"] != 0;
    }
  }
  if (a4 && (v9 & 1) == 0)
  {
    long long v18 = +[NSError errorWithDomain:SSErrorDomain code:402 userInfo:0];
    LOBYTE(v9) = 0;
    *a4 = v18;
  }
  return (char)v9;
}

- (BOOL)_setThumbnailImageWithExternalAssets:(id)a3 error:(id *)a4
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    CFStringRef v8 = @"display-image";
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(a3);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v10 objectForKey:@"kind"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v11 isEqualToString:v8])
            {
              CFStringRef v12 = v8;
              id v13 = [v10 objectForKey:@"url"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v14 = [objc_alloc((Class)NSURL) initWithString:v13];
                if ([v14 host]) {
                  [(Download *)self setValue:v13 forProperty:@"thumbnail_url"];
                }
              }
              id v15 = [v10 objectForKey:@"needs-shine"];
              if (objc_opt_respondsToSelector()) {
                -[Download setValue:forProperty:](self, "setValue:forProperty:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v15 BOOLValue] ^ 1), @"artwork_is_prerendered");
              }
              id v16 = [v10 objectForKey:@"UINewsstandBindingEdge"];
              objc_opt_class();
              CFStringRef v8 = v12;
              if (objc_opt_isKindOfClass()) {
                [(Download *)self setValue:v16 forProperty:@"thumbnail_newsstand_binding_edge"];
              }
              id v17 = [v10 objectForKey:@"UINewsstandBindingType"];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [(Download *)self setValue:v17 forProperty:@"thumbnail_newsstand_binding_type"];
              }
            }
            else if ([v11 isEqualToString:@"messages-display-image"])
            {
              id v18 = [v10 objectForKey:@"url"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v19 = [objc_alloc((Class)NSURL) initWithString:v18];
                if ([v19 host]) {
                  [(Download *)self setValue:v18 forProperty:@"messages_artwork_url"];
                }
              }
            }
          }
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)Download;
  id v5 = -[Download copyWithZone:](&v7, "copyWithZone:");
  v5[1] = [(NSArray *)self->_assets copyWithZone:a3];
  v5[2] = [(SSDownloadPolicy *)self->_downloadPolicy copyWithZone:a3];
  return v5;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (SSDownloadPolicy)downloadPolicy
{
  return self->_downloadPolicy;
}

- (void)setDownloadPolicy:(id)a3
{
}

- (Download)initWithMicroPaymentDownload:(id)a3 clientID:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)Download;
  id v6 = [(Download *)&v18 init];
  if (v6)
  {
    id v7 = [a3 downloadID];
    -[Download setDatabaseID:](v6, "setDatabaseID:", [v7 longLongValue]);
    [(Download *)v6 setValue:a4 forProperty:@"client_id"];
    [(Download *)v6 setValue:v7 forProperty:SSSQLEntityPropertyPersistentID];
    [(Download *)v6 setValue:+[NSNumber numberWithBool:1] forProperty:@"suppress_error_dialogs"];
    [(Download *)v6 setValue:+[NSNumber numberWithBool:1] forProperty:@"is_from_store"];
    [(Download *)v6 setValue:SSDownloadKindInAppContent forProperty:@"kind"];
    -[Download setValue:forProperty:](v6, "setValue:forProperty:", [a3 downloadKey], @"store_download_key");
    id v8 = objc_alloc((Class)SSDownloadPolicy);
    id v9 = [v8 initWithDownloadKind:SSDownloadKindSoftwareApplication URLBagType:0];
    [(Download *)v6 setDownloadPolicy:v9];

    id v10 = objc_alloc_init(DownloadAsset);
    -[DownloadAsset setValue:forProperty:](v10, "setValue:forProperty:", [a3 hashArrayData], @"hash_array");
    [(DownloadAsset *)v10 setValue:SSDownloadAssetTypeMedia forProperty:@"asset_type"];
    -[DownloadAsset setValue:forProperty:](v10, "setValue:forProperty:", [a3 remoteURL], @"url");
    id v11 = [a3 sinfs];
    if (v11)
    {
      id v12 = v11;
      id v13 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [[DownloadDRM alloc] initWithSinfArray:v13];
        if ([(DownloadDRM *)v14 isDRMFree]) {
          [(DownloadAsset *)v10 setValue:+[NSNumber numberWithBool:1] forProperty:@"is_drm_free"];
        }
      }
      [(DownloadAsset *)v10 setValue:v12 forProperty:@"sinfs_data"];
    }
    id v15 = [a3 contentLength];
    if ((uint64_t)[v15 longLongValue] >= 1) {
      [(DownloadAsset *)v10 setValue:v15 forProperty:@"bytes_total"];
    }
    id v16 = [a3 hashChunkSize];
    if ((uint64_t)[v16 longLongValue] >= 1) {
      [(DownloadAsset *)v10 setValue:v16 forProperty:@"bytes_to_hash"];
    }
    [(Download *)v6 setAssets:+[NSArray arrayWithObject:v10]];
  }
  return v6;
}

@end