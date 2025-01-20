@interface PXGFloatValuesColorLookupCube
+ (BOOL)_parseLUTData:(id)a3 resultHandler:(id)a4 errorHandler:(id)a5;
- (BOOL)blendWithCube:(id)a3 factor:(float)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldCache;
- (NSString)identifier;
- (PXGFloatValuesColorLookupCube)init;
- (PXGFloatValuesColorLookupCube)initWithContentsOfURL:(id)a3 format:(int64_t)a4 error:(id *)a5;
- (PXGFloatValuesColorLookupCube)initWithContentsOfURL:(id)a3 usedFormat:(int64_t *)a4 error:(id *)a5;
- (PXGFloatValuesColorLookupCube)initWithData:(id)a3 format:(int64_t)a4 error:(id *)a5;
- (PXGFloatValuesColorLookupCube)initWithEdgeSize:(int64_t)a3 colorValuesData:(const float *)a4 length:(unint64_t)a5 identifier:(id)a6;
- (double)center;
- (float)colorValuesData;
- (id)createTextureWithContext:(id)a3;
- (id)textureData;
- (unint64_t)hash;
- (unint64_t)length;
- (void)dealloc;
- (void)smoothWithFactor:(float)a3;
@end

@implementation PXGFloatValuesColorLookupCube

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)length
{
  return self->_length;
}

- (float)colorValuesData
{
  return self->_colorValuesData;
}

- (id)createTextureWithContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXGColorLookupCube *)self edgeSize];
  v6 = [(PXGFloatValuesColorLookupCube *)self textureData];
  id v7 = objc_alloc_init(MEMORY[0x263F12A50]);
  [v7 setTextureType:7];
  [v7 setWidth:v5];
  [v7 setHeight:v5];
  [v7 setDepth:v5];
  [v7 setPixelFormat:70];
  [v7 setUsage:1];
  [v7 setResourceOptions:0];
  v8 = (void *)[v4 newTextureWithDescriptor:v7];
  memset(v11, 0, 24);
  id v9 = v6;
  v11[3] = v5;
  v11[4] = v5;
  v11[5] = v5;
  objc_msgSend(v4, "copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:", objc_msgSend(v9, "bytes", 0, 0, 0), v8, v11, objc_msgSend(v9, "length"), 4 * v5, 4 * v5 * v5);

  return v8;
}

- (id)textureData
{
  int64_t v3 = [(PXGColorLookupCube *)self edgeSize];
  id v4 = [(PXGFloatValuesColorLookupCube *)self colorValuesData];
  uint64_t v5 = 4 * v3 * v3 * v3;
  id v6 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v5];
  for (i = (unsigned char *)[v6 mutableBytes]; v5; --v5)
  {
    float v8 = *v4++;
    float v9 = 255.0;
    float v10 = (float)(v8 * 255.0) + 0.5;
    if (v10 < 255.0) {
      float v9 = v10;
    }
    int v11 = (int)v9;
    if (v10 < 0.0) {
      LOBYTE(v11) = 0;
    }
    *i++ = v11;
  }

  return v6;
}

- (double)center
{
  int v2 = [a1 edgeSize];
  uint64_t v3 = [a1 colorValuesData];
  uint64_t v4 = 0;
  if (v2 >= 0) {
    int v5 = v2;
  }
  else {
    int v5 = v2 + 1;
  }
  uint64_t v6 = (uint64_t)v5 >> 1;
  float32x4_t v7 = 0uLL;
  char v8 = 1;
  do
  {
    uint64_t v9 = 0;
    char v10 = v8;
    uint64_t v11 = v3 + 16 * (v2 * v2) * (v4 + v6);
    char v12 = 1;
    do
    {
      char v13 = v12;
      uint64_t v14 = v11 + 16 * (v9 + v6) * v2;
      float32x4_t v7 = vaddq_f32(vaddq_f32(v7, *(float32x4_t *)(v14 + 16 * v6)), *(float32x4_t *)(v14 + 16 * (v6 + 1)));
      uint64_t v9 = 1;
      char v12 = 0;
    }
    while ((v13 & 1) != 0);
    char v8 = 0;
    uint64_t v4 = 1;
  }
  while ((v10 & 1) != 0);
  v15.i64[0] = 0x3E0000003E000000;
  v15.i64[1] = 0x3E0000003E000000;
  *(void *)&double result = vmulq_f32(v7, v15).u64[0];
  return result;
}

