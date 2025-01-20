@interface UIDynamicsDebug
- (BOOL)enabled;
- (BOOL)showFields;
- (BOOL)showOutlineInterior;
- (BOOL)showPhysics;
- (GLKView)debugView;
- (UIDynamicAnimator)animator;
- (UIDynamicsDebug)init;
- (UIDynamicsDebug)initWithAnimator:(id)a3;
- (void)_setupDebugViewIfNeccessary;
- (void)_teardownDebugView;
- (void)captureDebugInformation;
- (void)dealloc;
- (void)glkView:(id)a3 drawInRect:(CGRect)a4;
- (void)setAnimator:(id)a3;
- (void)setDebugView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setNeedsDisplay;
- (void)setShowFields:(BOOL)a3;
- (void)setShowOutlineInterior:(BOOL)a3;
- (void)setShowPhysics:(BOOL)a3;
@end

@implementation UIDynamicsDebug

- (UIDynamicsDebug)initWithAnimator:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UIDynamicsDebug.mm", 91, @"Invalid parameter not satisfying: %@", @"animator" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)UIDynamicsDebug;
  v6 = [(UIDynamicsDebug *)&v11 init];
  v7 = v6;
  if (v6)
  {
    p_showPhysics = &v6->_showPhysics;
    objc_storeWeak((id *)&v6->_animator, v5);
    *(_WORD *)p_showPhysics = 257;
    v7->_showFields = 1;
  }

  return v7;
}

- (UIDynamicsDebug)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  v4 = [NSString stringWithUTF8String:"-[UIDynamicsDebug init]"];
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"Don't call %@.", v4 format];

  return 0;
}

- (void)dealloc
{
  [(UIDynamicsDebug *)self _teardownDebugView];
  v3.receiver = self;
  v3.super_class = (Class)UIDynamicsDebug;
  [(UIDynamicsDebug *)&v3 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIDynamicsDebug *)self animator];
  uint64_t v6 = [v5 _referenceSystemType];

  if (v6)
  {
    self->_enabled = v3;
    if (v3)
    {
      [(UIDynamicsDebug *)self _setupDebugViewIfNeccessary];
    }
    else if (self->_debugView)
    {
      [(UIDynamicsDebug *)self _teardownDebugView];
    }
  }
  else
  {
    NSLog(&cfstr_DynamicsDebugR.isa);
  }
}

