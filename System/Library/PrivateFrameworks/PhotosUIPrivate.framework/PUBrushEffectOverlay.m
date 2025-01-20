@interface PUBrushEffectOverlay
- (PUBrushEffectOverlay)initWithTimeScale:(double)a3;
- (void)_disableRendersContinuously:(id)a3;
- (void)_layoutSubviews;
- (void)_recycleVFXView;
- (void)endEmission;
- (void)layoutSubviews;
- (void)loadEffect;
- (void)setBrushPosition:(CGPoint)a3;
- (void)setBrushRadius:(double)a3;
- (void)setMaxEDR:(double)a3;
- (void)setNormalizedBrushPosition:(CGPoint)a3;
- (void)startEmission;
@end

@implementation PUBrushEffectOverlay

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_emitterWand, 0);
  objc_storeStrong((id *)&self->_vfxView, 0);
  objc_storeStrong((id *)&self->_world, 0);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUBrushEffectOverlay;
  [(PUBrushEffectOverlay *)&v3 layoutSubviews];
  [(PUBrushEffectOverlay *)self _layoutSubviews];
}

- (void)_layoutSubviews
{
  vfxView = self->_vfxView;
  [(PUBrushEffectOverlay *)self bounds];
  -[VFXView setFrame:](vfxView, "setFrame:");
}

- (void)_recycleVFXView
{
  [(VFXView *)self->_vfxView removeFromSuperview];
  objc_super v3 = (VFXView *)objc_opt_new();
  vfxView = self->_vfxView;
  self->_vfxView = v3;

  [(VFXView *)self->_vfxView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = self->_vfxView;
  v6 = [MEMORY[0x1E4FB1618] clearColor];
  [(VFXView *)v5 setBackgroundColor:v6];

  v7 = self->_vfxView;
  [(PUBrushEffectOverlay *)self bounds];
  -[VFXView setFrame:](v7, "setFrame:");
  CGColorSpaceRef v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE0]);
  [(VFXView *)self->_vfxView setColorSpace:v8];
  [(VFXView *)self->_vfxView setPixelFormat:115];
  [(VFXView *)self->_vfxView setWantsExtendedDynamicRange:1];
  CFRelease(v8);
  [(PUBrushEffectOverlay *)self addSubview:self->_vfxView];
  [(VFXView *)self->_vfxView setRendersContinuously:0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PUBrushEffectOverlay__recycleVFXView__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __39__PUBrushEffectOverlay__recycleVFXView__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setWorld:*(void *)(*(void *)(a1 + 32) + 408)];
}

- (void)loadEffect
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_world)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 URLForResource:@"wand" withExtension:@"vfx"];
    id v15 = 0;
    v6 = [MEMORY[0x1E4FB39C8] worldWithURL:v5 options:0 error:&v15];
    id v7 = v15;
    world = self->_world;
    self->_world = v6;

    if (v7)
    {
      v9 = __log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v13 = [v7 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v17 = v13;
        _os_log_debug_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    v10 = [(VFXWorld *)self->_world rootNode];
    v11 = [v10 childNodeWithName:@"EmitterWand"];
    emitterWand = self->_emitterWand;
    self->_emitterWand = v11;

    if (!self->_emitterWand)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"PUVFXOverlay.m" lineNumber:263 description:@"emitter wand is nil"];
    }
    [(PUBrushEffectOverlay *)self _recycleVFXView];
  }
}

- (void)setBrushRadius:(double)a3
{
  NSSelectorFromString(&cfstr_Behaviorgraph.isa);
  if (objc_opt_respondsToSelector())
  {
    [(PUBrushEffectOverlay *)self frame];
    double v7 = 0.0 / v5 * 2.0 + -1.0 - (0.0 / v5 * 2.0 + -1.0);
    double v8 = sqrt((0.0 / v6 * 2.0 + -1.0 - (a3 / v6 * 2.0 + -1.0)) * (0.0 / v6 * 2.0 + -1.0 - (a3 / v6 * 2.0 + -1.0)) + v7 * v7);
    id v10 = [(VFXNode *)self->_emitterWand valueForKey:@"behaviorGraph"];
    v9 = [NSNumber numberWithDouble:v8];
    [v10 setValue:v9 forKey:@"radius"];
  }
}

- (void)setBrushPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PUBrushEffectOverlay *)self frame];
  -[PUBrushEffectOverlay setNormalizedBrushPosition:](self, "setNormalizedBrushPosition:", x / v6 * 2.0 + -1.0, -(y / v7 * 2.0 + -1.0));
}

- (void)_disableRendersContinuously:(id)a3
{
}

- (void)endEmission
{
  objc_super v3 = [(VFXNode *)self->_emitterWand valueForKey:@"behaviorGraph"];
  [v3 setValue:MEMORY[0x1E4F1CC28] forKey:@"isWandClick"];

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  [(PUBrushEffectOverlay *)self performSelector:sel__disableRendersContinuously_ withObject:0 afterDelay:1.0];
}

- (void)startEmission
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  if (([(VFXView *)self->_vfxView rendersContinuously] & 1) == 0) {
    [(VFXView *)self->_vfxView setRendersContinuously:1];
  }
  id v3 = [(VFXNode *)self->_emitterWand valueForKey:@"behaviorGraph"];
  [v3 setValue:MEMORY[0x1E4F1CC38] forKey:@"isWandClick"];
}

- (void)setNormalizedBrushPosition:(CGPoint)a3
{
  [(PUBrushEffectOverlay *)self frame];
  CGFloat Width = CGRectGetWidth(v13);
  [(PUBrushEffectOverlay *)self frame];
  *(float *)&CGFloat Width = Width / CGRectGetHeight(v14);
  PXClamp();
  double v6 = v5;
  PXClamp();
  float v7 = v6;
  *(float *)&double v8 = v7 * *(float *)&Width;
  *(float *)&double v9 = v9;
  HIDWORD(v8) = LODWORD(v9);
  id v11 = [MEMORY[0x1E4F29238] valueWithVFXFloat2:v8];
  NSSelectorFromString(&cfstr_Behaviorgraph.isa);
  if (objc_opt_respondsToSelector())
  {
    id v10 = [(VFXNode *)self->_emitterWand valueForKey:@"behaviorGraph"];
    [v10 setValue:v11 forKey:@"wand_position"];
  }
}

- (void)setMaxEDR:(double)a3
{
  if (a3 >= 1.0)
  {
    NSSelectorFromString(&cfstr_Wantsextendedd.isa);
    if (objc_opt_respondsToSelector())
    {
      NSSelectorFromString(&cfstr_Behaviorgraph.isa);
      if (objc_opt_respondsToSelector())
      {
        id v6 = [(VFXNode *)self->_emitterWand valueForKey:@"behaviorGraph", 1.0];
        [(VFXView *)self->_vfxView setWantsExtendedDynamicRange:a3 > 1.0];
        [(VFXView *)self->_vfxView setPixelFormat:115];
        double v5 = [NSNumber numberWithDouble:a3];
        [v6 setValue:v5 forKey:@"EDR"];
      }
    }
  }
}

- (PUBrushEffectOverlay)initWithTimeScale:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUBrushEffectOverlay;
  id v3 = -[PUBrushEffectOverlay initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.editvfx.vfxoverlay", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    [(PUBrushEffectOverlay *)v3 loadEffect];
    float v7 = v3;
  }

  return v3;
}

@end