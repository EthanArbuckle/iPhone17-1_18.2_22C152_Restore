@interface NTKKaleidoscopePathfinder
+ (BOOL)supportsSecureCoding;
+ (id)pathfinderFromDirectory:(id)a3;
+ (id)pathfinderFromFile:(id)a3;
+ (id)pathfinderWithImage:(id)a3;
- (BOOL)writeToDirectory:(id)a3;
- (BOOL)writeToFile:(id)a3;
- (NTKKaleidoscopePathfinder)initWithCoder:(id)a3;
- (NTKKaleidoscopePathfinder)initWithImage:(id)a3;
- (NTKKaleidoscopePathfinderPoint)pointForTime:(float)a3;
- (float)startRotation;
- (int)cellGridHeight;
- (int)cellGridWidth;
- (int)pathLength;
- (void)adjustPathStart:(NTKKaleidoscopePathfinder *)self;
- (void)adjustRotationStart:(float)a3;
- (void)adjustSampleRadius:(float)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKKaleidoscopePathfinder

- (NTKKaleidoscopePathfinder)initWithImage:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && (v46.receiver = self,
        v46.super_class = (Class)NTKKaleidoscopePathfinder,
        (self = [(NTKKaleidoscopePathfinder *)&v46 init]) != 0))
  {
    [v4 size];
    double v6 = v5;
    double v8 = v7;
    [v4 scale];
    double v10 = v6 * v9;
    double v11 = v8 * v9;
    if (v10 < 2.0 || v11 < 2.0)
    {
      v13 = _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v48 = v4;
        __int16 v49 = 1024;
        int v50 = (int)v10;
        __int16 v51 = 1024;
        int v52 = (int)v11;
        _os_log_error_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_ERROR, "[kaleidoscope pathfinder cache] nil pathfinder for image %@ (%d x %d), returning early", buf, 0x18u);
      }
      v14 = 0;
    }
    else
    {
      int v15 = (int)v10;
      int v16 = (int)v11;
      if ((int)v10 < 188 || v16 <= 187)
      {
        v26 = _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v48 = v4;
          __int16 v49 = 1024;
          int v50 = (int)v10;
          __int16 v51 = 1024;
          int v52 = (int)v11;
          _os_log_impl(&dword_1BC5A9000, v26, OS_LOG_TYPE_DEFAULT, "[kaleidoscope pathfinder cache] poor quality pathfinder for image %@ (%d x %d)", buf, 0x18u);
        }

        int v23 = 0;
        uint64_t v24 = 2;
        uint64_t v25 = 2;
      }
      else
      {
        int v17 = v15 - 156;
        int v18 = v16 - 156;
        signed int v19 = (v15 - 156) >> 4;
        signed int v20 = (v16 - 156) >> 4;
        if ((v19 * v20) >= 0x259)
        {
          signed int v20 = (int)sqrtf((float)((float)v18 * 600.0) / (float)v17);
          signed int v19 = 600 / v20;
        }
        int v21 = v17 / v19;
        int v22 = v18 / v20;
        if (v21 <= v22) {
          int v21 = v22;
        }
        int v23 = (v21 + 77) / v21;
        uint64_t v24 = (v15 / v21);
        uint64_t v25 = (v16 / v21);
      }
      float v27 = 156.0 / v10;
      float v28 = 156.0 / v11;
      self->_sampleRadiusX = v27;
      self->_sampleRadiusY = v28;
      v29 = malloc_type_malloc(4 * (int)v25 * (int)v24, 0x100004052888210uLL);
      v13 = +[NTKRawImage rawImageWithImage:v4 width:(16 * v24) height:(16 * v25)];
      NTKAnalyzeInterestingness(v13, v29, v24, v25, v23);
      self->_cellGridWidth = v24;
      self->_cellGridHeight = v25;
      v30 = NTKGeneratePathFromInterestingness((uint64_t)v29, v24, v25);
      v31 = v30;
      if (v30)
      {
        v44 = v29;
        int v32 = [v30 count];
        if (v32 >= 0) {
          int v33 = v32;
        }
        else {
          int v33 = v32 + 1;
        }
        int v34 = v33 >> 1;
        self->_pathLength = v34;
        *(void *)&self->_path[4] = malloc_type_malloc(8 * v34, 0x100004000313F17uLL);
        if (self->_pathLength >= 1)
        {
          uint64_t v35 = 0;
          uint64_t v36 = 1;
          do
          {
            v37 = [v31 objectAtIndexedSubscript:v36 - 1];
            [v37 floatValue];
            unsigned int v45 = v38;
            v39 = [v31 objectAtIndexedSubscript:v36];
            [v39 floatValue];
            *(void *)(*(void *)&self->_path[4] + 8 * v35) = __PAIR64__(v40, v45);

            ++v35;
            v36 += 2;
          }
          while (v35 < self->_pathLength);
        }
        free(v44);
        v41 = malloc_type_malloc(16 * (int)v25 * (int)v24, 0x1000040451B5BE8uLL);
        *(void *)&self->_dominanceGrid[4] = v41;
        NTKAnalyzeDominance((uint64_t)v13, (uint64_t)v41, v24);
        v14 = self;
      }
      else
      {
        v42 = _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[NTKKaleidoscopePathfinder initWithImage:]();
        }

        v14 = 0;
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NTKKaleidoscopePathfinder)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NTKKaleidoscopePathfinder;
  double v5 = [(NTKKaleidoscopePathfinder *)&v22 init];
  if (v5 && [v4 decodeInt32ForKey:@"version"] == 4098)
  {
    [v4 decodeFloatForKey:@"sampleRadiusX"];
    v5->_sampleRadiusX = v6;
    [v4 decodeFloatForKey:@"sampleRadiusY"];
    v5->_sampleRadiusY = v7;
    v5->_cellGridWidth = [v4 decodeIntForKey:@"cellGridWidth"];
    int v8 = [v4 decodeIntForKey:@"cellGridHeight"];
    v5->_cellGridHeight = v8;
    int v9 = v5->_cellGridWidth * v8;
    uint64_t v21 = 0;
    id v10 = v4;
    uint64_t v11 = [v10 decodeBytesForKey:@"dominanceGrid" returnedLength:&v21];
    v12 = 0;
    if (v21 == 16 * v9)
    {
      v13 = (const void *)v11;
      v14 = malloc_type_malloc(16 * v9, 0x520B1CFEuLL);
      *(void *)&v5->_dominanceGrid[4] = v14;
      memcpy(v14, v13, 16 * v9);
      int v15 = [v10 decodeIntForKey:@"pathLength"];
      v5->_pathLength = v15;
      uint64_t v20 = 0;
      uint64_t v16 = [v10 decodeBytesForKey:@"path" returnedLength:&v20];
      v12 = 0;
      if (v20 == 8 * v15)
      {
        int v17 = (const void *)v16;
        int v18 = malloc_type_malloc(8 * v15, 0x30D66936uLL);
        *(void *)&v5->_path[4] = v18;
        memcpy(v18, v17, 8 * v15);
        v12 = v5;
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)dealloc
{
  free(*(void **)&self->_dominanceGrid[4]);
  free(*(void **)&self->_path[4]);
  v3.receiver = self;
  v3.super_class = (Class)NTKKaleidoscopePathfinder;
  [(NTKKaleidoscopePathfinder *)&v3 dealloc];
}

+ (id)pathfinderWithImage:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKKaleidoscopePathfinder alloc] initWithImage:v3];

  return v4;
}

