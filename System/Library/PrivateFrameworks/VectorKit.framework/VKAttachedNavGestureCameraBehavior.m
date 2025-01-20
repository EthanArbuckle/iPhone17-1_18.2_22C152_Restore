@interface VKAttachedNavGestureCameraBehavior
- (VKAttachedNavGestureCameraBehavior)initWithNavCameraController:(id)a3;
- (void)_startZoomAnimationFrom:(double)a3 to:(double)a4 completionHandler:(id)a5;
- (void)beginZoom:(CGPoint)a3;
- (void)dealloc;
- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5;
- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
@end

@implementation VKAttachedNavGestureCameraBehavior

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapZoomAnimation, 0);
  objc_destroyWeak((id *)&self->_navCameraController);
}

- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double startZoomScale = self->_startZoomScale;
  p_navCameraController = &self->_navCameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navCameraController);
  [WeakRetained minZoomScale];
  double v9 = v8;
  id v10 = objc_loadWeakRetained((id *)p_navCameraController);
  [v10 maxZoomScale];
  double v12 = fmin(fmax(startZoomScale / a5, v9), v11);

  id v14 = objc_loadWeakRetained((id *)p_navCameraController);
  [v14 setZoomScale:v12];
}

- (void)beginZoom:(CGPoint)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navCameraController);
  [WeakRetained zoomScale];
  self->_double startZoomScale = v4;
}

- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5
{
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navCameraController);
  [WeakRetained zoomScale];
  exp2(-a4);

  id v8 = objc_loadWeakRetained((id *)&self->_navCameraController);
  [v8 minZoomScale];
  id v9 = objc_loadWeakRetained((id *)&self->_navCameraController);
  [v9 maxZoomScale];

  id v10 = objc_loadWeakRetained((id *)&self->_navCameraController);
  [v10 zoomScale];
  -[VKAttachedNavGestureCameraBehavior _startZoomAnimationFrom:to:completionHandler:](self, "_startZoomAnimationFrom:to:completionHandler:", v12);

  id v11 = objc_loadWeakRetained((id *)&self->_navCameraController);
  [v11 startIgnoreStyleChangeTimer];
}

- (void)_startZoomAnimationFrom:(double)a3 to:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  [(VKAnimation *)self->_tapZoomAnimation stop];
  id v9 = [[VKTimedAnimation alloc] initWithDuration:0.25];
  tapZoomAnimation = self->_tapZoomAnimation;
  self->_tapZoomAnimation = v9;

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__VKAttachedNavGestureCameraBehavior__startZoomAnimationFrom_to_completionHandler___block_invoke;
  v15[3] = &unk_1E5A98570;
  objc_copyWeak(v16, &location);
  v16[1] = *(id *)&a3;
  v16[2] = *(id *)&a4;
  [(VKTimedAnimation *)self->_tapZoomAnimation setStepHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__VKAttachedNavGestureCameraBehavior__startZoomAnimationFrom_to_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5A98598;
  id v11 = v8;
  id v14 = v11;
  [(VKAnimation *)self->_tapZoomAnimation setCompletionHandler:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navCameraController);
  md::AnimationRunner::runAnimation((md::MapEngine **)[WeakRetained animationRunner], &self->_tapZoomAnimation->super);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __83__VKAttachedNavGestureCameraBehavior__startZoomAnimationFrom_to_completionHandler___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = *(double *)(a1 + 40) + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2;
    v7 = WeakRetained;
    id v6 = objc_loadWeakRetained(WeakRetained + 23);
    [v6 setZoomScale:v5];

    id WeakRetained = v7;
  }
}

uint64_t __83__VKAttachedNavGestureCameraBehavior__startZoomAnimationFrom_to_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dealloc
{
  [(VKAnimation *)self->_tapZoomAnimation stop];
  tapZoomAnimation = self->_tapZoomAnimation;
  self->_tapZoomAnimation = 0;

  v4.receiver = self;
  v4.super_class = (Class)VKAttachedNavGestureCameraBehavior;
  [(VKAttachedNavGestureCameraBehavior *)&v4 dealloc];
}

- (VKAttachedNavGestureCameraBehavior)initWithNavCameraController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKAttachedNavGestureCameraBehavior;
  double v5 = [(VKGestureCameraBehavior *)&v8 initWithCameraController:v4];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_navCameraController, v4);
    v6->super._notifyCameraStateChanges = 1;
    v6->_double startZoomScale = 1.0;
  }

  return v6;
}

@end