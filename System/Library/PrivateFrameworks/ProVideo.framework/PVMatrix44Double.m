@interface PVMatrix44Double
+ (BOOL)isMatrix:(id)a3 equivalentTo:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)matrix;
+ (id)matrixWithPCMatrix44Double:(id)a3;
+ (id)matrixWithPCMatrix44d:(const void *)a3;
+ (id)matrixWithSIMDDouble4x4:(_OWORD *)a3;
+ (id)matrixWithSIMDFloat4x4:(double)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinite;
- (BOOL)isIdentity;
- (PVMatrix44Double)init;
- (PVMatrix44Double)initWithCoder:(id)a3;
- (PVMatrix44Double)initWithPCMatrix44Double:(id)a3;
- (PVMatrix44Double)initWithPCMatrix44d:(const void *)a3;
- (__n128)SIMDDouble4x4;
- (__n128)initWithSIMDDouble4x4:(uint64_t)a3;
- (__n128)setSIMDDouble4x4:(long long *)a3;
- (double)SIMDFloat4x4;
- (double)valueAtCol:(unint64_t)a3 row:(unint64_t)a4;
- (float64x2_t)setSIMDFloat4x4:(float32x4_t)a3;
- (id)compactDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extendedDescription;
- (id)pcMatrix44Double;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getPCMatrix44d:(void *)a3;
- (void)getTransformInfo:(_OWORD *)a3@<X8>;
- (void)initWithSIMDFloat4x4:(double)a3;
- (void)makeIdentity;
- (void)setPCMatrix44Double:(id)a3;
- (void)setPCMatrix44d:(const void *)a3;
- (void)setValue:(double)a3 col:(unint64_t)a4 row:(unint64_t)a5;
- (void)transpose;
@end

@implementation PVMatrix44Double

+ (id)matrix
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (BOOL)isMatrix:(id)a3 equivalentTo:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 == v6 || !(v5 | v6)) {
    goto LABEL_3;
  }
  if (v5 && v6)
  {
    char v9 = [(id)v5 isEqual:v6];
LABEL_9:
    BOOL v8 = v9;
    goto LABEL_10;
  }
  if (([(id)v5 isIdentity] & 1) == 0)
  {
    char v9 = [v7 isIdentity];
    goto LABEL_9;
  }
LABEL_3:
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

+ (id)matrixWithSIMDFloat4x4:(double)a3
{
  unint64_t v5 = objc_msgSend([a1 alloc], "initWithSIMDFloat4x4:", a2, a3, a4, a5);

  return v5;
}

+ (id)matrixWithSIMDDouble4x4:(_OWORD *)a3
{
  id v4 = [a1 alloc];
  long long v5 = a3[5];
  v11[4] = a3[4];
  v11[5] = v5;
  long long v6 = a3[7];
  v11[6] = a3[6];
  v11[7] = v6;
  long long v7 = a3[1];
  v11[0] = *a3;
  v11[1] = v7;
  long long v8 = a3[3];
  v11[2] = a3[2];
  v11[3] = v8;
  char v9 = (void *)[v4 initWithSIMDDouble4x4:v11];

  return v9;
}

- (PVMatrix44Double)init
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F14990] + 80);
  v7[4] = *(_OWORD *)(MEMORY[0x1E4F14990] + 64);
  v7[5] = v2;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F14990] + 112);
  v7[6] = *(_OWORD *)(MEMORY[0x1E4F14990] + 96);
  v7[7] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F14990] + 16);
  v7[0] = *MEMORY[0x1E4F14990];
  v7[1] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F14990] + 48);
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F14990] + 32);
  v7[3] = v5;
  return [(PVMatrix44Double *)self initWithSIMDDouble4x4:v7];
}

- (void)initWithSIMDFloat4x4:(double)a3
{
  long long v5 = (void *)[a1 init];
  long long v6 = v5;
  if (v5) {
    objc_msgSend(v5, "setSIMDFloat4x4:", a2, a3, a4, a5);
  }
  return v6;
}

