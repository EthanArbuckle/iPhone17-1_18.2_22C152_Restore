@interface PVInstructionGraphGeneratorNode
+ (id)newGeneratorNode:(id)a3;
- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4;
- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4;
- (PVEffect)generatorEffect;
- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3;
- (id)instructionGraphNodeDescription;
- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4;
- (void)setGeneratorEffect:(id)a3;
- (void)unloadIGNode;
@end

@implementation PVInstructionGraphGeneratorNode

+ (id)newGeneratorNode:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PVInstructionGraphGeneratorNode);
  [(PVInstructionGraphGeneratorNode *)v4 setGeneratorEffect:v3];

  return v4;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v5 = a4;
  [*(id *)&self->super._transform.ty loadEffect];
  if (v5) {
    [v5 addObject:*(void *)&self->super._transform.ty];
  }
}

- (void)unloadIGNode
{
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v11 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v50, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphGeneratorNode hgNodeForTime:...]");
  if (*(void *)&self->super._transform.ty)
  {
    uint64_t v49 = *(void *)a6.m_Obj;
    if (v49) {
      (*(void (**)(uint64_t))(*(void *)v49 + 16))(v49);
    }
    [(PVInstructionGraphNode *)self loadIGNode:&v49];
    if (v49) {
      (*(void (**)(uint64_t))(*(void *)v49 + 24))(v49);
    }
    unsigned __int8 v15 = atomic_load(HGLogger::_enabled);
    if (v15)
    {
      id v16 = [*(id *)&self->super._transform.ty effectID];
      uint64_t v17 = [v16 UTF8String];
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Getting output node from generator effect (%s)\n", v18, v19, v17);
    }
    if ((int)HGLogger::getLevel((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", v14) >= 1)
    {
      CGFloat ty = self->super._transform.ty;
      if (ty == 0.0) {
        memset(&range, 0, sizeof(range));
      }
      else {
        [*(id *)&ty effectRange];
      }
      v23 = CMTimeRangeCopyDescription(0, &range);
      v24 = v23;
      unsigned __int8 v25 = atomic_load(HGLogger::_enabled);
      if (v25)
      {
        uint64_t v26 = [v23 UTF8String];
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Effect Time Range: %s\n", v27, v28, v26);
      }
      CFRelease(v24);
    }
    void *v11 = 0;
    v41 = v42;
    v42[0] = 0;
    v43[0] = 0;
    v43[1] = 0;
    v42[1] = 0;
    v42[2] = v43;
    v43[2] = v44;
    v44[0] = 0;
    v45[0] = 0;
    v45[1] = 0;
    v44[1] = 0;
    v44[2] = v45;
    v45[2] = v46;
    v46[0] = 0;
    v47[0] = 0;
    v47[1] = 0;
    v46[1] = 0;
    v46[2] = v47;
    CGFloat v29 = self->super._transform.ty;
    int64_t var3 = a3->var3;
    long long v38 = *(_OWORD *)&a3->var0;
    uint64_t v30 = *(void *)a6.m_Obj;
    uint64_t v37 = v30;
    if (v30) {
      (*(void (**)(uint64_t))(*(void *)v30 + 16))(v30);
    }
    if (v29 == 0.0)
    {
      v31 = 0;
    }
    else
    {
      [*(id *)&v29 hgNodeForTime:&v38 inputs:&v41 renderer:a5 igContext:&v37];
      v31 = v40;
      if (!v40)
      {
LABEL_25:
        if (v37) {
          (*(void (**)(uint64_t))(*(void *)v37 + 24))(v37);
        }
        v36 = v31;
        if (v31) {
          (*(void (**)(HGXForm *))(*(void *)v31 + 16))(v31);
        }
        [(PVInstructionGraphSourceNode *)self transform];
        int v32 = (*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))();
        HGXFormForCGAffineTransform(&v36, v35, v32, &v40);
        v33 = v40;
        if (v31 == v40)
        {
          if (v31) {
            (*(void (**)(HGXForm *))(*(void *)v31 + 24))(v31);
          }
        }
        else
        {
          if (v31)
          {
            (*(void (**)(HGXForm *))(*(void *)v31 + 24))(v31);
            v33 = v40;
          }
          void *v11 = v33;
          v40 = 0;
        }
        if (v36) {
          (*(void (**)(HGXForm *))(*(void *)v36 + 24))(v36);
        }
        [(PVInstructionGraphGeneratorNode *)self unloadIGNode];
        PVInputHGNodeMap<unsigned int>::~PVInputHGNodeMap(&v41);
        goto LABEL_38;
      }
      void *v11 = v40;
    }
    v40 = 0;
    goto LABEL_25;
  }
  unsigned __int8 v21 = atomic_load(HGLogger::_enabled);
  if (v21) {
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Generator effect is Nil. Returning empty HGNode\n", v12, v13);
  }
  v22 = (HGNode *)HGObject::operator new(0x1A0uLL);
  HGNode::HGNode(v22);
  void *v11 = v22;
LABEL_38:
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v50);
  return v34;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v6 = v4;
  id v20 = a3;
  *(void *)uint64_t v6 = 0;
  *(void *)(v6 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v6 + 16) = _Q0;
  double v12 = (*(double (**)(void))(**(void **)a4.m_Obj + 40))();
  double v14 = v13;
  double v15 = (*(float (**)(void))(**(void **)a4.m_Obj + 48))();
  *(double *)(v6 + 16) = v12 * v15;
  *(double *)(v6 + 24) = v14 * v15;

  result.int64_t var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  id v17 = a4;
  double v7 = (*(double (**)(void))(**(void **)a5.m_Obj + 40))();
  double v9 = v8;
  float v10 = (*(float (**)(void))(**(void **)a5.m_Obj + 48))();
  [v17 outputSize];
  float v11 = v9;
  double v12 = (float)(v10 * v11);
  float v13 = v7;
  *(float *)&double v7 = v10 * v13;
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
  *(float *)&double v14 = v12 / v14;
  float64x2_t v15 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, *(float *)&v14, (float)-*(float *)&v14, 1.0);
  v15.f64[0] = *(float *)&v7 * 0.5;
  PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)retstr, v15, v12 * 0.5, 0.0);

  return result;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  uint64_t v24 = *(void *)a3.m_Obj;
  if (v24) {
    (*(void (**)(uint64_t, SEL))(*(void *)v24 + 16))(v24, a2);
  }
  v23.id receiver = self;
  v23.super_class = (Class)PVInstructionGraphGeneratorNode;
  id v5 = [(PVInstructionGraphNode *)&v23 dotTreeLabel:&v24];
  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 24))(v24);
  }
  if (*(void *)&self->super._transform.ty)
  {
    int v6 = PVInstructionGraphContext::DotTreeLogLevel(*(PVInstructionGraphContext **)a3.m_Obj);
    double v7 = [*(id *)&self->super._transform.ty displayName];
    double v8 = [v5 stringByAppendingFormat:@" [%@]", v7];

    if (v6 >= 2)
    {
      double v9 = [*(id *)&self->super._transform.ty effectType];
      float v10 = [*(id *)&self->super._transform.ty effectID];
      float v11 = +[PVEffect categoryForEffectID:v10];
      uint64_t v12 = [v8 stringByAppendingFormat:@" {%@, %@}", v9, v11];

      double v8 = (void *)v12;
    }
    CGFloat ty = self->super._transform.ty;
    if (ty == 0.0)
    {
      uint64_t super_class_low = 0;
      id receiver = 0;
      memset(v22, 0, sizeof(v22));
    }
    else
    {
      [*(id *)&ty effectRange];
      id receiver = v22[0].receiver;
      uint64_t super_class_low = LODWORD(v22[0].super_class);
    }
    *(void *)&time.flags = *(Class *)((char *)&v22[0].super_class + 4);
    HIDWORD(time.epoch) = HIDWORD(v22[1].receiver);
    time.value = (CMTimeValue)receiver;
    time.timescale = super_class_low;
    double v16 = objc_msgSend(NSString, "stringWithFormat:", @"{%lld/%d = %.3f}", receiver, super_class_low, CMTimeGetSeconds(&time));
    CGFloat v17 = self->super._transform.ty;
    if (v17 == 0.0) {
      memset(&range, 0, sizeof(range));
    }
    else {
      [*(id *)&v17 effectRange];
    }
    CMTimeRangeGetEnd(&v21, &range);
    CMTime time = v21;
    double v18 = objc_msgSend(NSString, "stringWithFormat:", @"{%lld/%d = %.3f}", v21.value, v21.timescale, CMTimeGetSeconds(&time));
    id v5 = [v8 stringByAppendingFormat:@"\nRange: Start (%@) End (%@)", v16, v18];
  }

  return v5;
}

- (id)instructionGraphNodeDescription
{
  v10.id receiver = self;
  v10.super_class = (Class)PVInstructionGraphGeneratorNode;
  id v3 = [(PVInstructionGraphSourceNode *)&v10 instructionGraphNodeDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  id v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  [v4 setObject:v6 forKeyedSubscript:@"class"];

  CGFloat ty = self->super._transform.ty;
  if (ty != 0.0)
  {
    double v8 = [*(id *)&ty effectDescription];
    [v4 setObject:v8 forKeyedSubscript:@"effect"];
  }

  return v4;
}

- (PVEffect)generatorEffect
{
  return *(PVEffect **)&self->super._transform.ty;
}

- (void)setGeneratorEffect:(id)a3
{
}

- (void).cxx_destruct
{
}

@end