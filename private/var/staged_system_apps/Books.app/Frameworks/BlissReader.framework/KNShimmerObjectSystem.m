@interface KNShimmerObjectSystem
- ($AAD9533F3604406277746FEA2624957A)vertexUniforms;
- (void)drawWithPercent:(double)a3 opacity:(double)a4 rotation:(double)a5 clockwise:(BOOL)a6 texture:(id)a7 context:(id)a8;
- (void)setVertexUniforms:(id)a3;
@end

@implementation KNShimmerObjectSystem

- (void)drawWithPercent:(double)a3 opacity:(double)a4 rotation:(double)a5 clockwise:(BOOL)a6 texture:(id)a7 context:(id)a8
{
  BOOL v8 = a6;
  id v12 = a8;
  double v13 = fmax(a3 * 1.1 + -0.1, 0.0);
  double v14 = -v13;
  if (v8) {
    double v14 = v13;
  }
  memset(&v25, 0, sizeof(v25));
  CGAffineTransformMakeRotation(&v25, v14 + v14);
  if (v12)
  {
    TSDMixFloats();
    if (v15 <= 1.0) {
      double v16 = 1.0 - v15;
    }
    else {
      double v16 = 0.0;
    }
    float v17 = v13;
    float v18 = v16 * a4;
    self[2]._vertexUniforms.SpeedMax = v17;
    *(float *)self[3].super.TSDGPUParticleSystem_opaque = v18;
    float32x2_t v19 = vcvt_f32_f64(*(float64x2_t *)&v25.a);
    KNShimmerSystem v20 = (KNShimmerSystem)vcvt_f32_f64(*(float64x2_t *)&v25.c);
    float32x2_t v21 = vcvt_f32_f64(*(float64x2_t *)&v25.tx);
    self[3]._vertexUniforms.Opacity = 0.0;
    *(float32x2_t *)&self[3]._anon_8[4] = v19;
    *(_DWORD *)self[4]._anon_8 = 0;
    self[4].super = v20;
    self[4]._vertexUniforms.SpeedMax = 1.0;
    *(float32x2_t *)&self[4]._vertexUniforms.Percent = v21;
    [(KNShimmerSystem *)self speedMax];
    *(float *)&double v22 = v22;
    *(_DWORD *)&self[5].super.TSDGPUParticleSystem_opaque[4] = LODWORD(v22);
    v23 = [v12 renderEncoder];
    [v23 setVertexBytes:&self->_vertexUniforms length:144 atIndex:1];

    v24 = [v12 renderEncoder];
    [(KNShimmerObjectSystem *)self drawMetalWithEncoder:v24];
  }
}

- ($AAD9533F3604406277746FEA2624957A)vertexUniforms
{
  long long v3 = *(_OWORD *)&self[4]._vertexUniforms.Percent;
  v2[6] = *(_OWORD *)self[4].super.TSDGPUParticleSystem_opaque;
  v2[7] = v3;
  v2[8] = *(_OWORD *)&self[5].super.TSDGPUParticleSystem_opaque[4];
  long long v4 = *(_OWORD *)self[2]._anon_8;
  v2[2] = *(_OWORD *)&self[1]._vertexUniforms.Opacity;
  v2[3] = v4;
  long long v5 = *(_OWORD *)&self[3]._anon_8[4];
  v2[4] = *(_OWORD *)&self[2]._vertexUniforms.SpeedMax;
  v2[5] = v5;
  long long v7 = *(_OWORD *)&self->_vertexUniforms.Percent;
  long long v6 = *(_OWORD *)&self[1].super.TSDGPUParticleSystem_opaque[4];
  _OWORD *v2 = v7;
  v2[1] = v6;
  result.var2 = *(float *)&v7;
  result.var1 = *(float *)&v6;
  return result;
}

- (void)setVertexUniforms:(id)a3
{
  *(_OWORD *)&self->_vertexUniforms.Percent = *v3;
  long long v4 = v3[4];
  long long v6 = v3[1];
  long long v5 = v3[2];
  *(_OWORD *)self[2]._anon_8 = v3[3];
  *(_OWORD *)&self[2]._vertexUniforms.SpeedMax = v4;
  *(_OWORD *)&self[1].super.TSDGPUParticleSystem_opaque[4] = v6;
  *(_OWORD *)&self[1]._vertexUniforms.Opacity = v5;
  long long v7 = v3[8];
  long long v9 = v3[5];
  long long v8 = v3[6];
  *(_OWORD *)&self[4]._vertexUniforms.Percent = v3[7];
  *(_OWORD *)&self[5].super.TSDGPUParticleSystem_opaque[4] = v7;
  *(_OWORD *)&self[3]._anon_8[4] = v9;
  *(_OWORD *)self[4].super.TSDGPUParticleSystem_opaque = v8;
}

@end