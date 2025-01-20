@interface PNWallpaperCrop
- (BOOL)passesClockOverlap;
- (PNWallpaperCrop)initWithAsset:(id)a3 orientation:(int64_t)a4 classification:(unint64_t)a5;
- (double)cropScore;
- (double)cropZoomRatio;
- (id)description;
@end

@implementation PNWallpaperCrop

- (double)cropZoomRatio
{
  return self->_cropZoomRatio;
}

- (BOOL)passesClockOverlap
{
  return self->_passesClockOverlap;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (id)description
{
  v3 = NSString;
  [(PNWallpaperCrop *)self cropScore];
  uint64_t v5 = v4;
  [(PNWallpaperCrop *)self cropZoomRatio];
  return (id)[v3 stringWithFormat:@"{cropScore:%.3f, cropZoomRatio:%.3f, passesClockOverlap:%d}", v5, v6, -[PNWallpaperCrop passesClockOverlap](self, "passesClockOverlap")];
}

- (PNWallpaperCrop)initWithAsset:(id)a3 orientation:(int64_t)a4 classification:(unint64_t)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PNWallpaperCrop;
  v9 = [(PNWallpaperCrop *)&v12 init];
  if (v9)
  {
    +[PNSuggestionWallpaperUtilities cropScoreWithAsset:v8 classification:a5 passesClockOverlap:&v9->_passesClockOverlap cropZoomRatio:&v9->_cropZoomRatio orientation:a4];
    v9->_cropScore = v10;
  }

  return v9;
}

@end