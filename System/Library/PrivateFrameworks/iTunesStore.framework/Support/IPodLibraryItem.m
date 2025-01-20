@interface IPodLibraryItem
+ (unsigned)mediaTypeForStoreDownload:(id)a3;
- (BOOL)hasItemArtwork;
- (BOOL)isDownloading;
- (IPodLibraryItem)init;
- (NSArray)chapters;
- (NSData)itemArtworkData;
- (NSDictionary)additionalEntityProperties;
- (NSString)itemDownloadIdentifier;
- (NSString)itemMediaPath;
- (StoreDownload)itemMetadata;
- (double)durationInSeconds;
- (id)_copyChapterVideoTracksForAsset:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)assetType;
- (int64_t)downloadType;
- (int64_t)libraryPersistentIdentifier;
- (int64_t)protectionType;
- (int64_t)updateType;
- (void)dealloc;
- (void)loadPropertiesFromMediaPath:(id)a3 includeTracks:(BOOL)a4;
- (void)setAdditionalEntityProperties:(id)a3;
- (void)setAssetType:(int64_t)a3;
- (void)setChapters:(id)a3;
- (void)setDownloadType:(int64_t)a3;
- (void)setDurationInSeconds:(double)a3;
- (void)setItemArtworkData:(id)a3;
- (void)setItemDownloadIdentifier:(id)a3;
- (void)setItemMediaPath:(id)a3;
- (void)setItemMetadata:(id)a3;
- (void)setLibraryPersistentIdentifier:(int64_t)a3;
- (void)setProtectionType:(int64_t)a3;
- (void)setUpdateType:(int64_t)a3;
- (void)setValue:(id)a3 forAdditionalEntityProperty:(id)a4;
@end

@implementation IPodLibraryItem

- (IPodLibraryItem)init
{
  v4.receiver = self;
  v4.super_class = (Class)IPodLibraryItem;
  v2 = [(IPodLibraryItem *)&v4 init];
  if (v2) {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.IPodLibraryItem", 0);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v3.receiver = self;
  v3.super_class = (Class)IPodLibraryItem;
  [(IPodLibraryItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F3B40;
  block[3] = &unk_1003A6488;
  block[4] = v5;
  block[5] = self;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  return v5;
}

+ (unsigned)mediaTypeForStoreDownload:(id)a3
{
  id v4 = [a3 kind];
  id v5 = [a3 podcastType];
  unsigned int v6 = [v5 isEqualToString:SSDownloadPodcastTypeITunesU];
  if ([v4 isEqualToString:SSDownloadKindPodcast])
  {
    BOOL v7 = v6 == 0;
    unsigned int v8 = 4;
    unsigned int v9 = 32;
  }
  else if ([v4 isEqualToString:SSDownloadKindVideoPodcast])
  {
    BOOL v7 = v6 == 0;
    unsigned int v8 = 256;
    unsigned int v9 = 4096;
  }
  else
  {
    if ([v4 isEqualToString:SSDownloadKindAudiobook]) {
      return 2;
    }
    if ([v4 isEqualToString:SSDownloadKindMovie]) {
      return 2048;
    }
    if ([v4 isEqualToString:SSDownloadKindTelevisionEpisode]) {
      return 512;
    }
    BOOL v7 = [v4 isEqualToString:SSDownloadKindMusicVideo] == 0;
    unsigned int v8 = 8;
    unsigned int v9 = 1032;
  }
  if (v7) {
    return v8;
  }
  else {
    return v9;
  }
}

- (NSDictionary)additionalEntityProperties
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000;
  unsigned int v9 = sub_1000F3E2C;
  v10 = sub_1000F3E3C;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F3E48;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)assetType
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F3F2C;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)chapters
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = sub_1000F3E2C;
  v10 = sub_1000F3E3C;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F4030;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)downloadType
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F4114;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)durationInSeconds
{
  uint64_t v6 = 0;
  BOOL v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F41D4;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDownloading
{
  return ![(IPodLibraryItem *)self itemMediaPath]
      && [(IPodLibraryItem *)self updateType] == 0;
}

- (BOOL)hasItemArtwork
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F42D4;
  v5[3] = &unk_1003A64B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSData)itemArtworkData
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = sub_1000F3E2C;
  v10 = sub_1000F3E3C;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F4408;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSData *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)itemDownloadIdentifier
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = sub_1000F3E2C;
  v10 = sub_1000F3E3C;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F4530;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)itemMediaPath
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = sub_1000F3E2C;
  v10 = sub_1000F3E3C;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F4658;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (StoreDownload)itemMetadata
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = sub_1000F3E2C;
  v10 = sub_1000F3E3C;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F4780;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (StoreDownload *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)libraryPersistentIdentifier
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F4960;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)loadPropertiesFromMediaPath:(id)a3 includeTracks:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_msgSend(objc_alloc((Class)AVURLAsset), "initWithURL:options:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", a3), 0);
  if (!v6) {
    return;
  }
  BOOL v7 = v6;
  uint64_t v8 = dispatch_semaphore_create(0);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000F4BC4;
  v20[3] = &unk_1003A33A8;
  v20[4] = v8;
  objc_msgSend(v7, "loadValuesAsynchronouslyForKeys:completionHandler:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"duration", @"tracks", 0), v20);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v8);
  id v9 = [v7 tracksWithMediaType:AVMediaTypeVideo];
  if ([v9 count])
  {
    id v10 = [(IPodLibraryItem *)self _copyChapterVideoTracksForAsset:v7];
    id v11 = [v10 count];
    if (v11 >= [v9 count]) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }

    if (v4) {
      goto LABEL_7;
    }
LABEL_9:
    id v13 = 0;
    goto LABEL_10;
  }
  uint64_t v12 = objc_msgSend(objc_msgSend(v7, "tracksWithMediaType:", AVMediaTypeAudio), "count") != 0;
  if (!v4) {
    goto LABEL_9;
  }
