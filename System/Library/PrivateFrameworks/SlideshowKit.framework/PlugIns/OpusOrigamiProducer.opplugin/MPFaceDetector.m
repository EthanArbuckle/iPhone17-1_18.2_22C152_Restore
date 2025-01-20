@interface MPFaceDetector
- (BOOL)_pathIsInQueue:(id)a3;
- (BOOL)isCancelled;
- (BOOL)suspended;
- (MPDocument)document;
- (MPFaceDetector)init;
- (MRMarimbaPlayback)renderer;
- (void)_addPathToQueue:(id)a3;
- (void)_checkPlayingSlides;
- (void)_removePathToQueue:(id)a3;
- (void)_setupTimer;
- (void)_start;
- (void)checkPlayingSlides;
- (void)dealloc;
- (void)detectFaces:(id)a3;
- (void)resume;
- (void)setDocument:(id)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setRenderer:(id)a3;
- (void)start;
- (void)stop;
- (void)suspend;
@end

@implementation MPFaceDetector

- (MPFaceDetector)init
{
  v8.receiver = self;
  v8.super_class = (Class)MPFaceDetector;
  v2 = [(MPFaceDetector *)&v8 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v2->mDetectionQueue = v3;
    [(NSOperationQueue *)v3 setMaxConcurrentOperationCount:1];
    v2->mPathsInQueue = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v2->mPlayingSlides = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v4 = (NSLock *)objc_alloc_init((Class)NSLock);
    v2->mPathQueueLock = v4;
    [(NSLock *)v4 setName:@"MPFaceDetector.pathQueueLock"];
    v5 = (NSLock *)objc_alloc_init((Class)NSLock);
    v2->mPlayingSlidesLock = v5;
    [(NSLock *)v5 setName:@"MPFaceDetector.playingSlidesLock"];
    v6 = (NSLock *)objc_alloc_init((Class)NSLock);
    v2->mStartStopLock = v6;
    [(NSLock *)v6 setName:@"MPFaceDetector.startStopLock"];
    v2->mCheckTimer = 0;
    v2->mIsCancelled = 0;
  }
  return v2;
}

- (void)dealloc
{
  [(MPFaceDetector *)self stop];

  self->mCheckTimer = 0;
  self->mDetectionQueue = 0;

  self->mDocument = 0;
  self->mRenderer = 0;

  self->mPathsInQueue = 0;
  self->mPathQueueLock = 0;

  self->mPlayingSlides = 0;
  self->mPlayingSlidesLock = 0;

  self->mStartStopLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPFaceDetector;
  [(MPFaceDetector *)&v3 dealloc];
}

- (void)start
{
  if (!self->mIsCancelled) {
    +[NSThread detachNewThreadSelector:"_start" toTarget:self withObject:0];
  }
}

- (void)_addPathToQueue:(id)a3
{
  [(NSLock *)self->mPathQueueLock lock];
  [(NSMutableSet *)self->mPathsInQueue addObject:a3];
  mPathQueueLock = self->mPathQueueLock;
  [(NSLock *)mPathQueueLock unlock];
}

- (void)_removePathToQueue:(id)a3
{
  [(NSLock *)self->mPathQueueLock lock];
  [(NSMutableSet *)self->mPathsInQueue removeObject:a3];
  mPathQueueLock = self->mPathQueueLock;
  [(NSLock *)mPathQueueLock unlock];
}

- (BOOL)_pathIsInQueue:(id)a3
{
  LOBYTE(a3) = [(NSMutableSet *)self->mPathsInQueue containsObject:a3];
  [(NSLock *)self->mPathQueueLock unlock];
  return (char)a3;
}

- (void)_start
{
  +[NSThread setThreadPriority:0.2];
  [(NSLock *)self->mStartStopLock lock];
  id v3 = [(MPDocument *)self->mDocument allSlides];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v3);
      }
      if (self->mIsCancelled) {
        break;
      }
      objc_super v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
      if (!-[MPFaceDetector _pathIsInQueue:](self, "_pathIsInQueue:", [v8 path])
        && !-[MPDocument regionsOfInterestForPath:](self->mDocument, "regionsOfInterestForPath:", [v8 path]))
      {
        id v9 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v8, @"slide", 0);
        id v10 = [objc_alloc((Class)NSInvocationOperation) initWithTarget:self selector:"detectFaces:" object:v9];
        [v10 setQualityOfService:9];
        [v10 setQueuePriority:-8];

        -[MPFaceDetector _addPathToQueue:](self, "_addPathToQueue:", [v8 path]);
        [(NSOperationQueue *)self->mDetectionQueue addOperation:v10];
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  [(NSLock *)self->mStartStopLock unlock];
}

