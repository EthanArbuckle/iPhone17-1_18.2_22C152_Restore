@interface RBDisplayList
+ (id)decodedObjectWithData:(id)a3 delegate:(id)a4 error:(id *)a5;
- (BOOL)isEmpty;
- (BOOL)linearColors;
- (CGAffineTransform)CTM;
- (CGContext)beginCGContextWithAlpha:(float)a3;
- (CGContext)beginCGContextWithAlpha:(float)a3 flags:(unsigned int)a4;
- (CGRect)boundingRect;
- (CGRect)clipBoundingBox;
- (CGRect)contentRect;
- (NSUUID)identifierNamespace;
- (RBDisplayList)init;
- (RBTransition)transition;
- (const)_rb_contents;
- (const)_rb_xml_document;
- (double)deviceScale;
- (id).cxx_construct;
- (id)CGStyleHandler;
- (id)encodedDataForDelegate:(id)a3 error:(id *)a4;
- (id)moveContents;
- (id)valueForAttribute:(unsigned int)a3;
- (int)defaultColorSpace;
- (uint64_t)moveContents;
- (unsigned)identifier;
- (unsigned)profile;
- (void)_drawInState:(_RBDrawingState *)a3 alpha:(float)a4;
- (void)addAffineTransformStyle:(CGAffineTransform *)a3;
- (void)addAlphaGradientFilterWithStopCount:(int64_t)a3 colors:(id *)a4 colorSpace:(int)a5 locations:(const double *)a6 flags:(unsigned int)a7;
- (void)addAlphaMultiplyFilterWithColor:(id)a3;
- (void)addAlphaMultiplyFilterWithColor:(id)a3 colorSpace:(int)a4 flags:(unsigned int)a5;
- (void)addAlphaThresholdFilterWithAlpha:(float)a3 color:(id)a4 colorSpace:(int)a5;
- (void)addAlphaThresholdFilterWithMinAlpha:(float)a3 maxAlpha:(float)a4 color:(id)a5 colorSpace:(int)a6;
- (void)addAnimationStyle:(id)a3 id:(id)a4;
- (void)addAnimationStyle:(id)a3 id:(id)a4 flags:(unsigned int)a5;
- (void)addBlurFilterWithRadius:(double)a3;
- (void)addBlurFilterWithRadius:(double)a3 bounds:(CGRect)a4 flags:(unsigned int)a5;
- (void)addBlurFilterWithRadius:(double)a3 flags:(unsigned int)a4;
- (void)addBlurFilterWithRadius:(double)a3 opaque:(BOOL)a4;
- (void)addBrightnessFilterWithAmount:(float)a3;
- (void)addBrightnessFilterWithAmount:(float)a3 flags:(unsigned int)a4;
- (void)addColorInvertFilter;
- (void)addColorInvertFilterWithAmount:(float)a3 flags:(unsigned int)a4;
- (void)addColorMatrixFilterWithArray:(float)a3[20];
- (void)addColorMatrixFilterWithArray:(float)a3[20] flags:(unsigned int)a4;
- (void)addColorMonochromeFilterWithAmount:(float)a3 color:(id)a4 bias:(float)a5;
- (void)addColorMonochromeFilterWithAmount:(float)a3 color:(id)a4 colorSpace:(int)a5 bias:(float)a6 flags:(unsigned int)a7;
- (void)addColorMultiplyFilterWithColor:(id)a3;
- (void)addColorMultiplyFilterWithColor:(id)a3 colorSpace:(int)a4 flags:(unsigned int)a5;
- (void)addContrastFilterWithAmount:(float)a3;
- (void)addContrastFilterWithAmount:(float)a3 flags:(unsigned int)a4;
- (void)addDistanceFilterWithMaxDistance:(double)a3 scale:(double)a4 flags:(unsigned int)a5;
- (void)addFilterLayerWithShader:(id)a3 border:(CGSize)a4 layerBorder:(CGSize)a5 bounds:(const CGRect *)a6 flags:(unsigned int)a7;
- (void)addFilterWithShader:(id)a3 border:(CGSize)a4 bounds:(const CGRect *)a5 flags:(unsigned int)a6;
- (void)addGrayscaleFilterWithAmount:(float)a3;
- (void)addGrayscaleFilterWithAmount:(float)a3 flags:(unsigned int)a4;
- (void)addHueRotationFilterWithAngle:(double)a3;
- (void)addHueRotationFilterWithAngle:(double)a3 flags:(unsigned int)a4;
- (void)addLuminanceCurveFilterWithCurve:(float)a3[4] color:(id)a4 colorSpace:(int)a5 flags:(unsigned int)a6;
- (void)addLuminanceToAlphaFilter;
- (void)addLuminanceToAlphaFilterWithFlags:(unsigned int)a3;
- (void)addPathProjectionStyleWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 path:(RBPath)a5 transform:(CGAffineTransform *)a6 flags:(unsigned int)a7;
- (void)addPredicateStyle:(id)a3;
- (void)addProjectionStyleWithArray:(float)a3[9];
- (void)addRGBACurvesFilterWithCurves:(float)a3[16] flags:(unsigned int)a4;
- (void)addRotation3DStyleWithAngle:(double)a3 axis:(id)a4 anchor:(id)a5 perspective:(double)a6 flipWidth:(double)a7;
- (void)addRotationStyleWithAngle:(double)a3 anchor:(CGPoint)a4;
- (void)addSaturationFilterWithAmount:(float)a3;
- (void)addSaturationFilterWithAmount:(float)a3 flags:(unsigned int)a4;
- (void)addScaleStyleWithScale:(CGSize)a3 anchor:(CGPoint)a4;
- (void)addShadowStyleWithRadius:(double)a3 midpoint:(float)a4 offset:(CGSize)a5 color:(id)a6 colorSpace:(int)a7 blendMode:(int)a8 flags:(unsigned int)a9;
- (void)addShadowStyleWithRadius:(double)a3 offset:(CGSize)a4 color:(id)a5 colorSpace:(int)a6 blendMode:(int)a7 flags:(unsigned int)a8;
- (void)addShadowStyleWithRadius:(double)a3 offset:(CGSize)a4 color:(id)a5 mode:(unsigned int)a6;
- (void)addTransformStyle:(id)a3;
- (void)addTranslationStyleWithOffset:(CGSize)a3;
- (void)addVariableBlurFilterWithRadius:(double)a3 mask:(id)a4 bounds:(CGRect)a5 flags:(unsigned int)a6;
- (void)addVariableBlurLayerWithAlpha:(float)a3 scale:(double)a4 radius:(double)a5 bounds:(CGRect)a6 flags:(unsigned int)a7;
- (void)beginLayer;
- (void)beginLayerWithFlags:(unsigned int)a3;
- (void)beginRecordingXML;
- (void)clear;
- (void)clearCaches;
- (void)clipLayerWithAlpha:(float)a3 mode:(int)a4;
- (void)clipShape:(id)a3 alpha:(float)a4 mode:(int)a5;
- (void)clipShape:(id)a3 mode:(int)a4;
- (void)concat:(CGAffineTransform *)a3;
- (void)dealloc;
- (void)drawDisplayList:(id)a3;
- (void)drawDisplayList:(id)a3 alpha:(float)a4;
- (void)drawInRect:(CGRect)a3 alpha:(float)a4 blendMode:(int)a5 flags:(unsigned int)a6 operation:(id)a7;
- (void)drawInState:(_RBDrawingState *)a3;
- (void)drawLayerWithAlpha:(float)a3 blendMode:(int)a4;
- (void)drawShape:(id)a3 fill:(id)a4 alpha:(float)a5 blendMode:(int)a6;
- (void)endCGContext;
- (void)renderInContext:(CGContext *)a3 options:(id)a4;
- (void)restore;
- (void)rotateBy:(double)a3;
- (void)save;
- (void)scaleByX:(double)a3 Y:(double)a4;
- (void)setCGStyleHandler:(id)a3;
- (void)setCTM:(CGAffineTransform *)a3;
- (void)setContentRect:(CGRect)a3;
- (void)setDefaultColorSpace:(int)a3;
- (void)setDeviceScale:(double)a3;
- (void)setIdentifier:(unsigned int)a3 namespace:(id)a4;
- (void)setLinearColors:(BOOL)a3;
- (void)setProfile:(unsigned int)a3;
- (void)setTransition:(id)a3;
- (void)setValue:(id)a3 forAttribute:(unsigned int)a4;
- (void)translateByX:(double)a3 Y:(double)a4;
@end

