@interface BKAVAudiobookChapter
- ($0B718382DA70737603D0A6F6091C33EE)timeRangeInAudiobook;
- ($0B718382DA70737603D0A6F6091C33EE)timeRangeInTrack;
- (BKAudiobook)audiobook;
- (BKAudiobookTrack)track;
- (BOOL)hasAlternateArtwork;
- (CGImage)artwork;
- (NSDate)dateLastOpened;
- (NSString)author;
- (NSString)customTitle;
- (NSString)description;
- (NSString)identifier;
- (NSString)title;
- (NSURL)assetURL;
- (double)duration;
- (int64_t)metadataType;
- (int64_t)type;
- (unint64_t)albumTrackCount;
- (unint64_t)albumTrackNumber;
- (void)dealloc;
- (void)setAlbumTrackNumber:(unint64_t)a3;
- (void)setArtwork:(CGImage *)a3;
- (void)setAuthor:(id)a3;
- (void)setCustomTitle:(id)a3;
- (void)setDateLastOpened:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHasAlternateArtwork:(BOOL)a3;
- (void)setMetadataType:(int64_t)a3;
- (void)setTimeRangeInAudiobook:(id *)a3;
- (void)setTimeRangeInTrack:(id *)a3;
- (void)setTitle:(id)a3;
- (void)setTrack:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation BKAVAudiobookChapter

- (BKAudiobook)audiobook
{
  v2 = [(BKAVAudiobookChapter *)self track];
  v3 = [v2 audiobook];

  return (BKAudiobook *)v3;
}

- (NSString)identifier
{
  v3 = [(BKAVAudiobookChapter *)self assetURL];
  v4 = [v3 absoluteString];

  if ([v4 length])
  {
    v5 = [(BKAVAudiobookChapter *)self track];
    v6 = [v5 audiobook];
    v7 = [v6 chapters];
    id v8 = [v7 indexOfObject:self];

    v9 = +[NSString stringWithFormat:@"%@.%ld", v4, v8];
  }
  else
  {
    v10 = +[NSUUID UUID];
    v9 = [v10 UUIDString];
  }

  return (NSString *)v9;
}

- (void)dealloc
{
  CGImageRelease(self->_artwork);
  v3.receiver = self;
  v3.super_class = (Class)BKAVAudiobookChapter;
  [(BKAVAudiobookChapter *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(BKAVAudiobookChapter *)self title];
  v6 = [(BKAVAudiobookChapter *)self author];
  v7 = [(BKAVAudiobookChapter *)self customTitle];
  [(BKAVAudiobookChapter *)self timeRangeInAudiobook];
  CMTime time = v12;
  Float64 Seconds = CMTimeGetSeconds(&time);
  [(BKAVAudiobookChapter *)self duration];
  v10 = +[NSString stringWithFormat:@"<%@:%p title=%@ author=%@ customTitle=%@ range=(%.1lf,%.1lf)>", v4, self, v5, v6, v7, *(void *)&Seconds, v9];

  return (NSString *)v10;
}

- (CGImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(CGImage *)a3
{
  self->_artwork = a3;
}

- (unint64_t)albumTrackNumber
{
  return self->albumTrackNumber;
}

- (void)setAlbumTrackNumber:(unint64_t)a3
{
  self->albumTrackNumber = a3;
}

- (unint64_t)albumTrackCount
{
  return self->albumTrackCount;
}

- ($0B718382DA70737603D0A6F6091C33EE)timeRangeInTrack
{
  long long v3 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var0;
  return self;
}

- (void)setTimeRangeInTrack:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->timeRangeInTrack.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->timeRangeInTrack.duration.timescale = v4;
  *(_OWORD *)&self->timeRangeInTrack.start.value = v3;
}

- (NSURL)assetURL
{
  return self->assetURL;
}

- (NSString)author
{
  return self->author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)customTitle
{
  return self->customTitle;
}

- (void)setCustomTitle:(id)a3
{
}

- (NSDate)dateLastOpened
{
  return self->dateLastOpened;
}

- (void)setDateLastOpened:(id)a3
{
}

- (double)duration
{
  return self->duration;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- ($0B718382DA70737603D0A6F6091C33EE)timeRangeInAudiobook
{
  long long v3 = *(_OWORD *)&self[3].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var0.var0;
  return self;
}

- (void)setTimeRangeInAudiobook:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->timeRangeInAudiobook.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->timeRangeInAudiobook.duration.timescale = v4;
  *(_OWORD *)&self->timeRangeInAudiobook.start.value = v3;
}

- (BKAudiobookTrack)track
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_track);

  return (BKAudiobookTrack *)WeakRetained;
}

- (void)setTrack:(id)a3
{
}

- (int64_t)metadataType
{
  return self->metadataType;
}

- (void)setMetadataType:(int64_t)a3
{
  self->metadataType = a3;
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)type
{
  return self->type;
}

- (void)setType:(int64_t)a3
{
  self->type = a3;
}

- (BOOL)hasAlternateArtwork
{
  return self->_hasAlternateArtwork;
}

- (void)setHasAlternateArtwork:(BOOL)a3
{
  self->_hasAlternateArtwork = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->title, 0);
  objc_destroyWeak((id *)&self->_track);
  objc_storeStrong((id *)&self->dateLastOpened, 0);
  objc_storeStrong((id *)&self->customTitle, 0);
  objc_storeStrong((id *)&self->author, 0);

  objc_storeStrong((id *)&self->assetURL, 0);
}

@end