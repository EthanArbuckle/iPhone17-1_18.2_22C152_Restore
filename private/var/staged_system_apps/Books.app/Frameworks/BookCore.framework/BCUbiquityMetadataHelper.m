@interface BCUbiquityMetadataHelper
+ (BOOL)replaceFileAndUpdateMetadata:(id)a3 metadata:(id)a4 error:(id *)a5 fileWritingBlock:(id)a6;
+ (BOOL)setExtendedAttributeNamed:(id)a3 toValue:(id)a4 forUrl:(id)a5;
+ (id)_ubiquityCoordinatedReadMetadataForURL:(id)a3 options:(unint64_t)a4;
+ (id)_ubiquityMetadataForURL:(id)a3 options:(unint64_t)a4;
+ (id)dateFormatter;
+ (id)metadataDateFromString:(id)a3;
+ (id)ubiquityMetadataForURL:(id)a3 options:(unint64_t)a4 needsCoordination:(BOOL)a5;
+ (id)xattrAssetIDForURL:(id)a3;
+ (unint64_t)_generationForURL:(id)a3;
+ (void)_setThumbnailInMutableDictionary:(id)a3 forKey:(id)a4 fromUrl:(id)a5;
+ (void)setValueInMutableDictionary:(id)a3 forKey:(id)a4 withValueForExtendedAttributeNamed:(id)a5 fromUrl:(id)a6;
@end

@implementation BCUbiquityMetadataHelper

