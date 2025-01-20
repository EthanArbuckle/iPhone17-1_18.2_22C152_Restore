@interface BKUbiquityMetadataHelper
+ (id)sharedInstance;
- (BOOL)setUbiquityMetadataForURL:(id)a3 withLibraryAsset:(id)a4;
- (NSString)assetID;
- (id)ubiquityMetadataForURL:(id)a3 options:(unint64_t)a4;
- (void)_removeExtendedAttributeNamed:(id)a3 forUrl:(id)a4;
- (void)_setThumbnailInMutableDictionary:(id)a3 forKey:(id)a4 fromUrl:(id)a5;
- (void)_setValueInMutableDictionary:(id)a3 forKey:(id)a4 withValueForExtendedAttributeNamed:(id)a5 fromUrl:(id)a6;
- (void)setAssetID:(id)a3;
- (void)setUbiquityMetadataIsSupplemental:(BOOL)a3 playlistID:(id)a4 storeID:(id)a5 forURL:(id)a6;
- (void)setUbiquityMetadataTitle:(id)a3 forURL:(id)a4;
@end

@implementation BKUbiquityMetadataHelper

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100193824;
  block[3] = &unk_100A43EF8;
  block[4] = a1;
  if (qword_100B4A570 != -1) {
    dispatch_once(&qword_100B4A570, block);
  }
  v2 = (void *)qword_100B4A568;

  return v2;
}

