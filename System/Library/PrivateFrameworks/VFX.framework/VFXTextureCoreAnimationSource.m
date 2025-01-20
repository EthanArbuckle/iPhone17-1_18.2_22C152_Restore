@interface VFXTextureCoreAnimationSource
- (BOOL)requiresMainThreadUpdates;
- (BOOL)supportsMetal;
- (BOOL)usesBoundsInPixels;
- (CALayer)layer;
- (CGSize)layerSizeInPixels;
- (double)__renderLayerUsingMetal:(id)a3 withCARenderer:(id)a4 engineContext:(__CFXEngineContext *)a5 viewport:(double)a6 atTime:;
- (double)__updateTextureWithLayer:(id)a3 texture:(id)a4 engineContext:(__CFXEngineContext *)a5 sampler:(__CFXTextureSampler *)a6;
- (double)layerContentsScaleFactor;
- (float)clearValue;
- (id)layerToFocusForRenderedLayer:(id)a3;
- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)_resizeLayer:(id)a3 toSize:(CGSize)a4 updateLayer:(BOOL)a5 updateTransform:(BOOL)a6 caRenderer:(id)a7;
- (void)dealloc;
- (void)renderWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)setLayer:(id)a3;
@end

@implementation VFXTextureCoreAnimationSource

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXTextureCoreAnimationSource;
  [(VFXTextureSource *)&v3 dealloc];
}

- (BOOL)supportsMetal
{
  return 1;
}

- (void)setLayer:(id)a3
{
  layer = self->_layer;
  if (layer != a3)
  {

    self->_layer = (CALayer *)a3;
  }
}

- (void)renderWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  if (sub_1B6445900((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7))
  {
    uint64_t FrameTime_status = objc_msgSend_metalTextureWithEngineContext_textureSampler_nextFrameTime_status_(self, v13, (uint64_t)a3, (uint64_t)a4, a5, a6);
    uint64_t v22 = sub_1B6445900((uint64_t)a3, v15, v16, v17, v18, v19, v20, v21);
    MEMORY[0x1F4181798](v22, sel__drawFullScreenTexture_, FrameTime_status, v23);
  }
}

- (id)layerToFocusForRenderedLayer:(id)a3
{
  return a3;
}

- (BOOL)usesBoundsInPixels
{
  return 1;
}

- (float)clearValue
{
  return 0.0;
}

- (BOOL)requiresMainThreadUpdates
{
  return 0;
}

- (void)_resizeLayer:(id)a3 toSize:(CGSize)a4 updateLayer:(BOOL)a5 updateTransform:(BOOL)a6 caRenderer:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  int v14 = objc_msgSend_requiresMainThreadUpdates(self, a2, (uint64_t)a3, a5);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B647A364;
  v17[3] = &unk_1E61426A8;
  BOOL v18 = a5;
  v17[4] = a7;
  v17[5] = a3;
  BOOL v19 = a6;
  v17[6] = self;
  *(CGFloat *)&v17[7] = width;
  *(CGFloat *)&v17[8] = height;
  if (v14)
  {
    dispatch_async(MEMORY[0x1E4F14428], v17);
  }
  else
  {
    uint64_t v15 = dispatch_group_create();
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_group_async(v15, global_queue, v17);
    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v15);
  }
}

- (double)__renderLayerUsingMetal:(id)a3 withCARenderer:(id)a4 engineContext:(__CFXEngineContext *)a5 viewport:(double)a6 atTime:
{
  float64x2_t rect2 = vcvt_hight_f64_f32(*(float32x4_t *)&a6);
  objc_msgSend_bounds(a4, a2, (uint64_t)a3, (uint64_t)a4, a5);
  v26.size.CGFloat width = rect2.f64[0];
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.CGFloat height = rect2.f64[1];
  if (!CGRectEqualToRect(v25, v26)) {
    objc_msgSend_setBounds_(a4, v9, v10, v11, 0.0, 0.0, *(_OWORD *)&rect2);
  }
  id v15 = (id)objc_msgSend_layer(a4, v9, v10, v11);
  if (v15 != a3 || a3 && (objc_msgSend_transform(a3, v12, v13, v14), v24 > 0.0)) {
    objc_msgSend__resizeLayer_toSize_updateLayer_updateTransform_caRenderer_(self, v12, (uint64_t)a3, v15 != a3, 1, a4, *(_OWORD *)&rect2);
  }
  objc_msgSend_addUpdateRect_(a4, v12, v13, v14, 0.0, 0.0, *(_OWORD *)&rect2);
  objc_msgSend_render(a4, v16, v17, v18);
  objc_msgSend_nextFrameTime(a4, v19, v20, v21);
  return result;
}

