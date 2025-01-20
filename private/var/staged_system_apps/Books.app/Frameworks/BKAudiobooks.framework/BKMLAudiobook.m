@interface BKMLAudiobook
- (BKMLAudiobook)init;
- (BOOL)isAudiobookPreview;
- (BOOL)isEqualToAudiobook:(id)a3;
- (BOOL)isSG;
- (NSArray)chapters;
- (NSArray)mediaLibraryChapters;
- (NSArray)mediaLibraryTracks;
- (NSArray)supplementalContents;
- (NSArray)tracks;
- (NSDate)dateLastOpened;
- (NSString)assetID;
- (NSString)author;
- (NSString)description;
- (NSString)guid;
- (NSString)title;
- (UIImage)coverArt;
- (double)bookmarkTime;
- (double)duration;
- (id)representativeItem;
- (unint64_t)indexOfTrack:(id)a3;
- (void)addTracks:(id)a3;
- (void)artworkWithCompletion:(id)a3;
- (void)coverArtWithCompletion:(id)a3;
- (void)setBookmarkTime:(double)a3;
- (void)setGuid:(id)a3;
- (void)setMediaLibraryChapters:(id)a3;
- (void)setMediaLibraryTracks:(id)a3;
- (void)setSupplementalContents:(id)a3;
@end

@implementation BKMLAudiobook

- (BOOL)isAudiobookPreview
{
  return 0;
}

- (BKMLAudiobook)init
{
  v10.receiver = self;
  v10.super_class = (Class)BKMLAudiobook;
  v2 = [(BKMLAudiobook *)&v10 init];
  v3 = v2;
  if (v2)
  {
    mediaLibraryTracks = v2->_mediaLibraryTracks;
    v2->_mediaLibraryTracks = (NSArray *)&__NSArray0__struct;

    mediaLibraryChapters = v3->_mediaLibraryChapters;
    v3->_mediaLibraryChapters = (NSArray *)&__NSArray0__struct;

    v3->_duration = 0.0;
    title = v3->_title;
    v3->_title = (NSString *)&stru_3D468;

    author = v3->_author;
    v3->_author = (NSString *)&stru_3D468;

    guid = v3->_guid;
    v3->_guid = (NSString *)&stru_3D468;
  }
  return v3;
}

- (void)addTracks:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_mediaLibraryTracks, a3);
  v6 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v7 = self->_mediaLibraryTracks;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v36 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v37;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v12 = [v11 chapters];
        [v6 addObjectsFromArray:v12];

        [v11 duration];
        self->_double duration = v13 + self->_duration;
      }
      id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v36 objects:v52 count:16];
    }
    while (v8);
  }

  v14 = (NSArray *)[v6 copy];
  mediaLibraryChapters = self->_mediaLibraryChapters;
  self->_mediaLibraryChapters = v14;

  v16 = [(BKMLAudiobook *)self representativeItem];
  [v16 bk_effectiveTitle];
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v17;

  v19 = [(BKMLAudiobook *)self representativeItem];
  [v19 bk_effectiveAuthor];
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  author = self->_author;
  self->_author = v20;

  objc_initWeak(&location, self);
  v22 = [v5 firstObject];
  v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472;
  v32 = sub_11ACC;
  v33 = &unk_3CF30;
  objc_copyWeak(&v34, &location);
  [v22 lookupRacGUIDWithCompletion:&v30];

  v23 = BKAudiobooksLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    double duration = self->_duration;
    NSUInteger v25 = [(NSArray *)self->_mediaLibraryTracks count];
    NSUInteger v26 = [(NSArray *)self->_mediaLibraryChapters count];
    NSUInteger v27 = [(NSArray *)self->_supplementalContents count];
    v28 = self->_title;
    v29 = self->_author;
    *(_DWORD *)buf = 134219266;
    double v41 = duration;
    __int16 v42 = 2048;
    NSUInteger v43 = v25;
    __int16 v44 = 2048;
    NSUInteger v45 = v26;
    __int16 v46 = 2048;
    NSUInteger v47 = v27;
    __int16 v48 = 2112;
    v49 = v28;
    __int16 v50 = 2112;
    v51 = v29;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Setup audiobook with duration:%.2f tracks:%ld chapters:%ld supplemental content count:%lu title:'%@' author:'%@'", buf, 0x3Eu);
  }

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

