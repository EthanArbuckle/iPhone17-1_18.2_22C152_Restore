@interface MTEpisodeDescriptionCache
- (MTEpisodeDescriptionCache)init;
- (NSCache)descriptionCache;
- (NSCache)episodeCache;
- (id)createVideoGlyphAttributedString;
- (id)dependantPropertyKeys;
- (id)descriptionBodyTextForEpisode:(id)a3 html:(BOOL)a4 withAttributes:(id)a5;
- (id)descriptionCacheForEpisodeUuid:(id)a3;
- (id)descriptionFooterTextForEpisode:(id)a3 includesSeasonEpisodeType:(BOOL)a4 includesDuration:(BOOL)a5 includesPlayedIfPlayed:(BOOL)a6 hasBodyText:(BOOL)a7 unavailableReason:(int64_t)a8;
- (id)descriptionForEpisode:(id)a3;
- (id)descriptionForEpisode:(id)a3 options:(unint64_t)a4;
- (id)descriptionKeyForOptions:(unint64_t)a3 unavailableReason:(int64_t)a4;
- (id)descriptionPrefixTextForEpisode:(id)a3 options:(unint64_t)a4 trailingNewline:(BOOL)a5;
- (id)descriptionPrefixTextForPlayerItem:(id)a3 options:(unint64_t)a4 trailingNewline:(BOOL)a5;
- (id)descriptionTextForEpisode:(id)a3 options:(unint64_t)a4;
- (id)episodeDescription:(id)a3;
- (id)metadataFooterForEpisode:(id)a3;
- (id)metadataFooterForEpisode:(id)a3 includingDuration:(BOOL)a4;
- (id)metadataFooterForEpisode:(id)a3 includingSeasonEpisodeType:(BOOL)a4 includingDuration:(BOOL)a5 includingPlayedIfPlayed:(BOOL)a6;
- (id)metadataHeaderForEpisode:(id)a3;
- (id)metadataHeaderForPlayerItem:(id)a3;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setDescriptionCache:(id)a3;
- (void)setEpisodeCache:(id)a3;
- (void)updateCacheForEpisode:(id)a3;
@end

@implementation MTEpisodeDescriptionCache

- (MTEpisodeDescriptionCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTEpisodeDescriptionCache;
  v2 = [(MTEpisodeDescriptionCache *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"invalidate" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTEpisodeDescriptionCache;
  [(MTEpisodeDescriptionCache *)&v4 dealloc];
}

- (id)descriptionForEpisode:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[MTEpisodeLockup descriptionFont];
  NSAttributedStringKey v9 = NSFontAttributeName;
  v10 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v7 = [(MTEpisodeDescriptionCache *)self descriptionBodyTextForEpisode:v4 html:1 withAttributes:v6];

  return v7;
}

- (id)episodeDescription:(id)a3
{
  return [(MTEpisodeDescriptionCache *)self descriptionForEpisode:a3];
}

- (id)descriptionForEpisode:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 uuid];
  id v8 = [v7 length];

  if (v8)
  {
    NSAttributedStringKey v9 = [v6 uuid];
    [(MTEpisodeDescriptionCache *)self updateCacheForEpisode:v6];
    v10 = [(MTEpisodeDescriptionCache *)self descriptionCacheForEpisodeUuid:v9];
    v11 = -[MTEpisodeDescriptionCache descriptionKeyForOptions:unavailableReason:](self, "descriptionKeyForOptions:unavailableReason:", a4, [v6 reasonForNotPlayable]);
    v12 = [v10 objectForKeyedSubscript:v11];
    if (!v12)
    {
      v12 = [(MTEpisodeDescriptionCache *)self descriptionTextForEpisode:v6 options:a4];
      [v10 setObject:v12 forKey:v11];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)metadataHeaderForEpisode:(id)a3
{
  return [(MTEpisodeDescriptionCache *)self descriptionForEpisode:a3 options:3];
}

- (id)metadataFooterForEpisode:(id)a3
{
  return [(MTEpisodeDescriptionCache *)self metadataFooterForEpisode:a3 includingDuration:0];
}

- (id)metadataFooterForEpisode:(id)a3 includingDuration:(BOOL)a4
{
  return [(MTEpisodeDescriptionCache *)self metadataFooterForEpisode:a3 includingSeasonEpisodeType:0 includingDuration:a4 includingPlayedIfPlayed:0];
}

- (id)metadataFooterForEpisode:(id)a3 includingSeasonEpisodeType:(BOOL)a4 includingDuration:(BOOL)a5 includingPlayedIfPlayed:(BOOL)a6
{
  uint64_t v6 = 64;
  if (a4) {
    uint64_t v6 = 320;
  }
  if (a5) {
    v6 |= 0x200uLL;
  }
  if (a6) {
    uint64_t v7 = v6 | 0x400;
  }
  else {
    uint64_t v7 = v6;
  }
  return [(MTEpisodeDescriptionCache *)self descriptionForEpisode:a3 options:v7];
}

- (void)invalidate
{
  v3 = [(MTEpisodeDescriptionCache *)self descriptionCache];
  [v3 removeAllObjects];

  id v4 = [(MTEpisodeDescriptionCache *)self episodeCache];
  [v4 removeAllObjects];
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 objectForKeyedSubscript:kEpisodeUuid];
  id v8 = [(MTEpisodeDescriptionCache *)self episodeCache];

  if (v8 == v6)
  {
    v10 = v13;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v11 = sub_1000B60C8;
    goto LABEL_5;
  }
  id v9 = [(MTEpisodeDescriptionCache *)self descriptionCache];

  if (v9 == v6)
  {
    v10 = v12;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v11 = sub_1000B611C;
LABEL_5:
    v10[2] = v11;
    v10[3] = &unk_10054D9B0;
    v10[4] = self;
    v10[5] = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
}

- (NSCache)descriptionCache
{
  descriptionCache = self->_descriptionCache;
  if (!descriptionCache)
  {
    id v4 = (NSCache *)objc_alloc_init((Class)NSCache);
    objc_super v5 = self->_descriptionCache;
    self->_descriptionCache = v4;

    [(NSCache *)self->_descriptionCache setDelegate:self];
    descriptionCache = self->_descriptionCache;
  }

  return descriptionCache;
}

- (NSCache)episodeCache
{
  episodeCache = self->_episodeCache;
  if (!episodeCache)
  {
    id v4 = (NSCache *)objc_alloc_init((Class)NSCache);
    objc_super v5 = self->_episodeCache;
    self->_episodeCache = v4;

    [(NSCache *)self->_episodeCache setDelegate:self];
    episodeCache = self->_episodeCache;
  }

  return episodeCache;
}

- (id)dependantPropertyKeys
{
  if (qword_10060A718 != -1) {
    dispatch_once(&qword_10060A718, &stru_100550020);
  }
  v2 = (void *)qword_10060A710;

  return v2;
}

- (id)descriptionCacheForEpisodeUuid:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MTEpisodeDescriptionCache *)self descriptionCache];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    [v6 setObject:v4 forKey:kEpisodeUuid];
    uint64_t v7 = [(MTEpisodeDescriptionCache *)self descriptionCache];
    [v7 setObject:v6 forKey:v4];
  }

  return v6;
}

- (id)descriptionKeyForOptions:(unint64_t)a3 unavailableReason:(int64_t)a4
{
  if ((a3 & 0x80) != 0) {
    +[NSString stringWithFormat:@"opt%lu-f-%lu", a4, a3, a4];
  }
  else {
  id v4 = +[NSString stringWithFormat:@"opt%lu-c", a4, a3, v6];
  }

  return v4;
}

- (void)updateCacheForEpisode:(id)a3
{
  id v13 = a3;
  id v4 = [(MTEpisodeDescriptionCache *)self episodeCache];
  objc_super v5 = [v13 uuid];
  uint64_t v6 = [v4 objectForKey:v5];

  uint64_t v7 = [(MTEpisodeDescriptionCache *)self dependantPropertyKeys];
  id v8 = [v13 dictionaryWithValuesForKeys:v7];

  if (([v6 isEqualToDictionary:v8] & 1) == 0)
  {
    id v9 = [(MTEpisodeDescriptionCache *)self episodeCache];
    v10 = [v13 uuid];
    [v9 setObject:v8 forKey:v10];

    v11 = [(MTEpisodeDescriptionCache *)self descriptionCache];
    v12 = [v13 uuid];
    [v11 removeObjectForKey:v12];
  }
}