- (__n128)initWithSIMDDouble4x4:(uint64_t)a3
{
  v11.receiver = a1;
  v11.super_class = (Class)PVMatrix44Double;
  long long v4 = [(PVMatrix44Double *)&v11 init];
  if (v4)
  {
    PVMatrix44Double v6 = *(PVMatrix44Double *)a3;
    PVMatrix44Double v7 = *(PVMatrix44Double *)(a3 + 16);
    PVMatrix44Double v8 = *(PVMatrix44Double *)(a3 + 48);
    v4[3] = *(PVMatrix44Double *)(a3 + 32);
    v4[4] = v8;
    v4[1] = v6;
    v4[2] = v7;
    __n128 result = *(__n128 *)(a3 + 64);
    PVMatrix44Double v9 = *(PVMatrix44Double *)(a3 + 80);
    PVMatrix44Double v10 = *(PVMatrix44Double *)(a3 + 112);
    v4[7] = *(PVMatrix44Double *)(a3 + 96);
    v4[8] = v10;
    v4[5] = (PVMatrix44Double)result;
    v4[6] = v9;
  }
  return result;
}

- (double)SIMDFloat4x4
{
  *(void *)&double result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(a1[1]), a1[2]).u64[0];
  return result;
}

- (float64x2_t)setSIMDFloat4x4:(float32x4_t)a3
{
  a1[1] = vcvtq_f64_f32(*(float32x2_t *)a2.f32);
  a1[2] = vcvt_hight_f64_f32(a2);
  a1[3] = vcvtq_f64_f32(*(float32x2_t *)a3.f32);
  a1[4] = vcvt_hight_f64_f32(a3);
  a1[5] = vcvtq_f64_f32(*(float32x2_t *)a4.f32);
  a1[6] = vcvt_hight_f64_f32(a4);
  float64x2_t result = vcvt_hight_f64_f32(a5);
  a1[7] = vcvtq_f64_f32(*(float32x2_t *)a5.f32);
  a1[8] = result;
  return result;
}

- (double)valueAtCol:(unint64_t)a3 row:(unint64_t)a4
{
  return *((double *)&self[2 * a3 + 1].super.isa + (a4 & 3));
}

- (void)setValue:(double)a3 col:(unint64_t)a4 row:(unint64_t)a5
{
  *((double *)&self[2 * a4 + 1].super.isa + a5) = a3;
}

- (BOOL)isFinite
{
  long long v2 = (__int128)self[6];
  v7[4] = (__int128)self[5];
  v7[5] = v2;
  long long v3 = (__int128)self[8];
  v7[6] = (__int128)self[7];
  v7[7] = v3;
  long long v4 = (__int128)self[2];
  v7[0] = (__int128)self[1];
  v7[1] = v4;
  long long v5 = (__int128)self[4];
  v7[2] = (__int128)self[3];
  v7[3] = v5;
  return pv_is_finite(v7);
}

- (BOOL)isIdentity
{
  float64x2_t v2 = (float64x2_t)vdupq_n_s64(0x3F1A36E2EB1C432DuLL);
  int64x2_t v3 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[3], *(float64x2_t *)(MEMORY[0x1E4F14990] + 32))), (int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[1], *MEMORY[0x1E4F14990]))), vandq_s8((int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[5], *(float64x2_t *)(MEMORY[0x1E4F14990] + 64))), (int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[7], *(float64x2_t *)(MEMORY[0x1E4F14990] + 96))))), vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[4], *(float64x2_t *)(MEMORY[0x1E4F14990] + 48))), (int8x16_t)vcgeq_f64(
                                     v2,
                                     vabdq_f64((float64x2_t)self[2], *(float64x2_t *)(MEMORY[0x1E4F14990] + 16)))),
                      vandq_s8((int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[6], *(float64x2_t *)(MEMORY[0x1E4F14990] + 80))), (int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[8], *(float64x2_t *)(MEMORY[0x1E4F14990] + 112))))));
  return vandq_s8((int8x16_t)v3, (int8x16_t)vdupq_laneq_s64(v3, 1)).u64[0] >> 63;
}

- (void)makeIdentity
{
  float64x2_t v2 = (PVMatrix44Double *)MEMORY[0x1E4F14990];
  PVMatrix44Double v3 = *(PVMatrix44Double *)(MEMORY[0x1E4F14990] + 80);
  self[5] = *(PVMatrix44Double *)(MEMORY[0x1E4F14990] + 64);
  self[6] = v3;
  PVMatrix44Double v4 = v2[7];
  self[7] = v2[6];
  self[8] = v4;
  PVMatrix44Double v5 = v2[1];
  self[1] = *v2;
  self[2] = v5;
  PVMatrix44Double v6 = v2[3];
  self[3] = v2[2];
  self[4] = v6;
}