- (BOOL)blendWithCube:(id)a3 factor:(float)a4
{
  int32x2_t v22 = *(int32x2_t *)&a4;
  id v5 = a3;
  int v6 = [(PXGColorLookupCube *)self edgeSize];
  uint64_t v7 = [v5 edgeSize];
  if (v7 == v6)
  {
    char v8 = [(PXGFloatValuesColorLookupCube *)self colorValuesData];
    uint64_t v9 = [v5 colorValuesData];
    if (v6 >= 1)
    {
      unsigned int v10 = 0;
      uint64_t v11 = 0;
      float32x4_t v12 = (float32x4_t)vdupq_lane_s32(v22, 0);
      uint64_t v13 = 16 * v7;
      do
      {
        uint64_t v14 = 0;
        float32x4_t v15 = (float32x4_t *)(v9 + 16 * v10);
        v16 = (float32x4_t *)&v8[4 * v10];
        do
        {
          v17 = v16;
          v18 = v15;
          uint64_t v19 = v6;
          do
          {
            float32x4_t v20 = *v18++;
            float32x4_t *v17 = vmlaq_f32(*v17, vsubq_f32(v20, *v17), v12);
            ++v17;
            --v19;
          }
          while (v19);
          ++v14;
          float32x4_t v15 = (float32x4_t *)((char *)v15 + v13);
          v16 = (float32x4_t *)((char *)v16 + v13);
        }
        while (v14 != v6);
        ++v11;
        v10 += v6 * v6;
      }
      while (v11 != v6);
    }
  }

  return v7 == v6;
}

- (void)smoothWithFactor:(float)a3
{
  int v5 = [(PXGColorLookupCube *)self edgeSize];
  int v6 = [(PXGFloatValuesColorLookupCube *)self colorValuesData];
  int v7 = v5 - 1;
  if (v5 >= 1)
  {
    int v8 = 0;
    uint64_t v9 = 0;
    double v10 = a3 * 2.0 + 1.0;
    *(float *)&double v10 = a3 / v10;
    float v11 = *(float *)&v10 * -2.0 + 1.0;
    int v12 = v5 * v5;
    float32x4_t v13 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v10, 0);
    do
    {
      uint64_t v14 = 0;
      float32x4_t v15 = &v6[4 * v8];
      do
      {
        uint64_t v16 = 0;
        v17 = (float32x4_t *)&v6[4 * (v12 * v9) + 4 * v14 * v5];
        float32x4_t v18 = *v17;
        float32x4_t v19 = *v17;
        do
        {
          uint64_t v20 = v16 + 1;
          if ((int)v16 + 1 >= v7) {
            int v21 = v5 - 1;
          }
          else {
            int v21 = v16 + 1;
          }
          float32x4_t v22 = vmlaq_f32(vmulq_n_f32(v19, v11), v18, v13);
          float32x4_t v18 = v19;
          float32x4_t v19 = v17[v21];
          *(float32x4_t *)&v15[4 * v16++] = vmlaq_f32(v22, v19, v13);
        }
        while (v5 != v20);
        ++v14;
        v15 += 4 * v5;
      }
      while (v14 != v5);
      ++v9;
      v8 += v12;
    }
    while (v9 != v5);
    int v23 = 0;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v25 = 0;
      v26 = (float32x4_t *)&v6[4 * v23];
      do
      {
        uint64_t v27 = 0;
        v28 = (float32x4_t *)&v6[4 * (v12 * i) + 4 * v25];
        float32x4_t v29 = *v28;
        v30 = v26;
        float32x4_t v31 = *v28;
        do
        {
          if ((int)++v27 >= v7) {
            int v32 = v5 - 1;
          }
          else {
            int v32 = v27;
          }
          float32x4_t v33 = vmlaq_f32(vmulq_n_f32(v29, v11), v31, v13);
          float32x4_t v31 = v29;
          float32x4_t v29 = v28[v32 * v5];
          float32x4_t *v30 = vmlaq_f32(v33, v29, v13);
          v30 += v5;
        }
        while (v5 != v27);
        ++v25;
        ++v26;
      }
      while (v25 != v5);
      v23 += v5 * v5;
    }
    uint64_t v34 = 0;
    int v35 = v5 * v5;
    do
    {
      for (uint64_t j = 0; j != v5; ++j)
      {
        int v37 = 0;
        uint64_t v38 = 0;
        v39 = (float32x4_t *)&v6[4 * v34 * v5 + 4 * j];
        float32x4_t v40 = *v39;
        float32x4_t v41 = *v39;
        do
        {
          float32x4_t v42 = v40;
          if ((int)++v38 >= v7) {
            int v43 = v5 - 1;
          }
          else {
            int v43 = v38;
          }
          float32x4_t v44 = vmulq_n_f32(v40, v11);
          float32x4_t v40 = v39[v35 * v43];
          float32x4_t v45 = vmlaq_f32(v44, v41, v13);
          float32x4_t v41 = v42;
          v39[v37] = vmlaq_f32(v45, v40, v13);
          v37 += v35;
        }
        while (v5 != v38);
      }
      ++v34;
    }
    while (v34 != v5);
  }
}

