@interface LearnedNRNetworkShared
- ($21C794F2A23EEFF9903A5FA3949B7063)renderROI;
- (BOOL)isQuadra;
- (FigMetalContext)metal;
- (LearnedNRUniforms)frameProperties;
- (LearnedNRUniforms)framePropertiesAddress;
- (MTLTexture)inputLSCGainsTexture;
- (MTLTexture)inputRawTexture;
- (uint32x2_t)getTileCount;
- (uint64_t)getTileForIndex:(int64x2_t *)a1;
- (void)setFrameProperties:(LearnedNRUniforms *)a3;
- (void)setInputLSCGainsTexture:(id)a3;
- (void)setInputRawTexture:(id)a3;
- (void)setIsQuadra:(BOOL)a3;
- (void)setMetal:(id)a3;
- (void)setRenderROI:(id *)a3;
@end

@implementation LearnedNRNetworkShared

- (void)setRenderROI:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var0;
  long long v5 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_renderROI.origin.z = *(_OWORD *)&a3->var0.var2;
  *(_OWORD *)&self->_renderROI.size.height = v5;
  *(_OWORD *)&self->_renderROI.origin.x = v4;
  [(LearnedNRNetworkShared *)self getTileCount];
  *(void *)self->_numTiles = v6;
}

- (uint32x2_t)getTileCount
{
  return vcvt_u32_f32(vrndp_f32(vdiv_f32(vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + 40), vdupq_n_s64(0xFFFFFFFFFFFFFFE0)))), (float32x2_t)0x4428000044380000)));
}

- (uint64_t)getTileForIndex:(int64x2_t *)a1
{
  uint64_t v2 = a1->i64[1];
  if (HIDWORD(a2) == HIDWORD(v2) - 1) {
    int v3 = a1[3].u16[0] - 720;
  }
  else {
    int v3 = 672 * HIDWORD(a2) - 16;
  }
  v4.i32[1] = v3;
  int v5 = v2;
  v6.i32[1] = v3;
  v6.i32[0] = 736 * LODWORD(a2) - 16;
  if (LODWORD(a2) == v5 - 1)
  {
    v4.i32[0] = a1[2].u16[4] - 784;
    int32x2_t v6 = v4;
  }
  int32x2_t v7 = vadd_s32(v6, vmovn_s64(a1[1]));
  HIWORD(v9) = v7.i16[2];
  LOWORD(v9) = v7.i16[0];
  return v9 | 0x2E0032000000000;
}

- (LearnedNRUniforms)framePropertiesAddress
{
  return &self->_frameProperties;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (void)setMetal:(id)a3
{
}

- (MTLTexture)inputRawTexture
{
  return self->_inputRawTexture;
}

- (void)setInputRawTexture:(id)a3
{
}

- ($21C794F2A23EEFF9903A5FA3949B7063)renderROI
{
  long long v3 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var2;
  *(_OWORD *)&retstr->var0.var2 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var0;
  return self;
}

- (MTLTexture)inputLSCGainsTexture
{
  return self->_inputLSCGainsTexture;
}

- (void)setInputLSCGainsTexture:(id)a3
{
}

- (BOOL)isQuadra
{
  return self->_isQuadra;
}

- (void)setIsQuadra:(BOOL)a3
{
  self->_isQuadra = a3;
}

- (LearnedNRUniforms)frameProperties
{
  return (LearnedNRUniforms *)memcpy(retstr, &self->_frameProperties, 0x130uLL);
}

- (void)setFrameProperties:(LearnedNRUniforms *)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputLSCGainsTexture, 0);
  objc_storeStrong((id *)&self->_inputRawTexture, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end