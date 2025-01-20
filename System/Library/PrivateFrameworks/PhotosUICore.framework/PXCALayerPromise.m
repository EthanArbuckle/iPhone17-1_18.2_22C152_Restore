@interface PXCALayerPromise
- (BOOL)rendersAsynchronously;
- (BOOL)shouldCancel;
- (CALayer)layer;
- (CGRect)bounds;
- (PXCALayerPromise)init;
- (double)contentsScale;
- (id)createCustomLayer;
- (void)_handlePreparedLayer:(id)a3;
- (void)_realizeLayer;
- (void)_setLayer:(id)a3;
- (void)cancelLayerRealization;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)drawLayerContentInContext:(CGContext *)a3;
- (void)invalidateLayer;
- (void)performChanges:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentsScale:(double)a3;
- (void)setRendersAsynchronously:(BOOL)a3;
- (void)startLayerRealization;
@end

@implementation PXCALayerPromise

- (void).cxx_destruct
{
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (CALayer)layer
{
  return self->_layer;
}

- (BOOL)rendersAsynchronously
{
  return self->_rendersAsynchronously;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (![(PXCALayerPromise *)self shouldCancel])
  {
    [(PXCALayerPromise *)self drawLayerContentInContext:a4];
  }
}

- (void)invalidateLayer
{
  if (self->_startedLayerRealization)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXCALayerPromise.m" lineNumber:167 description:@"can't change layer promise attributes after realization has started"];
  }
}

- (void)setRendersAsynchronously:(BOOL)a3
{
  if (self->_rendersAsynchronously != a3)
  {
    self->_rendersAsynchronousldouble y = a3;
    [(PXCALayerPromise *)self invalidateLayer];
  }
}

- (void)setContentsScale:(double)a3
{
  if (self->_contentsScale != a3)
  {
    self->_contentsScale = a3;
    [(PXCALayerPromise *)self invalidateLayer];
  }
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_bounds = &self->_bounds;
  if (!CGRectEqualToRect(a3, self->_bounds))
  {
    p_bounds->origin.CGFloat x = x;
    p_bounds->origin.CGFloat y = y;
    p_bounds->size.CGFloat width = width;
    p_bounds->size.CGFloat height = height;
    [(PXCALayerPromise *)self invalidateLayer];
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXCALayerPromise;
  [(PXCALayerPromise *)&v3 performChanges:a3];
}

- (void)drawLayerContentInContext:(CGContext *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXCALayerPromise.m", 127, @"Method %s is a responsibility of subclass %@", "-[PXCALayerPromise drawLayerContentInContext:]", v7 object file lineNumber description];

  abort();
}

- (id)createCustomLayer
{
  return 0;
}

- (void)_setLayer:(id)a3
{
  v5 = (CALayer *)a3;
  if (self->_layer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_layer, a3);
    [(PXCALayerPromise *)self signalChange:1];
    v5 = v6;
  }
}

- (void)cancelLayerRealization
{
  self->_shouldCancel = 1;
}

- (void)_handlePreparedLayer:(id)a3
{
  id v4 = a3;
  if (![(PXCALayerPromise *)self shouldCancel])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__PXCALayerPromise__handlePreparedLayer___block_invoke;
    v5[3] = &unk_1E5DD0328;
    v5[4] = self;
    id v6 = v4;
    [(PXCALayerPromise *)self performChanges:v5];
  }
}

uint64_t __41__PXCALayerPromise__handlePreparedLayer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setLayer:*(void *)(a1 + 40)];
}

- (void)_realizeLayer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (![(PXCALayerPromise *)self shouldCancel])
  {
    objc_super v3 = [(PXCALayerPromise *)self createCustomLayer];
    if (!v3)
    {
      if ([(PXCALayerPromise *)self shouldCancel])
      {
        objc_super v3 = 0;
      }
      else
      {
        [(PXCALayerPromise *)self contentsScale];
        if (v4 == 0.0)
        {
          v5 = PLUIGetLog();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v12 = self;
            _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Invalid contentsScale for layer promise %@. Failing gracefully.", buf, 0xCu);
          }

          double v6 = 1.0;
        }
        else
        {
          double v6 = v4;
        }
        [MEMORY[0x1E4F39CF8] begin];
        objc_super v3 = [MEMORY[0x1E4F39BE8] layer];
        [v3 setDelegate:self];
        [(PXCALayerPromise *)self bounds];
        objc_msgSend(v3, "setBounds:");
        [v3 setContentsScale:v6];
        [v3 setNeedsDisplay];
        [v3 displayIfNeeded];
        [MEMORY[0x1E4F39CF8] commit];
        [MEMORY[0x1E4F39CF8] flush];
      }
    }
    if ([(PXCALayerPromise *)self rendersAsynchronously])
    {
      objc_initWeak((id *)buf, self);
      v7 = [off_1E5DA8380 sharedScheduler];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __33__PXCALayerPromise__realizeLayer__block_invoke;
      v8[3] = &unk_1E5DD20C8;
      objc_copyWeak(&v10, (id *)buf);
      id v9 = v3;
      [v7 dispatchInMainTransaction:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(PXCALayerPromise *)self _handlePreparedLayer:v3];
    }
  }
}

void __33__PXCALayerPromise__realizeLayer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handlePreparedLayer:*(void *)(a1 + 32)];
}

- (void)startLayerRealization
{
  if (!self->_startedLayerRealization)
  {
    self->_startedLayerRealization = 1;
    if ([(PXCALayerPromise *)self rendersAsynchronously])
    {
      if (startLayerRealization_onceToken != -1) {
        dispatch_once(&startLayerRealization_onceToken, &__block_literal_global_263538);
      }
      objc_initWeak(&location, self);
      objc_super v3 = startLayerRealization_queue;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __41__PXCALayerPromise_startLayerRealization__block_invoke_2;
      v5[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v6, &location);
      dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v5);
      dispatch_async(v3, v4);

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PXCALayerPromise *)self _realizeLayer];
    }
  }
}

void __41__PXCALayerPromise_startLayerRealization__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _realizeLayer];
}

void __41__PXCALayerPromise_startLayerRealization__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -8);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.photos.layerpromise", v2);
  v1 = (void *)startLayerRealization_queue;
  startLayerRealization_queue = (uint64_t)v0;
}

- (void)dealloc
{
  [(CALayer *)self->_layer setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PXCALayerPromise;
  [(PXCALayerPromise *)&v3 dealloc];
}

- (PXCALayerPromise)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXCALayerPromise;
  CGRect result = [(PXCALayerPromise *)&v3 init];
  if (result)
  {
    result->_contentsScale = 1.0;
    result->_rendersAsynchronouslCGFloat y = 1;
  }
  return result;
}

@end