@implementation RBDisplayList

- (int)defaultColorSpace
{
  return rb_color_space(*(_WORD *)(*((void *)self + 35) + 156));
}

- (void)translateByX:(double)a3 Y:(double)a4
{
}

- (id)CGStyleHandler
{
  return (id)*((void *)self + 39);
}

- (unsigned)profile
{
  return *((_DWORD *)self + 89);
}

- (void)endCGContext
{
  RBDrawingStateEndCGContext(*((void *)self + 35), a2, v2);
}

- (void)setDeviceScale:(double)a3
{
  if (*((double *)self + 45) != a3)
  {
    *((double *)self + 45) = a3;
    v3 = (RB::XML::DisplayList *)*((void *)self + 38);
    if (v3) {
      RB::XML::DisplayList::device_scale(v3, (RB::XML::Document *)a2, a3);
    }
  }
}

- (void).cxx_destruct
{
  v3 = (CFTypeRef *)((char *)self + 320);
  v4 = (CFTypeRef *)*((void *)self + 42);
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = v3;
  }
  unint64_t v6 = *((unsigned int *)self + 86);
  if (v6)
  {
    for (unint64_t i = 0; i < v6; ++i)
    {
      if (*v5)
      {
        CFRelease(*v5);
        unint64_t v6 = *((unsigned int *)self + 86);
      }
      v5 += 2;
    }
    v4 = (CFTypeRef *)*((void *)self + 42);
  }
  if (v4) {
    free(v4);
  }

  uint64_t v8 = *((void *)self + 38);
  *((void *)self + 38) = 0;
  if (v8) {
    std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)self + 304, v8);
  }
  RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)((char *)self + 16));
}

