@interface OBAnimationController
+ (id)packageForURL:(id)a3;
- (BOOL)canceled;
- (CAPackage)package;
- (CAStateController)stateController;
- (NSArray)animatedStates;
- (OBAnimationController)initWithUrlToPackage:(id)a3 animationView:(id)a4 animatedStates:(id)a5 startAtFirstState:(id)a6;
- (OBAnimationController)initWithUrlToPackage:(id)a3 animationView:(id)a4 sizingTransformScale:(double)a5 animatedStates:(id)a6 startAtFirstState:(id)a7;
- (OBAnimationState)firstState;
- (OBAnimationView)animationView;
- (id)_caStateForAnimationState:(id)a3;
- (unint64_t)stateIndex;
- (void)_initializeStartingStateForStopAnimation:(BOOL)a3;
- (void)_startAnimationForLayer:(id)a3;
- (void)_stepAnimationStatesForLayer:(id)a3;
- (void)setAnimatedStates:(id)a3;
- (void)setAnimationView:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setFirstState:(id)a3;
- (void)setPackage:(id)a3;
- (void)setStateController:(id)a3;
- (void)setStateIndex:(unint64_t)a3;
- (void)startAnimation;
- (void)stopAnimation;
- (void)updateAnimationForAppearanceChange;
@end

@implementation OBAnimationController

- (OBAnimationController)initWithUrlToPackage:(id)a3 animationView:(id)a4 animatedStates:(id)a5 startAtFirstState:(id)a6
{
  return [(OBAnimationController *)self initWithUrlToPackage:a3 animationView:a4 sizingTransformScale:a5 animatedStates:a6 startAtFirstState:0.0];
}

- (OBAnimationController)initWithUrlToPackage:(id)a3 animationView:(id)a4 sizingTransformScale:(double)a5 animatedStates:(id)a6 startAtFirstState:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)OBAnimationController;
  v16 = [(OBAnimationController *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [(id)objc_opt_class() packageForURL:v12];
    package = v16->_package;
    v16->_package = (CAPackage *)v17;

    objc_storeStrong((id *)&v16->_animationView, a4);
    [(OBAnimationView *)v16->_animationView setAppearanceChangeDelegate:v16];
    [v13 setPackage:v16->_package sizingTransformScale:a5];
    uint64_t v19 = [v14 copy];
    animatedStates = v16->_animatedStates;
    v16->_animatedStates = (NSArray *)v19;

    objc_storeStrong((id *)&v16->_firstState, a7);
    id v21 = objc_alloc(MEMORY[0x1E4F39CB0]);
    v22 = [(CAPackage *)v16->_package rootLayer];
    uint64_t v23 = [v21 initWithLayer:v22];
    stateController = v16->_stateController;
    v16->_stateController = (CAStateController *)v23;

    [(OBAnimationController *)v16 _initializeStartingStateForStopAnimation:0];
  }

  return v16;
}

- (void)startAnimation
{
  [(OBAnimationController *)self setCanceled:0];
  id v4 = [(OBAnimationController *)self package];
  v3 = [v4 rootLayer];
  [(OBAnimationController *)self _startAnimationForLayer:v3];
}

- (void)stopAnimation
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  v3 = [(OBAnimationController *)self stateController];

  if (v3)
  {
    id v4 = [(OBAnimationController *)self stateController];
    [v4 cancelTimers];

    v5 = [(OBAnimationController *)self stateController];
    id v6 = (id)[v5 removeAllStateChanges];
  }
  [(OBAnimationController *)self setStateIndex:0];
  [(OBAnimationController *)self setCanceled:1];
  [(OBAnimationController *)self _initializeStartingStateForStopAnimation:1];
}

- (void)_initializeStartingStateForStopAnimation:(BOOL)a3
{
  v5 = [(OBAnimationController *)self animationView];
  id v6 = [v5 traitCollection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__OBAnimationController__initializeStartingStateForStopAnimation___block_invoke;
  v7[3] = &unk_1E58AE9C0;
  v7[4] = self;
  BOOL v8 = a3;
  [v6 performAsCurrentTraitCollection:v7];
}

void __66__OBAnimationController__initializeStartingStateForStopAnimation___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 56))
  {
    objc_msgSend((id)v2, "_caStateForAnimationState:");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (*(unsigned char *)(a1 + 40))
    {
      float v3 = 100.0;
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 56) transitionSpeed];
      float v3 = v5;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    BOOL v8 = [*(id *)(v6 + 16) rootLayer];
    *(float *)&double v9 = v3;
    [v7 setInitialStatesOfLayer:v8 transitionSpeed:v9];

    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    id v12 = [*(id *)(v10 + 16) rootLayer];
    *(float *)&double v13 = v3;
    [v11 setState:v18 ofLayer:v12 transitionSpeed:v13];
  }
  else
  {
    if (*(unsigned char *)(a1 + 40))
    {
      float v4 = 100.0;
    }
    else
    {
      id v14 = [*(id *)(v2 + 40) objectAtIndexedSubscript:0];
      [v14 transitionSpeed];
      float v4 = v15;

      uint64_t v2 = *(void *)(a1 + 32);
    }
    v16 = *(void **)(v2 + 24);
    id v18 = [*(id *)(v2 + 16) rootLayer];
    *(float *)&double v17 = v4;
    objc_msgSend(v16, "setInitialStatesOfLayer:transitionSpeed:", v17);
  }
}