- (id)descriptionTextForEpisode:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[MTEpisodeLockup descriptionFont];
  id v8 = (void *)v7;
  if ((a4 & 0x10) == 0)
  {
    id v9 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    v12 = objc_opt_new();
    goto LABEL_7;
  }
  NSAttributedStringKey v18 = NSFontAttributeName;
  uint64_t v19 = v7;
  id v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v9 = [(MTEpisodeDescriptionCache *)self descriptionBodyTextForEpisode:v6 html:(a4 >> 5) & 1 withAttributes:v13];

  if ((a4 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  v10 = -[MTEpisodeDescriptionCache descriptionPrefixTextForEpisode:options:trailingNewline:](self, "descriptionPrefixTextForEpisode:options:trailingNewline:", v6, a4, [v9 length] != 0);
  v11 = objc_opt_new();
  v12 = v11;
  if (v10)
  {
    [v11 appendAttributedString:v10];
  }
LABEL_7:
  if (v9) {
    [v12 appendAttributedString:v9];
  }
  if ((a4 & 0x40) != 0)
  {
    if ((a4 & 0x80) != 0) {
      id v14 = [v6 reasonForNotPlayable];
    }
    else {
      id v14 = 0;
    }
    v15 = -[MTEpisodeDescriptionCache descriptionFooterTextForEpisode:includesSeasonEpisodeType:includesDuration:includesPlayedIfPlayed:hasBodyText:unavailableReason:](self, "descriptionFooterTextForEpisode:includesSeasonEpisodeType:includesDuration:includesPlayedIfPlayed:hasBodyText:unavailableReason:", v6, (a4 >> 8) & 1, (a4 >> 9) & 1, (a4 >> 10) & 1, [v9 length] != 0, v14);
    if (v15) {
      [v12 appendAttributedString:v15];
    }
  }
  id v16 = [objc_alloc((Class)NSAttributedString) initWithAttributedString:v12];

  return v16;
}

- (id)descriptionPrefixTextForEpisode:(id)a3 options:(unint64_t)a4 trailingNewline:(BOOL)a5
{
  BOOL v40 = a5;
  char v5 = a4;
  id v7 = a3;
  id v8 = +[NSMutableArray array];
  if ((v5 & 2) != 0 && ([v7 pubDate], v9 > 0.0))
  {
    [v7 pubDate];
    v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v10 = 0;
  }
  if (+[MTEpisodeLockup useLayoutForSkinnyPhones]) {
    [v10 nanoFriendlyDisplayString];
  }
  else {
  uint64_t v11 = [v10 abbreviatedFriendlyDisplayString];
  }
  if (v11)
  {
    id v12 = [objc_alloc((Class)NSAttributedString) initWithString:v11];
    [v8 addObject:v12];
  }
  if ((v5 & 4) != 0 && [v7 isPartiallyPlayed])
  {
    id v13 = +[MTEpisode timeRemainingStringForEpisode:abbreviated:](MTEpisode, "timeRemainingStringForEpisode:abbreviated:", v7, +[MTEpisodeLockup useLayoutForSkinnyPhones]);
  }
  else
  {
    id v13 = 0;
  }
  if (![v13 length])
  {
    [v7 duration];
    uint64_t v15 = +[NSString prettyShortStringWithDuration:abbreviated:](NSString, "prettyShortStringWithDuration:abbreviated:", +[MTEpisodeLockup useLayoutForSkinnyPhones], v14);

    id v13 = (void *)v15;
  }
  unsigned __int8 v16 = [v7 isVideo];
  if (v5 & 8) != 0 && (v16)
  {
    v17 = [(MTEpisodeDescriptionCache *)self createVideoGlyphAttributedString];
    NSAttributedStringKey v18 = objc_opt_new();
    uint64_t v19 = v18;
    if (v17)
    {
      [v18 appendAttributedString:v17];
    }
  }
  else
  {
    uint64_t v19 = objc_opt_new();
  }
  if ([v13 length])
  {
    id v20 = [objc_alloc((Class)NSAttributedString) initWithString:v13];
    [v19 appendAttributedString:v20];
  }
  v39 = v13;
  v41 = (void *)v11;
  v42 = v10;
  v43 = v7;
  if ([v19 length])
  {
    id v21 = [v19 copy];
    [v8 addObject:v21];
  }
  v38 = v19;
  v22 = +[MTEpisodeLockup descriptionFont];
  v23 = +[MTEpisodeLockup metadataHeaderFont];
  NSAttributedStringKey v53 = NSFontAttributeName;
  v54 = v23;
  v24 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
  id v25 = [objc_alloc((Class)NSAttributedString) initWithString:@" " attributes:v24];
  id v26 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v51 = NSFontAttributeName;
  v52 = v22;
  v27 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  id v28 = [v26 initWithString:@"•" attributes:v27];

  id v29 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n" attributes:v24];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000B6D0C;
  v44[3] = &unk_100550048;
  id v30 = objc_alloc_init((Class)NSMutableAttributedString);
  id v45 = v30;
  id v31 = v8;
  id v46 = v31;
  id v32 = v25;
  id v47 = v32;
  id v33 = v28;
  id v48 = v33;
  BOOL v50 = v40;
  id v34 = v29;
  id v49 = v34;
  [v31 enumerateObjectsUsingBlock:v44];
  [v30 im_addAttribute:NSFontAttributeName value:v23];
  if (v40 && [v30 length])
  {
    id v35 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v23 _leading];
    [v35 setParagraphSpacing];
    [v30 im_addAttribute:NSParagraphStyleAttributeName value:v35];
  }
  if ([v30 length]) {
    id v36 = [objc_alloc((Class)NSAttributedString) initWithAttributedString:v30];
  }
  else {
    id v36 = 0;
  }

  return v36;
}