+ (id)pathfinderFromDirectory:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = NSString;
  id v5 = a3;
  float v6 = objc_msgSend(v4, "stringWithFormat:", @"image-%X.pathfinder", 4098);
  float v7 = [v5 stringByAppendingPathComponent:v6];

  int v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 attributesOfItemAtPath:v7 error:0];
  uint64_t v10 = *MEMORY[0x1E4F28370];
  uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28370]];
  char v12 = [v11 isEqualToString:*MEMORY[0x1E4F28378]];

  if (v12)
  {
    v13 = [a1 pathfinderFromFile:v7];
  }
  else
  {
    v14 = _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v9 objectForKeyedSubscript:v10];
      *(_DWORD *)buf = 138412546;
      int v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "[kaleidoscope pathfinder cache] path %@ has the wrong protection class (%@)", buf, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)pathfinderFromFile:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v11 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3 options:1 error:&v11];
  id v5 = v11;
  if (v4)
  {
    float v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:0];
    [v6 setDecodingFailurePolicy:0];
    float v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
    if (v7)
    {
      int v8 = _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v3;
        _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "[kaleidoscope pathfinder cache] using %@", buf, 0xCu);
      }
    }
    else
    {
      int v8 = _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[NTKKaleidoscopePathfinder pathfinderFromFile:]();
      }
    }
  }
  else
  {
    int v9 = _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[NTKKaleidoscopePathfinder pathfinderFromFile:]();
    }

    float v7 = 0;
  }

  return v7;
}