- (void)coverArtWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKMLAudiobook *)self representativeItem];
  if (v5)
  {
    if (self->_coverArt)
    {
      id v6 = objc_retainBlock(v4);
      v7 = v6;
      if (v6) {
        (*((void (**)(id, UIImage *))v6 + 2))(v6, self->_coverArt);
      }
    }
    else
    {
      v11 = BKAudiobooksLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Lazy loading artwork into memory.", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_11D74;
      v12[3] = &unk_3CF58;
      objc_copyWeak(&v14, buf);
      id v13 = v4;
      [v5 bk_artworkImageWithCompletion:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    id v8 = BKAudiobooksLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_25424(v8);
    }

    id v9 = objc_retainBlock(v4);
    objc_super v10 = v9;
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

- (void)artworkWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_11EA0;
  v5[3] = &unk_3CF80;
  id v6 = a3;
  id v4 = v6;
  [(BKMLAudiobook *)self coverArtWithCompletion:v5];
}

- (NSString)assetID
{
  v2 = [(BKMLAudiobook *)self representativeItem];
  v3 = [v2 bk_assetID];

  return (NSString *)v3;
}

- (double)bookmarkTime
{
  v2 = [(NSArray *)self->_mediaLibraryTracks firstObject];
  [v2 bookmarkTime];
  double v4 = v3;

  id v5 = BKAudiobooksLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    double v8 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Fetched media library bookmark time of %.2f.", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)setBookmarkTime:(double)a3
{
  if ([(NSArray *)self->_mediaLibraryTracks count])
  {
    id v5 = BKAudiobooksLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      double v8 = a3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Saving media library bookmark time to be %.2f.", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [(NSArray *)self->_mediaLibraryTracks firstObject];
    [v6 setBookmarkTime:a3];
  }
}

- (NSDate)dateLastOpened
{
  v2 = [(BKMLAudiobook *)self representativeItem];
  objc_opt_class();
  double v3 = [v2 objectForKeyedSubscript:MPMediaItemPropertyLastPlayedDate];
  double v4 = BUDynamicCast();

  id v5 = BKAudiobooksLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    double v8 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Fetched media library last opened date of %@.", (uint8_t *)&v7, 0xCu);
  }

  return (NSDate *)v4;
}

- (NSArray)tracks
{
  return self->_mediaLibraryTracks;
}

- (NSArray)chapters
{
  return self->_mediaLibraryChapters;
}

- (unint64_t)indexOfTrack:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = BUDynamicCast();

  unint64_t v6 = [(NSArray *)self->_mediaLibraryTracks indexOfObject:v5];
  return v6;
}

- (id)representativeItem
{
  v2 = [(NSArray *)self->_mediaLibraryTracks firstObject];
  double v3 = [v2 mediaItem];

  return v3;
}

- (BOOL)isEqualToAudiobook:(id)a3
{
  id v4 = a3;
  id v5 = [(BKMLAudiobook *)self assetID];
  unint64_t v6 = [v4 assetID];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)isSG
{
  guid = self->_guid;
  if (guid) {
    LOBYTE(guid) = [(NSString *)guid length] != 0;
  }
  return (char)guid;
}

- (NSString)description
{
  double v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(BKMLAudiobook *)self title];
  unint64_t v6 = [(BKMLAudiobook *)self author];
  int v7 = +[NSMutableString stringWithFormat:@"<%@:%p title=%@ author=%@ _coverArt=%p tracks=\n", v4, self, v5, v6, self->_coverArt];

  v21 = self;
  NSUInteger v8 = [(NSArray *)self->_mediaLibraryTracks count];
  if (v8)
  {
    NSUInteger v9 = v8;
    uint64_t v10 = 0;
    NSUInteger v11 = v8 - 1;
    do
    {
      v12 = [(NSArray *)v21->_mediaLibraryTracks objectAtIndexedSubscript:v10];
      id v13 = [v12 description];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v14 = [v13 componentsSeparatedByString:@"\n"];
      id v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v23;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            [v7 appendFormat:@"  %@\n", *(void *)(*((void *)&v22 + 1) + 8 * i)];
          }
          id v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v16);
      }

      if (v10 == v11) {
        CFStringRef v19 = &stru_3D468;
      }
      else {
        CFStringRef v19 = @",";
      }
      [v7 appendString:v19];

      ++v10;
    }
    while (v10 != v9);
  }
  [v7 appendFormat:@">"];

  return (NSString *)v7;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)author
{
  return self->_author;
}

- (double)duration
{
  return self->_duration;
}

- (UIImage)coverArt
{
  return self->_coverArt;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSArray)supplementalContents
{
  return self->_supplementalContents;
}

- (void)setSupplementalContents:(id)a3
{
}

- (NSArray)mediaLibraryTracks
{
  return self->_mediaLibraryTracks;
}

- (void)setMediaLibraryTracks:(id)a3
{
}

- (NSArray)mediaLibraryChapters
{
  return self->_mediaLibraryChapters;
}

- (void)setMediaLibraryChapters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibraryChapters, 0);
  objc_storeStrong((id *)&self->_mediaLibraryTracks, 0);
  objc_storeStrong((id *)&self->_supplementalContents, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_coverArt, 0);
  objc_storeStrong((id *)&self->_author, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end