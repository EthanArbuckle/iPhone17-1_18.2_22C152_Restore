@interface BKMLAudiobookChapter
+ (id)customChapterTitleForMediaItem:(id)a3 mediaChapter:(id)a4 chapterIndex:(unint64_t)a5;
- ($8BD1E3C934A4AE6C9488C351520253D1)timeRangeInAudiobook;
- ($8BD1E3C934A4AE6C9488C351520253D1)timeRangeInTrack;
- (BKAudiobook)audiobook;
- (BKAudiobookTrack)track;
- (BKMLAudiobookChapter)initWithMediaChapter:(id)a3 track:(id)a4 number:(unint64_t)a5 trackNumber:(unint64_t)a6 trackCount:(unint64_t)a7;
- (BKMLAudiobookTrack)containingTrack;
- (CGImage)artwork;
- (MPMediaChapter)mediaChapter;
- (MPNowPlayingContentItem)contentItem;
- (NSDate)dateLastOpened;
- (NSString)author;
- (NSString)customTitle;
- (NSString)description;
- (NSString)identifier;
- (NSString)title;
- (NSURL)assetURL;
- (double)duration;
- (double)startTimeInTrack;
- (int64_t)metadataType;
- (int64_t)type;
- (unint64_t)albumTrackCount;
- (unint64_t)albumTrackNumber;
- (unint64_t)chapterIndexInAudiobook;
- (void)setAudiobook:(id)a3;
- (void)setChapterIndexInAudiobook:(unint64_t)a3;
- (void)setContainingTrack:(id)a3;
- (void)setContentItem:(id)a3;
- (void)setDateLastOpened:(id)a3;
- (void)setTrack:(id)a3;
@end

@implementation BKMLAudiobookChapter

+ (id)customChapterTitleForMediaItem:(id)a3 mediaChapter:(id)a4 chapterIndex:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (qword_48EC8 != -1) {
    dispatch_once(&qword_48EC8, &stru_3CFA8);
  }
  v9 = [v7 bk_effectiveTitle];
  if (!v9) {
    goto LABEL_23;
  }
  v10 = [v7 title];
  unsigned int v11 = [v10 hasPrefix:v9];

  if (!v11) {
    goto LABEL_23;
  }
  v12 = [v7 title];
  v13 = [v12 substringFromIndex:[v9 length]];

  v14 = [v13 stringByTrimmingCharactersInSet:qword_48EC0];

  if (!v8)
  {
    if (![v14 length])
    {

      goto LABEL_23;
    }
    id v20 = v14;
    goto LABEL_22;
  }
  v15 = [v8 bk_UTF8Title];
  if ([v15 hasPrefix:v9])
  {
    v16 = [v15 substringFromIndex:[v9 length]];
    v17 = [v16 stringByTrimmingCharactersInSet:qword_48EC0];

    if ([v14 length] && objc_msgSend(v17, "length") && objc_msgSend(v14, "caseInsensitiveCompare:", v17))
    {
      v18 = BKAudiobooksBundle();
      v19 = [v18 localizedStringForKey:@"%@ - %@" value:&stru_3D468 table:&stru_3D468];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v14, v17);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ([v14 length])
      {
        id v21 = v14;
      }
      else
      {
        if (![v17 length])
        {
          id v20 = 0;
          goto LABEL_20;
        }
        id v21 = v17;
      }
      id v20 = v21;
    }
LABEL_20:

    goto LABEL_21;
  }
  id v20 = 0;
LABEL_21:

LABEL_22:
  if (v20) {
    goto LABEL_29;
  }
LABEL_23:
  v22 = [v8 bk_UTF8Title];
  if ([v22 length])
  {
    id v23 = v22;
  }
  else
  {
    v24 = [v7 title];
    id v25 = [v24 length];

    if (!v25)
    {
      v27 = BKAudiobooksBundle();
      v28 = [v27 localizedStringForKey:@"%@ - Chapter %@" value:&stru_3D468 table:&stru_3D468];
      v29 = +[NSNumber numberWithUnsignedInteger:a5 + 1];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v9, v29);
      id v20 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_28;
    }
    id v23 = [v7 title];
  }
  id v20 = v23;
LABEL_28:

LABEL_29:

  return v20;
}

