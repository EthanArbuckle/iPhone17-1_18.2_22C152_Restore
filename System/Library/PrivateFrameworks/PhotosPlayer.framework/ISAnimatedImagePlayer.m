@interface ISAnimatedImagePlayer
- (BOOL)_anyDestinationIsReady;
- (BOOL)_shouldAnimate;
- (BOOL)allowFrameDrops;
- (BOOL)isPlaying;
- (CGImage)currentImage;
- (ISAnimatedImagePlayer)initWithAnimatedImage:(id)a3;
- (PFAnimatedImage)animatedImage;
- (unint64_t)displayedFrameIndex;
- (void)_notifyDestinationsOfAnimationEnd;
- (void)_notifyDestinationsOfAnimationStart;
- (void)_notifyDestinationsOfFrameChange;
- (void)_resetAnimationState;
- (void)_seekToBeginning;
- (void)_setCurrentFrame:(CGImage *)a3;
- (void)animationTimerFired:(double)a3;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)registerDestination:(id)a3;
- (void)setAllowFrameDrops:(BOOL)a3;
- (void)setCurrentImage:(CGImage *)a3;
- (void)setDisplayedFrameIndex:(unint64_t)a3;
- (void)setPlaying:(BOOL)a3;
- (void)unregisterDestination:(id)a3;
- (void)updateAnimation;
@end

@implementation ISAnimatedImagePlayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_weakDestinations, 0);
}

- (void)setCurrentImage:(CGImage *)a3
{
  self->_currentImage = a3;
}

- (void)setAllowFrameDrops:(BOOL)a3
{
  self->_allowFrameDrops = a3;
}

- (BOOL)allowFrameDrops
{
  return self->_allowFrameDrops;
}

- (unint64_t)displayedFrameIndex
{
  return self->_displayedFrameIndex;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)animationTimerFired:(double)a3
{
  if ([(ISAnimatedImagePlayer *)self _shouldAnimate])
  {
    if (!self->_hasStartedAnimating)
    {
      self->_double timeAccumulator = 0.0;
      self->_previousFrameTime = a3;
      self->_hasStartedAnimating = 1;
    }
    [(PFAnimatedImage *)self->_image frameDelayAtIndex:self->_displayedFrameIndex];
    double v6 = v5;
    v7 = [(PFAnimatedImage *)self->_image frameCache];
    uint64_t v8 = [v7 frameAtIndexIfReady:self->_displayedFrameIndex];

    if (v8)
    {
      [(ISAnimatedImagePlayer *)self _setCurrentFrame:v8];
      double timeAccumulator = self->_timeAccumulator + a3 - self->_previousFrameTime;
      self->_double timeAccumulator = timeAccumulator;
      self->_previousFrameTime = a3;
      if (timeAccumulator >= fmax(v6 + 1.0, 5.0))
      {
        self->_double timeAccumulator = 0.0;
        double timeAccumulator = 0.0;
      }
      if (timeAccumulator >= v6)
      {
        v10 = MEMORY[0x1E4F14428];
        do
        {
          double v11 = timeAccumulator - v6;
          if (!self->_allowFrameDrops) {
            double v11 = 0.0;
          }
          self->_double timeAccumulator = v11;
          unint64_t v12 = self->_displayedFrameIndex + 1;
          self->_displayedFrameIndex = v12;
          if (v12 >= [(PFAnimatedImage *)self->_image frameCount])
          {
            self->_displayedFrameIndex = 0;
            if (!self->_infiniteLoop)
            {
              unint64_t v13 = self->_remainingLoopCount - 1;
              self->_remainingLoopCount = v13;
              if (!v13)
              {
                self->_hasFinishedAnimating = 1;
                v14 = ISGetLog();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1DB21E000, v14, OS_LOG_TYPE_INFO, "ISAnimatedImagePlayer: Reached end of loop. Stopping", buf, 2u);
                }

                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __45__ISAnimatedImagePlayer_animationTimerFired___block_invoke;
                block[3] = &unk_1E6BECD80;
                block[4] = self;
                dispatch_async(v10, block);
              }
            }
          }
          double timeAccumulator = self->_timeAccumulator;
        }
        while (timeAccumulator >= v6);
      }
    }
    else
    {
      v15 = ISGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1DB21E000, v15, OS_LOG_TYPE_DEBUG, "ISAnimatedImagePlayer: Dropped a frame", buf, 2u);
      }
    }
  }
}

uint64_t __45__ISAnimatedImagePlayer_animationTimerFired___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAnimation];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if (a4)
  {
    [a3 timestamp];
    -[ISAnimatedImagePlayer animationTimerFired:](self, "animationTimerFired:");
  }
}