- (void)setCGStyleHandler:(id)a3
{
  uint64_t v4 = [a3 copy];

  *((void *)self + 39) = v4;
}

- (CGRect)boundingRect
{
  uint64_t v4 = *((void *)self + 3);
  if (v4)
  {
    float32x2_t v5 = RB::DisplayList::Layer::bounds((RB::DisplayList::Layer *)(v4 + 320), v2, v3);
    float64x2_t v7 = vcvtq_f64_f32(v6);
    float64x2_t v8 = vcvtq_f64_f32(v5);
  }
  else
  {
    float64x2_t v8 = *(float64x2_t *)MEMORY[0x263F001A0];
    float64x2_t v7 = *(float64x2_t *)(MEMORY[0x263F001A0] + 16);
  }
  double v9 = v8.f64[1];
  double v10 = v7.f64[1];
  result.size.width = v7.f64[0];
  result.origin.x = v8.f64[0];
  result.size.height = v10;
  result.origin.y = v9;
  return result;
}

- (CGContext)beginCGContextWithAlpha:(float)a3
{
  uint64_t v4 = (_RBDrawingState *)*((void *)self + 35);
  [(RBDisplayList *)self deviceScale];
  return (CGContext *)begin_cgcontext(v4, a3, v5, 0);
}

- (double)deviceScale
{
  return *((double *)self + 45);
}

- (void)_drawInState:(_RBDrawingState *)a3 alpha:(float)a4
{
  [(RBDisplayList *)self clearCaches];
  uint64_t v8 = *((void *)a3 + 1);
  if (!*(void *)(v8 + 24)) {
    make_contents(*((void *)a3 + 1));
  }
  double v9 = (const RB::DisplayList::Contents *)*((void *)self + 3);
  if (v9) {
    RB::DisplayList::Builder::draw((RB::DisplayList::Layer ***)(v8 + 16), v9, (RB::DisplayList::State *)a3, a4, 0, 0);
  }
  double v10 = *(RB::XML::DisplayList **)(v8 + 304);
  if (v10)
  {
    v11 = (_RBDrawingState *)*((void *)self + 38);
    if (v11)
    {
      RB::XML::DisplayList::draw_list(v10, (RB::XML::Document *)a3, v11, v7, a4);
    }
  }
}

- (void)clearCaches
{
  unsigned int v3 = *((_DWORD *)self + 86);
  if (*((_DWORD *)self + 87) > v3) {
    *((void *)self + 42) = RB::details::realloc_vector<unsigned int,16ul>(*((void **)self + 42), (char *)self + 320, 1u, (_DWORD *)self + 87, v3);
  }
  RB::DisplayList::Builder::clear_caches((RB::DisplayList::Builder *)((char *)self + 16));
}

- (void)drawDisplayList:(id)a3
{
  LODWORD(v3) = 1.0;
  [a3 _drawInState:*((void *)self + 35) alpha:v3];
}