- (void)transpose
{
  float64x2_t v2 = (const double *)&self[1];
  float64x2x4_t v4 = vld4q_f64(v2);
  PVMatrix44Double v3 = (const double *)&self[5];
  float64x2x4_t v5 = vld4q_f64(v3);
  self[1] = (PVMatrix44Double)v4.val[0];
  self[2] = (PVMatrix44Double)v5.val[0];
  self[3] = (PVMatrix44Double)v4.val[1];
  self[4] = (PVMatrix44Double)v5.val[1];
  self[5] = (PVMatrix44Double)v4.val[2];
  self[6] = (PVMatrix44Double)v5.val[2];
  self[7] = (PVMatrix44Double)v4.val[3];
  self[8] = (PVMatrix44Double)v5.val[3];
}

- (void)getTransformInfo:(_OWORD *)a3@<X8>
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a2) {
    *a2 = 0;
  }
  a3[4] = xmmword_1B7E73520;
  a3[5] = unk_1B7E73530;
  a3[6] = xmmword_1B7E73540;
  a3[7] = unk_1B7E73550;
  *a3 = pv_transform_info_identity;
  a3[1] = *(_OWORD *)algn_1B7E734F0;
  a3[2] = xmmword_1B7E73500;
  a3[3] = unk_1B7E73510;
  long long v5 = a1[6];
  v15[4] = a1[5];
  v15[5] = v5;
  long long v6 = a1[8];
  v15[6] = a1[7];
  v15[7] = v6;
  long long v7 = a1[2];
  v15[0] = a1[1];
  v15[1] = v7;
  long long v8 = a1[4];
  v15[2] = a1[3];
  v15[3] = v8;
  BOOL v9 = pv_transform_info_make((uint64_t)v15, (uint64_t)a3);
  if (a2)
  {
    if (!v9)
    {
      PVMatrix44Double v10 = NSString;
      objc_super v11 = [a1 compactDescription];
      v12 = [v10 stringWithFormat:@"Failed to get transformInfo for matrix: %p %@", a1, v11];

      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17[0] = v12;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *a2 = [v13 errorWithDomain:@"com.apple.provideo.PVMatrix" code:1 userInfo:v14];
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVMatrix44Double)initWithCoder:(id)a3
{
  id v4 = a3;
  if (![v4 containsValueForKey:@"kPVMatrixKey"])
  {
    long long v5 = [[PCMatrix44Double alloc] initWithCoder:v4];

    if (v5)
    {
      long long v6 = [(PVMatrix44Double *)self initWithPCMatrix44Double:v5];
      goto LABEL_6;
    }
LABEL_7:
    long long v7 = 0;
    goto LABEL_8;
  }
  long long v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPVMatrixKey"];

  if (!v5) {
    goto LABEL_7;
  }
  [(PCMatrix44Double *)v5 SIMDDouble4x4Value];
  long long v6 = [(PVMatrix44Double *)self initWithSIMDDouble4x4:&v9];
LABEL_6:
  self = v6;

  long long v7 = self;
LABEL_8:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  PVMatrix44Double v3 = (void *)MEMORY[0x1E4F29238];
  PVMatrix44Double v4 = self[6];
  PVMatrix44Double v14 = self[5];
  PVMatrix44Double v15 = v4;
  PVMatrix44Double v5 = self[8];
  PVMatrix44Double v16 = self[7];
  PVMatrix44Double v17 = v5;
  PVMatrix44Double v6 = self[2];
  PVMatrix44Double v10 = self[1];
  PVMatrix44Double v11 = v6;
  PVMatrix44Double v7 = self[4];
  PVMatrix44Double v12 = self[3];
  PVMatrix44Double v13 = v7;
  id v8 = a3;
  uint64_t v9 = [v3 valueWithSIMDDouble4x4:&v10];
  objc_msgSend(v8, "encodeObject:forKey:", v9, @"kPVMatrixKey", v10, v11, v12, v13, v14, v15, v16, v17);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PVMatrix44Double v3 = self[6];
  v8[4] = self[5];
  v8[5] = v3;
  PVMatrix44Double v4 = self[8];
  v8[6] = self[7];
  v8[7] = v4;
  PVMatrix44Double v5 = self[2];
  v8[0] = self[1];
  v8[1] = v5;
  PVMatrix44Double v6 = self[4];
  v8[2] = self[3];
  v8[3] = v6;
  +[PVMatrix44Double matrixWithSIMDDouble4x4:v8];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4)
    {
      [v4 SIMDDouble4x4];
      float64x2_t v5 = v17;
      float64x2_t v6 = v18;
      float64x2_t v7 = v19;
      float64x2_t v8 = v20;
      float64x2_t v9 = v21;
      float64x2_t v10 = v22;
      float64x2_t v11 = v23;
      float64x2_t v12 = v24;
    }
    else
    {
      float64x2_t v11 = 0uLL;
      float64x2_t v12 = 0uLL;
      float64x2_t v9 = 0uLL;
      float64x2_t v10 = 0uLL;
      float64x2_t v7 = 0uLL;
      float64x2_t v8 = 0uLL;
      float64x2_t v5 = 0uLL;
      float64x2_t v6 = 0uLL;
    }
    float64x2_t v14 = (float64x2_t)vdupq_n_s64(0x3F1A36E2EB1C432DuLL);
    int64x2_t v15 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[3], v7)), (int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[1], v5))), vandq_s8((int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[5], v9)), (int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[7], v11)))), vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[4], v8)), (int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[2], v6))), vandq_s8((int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[6], v10)), (int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[8], v12)))));
    unint64_t v13 = vandq_s8((int8x16_t)v15, (int8x16_t)vdupq_laneq_s64(v15, 1)).u64[0] >> 63;
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v35 = [NSNumber numberWithDouble:*(double *)&self[1].super.isa];
  uint64_t v3 = [v35 hash];
  v34 = [NSNumber numberWithDouble:*(double *)self[1]._anon_8];
  uint64_t v4 = [v34 hash] ^ v3;
  v33 = [NSNumber numberWithDouble:*(double *)&self[2].super.isa];
  uint64_t v5 = [v33 hash];
  v32 = [NSNumber numberWithDouble:*(double *)self[2]._anon_8];
  uint64_t v6 = v4 ^ v5 ^ [v32 hash];
  v31 = [NSNumber numberWithDouble:*(double *)&self[3].super.isa];
  uint64_t v7 = [v31 hash];
  v30 = [NSNumber numberWithDouble:*(double *)self[3]._anon_8];
  uint64_t v8 = v7 ^ [v30 hash];
  v29 = [NSNumber numberWithDouble:*(double *)&self[4].super.isa];
  uint64_t v9 = v6 ^ v8 ^ [v29 hash];
  v28 = [NSNumber numberWithDouble:*(double *)self[4]._anon_8];
  uint64_t v10 = [v28 hash];
  v27 = [NSNumber numberWithDouble:*(double *)&self[5].super.isa];
  uint64_t v11 = v10 ^ [v27 hash];
  float64x2_t v12 = [NSNumber numberWithDouble:*(double *)self[5]._anon_8];
  uint64_t v13 = v11 ^ [v12 hash];
  float64x2_t v14 = [NSNumber numberWithDouble:*(double *)&self[6].super.isa];
  uint64_t v15 = v9 ^ v13 ^ [v14 hash];
  PVMatrix44Double v16 = [NSNumber numberWithDouble:*(double *)self[6]._anon_8];
  uint64_t v17 = [v16 hash];
  float64x2_t v18 = [NSNumber numberWithDouble:*(double *)&self[7].super.isa];
  uint64_t v19 = v17 ^ [v18 hash];
  float64x2_t v20 = [NSNumber numberWithDouble:*(double *)self[7]._anon_8];
  uint64_t v21 = v19 ^ [v20 hash];
  float64x2_t v22 = [NSNumber numberWithDouble:*(double *)&self[8].super.isa];
  uint64_t v23 = v21 ^ [v22 hash];
  float64x2_t v24 = [NSNumber numberWithDouble:*(double *)self[8]._anon_8];
  unint64_t v25 = v15 ^ v23 ^ [v24 hash];

  return v25;
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)PVMatrix44Double;
  uint64_t v4 = [(PVMatrix44Double *)&v8 description];
  uint64_t v5 = [(PVMatrix44Double *)self compactDescription];
  uint64_t v6 = (void *)[v3 initWithFormat:@"%@\n%@", v4, v5];

  return v6;
}

