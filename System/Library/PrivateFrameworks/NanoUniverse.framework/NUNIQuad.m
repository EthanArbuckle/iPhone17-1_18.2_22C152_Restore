@interface NUNIQuad
- (BOOL)prepareForTime:(double)a3;
- (NUNIQuad)initWithScreenScale:(double)a3 renderer:(id)a4;
- (NUNIRenderer)renderer;
- (NUNIScene)scene;
- (NUNIViewport)_viewport;
- (id)spheroidAtPoint:(CGPoint)a3;
- (void)performOffscreenPassesWithCommandBuffer:(id)a3;
- (void)renderFailedForReason:(unint64_t)a3;
- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4;
- (void)setScene:(id)a3;
- (void)setupForQuadView:(id)a3;
@end

@implementation NUNIQuad

- (NUNIQuad)initWithScreenScale:(double)a3 renderer:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NUNIQuad;
  v8 = [(CLKUIQuad *)&v14 init];
  v9 = v8;
  if (v8)
  {
    float v10 = a3;
    v8->_screenScale = v10;
    objc_storeStrong((id *)&v8->_renderer, a4);
    dispatch_semaphore_t v11 = dispatch_semaphore_create(3);
    renderSemaphore = v9->_renderSemaphore;
    v9->_renderSemaphore = (OS_dispatch_semaphore *)v11;
  }
  return v9;
}

- (void)setupForQuadView:(id)a3
{
  self->_baseTime = CACurrentMediaTime();
}

- (NUNIViewport)_viewport
{
  v3 = [(CLKUIQuad *)self quadView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  float v8 = v5;
  float screenScale = self->_screenScale;
  uint64_t v10 = (int)(float)(screenScale * v8);
  float v11 = v7;
  return (NUNIViewport)(v10 | ((unint64_t)(int)(float)(screenScale * v11) << 32));
}

- (void)performOffscreenPassesWithCommandBuffer:(id)a3
{
  id v5 = a3;
  double v4 = [(NUNIQuad *)self scene];
  if (v4) {
    [(NUNIRenderer *)self->_renderer renderOffscreenWithScene:v4 viewport:[(NUNIQuad *)self _viewport] commandBuffer:v5];
  }
}

- (BOOL)prepareForTime:(double)a3
{
  double v4 = [(NUNIQuad *)self scene];
  if (v4)
  {
    renderSemaphore = self->_renderSemaphore;
    dispatch_time_t v6 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(renderSemaphore, v6))
    {
      [v4 updateFromDateIfNeeded];
      CFTimeInterval v9 = CACurrentMediaTime() - self->_baseTime;
      *(float *)&CFTimeInterval v9 = v9;
      [v4 update:v9];
      BOOL v8 = 1;
      goto LABEL_8;
    }
    double v7 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NUNIQuad prepareForTime:](v7);
    }
  }
  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(NUNIQuad *)self scene];
  if (v8)
  {
    [(NUNIRenderer *)self->_renderer renderWithScene:v8 viewport:[(NUNIQuad *)self _viewport] commandBuffer:v6 passDescriptor:v7];
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = __Block_byref_object_copy_;
    v10[4] = __Block_byref_object_dispose_;
    float v11 = self->_renderSemaphore;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__NUNIQuad_renderWithCommandBuffer_passDescriptor___block_invoke;
    v9[3] = &unk_2644CD8F8;
    v9[4] = v10;
    [v6 addCompletedHandler:v9];
    _Block_object_dispose(v10, 8);
  }
}

intptr_t __51__NUNIQuad_renderWithCommandBuffer_passDescriptor___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

- (void)renderFailedForReason:(unint64_t)a3
{
  int v3 = a3;
  id v5 = NUNILoggingObjectForDomain(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[NUNIQuad renderFailedForReason:](v3, v5);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_renderSemaphore);
}

- (id)spheroidAtPoint:(CGPoint)a3
{
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  NUNIViewport v4 = [(NUNIQuad *)self _viewport];
  renderer = self->_renderer;
  v6.f64[0] = x;
  v6.f64[1] = y;
  double v7 = COERCE_DOUBLE(vmul_n_f32(vcvt_f32_f64(v6), self->_screenScale));
  scene = self->_scene;
  return [(NUNIRenderer *)renderer spheroidAtPoint:scene scene:v4 viewport:v7];
}

- (NUNIRenderer)renderer
{
  return self->_renderer;
}

- (NUNIScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_renderSemaphore, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

- (void)prepareForTime:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E8AA000, log, OS_LOG_TYPE_ERROR, "NUNIQuad timed out in prepareForTime -- dropping frame.", v1, 2u);
}

- (void)renderFailedForReason:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21E8AA000, a2, OS_LOG_TYPE_ERROR, "NUNIQuad render failed (reason=%d).", (uint8_t *)v2, 8u);
}

@end