- (void)_startAnimationForLayer:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  double v5 = [(OBAnimationController *)self animationView];
  uint64_t v6 = [v5 traitCollection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__OBAnimationController__startAnimationForLayer___block_invoke;
  v8[3] = &unk_1E58AE9E8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performAsCurrentTraitCollection:v8];
}

uint64_t __49__OBAnimationController__startAnimationForLayer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stepAnimationStatesForLayer:*(void *)(a1 + 40)];
}

- (void)_stepAnimationStatesForLayer:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(OBAnimationController *)self stateIndex];
  uint64_t v6 = [(OBAnimationController *)self animatedStates];
  if (v5 >= [v6 count])
  {
  }
  else
  {
    BOOL v7 = [(OBAnimationController *)self canceled];

    if (!v7)
    {
      BOOL v8 = [(OBAnimationController *)self animatedStates];
      id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", -[OBAnimationController stateIndex](self, "stateIndex"));

      uint64_t v10 = [(OBAnimationController *)self animationView];
      v11 = [v10 traitCollection];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54__OBAnimationController__stepAnimationStatesForLayer___block_invoke;
      v13[3] = &unk_1E58AEA10;
      v13[4] = self;
      id v14 = v9;
      id v15 = v4;
      id v12 = v9;
      [v11 performAsCurrentTraitCollection:v13];
    }
  }
}

void __54__OBAnimationController__stepAnimationStatesForLayer___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _caStateForAnimationState:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "setStateIndex:", objc_msgSend(*(id *)(a1 + 32), "stateIndex") + 1);
  if (v7)
  {
    uint64_t v2 = [*(id *)(a1 + 32) stateController];
    uint64_t v3 = *(void *)(a1 + 48);
    [*(id *)(a1 + 40) transitionSpeed];
    *(float *)&double v4 = v4;
    [v2 setState:v7 ofLayer:v3 transitionSpeed:v4];

    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) transitionDuration];
    objc_msgSend(v6, "performSelector:withObject:afterDelay:", sel__stepAnimationStatesForLayer_, v5);
  }
}

+ (id)packageForURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F3A4C0];
  id v10 = 0;
  uint64_t v5 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:v3 type:v4 options:0 error:&v10];
  id v6 = v10;
  if (v6)
  {
    id v7 = _OBLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[OBAnimationController packageForURL:v7];
    }

    id v8 = 0;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)_caStateForAnimationState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(OBAnimationController *)self package];
  id v6 = [v5 rootLayer];
  id v7 = [v4 stateForLayer:v6];

  return v7;
}

- (void)updateAnimationForAppearanceChange
{
  id v3 = [(OBAnimationController *)self animatedStates];
  unint64_t v4 = [(OBAnimationController *)self stateIndex];
  uint64_t v5 = [(OBAnimationController *)self animatedStates];
  unint64_t v6 = [v5 count] - 1;

  if (v4 >= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v4;
  }
  id v12 = [v3 objectAtIndexedSubscript:v7];

  id v8 = [(OBAnimationController *)self _caStateForAnimationState:v12];
  id v9 = [(OBAnimationController *)self stateController];
  id v10 = [(OBAnimationController *)self package];
  v11 = [v10 rootLayer];
  [v9 setState:v8 ofLayer:v11 transitionSpeed:0.0];
}

- (CAPackage)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
}

- (CAStateController)stateController
{
  return self->_stateController;
}

- (void)setStateController:(id)a3
{
}

- (OBAnimationView)animationView
{
  return self->_animationView;
}

- (void)setAnimationView:(id)a3
{
}

- (NSArray)animatedStates
{
  return self->_animatedStates;
}

- (void)setAnimatedStates:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (unint64_t)stateIndex
{
  return self->_stateIndex;
}

- (void)setStateIndex:(unint64_t)a3
{
  self->_stateIndex = a3;
}

- (OBAnimationState)firstState
{
  return self->_firstState;
}

- (void)setFirstState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstState, 0);
  objc_storeStrong((id *)&self->_animatedStates, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

+ (void)packageForURL:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 description];
  unint64_t v6 = [a2 description];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_19BF0F000, a3, OS_LOG_TYPE_ERROR, "Unable to load package with url %@: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end