- (id)descriptionFooterTextForEpisode:(id)a3 includesSeasonEpisodeType:(BOOL)a4 includesDuration:(BOOL)a5 includesPlayedIfPlayed:(BOOL)a6 hasBodyText:(BOOL)a7 unavailableReason:(int64_t)a8
{
  BOOL v9 = a7;
  BOOL v67 = a5;
  BOOL v68 = a6;
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = objc_opt_new();
  id v13 = +[MTEpisodeLockup metadataFooterFont];
  double v14 = objc_opt_new();
  v71 = v13;
  [v13 lineHeight];
  v72 = v14;
  [v14 setParagraphSpacingBefore:v15 * 0.5];
  unsigned __int8 v16 = [v11 podcast];
  v17 = [v16 title];
  NSAttributedStringKey v18 = +[MTEpisodeUnavailableUtil longStringForUnavailableReason:a8 podcastTitle:v17];

  id v69 = [v18 length];
  if (v69)
  {
    if (v9)
    {
      NSAttributedStringKey v80 = NSParagraphStyleAttributeName;
      v81 = v72;
      uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
      uint64_t v20 = [@"\n" stringByAppendingString:v18];

      NSAttributedStringKey v18 = (void *)v20;
    }
    else
    {
      uint64_t v19 = 0;
    }
    id v21 = [objc_alloc((Class)NSAttributedString) initWithString:v18 attributes:v19];
    [v12 appendAttributedString:v21];
  }
  v73 = objc_opt_new();
  v22 = &NSFileSize_ptr;
  if (v10)
  {
    BOOL v23 = v9;
    uint64_t v24 = (uint64_t)[v11 seasonNumber];
    uint64_t v25 = (uint64_t)[v11 episodeNumber];
    id v26 = [v11 episodeTypeResolvedValue];
    if (v26 == (id)2)
    {
      if (v24 >= 1 && v25 >= 1)
      {
        v27 = +[NSBundle mainBundle];
        id v28 = v27;
        CFStringRef v29 = @"EPISODE_AND_SEASON_NUMBER_BONUS";
        goto LABEL_19;
      }
      if (v24 >= 1)
      {
        id v31 = +[NSBundle mainBundle];
        id v28 = v31;
        CFStringRef v32 = @"SEASON_NUMBER_BONUS";
        goto LABEL_26;
      }
      if (v25 >= 1)
      {
        id v34 = +[NSBundle mainBundle];
        id v28 = v34;
        CFStringRef v35 = @"EPISODE_NUMBER_BONUS";
        goto LABEL_72;
      }
      v63 = +[NSBundle mainBundle];
      id v28 = v63;
      CFStringRef v64 = @"BONUS_EPISODE";
    }
    else
    {
      if (v26 != (id)1)
      {
        if (v26) {
          goto LABEL_32;
        }
        if (v24 >= 1 && v25 >= 1)
        {
          v27 = +[NSBundle mainBundle];
          id v28 = v27;
          CFStringRef v29 = @"EPISODE_AND_SEASON_NUMBER_FORMAT";
LABEL_19:
          id v30 = [v27 localizedStringForKey:v29 value:&stru_10056A8A0 table:0];
          uint64_t v65 = v25;
LABEL_27:
          +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v30, v24, v65);
          id v33 = LABEL_28:;

          v22 = &NSFileSize_ptr;
LABEL_29:
          LOBYTE(v9) = v23;

LABEL_33:
          if ([v33 length]) {
            [v73 addObject:v33];
          }

          goto LABEL_36;
        }
        if (v24 >= 1)
        {
          id v31 = +[NSBundle mainBundle];
          id v28 = v31;
          CFStringRef v32 = @"SEASON_NUMBER_FORMAT";
LABEL_26:
          id v30 = [v31 localizedStringForKey:v32 value:&stru_10056A8A0 table:0];
          goto LABEL_27;
        }
        if (v25 < 1)
        {
LABEL_32:
          id v33 = 0;
          LOBYTE(v9) = v23;
          goto LABEL_33;
        }
        id v34 = +[NSBundle mainBundle];
        id v28 = v34;
        CFStringRef v35 = @"EPISODE_NUMBER_FORMAT";
LABEL_72:
        id v30 = [v34 localizedStringForKey:v35 value:&stru_10056A8A0 table:0];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v30, v25, v65);
        goto LABEL_28;
      }
      if (v24 >= 1 && v25 >= 1)
      {
        v27 = +[NSBundle mainBundle];
        id v28 = v27;
        CFStringRef v29 = @"EPISODE_AND_SEASON_NUMBER_TRAILER";
        goto LABEL_19;
      }
      if (v24 >= 1)
      {
        id v31 = +[NSBundle mainBundle];
        id v28 = v31;
        CFStringRef v32 = @"SEASON_NUMBER_TRAILER";
        goto LABEL_26;
      }
      if (v25 >= 1)
      {
        id v34 = +[NSBundle mainBundle];
        id v28 = v34;
        CFStringRef v35 = @"EPISODE_NUMBER_TRAILER";
        goto LABEL_72;
      }
      v63 = +[NSBundle mainBundle];
      id v28 = v63;
      CFStringRef v64 = @"TRAILER_EPISODE";
    }
    id v33 = [v63 localizedStringForKey:v64 value:&stru_10056A8A0 table:0];
    goto LABEL_29;
  }