- (RBDisplayList)init
{
  v5.receiver = self;
  v5.super_class = (Class)RBDisplayList;
  double v2 = [(RBDisplayList *)&v5 init];
  double v3 = v2;
  if (v2)
  {
    *((_DWORD *)v2 + 89) = 0;
    *((void *)v2 + 45) = 0x3FF0000000000000;
    *(void *)(*((void *)v2 + 35) + 8) = v2;
    if (RBXMLRecorderInstalled()) {
      [(RBDisplayList *)v3 beginRecordingXML];
    }
  }
  return v3;
}

- (void)setDefaultColorSpace:(int)a3
{
  uint64_t v4 = *((void *)self + 35);
  uint64_t v5 = *(void *)(v4 + 8);
  *(_WORD *)(v4 + 156) = rb_color_space(a3);
  uint64_t v6 = *(void *)(v5 + 304);
  if (v6) {
    *(_DWORD *)(v6 + 120) = a3;
  }
}

- (void)setProfile:(unsigned int)a3
{
  uint64_t v3 = *((void *)self + 3);
  if (v3 && *(void *)(v3 + 320)) {
    RB::precondition_failure((RB *)"may only set profile of empty display lists", a2, *(void *)&a3);
  }
  if (*((_DWORD *)self + 89) != a3)
  {
    *((_DWORD *)self + 89) = a3;
    uint64_t v4 = (char *)self + 16;
    RB::DisplayList::Builder::set_optimized((uint64_t)v4, a3 != 0);
  }
}

- (void)setContentRect:(CGRect)a3
{
  CGFloat y = a3.origin.y;
  CGFloat height = a3.size.height;
  RB::DisplayList::Builder::set_crop((float32x2_t *)self + 2, vcvt_f32_f64((float64x2_t)a3.origin), vcvt_f32_f64((float64x2_t)a3.size));
}

- (const)_rb_contents
{
  return (const void *)*((void *)self + 3);
}

- (id)moveContents
{
  uint64_t v3 = *((void *)self + 38);
  *((void *)self + 38) = 0;
  v14[0] = v3;
  if (v3) {
    operator new();
  }
  uint64_t v4 = [RBMovedDisplayListContents alloc];
  RB::DisplayList::Builder::move_contents((RB::DisplayList::Builder *)((char *)self + 16), v5, &v13);
  uint64_t v6 = v14[0];
  v14[0] = 0;
  uint64_t v12 = v6;
  float64x2_t v7 = -[RBMovedDisplayListContents initWithContents:xmlDocument:](v4, &v13, &v12);
  uint64_t v8 = v12;
  uint64_t v12 = 0;
  if (v8) {
    std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v12, v8);
  }
  uint64_t v9 = v13;
  if (v13 && atomic_fetch_add_explicit((atomic_uint *volatile)(v13 + 8), 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  uint64_t v10 = v14[0];
  v14[0] = 0;
  if (v10) {
    std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)v14, v10);
  }
  return v7;
}

- (id).cxx_construct
{
  *((void *)self + 42) = 0;
  *((void *)self + 38) = 0;
  *((void *)self + 39) = 0;
  *((void *)self + 43) = 0x100000000;
  return self;
}

- (void)concat:(CGAffineTransform *)a3
{
  uint64_t v3 = *((void *)self + 35);
  long long v4 = *(_OWORD *)&a3->c;
  long long v5 = *(_OWORD *)&a3->tx;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v4;
  v6[2] = v5;
  RBDrawingStateConcatCTM(v3, (uint64_t)v6);
}

- (void)dealloc
{
  if (*((_DWORD *)self + 88)) {
    RB::precondition_failure((RB *)"not all states were destroyed", a2);
  }
  v2.receiver = self;
  v2.super_class = (Class)RBDisplayList;
  [(RBDisplayList *)&v2 dealloc];
}

- (CGRect)contentRect
{
  float32x2_t v2 = *(float32x2_t *)((char *)self + 264);
  uint32x2_t v3 = (uint32x2_t)vcge_f32(vabs_f32(v2), (float32x2_t)vdup_n_s32(0x7F7FFFFFu));
  if ((vpmax_u32(v3, v3).u32[0] & 0x80000000) != 0)
  {
    float64x2_t v7 = (float64x2_t *)MEMORY[0x263F00190];
LABEL_6:
    float64x2_t v6 = *v7;
    float64x2_t v5 = v7[1];
    goto LABEL_7;
  }
  uint32x2_t v4 = (uint32x2_t)vclez_f32(v2);
  if ((vpmax_u32(v4, v4).u32[0] & 0x80000000) != 0)
  {
    float64x2_t v7 = (float64x2_t *)MEMORY[0x263F001A0];
    goto LABEL_6;
  }
  float64x2_t v5 = vcvtq_f64_f32(v2);
  float64x2_t v6 = vcvtq_f64_f32(*(float32x2_t *)((char *)self + 256));
LABEL_7:
  double v8 = v6.f64[1];
  double v9 = v5.f64[1];
  result.size.width = v5.f64[0];
  result.origin.x = v6.f64[0];
  result.size.CGFloat height = v9;
  result.origin.CGFloat y = v8;
  return result;
}

