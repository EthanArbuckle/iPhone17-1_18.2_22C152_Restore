@interface MTShareUtilDataSource
- (BOOL)shareSupported;
- (MTShareUtilDataSource)initWithPlayerItem:(id)a3 selectedReferenceTime:(double)a4 selectedPlayerTime:(double)a5 currentPlayerTime:(double)a6;
- (MTShareUtilDataSource)initWithPodcast:(id)a3;
- (MTShareUtilDataSource)initWithPodcastDetails:(id)a3;
- (NSMutableDictionary)shareData;
- (double)currentPlayerTime;
- (double)selectedPlayerTime;
- (double)selectedReferenceTime;
- (id)pubDate;
- (id)shareDescription;
- (id)shareEpisodeTitle;
- (id)shareImage;
- (id)shareImageProvider;
- (id)sharePodcastTitle;
- (id)shareProvider;
- (id)shareURL;
- (id)shortURL;
- (id)storeIdentifier;
- (id)valueForKey:(id)a3 shareMode:(int64_t)a4;
- (int64_t)currentShareMode;
- (int64_t)supportedShareModes;
- (void)_setImageIgnoringSmallerSize:(id)a3 forKey:(id)a4 shareMode:(int64_t)a5;
- (void)fetchImageWithTemplateURL:(id)a3 completionHandler:(id)a4;
- (void)setCurrentShareMode:(int64_t)a3;
- (void)setShareData:(id)a3;
- (void)setShareSupported:(BOOL)a3;
- (void)setSupportedShareModes:(int64_t)a3;
- (void)setValue:(id)a3 forKey:(id)a4 shareModes:(int64_t)a5;
@end

@implementation MTShareUtilDataSource

