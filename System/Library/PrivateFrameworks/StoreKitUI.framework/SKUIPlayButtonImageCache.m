@interface SKUIPlayButtonImageCache
+ (id)imageCacheForStyle:(int64_t)a3;
- (SKUIPlayButtonImageCache)initWithStyle:(int64_t)a3;
- (UIImage)pauseImage;
- (UIImage)playImage;
- (UIImage)stopImage;
- (void)preloadImages;
@end

@implementation SKUIPlayButtonImageCache

+ (id)imageCacheForStyle:(int64_t)a3
{
  if (imageCacheForStyle__onceToken != -1) {
    dispatch_once(&imageCacheForStyle__onceToken, &__block_literal_global_48);
  }
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(id)imageCacheForStyle__sharedCaches objectForKey:v4];
  if (!v5)
  {
    v5 = [[SKUIPlayButtonImageCache alloc] initWithStyle:a3];
    [(id)imageCacheForStyle__sharedCaches setObject:v5 forKey:v4];
  }

  return v5;
}

uint64_t __47__SKUIPlayButtonImageCache_imageCacheForStyle___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)imageCacheForStyle__sharedCaches;
  imageCacheForStyle__sharedCaches = (uint64_t)v0;

  v2 = (void *)imageCacheForStyle__sharedCaches;

  return [v2 setName:@"com.apple.StoreKitUI.SKUIPlayButtonImageCache.imageCacheForStyle"];
}

- (SKUIPlayButtonImageCache)initWithStyle:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIPlayButtonImageCache initWithStyle:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIPlayButtonImageCache;
  v5 = [(SKUIPlayButtonImageCache *)&v18 init];
  v6 = v5;
  if (v5)
  {
    v5->_imageLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = SKUIBundle();
    bundle = v6->_bundle;
    v6->_bundle = (NSBundle *)v7;

    if (a3 == 2)
    {
      playImageName = v6->_playImageName;
      v10 = @"UniversalRadioButtonPlayIcon";
    }
    else
    {
      if (a3 == 1)
      {
        v13 = v6->_playImageName;
        v6->_playImageName = (NSString *)@"UniversaliPadPlayButtonPlayIcon";

        pauseImageName = v6->_pauseImageName;
        v12 = @"UniversaliPadPlayButtonPauseIcon";
        goto LABEL_13;
      }
      if (a3) {
        goto LABEL_14;
      }
      playImageName = v6->_playImageName;
      v10 = @"UniversalEncapsulatedPlayButtonPlayIcon";
    }
    v6->_playImageName = &v10->isa;

    pauseImageName = v6->_pauseImageName;
    v12 = @"UniversalPlayButtonPauseIcon";
LABEL_13:
    v6->_pauseImageName = &v12->isa;

    stopImageName = v6->_stopImageName;
    v6->_stopImageName = (NSString *)@"UniversalPlayButtonStopIcon";

LABEL_14:
    if (!v6->_playImage)
    {
      uint64_t v15 = [MEMORY[0x1E4FB1818] imageNamed:v6->_playImageName inBundle:v6->_bundle];
      playImage = v6->_playImage;
      v6->_playImage = (UIImage *)v15;
    }
  }
  return v6;
}

- (UIImage)playImage
{
  playImage = self->_playImage;
  if (!playImage)
  {
    os_unfair_lock_lock(&self->_imageLock);
    if (!self->_playImage)
    {
      v4 = [MEMORY[0x1E4FB1818] imageNamed:self->_playImageName inBundle:self->_bundle];
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
      v4 = [MEMORY[0x1E4FB1818] imageNamed:self->_pauseImageName inBundle:self->_bundle];
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
      v4 = [MEMORY[0x1E4FB1818] imageNamed:self->_stopImageName inBundle:self->_bundle];
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
    v4 = [MEMORY[0x1E4FB1818] imageNamed:self->_playImageName inBundle:self->_bundle];
    playImage = self->_playImage;
    self->_playImage = v4;
  }
  if (!self->_pauseImage)
  {
    v6 = [MEMORY[0x1E4FB1818] imageNamed:self->_pauseImageName inBundle:self->_bundle];
    pauseImage = self->_pauseImage;
    self->_pauseImage = v6;
  }
  if (!self->_stopImage)
  {
    v8 = [MEMORY[0x1E4FB1818] imageNamed:self->_stopImageName inBundle:self->_bundle];
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

- (void)initWithStyle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPlayButtonImageCache initWithStyle:]";
}

@end