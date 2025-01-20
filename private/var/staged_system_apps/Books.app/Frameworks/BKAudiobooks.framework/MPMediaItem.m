@interface MPMediaItem
+ (BOOL)bk_isItemAudibleAudiobook:(id)a3;
+ (id)bk_audioBookAssetURLWithAlbumTitle:(id)a3 isCloudItem:(BOOL)a4;
+ (int)bk_audibleDRMGroupIDForItem:(id)a3;
- (BOOL)bk_isJaliscoAsset;
- (id)bk_assetID;
- (id)bk_assetURL;
- (id)bk_effectiveAuthor;
- (id)bk_effectiveTitle;
- (id)bk_localStoreBookAlbumForItem;
- (id)bk_storeDemoAssetURL;
- (id)bk_storeID;
- (id)bk_storePlaylistID;
- (id)bk_storeRedownloadParameters;
- (unint64_t)bk_albumTrackIndex;
- (void)bk_artworkImageWithCompletion:(id)a3;
@end

@implementation MPMediaItem

- (id)bk_assetURL
{
  v3 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyFilePath];
  if (![v3 length]) {
    goto LABEL_26;
  }
  v4 = BKAudiobooksLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [(MPMediaItem *)self bk_effectiveTitle];
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Using file path for %@.", buf, 0xCu);
  }
  v6 = +[NSURL fileURLWithPath:v3];
  if (!v6)
  {
LABEL_26:
    v7 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyStoreID];
    if (!v7) {
      goto LABEL_12;
    }
    v8 = v7;
    v9 = [v7 stringValue];
    v10 = +[NSString stringWithFormat:@"NBAssetOverride-%@", v9];

    v11 = +[NSUserDefaults standardUserDefaults];
    v12 = [v11 stringForKey:v10];

    if ([v12 length])
    {
      v13 = BKAudiobooksLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v8;
        __int16 v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Overriding the asset path for %@ to be %@.", buf, 0x16u);
      }

      v6 = +[NSURL URLWithString:v12];
    }
    else
    {
      v6 = 0;
    }

    if (!v6)
    {
LABEL_12:
      v14 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyHLSPlaylistURL];
      if (![v14 length])
      {

LABEL_18:
        v6 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyAssetURL];
        v17 = BKAudiobooksLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = [(MPMediaItem *)self bk_effectiveTitle];
          *(_DWORD *)buf = 138412290;
          v21 = v18;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "No path available for streaming or local playback. Using the assetURL for %@.", buf, 0xCu);
        }
        goto LABEL_21;
      }
      v15 = BKAudiobooksLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = [(MPMediaItem *)self bk_effectiveTitle];
        *(_DWORD *)buf = 138412290;
        v21 = v16;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Using HLS playlist for %@.", buf, 0xCu);
      }
      v6 = +[NSURL URLWithString:v14];

      if (!v6) {
        goto LABEL_18;
      }
    }
  }
LABEL_21:

  return v6;
}

- (id)bk_storeDemoAssetURL
{
  v3 = [(MPMediaItem *)self bk_storeID];
  if (!v3) {
    goto LABEL_10;
  }
  v4 = +[NSString stringWithFormat:@"/var/mobile/Media/Books/%@.m4b", v3];
  v5 = +[NSURL fileURLWithPath:v4];

  v6 = +[NSFileManager defaultManager];
  v7 = [v5 path];
  unsigned int v8 = [v6 fileExistsAtPath:v7];

  v9 = BKAudiobooksLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      v12 = [v5 path];
      *(_DWORD *)buf = 138412546;
      v15 = v3;
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Failed to override the asset path for %@ to be %@. File does not exist.", buf, 0x16u);
    }
    goto LABEL_10;
  }
  if (v10)
  {
    v11 = [v5 path];
    *(_DWORD *)buf = 138412546;
    v15 = v3;
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Overriding the asset path for %@ to be %@.", buf, 0x16u);
  }
  if (!v5)
  {
LABEL_10:
    v5 = [(MPMediaItem *)self bk_assetURL];
  }

  return v5;
}

+ (id)bk_audioBookAssetURLWithAlbumTitle:(id)a3 isCloudItem:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = qword_48F30;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&qword_48F30, &stru_3D290);
  }
  v7 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:qword_48F28];

  unsigned int v8 = +[NSNumber numberWithBool:v4];
  v9 = +[NSString stringWithFormat:@"audiobook://medialibrary?albumTitle=%@&isCloudItem=%@", v7, v8];

  BOOL v10 = +[NSURL URLWithString:v9];

  return v10;
}

- (id)bk_storeRedownloadParameters
{
  objc_opt_class();
  v3 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyStoreRedownloadParameters];
  BOOL v4 = BUDynamicCast();

  return v4;
}

- (BOOL)bk_isJaliscoAsset
{
  v2 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyPurchaseHistoryID];
  BOOL v3 = [v2 unsignedLongLongValue] != 0;

  return v3;
}

