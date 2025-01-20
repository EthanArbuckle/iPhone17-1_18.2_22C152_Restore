@interface PVInstructionGraphRectangleMaskNode
+ (id)newMaskNode:(id)a3 normalizedMaskRect:(CGRect)a4;
- (BOOL)isInverted;
- (CGRect)denormalizedMaskRectInSize:(CGSize)a3;
- (CGRect)normalizedMaskRect;
- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4;
- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4;
- (PVInstructionGraphNode)inputNode;
- (PVInstructionGraphRectangleMaskNode)initWithInputNode:(id)a3 normalizedMaskRect:(CGRect)a4;
- (id)getAllSourceNodes;
- (id)requiredSourceTrackIDs;
- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4;
- (void)setInputNode:(id)a3;
- (void)setIsInverted:(BOOL)a3;
- (void)setNormalizedMaskRect:(CGRect)a3;
- (void)unloadIGNode;
@end

@implementation PVInstructionGraphRectangleMaskNode

+ (id)newMaskNode:(id)a3 normalizedMaskRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithInputNode:normalizedMaskRect:", v9, x, y, width, height);

  return v10;
}

- (PVInstructionGraphRectangleMaskNode)initWithInputNode:(id)a3 normalizedMaskRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PVInstructionGraphRectangleMaskNode;
  v10 = [(PVInstructionGraphNode *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(PVInstructionGraphRectangleMaskNode *)v10 setInputNode:v9];
    -[PVInstructionGraphRectangleMaskNode setNormalizedMaskRect:](v11, "setNormalizedMaskRect:", x, y, width, height);
  }

  return v11;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v6 = a4;
  v7 = [(PVInstructionGraphRectangleMaskNode *)self inputNode];
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
  id v2 = [(PVInstructionGraphRectangleMaskNode *)self inputNode];
  [v2 unloadIGNode];
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v12 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v43, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphRectangleMaskNode hgNodeForTime:...]");
  objc_super v13 = [(PVInstructionGraphRectangleMaskNode *)self inputNode];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v42 = *a3;
  uint64_t v14 = *(void *)a6.m_Obj;
  uint64_t v41 = v14;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 16))(v14);
  }
  if (v13) {
    [v13 hgNodeForTime:&v42 trackInputs:a4 renderer:a5 igContext:&v41];
  }
  else {
    *v12 = 0;
  }
  if (v41) {
    (*(void (**)(uint64_t))(*(void *)v41 + 24))(v41);
  }

  double v15 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
  double v17 = v16;
  double v18 = ((__n128 (*)(void))*(void *)(**(void **)a6.m_Obj + 48))().n128_f32[0];
  double v19 = v15 * v18;
  double v20 = v17 * v18;
  -[PVInstructionGraphRectangleMaskNode denormalizedMaskRectInSize:](self, "denormalizedMaskRectInSize:", v19, v17 * v18);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  v29 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
  HGHWMultiBlend::HGHWMultiBlend(v29);
  (*(void (**)(HGHWMultiBlend *, void, float, double, double, double))(*(void *)v29 + 96))(v29, 0, 9.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGHWMultiBlend *, void, HGHWMultiBlend *))(*(void *)v29 + 120))(v29, 0, *v12);
  v30 = *v12;
  if (*v12 != v29)
  {
    if (v30) {
      (*(void (**)(HGHWMultiBlend *))(*(void *)v30 + 24))(v30);
    }
    *v12 = v29;
    (*(void (**)(HGHWMultiBlend *))(*(void *)v29 + 16))(v29);
  }
  if ([(PVInstructionGraphRectangleMaskNode *)self isInverted])
  {
    v31 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v31);
  }
  v45.origin.double x = v22;
  v45.origin.double y = v24;
  v45.size.double width = v26;
  v45.size.double height = v28;
  double MinX = CGRectGetMinX(v45);
  v46.origin.double x = v22;
  v46.origin.double y = v24;
  v46.size.double width = v26;
  v46.size.double height = v28;
  CGRectGetMaxX(v46);
  v47.origin.double x = v22;
  v47.origin.double y = v24;
  v47.size.double width = v26;
  v47.size.double height = v28;
  double MaxX = CGRectGetMaxX(v47);
  v48.origin.double x = v22;
  v48.origin.double y = v24;
  v48.size.double width = v26;
  v48.size.double height = v28;
  CGRectGetMaxY(v48);
  v49.origin.double x = v22;
  v49.origin.double y = v24;
  v49.size.double width = v26;
  v49.size.double height = v28;
  CGFloat MaxY = CGRectGetMaxY(v49);
  v50.origin.double x = v22;
  v50.origin.double y = v24;
  v50.size.double width = v26;
  v50.size.double height = v28;
  double MinY = CGRectGetMinY(v50);
  if (MinX > 0.0 && v20 > 0.0)
  {
    v35 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v35);
  }
  if (v19 - MaxX > 0.0 && v20 > 0.0)
  {
    v36 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v36);
  }
  if (v19 > 0.0 && v20 - MaxY > 0.0)
  {
    v37 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v37);
  }
  if (v19 > 0.0 && MinY > 0.0)
  {
    v38 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v38);
  }
  (*(void (**)(HGHWMultiBlend *))(*(void *)v29 + 24))(v29);
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v43);
  return v39;
}

- (id)requiredSourceTrackIDs
{
  id v2 = [(PVInstructionGraphRectangleMaskNode *)self inputNode];
  v3 = [v2 requiredSourceTrackIDs];

  return v3;
}

- (id)getAllSourceNodes
{
  id v2 = [(PVInstructionGraphRectangleMaskNode *)self inputNode];
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

- (CGRect)denormalizedMaskRectInSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PVInstructionGraphRectangleMaskNode *)self normalizedMaskRect];
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

- (BOOL)isInverted
{
  return self->_isInverted;
}

- (void)setIsInverted:(BOOL)a3
{
  self->_isInverted = a3;
}

- (PVInstructionGraphNode)inputNode
{
  return self->_inputNode;
}

- (void)setInputNode:(id)a3
{
}

- (CGRect)normalizedMaskRect
{
  double x = self->_normalizedMaskRect.origin.x;
  double y = self->_normalizedMaskRect.origin.y;
  double width = self->_normalizedMaskRect.size.width;
  double height = self->_normalizedMaskRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNormalizedMaskRect:(CGRect)a3
{
  self->_normalizedMaskRect = a3;
}

- (void).cxx_destruct
{
}

@end