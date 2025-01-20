@interface SUUIPlayButtonImageCache
+ (id)imageCacheForStyle:(int64_t)a3;
- (SUUIPlayButtonImageCache)initWithStyle:(int64_t)a3;
- (UIImage)pauseImage;
- (UIImage)playImage;
- (UIImage)stopImage;
- (void)preloadImages;
@end

@implementation SUUIPlayButtonImageCache

+ (id)imageCacheForStyle:(int64_t)a3
{
  if (imageCacheForStyle__onceToken != -1) {
    dispatch_once(&imageCacheForStyle__onceToken, &__block_literal_global_66);
  }
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(id)imageCacheForStyle__sharedCaches objectForKey:v4];
  if (!v5)
  {
    v5 = [[SUUIPlayButtonImageCache alloc] initWithStyle:a3];
    [(id)imageCacheForStyle__sharedCaches setObject:v5 forKey:v4];
  }

  return v5;
}

uint64_t __47__SUUIPlayButtonImageCache_imageCacheForStyle___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)imageCacheForStyle__sharedCaches;
  imageCacheForStyle__sharedCaches = (uint64_t)v0;

  v2 = (void *)imageCacheForStyle__sharedCaches;
  return [v2 setName:@"com.apple.iTunesStoreUI.SUUIPlayButtonImageCache.imageCacheForStyle"];
}

- (SUUIPlayButtonImageCache)initWithStyle:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SUUIPlayButtonImageCache;
  v4 = [(SUUIPlayButtonImageCache *)&v17 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  v4->_imageLock._os_unfair_lock_opaque = 0;
  uint64_t v6 = SUUIBundle();
  bundle = v5->_bundle;
  v5->_bundle = (NSBundle *)v6;

  if (a3 == 2)
  {
    playImageName = v5->_playImageName;
    v9 = @"UniversalRadioButtonPlayIcon";
  }
  else
  {
    if (a3 == 1)
    {
      v12 = v5->_playImageName;
      v5->_playImageName = (NSString *)@"UniversaliPadPlayButtonPlayIcon";

      pauseImageName = v5->_pauseImageName;
      v11 = @"UniversaliPadPlayButtonPauseIcon";
      goto LABEL_9;
    }
    if (a3) {
      goto LABEL_10;
    }
    playImageName = v5->_playImageName;
    v9 = @"UniversalEncapsulatedPlayButtonPlayIcon";
  }
  v5->_playImageName = &v9->isa;

  pauseImageName = v5->_pauseImageName;
  v11 = @"UniversalPlayButtonPauseIcon";
LABEL_9:
  v5->_pauseImageName = &v11->isa;

  stopImageName = v5->_stopImageName;
  v5->_stopImageName = (NSString *)@"UniversalPlayButtonStopIcon";

LABEL_10:
  if (!v5->_playImage)
  {
    uint64_t v14 = [MEMORY[0x263F827E8] imageNamed:v5->_playImageName inBundle:v5->_bundle];
    playImage = v5->_playImage;
    v5->_playImage = (UIImage *)v14;
  }
  return v5;
}

- (UIImage)playImage
{
  playImage = self->_playImage;
  if (!playImage)
  {
    os_unfair_lock_lock(&self->_imageLock);
    if (!self->_playImage)
    {
      v4 = [MEMORY[0x263F827E8] imageNamed:self->_playImageName inBundle:self->_bundle];
      v5 = self->_playImage;
      self->_playImage = v4;
    }
    os_unfair_lock_unlock(&self->_imageLock);
    playImage = self->_playImage;
  }
  return playImage;
}

- (UIImage)pauseImage
{
  pauseImage = self->_pauseImage;
  if (!pauseImage)
  {
    os_unfair_lock_lock(&self->_imageLock);
    if (!self->_pauseImage)
    {
      v4 = [MEMORY[0x263F827E8] imageNamed:self->_pauseImageName inBundle:self->_bundle];
      v5 = self->_pauseImage;
      self->_pauseImage = v4;
    }
    os_unfair_lock_unlock(&self->_imageLock);
    pauseImage = self->_pauseImage;
  }
  return pauseImage;
}

- (UIImage)stopImage
{
  stopImage = self->_stopImage;
  if (!stopImage)
  {
    os_unfair_lock_lock(&self->_imageLock);
    if (!self->_stopImage)
    {
      v4 = [MEMORY[0x263F827E8] imageNamed:self->_stopImageName inBundle:self->_bundle];
      v5 = self->_stopImage;
      self->_stopImage = v4;
    }
    os_unfair_lock_unlock(&self->_imageLock);
    stopImage = self->_stopImage;
  }
  return stopImage;
}

- (void)preloadImages
{
  p_imageLock = &self->_imageLock;
  os_unfair_lock_lock(&self->_imageLock);
  if (!self->_playImage)
  {
    v4 = [MEMORY[0x263F827E8] imageNamed:self->_playImageName inBundle:self->_bundle];
    playImage = self->_playImage;
    self->_playImage = v4;
  }
  if (!self->_pauseImage)
  {
    uint64_t v6 = [MEMORY[0x263F827E8] imageNamed:self->_pauseImageName inBundle:self->_bundle];
    pauseImage = self->_pauseImage;
    self->_pauseImage = v6;
  }
  if (!self->_stopImage)
  {
    v8 = [MEMORY[0x263F827E8] imageNamed:self->_stopImageName inBundle:self->_bundle];
    stopImage = self->_stopImage;
    self->_stopImage = v8;
  }
  os_unfair_lock_unlock(p_imageLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopImage, 0);
  objc_storeStrong((id *)&self->_stopImageName, 0);
  objc_storeStrong((id *)&self->_pauseImage, 0);
  objc_storeStrong((id *)&self->_pauseImageName, 0);
  objc_storeStrong((id *)&self->_playImage, 0);
  objc_storeStrong((id *)&self->_playImageName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end