- (id)bk_storeID
{
  unsigned int v3 = [(MPMediaItem *)self bk_isJaliscoAsset];
  objc_opt_class();
  BOOL v4 = &MPMediaItemPropertyStoreID;
  if (!v3) {
    BOOL v4 = &MPMediaItemPropertyStorePlaylistID;
  }
  uint64_t v5 = [(MPMediaItem *)self valueForProperty:*v4];
  id v6 = BUDynamicCast();

  if ([v6 longLongValue]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (id)bk_storePlaylistID
{
  objc_opt_class();
  unsigned int v3 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyStorePlaylistID];
  BOOL v4 = BUDynamicCast();

  if ([v4 longLongValue]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)bk_assetID
{
  unsigned int v3 = [(MPMediaItem *)self bk_storeID];
  if (BUStoreIdFromObject())
  {
    BOOL v4 = [v3 stringValue];
    goto LABEL_9;
  }
  uint64_t v5 = [(MPMediaItem *)self albumTitle];
  if ([v5 length])
  {
    id v6 = [v5 dataUsingEncoding:4];
    v7 = [v6 bu_sha1];
    BOOL v4 = +[NSString stringWithFormat:@"sha1-%@", v7];
  }
  else
  {
    MPMediaEntityPersistentID v8 = [(MPMediaItem *)self persistentID];
    if (!v8)
    {
      BOOL v10 = BKAudiobooksLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_26690((uint64_t)self, v10);
      }

      BOOL v4 = 0;
      goto LABEL_8;
    }
    id v6 = +[NSNumber numberWithUnsignedLongLong:v8];
    BOOL v4 = +[NSString stringWithFormat:@"pid-%@", v6];
  }

LABEL_8:
LABEL_9:

  return v4;
}

- (id)bk_effectiveTitle
{
  unsigned int v3 = [(MPMediaItem *)self albumTitle];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [(MPMediaItem *)self title];
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)bk_effectiveAuthor
{
  unsigned int v3 = [(MPMediaItem *)self albumArtist];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [(MPMediaItem *)self artist];
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)bk_artworkImageWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPMediaItem *)self artworkCatalog];
  if (v5)
  {
    id v6 = +[UIScreen mainScreen];
    [v6 bounds];
    double Width = CGRectGetWidth(v16);
    [v6 bounds];
    double Height = CGRectGetHeight(v17);
    if (Width >= Height) {
      double Width = Height;
    }
    [v6 scale];
    [v5 setDestinationScale:];
    [v5 setFittingSize:Width, Width];
    [v5 requestImageWithCompletionHandler:v4];
  }
  else
  {
    v9 = BKAudiobooksLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_2674C(v9);
    }

    BOOL v10 = [(MPMediaItem *)self representativeItem];
    id v6 = [v10 valueForProperty:MPMediaItemPropertyArtwork];

    if (v6)
    {
      [v6 bounds];
      v13 = [v6 imageWithSize:v11, v12];
    }
    else
    {
      v14 = BKAudiobooksLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_26708(v14);
      }

      v13 = 0;
    }
    v15 = (void (**)(id, void *))objc_retainBlock(v4);

    if (v15) {
      v15[2](v15, v13);
    }
  }
}

- (unint64_t)bk_albumTrackIndex
{
  unsigned int v3 = [(MPMediaItem *)self bk_assetID];
  id v4 = [(MPMediaItem *)self albumTitle];
  uint64_t v5 = +[MPMediaQuery bk_queryWithStoreID:v3 albumTitle:v4 isCloudItem:[(MPMediaItem *)self isCloudItem]];

  if (v5)
  {
    id v6 = [v5 collections];
    v7 = [v6 firstObject];
    MPMediaEntityPersistentID v8 = [v7 items];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_241E4;
    v11[3] = &unk_3D2B8;
    v11[4] = self;
    unint64_t v9 = (unint64_t)[v8 indexOfObjectPassingTest:v11];
  }
  else
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (id)bk_localStoreBookAlbumForItem
{
  uint64_t v3 = MPMediaItemPropertyPurchaseHistoryID;
  id v4 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyPurchaseHistoryID];
  if ([v4 longLongValue])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = MPMediaItemPropertyStorePlaylistID;
    v7 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyStorePlaylistID];
    if ([v7 longLongValue])
    {
      MPMediaEntityPersistentID v8 = +[MPMediaQuery bk_audiobooksQuery];
      unint64_t v9 = +[MPMediaPropertyPredicate predicateWithValue:&off_3E190 forProperty:v3];
      [v8 addFilterPredicate:v9];

      if (v8)
      {
        [v8 setGroupingType:1];
        BOOL v10 = +[MPMediaPropertyPredicate predicateWithValue:v7 forProperty:v6];
        [v8 addFilterPredicate:v10];
        double v11 = [v8 collections];
        uint64_t v5 = [v11 firstObject];
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)bk_isItemAudibleAudiobook:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 valueForProperty:MPMediaItemPropertyFilePath];

  uint64_t v5 = BUDynamicCast();
  uint64_t v6 = [v5 pathExtension];
  v7 = [v6 lowercaseString];

  if ([v7 isEqualToString:@"aa"]) {
    unsigned __int8 v8 = 1;
  }
  else {
    unsigned __int8 v8 = [v7 isEqualToString:@"aax"];
  }

  return v8;
}

+ (int)bk_audibleDRMGroupIDForItem:(id)a3
{
  id v4 = a3;
  if (v4 && objc_msgSend(a1, "bk_isItemAudibleAudiobook:", v4))
  {
    objc_opt_class();
    uint64_t v5 = [v4 valueForProperty:MPMediaItemPropertyStoreAccountID];
    uint64_t v6 = BUDynamicCast();
    int v7 = [v6 unsignedLongLongValue];
  }
  else
  {
    int v7 = -1;
  }

  return v7;
}

@end