- (BKMLAudiobookChapter)initWithMediaChapter:(id)a3 track:(id)a4 number:(unint64_t)a5 trackNumber:(unint64_t)a6 trackCount:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  v39.receiver = self;
  v39.super_class = (Class)BKMLAudiobookChapter;
  v15 = [(BKMLAudiobookChapter *)&v39 init];
  v16 = v15;
  if (v15)
  {
    id v17 = objc_storeWeak((id *)&v15->_containingTrack, v14);
    v16->_chapterIndexInAudiobook = a5;
    v16->_albumTrackNumber = a6;
    v16->_albumTrackCount = a7;
    id v18 = v17;
    uint64_t v19 = [v14 author];
    author = v16->_author;
    v16->_author = (NSString *)v19;

    id WeakRetained = objc_loadWeakRetained((id *)&v16->_containingTrack);
    v22 = [WeakRetained mediaItem];
    uint64_t v23 = +[BKMLAudiobookChapter customChapterTitleForMediaItem:v22 mediaChapter:v13 chapterIndex:v16->_chapterIndexInAudiobook];
    title = v16->_title;
    v16->_title = (NSString *)v23;

    if (v13)
    {
      objc_storeStrong((id *)&v16->_mediaChapter, a3);
      [v13 playbackTime];
      v16->_startTimeInTrack = v25;
      [v13 playbackDuration];
      v16->_CMTime duration = v26;
    }
    else
    {
      v16->_startTimeInTrack = 0.0;
      id v27 = objc_loadWeakRetained((id *)&v16->_containingTrack);
      [v27 duration];
      v16->_CMTime duration = v28;
    }
    CMTimeMake(&start, (uint64_t)(v16->_startTimeInTrack * 1000.0), 1000);
    CMTimeMake(&duration, (uint64_t)(v16->_duration * 1000.0), 1000);
    CMTimeRangeMake(&v38, &start, &duration);
    long long v29 = *(_OWORD *)&v38.start.epoch;
    *(_OWORD *)&v16->_timeRangeInTrack.start.value = *(_OWORD *)&v38.start.value;
    *(_OWORD *)&v16->_timeRangeInTrack.start.epoch = v29;
    *(_OWORD *)&v16->_timeRangeInTrack.duration.timescale = *(_OWORD *)&v38.duration.timescale;
    id v30 = objc_loadWeakRetained((id *)&v16->_containingTrack);
    [v30 startTime];
    CMTimeMake(&v35, (uint64_t)((v31 + v16->_startTimeInTrack) * 1000.0), 1000);
    CMTimeMake(&v34, (uint64_t)(v16->_duration * 1000.0), 1000);
    CMTimeRangeMake(&v38, &v35, &v34);
    long long v32 = *(_OWORD *)&v38.start.epoch;
    *(_OWORD *)&v16->_timeRangeInAudiobook.start.value = *(_OWORD *)&v38.start.value;
    *(_OWORD *)&v16->_timeRangeInAudiobook.start.epoch = v32;
    *(_OWORD *)&v16->_timeRangeInAudiobook.duration.timescale = *(_OWORD *)&v38.duration.timescale;
  }
  return v16;
}

- (BKAudiobookTrack)track
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingTrack);

  return (BKAudiobookTrack *)WeakRetained;
}

- (BKAudiobook)audiobook
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingTrack);
  v3 = [WeakRetained audiobook];

  return (BKAudiobook *)v3;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unint64_t v5 = [(BKMLAudiobookChapter *)self albumTrackNumber];
  v6 = [(BKMLAudiobookChapter *)self title];
  id v7 = [(BKMLAudiobookChapter *)self author];
  id v8 = [(BKMLAudiobookChapter *)self customTitle];
  [(BKMLAudiobookChapter *)self timeRangeInAudiobook];
  CMTime time = v13;
  Float64 Seconds = CMTimeGetSeconds(&time);
  [(BKMLAudiobookChapter *)self duration];
  unsigned int v11 = +[NSString stringWithFormat:@"<%@:%p trackNumber=%lu title=%@ author=%@ customTitle=%@ range=(%.1lf,%.1lf)>", v4, self, v5, v6, v7, v8, *(void *)&Seconds, v10];

  return (NSString *)v11;
}

- (NSString)title
{
  customTitle = self->_customTitle;
  if (!customTitle) {
    customTitle = self->_title;
  }
  return customTitle;
}

- (CGImage)artwork
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingTrack);
  v3 = (CGImage *)[WeakRetained artwork];

  return v3;
}

- (NSURL)assetURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingTrack);
  v3 = [WeakRetained assetURL];

  return (NSURL *)v3;
}

- (NSDate)dateLastOpened
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingTrack);
  v3 = [WeakRetained dateLastOpened];

  return (NSDate *)v3;
}

- (NSString)identifier
{
  v3 = [(BKMLAudiobookChapter *)self containingTrack];
  v4 = [v3 mediaItem];
  unint64_t v5 = [v4 bk_assetID];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(BKMLAudiobookChapter *)self assetURL];
    id v7 = [v8 absoluteString];
  }
  if ([v7 length])
  {
    v9 = +[NSString stringWithFormat:@"%@.%lu", v7, self->_chapterIndexInAudiobook];
  }
  else
  {
    uint64_t v10 = +[NSUUID UUID];
    v9 = [v10 UUIDString];
  }

  return (NSString *)v9;
}

