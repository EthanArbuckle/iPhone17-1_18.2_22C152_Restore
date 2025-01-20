@interface OpenCVWrapperImage
- (CGSize)getSize;
- (Mat)image;
- (OpenCVWrapperImage)initWithImage:(Mat *)a3;
- (OpenCVWrapperImage)initWithSizeOf:(id)a3 pixelFormat:(int64_t)a4;
- (OpenCVWrapperImage)initWithUIImage:(id)a3;
- (OpenCVWrapperImage)initWithWidth:(int)a3 height:(int)a4 pixelFormat:(int64_t)a5 pixelData:(void *)a6 bytesPerRow:(unint64_t)a7 scaleFactor:(float)a8;
- (OpenCVWrapperResourceLock)resourceLock;
- (const)getPixelData;
- (id).cxx_construct;
- (id)clone;
- (void)convertTo8U;
- (void)imWrite:(id)a3;
- (void)setResourceLock:(id)a3;
@end

@implementation OpenCVWrapperImage

- (OpenCVWrapperImage)initWithImage:(Mat *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)OpenCVWrapperImage;
  v4 = [(OpenCVWrapperImage *)&v17 init];
  v5 = v4;
  p_image = &v4->_image;
  if (v4) {
    BOOL v7 = p_image == a3;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    u = a3->u;
    if (u) {
      atomic_fetch_add((atomic_uint *volatile)u + 5, 1u);
    }
    v9 = v4->_image.u;
    if (v9 && atomic_fetch_add((atomic_uint *volatile)v9 + 5, 0xFFFFFFFF) == 1) {
      sub_1002932F4((uint64_t)&v4->_image);
    }
    v5->_image.u = 0;
    *(_OWORD *)&v5->_image.data = 0u;
    *(_OWORD *)&v5->_image.dataend = 0u;
    if (v5->_image.dims <= 0)
    {
      p_image->flags = a3->flags;
    }
    else
    {
      uint64_t v10 = 0;
      p = v5->_image.size.p;
      do
      {
        p[v10++] = 0;
        uint64_t dims = v5->_image.dims;
      }
      while (v10 < dims);
      p_image->flags = a3->flags;
      if ((int)dims > 2) {
        goto LABEL_18;
      }
    }
    int v13 = a3->dims;
    if (v13 <= 2)
    {
      v5->_image.uint64_t dims = v13;
      *(void *)&v5->_image.rows = *(void *)&a3->rows;
      v14 = a3->step.p;
      v15 = v5->_image.step.p;
      unint64_t *v15 = *v14;
      v15[1] = v14[1];
LABEL_19:
      *(_OWORD *)&v5->_image.data = *(_OWORD *)&a3->data;
      *(_OWORD *)&v5->_image.dataend = *(_OWORD *)&a3->dataend;
      *(_OWORD *)&v5->_image.allocator = *(_OWORD *)&a3->allocator;
      return v5;
    }
LABEL_18:
    sub_1002931A8((uint64_t)p_image, (uint64_t)a3);
    goto LABEL_19;
  }
  return v5;
}

- (OpenCVWrapperImage)initWithWidth:(int)a3 height:(int)a4 pixelFormat:(int64_t)a5 pixelData:(void *)a6 bytesPerRow:(unint64_t)a7 scaleFactor:(float)a8
{
  unsigned int v14 = sub_10000B188(a5);
  sub_10000CE64((uint64_t)v27, a4, a3, v14, (uint64_t)a6, a7);
  if (a8 != 1.0)
  {
    uint64_t v26 = 0;
    int v24 = 16842752;
    v25 = v27;
    int v21 = 33619968;
    v22 = v27;
    uint64_t v23 = 0;
    uint64_t v20 = 0;
    if (a8 >= 1.0) {
      int v15 = 1;
    }
    else {
      int v15 = 3;
    }
    sub_1003661B4((uint64_t)&v24, (uint64_t)&v21, (int *)&v20, v15, a8, a8);
  }
  v16 = [(OpenCVWrapperImage *)self initWithImage:v27];
  if (v31 && atomic_fetch_add((atomic_uint *volatile)(v31 + 20), 0xFFFFFFFF) == 1) {
    sub_1002932F4((uint64_t)v27);
  }
  uint64_t v31 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  if (v28 >= 1)
  {
    uint64_t v17 = 0;
    uint64_t v18 = v32;
    do
      *(_DWORD *)(v18 + 4 * v17++) = 0;
    while (v17 < v28);
  }
  if (v33 != &v34) {
    j__free(v33);
  }

  return v16;
}