- (id)ubiquityMetadataForURL:(id)a3 options:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  uint64_t v9 = _CFURLPromiseCopyPhysicalURL();
  v10 = (void *)v9;
  if (v9) {
    v11 = (void *)v9;
  }
  else {
    v11 = v6;
  }
  id v12 = v11;

  if (v4)
  {
    [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrAssetID withValueForExtendedAttributeNamed:BCMetadataXattrAssetID fromUrl:v12];
    if ((v4 & 2) == 0)
    {
LABEL_6:
      if ((v4 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_29;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_6;
  }
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrTitle withValueForExtendedAttributeNamed:BCMetadataXattrTitle fromUrl:v12];
  if ((v4 & 4) == 0)
  {
LABEL_7:
    if ((v4 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrSortTitle withValueForExtendedAttributeNamed:BCMetadataXattrSortTitle fromUrl:v12];
  if ((v4 & 8) == 0)
  {
LABEL_8:
    if ((v4 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrAuthor withValueForExtendedAttributeNamed:BCMetadataXattrAuthor fromUrl:v12];
  if ((v4 & 0x10) == 0)
  {
LABEL_9:
    if ((v4 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrSortAuthor withValueForExtendedAttributeNamed:BCMetadataXattrSortAuthor fromUrl:v12];
  if ((v4 & 0x20) == 0)
  {
LABEL_10:
    if ((v4 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrGenre withValueForExtendedAttributeNamed:BCMetadataXattrGenre fromUrl:v12];
  if ((v4 & 0x40) == 0)
  {
LABEL_11:
    if ((v4 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrComments withValueForExtendedAttributeNamed:BCMetadataXattrComments fromUrl:v12];
  if ((v4 & 0x80) == 0)
  {
LABEL_12:
    if ((v4 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrBookDescription withValueForExtendedAttributeNamed:BCMetadataXattrBookDescription fromUrl:v12];
  if ((v4 & 0x100) == 0)
  {
LABEL_13:
    if ((v4 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrYear withValueForExtendedAttributeNamed:BCMetadataXattrYear fromUrl:v12];
  if ((v4 & 0x200) == 0)
  {
LABEL_14:
    if ((v4 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrExplicit withValueForExtendedAttributeNamed:BCMetadataXattrExplicit fromUrl:v12];
  if ((v4 & 0x400) == 0)
  {
LABEL_15:
    if ((v4 & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrLastOpened withValueForExtendedAttributeNamed:BCMetadataXattrLastOpened fromUrl:v12];
  if ((v4 & 0x800) == 0)
  {
LABEL_16:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrFirstOpened withValueForExtendedAttributeNamed:BCMetadataXattrFirstOpened fromUrl:v12];
  if ((v4 & 0x2000) == 0)
  {
LABEL_17:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrRating withValueForExtendedAttributeNamed:BCMetadataXattrRating fromUrl:v12];
  if ((v4 & 0x10000) == 0)
  {
LABEL_18:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrGeneration withValueForExtendedAttributeNamed:BCMetadataXattrGeneration fromUrl:v12];
  if ((v4 & 0x40000) == 0)
  {
LABEL_19:
    if ((v4 & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  [(BKUbiquityMetadataHelper *)self _setThumbnailInMutableDictionary:v7 forKey:BCMetadataXattrThumbnail fromUrl:v12];
  if ((v4 & 0x80000) == 0)
  {
LABEL_20:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrIsSupplementalContent withValueForExtendedAttributeNamed:BCMetadataXattrIsSupplementalContent fromUrl:v12];
  if ((v4 & 0x100000) == 0)
  {
LABEL_21:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_43:
  [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrStoreID withValueForExtendedAttributeNamed:BCMetadataXattrStoreID fromUrl:v12];
  if ((v4 & 0x200000) != 0) {
LABEL_22:
  }
    [(BKUbiquityMetadataHelper *)self _setValueInMutableDictionary:v7 forKey:BCMetadataXattrStorePlaylistID withValueForExtendedAttributeNamed:BCMetadataXattrStorePlaylistID fromUrl:v12];
LABEL_23:

  if ([v7 count]) {
    v13 = v7;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (void)_setValueInMutableDictionary:(id)a3 forKey:(id)a4 withValueForExtendedAttributeNamed:(id)a5 fromUrl:(id)a6
{
  id v11 = a3;
  id v9 = a4;
  v10 = [a6 bu_extendedAttributeNamed:a5 iCloudSyncable:1];
  if (v10) {
    [v11 setObject:v10 forKey:v9];
  }
}

- (void)_setThumbnailInMutableDictionary:(id)a3 forKey:(id)a4 fromUrl:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)QLThumbnailGenerationRequest) initWithFileAtURL:v9 size:6 scale:1024.0 representationTypes:1024.0];
  id v11 = +[QLThumbnailGenerator sharedGenerator];
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100193E14;
  v19[3] = &unk_100A49508;
  id v13 = v9;
  id v20 = v13;
  id v21 = v7;
  id v22 = v8;
  id v14 = v12;
  v23 = v14;
  id v15 = v8;
  id v16 = v7;
  [v11 generateBestRepresentationForRequest:v10 completionHandler:v19];
  dispatch_time_t v17 = dispatch_time(0, 500000000);
  if (dispatch_semaphore_wait(v14, v17))
  {
    v18 = BCUbiquityMetadataHelperLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1007EDF08((uint64_t)v13, v18);
    }
  }
}

- (BOOL)setUbiquityMetadataForURL:(id)a3 withLibraryAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v7 = v5;
  id v8 = [v6 assetID];
  id v9 = [v6 title];
  id v10 = v7;
  if (!v7)
  {
    id v11 = [v6 path];
    if ([v11 length]) {
      id v10 = [objc_alloc((Class)NSURL) initFileURLWithPath:v11];
    }
    else {
      id v10 = 0;
    }
    dispatch_semaphore_t v12 = BCUbiquityMetadataHelperLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 141558274;
      uint64_t v28 = 1752392040;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[iCloudSync] Warning: setUbiquityMetadataForURL:withLibraryAsset: came without a URL.  Using the libraryAsset url: %{mask.hash}@", buf, 0x16u);
    }
  }
  if (v10 && v8 && v9)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10019424C;
    v17[3] = &unk_100A49558;
    id v21 = &v23;
    id v22 = 0;
    id v18 = v8;
    id v19 = v9;
    id v20 = v6;
    +[NSURL coordinateWritingItemAtURL:v10 options:16 error:&v22 byAccessor:v17];
    id v13 = v22;
    if (v13)
    {
      id v14 = BCUbiquityMetadataHelperLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1007EE00C();
      }
    }
  }
  else
  {
    id v13 = BCUbiquityMetadataHelperLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1007EE074(v13);
    }
  }

  BOOL v15 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);

  return v15;
}

- (void)setUbiquityMetadataTitle:(id)a3 forURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = BCUbiquityMetadataHelperLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[iCloudSync] setUbiquityMetadataTitle title:%@ url:%@", buf, 0x16u);
  }

  if (v6)
  {
    id v12 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100194800;
    v10[3] = &unk_100A49580;
    id v11 = v5;
    +[NSURL coordinateWritingItemAtURL:v6 options:16 error:&v12 byAccessor:v10];
    id v8 = v12;
    if (v8)
    {
      id v9 = BCUbiquityMetadataHelperLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1007EE00C();
      }
    }
  }
  else
  {
    id v8 = BCUbiquityMetadataHelperLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1007EE074(v8);
    }
  }
}

- (void)setUbiquityMetadataIsSupplemental:(BOOL)a3 playlistID:(id)a4 storeID:(id)a5 forURL:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v11)
  {
    id v18 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100194AD0;
    v14[3] = &unk_100A495A8;
    BOOL v17 = a3;
    id v15 = v9;
    id v16 = v10;
    +[NSURL coordinateWritingItemAtURL:v11 options:16 error:&v18 byAccessor:v14];
    id v12 = v18;
    if (v12)
    {
      id v13 = BCUbiquityMetadataHelperLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558530;
        uint64_t v20 = 1752392040;
        __int16 v21 = 2112;
        id v22 = v11;
        __int16 v23 = 2112;
        v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[iCloudSync] Error coordinateWritingItemAtURL:, URL: %{mask.hash}@, Error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v12 = BCUbiquityMetadataHelperLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[iCloudSync] Unable to write metadata because asset had no url was provided", buf, 2u);
    }
  }
}

- (void)_removeExtendedAttributeNamed:(id)a3 forUrl:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((objc_msgSend(v6, "bu_removeExtendedAttributeNamed:iCloudSyncable:", v5, 1) & 1) == 0)
  {
    id v7 = BCUbiquityMetadataHelperLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1007EE0B8((uint64_t)v5, (uint64_t)v6, v7);
    }
  }
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end