- (void)suspend
{
}

- (void)resume
{
}

- (BOOL)suspended
{
  return [(NSOperationQueue *)self->mDetectionQueue isSuspended];
}

- (void)detectFaces:(id)a3
{
  if (!self->mIsCancelled)
  {
    id v6 = [a3 objectForKey:@"slide"];
    id v7 = [v6 path];
    id v8 = [(MPDocument *)self->mDocument regionsOfInterestForPath:v7];
    id v9 = v8;
    if (!v8) {
      id v8 = [(MPDocument *)self->mDocument regionsOfInterestForPath:v7 detect:1];
    }
    if (!self->mIsCancelled)
    {
      if (v8)
      {
        id v10 = [v8 count];
        if (!v9)
        {
          if (v10)
          {
            if (objc_msgSend(-[MRMarimbaPlayback currentSlides](self->mRenderer, "currentSlides"), "containsObject:", v6))
            {
              [(NSLock *)self->mPlayingSlidesLock lock];
              [(NSMutableSet *)self->mPlayingSlides addObject:v6];
              if (!self->mCheckTimer) {
                [(MPFaceDetector *)self performSelectorOnMainThread:"_setupTimer" withObject:0 waitUntilDone:0];
              }
              [(NSLock *)self->mPlayingSlidesLock unlock];
            }
            else
            {
              objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "applyCropToSlide:inDocument:withOptions:", v6, self->mDocument, 0);
              objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "configurePanoramaInformationToEffect:inDocument:startingIndex:count:removeOldIndex:", objc_msgSend(v6, "parentEffect"), self->mDocument, objc_msgSend(v6, "index"), 1, -1);
            }
          }
        }
      }
      -[MPFaceDetector _removePathToQueue:](self, "_removePathToQueue:", [v6 path]);
    }
  }
}

- (void)_setupTimer
{
  if (!self->mCheckTimer) {
    self->mCheckTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"_checkPlayingSlides" selector:0 userInfo:0 repeats:5.0];
  }
}

- (void)_checkPlayingSlides
{
  self->mCheckTimer = 0;
  +[NSThread detachNewThreadSelector:"checkPlayingSlides" toTarget:self withObject:0];
}

- (void)checkPlayingSlides
{
  if (!self->mIsCancelled)
  {
    +[NSThread setThreadPriority:0.2];
    [(NSLock *)self->mPlayingSlidesLock lock];
    if ([(NSMutableSet *)self->mPlayingSlides count])
    {
      id v4 = [(NSMutableSet *)self->mPlayingSlides copy];
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v11;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
            if ((objc_msgSend(-[MRMarimbaPlayback currentSlides](self->mRenderer, "currentSlides"), "containsObject:", v9) & 1) == 0)
            {
              objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "applyCropToSlide:inDocument:withOptions:", v9, self->mDocument, 0);
              objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "configurePanoramaInformationToEffect:inDocument:startingIndex:count:removeOldIndex:", objc_msgSend(v9, "parentEffect"), self->mDocument, objc_msgSend(v9, "index"), 1, -1);
              [(NSMutableSet *)self->mPlayingSlides removeObject:v9];
            }
          }
          id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v6);
      }

      if ([(NSMutableSet *)self->mPlayingSlides count] && !self->mCheckTimer) {
        [(MPFaceDetector *)self performSelectorOnMainThread:"_setupTimer" withObject:0 waitUntilDone:0];
      }
    }
    [(NSLock *)self->mPlayingSlidesLock unlock];
  }
}

- (void)stop
{
  [(NSLock *)self->mStartStopLock lock];
  self->mIsCancelled = 1;
  [(NSTimer *)self->mCheckTimer invalidate];

  self->mCheckTimer = 0;
  [(NSOperationQueue *)self->mDetectionQueue setSuspended:0];
  [(NSOperationQueue *)self->mDetectionQueue cancelAllOperations];
  [(NSMutableSet *)self->mPathsInQueue removeAllObjects];
  mStartStopLock = self->mStartStopLock;
  [(NSLock *)mStartStopLock unlock];
}

- (MPDocument)document
{
  return self->mDocument;
}

- (void)setDocument:(id)a3
{
}

- (MRMarimbaPlayback)renderer
{
  return self->mRenderer;
}

- (void)setRenderer:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->mIsCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->mIsCancelled = a3;
}

@end