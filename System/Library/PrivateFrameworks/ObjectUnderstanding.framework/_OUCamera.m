@interface _OUCamera
- (CGSize)imageResolution;
- (_OUCamera)initWithDictionary:(id)a3;
- (__n128)initWithIntrinsic:(__n128)a3 transform:(__n128)a4;
- (__n128)intrinsics;
- (__n128)pose;
- (__n128)setIntrinsics:(__n128)a3;
- (__n128)setPose:(__n128)a3;
- (__n128)setTransform:(__n128)a3;
- (__n128)transform;
- (void)setImageResolution:(CGSize)a3;
@end

@implementation _OUCamera

- (_OUCamera)initWithDictionary:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_OUCamera;
  v5 = [(_OUCamera *)&v34 init];
  if (!v5) {
    goto LABEL_24;
  }
  id v6 = [v4 objectForKeyedSubscript:@"intrinsic"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (!v7) {
    goto LABEL_18;
  }
  id v8 = v7;
  if ([v8 count] != 3)
  {

LABEL_17:
    goto LABEL_18;
  }
  v9 = [v8 objectAtIndexedSubscript:0];
  v10 = [v8 objectAtIndexedSubscript:1];
  v11 = [v8 objectAtIndexedSubscript:2];
  for (uint64_t i = 0; i != 3; ++i)
  {
    v13 = [v9 objectAtIndexedSubscript:i];
    [v13 floatValue];
    *(void *)&long long v33 = v14;
    v15 = [v10 objectAtIndexedSubscript:i];
    [v15 floatValue];
    int v32 = v16;
    v17 = [v11 objectAtIndexedSubscript:i];
    [v17 floatValue];
    long long v18 = v33;
    DWORD1(v18) = v32;
    DWORD2(v18) = v19;
    *(_OWORD *)&v5[16 * i + 32] = v18;
  }
  id v20 = [v4 objectForKeyedSubscript:@"image_resolution"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v20;
  }
  else {
    id v8 = 0;
  }

  if (!v8 || [v8 count] != 2) {
    goto LABEL_17;
  }
  v21 = [v8 objectAtIndexedSubscript:0];
  [v21 floatValue];
  *((double *)v5 + 1) = v22;

  v23 = [v8 objectAtIndexedSubscript:1];
  [v23 floatValue];
  *((double *)v5 + 2) = v24;

  id v25 = [v4 objectForKeyedSubscript:@"pose"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v26 = (NSArray *)v25;
  }
  else {
    v26 = 0;
  }

  if (v26)
  {
    BOOL v28 = float4x4FromNSArray(v26, (simd_float4x4 *)(v5 + 144));

    if (v28)
    {
      v29 = [v4 objectForKeyedSubscript:@"transform"];
      objc_cast<NSArray>(v29);
      v27 = (NSArray *)objc_claimAutoreleasedReturnValue();

      if (!v27) {
        goto LABEL_25;
      }
      BOOL v30 = float4x4FromNSArray(v27, (simd_float4x4 *)(v5 + 80));

      if (v30)
      {
LABEL_24:
        v27 = v5;
        goto LABEL_25;
      }
    }
  }
LABEL_18:
  v27 = 0;
LABEL_25:

  return (_OUCamera *)v27;
}

- (__n128)transform
{
  return a1[5];
}

- (__n128)setTransform:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  return result;
}

- (__n128)intrinsics
{
  return a1[2];
}

- (__n128)setIntrinsics:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  return result;
}

- (CGSize)imageResolution
{
  double width = self->_imageResolution.width;
  double height = self->_imageResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageResolution:(CGSize)a3
{
  self->_imageResolution = a3;
}

- (__n128)pose
{
  return a1[9];
}

- (__n128)setPose:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (__n128)initWithIntrinsic:(__n128)a3 transform:(__n128)a4
{
  v17.receiver = a1;
  v17.super_class = (Class)_OUCamera;
  id v8 = [(_OUCamera *)&v17 init];
  if (v8)
  {
    *(__n128 *)v8->_anon_20 = a2;
    *(__n128 *)&v8->_anon_20[16] = a3;
    *(__n128 *)&v8->_anon_20[32] = a4;
    *(__n128 *)v8->_anon_50 = a5;
    *(__n128 *)&v8->_anon_50[16] = a6;
    *(__n128 *)&v8->_anon_50[32] = a7;
    __n128 result = a8;
    *(__n128 *)&v8->_anon_50[48] = a8;
  }
  return result;
}

@end