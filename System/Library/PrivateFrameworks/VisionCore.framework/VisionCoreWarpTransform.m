@interface VisionCoreWarpTransform
- (CGAffineTransform)affineTransform;
- (NSUUID)UUID;
- (VisionCoreWarpTransform)initWithWarpTransform:(__n128)a3 affineTransform:(__n128)a4 UUID:(float)a5 reprojectionError:(uint64_t)a6;
- (VisionCoreWarpTransform)initWithWarpTransform:(__n128)a3 affineTransform:(__n128)a4 UUID:(uint64_t)a5 reprojectionError:(long long *)a6 groupID:(void *)a7;
- (__n128)warpTransform;
- (float)reprojectionError;
- (int)groupID;
@end

@implementation VisionCoreWarpTransform

- (void).cxx_destruct
{
}

- (int)groupID
{
  return self->_groupID;
}

- (float)reprojectionError
{
  return self->_reprojectionError;
}

- (CGAffineTransform)affineTransform
{
  long long v3 = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].c;
  return self;
}

- (__n128)warpTransform
{
  return a1[2];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (VisionCoreWarpTransform)initWithWarpTransform:(__n128)a3 affineTransform:(__n128)a4 UUID:(uint64_t)a5 reprojectionError:(long long *)a6 groupID:(void *)a7
{
  id v11 = a7;
  v21.receiver = a1;
  v21.super_class = (Class)VisionCoreWarpTransform;
  v12 = [(VisionCoreWarpTransform *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v13;

    *(__n128 *)v12->_anon_20 = a2;
    *(__n128 *)&v12->_anon_20[16] = a3;
    *(__n128 *)&v12->_anon_20[32] = a4;
    long long v15 = *a6;
    long long v16 = a6[2];
    *(_OWORD *)&v12->_affineTransform.c = a6[1];
    *(_OWORD *)&v12->_affineTransform.tx = v16;
    *(_OWORD *)&v12->_affineTransform.a = v15;
    v12->_reprojectionError = 0.0;
    v12->_groupID = a8;
  }

  return v12;
}

- (VisionCoreWarpTransform)initWithWarpTransform:(__n128)a3 affineTransform:(__n128)a4 UUID:(float)a5 reprojectionError:(uint64_t)a6
{
  id v11 = a8;
  v21.receiver = a1;
  v21.super_class = (Class)VisionCoreWarpTransform;
  v12 = [(VisionCoreWarpTransform *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v13;

    *(__n128 *)v12->_anon_20 = a2;
    *(__n128 *)&v12->_anon_20[16] = a3;
    *(__n128 *)&v12->_anon_20[32] = a4;
    long long v15 = *a7;
    long long v16 = a7[2];
    *(_OWORD *)&v12->_affineTransform.c = a7[1];
    *(_OWORD *)&v12->_affineTransform.tx = v16;
    *(_OWORD *)&v12->_affineTransform.a = v15;
    v12->_reprojectionError = a5;
    v12->_groupID = 0;
  }

  return v12;
}

@end