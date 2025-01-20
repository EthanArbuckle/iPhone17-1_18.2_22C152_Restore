@interface NTKRawImage
+ (id)rawImageWithImage:(id)a3 width:(int)a4 height:(int)a5;
- (NTKRawImage)initWithContent:(NTKRawImage *)self width:(SEL)a2 height:;
- (const)contents;
- (id)scaleToWidth:(int)a3 height:(int)a4;
- (int)height;
- (int)width;
- (void)dealloc;
- (void)write:(id)a3;
@end

@implementation NTKRawImage

- (NTKRawImage)initWithContent:(NTKRawImage *)self width:(SEL)a2 height:
{
  int v5 = v4;
  int v6 = v3;
  v7 = v2;
  v12.receiver = self;
  v12.super_class = (Class)NTKRawImage;
  v8 = [(NTKRawImage *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_contents = v7;
    v8->_width = v6;
    v8->_height = v5;
    v10 = v8;
  }

  return v9;
}

- (void)dealloc
{
  free((void *)self->_contents);
  v3.receiver = self;
  v3.super_class = (Class)NTKRawImage;
  [(NTKRawImage *)&v3 dealloc];
}

+ (id)rawImageWithImage:(id)a3 width:(int)a4 height:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  unint64_t v8 = (unint64_t)[v7 CGImage];
  int Width = CGImageGetWidth((CGImageRef)v8);
  int Height = CGImageGetHeight((CGImageRef)v8);
  v11 = 0;
  if (v7 && Width >= 1 && Height >= 1)
  {
    v21 = malloc_type_malloc(16 * (int)v6 * (uint64_t)(int)v5, 0x1000040451B5BE8uLL);
    int v12 = v5 * v6;
    if ((int)v5 * (int)v6 < 1) {
      v13 = 0;
    }
    else {
      v13 = (char *)malloc_type_malloc(4 * (v5 * v6), 0x100004052888210uLL);
    }
    v14 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
    v15 = CGBitmapContextCreate(v13, (int)v6, (int)v5, 8uLL, (4 * v6), v14, 1u);
    bzero(v13, 4 * v12);
    v23.size.width = (double)(int)v6;
    v23.size.height = (double)(int)v5;
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    CGContextDrawImage(v15, v23, (CGImageRef)v8);
    if (v12 >= 1)
    {
      v16 = (unsigned int *)&v13[4 * v12];
      v17 = (unsigned int *)v13;
      v18 = v21;
      do
      {
        unint64_t v8 = v8 & 0xFFFFFFFF00000000 | *v17;
        CLKUIConvertToRGBfFromSRGB8_fast();
        *v18++ = v19;
        ++v17;
      }
      while (v17 < v16);
    }
    CGContextRelease(v15);
    CGColorSpaceRelease(v14);
    v11 = [[NTKRawImage alloc] initWithContent:v21 width:v6 height:v5];
    free(v13);
  }

  return v11;
}

