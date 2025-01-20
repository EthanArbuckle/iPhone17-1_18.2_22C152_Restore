@interface THWMovieInfo
- (CGImage)stoppedImage;
- (Class)layoutClass;
- (Class)repClass;
- (NSString)progressKitID;
- (NSString)progressKitSectionID;
- (THWAutoplayConfig)autoplayConfig;
- (THWMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5;
- (THWMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 movieRemoteURL:(id)a6 loadedAsset:(id)a7;
- (TSDImageInfo)posterImageInfo;
- (double)stoppedTime;
- (float)stoppedVolume;
- (id)childInfos;
- (void)dealloc;
- (void)setAutoplayConfig:(id)a3;
- (void)setPosterImageInfo:(id)a3;
- (void)setProgressKitID:(id)a3;
- (void)setProgressKitSectionID:(id)a3;
- (void)setStoppedImage:(CGImage *)a3;
- (void)setStoppedTime:(double)a3;
- (void)setStoppedVolume:(float)a3;
@end

@implementation THWMovieInfo

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (THWMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)THWMovieInfo;
  v5 = [(THWMovieInfo *)&v9 initWithContext:a3 geometry:a4 style:a5];
  v6 = v5;
  if (v5)
  {
    [(THWMovieInfo *)v5 setAllowsAirPlayVideo:1];
    [(THWMovieInfo *)v6 setUsesAirPlayVideoWhileAirPlayScreenIsActive:1];
    LODWORD(v7) = 1.0;
    [(THWMovieInfo *)v6 setStoppedVolume:v7];
  }
  return v6;
}

- (THWMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 movieRemoteURL:(id)a6 loadedAsset:(id)a7
{
  if (a7)
  {
    [a7 duration];
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  [a7 tracks];
  v17.receiver = self;
  v17.super_class = (Class)THWMovieInfo;
  v13 = [(THWMovieInfo *)&v17 initWithContext:a3 geometry:a4 style:a5 movieRemoteURL:a6 loadedAsset:a7];
  v14 = v13;
  if (v13)
  {
    [(THWMovieInfo *)v13 setAllowsAirPlayVideo:1];
    [(THWMovieInfo *)v14 setUsesAirPlayVideoWhileAirPlayScreenIsActive:1];
    LODWORD(v15) = 1.0;
    [(THWMovieInfo *)v14 setStoppedVolume:v15];
  }
  return v14;
}

- (void)dealloc
{
  CGImageRelease(self->_stoppedImage);
  v3.receiver = self;
  v3.super_class = (Class)THWMovieInfo;
  [(THWMovieInfo *)&v3 dealloc];
}

- (void)setStoppedImage:(CGImage *)a3
{
  CGImageRelease(self->_stoppedImage);
  self->_stoppedImage = a3;

  CGImageRetain(a3);
}

- (CGImage)stoppedImage
{
  return self->_stoppedImage;
}

- (void)setPosterImageInfo:(id)a3
{
  posterImageInfo = self->_posterImageInfo;
  if (posterImageInfo != a3)
  {
    [(TSDImageInfo *)posterImageInfo setParentInfo:0];

    v6 = (TSDImageInfo *)a3;
    self->_posterImageInfo = v6;
    [(TSDImageInfo *)v6 setParentInfo:self];
  }
}

- (id)childInfos
{
  id result = [(THWMovieInfo *)self posterImageInfo];
  if (result)
  {
    v4 = [(THWMovieInfo *)self posterImageInfo];
    return +[NSArray arrayWithObject:v4];
  }
  return result;
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
}

- (TSDImageInfo)posterImageInfo
{
  return self->_posterImageInfo;
}

- (double)stoppedTime
{
  return self->_stoppedTime;
}

- (void)setStoppedTime:(double)a3
{
  self->_stoppedTime = a3;
}

- (float)stoppedVolume
{
  return self->_stoppedVolume;
}

- (void)setStoppedVolume:(float)a3
{
  self->_stoppedVolume = a3;
}

- (THWAutoplayConfig)autoplayConfig
{
  return self->_autoplayConfig;
}

- (void)setAutoplayConfig:(id)a3
{
}

@end