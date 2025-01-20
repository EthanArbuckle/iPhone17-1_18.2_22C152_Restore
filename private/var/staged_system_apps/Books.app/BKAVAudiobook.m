@interface BKAVAudiobook
+ (id)audiobookWithAssetID:(id)a3 tracks:(id)a4;
- (BKAVAudiobook)initWithAssetID:(id)a3;
- (BOOL)chapterListValid;
- (BOOL)durationValid;
- (BOOL)isAudiobookPreview;
- (BOOL)isEqualToAudiobook:(id)a3;
- (BOOL)isSG;
- (NSArray)chapters;
- (NSArray)supplementalContents;
- (NSArray)tracks;
- (NSDate)dateLastOpened;
- (NSMutableArray)avTracks;
- (NSString)assetID;
- (NSString)author;
- (NSString)description;
- (NSString)guid;
- (NSString)title;
- (double)bookmarkTime;
- (double)duration;
- (id)representativeItem;
- (id)representativeTrack;
- (id)trackAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfTrack:(id)a3;
- (void)addTrack:(id)a3;
- (void)artworkWithCompletion:(id)a3;
- (void)setAudiobookPreview:(BOOL)a3;
- (void)setAuthor:(id)a3;
- (void)setAvTracks:(id)a3;
- (void)setBookmarkTime:(double)a3;
- (void)setChapterListValid:(BOOL)a3;
- (void)setDurationValid:(BOOL)a3;
- (void)setGuid:(id)a3;
- (void)setSupplementalContents:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BKAVAudiobook

+ (id)audiobookWithAssetID:(id)a3 tracks:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[BKAVAudiobook alloc] initWithAssetID:v5];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v12);
        objc_opt_class();
        v14 = BUDynamicCast();
        if (v14)
        {
          [(BKAVAudiobook *)v7 addTrack:v14];
        }
        else
        {
          v15 = sub_1001E9A80();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v22 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Attempting to add invalid track %@", buf, 0xCu);
          }
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

- (BKAVAudiobook)initWithAssetID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKAVAudiobook;
  id v6 = [(BKAVAudiobook *)&v11 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    avTracks = v6->_avTracks;
    v6->_avTracks = v7;

    objc_storeStrong((id *)&v6->_assetID, a3);
    guid = v6->_guid;
    v6->_guid = (NSString *)&stru_100A70340;
  }
  return v6;
}

- (NSArray)chapters
{
  if (![(BKAVAudiobook *)self chapterListValid])
  {
    v3 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v4 = self->_avTracks;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v8) chapters:v14];
          [v3 addObjectsFromArray:v9];

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    id v10 = (NSArray *)[v3 copy];
    chapters = self->_chapters;
    self->_chapters = v10;

    [(BKAVAudiobook *)self setChapterListValid:1];
  }
  v12 = self->_chapters;

  return v12;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_avTracks count];
}

- (double)duration
{
  if (![(BKAVAudiobook *)self durationValid])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = self->_avTracks;
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      double v7 = 0.0;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) duration:v11];
          double v7 = v7 + v9;
        }
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    else
    {
      double v7 = 0.0;
    }

    self->_duration = v7;
    [(BKAVAudiobook *)self setDurationValid:1];
  }
  return self->_duration;
}

- (void)artworkWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAVAudiobook *)self representativeTrack];
  if (v5)
  {
    uint64_t v6 = (void (**)(id, id))objc_retainBlock(v4);
    if (v6) {
      v6[2](v6, [v5 artwork]);
    }
  }
  else
  {
    double v7 = sub_1001E9A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1007EDEC4(v7);
    }

    id v8 = (void (**)(id, id))objc_retainBlock(v4);
    uint64_t v6 = v8;
    if (v8) {
      v8[2](v8, 0);
    }
  }
}

- (void)addTrack:(id)a3
{
  [(NSMutableArray *)self->_avTracks addObject:a3];
  [(BKAVAudiobook *)self setChapterListValid:0];

  [(BKAVAudiobook *)self setDurationValid:0];
}

- (NSArray)tracks
{
  return (NSArray *)self->_avTracks;
}

- (id)representativeTrack
{
  id v3 = [(NSMutableArray *)self->_avTracks count];
  if (v3)
  {
    id v3 = [(NSMutableArray *)self->_avTracks objectAtIndexedSubscript:0];
  }

  return v3;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(BKAVAudiobook *)self title];
  uint64_t v6 = [(BKAVAudiobook *)self author];
  double v7 = [(BKAVAudiobook *)self representativeTrack];
  id v8 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@:%p title=%@ author=%@ artwork=%p tracks=\n", v4, self, v5, v6, [v7 artwork]);

  uint64_t v22 = self;
  double v9 = (char *)[(NSMutableArray *)self->_avTracks count];
  if (v9)
  {
    id v10 = v9;
    long long v11 = 0;
    long long v12 = v9 - 1;
    do
    {
      long long v13 = [(NSMutableArray *)v22->_avTracks objectAtIndexedSubscript:v11];
      long long v14 = [v13 description];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v15 = [v14 componentsSeparatedByString:@"\n"];
      id v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v24;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            [v8 appendFormat:@"  %@\n", *(void *)(*((void *)&v23 + 1) + 8 * i)];
          }
          id v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v17);
      }

      if (v11 == v12) {
        CFStringRef v20 = &stru_100A70340;
      }
      else {
        CFStringRef v20 = @",";
      }
      [v8 appendString:v20];

      ++v11;
    }
    while (v11 != v10);
  }
  [v8 appendFormat:@">"];

  return (NSString *)v8;
}

- (unint64_t)indexOfTrack:(id)a3
{
  return (unint64_t)[(NSMutableArray *)self->_avTracks indexOfObject:a3];
}

- (id)trackAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_avTracks objectAtIndex:a3];
}

- (BOOL)isEqualToAudiobook:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAVAudiobook *)self assetID];
  uint64_t v6 = [v4 assetID];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)isSG
{
  guid = self->_guid;
  if (guid) {
    LOBYTE(guvoid (**v8)(id, id) = [(NSString *)guid length] != 0;
  }
  return (char)guid;
}

- (id)representativeItem
{
  return 0;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (double)bookmarkTime
{
  return self->bookmarkTime;
}

- (void)setBookmarkTime:(double)a3
{
  self->bookmarkTime = a3;
}

- (NSDate)dateLastOpened
{
  return self->dateLastOpened;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
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

- (BOOL)isAudiobookPreview
{
  return self->_audiobookPreview;
}

- (void)setAudiobookPreview:(BOOL)a3
{
  self->_audiobookPreview = a3;
}

- (NSMutableArray)avTracks
{
  return self->_avTracks;
}

- (void)setAvTracks:(id)a3
{
}

- (BOOL)chapterListValid
{
  return self->_chapterListValid;
}

- (void)setChapterListValid:(BOOL)a3
{
  self->_chapterListValid = a3;
}

- (BOOL)durationValid
{
  return self->_durationValid;
}

- (void)setDurationValid:(BOOL)a3
{
  self->_durationValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avTracks, 0);
  objc_storeStrong((id *)&self->_supplementalContents, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->dateLastOpened, 0);
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_author, 0);

  objc_storeStrong((id *)&self->_assetID, 0);
}

@end