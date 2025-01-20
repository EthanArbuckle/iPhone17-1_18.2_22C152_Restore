@interface RawDFNetworkStageShared
- (FigMetalContext)metal;
- (MTLTexture)inputLSCGainsTexture;
- (MTLTexture)inputSkinMask;
- (MTLTexture)inputSkyMask;
- (MTLTexture)inputSyntheticEV0FusionMap;
- (MTLTexture)inputSyntheticLong;
- (MTLTexture)inputSyntheticLongFusionMap;
- (MTLTexture)inputSyntheticReference;
- (MTLTexture)inputSyntheticReferenceFusionMap;
- (MTLTexture)outputChromaTexture;
- (MTLTexture)outputLumaTexture;
- (RawDFNetworkUniforms)shaderUniforms;
- (TileBounds)getTileForIndex:(SEL)a3;
- (double)getTileCount;
- (void)setInputLSCGainsTexture:(id)a3;
- (void)setInputSkinMask:(id)a3;
- (void)setInputSkyMask:(id)a3;
- (void)setInputSyntheticEV0FusionMap:(id)a3;
- (void)setInputSyntheticLong:(id)a3;
- (void)setInputSyntheticLongFusionMap:(id)a3;
- (void)setInputSyntheticReference:(id)a3;
- (void)setInputSyntheticReferenceFusionMap:(id)a3;
- (void)setMetal:(id)a3;
- (void)setOutputChromaTexture:(id)a3;
- (void)setOutputLumaTexture:(id)a3;
@end

@implementation RawDFNetworkStageShared

- (double)getTileCount
{
  v1 = (id *)(a1 + 760);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 760));
  uint64_t v3 = [WeakRetained width];

  id v4 = objc_loadWeakRetained(v1);
  uint64_t v5 = [v4 height];
  v6.i64[0] = v3;
  v6.i64[1] = v5;
  double v7 = COERCE_DOUBLE(vcvt_u32_f32(vrndp_f32(vdiv_f32(vcvt_f32_f64(vcvtq_f64_u64(v6)), (float32x2_t)0x43D8000043FC0000))));

  return v7;
}

- (TileBounds)getTileForIndex:(SEL)a3
{
  *(void *)&retstr->var8 = 0;
  int v6 = HIDWORD(v3);
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  int v7 = v3;
  int v8 = 504 * v3;
  int v9 = 432 * HIDWORD(v3);
  [(RawDFNetworkStageShared *)self getTileCount];
  retstr->var0 = v7 + v10 * v6;
  retstr->var1 = v8 - 32;
  retstr->var2 = v9 - 32;
  *(void *)&retstr->var3 = 0x1F000000238;
  retstr->var5 = v8;
  retstr->var6 = v9;
  p_outputLumaTexture = &self->_outputLumaTexture;
  id WeakRetained = objc_loadWeakRetained((id *)p_outputLumaTexture);
  unint64_t v13 = [WeakRetained width] - v8;

  int v14 = 504;
  if (v13 < 0x1F8) {
    int v14 = v13;
  }
  retstr->var7 = v14;
  id v15 = objc_loadWeakRetained((id *)p_outputLumaTexture);
  unint64_t v16 = [v15 height] - v9;

  if (v16 >= 0x1B0) {
    int v18 = 432;
  }
  else {
    int v18 = v16;
  }
  retstr->var8 = v18;
  retstr->var9 = 32;
  return result;
}

- (RawDFNetworkUniforms)shaderUniforms
{
  return &self->_shaderUniforms;
}

- (FigMetalContext)metal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metal);

  return (FigMetalContext *)WeakRetained;
}

- (void)setMetal:(id)a3
{
}

- (MTLTexture)inputSyntheticLong
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputSyntheticLong);

  return (MTLTexture *)WeakRetained;
}

- (void)setInputSyntheticLong:(id)a3
{
}

- (MTLTexture)inputSyntheticReference
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputSyntheticReference);

  return (MTLTexture *)WeakRetained;
}

- (void)setInputSyntheticReference:(id)a3
{
}

- (MTLTexture)inputSyntheticEV0FusionMap
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputSyntheticEV0FusionMap);

  return (MTLTexture *)WeakRetained;
}

- (void)setInputSyntheticEV0FusionMap:(id)a3
{
}

- (MTLTexture)inputSyntheticLongFusionMap
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputSyntheticLongFusionMap);

  return (MTLTexture *)WeakRetained;
}

- (void)setInputSyntheticLongFusionMap:(id)a3
{
}

- (MTLTexture)inputSyntheticReferenceFusionMap
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputSyntheticReferenceFusionMap);

  return (MTLTexture *)WeakRetained;
}

- (void)setInputSyntheticReferenceFusionMap:(id)a3
{
}

- (MTLTexture)inputLSCGainsTexture
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputLSCGainsTexture);

  return (MTLTexture *)WeakRetained;
}

- (void)setInputLSCGainsTexture:(id)a3
{
}

- (MTLTexture)inputSkinMask
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputSkinMask);

  return (MTLTexture *)WeakRetained;
}

- (void)setInputSkinMask:(id)a3
{
}

- (MTLTexture)inputSkyMask
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputSkyMask);

  return (MTLTexture *)WeakRetained;
}

- (void)setInputSkyMask:(id)a3
{
}

- (MTLTexture)outputLumaTexture
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outputLumaTexture);

  return (MTLTexture *)WeakRetained;
}

- (void)setOutputLumaTexture:(id)a3
{
}

- (MTLTexture)outputChromaTexture
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outputChromaTexture);

  return (MTLTexture *)WeakRetained;
}

- (void)setOutputChromaTexture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_outputChromaTexture);
  objc_destroyWeak((id *)&self->_outputLumaTexture);
  objc_destroyWeak((id *)&self->_inputSkyMask);
  objc_destroyWeak((id *)&self->_inputSkinMask);
  objc_destroyWeak((id *)&self->_inputLSCGainsTexture);
  objc_destroyWeak((id *)&self->_inputSyntheticReferenceFusionMap);
  objc_destroyWeak((id *)&self->_inputSyntheticLongFusionMap);
  objc_destroyWeak((id *)&self->_inputSyntheticEV0FusionMap);
  objc_destroyWeak((id *)&self->_inputSyntheticReference);
  objc_destroyWeak((id *)&self->_inputSyntheticLong);

  objc_destroyWeak((id *)&self->_metal);
}

@end