- (BOOL)isEmpty
{
  uint64_t v2 = *((void *)self + 3);
  return !v2 || *(void *)(v2 + 320) == 0;
}

- (BOOL)linearColors
{
  unsigned int v2 = *(unsigned __int16 *)(*((void *)self + 35) + 156);
  return (v2 & 1) == 0 && v2 > 0xFF;
}

- (void)setLinearColors:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(RBDisplayList *)self defaultColorSpace];
  if (v5 >= 3)
  {
    if (v5 - 3 >= 2) {
      return;
    }
    BOOL v6 = !v3;
    unsigned int v7 = 3;
  }
  else
  {
    BOOL v6 = !v3;
    unsigned int v7 = 1;
  }
  if (v6) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v7 + 1;
  }
  [(RBDisplayList *)self setDefaultColorSpace:v8];
}

- (void)clear
{
  [(RBDisplayList *)self clearCaches];
  RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)((char *)self + 16));
  RB::DisplayList::Builder::Builder(v3);
  if (*((void *)self + 38)) {
    operator new();
  }
}

- (void)save
{
  RB::DisplayList::Builder::save((RB::DisplayList::Builder *)((char *)self + 16));
  uint32x2_t v4 = (RB::XML::DisplayList *)*((void *)self + 38);
  if (v4)
  {
    RB::XML::DisplayList::save(v4, v3);
  }
}

- (void)restore
{
  RB::DisplayList::Builder::restore((RB::DisplayList::Builder *)((char *)self + 16), 0);
  uint32x2_t v4 = (RB::XML::DisplayList *)*((void *)self + 38);
  if (v4)
  {
    RB::XML::DisplayList::restore(v4, v3);
  }
}

- (void)beginLayerWithFlags:(unsigned int)a3
{
  BOOL v3 = *(_RBDrawingState **)&a3;
  unsigned int v5 = (RB::DisplayList::Builder *)((char *)self + 16);
  unsigned int v6 = (a3 >> 1) & 4;
  if ((a3 & 4) != 0) {
    unsigned int v6 = 2;
  }
  unsigned int v7 = (LayerState *)RB::DisplayList::Builder::begin_layer((RB::DisplayList::Builder *)((char *)self + 16), *((const RB::DisplayList::State **)self + 35), a3 & 1 | (8 * ((a3 >> 1) & 1)) & 0xFFFFF3FF | (((a3 >> 4) & 3) << 10) | v6);
  RB::DisplayList::Builder::save(v5, v7);
  uint64_t v8 = (RB::XML::DisplayList *)*((void *)self + 38);
  if (v8)
  {
    double v9 = (RB::XML::Document *)*((void *)self + 35);
    RB::XML::DisplayList::begin_layer(v8, v9, v3);
  }
}

- (void)beginLayer
{
}

- (void)drawLayerWithAlpha:(float)a3 blendMode:(int)a4
{
  unsigned int v7 = (RB::DisplayList::Builder *)((char *)self + 16);
  uint64_t v8 = RB::DisplayList::Builder::end_layer((RB::DisplayList::Builder *)((char *)self + 16), *((const RB::DisplayList::State **)self + 35));
  RB::DisplayList::Builder::restore(v7, (const char *)1);
  double v9 = (int8x16_t *)*((void *)self + 35);
  int v10 = rb_blend_mode(a4);
  RB::DisplayList::Builder::draw_layer((uint64_t)v7, v8, v9, v10, a3);
  v11 = (RB::XML::Document *)*((void *)self + 38);
  if (v11)
  {
    RB::XML::DisplayList::draw_layer(v11, a4, a3);
  }
}