LABEL_36:
  id v36 = [v11 valueForKey:kEpisodePubDate];
  v37 = [v36 verboseDisplayString];

  if (v37) {
    [v73 addObject:v37];
  }
  v70 = v12;
  if ((uint64_t)[v11 byteSize] < 1)
  {
    v38 = 0;
  }
  else
  {
    v38 = +[NSString stringWithBytesize:](NSString, "stringWithBytesize:", [v11 byteSize]);
  }
  v39 = [(NSFileAttributeKey *)(id)v22[245] mainBundle];
  if ([v11 isAudio])
  {
    CFStringRef v40 = @"Audio";
  }
  else if ([v11 isVideo])
  {
    CFStringRef v40 = @"Video";
  }
  else
  {
    CFStringRef v40 = @"Document";
  }
  v41 = [v39 localizedStringForKey:v40 value:&stru_10056A8A0 table:0];

  v66 = v38;
  if ([v38 length])
  {
    v42 = [(NSFileAttributeKey *)(id)v22[245] mainBundle];
    v43 = [v42 localizedStringForKey:@"EPISODE_SIZE_ALT_FORMAT" value:&stru_10056A8A0 table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v43, v38, v41, v38);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v44 = v41;
  }
  if (v67 && ([v11 duration], v45 >= 1.0))
  {
    [v11 duration];
    id v46 = +[NSString stringWithDuration:unitsStyle:includeTimeRemainingPhrase:](NSString, "stringWithDuration:unitsStyle:includeTimeRemainingPhrase:", 3, 0);
    if ([v46 length])
    {
      id v47 = +[NSBundle mainBundle];
      id v48 = [v47 localizedStringForKey:@"EPISODE_DURATION_SIZE_FORMAT" value:&stru_10056A8A0 table:0];
      id v49 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v48, v46, v44);

      [v73 addObject:v49];
    }
    else
    {
      [v73 addObject:v44];
    }
  }
  else
  {
    [v73 addObject:v44];
  }
  if (v68)
  {
    BOOL v50 = [v11 playedText];
    if ([v50 length]) {
      [v73 addObject:v50];
    }
  }
  if ([v11 isDownloaded])
  {
    NSAttributedStringKey v51 = [v11 podcast];
    unsigned int v52 = [v51 deletePlayedEpisodesResolvedValue];

    if (v52)
    {
      NSAttributedStringKey v53 = [v11 podcastUuid];
      v54 = +[MTEpisode predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:v53 deletePlayedEpisodes:1];

      if ([v54 evaluateWithObject:v11])
      {
        v55 = +[NSBundle mainBundle];
        v56 = [v55 localizedStringForKey:@"EPISODE_DETAIL_DOWNLOAD_WILL_BE_DELETED" value:&stru_10056A8A0 table:0];
        [v73 addObject:v56];
      }
    }
  }
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_1000B76A0;
  v74[3] = &unk_100550070;
  BOOL v78 = v9;
  id v75 = v18;
  id v76 = v72;
  BOOL v79 = v69 != 0;
  id v77 = v70;
  id v57 = v70;
  id v58 = v72;
  id v59 = v18;
  [v73 enumerateObjectsUsingBlock:v74];
  [v57 addAttribute:NSFontAttributeName value:v71 range:0, [v57 length]];
  v60 = +[UIColor systemGrayColor];
  [v57 addAttribute:NSForegroundColorAttributeName value:v60 range:0, [v57 length]];

  id v61 = [v57 copy];

  return v61;
}

