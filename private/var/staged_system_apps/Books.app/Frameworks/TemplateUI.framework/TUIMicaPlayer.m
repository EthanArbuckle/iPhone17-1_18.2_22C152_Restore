@interface TUIMicaPlayer
+ (BOOL)BOOLFromDictionary:(id)a3 key:(id)a4 defaultValue:(BOOL)a5;
+ (id)rootDictForPath:(id)a3 fileProvider:(id)a4;
+ (id)updatePublishedObjects:(id)a3 toReferenceLayersInTree:(id)a4 ratherThanLayersInTree:(id)a5;
- (BOOL)isPlaybackAtEnd;
- (BOOL)isPlaying;
- (BOOL)loopDuringPlayback;
- (CALayer)rootLayer;
- (MicaPlayerDelegate)delegate;
- (NSDictionary)publishedObjects;
- (NSString)path;
- (NSTimer)playTimer;
- (TUIMicaPlayer)initWithFileName:(id)a3 retinaScale:(double)a4;
- (TUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4;
- (TUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 fileProvider:(id)a5;
- (TUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 rootLayer:(id)a5 publishedObjects:(id)a6;
- (double)documentDuration;
- (double)playbackTime;
- (double)retinaScale;
- (float)preferredPlaybackSpeed;
- (id)_initWithPath:(id)a3 retinaScale:(double)a4 rootDict:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)publishedLayerWithKey:(id)a3 required:(BOOL)a4;
- (id)publishedObjectWithKey:(id)a3 required:(BOOL)a4;
- (void)addToLayer:(id)a3 onTop:(BOOL)a4 gravity:(id)a5;
- (void)dealloc;
- (void)moveAndResizeWithinParentLayer:(id)a3 usingGravity:(id)a4 animate:(BOOL)a5;
- (void)notifyDelegateDidChangePlaybackTime;
- (void)notifyDelegateDidStartPlaying;
- (void)notifyDelegateDidStopPlaying;
- (void)pause;
- (void)play;
- (void)removeFromSuperlayer;
- (void)runPlayTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentDuration:(double)a3;
- (void)setLoopDuringPlayback:(BOOL)a3;
- (void)setPath:(id)a3;
- (void)setPlayTimer:(id)a3;
- (void)setPlaybackTime:(double)a3;
- (void)setPreferredPlaybackSpeed:(float)a3;
- (void)setPublishedObjects:(id)a3;
- (void)setRetinaScale:(double)a3;
- (void)setRootLayer:(id)a3;
- (void)startPlayTimer;
- (void)stopPlayTimer;
@end

@implementation TUIMicaPlayer

- (TUIMicaPlayer)initWithFileName:(id)a3 retinaScale:(double)a4
{
  id v6 = a3;
  v7 = +[NSBundle mainBundle];
  v8 = [v7 URLForResource:v6 withExtension:@"caar"];

  if (v8)
  {
    v9 = [v8 path];
    v10 = [(TUIMicaPlayer *)self initWithPath:v9 retinaScale:a4];
    self = v9;
  }
  else
  {
    NSLog(@"Unable to find Mica document: %@", v6);
    v10 = 0;
  }

  return v10;
}

- (TUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4
{
  id v6 = a3;
  v7 = +[TUIMicaPlayer rootDictForPath:v6 fileProvider:0];
  v8 = [(TUIMicaPlayer *)self _initWithPath:v6 retinaScale:v7 rootDict:a4];

  return v8;
}

- (TUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 rootLayer:(id)a5 publishedObjects:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)TUIMicaPlayer;
  v13 = [(TUIMicaPlayer *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(TUIMicaPlayer *)v13 setPath:v10];
    [(TUIMicaPlayer *)v14 setRootLayer:v11];
    [(TUIMicaPlayer *)v14 setPublishedObjects:v12];
    LODWORD(v15) = 1.0;
    [(TUIMicaPlayer *)v14 setPreferredPlaybackSpeed:v15];
    [(TUIMicaPlayer *)v14 setRetinaScale:a4];
    [v11 duration];
    -[TUIMicaPlayer setDocumentDuration:](v14, "setDocumentDuration:");
    [(CALayer *)v14->_rootLayer setDuration:INFINITY];
  }

  return v14;
}

- (TUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 fileProvider:(id)a5
{
  id v8 = a3;
  v9 = +[TUIMicaPlayer rootDictForPath:v8 fileProvider:a5];
  id v10 = [(TUIMicaPlayer *)self _initWithPath:v8 retinaScale:v9 rootDict:a4];

  return v10;
}

- (void)dealloc
{
  [(TUIMicaPlayer *)self stopPlayTimer];
  v3.receiver = self;
  v3.super_class = (Class)TUIMicaPlayer;
  [(TUIMicaPlayer *)&v3 dealloc];
}

- (id)_initWithPath:(id)a3 retinaScale:(double)a4 rootDict:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (!v9
    || ([v9 objectForKeyedSubscript:@"rootLayer"],
        (id v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_6:
    NSLog(@"Unable to load Mica document with path: %@", v8);
    v14 = 0;
    goto LABEL_7;
  }
  id v12 = v11;
  [v11 setGeometryFlipped:[TUIMicaPlayer BOOLFromDictionary:key:defaultValue:](TUIMicaPlayer, "BOOLFromDictionary:key:defaultValue:", v10, @"geometryFlipped", 0) ^ 1];
  [v12 setMasksToBounds:1];
  [v12 setRepeatCount:0.0];
  v13 = [v10 objectForKeyedSubscript:@"publishedObjects"];
  v14 = [(TUIMicaPlayer *)self initWithPath:v8 retinaScale:v12 rootLayer:v13 publishedObjects:a4];

  if (!v14) {
    goto LABEL_6;
  }
LABEL_7:

  return v14;
}

+ (id)rootDictForPath:(id)a3 fileProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v6)
  {
    if (v5)
    {
      v16 = +[NSURL fileURLWithPath:v5];
      if (v16)
      {
        id v21 = 0;
        id v8 = +[NSData dataWithContentsOfURL:v16 options:1 error:&v21];
        id v17 = v21;
        id v9 = v17;
        if (v17)
        {
          v18 = [v17 localizedDescription];
          NSLog(@"Error: %@", v18);
        }
LABEL_12:

        if (v8) {
          goto LABEL_3;
        }
LABEL_13:
        double v15 = 0;
        id v11 = v9;
        goto LABEL_14;
      }
    }
    else
    {
      v16 = 0;
    }
    id v9 = 0;
    id v8 = 0;
    goto LABEL_12;
  }
  id v8 = [v6 dataFor:v5];
  id v9 = 0;
  if (!v8) {
    goto LABEL_13;
  }
LABEL_3:
  id v20 = v9;
  id v10 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v8 error:&v20];
  id v11 = v20;

  if (v11)
  {
    id v12 = [v11 localizedDescription];
    NSLog(@"Error: %@", v12);
  }
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  v22[3] = objc_opt_class();
  v22[4] = objc_opt_class();
  v13 = +[NSArray arrayWithObjects:v22 count:5];
  v14 = +[NSSet setWithArray:v13];
  double v15 = [v10 decodeObjectOfClasses:v14 forKey:@"root"];

  [v10 finishDecoding];
LABEL_14:

  return v15;
}

+ (BOOL)BOOLFromDictionary:(id)a3 key:(id)a4 defaultValue:(BOOL)a5
{
  id v6 = [a3 objectForKeyedSubscript:a4];
  v7 = v6;
  if (v6) {
    a5 = [v6 BOOLValue];
  }

  return a5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(TUIMicaPlayer *)self path];
  id v6 = [v5 copy];

  v7 = [(TUIMicaPlayer *)self rootLayer];
  id v8 = [v7 tui_deepCopyLayer];

  id v9 = [(TUIMicaPlayer *)self publishedObjects];
  id v10 = [(TUIMicaPlayer *)self rootLayer];
  id v11 = +[TUIMicaPlayer updatePublishedObjects:v9 toReferenceLayersInTree:v8 ratherThanLayersInTree:v10];

  id v12 = [(id)objc_opt_class() allocWithZone:a3];
  [(TUIMicaPlayer *)self retinaScale];
  id v13 = [v12 initWithPath:v6 retinaScale:v8 rootLayer:v11];

  return v13;
}

