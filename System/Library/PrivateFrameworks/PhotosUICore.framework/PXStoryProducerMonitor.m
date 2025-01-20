@interface PXStoryProducerMonitor
+ (NSDate)currentDateForTesting;
+ (void)setCurrentDateForTesting:(id)a3;
- (BOOL)isLikelyToKeepUp;
- (OS_dispatch_queue)storyQueue;
- (PXStoryProducerMonitor)init;
- (PXStoryProducerMonitor)initWithStoryQueue:(id)a3;
- (PXUpdater)updater;
- (double)currentTime;
- (double)lastTime;
- (double)startTime;
- (float)estimatedFractionCompletedPlaybackSpeed;
- (float)lastFractionCompleted;
- (void)_invalidateIsLikelyToKeepUp;
- (void)_setNeedsUpdate;
- (void)_updateIsLikelyToKeepUp;
- (void)didPerformChanges;
- (void)performChanges:(id)a3;
- (void)producerDidProduceResult:(id)a3;
- (void)reset;
- (void)setEstimatedFractionCompletedPlaybackSpeed:(float)a3;
- (void)setIsLikelyToKeepUp:(BOOL)a3;
- (void)setLastFractionCompleted:(float)a3;
- (void)setLastTime:(double)a3;
- (void)setStartTime:(double)a3;
@end

@implementation PXStoryProducerMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

- (float)lastFractionCompleted
{
  return self->_lastFractionCompleted;
}

- (double)lastTime
{
  return self->_lastTime;
}

- (double)startTime
{
  return self->_startTime;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (BOOL)isLikelyToKeepUp
{
  return self->_isLikelyToKeepUp;
}

- (float)estimatedFractionCompletedPlaybackSpeed
{
  return self->_estimatedFractionCompletedPlaybackSpeed;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)_updateIsLikelyToKeepUp
{
  [(PXStoryProducerMonitor *)self startTime];
  double v4 = v3;
  [(PXStoryProducerMonitor *)self lastTime];
  if (v5 > v4)
  {
    double v6 = v5;
    [(PXStoryProducerMonitor *)self lastFractionCompleted];
    float v8 = v7;
    double v9 = v7 / (v6 - v4);
    [(PXStoryProducerMonitor *)self estimatedFractionCompletedPlaybackSpeed];
    BOOL v11 = v8 >= 1.0 || v9 > v10;
    [(PXStoryProducerMonitor *)self setIsLikelyToKeepUp:v11];
  }
}

- (void)_invalidateIsLikelyToKeepUp
{
  id v2 = [(PXStoryProducerMonitor *)self updater];
  [v2 setNeedsUpdateOf:sel__updateIsLikelyToKeepUp];
}

- (void)_setNeedsUpdate
{
}

- (void)reset
{
  [(PXStoryProducerMonitor *)self currentTime];
  -[PXStoryProducerMonitor setStartTime:](self, "setStartTime:");
  [(PXStoryProducerMonitor *)self setLastFractionCompleted:0.0];
  [(PXStoryProducerMonitor *)self setEstimatedFractionCompletedPlaybackSpeed:0.0];
}

- (void)producerDidProduceResult:(id)a3
{
  id v6 = a3;
  if ([v6 isDegraded])
  {
    double v5 = [v6 fractionCompleted];
    [v5 floatValue];
    -[PXStoryProducerMonitor setLastFractionCompleted:](self, "setLastFractionCompleted:");
  }
  else
  {
    LODWORD(v4) = 1.0;
    [(PXStoryProducerMonitor *)self setLastFractionCompleted:v4];
  }
  [(PXStoryProducerMonitor *)self currentTime];
  -[PXStoryProducerMonitor setLastTime:](self, "setLastTime:");
}

- (void)setEstimatedFractionCompletedPlaybackSpeed:(float)a3
{
  if (self->_estimatedFractionCompletedPlaybackSpeed != a3)
  {
    self->_estimatedFractionCompletedPlaybackSpeed = a3;
    [(PXStoryProducerMonitor *)self _invalidateIsLikelyToKeepUp];
  }
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryProducerMonitor;
  [(PXStoryProducerMonitor *)&v4 didPerformChanges];
  double v3 = [(PXStoryProducerMonitor *)self updater];
  [v3 updateIfNeeded];
}

- (double)currentTime
{
  id v2 = +[PXStoryProducerMonitor currentDateForTesting];
  double v3 = v2;
  if (!v2) {
    id v2 = (void *)MEMORY[0x1E4F1C9C8];
  }
  [v2 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return v5;
}

- (void)setIsLikelyToKeepUp:(BOOL)a3
{
  if (self->_isLikelyToKeepUp != a3)
  {
    self->_isLikelyToKeepUp = a3;
    [(PXStoryProducerMonitor *)self signalChange:1];
  }
}

- (void)setLastTime:(double)a3
{
  if (self->_lastTime != a3)
  {
    self->_lastTime = a3;
    [(PXStoryProducerMonitor *)self _invalidateIsLikelyToKeepUp];
  }
}

- (void)setStartTime:(double)a3
{
  if (self->_startTime != a3)
  {
    self->_startTime = a3;
    [(PXStoryProducerMonitor *)self _invalidateIsLikelyToKeepUp];
  }
}

- (void)setLastFractionCompleted:(float)a3
{
  if (self->_lastFractionCompleted != a3)
  {
    self->_lastFractionCompleted = a3;
    [(PXStoryProducerMonitor *)self _invalidateIsLikelyToKeepUp];
  }
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  double v5 = [(PXStoryProducerMonitor *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryProducerMonitor;
  [(PXStoryProducerMonitor *)&v6 performChanges:v4];
}

- (PXStoryProducerMonitor)initWithStoryQueue:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryProducerMonitor;
  double v5 = [(PXStoryProducerMonitor *)&v14 init];
  if (v5)
  {
    if (v4)
    {
      objc_super v6 = (OS_dispatch_queue *)v4;
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v6;
    }
    else
    {
      float v8 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v9 = MEMORY[0x1E4F14428];
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v8;
    }

    [(PXStoryProducerMonitor *)v5 currentTime];
    v5->_startTime = v10;
    uint64_t v11 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v5 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v5->_updater;
    v5->_updater = (PXUpdater *)v11;

    [(PXUpdater *)v5->_updater addUpdateSelector:sel__updateIsLikelyToKeepUp];
  }

  return v5;
}

- (PXStoryProducerMonitor)init
{
  return [(PXStoryProducerMonitor *)self initWithStoryQueue:0];
}

+ (void)setCurrentDateForTesting:(id)a3
{
}

+ (NSDate)currentDateForTesting
{
  return (NSDate *)(id)_currentDateForTesting;
}

@end