- (void)clipLayerWithAlpha:(float)a3 mode:(int)a4
{
  unsigned int v7 = (RB::DisplayList::Builder *)((char *)self + 16);
  uint64_t v8 = (RB::DisplayList::Layer *)RB::DisplayList::Builder::end_layer((RB::DisplayList::Builder *)((char *)self + 16), *((const RB::DisplayList::State **)self + 35));
  RB::DisplayList::Builder::restore(v7, (const char *)1);
  double v9 = (__n128 *)*((void *)self + 35);
  BOOL v10 = rb_clip_mode(a4);
  v11.n128_f32[0] = a3;
  RB::DisplayList::Builder::clip_layer(v7, v8, v9, v10, v11);
  if (*((void *)self + 38))
  {
    RB::XML::DisplayList::clip_layer();
  }
}

- (CGContext)beginCGContextWithAlpha:(float)a3 flags:(unsigned int)a4
{
  unsigned int v6 = (_RBDrawingState *)*((void *)self + 35);
  [(RBDisplayList *)self deviceScale];
  return (CGContext *)begin_cgcontext(v6, a3, v7, a4);
}

- (void)renderInContext:(CGContext *)a3 options:(id)a4
{
  unsigned int v5 = (const RB::DisplayList::Contents *)*((void *)self + 3);
  if (v5)
  {
    render_contents(a3, (NSDictionary *)a4, v5, *((_RBDrawingState **)self + 38));
    RBXMLRecorderMarkCGFrame(self, a3);
  }
}

- (const)_rb_xml_document
{
  return (const void *)*((void *)self + 38);
}

- (CGAffineTransform)CTM
{
  tCGFloat y = self[5].ty;
  long long v4 = *(_OWORD *)(*(void *)&ty + 32);
  *(_OWORD *)&retstr->a = *(_OWORD *)(*(void *)&ty + 16);
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(*(void *)&ty + 48);
  return self;
}

- (void)setCTM:(CGAffineTransform *)a3
{
  BOOL v3 = (RB::DisplayList::State *)*((void *)self + 35);
  float64x2_t v4 = *(float64x2_t *)&a3->c;
  v5[0] = *(float64x2_t *)&a3->a;
  v5[1] = v4;
  v5[2] = *(float64x2_t *)&a3->tx;
  RBDrawingStateSetCTM(v3, v5);
}

- (CGRect)clipBoundingBox
{
  RBDrawingStateGetClipBoundingBox(*((void *)self + 35));
  result.size.CGFloat height = v5;
  result.size.width = v4;
  result.origin.CGFloat y = v3;
  result.origin.x = v2;
  return result;
}

- (void)scaleByX:(double)a3 Y:(double)a4
{
}

- (void)rotateBy:(double)a3
{
}

- (unsigned)identifier
{
  return *(_DWORD *)(*((void *)self + 35) + 64);
}

- (NSUUID)identifierNamespace
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  long long v3 = *(_OWORD *)(*((void *)self + 35) + 68);
  return (NSUUID *)(id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v3];
}

- (void)setIdentifier:(unsigned int)a3 namespace:(id)a4
{
}

- (RBTransition)transition
{
  double v2 = RBDrawingStateCopyTransition(*((void *)self + 35));
  return v2;
}

- (void)setTransition:(id)a3
{
}

- (void)setValue:(id)a3 forAttribute:(unsigned int)a4
{
}

- (id)valueForAttribute:(unsigned int)a3
{
  return (id)RBDrawingStateGetAttribute(*((void *)self + 35), a3, v3);
}

- (void)clipShape:(id)a3 alpha:(float)a4 mode:(int)a5
{
}

- (void)clipShape:(id)a3 mode:(int)a4
{
}

- (void)drawShape:(id)a3 fill:(id)a4 alpha:(float)a5 blendMode:(int)a6
{
}

- (void)drawInState:(_RBDrawingState *)a3
{
  LODWORD(v3) = 1.0;
  [(RBDisplayList *)self _drawInState:a3 alpha:v3];
}

- (void)drawDisplayList:(id)a3 alpha:(float)a4
{
}

- (void)drawInRect:(CGRect)a3 alpha:(float)a4 blendMode:(int)a5 flags:(unsigned int)a6 operation:(id)a7
{
}

- (void)addPredicateStyle:(id)a3
{
}

- (void)addTransformStyle:(id)a3
{
}

- (void)addAnimationStyle:(id)a3 id:(id)a4
{
}

- (void)addAnimationStyle:(id)a3 id:(id)a4 flags:(unsigned int)a5
{
}