- (OpenCVWrapperImage)initWithUIImage:(id)a3
{
  id v4 = a3;
  LODWORD(v9[0]) = 1124007936;
  memset((char *)v9 + 4, 0, 48);
  v9[3] = 0u;
  uint64_t v10 = (char *)v9 + 8;
  v11 = v12;
  v12[0] = 0;
  v12[1] = 0;
  sub_1002EB2DC(v4, (uint64_t)v9, 0);
  v5 = [(OpenCVWrapperImage *)self initWithImage:v9];
  if (*((void *)&v9[3] + 1)
    && atomic_fetch_add((atomic_uint *volatile)(*((void *)&v9[3] + 1) + 20), 0xFFFFFFFF) == 1)
  {
    sub_1002932F4((uint64_t)v9);
  }
  *((void *)&v9[3] + 1) = 0;
  memset(&v9[1], 0, 32);
  if (SDWORD1(v9[0]) >= 1)
  {
    uint64_t v6 = 0;
    BOOL v7 = v10;
    do
      *(_DWORD *)&v7[4 * v6++] = 0;
    while (v6 < SDWORD1(v9[0]));
  }
  if (v11 != v12) {
    j__free(v11);
  }

  return v5;
}

- (OpenCVWrapperImage)initWithSizeOf:(id)a3 pixelFormat:(int64_t)a4
{
  id v6 = a3;
  int32x2_t v16 = vrev64_s32(**((int32x2_t **)[v6 image] + 8));
  unsigned int v7 = sub_10000B188(a4);
  sub_100290470((uint64_t *)&v16, v7, (uint64_t)v17);
  LODWORD(v12[0]) = 1124007936;
  memset((char *)v12 + 4, 0, 32);
  memset((char *)&v12[4] + 4, 0, 28);
  int v13 = &v12[1];
  unsigned int v14 = v15;
  v15[0] = 0;
  v15[1] = 0;
  (*(void (**)(void, void *, void *, uint64_t))(*(void *)v17[0] + 24))(v17[0], v17, v12, 0xFFFFFFFFLL);
  v8 = [(OpenCVWrapperImage *)self initWithImage:v12];
  if (v12[7] && atomic_fetch_add((atomic_uint *volatile)(v12[7] + 20), 0xFFFFFFFF) == 1) {
    sub_1002932F4((uint64_t)v12);
  }
  v12[7] = 0;
  memset(&v12[2], 0, 32);
  if (SHIDWORD(v12[0]) >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = v13;
    do
      *((_DWORD *)v10 + v9++) = 0;
    while (v9 < SHIDWORD(v12[0]));
  }
  if (v14 != v15) {
    j__free(v14);
  }
  sub_10000B6BC((uint64_t)v17);

  return v8;
}

- (const)getPixelData
{
  return self->_image.data;
}

- (id)clone
{
  LODWORD(v6[0]) = 1124007936;
  memset((char *)v6 + 4, 0, 48);
  v6[3] = 0u;
  unsigned int v7 = (char *)v6 + 8;
  v8 = v9;
  v9[0] = 0;
  v9[1] = 0;
  int v10 = 33619968;
  v11 = v6;
  uint64_t v12 = 0;
  sub_10025401C((uint64_t)&self->_image, (uint64_t)&v10);
  v2 = [[OpenCVWrapperImage alloc] initWithImage:v6];
  if (*((void *)&v6[3] + 1)
    && atomic_fetch_add((atomic_uint *volatile)(*((void *)&v6[3] + 1) + 20), 0xFFFFFFFF) == 1)
  {
    sub_1002932F4((uint64_t)v6);
  }
  *((void *)&v6[3] + 1) = 0;
  memset(&v6[1], 0, 32);
  if (SDWORD1(v6[0]) >= 1)
  {
    uint64_t v3 = 0;
    id v4 = v7;
    do
      *(_DWORD *)&v4[4 * v3++] = 0;
    while (v3 < SDWORD1(v6[0]));
  }
  if (v8 != v9) {
    j__free(v8);
  }

  return v2;
}