- (MPNowPlayingContentItem)contentItem
{
  contentItem = self->_contentItem;
  if (!contentItem)
  {
    id v4 = objc_alloc((Class)MPNowPlayingContentItem);
    unint64_t v5 = [(BKMLAudiobookChapter *)self identifier];
    v6 = (MPNowPlayingContentItem *)[v4 initWithIdentifier:v5];
    id v7 = self->_contentItem;
    self->_contentItem = v6;

    [(MPNowPlayingContentItem *)self->_contentItem setMediaType:4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containingTrack);
    v9 = [WeakRetained mediaItem];
    uint64_t v10 = [v9 artist];
    [(MPNowPlayingContentItem *)self->_contentItem setTrackArtistName:v10];

    id v11 = objc_loadWeakRetained((id *)&self->_containingTrack);
    v12 = [v11 mediaItem];
    CMTime v13 = [v12 albumArtist];
    [(MPNowPlayingContentItem *)self->_contentItem setAlbumArtistName:v13];

    id v14 = objc_loadWeakRetained((id *)&self->_containingTrack);
    v15 = [v14 mediaItem];
    v16 = [v15 genre];
    [(MPNowPlayingContentItem *)self->_contentItem setGenreName:v16];

    id v17 = [(BKMLAudiobookChapter *)self title];
    [(MPNowPlayingContentItem *)self->_contentItem setTitle:v17];

    id v18 = objc_loadWeakRetained((id *)&self->_containingTrack);
    uint64_t v19 = [v18 mediaItem];
    id v20 = [v19 albumTitle];
    [(MPNowPlayingContentItem *)self->_contentItem setAlbumName:v20];

    [(BKMLAudiobookChapter *)self duration];
    -[MPNowPlayingContentItem setDuration:](self->_contentItem, "setDuration:");
    [(MPNowPlayingContentItem *)self->_contentItem setElapsedTime:0.0];
    [(MPNowPlayingContentItem *)self->_contentItem setPlaybackRate:0.0];
    LODWORD(v21) = 1.0;
    [(MPNowPlayingContentItem *)self->_contentItem setDefaultPlaybackRate:v21];
    [(MPNowPlayingContentItem *)self->_contentItem setNumberOfChildren:0];
    [(MPNowPlayingContentItem *)self->_contentItem setContainer:0];
    [(MPNowPlayingContentItem *)self->_contentItem setHasArtwork:1];
    v22 = [(MPNowPlayingContentItem *)self->_contentItem identifier];
    [(MPNowPlayingContentItem *)self->_contentItem setArtworkIdentifier:v22];

    [(MPNowPlayingContentItem *)self->_contentItem setPlayable:1];
    id v23 = objc_loadWeakRetained((id *)&self->_containingTrack);
    v24 = [v23 mediaItem];
    -[MPNowPlayingContentItem setExplicitContent:](self->_contentItem, "setExplicitContent:", [v24 isExplicitItem]);

    v34[0] = kMRMediaRemoteNowPlayingInfoChapterNumber;
    double v25 = +[NSNumber numberWithUnsignedInteger:[(BKMLAudiobookChapter *)self chapterIndexInAudiobook]];
    v35[0] = v25;
    v34[1] = kMRMediaRemoteNowPlayingInfoTotalChapterCount;
    double v26 = [(BKMLAudiobookChapter *)self audiobook];
    id v27 = [v26 chapters];
    double v28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v27 count]);
    v35[1] = v28;
    v34[2] = kMRMediaRemoteNowPlayingInfoUniqueIdentifier;
    id v29 = objc_loadWeakRetained((id *)&self->_containingTrack);
    id v30 = [v29 mediaItem];
    double v31 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v30 persistentID]);
    v35[2] = v31;
    long long v32 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];

    [(MPNowPlayingContentItem *)self->_contentItem setNowPlayingInfo:v32];
    contentItem = self->_contentItem;
  }

  return contentItem;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)author
{
  return self->_author;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDateLastOpened:(id)a3
{
}

- (double)startTimeInTrack
{
  return self->_startTimeInTrack;
}

- (unint64_t)albumTrackNumber
{
  return self->_albumTrackNumber;
}

- (unint64_t)albumTrackCount
{
  return self->_albumTrackCount;
}

- ($8BD1E3C934A4AE6C9488C351520253D1)timeRangeInTrack
{
  long long v3 = *(_OWORD *)&self[3].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var1.var3;
  return self;
}

- ($8BD1E3C934A4AE6C9488C351520253D1)timeRangeInAudiobook
{
  long long v3 = *(_OWORD *)&self[4].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[4].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var1.var3;
  return self;
}

- (int64_t)type
{
  return self->type;
}

- (int64_t)metadataType
{
  return self->metadataType;
}

- (void)setAudiobook:(id)a3
{
}

- (void)setTrack:(id)a3
{
}

- (void)setContentItem:(id)a3
{
}

- (MPMediaChapter)mediaChapter
{
  return self->_mediaChapter;
}

- (unint64_t)chapterIndexInAudiobook
{
  return self->_chapterIndexInAudiobook;
}

- (void)setChapterIndexInAudiobook:(unint64_t)a3
{
  self->_chapterIndexInAudiobook = a3;
}

- (BKMLAudiobookTrack)containingTrack
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingTrack);

  return (BKMLAudiobookTrack *)WeakRetained;
}

- (void)setContainingTrack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingTrack);
  objc_storeStrong((id *)&self->_mediaChapter, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_destroyWeak((id *)&self->track);
  objc_destroyWeak((id *)&self->audiobook);
  objc_storeStrong((id *)&self->dateLastOpened, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->assetURL, 0);
}

@end