- (NTKKaleidoscopePathfinderPoint)pointForTime:(float)a3
{
  uint64_t v4 = v3;
  int pathLength = self->_pathLength;
  float v6 = (float)pathLength * a3;
  signed int v7 = vcvtms_s32_f32(v6);
  uint64_t v8 = *(void *)&self->_path[4];
  float32x2_t v9 = *(float32x2_t *)(v8 + 8 * (v7 % pathLength));
  float32x2_t v10 = *(float32x2_t *)(v8 + 8 * ((v7 + 1) % pathLength));
  float v11 = v6 - (float)(int)floorf(v6);
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  float32x2_t v12 = vmla_n_f32(vmul_n_f32(v10, v11), v9, 1.0 - v11);
  uint64_t v13 = *(void *)&self->_sampleRadiusX;
  *(float32x2_t *)uint64_t v4 = v12;
  *(void *)(v4 + 8) = v13;
  CLKUIConvertToSRGBfFromRGBf_fast();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = 16 * self->_cellGridHeight * self->_cellGridWidth;
  uint64_t v5 = 8 * self->_pathLength;
  id v8 = a3;
  [v8 encodeInt32:4098 forKey:@"version"];
  *(float *)&double v6 = self->_sampleRadiusX;
  [v8 encodeFloat:@"sampleRadiusX" forKey:v6];
  *(float *)&double v7 = self->_sampleRadiusY;
  [v8 encodeFloat:@"sampleRadiusY" forKey:v7];
  [v8 encodeInt32:self->_cellGridWidth forKey:@"cellGridWidth"];
  [v8 encodeInt32:self->_cellGridHeight forKey:@"cellGridHeight"];
  [v8 encodeBytes:*(void *)&self->_dominanceGrid[4] length:v4 forKey:@"dominanceGrid"];
  [v8 encodeInt32:self->_pathLength forKey:@"pathLength"];
  [v8 encodeBytes:*(void *)&self->_path[4] length:v5 forKey:@"path"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)writeToDirectory:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  double v6 = objc_msgSend(v4, "stringWithFormat:", @"image-%X.pathfinder", 4098);
  double v7 = [v5 stringByAppendingPathComponent:v6];

  LOBYTE(self) = [(NTKKaleidoscopePathfinder *)self writeToFile:v7];
  return (char)self;
}

- (BOOL)writeToFile:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F19A30] currentDevice];
  char v6 = [v5 unlockedSinceBoot];

  if (v6)
  {
    double v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    id v17 = 0;
    [v7 writeToFile:v4 options:1 error:&v17];
    id v8 = v17;
    if (v8)
    {
      id v9 = v8;
      float32x2_t v10 = _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[NTKKaleidoscopePathfinder writeToFile:]();
      }
    }
    else
    {
      float32x2_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v18 = *MEMORY[0x1E4F28370];
      v19[0] = *MEMORY[0x1E4F28378];
      float32x2_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v16 = 0;
      char v13 = [v10 setAttributes:v12 ofItemAtPath:v4 error:&v16];
      id v9 = v16;

      if ((v13 & 1) == 0)
      {
        uint64_t v14 = _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[NTKKaleidoscopePathfinder writeToFile:]();
        }

        [v10 removeItemAtPath:v4 error:0];
      }
    }

    BOOL v11 = v9 == 0;
  }
  else
  {
    double v7 = _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NTKKaleidoscopePathfinder writeToFile:]();
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)adjustRotationStart:(float)a3
{
  *(float *)&self[1].super.isa = a3;
}

