@interface VGModelPose
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VGModelPose)initWithCoder:(id)a3;
- (__n128)modelPose;
- (__n128)setModelPose:(__n128)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VGModelPose

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF8F8];
  v4 = self + 1;
  id v5 = a3;
  id v6 = [v3 dataWithBytes:v4 length:64];
  [v5 encodeObject:v6 forKey:@"modelPose"];
}

- (VGModelPose)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VGModelPose;
  id v5 = [(VGModelPose *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelPose"];
    [v6 getBytes:&v5[1] length:64];
    v7 = v5;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (float32x4_t *)v4;
    [(VGModelPose *)self modelPose];
    float32x4_t v16 = v7;
    float32x4_t v17 = v6;
    float32x4_t v18 = v9;
    float32x4_t v19 = v8;
    float32x4_t v12 = v5[2];
    float32x4_t v13 = v5[1];
    float32x4_t v14 = v5[4];
    float32x4_t v15 = v5[3];

    unsigned int v10 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v17, v13), (int8x16_t)vceqq_f32(v16, v12)), vandq_s8((int8x16_t)vceqq_f32(v19, v15), (int8x16_t)vceqq_f32(v18, v14)))) >> 31;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (__n128)modelPose
{
  return a1[1];
}

- (__n128)setModelPose:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  return result;
}

@end