@interface PVInstructionGraphTransformNode
+ (id)newTransformNode:(id)a3 transform:(CGAffineTransform *)a4;
- (CGAffineTransform)transform;
- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4;
- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4;
- (PVInstructionGraphNode)inputNode;
- (PVInstructionGraphTransformNode)initWithInputNode:(id)a3 transform:(CGAffineTransform *)a4;
- (id)getAllSourceNodes;
- (id)requiredSourceTrackIDs;
- (int)transformOrigin;
- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4;
- (void)setInputNode:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setTransformOrigin:(int)a3;
- (void)unloadIGNode;
@end

@implementation PVInstructionGraphTransformNode

+ (id)newTransformNode:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  long long v8 = *(_OWORD *)&a4->c;
  v11[0] = *(_OWORD *)&a4->a;
  v11[1] = v8;
  v11[2] = *(_OWORD *)&a4->tx;
  v9 = (void *)[v7 initWithInputNode:v6 transform:v11];

  return v9;
}

- (PVInstructionGraphTransformNode)initWithInputNode:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PVInstructionGraphTransformNode;
  id v7 = [(PVInstructionGraphNode *)&v12 init];
  long long v8 = v7;
  if (v7)
  {
    [(PVInstructionGraphTransformNode *)v7 setInputNode:v6];
    long long v9 = *(_OWORD *)&a4->c;
    v11[0] = *(_OWORD *)&a4->a;
    v11[1] = v9;
    v11[2] = *(_OWORD *)&a4->tx;
    [(PVInstructionGraphTransformNode *)v8 setTransform:v11];
    [(PVInstructionGraphTransformNode *)v8 setTransformOrigin:2];
  }

  return v8;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v6 = a4;
  id v7 = [(PVInstructionGraphTransformNode *)self inputNode];
  uint64_t v8 = *(void *)a3.m_Obj;
  uint64_t v9 = v8;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
  }
  [v7 loadIGNode:&v9 returnLoadedEffects:v6];
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
  }
}

- (void)unloadIGNode
{
  id v2 = [(PVInstructionGraphTransformNode *)self inputNode];
  [v2 unloadIGNode];
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  objc_super v12 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v48, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphTransformNode hgNodeForTime:...]");
  v13 = [(PVInstructionGraphTransformNode *)self inputNode];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v47 = *a3;
  uint64_t v14 = *(void *)a6.m_Obj;
  uint64_t v46 = v14;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 16))(v14);
  }
  if (v13) {
    [v13 hgNodeForTime:&v47 trackInputs:a4 renderer:a5 igContext:&v46];
  }
  else {
    *objc_super v12 = 0;
  }
  if (v46) {
    (*(void (**)(uint64_t))(*(void *)v46 + 24))(v46);
  }

  double v15 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
  double v17 = v16;
  float v18 = (*(float (**)(void))(**(void **)a6.m_Obj + 48))();
  memset(&v45, 0, sizeof(v45));
  [(PVInstructionGraphTransformNode *)self transform];
  int v19 = [(PVInstructionGraphTransformNode *)self transformOrigin];
  double v20 = v18;
  double v21 = v15 * v18;
  double v22 = v17 * v20;
  if (v19)
  {
    if (v19 == 1) {
      double v23 = v17 * v20;
    }
    else {
      double v23 = v22 * 0.5;
    }
    if (v19 == 1) {
      double v24 = 0.0;
    }
    else {
      double v24 = v21 * 0.5;
    }
  }
  else
  {
    double v24 = *MEMORY[0x1E4F1DAD8];
    double v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeTranslation(&t1, -v24, -v23);
  CGAffineTransform t2 = v45;
  CGAffineTransformConcat(&v52, &t1, &t2);
  CGAffineTransformMakeTranslation(&v49, v24, v23);
  CGAffineTransformConcat(&v44, &v52, &v49);
  v30 = *v12;
  v43 = v30;
  if (v30) {
    (*(void (**)(HGXForm *))(*(void *)v30 + 16))(v30);
  }
  CGAffineTransform v42 = v44;
  int v31 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)a6.m_Obj + 64))(*(void *)a6.m_Obj, v25, v26, v27, v28, v29);
  HGXFormForCGAffineTransform(&v43, &v42, v31, (HGXForm **)&v52);
  v32 = *v12;
  CGFloat a = v52.a;
  if (*v12 == *(HGXForm **)&v52.a)
  {
    if (v32) {
      (*(void (**)(HGXForm *))(*(void *)v32 + 24))(v32);
    }
  }
  else
  {
    if (v32)
    {
      (*(void (**)(HGXForm *))(*(void *)v32 + 24))(v32);
      CGFloat a = v52.a;
    }
    *(CGFloat *)objc_super v12 = a;
    v52.CGFloat a = 0.0;
  }
  if (v43) {
    (*(void (**)(HGXForm *))(*(void *)v43 + 24))(v43);
  }
  if ([(PVInstructionGraphNode *)self isDebugDrawingEnabled])
  {
    float v35 = v21;
    float v36 = v22;
    uint64_t v37 = HGRectMake4f(v34, 0.0, 0.0, v35, v36);
    uint64_t v39 = v38;
    v40 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    *(void *)&v54.var0 = v37;
    *(void *)&v54.var2 = v39;
    HGSolidColor::HGSolidColor(v40, v54);
  }
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v48);
  return v41;
}

- (id)requiredSourceTrackIDs
{
  id v2 = [(PVInstructionGraphTransformNode *)self inputNode];
  v3 = [v2 requiredSourceTrackIDs];

  return v3;
}

- (id)getAllSourceNodes
{
  id v2 = [(PVInstructionGraphTransformNode *)self inputNode];
  v3 = [v2 getAllSourceNodes];

  return v3;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v6 = v4;
  id v15 = a3;
  double v7 = (*(double (**)(void))(**(void **)a4.m_Obj + 40))();
  double v9 = v8;
  double v10 = (*(float (**)(void))(**(void **)a4.m_Obj + 48))();
  *(void *)uint64_t v6 = 0;
  *(void *)(v6 + 8) = 0;
  *(double *)(v6 + 16) = v7 * v10;
  *(double *)(v6 + 24) = v9 * v10;

  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
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

- (int)transformOrigin
{
  return self->_transformOrigin;
}

- (void)setTransformOrigin:(int)a3
{
  self->_transformOrigin = a3;
}

- (PVInstructionGraphNode)inputNode
{
  return self->_inputNode;
}

- (void)setInputNode:(id)a3
{
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->CGFloat a = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].d;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.CGFloat a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.tx = v3;
}

- (void).cxx_destruct
{
}

@end