- (void)imWrite:(id)a3
{
  id v4 = a3;
  v5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  id v6 = [v5 objectAtIndex:0];
  LODWORD(v17[0]) = 1124007936;
  memset((char *)v17 + 4, 0, 48);
  v17[3] = 0u;
  uint64_t v18 = (char *)v17 + 8;
  v19 = v20;
  v20[0] = 0;
  v20[1] = 0;
  self = (OpenCVWrapperImage *)((char *)self + 16);
  int v15 = self;
  uint64_t v16 = 0;
  int v14 = 16842752;
  LODWORD(__p) = 50397184;
  uint64_t v12 = self;
  uint64_t v13 = 0;
  unsigned int v7 = sub_1002A02C4();
  sub_100240700((uint64_t)&v14, (int *)&__p, 32, 5, (uint64_t)v7, 0.0, 255.0);
  int v14 = 33619968;
  int v15 = self;
  uint64_t v16 = 0;
  sub_10024011C((unsigned int *)self, (uint64_t)&v14, 0, 1.0, 0.0);
  v10[0] = 0;
  v10[1] = 0;
  qmemcpy((void *)sub_1002D19D8(v10, 44), "/var/mobile/Library/Measure/image_scaled.png", 44);
  int v15 = self;
  uint64_t v16 = 0;
  int v14 = 16842752;
  __p = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  sub_1002EB4AC((uint64_t)v10, (uint64_t)&v14, &__p);
  if (__p)
  {
    uint64_t v12 = __p;
    operator delete(__p);
  }
  sub_1002D1A1C(v10);
  if (*((void *)&v17[3] + 1)
    && atomic_fetch_add((atomic_uint *volatile)(*((void *)&v17[3] + 1) + 20), 0xFFFFFFFF) == 1)
  {
    sub_1002932F4((uint64_t)v17);
  }
  *((void *)&v17[3] + 1) = 0;
  memset(&v17[1], 0, 32);
  if (SDWORD1(v17[0]) >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v18;
    do
      *(_DWORD *)&v9[4 * v8++] = 0;
    while (v8 < SDWORD1(v17[0]));
  }
  if (v19 != v20) {
    j__free(v19);
  }
}

- (void)convertTo8U
{
  p_image = &self->_image;
  uint64_t v8 = &self->_image;
  uint64_t v9 = 0;
  int v7 = 16842752;
  int v4 = 50397184;
  v5 = &self->_image;
  uint64_t v6 = 0;
  uint64_t v3 = sub_1002A02C4();
  sub_100240700((uint64_t)&v7, &v4, 32, 5, (uint64_t)v3, 0.0, 255.0);
  int v7 = 33619968;
  uint64_t v8 = p_image;
  uint64_t v9 = 0;
  sub_10024011C((unsigned int *)p_image, (uint64_t)&v7, 0, 1.0, 0.0);
}

- (CGSize)getSize
{
  double cols = (double)self->_image.cols;
  double rows = (double)self->_image.rows;
  result.height = rows;
  result.width = cols;
  return result;
}

- (OpenCVWrapperResourceLock)resourceLock
{
  return self->_resourceLock;
}

- (void)setResourceLock:(id)a3
{
}

- (Mat)image
{
  return &self->_image;
}

- (void).cxx_destruct
{
  u = self->_image.u;
  if (u && atomic_fetch_add((atomic_uint *volatile)u + 5, 0xFFFFFFFF) == 1) {
    sub_1002932F4((uint64_t)&self->_image);
  }
  self->_image.u = 0;
  *(_OWORD *)&self->_image.data = 0u;
  *(_OWORD *)&self->_image.dataend = 0u;
  if (self->_image.dims >= 1)
  {
    uint64_t v4 = 0;
    p = self->_image.size.p;
    do
      p[v4++] = 0;
    while (v4 < self->_image.dims);
  }
  uint64_t v6 = (OpenCVWrapperImage *)self->_image.step.p;
  if (v6 != (OpenCVWrapperImage *)self->_image.step.buf) {
    j__free(v6);
  }

  objc_storeStrong((id *)&self->_resourceLock, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 1124007936;
  *(_OWORD *)((char *)self + 20) = 0u;
  *(_OWORD *)((char *)self + 36) = 0u;
  *(_OWORD *)((char *)self + 52) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((void *)self + 12) = 0;
  *((void *)self + 10) = (char *)self + 24;
  *((void *)self + 11) = (char *)self + 96;
  *((void *)self + 13) = 0;
  return self;
}

@end