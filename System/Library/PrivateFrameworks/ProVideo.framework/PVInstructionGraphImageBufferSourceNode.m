@interface PVInstructionGraphImageBufferSourceNode
- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4;
- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4;
- (PVInstructionGraphImageBufferSourceNode)initWithPVImageBuffer:(id)a3 transform:(CGAffineTransform *)a4;
- (id).cxx_construct;
- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3;
- (id)instructionGraphNodeDescription;
- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3;
@end

@implementation PVInstructionGraphImageBufferSourceNode

- (PVInstructionGraphImageBufferSourceNode)initWithPVImageBuffer:(id)a3 transform:(CGAffineTransform *)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PVInstructionGraphImageBufferSourceNode;
  v8 = [(PVInstructionGraphSourceNode *)&v17 init];
  v9 = v8;
  v10 = v8;
  if (v8)
  {
    PVRenderManager::INSTANCE((PVRenderManager *)v8, &v16);
    imageBuffer = v10->_imageBuffer;
    v12 = v16;
    if (imageBuffer == v16)
    {
      if (imageBuffer) {
        (*((void (**)(PVImageBuffer *))imageBuffer->super.isa + 3))(imageBuffer);
      }
    }
    else
    {
      if (imageBuffer)
      {
        (*((void (**)(PVImageBuffer *))imageBuffer->super.isa + 3))(imageBuffer);
        v12 = v16;
      }
      v10->_imageBuffer = v12;
    }
    objc_storeStrong((id *)&v9->super._transform.ty, a3);
    long long v13 = *(_OWORD *)&a4->c;
    v15[0] = *(_OWORD *)&a4->a;
    v15[1] = v13;
    v15[2] = *(_OWORD *)&a4->tx;
    [(PVInstructionGraphSourceNode *)v10 setTransform:v15];
  }

  return v10;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3
{
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v10 = v6;
  if ((objc_msgSend(*(id *)&self->super._transform.ty, "canCreateCVPixelBuffer", a3, a4, a5) & 1) == 0
    && ([*(id *)&self->super._transform.ty canCreateHGBitmap] & 1) == 0)
  {
    v22 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v22);
  }
  v11 = (HGNode *)HGObject::operator new(0x1A0uLL);
  HGNode::HGNode(v11);
  PVInstructionGraphImageBufferSourceNode *v10 = v11;
  if ([*(id *)&self->super._transform.ty cvPixelBufferRequiresCopy])
  {
    v12 = +[PVColorSpace preferredDisplayColorSpace];
    long long v13 = (CGImage *)[*(id *)&self->super._transform.ty cgImage];
    if (v13)
    {
      uint64_t v14 = +[PVColorSpace pvColorSpaceFromCGColorSpace:CGImageGetColorSpace(v13)];

      v12 = (void *)v14;
    }
    if (!v12)
    {
      v12 = +[PVColorSpace sRGBColorSpace];
    }
    int v15 = [*(id *)&self->super._transform.ty canCreateCVPixelBuffer];
    CGFloat ty = self->super._transform.ty;
    if (v15)
    {
      objc_super v17 = (__CVBuffer *)[*(id *)&ty cvPixelBufferWithColorSpace:v12];
      if (v17)
      {
        long long v44 = *(_OWORD *)&a3->var0;
        int64_t var3 = a3->var3;
        v18 = *(PVInstructionGraphContext **)a6.m_Obj;
        v43 = v18;
        if (v18) {
          (*(void (**)(PVInstructionGraphContext *))(*(void *)v18 + 16))(v18);
        }
        PVCreateInputGraphForPixelBuffer(v17, &v43, &v49);
        v19 = *v10;
        v20 = v49;
        if (*v10 == v49)
        {
          if (v19) {
            (*(void (**)(HGNode *))(*(void *)v19 + 24))(v19);
          }
        }
        else
        {
          if (v19)
          {
            (*(void (**)(HGNode *))(*(void *)v19 + 24))(v19);
            v20 = v49;
          }
          PVInstructionGraphImageBufferSourceNode *v10 = v20;
          v49 = 0;
        }
        if (v43) {
          (*(void (**)(PVInstructionGraphContext *))(*(void *)v43 + 24))(v43);
        }
      }
      else
      {
        NSLog(&cfstr_WarningPvigima_0.isa, *(void *)&self->super._transform.ty);
      }
    }
    else if ([*(id *)&ty canCreateHGBitmap])
    {
      CGFloat v23 = self->super._transform.ty;
      if (v23 == 0.0)
      {
        v49 = 0;
      }
      else
      {
        [*(id *)&v23 hgBitmapWithColorSpace:v12];
        if (v49)
        {
          v24 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
          HGBitmapLoader::HGBitmapLoader(v24, (HGBitmap *)v49);
          v25 = *v10;
          if (*v10 == (HGNode *)v24)
          {
            if (v24) {
              (*(void (**)(HGBitmapLoader *))(*(void *)v24 + 24))(v24);
            }
          }
          else
          {
            if (v25) {
              (*(void (**)(HGNode *))(*(void *)v25 + 24))(v25);
            }
            PVInstructionGraphImageBufferSourceNode *v10 = (HGNode *)v24;
          }
          Storage = (const void *)HGBitmap::GetStorage((HGBitmap *)v49);
          if (Storage)
          {
            if (v28)
            {
              v29 = v28;
              v41 = v24;
              if (v24) {
                (*(void (**)(HGBitmapLoader *))(*(void *)v24 + 16))(v24);
              }
              id v30 = v29[3];
              v31 = PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
              int v32 = PVInstructionGraphContext::WorkingColorSpaceConformIntent(*(PVInstructionGraphContext **)a6.m_Obj);
              ColorConformInput(&v41, v30, v31, v32, 0, &v42);
              v33 = v42;
              if (v24 == v42)
              {
                if (v24) {
                  (*(void (**)(HGBitmapLoader *))(*(void *)v24 + 24))(v24);
                }
              }
              else
              {
                if (v24)
                {
                  (*(void (**)(HGBitmapLoader *))(*(void *)v24 + 24))(v24);
                  v33 = v42;
                }
                PVInstructionGraphImageBufferSourceNode *v10 = (HGNode *)v33;
                v42 = 0;
              }

              if (v41) {
                (*(void (**)(HGColorConform *))(*(void *)v41 + 24))(v41);
              }
            }
          }
          if (v49) {
            (*(void (**)(HGNode *))(*(void *)v49 + 24))(v49);
          }
        }
      }
    }

    v11 = *v10;
    if (*v10)
    {
LABEL_61:
      v40 = v11;
      (*(void (**)(HGNode *))(*(void *)v11 + 16))(v11);
      [(PVInstructionGraphSourceNode *)self applyWrapModeToInput:&v40];
      v34 = *(void (**)(HGNode *))(*(void *)v11 + 24);
      if (v11 == v49)
      {
        v34(v11);
      }
      else
      {
        v34(v11);
        PVInstructionGraphImageBufferSourceNode *v10 = v49;
        v49 = 0;
      }
      if (v40) {
        (*(void (**)(HGNode *))(*(void *)v40 + 24))(v40);
      }
      v35 = (HGXForm *)*v10;
      v39 = v35;
      if (v35) {
        (*(void (**)(HGXForm *))(*(void *)v35 + 16))(v35);
      }
      [(PVInstructionGraphSourceNode *)self transform];
      int v36 = (*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))();
      HGXFormForCGAffineTransform(&v39, v38, v36, (HGXForm **)&v49);
      v37 = v49;
      if (v35 == (HGXForm *)v49)
      {
        if (v35) {
          (*(void (**)(HGXForm *))(*(void *)v35 + 24))(v35);
        }
      }
      else
      {
        if (v35)
        {
          (*(void (**)(HGXForm *))(*(void *)v35 + 24))(v35);
          v37 = v49;
        }
        PVInstructionGraphImageBufferSourceNode *v10 = v37;
        v49 = 0;
      }
      v26 = (PVInstructionGraphContext *)v39;
      if (v39) {
        return (HGRef<HGNode>)(*(uint64_t (**)(HGXForm *))(*(void *)v39 + 24))(v39);
      }
    }
  }
  else
  {
    v21 = (__CVBuffer *)[*(id *)&self->super._transform.ty cvPixelBuffer];
    if (v21)
    {
      long long v47 = *(_OWORD *)&a3->var0;
      int64_t v48 = a3->var3;
      v46 = *(PVInstructionGraphContext **)a6.m_Obj;
      if (v46) {
        (*(void (**)(PVInstructionGraphContext *))(*(void *)v46 + 16))(v46);
      }
      PVCreateInputGraphForPixelBuffer(v21, &v46, &v49);
      if (v11 == v49)
      {
        if (v11) {
          (*(void (**)(HGNode *))(*(void *)v11 + 24))(v11);
        }
      }
      else
      {
        if (v11) {
          (*(void (**)(HGNode *))(*(void *)v11 + 24))(v11);
        }
        v11 = v49;
        PVInstructionGraphImageBufferSourceNode *v10 = v49;
        v49 = 0;
      }
      v26 = v46;
      if (v46) {
        v26 = (PVInstructionGraphContext *)(*(uint64_t (**)(PVInstructionGraphContext *))(*(void *)v46 + 24))(v46);
      }
    }
    else
    {
      NSLog(&cfstr_WarningPvigima.isa, *(void *)&self->super._transform.ty);
    }
    if (v11) {
      goto LABEL_61;
    }
  }
  return (HGRef<HGNode>)v26;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v6 = v4;
  id v7 = a3;
  *(void *)uint64_t v6 = 0;
  *(void *)(v6 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v6 + 16) = _Q0;
  if (([*(id *)&self->super._transform.ty canCreateCVPixelBuffer] & 1) != 0
    || ([*(id *)&self->super._transform.ty canCreateHGBitmap] & 1) != 0)
  {
    [*(id *)&self->super._transform.ty size];
    double v26 = v13;
    double v25 = v14;
    if (v14 > 0.0 && v13 > 0.0)
    {
      [(PVInstructionGraphSourceNode *)self transform];
      float64x2_t v15 = vaddq_f64(vmulq_n_f64(v28, v25), vmulq_n_f64(v29, v26));
      double v16 = v15.f64[1];
      float64x2_t v27 = v15;
      if (v15.f64[1] >= v15.f64[0])
      {
        [v7 outputSize];
        double v19 = v16 / v20;
        float64x2_t v17 = v27;
      }
      else
      {
        [v7 outputSize];
        float64x2_t v17 = v27;
        double v19 = v27.f64[0] / v18;
      }
      *(float64x2_t *)(v6 + 16) = vdivq_f64(v17, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v19, 0));
    }
  }

  result.int64_t var3 = v24;
  result.var2 = v23;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  id v18 = a4;
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  if (([*(id *)&self->super._transform.ty canCreateCVPixelBuffer] & 1) != 0
    || ([*(id *)&self->super._transform.ty canCreateHGBitmap] & 1) != 0)
  {
    double v8 = (*(double (**)(void))(**(void **)a5.m_Obj + 40))();
    double v10 = v9;
    float v11 = (*(float (**)(void))(**(void **)a5.m_Obj + 48))();
    [v18 outputSize];
    float v12 = v10;
    double v13 = (float)(v11 * v12);
    float v14 = v8;
    *(float *)&double v8 = v11 * v14;
    *(float *)&double v15 = v13 / v15;
    float64x2_t v16 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, *(float *)&v15, (float)-*(float *)&v15, 1.0);
    v16.f64[0] = *(float *)&v8 * 0.5;
    PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)retstr, v16, v13 * 0.5, 0.0);
  }

  return result;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  uint64_t v10 = *(void *)a3.m_Obj;
  if (v10) {
    (*(void (**)(uint64_t, SEL))(*(void *)v10 + 16))(v10, a2);
  }
  v9.receiver = self;
  v9.super_class = (Class)PVInstructionGraphImageBufferSourceNode;
  uint64_t v4 = [(PVInstructionGraphNode *)&v9 dotTreeLabel:&v10];
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 24))(v10);
  }
  [*(id *)&self->super._transform.ty size];
  id v7 = objc_msgSend(v4, "stringByAppendingFormat:", @"\n[%.0f x %.0f]", v5, v6);

  return v7;
}

- (id)instructionGraphNodeDescription
{
  v11.receiver = self;
  v11.super_class = (Class)PVInstructionGraphImageBufferSourceNode;
  v3 = [(PVInstructionGraphSourceNode *)&v11 instructionGraphNodeDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 setObject:v6 forKeyedSubscript:@"class"];

  [*(id *)&self->super._transform.ty size];
  objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"%.0f x %.0f", v7, v8);
  [v4 setObject:v9 forKeyedSubscript:@"size"];

  return v4;
}

- (void).cxx_destruct
{
  imageBuffer = self->_imageBuffer;
  if (imageBuffer) {
    (*((void (**)(PVImageBuffer *, SEL))imageBuffer->super.isa + 3))(imageBuffer, a2);
  }

  objc_storeStrong((id *)&self->super._transform.ty, 0);
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  return self;
}

@end