- (MTShareUtilDataSource)initWithPlayerItem:(id)a3 selectedReferenceTime:(double)a4 selectedPlayerTime:(double)a5 currentPlayerTime:(double)a6
{
  id v10 = a3;
  v81.receiver = self;
  v81.super_class = (Class)MTShareUtilDataSource;
  v11 = [(MTShareUtilDataSource *)&v81 init];
  if (!v11) {
    goto LABEL_42;
  }
  v11->_shareSupported = [v10 isShareable];
  v12 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
  shareData = v11->_shareData;
  v11->_shareData = v12;

  *(int64x2_t *)&v11->_currentShareMode = vdupq_n_s64(1uLL);
  v14 = [v10 episode];
  v15 = [v14 podcast];
  if (v14) {
    id v16 = [v14 storeTrackId];
  }
  else {
    id v16 = [v10 episodeStoreId];
  }
  id v17 = v16;
  v18 = [v10 episodeShareUrl];
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_100091664;
  v79[3] = &unk_10054F1C8;
  v19 = v11;
  v80 = v19;
  [v10 retrieveArtwork:v79 withSize:kMTSharingArtworkSize, kMTSharingArtworkSize];
  id v77 = v17;
  v20 = +[NSNumber numberWithLongLong:v17];
  v21 = [v20 stringValue];
  [(MTShareUtilDataSource *)v19 setValue:v21 forKey:@"kMTStoreId" shareModes:6];

  v22 = [v10 pubDate];
  [(MTShareUtilDataSource *)v19 setValue:v22 forKey:@"kMTPubDate" shareModes:6];

  v23 = [v14 bestTitle];
  if ([v23 length]) {
    [v14 bestTitle];
  }
  else {
  uint64_t v24 = [v10 title];
  }

  v25 = [v15 title];
  if ([v25 length]) {
    [v15 title];
  }
  else {
  uint64_t v26 = [v10 author];
  }

  v76 = (void *)v24;
  [(MTShareUtilDataSource *)v19 setValue:v24 forKey:@"kMTEpisodeTitle" shareModes:6];
  v75 = (void *)v26;
  [(MTShareUtilDataSource *)v19 setValue:v26 forKey:@"kMTPodcastTitle" shareModes:6];
  v27 = +[NSNumber numberWithDouble:a4];
  v28 = [v27 stringValue];
  [(MTShareUtilDataSource *)v19 setValue:v28 forKey:@"kMTSelectedReferenceTime" shareModes:4];

  v29 = +[NSNumber numberWithDouble:a5];
  v30 = [v29 stringValue];
  [(MTShareUtilDataSource *)v19 setValue:v30 forKey:@"kMTSelectedPlayerTime" shareModes:4];

  v31 = +[NSNumber numberWithDouble:a6];
  v32 = [v31 stringValue];
  [(MTShareUtilDataSource *)v19 setValue:v32 forKey:@"kMTCurrentPlayerTime" shareModes:4];

  v33 = [v15 bestAvailableStoreCleanURL];

  v78 = v18;
  v34 = [v18 absoluteString];
  id v35 = [v34 length];

  if (+[MTStoreIdentifier isNotEmpty:v77])
  {
    v36 = v14;
    BOOL v37 = 0;
    if (v35)
    {
LABEL_13:
      id v38 = v78;
      v39 = 0;
      v40 = v36;
      goto LABEL_14;
    }
  }
  else
  {
    v36 = v14;
    v45 = [v14 guid];
    BOOL v37 = [v45 length] == 0;

    if (v35) {
      goto LABEL_13;
    }
  }
  if (v33) {
    char v46 = v37;
  }
  else {
    char v46 = 1;
  }
  v40 = v36;
  if (v46) {
    goto LABEL_37;
  }
  if (+[MTStoreIdentifier isNotEmpty:v77])
  {
    v47 = [v15 bestAvailableStoreCleanURL];
    CFStringRef v92 = @"i";
    v48 = +[NSString stringWithFormat:@"%lld", v77];
    v93 = v48;
    v49 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
    [v47 pf_URLByAppendingQueryString:v49];
    id v38 = (id)objc_claimAutoreleasedReturnValue();

    v50 = [v15 twitterShareURL];
    CFStringRef v90 = @"i";
    v51 = +[NSString stringWithFormat:@"%lld", v77];
    v91 = v51;
    v52 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
    v39 = [v50 pf_URLByAppendingQueryString:v52];

    goto LABEL_14;
  }
  v60 = [v36 guid];
  id v61 = [v60 length];

  if (v61)
  {
    v62 = [v15 bestAvailableStoreCleanURL];
    CFStringRef v88 = @"episodeGuid";
    v63 = [v36 guid];
    v89 = v63;
    v64 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
    [v62 pf_URLByAppendingHashString:v64];
    id v38 = (id)objc_claimAutoreleasedReturnValue();

    v39 = 0;
LABEL_14:
    if (v38)
    {
      v11->_supportedShareModes |= 2uLL;
      [(MTShareUtilDataSource *)v19 setValue:v38 forKey:@"MTShareURL" shareModes:2];
      if (a4 > 0.0 || a5 > 0.0)
      {
        if (a4 > 0.0)
        {
          CFStringRef v86 = @"r";
          v53 = +[NSString stringWithFormat:@"%.0lf", *(void *)&a4];
          v87 = v53;
          v54 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
          uint64_t v55 = [v38 pf_URLByAppendingQueryString:v54];

          id v38 = (id)v55;
        }
        v74 = v40;
        if (a5 > 0.0)
        {
          CFStringRef v84 = @"t";
          v56 = +[NSString stringWithFormat:@"%.0lf", *(void *)&a5];
          v85 = v56;
          v57 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
          uint64_t v58 = [v38 pf_URLByAppendingQueryString:v57];

          id v38 = (id)v58;
        }

        [(MTShareUtilDataSource *)v19 setValue:v38 forKey:@"MTShareURL" shareModes:4];
        v39 = 0;
        uint64_t v59 = v11->_supportedShareModes | 4;
        v11->_currentShareMode = 4;
        v11->_supportedShareModes = v59;
        v40 = v74;
      }
      else if (a6 <= 0.0)
      {
        v11->_currentShareMode = 2;
        if (v39) {
          [(MTShareUtilDataSource *)v19 setValue:v39 forKey:@"MTShortURL" shareModes:2];
        }
      }
      else
      {
        CFStringRef v82 = @"t";
        v41 = +[NSString stringWithFormat:@"%.0lf", *(void *)&a6];
        v83 = v41;
        v42 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        uint64_t v43 = [v38 pf_URLByAppendingQueryString:v42];

        [(MTShareUtilDataSource *)v19 setValue:v43 forKey:@"MTShareURL" shareModes:4];
        uint64_t v44 = v11->_supportedShareModes | 4;
        v11->_currentShareMode = 2;
        v11->_supportedShareModes = v44;

        v39 = 0;
        id v38 = (id)v43;
      }
    }
    goto LABEL_36;
  }
  id v38 = 0;
  v39 = 0;
LABEL_36:

LABEL_37:
  v65 = [v15 shareURL];
  if (!v65)
  {
    v66 = +[IMLogger sharedLogger];
    [v66 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Sharing/MTShareUtilDataSource.m", 181, @"Attempting to share a podcast without a share URL even though we have adamIDs, falling back to feedURL" lineNumber format];

    v67 = [v10 podcastFeedUrl];
    v65 = +[NSURL URLWithString:v67];
  }
  [(MTShareUtilDataSource *)v19 setValue:v75 forKey:@"kMTPodcastTitle" shareModes:1];
  v68 = [v15 author];
  [(MTShareUtilDataSource *)v19 setValue:v68 forKey:@"kMTProvider" shareModes:1];

  [(MTShareUtilDataSource *)v19 setValue:v65 forKey:@"MTShareURL" shareModes:1];
  v69 = [v15 twitterShareURL];

  if (v69)
  {
    v70 = [v15 twitterShareURL];
    [(MTShareUtilDataSource *)v19 setValue:v70 forKey:@"MTShortURL" shareModes:1];
  }
  v71 = [v40 itunesSubtitle];
  [(MTShareUtilDataSource *)v19 setValue:v71 forKey:@"kMTShareDescription" shareModes:6];

  v72 = [v15 itemDescription];
  [(MTShareUtilDataSource *)v19 setValue:v72 forKey:@"kMTShareDescription" shareModes:1];

LABEL_42:
  return v11;
}

- (MTShareUtilDataSource)initWithPodcast:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MTShareUtilDataSource;
  v5 = [(MTShareUtilDataSource *)&v26 init];
  if (v5)
  {
    v5->_shareSupported = [v4 isShareable];
    v6 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
    shareData = v5->_shareData;
    v5->_shareData = v6;

    *(int64x2_t *)&v5->_currentShareMode = vdupq_n_s64(1uLL);
    v8 = [v4 shareURL];
    [(MTShareUtilDataSource *)v5 setValue:v8 forKey:@"MTShareURL" shareModes:1];
    v9 = [v4 twitterShareURL];

    if (v9)
    {
      id v10 = [v4 twitterShareURL];
      [(MTShareUtilDataSource *)v5 setValue:v10 forKey:@"MTShortURL" shareModes:1];
    }
    v11 = +[PUIObjCArtworkProvider shared];
    double v12 = kMTSharingArtworkSize;
    v13 = [v11 cachedArtworkForMTPodcast:v4 withSize:kMTSharingArtworkSize];
    if (v13)
    {
      [(MTShareUtilDataSource *)v5 setValue:v13 forKey:@"MTShareImage" shareModes:1];
    }
    else
    {
      objc_initWeak(&location, v5);
      v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      v22 = sub_100091980;
      v23 = &unk_10054F218;
      objc_copyWeak(&v24, &location);
      [v11 artworkForMTPodcast:v4 withSize:&v20 completionHandler:v12];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    v14 = [v4 title:v20, v21, v22, v23];
    [(MTShareUtilDataSource *)v5 setValue:v14 forKey:@"kMTPodcastTitle" shareModes:1];

    v15 = [v4 author];
    [(MTShareUtilDataSource *)v5 setValue:v15 forKey:@"kMTProvider" shareModes:1];

    id v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 storeCollectionId]);
    id v17 = [v16 stringValue];
    [(MTShareUtilDataSource *)v5 setValue:v17 forKey:@"kMTStoreId" shareModes:1];

    v18 = [v4 itemDescription];
    [(MTShareUtilDataSource *)v5 setValue:v18 forKey:@"kMTShareDescription" shareModes:1];
  }
  return v5;
}

