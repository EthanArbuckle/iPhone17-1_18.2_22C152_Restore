@interface VLLocalizationResult
+ (BOOL)supportsSecureCoding;
- ($153C3A5BC4E016D58A1B9CA554FFC462)location;
- ($4ED12C4C7630B45462BF021B0F75306B)covariance;
- (BOOL)isEqual:(id)a3;
- (VLLocalizationDebugInfo)debugInfo;
- (VLLocalizationResult)init;
- (VLLocalizationResult)initWithCoder:(id)a3;
- (VLLocalizationResult)initWithTimestamp:(double)a3 pose:(id *)a4 debugInfo:(id)a5;
- (__n128)transform;
- (double)inputTimestamp;
- (float)confidence;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VLLocalizationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VLLocalizationResult)init
{
  result = (VLLocalizationResult *)[MEMORY[0x263EFF940] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (VLLocalizationResult)initWithTimestamp:(double)a3 pose:(id *)a4 debugInfo:(id)a5
{
  id v9 = a5;
  if (a4
    && (v25.receiver = self,
        v25.super_class = (Class)VLLocalizationResult,
        v10 = [(VLLocalizationResult *)&v25 init],
        (self = v10) != 0))
  {
    v10->_timestamp = a3;
    *(double *)&long long v14 = a4->var0[0][0];
    *(double *)&long long v15 = a4->var0[0][1];
    *(double *)&long long v16 = a4->var0[0][2];
    long long v17 = *(_OWORD *)a4->var1;
    *((void *)&v14 + 1) = *(void *)&a4->var0[1][0];
    *((void *)&v15 + 1) = *(void *)&a4->var0[1][1];
    *((void *)&v16 + 1) = *(void *)&a4->var0[1][2];
    *(double *)&long long v11 = a4->var0[2][0];
    *(double *)&long long v12 = a4->var0[2][1];
    *(double *)&long long v13 = a4->var0[2][2];
    __asm { FMOV            V7.2D, #1.0 }
    *(double *)&_Q7 = a4->var1[2];
    *(_OWORD *)v10->_anon_50 = v14;
    *(_OWORD *)&v10->_anon_50[16] = v11;
    *(_OWORD *)&v10->_anon_50[32] = v15;
    *(_OWORD *)&v10->_anon_50[48] = v12;
    *(_OWORD *)&v10->_anon_50[64] = v16;
    *(_OWORD *)&v10->_anon_50[80] = v13;
    *(_OWORD *)&v10->_anon_50[96] = v17;
    *(_OWORD *)&v10->_anon_50[112] = _Q7;
    *(double *)&long long v15 = a4->var1[2];
    *(_OWORD *)v10->_anon_20 = *(_OWORD *)a4->var1;
    *(_OWORD *)&v10->_anon_20[16] = v15;
    *(void *)&v10->_anon_20[32] = 0xBFF0000000000000;
    v10->_confidence = a4->var2;
    v10->_covariance.v[0][0] = a4->var3[0];
    v10->_covariance.v[0][1] = a4->var3[1];
    v10->_covariance.v[0][2] = a4->var3[2];
    v10->_covariance.v[0][3] = a4->var3[3];
    v10->_covariance.v[0][4] = a4->var3[4];
    v10->_covariance.v[0][5] = a4->var3[5];
    v10->_covariance.v[1][0] = a4->var3[6];
    v10->_covariance.v[1][1] = a4->var3[7];
    v10->_covariance.v[1][2] = a4->var3[8];
    v10->_covariance.v[1][3] = a4->var3[9];
    v10->_covariance.v[1][4] = a4->var3[10];
    v10->_covariance.v[1][5] = a4->var3[11];
    v10->_covariance.v[2][0] = a4->var3[12];
    v10->_covariance.v[2][1] = a4->var3[13];
    v10->_covariance.v[2][2] = a4->var3[14];
    v10->_covariance.v[2][3] = a4->var3[15];
    v10->_covariance.v[2][4] = a4->var3[16];
    v10->_covariance.v[2][5] = a4->var3[17];
    v10->_covariance.v[3][0] = a4->var3[18];
    v10->_covariance.v[3][1] = a4->var3[19];
    v10->_covariance.v[3][2] = a4->var3[20];
    v10->_covariance.v[3][3] = a4->var3[21];
    v10->_covariance.v[3][4] = a4->var3[22];
    v10->_covariance.v[3][5] = a4->var3[23];
    v10->_covariance.v[4][0] = a4->var3[24];
    v10->_covariance.v[4][1] = a4->var3[25];
    v10->_covariance.v[4][2] = a4->var3[26];
    v10->_covariance.v[4][3] = a4->var3[27];
    v10->_covariance.v[4][4] = a4->var3[28];
    v10->_covariance.v[4][5] = a4->var3[29];
    v10->_covariance.v[5][0] = a4->var3[30];
    v10->_covariance.v[5][1] = a4->var3[31];
    v10->_covariance.v[5][2] = a4->var3[32];
    v10->_covariance.v[5][3] = a4->var3[33];
    v10->_covariance.v[5][4] = a4->var3[34];
    v10->_covariance.v[5][5] = a4->var3[35];
    objc_storeStrong((id *)&v10->_debugInfo, a5);
    self = self;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (VLLocalizationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VLLocalizationResult;
  v5 = [(VLLocalizationResult *)&v19 init];
  if (!v5) {
    goto LABEL_5;
  }
  [v4 decodeDoubleForKey:@"timestamp"];
  v5->_timestamp = v6;
  [v4 decodeDoubleForKey:@"location_x"];
  uint64_t v18 = v7;
  [v4 decodeDoubleForKey:@"location_y"];
  uint64_t v17 = v8;
  [v4 decodeDoubleForKey:@"location_z"];
  *(void *)&long long v9 = v18;
  *((void *)&v9 + 1) = v17;
  *(_OWORD *)v5->_anon_20 = v9;
  *(_OWORD *)&v5->_anon_20[16] = v10;
  [v4 decodeDoubleForKey:@"location_accuracy"];
  *(void *)&v5->_anon_20[32] = v11;
  if (!objc_msgSend(v4, "_vl_decodeSimdDouble4x4:forKey:", v5->_anon_50, @"transform")) {
    goto LABEL_5;
  }
  [v4 decodeFloatForKey:@"confidence"];
  v5->_confidence = v12;
  if (objc_msgSend(v4, "_vl_decodeFloat6x6:forKey:", &v5->_covariance, @"covariance"))
  {
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"debug_info"];
    debugInfo = v5->_debugInfo;
    v5->_debugInfo = (VLLocalizationDebugInfo *)v13;

    long long v15 = v5;
  }
  else
  {
LABEL_5:
    long long v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  [v5 encodeDouble:@"location_x" forKey:*(double *)self->_anon_20];
  [v5 encodeDouble:@"location_y" forKey:*(double *)&self->_anon_20[8]];
  [v5 encodeDouble:@"location_z" forKey:*(double *)&self->_anon_20[16]];
  [v5 encodeDouble:@"location_accuracy" forKey:*(double *)&self->_anon_20[32]];
  long long v6 = *(_OWORD *)&self->_anon_50[80];
  long long v19 = *(_OWORD *)&self->_anon_50[64];
  long long v20 = v6;
  long long v7 = *(_OWORD *)&self->_anon_50[112];
  long long v21 = *(_OWORD *)&self->_anon_50[96];
  long long v22 = v7;
  long long v8 = *(_OWORD *)&self->_anon_50[16];
  long long v15 = *(_OWORD *)self->_anon_50;
  long long v16 = v8;
  long long v9 = *(_OWORD *)&self->_anon_50[48];
  long long v17 = *(_OWORD *)&self->_anon_50[32];
  long long v18 = v9;
  objc_msgSend(v5, "_vl_encodeSimdDouble4x4:forKey:", &v15, @"transform");
  *(float *)&double v10 = self->_confidence;
  [v5 encodeFloat:@"confidence" forKey:v10];
  long long v11 = *(_OWORD *)&self->_covariance.v[4][4];
  long long v21 = *(_OWORD *)&self->_covariance.v[4][0];
  long long v22 = v11;
  long long v23 = *(_OWORD *)&self->_covariance.v[5][2];
  long long v12 = *(_OWORD *)&self->_covariance.v[2][0];
  long long v17 = *(_OWORD *)&self->_covariance.v[1][2];
  long long v18 = v12;
  long long v13 = *(_OWORD *)&self->_covariance.v[3][2];
  long long v19 = *(_OWORD *)&self->_covariance.v[2][4];
  long long v20 = v13;
  long long v14 = *(_OWORD *)&self->_covariance.v[0][4];
  long long v15 = *(_OWORD *)&self->_covariance.v[0][0];
  long long v16 = v14;
  objc_msgSend(v5, "_vl_encodeFloat6x6:forKey:", &v15, @"covariance");
  [v5 encodeObject:self->_debugInfo forKey:@"debug_info"];
}

- (unint64_t)hash
{
  return (unint64_t)self->_timestamp;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VLLocalizationResult *)a3;
  id v5 = v4;
  if (v4 == self)
  {

    return 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v6 = v5;
      long long v7 = v6;
      BOOL v10 = self->_timestamp == v6[1].f64[0]
         && (v8 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[32], v6[7]), (int8x16_t)vceqq_f64(*(float64x2_t *)self->_anon_50, v6[5])), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[64], v6[9]), (int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[96], v6[11]))), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[48], v6[8]), (int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[16], v6[6])), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[80], v6[10]), (int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[112], v6[12])))), (vandq_s8((int8x16_t)v8, (int8x16_t)vdupq_laneq_s64(v8, 1)).u64[0] & 0x8000000000000000) != 0)&& (int64x2_t v9 = vceqq_f64(*(float64x2_t *)self->_anon_20, v6[2]), (vandq_s8((int8x16_t)vdupq_laneq_s64(v9, 1), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_20[16], v6[3]), (int8x16_t)v9)).u64[0] & 0x8000000000000000) != 0)
         && *(double *)&self->_anon_20[32] == v6[4].f64[0]
         && self->_confidence == *(float *)&v6->f64[1]
         && memcmp(&self->_covariance, &v6[13], 0x90uLL) == 0;

      return v10;
    }
    else
    {

      return 0;
    }
  }
}