- (void)addShadowStyleWithRadius:(double)a3 midpoint:(float)a4 offset:(CGSize)a5 color:(id)a6 colorSpace:(int)a7 blendMode:(int)a8 flags:(unsigned int)a9
{
}

- (void)addShadowStyleWithRadius:(double)a3 offset:(CGSize)a4 color:(id)a5 colorSpace:(int)a6 blendMode:(int)a7 flags:(unsigned int)a8
{
}

- (void)addShadowStyleWithRadius:(double)a3 offset:(CGSize)a4 color:(id)a5 mode:(unsigned int)a6
{
}

- (void)addProjectionStyleWithArray:(float)a3[9]
{
}

- (void)addRotationStyleWithAngle:(double)a3 anchor:(CGPoint)a4
{
}

- (void)addScaleStyleWithScale:(CGSize)a3 anchor:(CGPoint)a4
{
}

- (void)addTranslationStyleWithOffset:(CGSize)a3
{
}

- (void)addRotation3DStyleWithAngle:(double)a3 axis:(id)a4 anchor:(id)a5 perspective:(double)a6 flipWidth:(double)a7
{
}

- (void)addAffineTransformStyle:(CGAffineTransform *)a3
{
  double v3 = (__n128 *)*((void *)self + 35);
  float64x2_t v4 = *(float64x2_t *)&a3->c;
  v5[0] = *(float64x2_t *)&a3->a;
  v5[1] = v4;
  v5[2] = *(float64x2_t *)&a3->tx;
  RBDrawingStateAddAffineTransformStyle(v3, v5);
}

- (void)addPathProjectionStyleWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 path:(RBPath)a5 transform:(CGAffineTransform *)a6 flags:(unsigned int)a7
{
  double v7 = (RB::XML::Document *)*((void *)self + 35);
  long long v8 = *(_OWORD *)&a6->c;
  v9[0] = *(_OWORD *)&a6->a;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a6->tx;
  RBDrawingStateAddPathProjectionStyle(v7, (char *)a5.info, a5.callbacks, (uint64_t)v9, *(const RB::AffineTransform **)&a7, (__n128)a3, a3.y, a4.x, a4.y);
}

- (void)addBlurFilterWithRadius:(double)a3 bounds:(CGRect)a4 flags:(unsigned int)a5
{
}

- (void)addBlurFilterWithRadius:(double)a3 flags:(unsigned int)a4
{
}

- (void)addBlurFilterWithRadius:(double)a3 opaque:(BOOL)a4
{
}

- (void)addBlurFilterWithRadius:(double)a3
{
}

- (void)addVariableBlurFilterWithRadius:(double)a3 mask:(id)a4 bounds:(CGRect)a5 flags:(unsigned int)a6
{
}

- (void)addVariableBlurLayerWithAlpha:(float)a3 scale:(double)a4 radius:(double)a5 bounds:(CGRect)a6 flags:(unsigned int)a7
{
  double v7 = *(_RBDrawingState **)&a7;
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  v16 = (RB::DisplayList::Builder *)((char *)self + 16);
  v17 = (RB::DisplayList::Layer *)RB::DisplayList::Builder::end_layer((RB::DisplayList::Builder *)((char *)self + 16), *((const RB::DisplayList::State **)self + 35));
  RB::DisplayList::Builder::restore(v16, (const char *)1);
  v18 = (__n128 *)*((void *)self + 35);
  CGFloat v19 = x;
  CGFloat v20 = y;
  CGFloat v21 = width;
  CGFloat v22 = height;
  add_variable_blur_layer(v18, v17, a4, a3, a5, *(CGRect *)&v19, v7);
}

- (void)addAlphaThresholdFilterWithMinAlpha:(float)a3 maxAlpha:(float)a4 color:(id)a5 colorSpace:(int)a6
{
}

- (void)addAlphaThresholdFilterWithAlpha:(float)a3 color:(id)a4 colorSpace:(int)a5
{
}

- (void)addAlphaGradientFilterWithStopCount:(int64_t)a3 colors:(id *)a4 colorSpace:(int)a5 locations:(const double *)a6 flags:(unsigned int)a7
{
}

- (void)addDistanceFilterWithMaxDistance:(double)a3 scale:(double)a4 flags:(unsigned int)a5
{
}

- (void)addColorMatrixFilterWithArray:(float)a3[20] flags:(unsigned int)a4
{
}

- (void)addColorMatrixFilterWithArray:(float)a3[20]
{
}