- (MTShareUtilDataSource)initWithPodcastDetails:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MTShareUtilDataSource;
  v5 = [(MTShareUtilDataSource *)&v27 init];
  v6 = v5;
  if (v5)
  {
    v5->_shareSupported = 1;
    v7 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
    shareData = v6->_shareData;
    v6->_shareData = v7;

    *(int64x2_t *)&v6->_currentShareMode = vdupq_n_s64(1uLL);
    v9 = [v4 objectForKeyedSubscript:@"url"];
    if (v9)
    {
      id v10 = [v4 objectForKeyedSubscript:@"url"];
      v11 = +[NSURL URLWithString:v10];
    }
    else
    {
      v11 = 0;
    }

    double v12 = [v4 objectForKeyedSubscript:@"shortUrl"];
    if (v12)
    {
      v13 = [v4 objectForKeyedSubscript:@"shortUrl"];
      v14 = +[NSURL URLWithString:v13];
    }
    else
    {
      v14 = 0;
    }

    if (v11)
    {
      [(MTShareUtilDataSource *)v6 setValue:v11 forKey:@"MTShareURL" shareModes:1];
      if (v14) {
        [(MTShareUtilDataSource *)v6 setValue:v14 forKey:@"MTShortURL" shareModes:1];
      }
    }
    v15 = [v4 objectForKeyedSubscript:@"id"];
    [(MTShareUtilDataSource *)v6 setValue:v15 forKey:@"kMTStoreId" shareModes:1];
    id v16 = [v4 objectForKeyedSubscript:@"image"];
    id v17 = [v4 objectForKeyedSubscript:@"artwork"];
    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MTShareUtilDataSource *)v6 _setImageIgnoringSmallerSize:v16 forKey:@"MTShareImage" shareMode:1];
