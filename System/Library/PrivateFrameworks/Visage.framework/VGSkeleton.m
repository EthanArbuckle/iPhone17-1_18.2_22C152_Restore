@interface VGSkeleton
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)jointConfidence;
- (NSArray)localPoses;
- (NSArray)modelPoses;
- (NSDictionary)debugInfo;
- (VGSkeleton)initWithCoder:(id)a3;
- (VGSkeletonDefinition)skeletonDefinition;
- (__n128)floorAlignedRootTransform;
- (__n128)rootTransform;
- (__n128)setFloorAlignedRootTransform:(__n128)a3;
- (__n128)setRootTransform:(__n128)a3;
- (int)skeletonType;
- (void)encodeWithCoder:(id)a3;
- (void)setDebugInfo:(id)a3;
- (void)setJointConfidence:(id)a3;
- (void)setLocalPoses:(id)a3;
- (void)setModelPoses:(id)a3;
- (void)setSkeletonDefinition:(id)a3;
- (void)setSkeletonType:(int)a3;
@end

@implementation VGSkeleton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[VGSkeleton skeletonType](self, "skeletonType"), @"skeletonType");
  v5 = [(VGSkeleton *)self skeletonDefinition];
  [v4 encodeObject:v5 forKey:@"skeletonDefinition"];

  v6 = [(VGSkeleton *)self localPoses];
  [v4 encodeObject:v6 forKey:@"localPoses"];

  v7 = [(VGSkeleton *)self modelPoses];
  [v4 encodeObject:v7 forKey:@"modelPoses"];

  id v11 = (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:self->_anon_40 length:64];
  [v4 encodeObject:v11 forKey:@"rootTransform"];
  v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&self[1] length:64];
  [v4 encodeObject:v8 forKey:@"floorAlignedRootTransform"];
  v9 = [(VGSkeleton *)self jointConfidence];
  [v4 encodeObject:v9 forKey:@"jointConfidence"];

  v10 = [(VGSkeleton *)self debugInfo];
  [v4 encodeObject:v10 forKey:@"debugInfo"];
}

- (VGSkeleton)initWithCoder:(id)a3
{
  v32[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)VGSkeleton;
  v5 = [(VGSkeleton *)&v29 init];
  if (v5)
  {
    -[VGSkeleton setSkeletonType:](v5, "setSkeletonType:", [v4 decodeIntForKey:@"skeletonType"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"skeletonDefinition"];
    [(VGSkeleton *)v5 setSkeletonDefinition:v6];

    v7 = (void *)MEMORY[0x263EFFA08];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    v9 = [v7 setWithArray:v8];
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"localPoses"];
    [(VGSkeleton *)v5 setLocalPoses:v10];

    id v11 = (void *)MEMORY[0x263EFFA08];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
    v13 = [v11 setWithArray:v12];
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"modelPoses"];
    [(VGSkeleton *)v5 setModelPoses:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rootTransform"];
    [v15 getBytes:v5->_anon_40 length:64];
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"floorAlignedRootTransform"];
    [v16 getBytes:&v5[1] length:64];
    v17 = (void *)MEMORY[0x263EFFA08];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    v19 = [v17 setWithArray:v18];
    v20 = [v4 decodeObjectOfClasses:v19 forKey:@"jointConfidence"];
    [(VGSkeleton *)v5 setJointConfidence:v20];

    v21 = (void *)MEMORY[0x263EFFA08];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v21, "setWithObjects:", v22, v23, v24, objc_opt_class(), 0);
    v26 = [v4 decodeObjectOfClasses:v25 forKey:@"debugInfo"];
    [(VGSkeleton *)v5 setDebugInfo:v26];

    v27 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (float32x4_t *)v4;
    if ([(VGSkeleton *)self skeletonType] == v5->i32[2])
    {
      v6 = [(VGSkeleton *)self skeletonDefinition];
      if ([v6 isEqual:v5[1].i64[0]])
      {
        v7 = [(VGSkeleton *)self localPoses];
        if ([v7 isEqual:v5[1].i64[1]])
        {
          v8 = [(VGSkeleton *)self modelPoses];
          if ([v8 isEqual:v5[2].i64[0]]
            && ([(VGSkeleton *)self rootTransform],
                (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v9, v5[4]), (int8x16_t)vceqq_f32(v10, v5[5])), vandq_s8((int8x16_t)vceqq_f32(v11, v5[6]), (int8x16_t)vceqq_f32(v12, v5[7])))) & 0x80000000) != 0)&& ([(VGSkeleton *)self floorAlignedRootTransform], (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v13, v5[8]), (int8x16_t)vceqq_f32(v14, v5[9])), vandq_s8((int8x16_t)vceqq_f32(v15, v5[10]), (int8x16_t)vceqq_f32(v16, v5[11])))) & 0x80000000) != 0))
          {
            v19 = [(VGSkeleton *)self jointConfidence];
            char v17 = [v19 isEqual:v5[2].i64[1]];
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (int)skeletonType
{
  return self->_skeletonType;
}

- (void)setSkeletonType:(int)a3
{
  self->_skeletonType = a3;
}

- (VGSkeletonDefinition)skeletonDefinition
{
  return self->_skeletonDefinition;
}

- (void)setSkeletonDefinition:(id)a3
{
}

- (NSArray)localPoses
{
  return self->_localPoses;
}

- (void)setLocalPoses:(id)a3
{
}

- (NSArray)modelPoses
{
  return self->_modelPoses;
}

- (void)setModelPoses:(id)a3
{
}

- (__n128)rootTransform
{
  return a1[4];
}

- (__n128)setRootTransform:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  result[7] = a5;
  return result;
}

- (__n128)floorAlignedRootTransform
{
  return a1[8];
}

- (__n128)setFloorAlignedRootTransform:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

- (NSArray)jointConfidence
{
  return self->_jointConfidence;
}

- (void)setJointConfidence:(id)a3
{
}

- (NSDictionary)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_jointConfidence, 0);
  objc_storeStrong((id *)&self->_modelPoses, 0);
  objc_storeStrong((id *)&self->_localPoses, 0);

  objc_storeStrong((id *)&self->_skeletonDefinition, 0);
}

@end