- (double)__updateTextureWithLayer:(id)a3 texture:(id)a4 engineContext:(__CFXEngineContext *)a5 sampler:(__CFXTextureSampler *)a6
{
  uint64_t v13 = sub_1B644558C((uint64_t)a5, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7);
  if (v13)
  {
    if (!sub_1B64B2008(v13, (uint64_t)v14, v15, v16, v17, v18, v19, v20)) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v21, v22, v23, v24, v25, v26, (uint64_t)"animationManager");
    }
    double v27 = sub_1B6447718((uint64_t)a5);
  }
  else
  {
    double v27 = 0.0;
  }
  if (self->super._framebufferSize.width > 0.0 && self->_lastUpdate != v27)
  {
    v28 = objc_msgSend_sharedRegistry(VFXSourceRendererRegistry, v14, v15, v16);
    v30 = objc_msgSend_sourceRendererForEngineContext_source_textureSource_targetTexture_(v28, v29, (uint64_t)a5, (uint64_t)a3, self, a4);
    double v31 = sub_1B6447728((uint64_t)a5);
    double v32 = CACurrentMediaTime();
    objc_msgSend_begin(MEMORY[0x1E4F39CF8], v33, v34, v35);
    objc_msgSend_setTimeOffset_(a3, v36, v37, v38, v31 - v32);
    objc_msgSend_commit(MEMORY[0x1E4F39CF8], v39, v40, v41);
    double lastUpdate = self->_lastUpdate;
    if (lastUpdate == 0.0 || v27 >= self->_nextUpdateDate + -0.0166666667)
    {
      objc_msgSend_beginFrameAtTime_timeStamp_(v30, v42, 0, v43, v32);
      goto LABEL_15;
    }
    if (v27 != lastUpdate)
    {
      objc_msgSend_beginFrameAtTime_timeStamp_(v30, v42, 0, v43, v32);
      objc_msgSend_updateBounds(v30, v45, v46, v47);
      if (CGRectIsEmpty(v59))
      {
        double v55 = INFINITY;
LABEL_22:
        objc_msgSend_endFrame(v30, v48, v49, v50);
        return v55;
      }
LABEL_15:
      self->_double lastUpdate = v27;
      if (a4)
      {
        objc_msgSend___renderLayerUsingMetal_withCARenderer_engineContext_viewport_atTime_(self, v48, (uint64_t)a3, (uint64_t)v30, a5, *(double *)vcvt_hight_f32_f64(0, (float64x2_t)self->super._framebufferSize).i64, v32);
        double v55 = v56;
      }
      else
      {
        double v55 = 0.0;
      }
      sub_1B643DE8C((uint64_t)a6, (uint64_t)v48, v49, v50, v51, v52, v53, v54);
      self->_nextUpdateDate = 3.40282347e38;
      if (v55 != INFINITY && v55 != 3.40282347e38)
      {
        double v57 = CACurrentMediaTime() - v55;
        if (v57 > 0.0) {
          self->_nextUpdateDate = v27 + v57;
        }
      }
      goto LABEL_22;
    }
  }
  return INFINITY;
}

- (CGSize)layerSizeInPixels
{
  v4 = objc_msgSend_layer(self, a2, v2, v3);
  objc_msgSend_bounds(v4, v5, v6, v7);
  double v9 = v8;
  double v11 = v10;
  objc_msgSend_contentsScale(v4, v12, v13, v14);
  double v16 = v15 * v11;
  double v17 = v15 * v9;
  result.CGFloat height = v16;
  result.CGFloat width = v17;
  return result;
}

- (double)layerContentsScaleFactor
{
  v4 = objc_msgSend_layer(self, a2, v2, v3);

  objc_msgSend_contentsScale(v4, v5, v6, v7);
  return result;
}

- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  if (objc_msgSend_supportsMetal(self, a2, (uint64_t)a3, (uint64_t)a4))
  {
    uint64_t v18 = (void *)sub_1B6445900((uint64_t)a3, v11, v12, v13, v14, v15, v16, v17);
    uint64_t v22 = objc_msgSend_device(v18, v19, v20, v21);
    uint64_t v30 = sub_1B6445480((uint64_t)a3, v23, v24, v25, v26, v27, v28, v29);
    double v31 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"CA texture source", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/Texture sources/Custom sources/VFXCoreAnimationSource.m", 417);
    uint64_t v35 = objc_msgSend_layer(self, v32, v33, v34);
    if (v35)
    {
      uint64_t v43 = v35;
      objc_msgSend_layerSizeInPixels(self, v36, v37, v38);
      double v45 = v44;
      double v47 = v46;
      self->super._framebufferSize.CGFloat width = v44;
      self->super._framebufferSize.CGFloat height = v46;
      uint64_t v51 = objc_msgSend_MTLTextureCache(self, v48, v49, v50);
      if (v51)
      {
        uint64_t v53 = (void *)v51;
        BOOL v54 = 0;
      }
      else
      {
        uint64_t v55 = sub_1B64D7C2C(0);
        double v57 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E4F35330], v56, v55, (unint64_t)v45, (unint64_t)v47, 0);
        objc_msgSend_setStorageMode_(v57, v58, 2, v59);
        objc_msgSend_setUsage_(v57, v60, 5, v61);
        uint64_t v53 = objc_msgSend_newTextureWithDescriptor_(v22, v62, (uint64_t)v57, v63);
        objc_msgSend_setMTLTextureCache_(self, v64, (uint64_t)v53, v65);

        BOOL v54 = 1;
      }
      a6->var0 = v54;
      a6->var1 = 1;
      objc_msgSend___updateTextureWithLayer_texture_engineContext_sampler_(self, v52, v43, (uint64_t)v53, a3, a4);
      *(void *)a5 = v66;
      *(double *)(v30 + 160) = *(double *)(v30 + 160) + CACurrentMediaTime() - v31;
      prof_endFlame();
    }
    else
    {
      sub_1B63F2F54(16, @"Error: VFXTextureCoreAnimationSource::textureProxy -> no layer", v37, v38, v39, v40, v41, v42, (uint64_t)v68.receiver);
      *(double *)(v30 + 160) = *(double *)(v30 + 160) + CACurrentMediaTime() - v31;
      prof_endFlame();
      return 0;
    }
  }
  else
  {
    v68.receiver = self;
    v68.super_class = (Class)VFXTextureCoreAnimationSource;
    return [(VFXTextureSource *)&v68 metalTextureWithEngineContext:a3 textureSampler:a4 nextFrameTime:a5 status:a6];
  }
  return v53;
}

- (CALayer)layer
{
  return self->_layer;
}

@end