- (id)createVideoGlyphAttributedString
{
  v2 = +[MTEpisodeStateView videoIcon];
  v3 = objc_opt_new();
  [v3 im_appendImage:v2];
  [v3 im_appendString:@" "];
  id v4 = [v3 copy];

  return v4;
}

- (id)descriptionBodyTextForEpisode:(id)a3 html:(BOOL)a4 withAttributes:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (v6 && [v7 itemDescriptionHasHTML])
  {
    BOOL v9 = [v7 lazyAttributedDescription];
    id v10 = [v9 mutableCopy];

    [v10 addAttributes:v8 range:0, [v10 length]];
    if ([v10 length])
    {
      id v11 = [v10 copy];
LABEL_9:
      id v16 = v11;

      goto LABEL_10;
    }
  }
  id v12 = [v7 itemDescriptionWithoutHTML];
  id v13 = [v12 length];

  if (v13)
  {
    id v14 = objc_alloc((Class)NSAttributedString);
    uint64_t v15 = [v7 itemDescriptionWithoutHTML];
LABEL_8:
    id v10 = (id)v15;
    id v11 = [v14 initWithString:v15 attributes:v8];
    goto LABEL_9;
  }
  if ([v7 itemDescriptionHasHTML])
  {
    id v16 = 0;
  }
  else
  {
    NSAttributedStringKey v18 = [v7 itemDescription];
    id v16 = [v18 length];

    if (v16)
    {
      id v14 = objc_alloc((Class)NSAttributedString);
      uint64_t v15 = [v7 itemDescription];
      goto LABEL_8;
    }
  }
LABEL_10:

  return v16;
}

- (id)metadataHeaderForPlayerItem:(id)a3
{
  return [(MTEpisodeDescriptionCache *)self descriptionPrefixTextForPlayerItem:a3 options:3 trailingNewline:0];
}