- (id)compactDescription
{
  PVMatrix44Double v2 = self[6];
  v8[4] = self[5];
  v8[5] = v2;
  PVMatrix44Double v3 = self[8];
  v8[6] = self[7];
  v8[7] = v3;
  PVMatrix44Double v4 = self[2];
  v8[0] = self[1];
  v8[1] = v4;
  PVMatrix44Double v5 = self[4];
  v8[2] = self[3];
  v8[3] = v5;
  uint64_t v6 = NSStringFromSIMDDouble4x4((uint64_t)v8, 3);

  return v6;
}

- (id)extendedDescription
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v12 = 0;
  [(PVMatrix44Double *)self getTransformInfo:&v12];
  id v3 = v12;
  PVMatrix44Double v4 = NSString;
  PVMatrix44Double v5 = [(PVMatrix44Double *)self description];
  uint64_t v6 = v5;
  if (v3)
  {
    uint64_t v7 = [v3 localizedDescription];
    objc_super v8 = [v4 stringWithFormat:@"%@\nExtended Description Failed: %@", v6, v7];
  }
  else
  {
    uint64_t v7 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n    "];
    v11[4] = v17;
    v11[5] = v18;
    v11[6] = v19;
    v11[7] = v20;
    v11[0] = v13;
    v11[1] = v14;
    v11[2] = v15;
    v11[3] = v16;
    uint64_t v9 = NSStringFromPVTransformInfo(v11, 3);
    objc_super v8 = [v4 stringWithFormat:@"%@\n%@", v7, v9];
  }

  return v8;
}

