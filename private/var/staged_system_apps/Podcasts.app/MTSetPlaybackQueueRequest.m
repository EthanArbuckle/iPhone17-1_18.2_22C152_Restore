@interface MTSetPlaybackQueueRequest
+ (id)requestWithContext:(id)a3;
- (BOOL)dryRun;
- (BOOL)startPlayback;
- (BOOL)suppressMetrics;
- (BOOL)validate;
- (MTPlaybackContext)context;
- (MTPlayerManifest)manifest;
- (id)completion;
- (unint64_t)playbackDestination;
- (void)finishWithStatus:(int64_t)a3;
- (void)setCompletion:(id)a3;
- (void)setContext:(id)a3;
- (void)setDryRun:(BOOL)a3;
- (void)setManifest:(id)a3;
- (void)setPlaybackDestination:(unint64_t)a3;
- (void)setStartPlayback:(BOOL)a3;
- (void)setSuppressMetrics:(BOOL)a3;
@end

@implementation MTSetPlaybackQueueRequest

+ (id)requestWithContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  id v6 = [v4 copy];

  [v5 setContext:v6];

  return v5;
}

- (BOOL)validate
{
  v3 = [(MTSetPlaybackQueueRequest *)self manifest];

  id v4 = [(MTSetPlaybackQueueRequest *)self context];

  if (!v4)
  {
    id v5 = +[IMLogger sharedLogger];
    [v5 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/Support/MTPlayerController.m" lineNumber:2709 format:@"Falling back to the default playback context."];

    id v6 = +[MTPlaybackContext defaultContext];
    [(MTSetPlaybackQueueRequest *)self setContext:v6];
  }
  return v3 != 0;
}

- (void)finishWithStatus:(int64_t)a3
{
  id v5 = [(MTSetPlaybackQueueRequest *)self completion];

  if (v5)
  {
    id v6 = [(MTSetPlaybackQueueRequest *)self completion];
    v6[2](v6, a3);

    [(MTSetPlaybackQueueRequest *)self setCompletion:0];
  }
  self->_finished = 1;
}

- (MTPlayerManifest)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (BOOL)dryRun
{
  return self->_dryRun;
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

- (BOOL)startPlayback
{
  return self->_startPlayback;
}

- (void)setStartPlayback:(BOOL)a3
{
  self->_startPlayback = a3;
}

- (unint64_t)playbackDestination
{
  return self->_playbackDestination;
}

- (void)setPlaybackDestination:(unint64_t)a3
{
  self->_playbackDestination = a3;
}

- (MTPlaybackContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BOOL)suppressMetrics
{
  return self->_suppressMetrics;
}

- (void)setSuppressMetrics:(BOOL)a3
{
  self->_suppressMetrics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_manifest, 0);
}

@end