- (id)descriptionPrefixTextForPlayerItem:(id)a3 options:(unint64_t)a4 trailingNewline:(BOOL)a5
{
  BOOL v46 = a5;
  char v5 = a4;
  id v7 = a3;
  id v8 = +[NSMutableArray array];
  if ((v5 & 2) != 0)
  {
    BOOL v9 = [v7 pubDate];
  }
  else
  {
    BOOL v9 = 0;
  }
  if (+[MTEpisodeLockup useLayoutForSkinnyPhones]) {
    [v9 nanoFriendlyDisplayString];
  }
  else {
  uint64_t v10 = [v9 abbreviatedFriendlyDisplayString];
  }
  if (v10)
  {
    id v11 = [objc_alloc((Class)NSAttributedString) initWithString:v10];
    [v8 addObject:v11];
  }
  if ((v5 & 4) != 0
    && ([v7 playhead],
        double v13 = v12,
        [v7 duration],
        +[MTEpisode isPlayhead:resumableForDuration:](MTEpisode, "isPlayhead:resumableForDuration:", v13, v14))&& ([v7 duration], double v16 = v15, objc_msgSend(v7, "duration"), v18 = v16 - v17, v18 > 0.0))
  {
    uint64_t v19 = +[NSString prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:](NSString, "prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:", 1, +[MTEpisodeLockup useLayoutForSkinnyPhones], v18);
  }
  else
  {
    uint64_t v19 = 0;
  }
  if (![v19 length])
  {
    [v7 duration];
    uint64_t v21 = +[NSString prettyShortStringWithDuration:abbreviated:](NSString, "prettyShortStringWithDuration:abbreviated:", +[MTEpisodeLockup useLayoutForSkinnyPhones], v20);

    uint64_t v19 = (void *)v21;
  }
  unsigned __int8 v22 = [v7 isVideo];
  if (v5 & 8) != 0 && (v22)
  {
    BOOL v23 = [(MTEpisodeDescriptionCache *)self createVideoGlyphAttributedString];
    uint64_t v24 = objc_opt_new();
    uint64_t v25 = v24;
    if (v23)
    {
      [v24 appendAttributedString:v23];
    }
  }
  else
  {
    uint64_t v25 = objc_opt_new();
  }
  if ([v19 length])
  {
    id v26 = [objc_alloc((Class)NSAttributedString) initWithString:v19];
    [v25 appendAttributedString:v26];
  }
  double v45 = v19;
  id v47 = (void *)v10;
  id v48 = v9;
  id v49 = v7;
  if ([v25 length])
  {
    id v27 = [v25 copy];
    [v8 addObject:v27];
  }
  id v44 = v25;
  id v28 = +[MTEpisodeLockup descriptionFont];
  CFStringRef v29 = +[MTEpisodeLockup metadataHeaderFont];
  NSAttributedStringKey v59 = NSFontAttributeName;
  v60 = v29;
  id v30 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  id v31 = [objc_alloc((Class)NSAttributedString) initWithString:@" " attributes:v30];
  id v32 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v57 = NSFontAttributeName;
  id v58 = v28;
  id v33 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  id v34 = [v32 initWithString:@"•" attributes:v33];

  id v35 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n" attributes:v30];
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000B7EF8;
  v50[3] = &unk_100550048;
  id v36 = objc_alloc_init((Class)NSMutableAttributedString);
  id v51 = v36;
  id v37 = v8;
  id v52 = v37;
  id v38 = v31;
  id v53 = v38;
  id v39 = v34;
  id v54 = v39;
  BOOL v56 = v46;
  id v40 = v35;
  id v55 = v40;
  [v37 enumerateObjectsUsingBlock:v50];
  [v36 im_addAttribute:NSFontAttributeName value:v29];
  if (v46 && [v36 length])
  {
    id v41 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v29 _leading];
    [v41 setParagraphSpacing:];
    [v36 im_addAttribute:NSParagraphStyleAttributeName value:v41];
  }
  if ([v36 length]) {
    id v42 = [objc_alloc((Class)NSAttributedString) initWithAttributedString:v36];
  }
  else {
    id v42 = 0;
  }

  return v42;
}

- (void)setDescriptionCache:(id)a3
{
}

- (void)setEpisodeCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeCache, 0);

  objc_storeStrong((id *)&self->_descriptionCache, 0);
}

@end