+ (id)xattrAssetIDForURL:(id)a3
{
  if (a3)
  {
    v3 = [a1 ubiquityMetadataForURL:a3 options:1 needsCoordination:1];
    if ([v3 count])
    {
      objc_opt_class();
      v4 = [v3 objectForKeyedSubscript:@"com.apple.iBooks.assetID"];
      v5 = BUDynamicCast();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)ubiquityMetadataForURL:(id)a3 options:(unint64_t)a4 needsCoordination:(BOOL)a5
{
  if (a5) {
    [a1 _ubiquityCoordinatedReadMetadataForURL:a3 options:a4];
  }
  else {
  v5 = [a1 _ubiquityMetadataForURL:a3 options:a4];
  }

  return v5;
}

+ (id)_ubiquityCoordinatedReadMetadataForURL:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1514FC;
  v16 = sub_15150C;
  id v17 = 0;
  v10[6] = a4;
  id v11 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_151514;
  v10[3] = &unk_2CA178;
  v10[4] = &v12;
  v10[5] = a1;
  +[NSURL coordinateReadingItemAtURL:v6 options:4 error:&v11 byAccessor:v10];
  id v7 = v11;
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

+ (id)_ubiquityMetadataForURL:(id)a3 options:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  if (v4)
  {
    [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.assetID" withValueForExtendedAttributeNamed:@"com.apple.iBooks.assetID" fromUrl:v6];
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.title" withValueForExtendedAttributeNamed:@"com.apple.iBooks.title" fromUrl:v6];
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.sortTitle" withValueForExtendedAttributeNamed:@"com.apple.iBooks.sortTitle" fromUrl:v6];
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.author" withValueForExtendedAttributeNamed:@"com.apple.iBooks.author" fromUrl:v6];
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.sortAuthor" withValueForExtendedAttributeNamed:@"com.apple.iBooks.sortAuthor" fromUrl:v6];
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.genre" withValueForExtendedAttributeNamed:@"com.apple.iBooks.genre" fromUrl:v6];
  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.comments" withValueForExtendedAttributeNamed:@"com.apple.iBooks.comments" fromUrl:v6];
  if ((v4 & 0x80) == 0)
  {
LABEL_9:
    if ((v4 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.bookDescription" withValueForExtendedAttributeNamed:@"com.apple.iBooks.bookDescription" fromUrl:v6];
  if ((v4 & 0x100) == 0)
  {
LABEL_10:
    if ((v4 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.year" withValueForExtendedAttributeNamed:@"com.apple.iBooks.year" fromUrl:v6];
  if ((v4 & 0x200) == 0)
  {
LABEL_11:
    if ((v4 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.explicit" withValueForExtendedAttributeNamed:@"com.apple.iBooks.explicit" fromUrl:v6];
  if ((v4 & 0x400) == 0)
  {
LABEL_12:
    if ((v4 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.lastOpened" withValueForExtendedAttributeNamed:@"com.apple.iBooks.lastOpened" fromUrl:v6];
  if ((v4 & 0x800) == 0)
  {
LABEL_13:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.firstOpened" withValueForExtendedAttributeNamed:@"com.apple.iBooks.firstOpened" fromUrl:v6];
  if ((v4 & 0x2000) == 0)
  {
LABEL_14:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.rating" withValueForExtendedAttributeNamed:@"com.apple.iBooks.rating" fromUrl:v6];
  if ((v4 & 0x4000) == 0)
  {
LABEL_15:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.readingLocation" withValueForExtendedAttributeNamed:@"com.apple.iBooks.readingLocation" fromUrl:v6];
  if ((v4 & 0x8000) == 0)
  {
LABEL_16:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.highWaterMark" withValueForExtendedAttributeNamed:@"com.apple.iBooks.highWaterMark" fromUrl:v6];
  if ((v4 & 0x10000) == 0)
  {
LABEL_17:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.generation" withValueForExtendedAttributeNamed:@"com.apple.iBooks.generation" fromUrl:v6];
  if ((v4 & 0x20000) == 0)
  {
LABEL_18:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.optionFlags" withValueForExtendedAttributeNamed:@"com.apple.iBooks.optionFlags" fromUrl:v6];
  if ((v4 & 0x40000) == 0)
  {
LABEL_19:
    if ((v4 & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  [a1 _setThumbnailInMutableDictionary:v7 forKey:@"com.apple.iBooks.thumbnail" fromUrl:v6];
  if ((v4 & 0x80000) == 0)
  {
LABEL_20:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.isSupplementalContent" withValueForExtendedAttributeNamed:@"com.apple.iBooks.isSupplementalContent" fromUrl:v6];
  if ((v4 & 0x100000) == 0)
  {
LABEL_21:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_46:
  [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.storeID" withValueForExtendedAttributeNamed:@"com.apple.iBooks.storeID" fromUrl:v6];
  if ((v4 & 0x200000) != 0) {
LABEL_22:
  }
    [a1 setValueInMutableDictionary:v7 forKey:@"com.apple.iBooks.storePlaylistID" withValueForExtendedAttributeNamed:@"com.apple.iBooks.storePlaylistID" fromUrl:v6];
LABEL_23:
  if ([v7 count]) {
    v9 = v7;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  return v10;
}

+ (void)setValueInMutableDictionary:(id)a3 forKey:(id)a4 withValueForExtendedAttributeNamed:(id)a5 fromUrl:(id)a6
{
  id v11 = a3;
  id v9 = a4;
  id v10 = [a6 bu_extendedAttributeNamed:a5 iCloudSyncable:1];
  if (v10) {
    [v11 setObject:v10 forKey:v9];
  }
}

+ (BOOL)setExtendedAttributeNamed:(id)a3 toValue:(id)a4 forUrl:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 length])
  {
    unsigned __int8 v10 = [v9 bu_setExtendedAttributeNamed:v7 value:v8 iCloudSyncable:1];
    id v11 = BCUbiquityMetadataHelperLog();
    uint64_t v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v14 = 138544386;
        id v15 = v7;
        __int16 v16 = 2160;
        uint64_t v17 = 1752392040;
        __int16 v18 = 2112;
        id v19 = v8;
        __int16 v20 = 2160;
        uint64_t v21 = 1752392040;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_impl(&def_7D91C, v12, OS_LOG_TYPE_INFO, "Successfully set extended attribute: [%{public}@ | %{mask.hash}@] for URL %{mask.hash}@", (uint8_t *)&v14, 0x34u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138544386;
      id v15 = v7;
      __int16 v16 = 2160;
      uint64_t v17 = 1752392040;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2160;
      uint64_t v21 = 1752392040;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_error_impl(&def_7D91C, v12, OS_LOG_TYPE_ERROR, "Failed to set extended attribute: [%{public}@ | %{mask.hash}@]  for URL %{mask.hash}@", (uint8_t *)&v14, 0x34u);
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

+ (void)_setThumbnailInMutableDictionary:(id)a3 forKey:(id)a4 fromUrl:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)QLThumbnailGenerationRequest) initWithFileAtURL:v9 size:6 scale:1024.0 representationTypes:1024.0];
  id v11 = +[QLThumbnailGenerator sharedGenerator];
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_151D5C;
  v19[3] = &unk_2CA1A0;
  id v13 = v9;
  id v20 = v13;
  id v21 = v7;
  id v22 = v8;
  int v14 = v12;
  id v23 = v14;
  id v15 = v8;
  id v16 = v7;
  [v11 generateBestRepresentationForRequest:v10 completionHandler:v19];
  dispatch_time_t v17 = dispatch_time(0, 500000000);
  if (dispatch_semaphore_wait(v14, v17))
  {
    __int16 v18 = BCUbiquityMetadataHelperLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1EEF14((uint64_t)v13, v18);
    }
  }
}

+ (unint64_t)_generationForURL:(id)a3
{
  v3 = [a1 _ubiquityCoordinatedReadMetadataForURL:a3 options:0x10000];
  objc_opt_class();
  int v4 = [v3 objectForKeyedSubscript:@"com.apple.iBooks.generation"];
  v5 = BUDynamicCast();

  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if ([v5 length])
  {
    id v7 = [v5 longLongValue];
    if (v7) {
      unint64_t v6 = (unint64_t)v7;
    }
  }

  return v6;
}

+ (id)dateFormatter
{
  if (qword_3493B0 != -1) {
    dispatch_once(&qword_3493B0, &stru_2CA1C0);
  }
  v2 = (void *)qword_3493A8;

  return v2;
}

+ (id)metadataDateFromString:(id)a3
{
  id v4 = a3;
  v5 = [a1 dateFormatter];
  unint64_t v6 = [v5 dateFromString:v4];

  return v6;
}

+ (BOOL)replaceFileAndUpdateMetadata:(id)a3 metadata:(id)a4 error:(id *)a5 fileWritingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  if (v11) {
    id v13 = [v11 mutableCopy];
  }
  else {
    id v13 = (id)objc_opt_new();
  }
  int v14 = v13;
  id v15 = [a1 _generationForURL:v10];
  if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = (uint64_t)v15 + 1;
  }
  dispatch_time_t v17 = +[NSNumber numberWithLongLong:v16];
  __int16 v18 = [v17 stringValue];
  [v14 setObject:v18 forKeyedSubscript:@"com.apple.iBooks.generation"];

  v41[0] = @"BCUbiqityFileChangedKeyURL";
  v41[1] = @"BCUbiqityFileChangedKeyGeneration";
  v42[0] = v10;
  id v19 = +[NSNumber numberWithUnsignedLongLong:v16];
  v42[1] = v19;
  id v20 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];

  id v21 = +[NSNotificationCenter defaultCenter];
  [v21 postNotificationName:@"BCUbiqityFileGenerationDidChangeNotification" object:a1 userInfo:v20];

  id v22 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1523BC;
  v28[3] = &unk_2CA210;
  v32 = &v35;
  id v23 = v12;
  id v31 = v23;
  v33 = v39;
  id v24 = v14;
  id v29 = v24;
  id v34 = a1;
  id v25 = v10;
  id v30 = v25;
  [v22 coordinateWritingItemAtURL:v25 options:0 error:a5 byAccessor:v28];
  if (*((unsigned char *)v36 + 24))
  {
    v26 = BCUbiquityMetadataHelperLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1EF018();
    }
  }
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v39, 8);

  return a5 == 0;
}

@end