+ (id)updatePublishedObjects:(id)a3 toReferenceLayersInTree:(id)a4 ratherThanLayersInTree:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v28 = +[NSMutableDictionary dictionary];
  if (v7 && [v7 count])
  {
    id v10 = [v9 tui_allLayersInTree];
    id v24 = v9;
    v26 = [v9 tui_allAnimationsInTree];
    id v11 = [v8 tui_allLayersInTree];
    v25 = [v8 tui_allAnimationsInTree];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [v7 allKeys];
    id v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v17 = [v7 objectForKeyedSubscript:v16];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v19 = v10;
          id v20 = v11;
          if ((isKindOfClass & 1) != 0
            || (objc_opt_class(), v21 = objc_opt_isKindOfClass(), id v20 = v25, v19 = v26, (v21 & 1) != 0))
          {
            v22 = [v20 objectAtIndexedSubscript:[v19 indexOfObjectIdenticalTo:v17]];
            [v28 setObject:v22 forKeyedSubscript:v16];
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v13);
    }

    id v9 = v24;
  }

  return v28;
}

- (void)addToLayer:(id)a3 onTop:(BOOL)a4 gravity:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = a5;
  id v9 = [(CALayer *)self->_rootLayer superlayer];

  if (!v9)
  {
    [(TUIMicaPlayer *)self pause];
    [(TUIMicaPlayer *)self setPlaybackTime:0.0];
    [(TUIMicaPlayer *)self moveAndResizeWithinParentLayer:v11 usingGravity:v8 animate:0];
    rootLayer = self->_rootLayer;
    if (v6) {
      [v11 addSublayer:rootLayer];
    }
    else {
      [v11 insertSublayer:rootLayer atIndex:0];
    }
  }
}