- (void)captureDebugInformation
{
  p_enabled = &self->_enabled;
  if (self->_enabled)
  {
    [(GLKView *)self->_debugView frame];
    CGFloat Width = CGRectGetWidth(v29);
    [*((id *)p_enabled + 2) frame];
    CGFloat Height = CGRectGetHeight(v30);
    [*((id *)p_enabled + 2) frame];
    CGFloat v16 = CGRectGetWidth(v31);
    [*((id *)p_enabled + 2) frame];
    CGFloat v15 = CGRectGetHeight(v32);
    v4 = [(UIDynamicsDebug *)self animator];
    id v5 = [v4 _world];
    PKGet_PTM_RATIO();
    v6.f64[0] = Width;
    v6.f64[1] = Height;
    __asm { FMOV            V1.2D, #0.5 }
    *(float32x2_t *)&_Q1.f64[0] = vcvt_f32_f64(vdivq_f64((float64x2_t)xmmword_186B93B00, vmulq_f64(v6, _Q1)));
    v12.f64[0] = v15;
    v12.f64[1] = v16;
    __asm { FMOV            V2.2D, #-0.5 }
    *(float32x2_t *)&_Q2.f64[0] = vcvt_f32_f64(vmulq_f64(v12, _Q2));
    float32x2_t v14 = vmul_f32(*(float32x2_t *)&_Q2.f64[0], 0);
    int v19 = LODWORD(_Q1.f64[0]);
    uint64_t v21 = 0;
    int v22 = HIDWORD(_Q1.f64[0]);
    uint64_t v20 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 1065353216;
    float32x2_t v26 = vadd_f32(vadd_f32(v14, vmul_f32((float32x2_t)vrev64_s32(*(int32x2_t *)&_Q2.f64[0]), *(float32x2_t *)&_Q1.f64[0])), 0);
    float v27 = vaddv_f32(v14) + 0.0;
    float v28 = v27 + 1.0;
    objc_msgSend(v5, "debugDraw:matrix:showsPhysics:showsOutlineInterior:showsFields:", &v19, p_enabled[1], p_enabled[2], p_enabled[3]);
  }
}

- (void)setNeedsDisplay
{
  p_enabled = &self->_enabled;
  if (self->_enabled)
  {
    BOOL v3 = [(GLKView *)self->_debugView superview];
    [v3 bringSubviewToFront:*((void *)p_enabled + 2)];

    v4 = (void *)*((void *)p_enabled + 2);
    [v4 setNeedsDisplay];
  }
}

- (void)_setupDebugViewIfNeccessary
{
  p_effect = &self->_effect;
  if (!self->_debugView)
  {
    v4 = [(UIDynamicsDebug *)self animator];
    id v5 = p_effect[1];
    if (!v5)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F38D58]) initWithAPI:2];
      v7 = p_effect[1];
      p_effect[1] = (GLKBaseEffect *)v6;

      id v5 = p_effect[1];
    }
    [MEMORY[0x1E4F38D58] setCurrentContext:v5];
    uint64_t v27 = 0;
    float v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v8 = (void *)_MergedGlobals_1028;
    uint64_t v30 = _MergedGlobals_1028;
    if (!_MergedGlobals_1028)
    {
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      uint64_t v24 = ___ZL15getGLKViewClassv_block_invoke;
      uint64_t v25 = &unk_1E52EC7E8;
      float32x2_t v26 = &v27;
      ___ZL15getGLKViewClassv_block_invoke((uint64_t)&v22);
      v8 = (void *)v28[3];
    }
    v9 = v8;
    _Block_object_dispose(&v27, 8);
    id v10 = [v9 alloc];
    [v4 _referenceSystemBounds];
    uint64_t v11 = objc_msgSend(v10, "initWithFrame:context:", p_effect[1]);
    float64x2_t v12 = p_effect[4];
    p_effect[4] = (GLKBaseEffect *)v11;

    [(GLKBaseEffect *)p_effect[4] setUserInteractionEnabled:0];
    [(GLKBaseEffect *)p_effect[4] setOpaque:0];
    [(GLKBaseEffect *)p_effect[4] setEnableSetNeedsDisplay:1];
    [(GLKBaseEffect *)p_effect[4] setDrawableColorFormat:0];
    [(GLKBaseEffect *)p_effect[4] setDrawableDepthFormat:2];
    [(GLKBaseEffect *)p_effect[4] setDrawableStencilFormat:1];
    [(GLKBaseEffect *)p_effect[4] setDelegate:self];
    [(GLKBaseEffect *)p_effect[4] setAutoresizingMask:18];
    uint64_t v27 = 0;
    float v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v13 = (void *)qword_1EB2603C0;
    uint64_t v30 = qword_1EB2603C0;
    if (!qword_1EB2603C0)
    {
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      uint64_t v24 = ___ZL21getGLKBaseEffectClassv_block_invoke;
      uint64_t v25 = &unk_1E52EC7E8;
      float32x2_t v26 = &v27;
      ___ZL21getGLKBaseEffectClassv_block_invoke((uint64_t)&v22);
      v13 = (void *)v28[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v27, 8);
    uint64_t v15 = objc_opt_new();
    CGFloat v16 = *p_effect;
    *p_effect = (GLKBaseEffect *)v15;

    p_vertexBuffer = &self->_vertexBuffer;
    glGenBuffers(1, p_vertexBuffer);
    glBindBuffer(0x8892u, *p_vertexBuffer);
    glBufferData(0x8892u, 504000, 0, 0x88E8u);
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(0, 2, 0x1406u, 0, 12, 0);
    glEnableVertexAttribArray(2u);
    glVertexAttribPointer(2u, 4, 0x1401u, 1u, 12, (const GLvoid *)8);
    glBlendColor(0.0, 0.0, 0.0, 1.0);
    glBlendFunc(1u, 0x303u);
    v18 = +[UIScreen mainScreen];
    [v18 scale];
    *(float *)&double v19 = v19;
    glLineWidth(*(GLfloat *)&v19);

    if ([v4 _referenceSystemType] == 1)
    {
      uint64_t v20 = [v4 referenceView];
      [v20 addSubview:p_effect[4]];
    }
    else
    {
      uint64_t v20 = [v4 _referenceSystem];
      uint64_t v21 = [v20 collectionView];
      [v21 addSubview:p_effect[4]];
    }
  }
}

- (void)_teardownDebugView
{
  p_effect = &self->_effect;
  [MEMORY[0x1E4F38D58] setCurrentContext:self->_ctx];
  glDeleteBuffers(1, &self->_vertexBuffer);
  [(GLKBaseEffect *)p_effect[4] removeFromSuperview];
  v4 = p_effect[4];
  p_effect[4] = 0;

  id v5 = *p_effect;
  *p_effect = 0;

  uint64_t v6 = (void *)MEMORY[0x1E4F38D58];
  [v6 setCurrentContext:0];
}