- (BOOL)shouldCache
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 edgeSize];
    if (v6 == [(PXGColorLookupCube *)self edgeSize]
      && (uint64_t v7 = [v5 length], v7 == -[PXGFloatValuesColorLookupCube length](self, "length")))
    {
      int v8 = [v5 identifier];
      uint64_t v9 = [(PXGFloatValuesColorLookupCube *)self identifier];
      if (v8 == v9) {
        char v10 = 1;
      }
      else {
        char v10 = [v8 isEqualToString:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_length ^ [(PXGColorLookupCube *)self edgeSize];
  return v3 ^ [(NSString *)self->_identifier hash];
}

- (void)dealloc
{
  free(self->_colorValuesData);
  v3.receiver = self;
  v3.super_class = (Class)PXGFloatValuesColorLookupCube;
  [(PXGFloatValuesColorLookupCube *)&v3 dealloc];
}

- (PXGFloatValuesColorLookupCube)initWithContentsOfURL:(id)a3 usedFormat:(int64_t *)a4 error:(id *)a5
{
  double result = [(PXGFloatValuesColorLookupCube *)self initWithContentsOfURL:a3 format:1 error:a5];
  if (a4) {
    *a4 = 1;
  }
  return result;
}

- (PXGFloatValuesColorLookupCube)initWithContentsOfURL:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  int v8 = (objc_class *)MEMORY[0x263EFF8F8];
  id v9 = a3;
  char v10 = (void *)[[v8 alloc] initWithContentsOfURL:v9 options:1 error:a5];

  if (v10)
  {
    float v11 = [(PXGFloatValuesColorLookupCube *)self initWithData:v10 format:a4 error:a5];
  }
  else
  {

    float v11 = 0;
  }

  return v11;
}

- (PXGFloatValuesColorLookupCube)initWithData:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  float32x4_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  int v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_7;
    }
    v16.receiver = self;
    v16.super_class = (Class)PXGFloatValuesColorLookupCube;
    id v9 = [(PXGFloatValuesColorLookupCube *)&v16 init];
    char v10 = objc_opt_class();
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__PXGFloatValuesColorLookupCube_initWithData_format_error___block_invoke;
    v14[3] = &unk_265556368;
    a4 = v9;
    float32x4_t v15 = (PXGFloatValuesColorLookupCube *)a4;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__PXGFloatValuesColorLookupCube_initWithData_format_error___block_invoke_2;
    v13[3] = &unk_265556390;
    v13[4] = &v17;
    if (([v10 _parseLUTData:v8 resultHandler:v14 errorHandler:v13] & 1) == 0)
    {

      a4 = 0;
    }
    self = v15;
  }

  self = (PXGFloatValuesColorLookupCube *)a4;