LABEL_7:
  id v13 = +[ML3Track importChaptersByParsingAsset:v7];
LABEL_10:
  [v7 duration];
  v14 = (void (*)(long long *))ISWeakLinkedSymbolForString();
  if (v14)
  {
    long long v21 = v18;
    uint64_t v22 = v19;
    v14(&v21);
  }
  else
  {
    uint64_t v15 = 0;
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F4BCC;
  block[3] = &unk_1003A64D8;
  block[5] = v13;
  block[6] = v12;
  void block[7] = v15;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (int64_t)protectionType
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F4CCC;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAdditionalEntityProperties:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F4D54;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setAssetType:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F4E0C;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setChapters:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F4E8C;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setDownloadType:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F4F44;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setDurationInSeconds:(double)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F4FC8;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setItemArtworkData:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F504C;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setItemDownloadIdentifier:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F5104;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setItemMediaPath:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F51BC;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setItemMetadata:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F5274;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setLibraryPersistentIdentifier:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F532C;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setProtectionType:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F53AC;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setUpdateType:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F542C;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setValue:(id)a3 forAdditionalEntityProperty:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F54B0;
  block[3] = &unk_1003A3410;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_sync(dispatchQueue, block);
}

- (int64_t)updateType
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F55DC;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_copyChapterVideoTracksForAsset:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [a3 trackReferences];
  id v6 = [v5 objectForKey:AVAssetChapterListTrackReferencesKey];
  if ((unint64_t)[v6 count] >= 2)
  {
    unint64_t v7 = 1;
    do
    {
      id v8 = objc_msgSend(a3, "trackWithTrackID:", objc_msgSend(objc_msgSend(v6, "objectAtIndex:", v7), "intValue"));
      if (objc_msgSend(objc_msgSend(v8, "mediaType"), "isEqualToString:", AVMediaTypeVideo)) {
        [v4 addObject:v8];
      }
      v7 += 2;
    }
    while (v7 < (unint64_t)[v6 count]);
  }
  return v4;
}

@end