LABEL_22:
        v22 = [v4 objectForKeyedSubscript:@"name"];
        v23 = [v4 objectForKeyedSubscript:@"artistName"];
        [(MTShareUtilDataSource *)v6 setValue:v22 forKey:@"kMTPodcastTitle" shareModes:1];
        [(MTShareUtilDataSource *)v6 setValue:v23 forKey:@"kMTProvider" shareModes:1];

        goto LABEL_23;
      }
    }
    if (!v17) {
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_22;
    }
    v18 = [v17 objectForKeyedSubscript:@"productLockupArtworkURL"];
    v19 = [v17 objectForKeyedSubscript:@"url"];
    v20 = v19;
    if (v19 && [v19 length])
    {
      id v21 = v20;
    }
    else
    {
      id v21 = v18;
      if (!v21)
      {
LABEL_21:

        goto LABEL_22;
      }
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100091EC8;
    v25[3] = &unk_10054F1C8;
    objc_super v26 = v6;
    [(MTShareUtilDataSource *)v26 fetchImageWithTemplateURL:v21 completionHandler:v25];

    goto LABEL_21;
  }
LABEL_23:

  return v6;
}

- (void)fetchImageWithTemplateURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[PUIObjCArtworkProvider shared];
  double v8 = kMTSharingArtworkSize;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100091FC8;
  v10[3] = &unk_10054E3C0;
  id v11 = v5;
  id v9 = v5;
  [v7 artworkForURL:v6 withSize:v10 completionHandler:v8];
}

- (id)shortURL
{
  int64_t v3 = [(MTShareUtilDataSource *)self currentShareMode];

  return [(MTShareUtilDataSource *)self valueForKey:@"MTShortURL" shareMode:v3];
}

- (id)shareURL
{
  int64_t v3 = [(MTShareUtilDataSource *)self currentShareMode];

  return [(MTShareUtilDataSource *)self valueForKey:@"MTShareURL" shareMode:v3];
}

- (id)shareImage
{
  int64_t v3 = [(MTShareUtilDataSource *)self currentShareMode];

  return [(MTShareUtilDataSource *)self valueForKey:@"MTShareImage" shareMode:v3];
}

- (id)shareEpisodeTitle
{
  int64_t v3 = [(MTShareUtilDataSource *)self currentShareMode];

  return [(MTShareUtilDataSource *)self valueForKey:@"kMTEpisodeTitle" shareMode:v3];
}

- (id)shareImageProvider
{
  int64_t v3 = [(MTShareUtilDataSource *)self currentShareMode];

  return [(MTShareUtilDataSource *)self valueForKey:@"MTShareImageProvider" shareMode:v3];
}

- (id)sharePodcastTitle
{
  v2 = [(MTShareUtilDataSource *)self valueForKey:@"kMTPodcastTitle" shareMode:[(MTShareUtilDataSource *)self currentShareMode]];
  int64_t v3 = v2;
  if (!v2) {
    v2 = &stru_10056A8A0;
  }
  id v4 = v2;

  return v4;
}

