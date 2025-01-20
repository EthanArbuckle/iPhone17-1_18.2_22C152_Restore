@interface FigDepthBlurEffectRenderingParametersV4_Builder
- (FigDepthBlurEffectRenderingParametersV4_Builder)initWithVersion:(int)a3;
- (id)encodedParams;
- (unint64_t)length;
- (void)dealloc;
- (void)setParam:(signed __int16)a3 BOOLValue:(BOOL)a4;
- (void)setParam:(signed __int16)a3 floatValue:(float)a4;
- (void)setParam:(signed __int16)a3 intValue:(int)a4;
- (void)setParam:(signed __int16)a3 uintValue:(unsigned int)a4;
- (void)setParamPair:(const FigDepthBlurEffectRenderingParametersV4_ParameterPair *)a3;
@end

@implementation FigDepthBlurEffectRenderingParametersV4_Builder

- (FigDepthBlurEffectRenderingParametersV4_Builder)initWithVersion:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FigDepthBlurEffectRenderingParametersV4_Builder;
  v4 = [(FigDepthBlurEffectRenderingParametersV4_Builder *)&v8 init];
  if (v4)
  {
    v5 = (FigDepthBlurEffectRenderingParametersV4 *)malloc_type_malloc(0x410uLL, 0x113DFBDBuLL);
    v4->_rawParams = v5;
    if (!v5)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v6 = 0;
      goto LABEL_5;
    }
    v5->var0.var0 = 1145980242;
    v5->var0.var1 = a3 - 1;
    *(void *)&v5->var0.var2 = 0x100000010;
    v4->_length = 0;
    v4->_capacity = 128;
    v4->_sorted = 1;
  }
  v6 = v4;
LABEL_5:

  return v6;
}

- (void)dealloc
{
  free(self->_rawParams);
  v3.receiver = self;
  v3.super_class = (Class)FigDepthBlurEffectRenderingParametersV4_Builder;
  [(FigDepthBlurEffectRenderingParametersV4_Builder *)&v3 dealloc];
}

- (id)encodedParams
{
  if (!self->_sorted)
  {
    size_t length = self->_length;
    if (length) {
      qsort_b(self->_rawParams->var2, length, 8uLL, &unk_270E99578);
    }
    self->_sorted = 1;
  }
  id v4 = objc_alloc(MEMORY[0x263EFF8F8]);
  v6 = objc_msgSend_initWithBytes_length_(v4, v5, (uint64_t)self->_rawParams, self->_rawParams->var0.var2);

  return v6;
}

- (void)setParamPair:(const FigDepthBlurEffectRenderingParametersV4_ParameterPair *)a3
{
  unint64_t length = self->_length;
  unint64_t capacity = self->_capacity;
  if (length < capacity)
  {
    rawParams = self->_rawParams;
LABEL_5:
    rawParams->var2[length] = *a3;
    unint64_t v8 = self->_length + 1;
    self->_unint64_t length = v8;
    self->_sorted = 0;
    self->_rawParams->var0.var2 = 8 * v8 + 16;
    return;
  }
  rawParams = (FigDepthBlurEffectRenderingParametersV4 *)reallocf(self->_rawParams, 16 * capacity + 16);
  self->_rawParams = rawParams;
  if (rawParams)
  {
    self->_unint64_t capacity = 2 * capacity;
    unint64_t length = self->_length;
    goto LABEL_5;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
}

- (void)setParam:(signed __int16)a3 floatValue:(float)a4
{
  v5[1] = 1;
  v5[0] = a3;
  float v6 = a4;
  objc_msgSend_setParamPair_(self, a2, (uint64_t)v5, v4);
}

- (void)setParam:(signed __int16)a3 intValue:(int)a4
{
  v4[1] = 2;
  v4[0] = a3;
  int v5 = a4;
  objc_msgSend_setParamPair_(self, a2, (uint64_t)v4, *(uint64_t *)&a4);
}

- (void)setParam:(signed __int16)a3 uintValue:(unsigned int)a4
{
  v4[1] = 3;
  v4[0] = a3;
  unsigned int v5 = a4;
  objc_msgSend_setParamPair_(self, a2, (uint64_t)v4, *(uint64_t *)&a4);
}

- (void)setParam:(signed __int16)a3 BOOLValue:(BOOL)a4
{
  uint64_t v4 = 0x40000;
  LOWORD(v4) = a3;
  BYTE4(v4) = a4;
  objc_msgSend_setParamPair_(self, a2, (uint64_t)&v4, a4);
}

- (unint64_t)length
{
  return self->_length;
}

@end