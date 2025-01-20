@interface BKAVAudiobookTrack
- (BKAVAudiobookTrack)initWithAssetURL:(id)a3;
- (BKAudiobook)audiobook;
- (BOOL)hasAlternateArtwork;
- (BOOL)incrementPlayCountForStopTime:(double)a3;
- (CGImage)artwork;
- (NSArray)chapters;
- (NSDate)dateLastOpened;
- (NSMutableArray)avChapters;
- (NSString)author;
- (NSString)description;
- (NSString)title;
- (NSURL)assetURL;
- (double)bookmarkTime;
- (double)duration;
- (id)alternateArtworkTimes;
- (void)addChapter:(id)a3;
- (void)dealloc;
- (void)setArtwork:(CGImage *)a3;
- (void)setAssetURL:(id)a3;
- (void)setAudiobook:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setDuration:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation BKAVAudiobookTrack

- (BKAVAudiobookTrack)initWithAssetURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKAVAudiobookTrack;
  v6 = [(BKAVAudiobookTrack *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetURL, a3);
    uint64_t v8 = objc_opt_new();
    avChapters = v7->_avChapters;
    v7->_avChapters = (NSMutableArray *)v8;
  }
  return v7;
}

- (void)dealloc
{
  CGImageRelease(self->_artwork);
  v3.receiver = self;
  v3.super_class = (Class)BKAVAudiobookTrack;
  [(BKAVAudiobookTrack *)&v3 dealloc];
}

- (CGImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(CGImage *)a3
{
  self->_artwork = a3;
}

- (BOOL)hasAlternateArtwork
{
  return 0;
}

- (id)alternateArtworkTimes
{
  return &__NSArray0__struct;
}

- (void)addChapter:(id)a3
{
}

- (NSArray)chapters
{
  return (NSArray *)self->_avChapters;
}

- (BOOL)incrementPlayCountForStopTime:(double)a3
{
  return 0;
}

- (NSString)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(BKAVAudiobookTrack *)self assetURL];
  v6 = [(BKAVAudiobookTrack *)self title];
  v7 = [(BKAVAudiobookTrack *)self author];
  uint64_t v8 = [(BKAVAudiobookTrack *)self artwork];
  unsigned int v9 = [(BKAVAudiobookTrack *)self hasAlternateArtwork];
  [(BKAVAudiobookTrack *)self duration];
  objc_super v11 = +[NSMutableString stringWithFormat:@"<%@:%p url=%@ title=%@ author=%@ artwork=%p hasAlternateArtwork=%d duration=%lf chapters=\n", v4, self, v5, v6, v7, v8, v9, v10];

  v12 = (char *)[(NSMutableArray *)self->_avChapters count];
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = v12 - 1;
    do
    {
      v16 = [(NSMutableArray *)self->_avChapters objectAtIndexedSubscript:v14];
      uint64_t v17 = [v16 description];
      v18 = (void *)v17;
      if (v15 == v14) {
        CFStringRef v19 = &stru_100A70340;
      }
      else {
        CFStringRef v19 = @",";
      }
      [v11 appendFormat:@"  %@%@\n", v17, v19];

      ++v14;
    }
    while (v13 != v14);
  }
  [v11 appendFormat:@">"];

  return (NSString *)v11;
}

- (BKAudiobook)audiobook
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->audiobook);

  return (BKAudiobook *)WeakRetained;
}

- (void)setAudiobook:(id)a3
{
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
}

- (double)bookmarkTime
{
  return self->bookmarkTime;
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)author
{
  return self->author;
}

- (void)setAuthor:(id)a3
{
}

- (NSDate)dateLastOpened
{
  return self->dateLastOpened;
}

- (double)duration
{
  return self->duration;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- (NSMutableArray)avChapters
{
  return self->_avChapters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avChapters, 0);
  objc_storeStrong((id *)&self->dateLastOpened, 0);
  objc_storeStrong((id *)&self->author, 0);
  objc_storeStrong((id *)&self->title, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);

  objc_destroyWeak((id *)&self->audiobook);
}

@end