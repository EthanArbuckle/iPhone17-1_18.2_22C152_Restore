@interface RCDisplayLinkManager
+ (RCDisplayLinkManager)sharedManager;
- (BOOL)paused;
- (CAFrameRateRange)preferredFrameRateRange;
- (RCDisplayLinkManager)init;
- (RCTimeController)timeController;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_displayLinkDidUpdate:(id)a3;
- (void)_pauseDisplayLink;
- (void)_startDisplayLinkIfNeeded;
- (void)addDisplayLinkObserver:(id)a3;
- (void)removeDisplayLinkObserver:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3;
- (void)setTimeController:(id)a3;
@end

@implementation RCDisplayLinkManager

- (void)_pauseDisplayLink
{
  if (![(CADisplayLink *)self->_displayLink isPaused])
  {
    v3 = OSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10016C56C(v3);
    }

    [(CADisplayLink *)self->_displayLink setPaused:1];
  }
}

- (RCDisplayLinkManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)RCDisplayLinkManager;
  v2 = [(RCDisplayLinkManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[CADisplayLink displayLinkWithTarget:v2 selector:"_displayLinkDidUpdate:"];
    displayLink = v2->_displayLink;
    v2->_displayLink = (CADisplayLink *)v3;

    v5 = v2->_displayLink;
    v6 = +[NSRunLoop mainRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:NSRunLoopCommonModes];

    [(RCDisplayLinkManager *)v2 _pauseDisplayLink];
    v7 = +[NSNotificationCenter defaultCenter];
    v8 = +[UIApplication sharedApplication];
    [v7 addObserver:v2 selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:v8];
    [v7 addObserver:v2 selector:"_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:v8];
    uint64_t v9 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;
  }
  return v2;
}

- (void)setTimeController:(id)a3
{
}

- (void)_startDisplayLinkIfNeeded
{
  if ([(NSHashTable *)self->_observers count] && [(CADisplayLink *)self->_displayLink isPaused])
  {
    uint64_t v3 = OSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10016C5F0(v3);
    }

    [(CADisplayLink *)self->_displayLink setPaused:0];
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
}

+ (RCDisplayLinkManager)sharedManager
{
  if (qword_10026A7F8 != -1) {
    dispatch_once(&qword_10026A7F8, &stru_100222458);
  }
  v2 = (void *)qword_10026A7F0;

  return (RCDisplayLinkManager *)v2;
}

- (void)setPaused:(BOOL)a3
{
  if (a3) {
    [(RCDisplayLinkManager *)self _pauseDisplayLink];
  }
  else {
    [(RCDisplayLinkManager *)self _startDisplayLinkIfNeeded];
  }
}

- (BOOL)paused
{
  return [(CADisplayLink *)self->_displayLink isPaused];
}

- (void)addDisplayLinkObserver:(id)a3
{
  [(NSHashTable *)self->_observers addObject:a3];

  [(RCDisplayLinkManager *)self _startDisplayLinkIfNeeded];
}

- (void)removeDisplayLinkObserver:(id)a3
{
  [(NSHashTable *)self->_observers removeObject:a3];
  if (![(NSHashTable *)self->_observers count])
  {
    [(RCDisplayLinkManager *)self _pauseDisplayLink];
  }
}

- (void)_displayLinkDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self->_timeController;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(NSHashTable *)self->_observers allObjects];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) displayLinkDidUpdate:v4 withTimeController:v5];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  [(CADisplayLink *)self->_displayLink preferredFrameRateRange];
  v12.float minimum = minimum;
  v12.float maximum = maximum;
  v12.float preferred = preferred;
  if (!CAFrameRateRangeIsEqualToRange(v11, v12))
  {
    *(float *)&double v7 = minimum;
    *(float *)&double v8 = maximum;
    *(float *)&double v9 = preferred;
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", v7, v8, v9);
    v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10016C674(v10, preferred);
    }
  }
}

- (CAFrameRateRange)preferredFrameRateRange
{
  [(CADisplayLink *)self->_displayLink preferredFrameRateRange];
  result.float preferred = v4;
  result.float maximum = v3;
  result.float minimum = v2;
  return result;
}

- (RCTimeController)timeController
{
  return self->_timeController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeController, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end