- (void)glkView:(id)a3 drawInRect:(CGRect)a4
{
  id v5 = [(UIDynamicsDebug *)self animator];
  uint64_t v6 = [v5 _world];
  uint64_t v7 = [v6 debugDrawPacket];

  v9 = *($E2481A3106FB98D08DAF8961A7085DAF **)v7;
  v8 = *(char **)(v7 + 8);
  uint64_t v10 = *(void *)(v7 + 24);
  glClearColor(0.0, 0.0, 0.0, 0.0);
  glClear(0x4100u);
  if (v8 != (char *)v9)
  {
    unint64_t v11 = (v8 - (char *)v9) >> 3;
    [(GLKBaseEffect *)self->_effect prepareToDraw];
    if (v11 >= 0xA410) {
      unint64_t v11 = 42000;
    }
    if (v11)
    {
      v13 = (float *)(v10 + 8);
      id v14 = &self->_vertices[1];
      v12.i32[0] = 1.0;
      float64x2_t v15 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
      unint64_t v16 = v11;
      do
      {
        float v17 = v13[1];
        int v18 = LODWORD(v17);
        if ((LODWORD(v17) & 0x7FFFFFFFu) > 0x3F800000) {
          float v17 = 1.0;
        }
        if (v18 < 0) {
          float v17 = 0.0;
        }
        float v19 = *(v13 - 2);
        int v20 = LODWORD(v19);
        if ((LODWORD(v19) & 0x7FFFFFFFu) > 0x3F800000) {
          float v19 = 1.0;
        }
        if (v20 < 0) {
          float v19 = 0.0;
        }
        *(double *)&uint8x8_t v21 = (float)(v17 * v19) * 255.0;
        int v22 = *(void *)&v21;
        v21.i32[0] = LODWORD(v14->position.x);
        int16x8_t v23 = (int16x8_t)vmovl_u8(v21);
        v23.i16[0] = v22;
        LOBYTE(v14->position.x) = v22;
        float v24 = *(v13 - 1);
        int v25 = LODWORD(v24);
        if ((LODWORD(v24) & 0x7FFFFFFFu) > 0x3F800000) {
          float v24 = 1.0;
        }
        if (v25 < 0) {
          float v24 = 0.0;
        }
        v23.i16[1] = (int)((float)(v17 * v24) * 255.0);
        LODWORD(v14->position.x) = vmovn_s16(v23).u32[0];
        float v26 = *v13;
        v13 += 4;
        float v27 = v26;
        int v28 = LODWORD(v26);
        if ((LODWORD(v26) & 0x7FFFFFFFu) > 0x3F800000) {
          float v27 = 1.0;
        }
        if (v28 < 0) {
          float v27 = 0.0;
        }
        v29.f32[0] = v17 * v27;
        v29.f32[1] = v17;
        int16x8_t v30 = (int16x8_t)vcvtq_s64_f64(vmulq_f64(vcvtq_f64_f32(v29), v15));
        *(int32x2_t *)v30.i8 = vzip1_s32(*(int32x2_t *)v23.i8, (int32x2_t)vuzp1_s16((int16x4_t)vmovn_s64((int64x2_t)v30), v12));
        LODWORD(v14->position.x) = vmovn_s16(v30).u32[0];
        $E2481A3106FB98D08DAF8961A7085DAF v31 = *v9++;
        v14[-1] = v31;
        id v14 = ($E2481A3106FB98D08DAF8961A7085DAF *)((char *)v14 + 12);
        --v16;
      }
      while (v16);
    }
    glBufferSubData(0x8892u, 0, 12 * v11, self->_vertices);
    glDrawArrays(1u, 0, v11);
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)showPhysics
{
  return self->_showPhysics;
}

- (void)setShowPhysics:(BOOL)a3
{
  self->_showPhysics = a3;
}

- (BOOL)showOutlineInterior
{
  return self->_showOutlineInterior;
}

- (void)setShowOutlineInterior:(BOOL)a3
{
  self->_showOutlineInterior = a3;
}

- (BOOL)showFields
{
  return self->_showFields;
}

- (void)setShowFields:(BOOL)a3
{
  self->_showFields = a3;
}

- (UIDynamicAnimator)animator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animator);
  return (UIDynamicAnimator *)WeakRetained;
}

- (void)setAnimator:(id)a3
{
}

- (GLKView)debugView
{
  return self->_debugView;
}

- (void)setDebugView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_destroyWeak((id *)&self->_animator);
  objc_storeStrong((id *)&self->_ctx, 0);
  objc_storeStrong((id *)&self->_effect, 0);
}

@end