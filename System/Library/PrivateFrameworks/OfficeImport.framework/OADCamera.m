@interface OADCamera
- (BOOL)isEqual:(id)a3;
- (OADCamera)init;
- (float)fieldOfView;
- (float)zoom;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)rotation;
- (int)cameraType;
- (unint64_t)hash;
- (void)setCameraType:(int)a3;
- (void)setFieldOfView:(float)a3;
- (void)setRotation:(id)a3;
- (void)setZoom:(float)a3;
@end

@implementation OADCamera

- (OADCamera)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADCamera;
  v2 = [(OADCamera *)&v6 init];
  v3 = v2;
  if (v2)
  {
    mRotation = v2->mRotation;
    v2->mRotation = 0;

    v3->mCameraType = 0;
    *(void *)&v3->mFieldOfView = 0x3F80000000000000;
  }
  return v3;
}

- (void)setRotation:(id)a3
{
}

- (void)setCameraType:(int)a3
{
  self->mCameraType = a3;
}

- (void)setFieldOfView:(float)a3
{
  self->mFieldOfView = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(OADRotation3D *)self->mRotation copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(_DWORD *)(v5 + 16) = self->mCameraType;
  *(float *)(v5 + 20) = self->mFieldOfView;
  *(float *)(v5 + 24) = self->mZoom;
  return (id)v5;
}

- (id)rotation
{
  return self->mRotation;
}

- (int)cameraType
{
  return self->mCameraType;
}

- (float)fieldOfView
{
  return self->mFieldOfView;
}

- (float)zoom
{
  return self->mZoom;
}

- (void)setZoom:(float)a3
{
  self->mZoom = a3;
}

- (unint64_t)hash
{
  return [(OADRotation3D *)self->mRotation hash] ^ self->mCameraType ^ (unint64_t)self->mFieldOfView ^ (unint64_t)self->mZoom;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v5 = v4) != 0)
  {
    id v6 = v5;
    mRotation = self->mRotation;
    v8 = [v5 rotation];
    if ([(OADRotation3D *)mRotation isEqual:v8]
      && (int mCameraType = self->mCameraType, mCameraType == [v6 cameraType])
      && (float mFieldOfView = self->mFieldOfView, [v6 fieldOfView], mFieldOfView == v11))
    {
      float mZoom = self->mZoom;
      [v6 zoom];
      BOOL v14 = mZoom == v13;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADCamera;
  v2 = [(OADCamera *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end