- (void)addColorMultiplyFilterWithColor:(id)a3 colorSpace:(int)a4 flags:(unsigned int)a5
{
}

- (void)addColorMultiplyFilterWithColor:(id)a3
{
}

- (void)addAlphaMultiplyFilterWithColor:(id)a3 colorSpace:(int)a4 flags:(unsigned int)a5
{
}

- (void)addAlphaMultiplyFilterWithColor:(id)a3
{
}

- (void)addHueRotationFilterWithAngle:(double)a3 flags:(unsigned int)a4
{
}

- (void)addHueRotationFilterWithAngle:(double)a3
{
}

- (void)addSaturationFilterWithAmount:(float)a3 flags:(unsigned int)a4
{
}

- (void)addSaturationFilterWithAmount:(float)a3
{
}

- (void)addBrightnessFilterWithAmount:(float)a3 flags:(unsigned int)a4
{
}

- (void)addBrightnessFilterWithAmount:(float)a3
{
}

- (void)addContrastFilterWithAmount:(float)a3 flags:(unsigned int)a4
{
}

- (void)addContrastFilterWithAmount:(float)a3
{
}

- (void)addLuminanceToAlphaFilterWithFlags:(unsigned int)a3
{
}

- (void)addLuminanceToAlphaFilter
{
}

- (void)addColorInvertFilterWithAmount:(float)a3 flags:(unsigned int)a4
{
}

- (void)addColorInvertFilter
{
}

- (void)addGrayscaleFilterWithAmount:(float)a3 flags:(unsigned int)a4
{
}

- (void)addGrayscaleFilterWithAmount:(float)a3
{
}

- (void)addColorMonochromeFilterWithAmount:(float)a3 color:(id)a4 colorSpace:(int)a5 bias:(float)a6 flags:(unsigned int)a7
{
}

- (void)addColorMonochromeFilterWithAmount:(float)a3 color:(id)a4 bias:(float)a5
{
}

- (void)addLuminanceCurveFilterWithCurve:(float)a3[4] color:(id)a4 colorSpace:(int)a5 flags:(unsigned int)a6
{
}

- (void)addRGBACurvesFilterWithCurves:(float)a3[16] flags:(unsigned int)a4
{
}

- (void)addFilterWithShader:(id)a3 border:(CGSize)a4 bounds:(const CGRect *)a5 flags:(unsigned int)a6
{
}

- (void)addFilterLayerWithShader:(id)a3 border:(CGSize)a4 layerBorder:(CGSize)a5 bounds:(const CGRect *)a6 flags:(unsigned int)a7
{
  double v7 = *(const CGRect **)&a7;
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v11 = a4.height;
  CGFloat v12 = a4.width;
  v15 = (RB::DisplayList::Builder *)((char *)self + 16);
  v16 = (RB::DisplayList::Layer *)RB::DisplayList::Builder::end_layer((RB::DisplayList::Builder *)((char *)self + 16), *((const RB::DisplayList::State **)self + 35));
  RB::DisplayList::Builder::restore(v15, (const char *)1);
  v17 = (__n128 *)*((void *)self + 35);
  CGFloat v18 = v12;
  CGFloat v19 = v11;
  CGFloat v20 = width;
  CGFloat v21 = height;
  add_shader_filter_layer(v17, (_RBDrawingState *)a3, v16, *(CGSize *)&v18, *(CGSize *)&v20, (const CGSize *)a6, v7);
}

+ (id)decodedObjectWithData:(id)a3 delegate:(id)a4 error:(id *)a5
{
  return +[RBMovedDisplayListContents decodedObjectWithData:a3 delegate:a4 error:a5];
}

- (id)encodedDataForDelegate:(id)a3 error:(id *)a4
{
  return (id)encode_contents(*((RB::DisplayList::Contents **)self + 3), a3, a4);
}

- (void)beginRecordingXML
{
  if (!*((void *)self + 38)) {
    operator new();
  }
}

- (uint64_t)moveContents
{
  uint64_t result = OUTLINED_FUNCTION_2(a1);
  if (result)
  {
    uint64_t result = OUTLINED_FUNCTION_0(result);
    if (v5)
    {
      __dmb(9u);
      OUTLINED_FUNCTION_1();
      uint64_t result = (*(uint64_t (**)(void))(v6 + 8))();
    }
  }
  *(void *)uint64_t v1 = v3;
  *(_DWORD *)(v1 + 8) = v2;
  return result;
}

@end