- (void)adjustSampleRadius:(float)a3
{
  *(float32x2_t *)&self->_sampleRadiusX = vmul_n_f32(*(float32x2_t *)&self->_sampleRadiusX, a3);
}

- (void)adjustPathStart:(NTKKaleidoscopePathfinder *)self
{
  uint64_t pathLength = self->_pathLength;
  if ((int)pathLength > 4)
  {
    float32x2_t v5 = v2;
    int v7 = 0;
    id v8 = *(float32x2_t **)&self->_path[4];
    float32x2_t v9 = vsub_f32(v2, *v8);
    float v10 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v9, v9).i32[1]), v9.f32[0], v9.f32[0]));
    for (uint64_t i = 1; i != pathLength; ++i)
    {
      float32x2_t v12 = vsub_f32(v5, v8[i]);
      float v13 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v12, v12).i32[1]), v12.f32[0], v12.f32[0]));
      if (v13 < v10)
      {
        float v10 = v13;
        int v7 = i;
      }
    }
    uint64_t v14 = (float32x2_t *)malloc_type_malloc(8 * pathLength, 0x100004000313F17uLL);
    int v15 = v14;
    for (uint64_t j = 0; j != pathLength; ++j)
      v14[j] = *(float32x2_t *)(*(void *)&self->_path[4] + 8 * ((v7 + (int)j) % (int)pathLength));
    float32x2_t v17 = vsub_f32(v5, *v14);
    if ((int)(pathLength / 0x1E) <= 2) {
      signed int v18 = 2;
    }
    else {
      signed int v18 = pathLength / 0x1E;
    }
    memcpy(*(void **)&self->_path[4], v14, 8 * pathLength);
    int v19 = 1 - v18;
    int v20 = 2 * v18 - 1;
    do
    {
      float v21 = 1.0 - fabsf((float)v19 / (float)v18);
      v15[((int)pathLength + v19) % (int)pathLength] = vmla_n_f32(v15[((int)pathLength + v19) % (int)pathLength], v17, (float)(v21 * v21) * (float)((float)(v21 * -2.0) + 3.0));
      ++v19;
      --v20;
    }
    while (v20);
    *int v15 = v5;
    free(*(void **)&self->_path[4]);
    *(void *)&self->_path[4] = v15;
  }
  else
  {
    id v4 = _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[NTKKaleidoscopePathfinder adjustPathStart:](pathLength, v4);
    }
  }
}

- (int)cellGridWidth
{
  return self->_cellGridWidth;
}

- (int)cellGridHeight
{
  return self->_cellGridHeight;
}

- (int)pathLength
{
  return self->_pathLength;
}

- (float)startRotation
{
  return *(float *)&self[1].super.isa;
}

- (void)initWithImage:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "[kaleidoscope pathfinder cache] nil path generated by pathfinder for image %@, returning early", v2, v3, v4, v5, v6);
}

+ (void)pathfinderFromFile:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "[kaleidoscope pathfinder cache] unable to unarchive: %@ due to %@");
}

+ (void)pathfinderFromFile:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "[kaleidoscope pathfinder cache] unknown error %@", v2, v3, v4, v5, v6);
}

+ (void)pathfinderFromFile:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "[kaleidoscope pathfinder cache] error during load: %@", v2, v3, v4, v5, v6);
}

- (void)writeToFile:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "[kaleidoscope pathfinder cache] cannot set class D on file %@: error %@");
}

- (void)writeToFile:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "[kaleidoscope pathfinder cache] error writing archive %@: %@");
}

- (void)writeToFile:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "[kaleidoscope pathfinder cache] skip writing %@ before first unlock", v2, v3, v4, v5, v6);
}

- (void)adjustPathStart:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "[kaleidoscope pathfinder cache] insufficent path length %d", (uint8_t *)v2, 8u);
}

@end