- (void)removeFromSuperlayer
{
  objc_super v3 = [(CALayer *)self->_rootLayer superlayer];

  if (v3)
  {
    [(TUIMicaPlayer *)self pause];
    rootLayer = self->_rootLayer;
    [(CALayer *)rootLayer removeFromSuperlayer];
  }
}

- (void)moveAndResizeWithinParentLayer:(id)a3 usingGravity:(id)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  rootLayer = self->_rootLayer;
  id v9 = a4;
  id v10 = a3;
  [(TUIMicaPlayer *)self retinaScale];
  -[CALayer tui_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:](rootLayer, "tui_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:", v10, v9, 1, v5);
}

- (id)publishedLayerWithKey:(id)a3 required:(BOOL)a4
{
  v4 = [(TUIMicaPlayer *)self publishedObjectWithKey:a3 required:a4];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v4 = 0;
    }
  }

  return v4;
}

- (id)publishedObjectWithKey:(id)a3 required:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(NSDictionary *)self->_publishedObjects objectForKeyedSubscript:v6];
  id v8 = (void *)v7;
  if (v4 && !v7)
  {
    id v9 = [(NSString *)self->_path lastPathComponent];
    NSLog(@"Missing published object '%@' in Mica document '%@'", v6, v9);
  }

  return v8;
}

- (void)play
{
  if (![(TUIMicaPlayer *)self isPlaying])
  {
    double v3 = CACurrentMediaTime();
    [(TUIMicaPlayer *)self playbackTime];
    [(CALayer *)self->_rootLayer setBeginTime:v3 - v4 / self->_preferredPlaybackSpeed];
    [(CALayer *)self->_rootLayer setTimeOffset:0.0];
    *(float *)&double v5 = self->_preferredPlaybackSpeed;
    [(CALayer *)self->_rootLayer setSpeed:v5];
    [(TUIMicaPlayer *)self startPlayTimer];
    [(TUIMicaPlayer *)self notifyDelegateDidStartPlaying];
  }
}

- (void)pause
{
  if ([(TUIMicaPlayer *)self isPlaying])
  {
    [(TUIMicaPlayer *)self playbackTime];
    -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:");
    [(CALayer *)self->_rootLayer setBeginTime:0.0];
    [(CALayer *)self->_rootLayer setSpeed:0.0];
    [(TUIMicaPlayer *)self stopPlayTimer];
    [(TUIMicaPlayer *)self notifyDelegateDidStopPlaying];
  }
}