- (__n128)SIMDDouble4x4
{
  long long v2 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 64);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setSIMDDouble4x4:(long long *)a3
{
  long long v3 = *a3;
  long long v4 = a3[1];
  long long v5 = a3[3];
  *(_OWORD *)(a1 + 48) = a3[2];
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  __n128 result = (__n128)a3[4];
  long long v7 = a3[5];
  long long v8 = a3[7];
  *(_OWORD *)(a1 + 112) = a3[6];
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v7;
  return result;
}

+ (id)matrixWithPCMatrix44Double:(id)a3
{
  id v4 = a3;
  long long v5 = (void *)[objc_alloc((Class)a1) initWithPCMatrix44Double:v4];

  return v5;
}

- (PVMatrix44Double)initWithPCMatrix44Double:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (v4)
  {
    long long v6 = (long long *)[v4 pcMatrix];
    long long v7 = *v6;
    long long v8 = v6[1];
    long long v9 = v6[3];
    *(_OWORD *)&v15[32] = v6[2];
    long long v16 = v9;
    *(_OWORD *)long long v15 = v7;
    *(_OWORD *)&v15[16] = v8;
    long long v10 = v6[4];
    long long v11 = v6[5];
    long long v12 = v6[7];
    *(_OWORD *)&v18[16] = v6[6];
    *(_OWORD *)&v18[32] = v12;
    long long v17 = v10;
    *(_OWORD *)long long v18 = v11;
  }
  else
  {
    *(void *)&v18[40] = 0x3FF0000000000000;
    *(void *)long long v18 = 0x3FF0000000000000;
    *(void *)&v15[40] = 0x3FF0000000000000;
    *(void *)long long v15 = 0x3FF0000000000000;
    memset(&v15[8], 0, 32);
    long long v16 = 0u;
    long long v17 = 0u;
    memset(&v18[8], 0, 32);
  }
  long long v13 = [(PVMatrix44Double *)self initWithPCMatrix44d:v15];

  return v13;
}

- (id)pcMatrix44Double
{
  uint64_t v14 = 0x3FF0000000000000;
  uint64_t v11 = 0x3FF0000000000000;
  uint64_t v8 = 0x3FF0000000000000;
  uint64_t v5 = 0x3FF0000000000000;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  [(PVMatrix44Double *)self SIMDDouble4x4];
  pv_PCMatrix44d_from_simd_double4x4(v4, (uint64_t)&v5);
  long long v2 = [[PCMatrix44Double alloc] initWithPCMatrix:&v5];

  return v2;
}

- (void)setPCMatrix44Double:(id)a3
{
  id v4 = a3;
  -[PVMatrix44Double setPCMatrix44d:](self, "setPCMatrix44d:", [v4 pcMatrix]);
}

+ (id)matrixWithPCMatrix44d:(const void *)a3
{
  long long v3 = (void *)[objc_alloc((Class)a1) initWithPCMatrix44d:a3];

  return v3;
}

- (PVMatrix44Double)initWithPCMatrix44d:(const void *)a3
{
  id v4 = [(PVMatrix44Double *)self init];
  uint64_t v5 = v4;
  if (v4) {
    [(PVMatrix44Double *)v4 setPCMatrix44d:a3];
  }
  return v5;
}

- (void)getPCMatrix44d:(void *)a3
{
  [(PVMatrix44Double *)self SIMDDouble4x4];
  pv_PCMatrix44d_from_simd_double4x4(v4, (uint64_t)a3);
}

- (void)setPCMatrix44d:(const void *)a3
{
  -[PVMatrix44Double setSIMDDouble4x4:](self, "setSIMDDouble4x4:", v3, pv_simd_double4x4_from_PCMatrix44d((unint64_t *)a3, v3).n128_f64[0]);
}

@end