- (unint64_t)timestamp
{
  if (qword_26AC37540 != -1) {
    dispatch_once(&qword_26AC37540, &__block_literal_global_0);
  }
  return (unint64_t)(self->_timestamp * *(double *)&_MergedGlobals);
}

double __33__VLLocalizationResult_timestamp__block_invoke()
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(v1) = info.numer;
    LODWORD(result) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)v1 * 1000000000.0;
    _MergedGlobals = *(void *)&result;
  }
  return result;
}

- (double)inputTimestamp
{
  return self->_timestamp;
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)location
{
  long long v3 = *(_OWORD *)&self->_anon_20[16];
  _OWORD *v2 = *(_OWORD *)self->_anon_20;
  v2[1] = v3;
  long long v4 = *(_OWORD *)&self->_anon_20[32];
  v2[2] = v4;
  return ($153C3A5BC4E016D58A1B9CA554FFC462)v4;
}

- (__n128)transform
{
  long long v2 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 112);
  long long v6 = *(_OWORD *)(a1 + 128);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- ($4ED12C4C7630B45462BF021B0F75306B)covariance
{
  long long v3 = *(_OWORD *)&self[2].var0[1][2];
  *(_OWORD *)&retstr->var0[4][0] = *(_OWORD *)&self[2].var0[0][4];
  *(_OWORD *)&retstr->var0[4][4] = v3;
  *(_OWORD *)&retstr->var0[5][2] = *(_OWORD *)&self[2].var0[2][0];
  long long v4 = *(_OWORD *)&self[1].var0[4][4];
  *(_OWORD *)&retstr->var0[1][2] = *(_OWORD *)&self[1].var0[4][0];
  *(_OWORD *)&retstr->var0[2][0] = v4;
  long long v5 = *(_OWORD *)&self[2].var0[0][0];
  *(_OWORD *)&retstr->var0[2][4] = *(_OWORD *)&self[1].var0[5][2];
  *(_OWORD *)&retstr->var0[3][2] = v5;
  long long v6 = *(_OWORD *)&self[1].var0[3][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[1].var0[2][4];
  *(_OWORD *)&retstr->var0[0][4] = v6;
  return self;
}

- (VLLocalizationDebugInfo)debugInfo
{
  return self->_debugInfo;
}

- (void).cxx_destruct
{
}

@end