- (void)updateAnimation
{
  BOOL v3 = [(ISAnimatedImagePlayer *)self _shouldAnimate];
  timer = self->_timer;
  if (v3)
  {
    if (!timer)
    {
      uint64_t v5 = +[ISAnimatedImageTimer sharedTimer];
      double v6 = self->_timer;
      self->_timer = v5;

      [(ISObservable *)self->_timer registerChangeObserver:self context:0];
      [(ISAnimatedImagePlayer *)self _notifyDestinationsOfAnimationStart];
    }
  }
  else if (timer)
  {
    [(ISObservable *)timer unregisterChangeObserver:self context:0];
    v7 = self->_timer;
    self->_timer = 0;

    [(ISAnimatedImagePlayer *)self _resetAnimationState];
    [(ISAnimatedImagePlayer *)self _notifyDestinationsOfAnimationEnd];
  }
}

- (void)_resetAnimationState
{
  *(_WORD *)&self->_hasStartedAnimating = 0;
  self->_double timeAccumulator = 0.0;
  self->_infiniteLoop = [(PFAnimatedImage *)self->_image loopCount] == 0;
  self->_remainingLoopCount = [(PFAnimatedImage *)self->_image loopCount];
}

- (BOOL)_shouldAnimate
{
  image = self->_image;
  if (!image) {
    return 0;
  }
  unint64_t v4 = [(PFAnimatedImage *)image frameCount];
  BOOL v5 = self->_playing && v4 >= 2;
  if (!v5 || self->_hasFinishedAnimating) {
    return 0;
  }

  return [(ISAnimatedImagePlayer *)self _anyDestinationIsReady];
}

- (void)setDisplayedFrameIndex:(unint64_t)a3
{
  if (self->_displayedFrameIndex != a3)
  {
    self->_displayedFrameIndex = a3;
    id v4 = [(PFAnimatedImage *)self->_image frameCache];
    -[ISAnimatedImagePlayer _setCurrentFrame:](self, "_setCurrentFrame:", [v4 frameAtIndex:self->_displayedFrameIndex]);
    [(ISAnimatedImagePlayer *)self _resetAnimationState];
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    [(ISAnimatedImagePlayer *)self _resetAnimationState];
    [(ISAnimatedImagePlayer *)self updateAnimation];
  }
}

- (void)_setCurrentFrame:(CGImage *)a3
{
  if (self->_currentImage != a3)
  {
    CGImageRetain(a3);
    CGImageRelease(self->_currentImage);
    self->_currentImage = a3;
    [(ISAnimatedImagePlayer *)self _notifyDestinationsOfFrameChange];
  }
}

- (CGImage)currentImage
{
  return self->_currentImage;
}

- (void)_seekToBeginning
{
  image = self->_image;
  if (!image)
  {
LABEL_4:
    id v5 = [(PFAnimatedImage *)image frameCache];
    self->_displayedFrameIndex = 0;
    -[ISAnimatedImagePlayer _setCurrentFrame:](self, "_setCurrentFrame:", [v5 frameAtIndex:0]);
    [(ISAnimatedImagePlayer *)self _resetAnimationState];

    return;
  }
  if ([(PFAnimatedImage *)image frameCount])
  {
    image = self->_image;
    goto LABEL_4;
  }
  id v4 = ISGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DB21E000, v4, OS_LOG_TYPE_ERROR, "ISAnimatedImagePlayer: Attempted to seek an empty PFAnimatedImage to the beginning", buf, 2u);
  }
}

- (BOOL)_anyDestinationIsReady
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_weakDestinations;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "animatedImagePlayerIsReadyToDisplay:", self, (void)v10))
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (void)_notifyDestinationsOfAnimationEnd
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = self->_weakDestinations;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "animatedImagePlayerDidEndAnimating:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyDestinationsOfAnimationStart
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = self->_weakDestinations;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "animatedImagePlayerDidBeginAnimating:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyDestinationsOfFrameChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_weakDestinations;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "animatedImagePlayerFrameDidChange:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)unregisterDestination:(id)a3
{
  [(NSHashTable *)self->_weakDestinations removeObject:a3];

  [(ISAnimatedImagePlayer *)self updateAnimation];
}

- (void)registerDestination:(id)a3
{
  weakDestinations = self->_weakDestinations;
  id v5 = a3;
  [(NSHashTable *)weakDestinations addObject:v5];
  [v5 animatedImagePlayerFrameDidChange:self];

  [(ISAnimatedImagePlayer *)self updateAnimation];
}

- (PFAnimatedImage)animatedImage
{
  return self->_image;
}

- (void)dealloc
{
  CGImageRelease(self->_currentImage);
  self->_currentImage = 0;
  [(ISObservable *)self->_timer unregisterChangeObserver:self context:0];
  v3.receiver = self;
  v3.super_class = (Class)ISAnimatedImagePlayer;
  [(ISAnimatedImagePlayer *)&v3 dealloc];
}

- (ISAnimatedImagePlayer)initWithAnimatedImage:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ISAnimatedImagePlayer;
  uint64_t v6 = [(ISAnimatedImagePlayer *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    weakDestinations = v7->_weakDestinations;
    v7->_weakDestinations = (NSHashTable *)v8;

    v7->_allowFrameDrops = 1;
    [(ISAnimatedImagePlayer *)v7 _seekToBeginning];
  }

  return v7;
}

@end