LABEL_7:
  if (a5) {
    *a5 = (id) v18[5];
  }
  float v11 = self;
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __59__PXGFloatValuesColorLookupCube_initWithData_format_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  char v10 = *(void **)(a1 + 32);
  id v11 = a2;
  [v10 setEdgeSize:a4];
  *(void *)(*(void *)(a1 + 32) + 24) = a5;
  *(void *)(*(void *)(a1 + 32) + 32) = a6;
  obuint64_t j = (id)[v11 copy];

  int v12 = obj;
  if (!obj)
  {
    a6 = [MEMORY[0x263F08C38] UUID];
    int v12 = [a6 UUIDString];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), v12);
  float32x4_t v13 = obj;
  if (!obj)
  {

    float32x4_t v13 = 0;
  }
}

void __59__PXGFloatValuesColorLookupCube_initWithData_format_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (PXGFloatValuesColorLookupCube)initWithEdgeSize:(int64_t)a3 colorValuesData:(const float *)a4 length:(unint64_t)a5 identifier:(id)a6
{
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PXGFloatValuesColorLookupCube;
  int v12 = [(PXGFloatValuesColorLookupCube *)&v16 init];
  float32x4_t v13 = v12;
  if (v12)
  {
    [(PXGColorLookupCube *)v12 setEdgeSize:a3];
    uint64_t v14 = (float *)malloc_type_malloc(4 * a5, 0xF58F3ED2uLL);
    v13->_colorValuesData = v14;
    memcpy(v14, a4, 4 * a5);
    v13->_length = a5;
    objc_storeStrong((id *)&v13->_identifier, a6);
  }

  return v13;
}

- (PXGFloatValuesColorLookupCube)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGColorLookupCube.m", 45, @"%s is not available as initializer", "-[PXGFloatValuesColorLookupCube init]");

  abort();
}