- (id)shareProvider
{
  int64_t v3 = [(MTShareUtilDataSource *)self currentShareMode];

  return [(MTShareUtilDataSource *)self valueForKey:@"kMTProvider" shareMode:v3];
}

- (id)shareDescription
{
  int64_t v3 = [(MTShareUtilDataSource *)self currentShareMode];

  return [(MTShareUtilDataSource *)self valueForKey:@"kMTShareDescription" shareMode:v3];
}

- (id)storeIdentifier
{
  int64_t v3 = [(MTShareUtilDataSource *)self currentShareMode];

  return [(MTShareUtilDataSource *)self valueForKey:@"kMTStoreId" shareMode:v3];
}

- (id)pubDate
{
  int64_t v3 = [(MTShareUtilDataSource *)self currentShareMode];

  return [(MTShareUtilDataSource *)self valueForKey:@"kMTPubDate" shareMode:v3];
}

- (double)selectedReferenceTime
{
  v2 = [(MTShareUtilDataSource *)self valueForKey:@"kMTSelectedReferenceTime" shareMode:4];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)selectedPlayerTime
{
  v2 = [(MTShareUtilDataSource *)self valueForKey:@"kMTSelectedPlayerTime" shareMode:4];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)currentPlayerTime
{
  v2 = [(MTShareUtilDataSource *)self valueForKey:@"kMTCurrentPlayerTime" shareMode:4];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setValue:(id)a3 forKey:(id)a4 shareModes:(int64_t)a5
{
  id v8 = a3;
  id v24 = a4;
  id v9 = (_UNKNOWN **)qword_10060A6E8;
  if (!qword_10060A6E8)
  {
    qword_10060A6E8 = (uint64_t)&off_10057ADC8;

    id v9 = &off_10057ADC8;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unint64_t v16 = (int)[v15 intValue] & (unint64_t)a5;
        if (v16 == (int)[v15 intValue])
        {
          id v17 = [(MTShareUtilDataSource *)self shareData];
          v18 = [v17 objectForKeyedSubscript:v15];

          if (!v18)
          {
            id v19 = objc_alloc_init((Class)NSMutableDictionary);
            v20 = [(MTShareUtilDataSource *)self shareData];
            [v20 setObject:v19 forKeyedSubscript:v15];
          }
          id v21 = [(MTShareUtilDataSource *)self shareData];
          v22 = [v21 objectForKeyedSubscript:v15];
          v23 = v22;
          if (v8) {
            [v22 setObject:v8 forKeyedSubscript:v24];
          }
          else {
            [v22 removeObjectForKey:v24];
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }
}

- (id)valueForKey:(id)a3 shareMode:(int64_t)a4
{
  id v6 = a3;
  v7 = [(MTShareUtilDataSource *)self shareData];
  id v8 = +[NSNumber numberWithInteger:a4];
  id v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = [v9 objectForKeyedSubscript:v6];

  return v10;
}

- (void)_setImageIgnoringSmallerSize:(id)a3 forKey:(id)a4 shareMode:(int64_t)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = [(MTShareUtilDataSource *)self valueForKey:v8 shareMode:a5];
  [v22 size];
  double v10 = kMTSharingArtworkSize;
  if (v11 > kMTSharingArtworkSize) {
    id v12 = [v22 imageWithSize:kMTSharingArtworkSize, kMTSharingArtworkSize];
  }
  [v9 size];
  double v14 = v13;
  [v22 size];
  if (v9)
  {
    double v16 = v15;
    [v9 size];
    double v18 = v17;
    [v22 size];
    if (v16 != v10 && v18 >= v19 || v14 == v10) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v14 != v10) {
LABEL_11:
  }
    [(MTShareUtilDataSource *)self setValue:v22 forKey:v8 shareModes:a5];
LABEL_12:
}

- (BOOL)shareSupported
{
  return self->_shareSupported;
}

- (void)setShareSupported:(BOOL)a3
{
  self->_shareSupported = a3;
}

- (int64_t)currentShareMode
{
  return self->_currentShareMode;
}

- (void)setCurrentShareMode:(int64_t)a3
{
  self->_currentShareMode = a3;
}

- (int64_t)supportedShareModes
{
  return self->_supportedShareModes;
}

- (void)setSupportedShareModes:(int64_t)a3
{
  self->_supportedShareModes = a3;
}

- (NSMutableDictionary)shareData
{
  return self->_shareData;
}

- (void)setShareData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end