- (BOOL)isPlaying
{
  [(CALayer *)self->_rootLayer speed];
  return v2 != 0.0;
}

- (void)setPreferredPlaybackSpeed:(float)a3
{
  if (a3 <= 0.0) {
    float v4 = 1.0;
  }
  else {
    float v4 = a3;
  }
  self->_preferredPlaybackSpeed = v4;
  if ([(TUIMicaPlayer *)self isPlaying])
  {
    rootLayer = self->_rootLayer;
    *(float *)&double v5 = v4;
    [(CALayer *)rootLayer setSpeed:v5];
  }
}

- (double)playbackTime
{
  if ([(TUIMicaPlayer *)self isPlaying])
  {
    double v3 = CACurrentMediaTime();
    [(CALayer *)self->_rootLayer beginTime];
    double v5 = v3 - v4;
    [(CALayer *)self->_rootLayer speed];
    return v5 * v6;
  }
  else
  {
    rootLayer = self->_rootLayer;
    [(CALayer *)rootLayer timeOffset];
  }
  return result;
}

- (void)setPlaybackTime:(double)a3
{
  unsigned int v5 = [(TUIMicaPlayer *)self isPlaying];
  double v6 = 0.0;
  if (v5)
  {
    double v6 = CACurrentMediaTime() - a3;
    a3 = 0.0;
  }
  [(CALayer *)self->_rootLayer setBeginTime:v6];
  [(CALayer *)self->_rootLayer setTimeOffset:a3];

  [(TUIMicaPlayer *)self notifyDelegateDidChangePlaybackTime];
}

- (BOOL)isPlaybackAtEnd
{
  [(TUIMicaPlayer *)self playbackTime];
  double v4 = v3;
  [(TUIMicaPlayer *)self documentDuration];
  return v4 >= v5 + -0.001;
}

- (void)notifyDelegateDidStartPlaying
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 micaPlayerDidStartPlaying:self];
    }
  }
}

- (void)notifyDelegateDidStopPlaying
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 micaPlayerDidStopPlaying:self];
    }
  }
}

- (void)notifyDelegateDidChangePlaybackTime
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 micaPlayerDidChangePlaybackTime:self];
    }
  }
}

- (void)startPlayTimer
{
  if (!self->_playTimer)
  {
    double v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"runPlayTimer:" selector:0 userInfo:1 repeats:0.0333333333];
    playTimer = self->_playTimer;
    self->_playTimer = v3;

    id v5 = +[NSRunLoop currentRunLoop];
    [v5 addTimer:self->_playTimer forMode:NSRunLoopCommonModes];
  }
}

- (void)stopPlayTimer
{
  playTimer = self->_playTimer;
  if (playTimer)
  {
    [(NSTimer *)playTimer invalidate];
    double v4 = self->_playTimer;
    self->_playTimer = 0;
  }
}

- (void)runPlayTimer:(id)a3
{
  if ([(TUIMicaPlayer *)self isPlaybackAtEnd])
  {
    if (self->_loopDuringPlayback) {
      [(TUIMicaPlayer *)self setPlaybackTime:0.0];
    }
    else {
      [(TUIMicaPlayer *)self pause];
    }
  }

  [(TUIMicaPlayer *)self notifyDelegateDidChangePlaybackTime];
}

- (MicaPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MicaPlayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
}

- (double)retinaScale
{
  return self->_retinaScale;
}

- (void)setRetinaScale:(double)a3
{
  self->_retinaScale = a3;
}

- (double)documentDuration
{
  return self->_documentDuration;
}

- (void)setDocumentDuration:(double)a3
{
  self->_documentDuration = a3;
}

- (float)preferredPlaybackSpeed
{
  return self->_preferredPlaybackSpeed;
}

- (BOOL)loopDuringPlayback
{
  return self->_loopDuringPlayback;
}

- (void)setLoopDuringPlayback:(BOOL)a3
{
  self->_loopDuringPlayback = a3;
}

- (NSDictionary)publishedObjects
{
  return self->_publishedObjects;
}

- (void)setPublishedObjects:(id)a3
{
}

- (NSTimer)playTimer
{
  return self->_playTimer;
}

- (void)setPlayTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playTimer, 0);
  objc_storeStrong((id *)&self->_publishedObjects, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end