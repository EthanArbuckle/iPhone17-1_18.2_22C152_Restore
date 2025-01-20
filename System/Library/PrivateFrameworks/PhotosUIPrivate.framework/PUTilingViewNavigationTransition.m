@interface PUTilingViewNavigationTransition
- (BOOL)hasStarted;
- (BOOL)isInteractive;
- (BOOL)isTransitionPaused;
- (PUTilingViewNavigationTransition)initWithEndPoint:(id)a3;
- (PUTilingViewTransitionHelper)_tilingViewTransitionHelper;
- (void)_animateTransitionWithOperation:(int64_t)a3;
- (void)animatePopTransition;
- (void)animatePushTransition;
- (void)pauseTransition;
- (void)pauseTransitionWithOptions:(unint64_t)a3;
- (void)resumeTransition:(BOOL)a3;
- (void)updatePausedTransitionWithProgress:(double)a3 interactionProgress:(double)a4;
@end

@implementation PUTilingViewNavigationTransition

- (void).cxx_destruct
{
}

- (PUTilingViewTransitionHelper)_tilingViewTransitionHelper
{
  return self->__tilingViewTransitionHelper;
}

- (void)resumeTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUTilingViewNavigationTransition *)self _tilingViewTransitionHelper];
  [v4 resumeTransition:v3];
}

- (void)updatePausedTransitionWithProgress:(double)a3 interactionProgress:(double)a4
{
  id v6 = [(PUTilingViewNavigationTransition *)self _tilingViewTransitionHelper];
  [v6 updatePausedTransitionWithProgress:a3 interactionProgress:a4];
}

- (void)pauseTransitionWithOptions:(unint64_t)a3
{
  id v4 = [(PUTilingViewNavigationTransition *)self _tilingViewTransitionHelper];
  [v4 pauseTransitionWithOptions:a3];
}

- (void)pauseTransition
{
  id v2 = [(PUTilingViewNavigationTransition *)self _tilingViewTransitionHelper];
  [v2 pauseTransition];
}

- (BOOL)isTransitionPaused
{
  id v2 = [(PUTilingViewNavigationTransition *)self _tilingViewTransitionHelper];
  char v3 = [v2 isTransitionPaused];

  return v3;
}

- (BOOL)hasStarted
{
  id v2 = [(PUTilingViewNavigationTransition *)self _tilingViewTransitionHelper];
  char v3 = [v2 hasStarted];

  return v3;
}

- (void)_animateTransitionWithOperation:(int64_t)a3
{
  BOOL v5 = [(PUViewControllerTransition *)self startedInteractively];
  id v6 = [(PUTilingViewNavigationTransition *)self _tilingViewTransitionHelper];
  [v6 animateTransitionWithOperation:a3 startedInteractively:v5];
}

- (void)animatePopTransition
{
}

- (void)animatePushTransition
{
}

- (BOOL)isInteractive
{
  return 1;
}

- (PUTilingViewNavigationTransition)initWithEndPoint:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[PUTilingViewSettings sharedInstance];
  [v5 transitionDuration];
  double v7 = v6;
  v8 = +[PUTilingViewSettings sharedInstance];
  [v8 animationDragCoefficient];
  double v10 = v7 * v9;

  v19.receiver = self;
  v19.super_class = (Class)PUTilingViewNavigationTransition;
  v11 = [(PUNavigationTransition *)&v19 initWithDuration:v10];
  if (v11)
  {
    v12 = [PUTilingViewTransitionHelper alloc];
    [(PUNavigationTransition *)v11 pushDuration];
    double v14 = v13;
    [(PUNavigationTransition *)v11 popDuration];
    uint64_t v16 = [(PUTilingViewTransitionHelper *)v12 initWithPresentationDuration:v4 dismissalDuration:v14 endPoint:v15];
    tilingViewTransitionHelper = v11->__tilingViewTransitionHelper;
    v11->__tilingViewTransitionHelper = (PUTilingViewTransitionHelper *)v16;

    [(PUTilingViewTransitionHelper *)v11->__tilingViewTransitionHelper setTransition:v11];
  }

  return v11;
}

@end