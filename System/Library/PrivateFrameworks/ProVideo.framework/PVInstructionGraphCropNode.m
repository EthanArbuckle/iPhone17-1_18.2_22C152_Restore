@interface PVInstructionGraphCropNode
+ (id)newCropNode:(id)a3 normalizedCropRect:(CGRect)a4;
- (CGRect)denormalizedCropRectInSize:(CGSize)a3;
- (CGRect)normalizedCropRect;
- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4;
- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4;
- (PVInstructionGraphCropNode)initWithInputNode:(id)a3 normalizedCropRect:(CGRect)a4;
- (PVInstructionGraphNode)inputNode;
- (id)getAllSourceNodes;
- (id)requiredSourceTrackIDs;
- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4;
- (void)setInputNode:(id)a3;
- (void)setNormalizedCropRect:(CGRect)a3;
- (void)unloadIGNode;
@end

@implementation PVInstructionGraphCropNode

+ (id)newCropNode:(id)a3 normalizedCropRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithInputNode:normalizedCropRect:", v9, x, y, width, height);

  return v10;
}

- (PVInstructionGraphCropNode)initWithInputNode:(id)a3 normalizedCropRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PVInstructionGraphCropNode;
  v10 = [(PVInstructionGraphNode *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(PVInstructionGraphCropNode *)v10 setInputNode:v9];
    -[PVInstructionGraphCropNode setNormalizedCropRect:](v11, "setNormalizedCropRect:", x, y, width, height);
  }

  return v11;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v6 = a4;
  v7 = [(PVInstructionGraphCropNode *)self inputNode];
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
  id v2 = [(PVInstructionGraphCropNode *)self inputNode];
  [v2 unloadIGNode];
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v12 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v36, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphCropNode hgNodeForTime:...]");
  objc_super v13 = [(PVInstructionGraphCropNode *)self inputNode];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v35 = *a3;
  uint64_t v14 = *(void *)a6.m_Obj;
  uint64_t v34 = v14;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 16))(v14);
  }
  if (v13) {
    [v13 hgNodeForTime:&v35 trackInputs:a4 renderer:a5 igContext:&v34];
  }
  else {
    *v12 = 0;
  }
  if (v34) {
    (*(void (**)(uint64_t))(*(void *)v34 + 24))(v34);
  }

  double v15 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
  double v17 = v16;
  double v18 = ((__n128 (*)(void))*(void *)(**(void **)a6.m_Obj + 48))().n128_f32[0];
  double v19 = v15 * v18;
  double v20 = v17 * v18;
  -[PVInstructionGraphCropNode denormalizedCropRectInSize:](self, "denormalizedCropRectInSize:", v19, v20);
  uint64_t v21 = HGRectMakeWithCGRect(v39);
  uint64_t v23 = v22;
  v24 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v24);
  (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v24 + 96))(v24, 0, (float)(int)v21, (float)SHIDWORD(v21), (float)(int)v23, (float)SHIDWORD(v23));
  (*(void (**)(HGCrop *, void, HGCrop *))(*(void *)v24 + 120))(v24, 0, *v12);
  v25 = *v12;
  if (*v12 != v24)
  {
    if (v25) {
      (*(void (**)(HGCrop *))(*(void *)v25 + 24))(v25);
    }
    *v12 = v24;
    (*(void (**)(HGCrop *))(*(void *)v24 + 16))(v24);
  }
  if ([(PVInstructionGraphNode *)self isDebugDrawingEnabled])
  {
    float v27 = v19;
    float v28 = v20;
    uint64_t v29 = HGRectMake4f(v26, 0.0, 0.0, v27, v28);
    uint64_t v31 = v30;
    v32 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    *(void *)&v38.var0 = v29;
    *(void *)&v38.var2 = v31;
    HGSolidColor::HGSolidColor(v32, v38);
  }
  (*(void (**)(HGCrop *))(*(void *)v24 + 24))(v24);
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v36);
  return v33;
}

- (id)requiredSourceTrackIDs
{
  id v2 = [(PVInstructionGraphCropNode *)self inputNode];
  v3 = [v2 requiredSourceTrackIDs];

  return v3;
}

- (id)getAllSourceNodes
{
  id v2 = [(PVInstructionGraphCropNode *)self inputNode];
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

- (CGRect)denormalizedCropRectInSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PVInstructionGraphCropNode *)self normalizedCropRect];
  double v6 = width * v5;
  double v8 = height * v7;
  double v10 = width * v9;
  double v12 = height * v11;
  result.size.double height = v12;
  result.size.double width = v10;
  result.origin.double y = v8;
  result.origin.double x = v6;
  return result;
}

- (PVInstructionGraphNode)inputNode
{
  return self->_inputNode;
}

- (void)setInputNode:(id)a3
{
}

- (CGRect)normalizedCropRect
{
  double x = self->_normalizedCropRect.origin.x;
  double y = self->_normalizedCropRect.origin.y;
  double width = self->_normalizedCropRect.size.width;
  double height = self->_normalizedCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNormalizedCropRect:(CGRect)a3
{
  self->_normalizedCropRect = a3;
}

- (void).cxx_destruct
{
}

@end