- (id)scaleToWidth:(int)a3 height:(int)a4
{
  uint64_t height = self->_height;
  uint64_t width = self->_width;
  if (width == a3 && height == a4)
  {
    v15 = self;
  }
  else
  {
    uint64_t v9 = *(void *)&a3;
    v10 = (float32x4_t *)malloc_type_malloc(16 * a3 * (uint64_t)a4, 0x1000040451B5BE8uLL);
    float v11 = (float)(int)v9 / (float)(int)width;
    contents = self->_contents;
    float v13 = (float)a4 / (float)(int)height;
    if ((int)height * (int)v9 < 1) {
      v14 = 0;
    }
    else {
      v14 = (float32x4_t *)malloc_type_malloc(16 * (height * v9), 0x1000040451B5BE8uLL);
    }
    float v72 = 1.0 / v11;
    float v73 = 1.0 / v13;
    int v16 = (int)(float)((float)((float)(1.0 / v13) * 2.0) + 1.0);
    int v69 = (int)(float)((float)((float)(1.0 / v11) * 2.0) + 1.0);
    int v70 = v16;
    if (v69 > v16) {
      int v16 = (int)(float)((float)((float)(1.0 / v11) * 2.0) + 1.0);
    }
    if ((int)v9 <= a4) {
      int v17 = a4;
    }
    else {
      int v17 = v9;
    }
    int v18 = v16 * v17;
    if (v18 < 1)
    {
      v20 = 0;
      v21 = 0;
    }
    else
    {
      size_t v19 = 4 * v18;
      v20 = (float *)malloc_type_malloc(v19, 0x100004052888210uLL);
      v21 = (int *)malloc_type_malloc(v19, 0x100004052888210uLL);
    }
    v74 = v21;
    v75 = v20;
    uint64_t v76 = height;
    int v71 = a4;
    if (v17 < 1)
    {
      v22 = 0;
      CGRect v23 = 0;
    }
    else
    {
      v22 = malloc_type_malloc(4 * v17, 0x100004052888210uLL);
      CGRect v23 = malloc_type_malloc(4 * v17, 0x100004052888210uLL);
    }
    v68 = v10;
    if ((int)v9 >= 1)
    {
      uint64_t v24 = 0;
      do
      {
        v23[v24] = 0;
        v22[v24] = 0;
        float v25 = (float)(int)v24 / v11;
        int v26 = (int)(float)((float)(v25 + 0.5) - v72);
        int v27 = (int)(float)((float)v26 + (float)(v72 * 2.0));
        float v28 = 0.0;
        if (v26 <= v27)
        {
          int v29 = 0;
          int v30 = v27 + 1;
          do
          {
            if ((v26 & 0x80000000) == 0 && v26 < (int)width)
            {
              float v31 = v11 * (float)(v25 - (float)v26);
              if (v31 > -1.0 && v31 < 1.0)
              {
                float v33 = (float)(cosf(v31 * 3.1416) + 1.0) * 0.5;
                if (v33 > 0.0)
                {
                  v74[v24 * v69 + v29] = v26;
                  v75[v24 * v69 + v29] = v33;
                  float v28 = v33 + *(float *)&v22[v24];
                  *(float *)&v22[v24] = v28;
                  int v29 = v23[v24] + 1;
                  v23[v24] = v29;
                }
              }
            }
            ++v26;
          }
          while (v30 != v26);
        }
        *(float *)&v22[v24++] = 1.0 / v28;
      }
      while (v24 != v9);
    }
    if ((int)v76 >= 1)
    {
      uint64_t v34 = 0;
      uint64_t v35 = 4 * v69;
      do
      {
        if ((int)v9 >= 1)
        {
          uint64_t v36 = 0;
          v37 = v74;
          v38 = v75;
          do
          {
            uint64_t v39 = v23[v36];
            float32x4_t v40 = 0uLL;
            if ((int)v39 >= 1)
            {
              v41 = v37;
              v42 = v38;
              do
              {
                uint64_t v43 = *v41++;
                float32x4_t v44 = *(float32x4_t *)&contents[4 * v34 * width + 4 * v43];
                *(float *)&uint64_t v43 = *v42++;
                float32x4_t v40 = vmlaq_n_f32(v40, v44, *(float *)&v43);
                --v39;
              }
              while (v39);
            }
            v14[v36 + v34 * (int)v9] = vmulq_n_f32(v40, *(float *)&v22[v36]);
            ++v36;
            v38 = (float *)((char *)v38 + v35);
            v37 = (int *)((char *)v37 + v35);
          }
          while (v36 != v9);
        }
        ++v34;
      }
      while (v34 != v76);
    }
    if (v71 >= 1)
    {
      for (uint64_t i = 0; i != v71; *(float *)&v22[i++] = 1.0 / v49)
      {
        v23[i] = 0;
        v22[i] = 0;
        float v46 = (float)(int)i / v13;
        int v47 = (int)(float)((float)(v46 + 0.5) - v73);
        int v48 = (int)(float)((float)v47 + (float)(v73 * 2.0));
        float v49 = 0.0;
        if (v47 <= v48)
        {
          int v50 = 0;
          int v51 = v48 + 1;
          do
          {
            if ((v47 & 0x80000000) == 0 && v47 < (int)v76)
            {
              float v52 = v13 * (float)(v46 - (float)v47);
              if (v52 > -1.0 && v52 < 1.0)
              {
                float v54 = (float)(cosf(v52 * 3.1416) + 1.0) * 0.5;
                if (v54 > 0.0)
                {
                  v74[i * v70 + v50] = v47;
                  v75[i * v70 + v50] = v54;
                  float v49 = v54 + *(float *)&v22[i];
                  *(float *)&v22[i] = v49;
                  int v50 = v23[i] + 1;
                  v23[i] = v50;
                }
              }
            }
            ++v47;
          }
          while (v51 != v47);
        }
      }
    }
    if ((int)v9 >= 1)
    {
      uint64_t v55 = 0;
      uint64_t v56 = 4 * v70;
      do
      {
        if (v71 >= 1)
        {
          uint64_t v57 = 0;
          v58 = v74;
          v59 = v75;
          do
          {
            uint64_t v60 = v23[v57];
            float32x4_t v61 = 0uLL;
            if ((int)v60 >= 1)
            {
              v62 = v58;
              v63 = v59;
              do
              {
                int v64 = *v62++;
                float32x4_t v65 = v14[v55 + v64 * (uint64_t)(int)v9];
                float v66 = *v63++;
                float32x4_t v61 = vmlaq_n_f32(v61, v65, v66);
                --v60;
              }
              while (v60);
            }
            v68[v55 + v57 * (int)v9] = vmulq_n_f32(v61, *(float *)&v22[v57]);
            ++v57;
            v59 = (float *)((char *)v59 + v56);
            v58 = (int *)((char *)v58 + v56);
          }
          while (v57 != v71);
        }
        ++v55;
      }
      while (v55 != v9);
    }
    v15 = [[NTKRawImage alloc] initWithContent:v68 width:v9 height:v71];
    free(v23);
    free(v22);
    free(v74);
    free(v75);
    free(v14);
  }
  return v15;
}

- (void)write:(id)a3
{
  id v4 = a3;
  int width = self->_width;
  int height = self->_height;
  int v12 = height * width;
  int v13 = height * width;
  id v10 = v4;
  if (height * width <= 0)
  {
    uint64_t v9 = v4;
    id v7 = 0;
    float v11 = 0;
  }
  else
  {
    id v7 = malloc_type_malloc(4 * (height * width), 0x100004052888210uLL);
    int width = self->_width;
    int height = self->_height;
    float v11 = v7;
    if (height * width >= 1)
    {
      uint64_t v8 = 0;
      do
      {
        *((_DWORD *)v7 + v8++) = CLKUIConvertToSRGB8FromRGBf_fast();
        int width = self->_width;
        int height = self->_height;
      }
      while (v8 < height * width);
    }
    uint64_t v9 = v10;
  }
  _NTKRawWriteToFile(&v11, width, height, v9);
  free(v7);
}

- (const)contents
{
  return self->_contents;
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

@end