+ (BOOL)_parseLUTData:(id)a3 resultHandler:(id)a4 errorHandler:(id)a5
{
  id v7 = a3;
  float32x4_t v45 = (void (**)(id, void *, uint64_t, uint64_t, void *, uint64_t))a4;
  id v8 = a5;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  id v58 = 0;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __74__PXGFloatValuesColorLookupCube__parseLUTData_resultHandler_errorHandler___block_invoke;
  v50[3] = &unk_2655563B8;
  v52 = &v53;
  id v9 = v8;
  id v51 = v9;
  uint64_t v10 = MEMORY[0x26120F950](v50);
  id v11 = (void (**)(void))v10;
  if (v7)
  {
    uint64_t v12 = [[NSString alloc] initWithData:v7 encoding:4];
    int v43 = (void *)v12;
    if (v12)
    {
      float32x4_t v13 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v12];
      uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v48 = 0;
      uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
      float v47 = 0.0;
      float v42 = 0.0;
      context = (void *)MEMORY[0x26120F770]();
      v39 = 0;
      unint64_t v14 = 0;
      uint64_t v29 = 0;
      float32x4_t v44 = 0;
      unint64_t v15 = 0;
      objc_super v16 = 0;
      LODWORD(v41) = 1.0;
      HIDWORD(v41) = 1.0;
      float v17 = 0.0;
      float v18 = 0.0;
      float v40 = 1.0;
      float v36 = 0.0;
      float v37 = 1.0;
      float v34 = 0.0;
      float v35 = 1.0;
      float v32 = 0.0;
      float v33 = 1.0;
      while (2)
      {
        while (2)
        {
          float v19 = v42;
LABEL_5:
          float v20 = 1.0 / (float)(*((float *)&v41 + 1) - v19);
LABEL_6:
          unint64_t v21 = v14;
          while (1)
          {
            if ([v13 isAtEnd]) {
              goto LABEL_43;
            }
            if (![v13 scanString:@"#" intoString:0]) {
              break;
            }
            id v22 = [MEMORY[0x263F08708] newlineCharacterSet];
            [v13 scanUpToCharactersFromSet:v22 intoString:0];
          }
          if ([v13 scanString:@"TITLE" intoString:0])
          {
            if ([v13 scanString:@"\"" intoString:0])
            {
              id v46 = 0;
              int v25 = [v13 scanUpToString:@"\"" intoString:&v46];
              id v31 = v46;
              if (v25 && [v13 scanString:@"\"" intoString:0])
              {

                v39 = v31;
                unint64_t v14 = v21;
                continue;
              }
              v28 = v31;
            }
            else
            {
              v28 = 0;
            }
            v11[2](v11);

            goto LABEL_43;
          }
          break;
        }
        unint64_t v14 = v21;
        if ([v13 scanString:@"DOMAIN_MIN" intoString:0])
        {
          if ([v13 scanFloat:(char *)&v48 + 4]
            && [v13 scanFloat:&v48]
            && [v13 scanFloat:&v47])
          {
            unint64_t v26 = v48;
            LODWORD(v42) = HIDWORD(v26);
            LODWORD(v17) = v26;
            float v18 = v47;
            continue;
          }
        }
        else if ([v13 scanString:@"DOMAIN_MAX" intoString:0])
        {
          if ([v13 scanFloat:(char *)&v48 + 4]
            && [v13 scanFloat:&v48]
            && [v13 scanFloat:&v47])
          {
            unint64_t v41 = v48;
            float v40 = v47;
            float v19 = v42;
            goto LABEL_5;
          }
        }
        else if ([v13 scanString:@"LUT_3D_SIZE" intoString:0])
        {
          uint64_t v30 = 3;
          if ([v13 scanInteger:&v49]) {
            continue;
          }
        }
        else if ([v13 scanFloat:(char *)&v48 + 4] {
               && [v13 scanFloat:&v48]
        }
               && [v13 scanFloat:&v47])
        {
          if (v44)
          {
LABEL_21:
            if (v15 < v14)
            {
              float *v16 = v36 + (float)(*((float *)&v48 + 1) * v37);
              float v24 = v32 + (float)(v47 * v33);
              v16[1] = v34 + (float)(*(float *)&v48 * v35);
              v16[2] = v24;
              v16[3] = 1.0;
              ++v15;
              v16 += 4;
              if (v15 != v14) {
                goto LABEL_6;
              }
              if ([v13 isAtEnd])
              {
                v45[2](v45, v39, v30, v49, v44, v29);
                float32x4_t v44 = 0;
                BOOL v23 = 1;
                goto LABEL_44;
              }
            }
            break;
          }
          float32x4_t v44 = 0;
          BOOL v23 = 0;
          if (v30 == 3 && v49 >= 1)
          {
            unint64_t v14 = v49 * v49 * v49;
            float32x4_t v44 = malloc_type_malloc(16 * v14, 0x100004052888210uLL);
            uint64_t v29 = 4 * v14;
            float v36 = v20 * (float)-v42;
            float v37 = v20;
            float v34 = (float)(1.0 / (float)(*(float *)&v41 - v17)) * (float)-v17;
            float v35 = 1.0 / (float)(*(float *)&v41 - v17);
            float v32 = (float)(1.0 / (float)(v40 - v18)) * (float)-v18;
            float v33 = 1.0 / (float)(v40 - v18);
            objc_super v16 = (float *)v44;
            goto LABEL_21;
          }
LABEL_44:
          free(v44);

          goto LABEL_45;
        }
        break;
      }
      v11[2](v11);
LABEL_43:
      BOOL v23 = 0;
      goto LABEL_44;
    }
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v54[5]);
    BOOL v23 = 0;
LABEL_45:

    goto LABEL_46;
  }
  (*(void (**)(uint64_t))(v10 + 16))(v10);
  BOOL v23 = 0;
LABEL_46:

  _Block_object_dispose(&v53, 8);
  return v23;
}

uint64_t __74__PXGFloatValuesColorLookupCube__parseLUTData_resultHandler_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F087E8], "px_genericErrorWithDebugDescription:", @"Malformed color cube LUT");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

@end