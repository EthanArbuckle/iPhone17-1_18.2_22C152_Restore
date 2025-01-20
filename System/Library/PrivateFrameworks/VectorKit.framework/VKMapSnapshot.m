@interface VKMapSnapshot
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateForPoint:(CGPoint)a3;
- (CGPoint)pointForCoordinate:(id)a3;
- (NSArray)elevationRasters;
- (NSArray)images;
- (NSDictionary)memoryStats;
- (NSString)colorSpace;
- (VKMapSnapshot)initWithCoder:(id)a3;
- (double)scale;
- (id)_initWithImages:(id)a3 displayStyles:(id *)a4 displayStylesCount:(unint64_t)a5 scale:(double)a6 camera:(id)a7;
- (id)_initWithImages:(id)a3 displayStyles:(id *)a4 displayStylesCount:(unint64_t)a5 scale:(double)a6 camera:(id)a7 elevationScale:(float)a8 targetPointElevation:(float)a9 colorSpace:(__CFString *)a10;
- (id)description;
- (id)imageDataInFormat:(unint64_t)a3;
- (id)imageSurfaceAtIndex:(unint64_t)a3;
- (id)imageSurfaces;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateImagesWithBlock:(id)a3;
- (void)setElevationRasters:(id)a3;
- (void)setMemoryStats:(id)a3;
@end

@implementation VKMapSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_elevationRasters, 0);
  objc_storeStrong((id *)&self->_memoryStats, 0);
  objc_storeStrong((id *)&self->_vkCamera, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

- (NSString)colorSpace
{
  return self->_colorSpace;
}

- (void)setElevationRasters:(id)a3
{
}

- (NSArray)elevationRasters
{
  return self->_elevationRasters;
}

- (void)setMemoryStats:(id)a3
{
}

- (NSDictionary)memoryStats
{
  return self->_memoryStats;
}

- (double)scale
{
  return self->_scale;
}

- (NSArray)images
{
  return self->_images;
}

- (void)enumerateImagesWithBlock:(id)a3
{
  v5 = (void (**)(id, unint64_t, void))a3;
  if (self->_displayStylesCount)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      v8 = &self->_displayStyles[v6];
      uint64_t v9 = *(unsigned __int16 *)&v8->var4;
      uint64_t v10 = *(unsigned int *)&v8->var0;
      v11 = [(NSArray *)self->_images objectAtIndexedSubscript:v7];
      uint64_t v12 = 0;
      [v11 getValue:&v12];
      unint64_t v3 = v3 & 0xFFFF000000000000 | (v10 | (v9 << 32)) & 0xFFFFFFFFFFFFLL;
      v5[2](v5, v3, v12);

      ++v7;
      ++v6;
    }
    while (v7 < self->_displayStylesCount);
  }
}

- (id)imageDataInFormat:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_images = &self->_images;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_images, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = *p_images;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    if (a3) {
      CFStringRef v9 = @"public.png";
    }
    else {
      CFStringRef v9 = @"public.jpeg";
    }
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        CGImageRef image = 0;
        [v11 getValue:&image];
        uint64_t v12 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
        v13 = CGImageDestinationCreateWithData(v12, v9, 1uLL, 0);
        CGImageDestinationAddImage(v13, image, 0);
        CGImageDestinationFinalize(v13);
        CFRelease(v13);
        [v5 addObject:v12];
      }
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateForPoint:(CGPoint)a3
{
  vkCamera = self->_vkCamera;
  if (vkCamera)
  {
    -[VKCamera groundPointFromScreenPoint:](vkCamera, "groundPointFromScreenPoint:", self->_scale * a3.x / (double)self->_width, 1.0 - self->_scale * a3.y / (double)self->_height);
    double v5 = v13 * 6.28318531 + -3.14159265;
    double v6 = v12 * 6.28318531;
  }
  else
  {
    double v6 = 0.0;
    double v5 = -3.14159265;
  }
  long double v7 = exp(v5);
  long double v8 = atan(v7) * 114.591559 + -90.0;
  long double v9 = fmod(v6, 6.28318531);
  long double v10 = fmod(v9 + 6.28318531, 6.28318531) * 57.2957795 + -180.0;
  double v11 = v8;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

- (CGPoint)pointForCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  double v6 = *(double *)[(VKCamera *)self->_vkCamera position];
  long double v7 = tan(var0 * 0.00872664626 + 0.785398163);
  double v8 = var1 * 0.00277777778;
  double v42 = v8 + 0.5;
  double v41 = log(v7) * 0.159154943 + 0.5;
  elevationRasters = self->_elevationRasters;
  if (elevationRasters)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    double v11 = elevationRasters;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v44 objects:v48 count:16];
    double v13 = 0.0;
    if (v12)
    {
      uint64_t v14 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v45 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v17 = [v16 tile];
          int v18 = 1 << *(unsigned char *)(v17 + 1);
          double v19 = -1.0 / (double)v18;
          float v20 = (v42 + v19 * (double)*(int *)(v17 + 8)) * (double)v18;
          float v21 = (v41 + v19 * (double)(v18 + ~*(_DWORD *)(v17 + 4))) * (double)v18;
          v43[0] = v20;
          v43[1] = v21;
          [v16 tile];
          [(VKCamera *)self->_vkCamera position];
          if (v20 >= 0.0 && v20 <= 1.0 && v21 >= 0.0 && v21 <= 1.0)
          {
            [v16 getElevationAtPoint:v43];
            double v13 = v24;
            goto LABEL_22;
          }
        }
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v12);
    }
LABEL_22:

    *(double *)&long long v9 = (v13 - self->_targetPointElevation) * (0.0000000249532021 * self->_elevationScale);
  }
  else
  {
    *(void *)&long long v9 = 0;
  }
  long long v39 = v9;
  if (v8 > v6)
  {
    double v25 = -0.5;
LABEL_27:
    double v26 = v8 + v25;
    double v42 = v26;
    goto LABEL_28;
  }
  double v26 = v8 + 1.0;
  if (v8 + 1.0 < v6)
  {
    double v25 = 1.5;
    goto LABEL_27;
  }
LABEL_28:
  v27 = [(VKCamera *)self->_vkCamera scaledViewProjectionMatrix];
  p_scale = &self->_scale;
  float64x2_t v29 = vld1q_dup_f64(p_scale);
  float64x2_t v30 = vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v27[6], *v27, v42), v27[2], v41), v27[4], v40), 0.5 / (v27[7].f64[1] + v27[1].f64[1] * v42 + v27[3].f64[1] * v41 + v27[5].f64[1] * v40));
  __asm { FMOV            V3.2D, #0.5 }
  *(void *)&v36.f64[0] = *(_OWORD *)&vaddq_f64(v30, _Q3);
  v36.f64[1] = vsubq_f64(_Q3, v30).f64[1];
  float64x2_t v37 = vdivq_f64(vmulq_f64(v36, vcvtq_f64_u64(*(uint64x2_t *)&self->_width)), v29);
  double v38 = v37.f64[1];
  result.x = v37.f64[0];
  result.y = v38;
  return result;
}

- (id)description
{
  unint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)VKMapSnapshot;
  v4 = [(VKMapSnapshot *)&v7 description];
  double v5 = [v3 stringWithFormat:@"%@ size: (%zu, %zu)", v4, self->_width, self->_height];

  return v5;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  displayStyles = self->_displayStyles;
  if (displayStyles) {
    free(displayStyles);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_images;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        CGImageRef image = 0;
        [v8 getValue:&image];
        CGImageRelease(image);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)VKMapSnapshot;
  [(VKMapSnapshot *)&v9 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBytes:self->_displayStyles length:6 * self->_displayStylesCount forKey:@"displayStyles"];
  [v4 encodeInteger:self->_displayStylesCount forKey:@"displayStylesCount"];
  memoryStats = self->_memoryStats;
  if (memoryStats) {
    [v4 encodeObject:memoryStats forKey:@"memoryStats"];
  }
  uint64_t v6 = [(VKMapSnapshot *)self imageSurfaces];
  if (v6)
  {
    [v4 encodeObject:v6 forKey:@"imageSurfaces"];
  }
  else
  {
    uint64_t v7 = [(VKMapSnapshot *)self imageDataInFormat:1];
    if (v7) {
      [v4 encodeObject:v7 forKey:@"imageDatas"];
    }
  }
  [v4 encodeDouble:@"scale" forKey:self->_scale];
  [v4 encodeDouble:@"targetPointElevation" forKey:self->_targetPointElevation];
  vkCamera = self->_vkCamera;
  if (vkCamera)
  {
    [(VKCamera *)vkCamera cameraState];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
  }
  objc_super v9 = objc_msgSend(MEMORY[0x1E4F29238], "value:withObjCType:", &v12, "{VKCameraState={RigidTransform<double, double>={Matrix<double, 3, 1>=[3d]}{Quaternion<double>={Matrix<double, 3, 1>=[3d]}d}}d{Unit<geo::RadianUnitDescription, double>=d}d}");
  [v4 encodeObject:v9 forKey:@"cameraState"];

  elevationRasters = self->_elevationRasters;
  if (elevationRasters) {
    [v4 encodeObject:elevationRasters forKey:@"elevationRasters"];
  }
  *(float *)&double v10 = self->_elevationScale;
  objc_msgSend(v4, "encodeFloat:forKey:", @"elevationScale", v10, v12, v13, v14, v15, v16);
  [v4 encodeObject:self->_colorSpace forKey:@"colorSpace"];
}

- (id)imageSurfaces
{
  unint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_images, "count"));
  for (unint64_t i = 0; i < [(NSArray *)self->_images count]; ++i)
  {
    uint64_t v5 = [(VKMapSnapshot *)self imageSurfaceAtIndex:i];
    [v3 addObject:v5];
  }
  return v3;
}

- (id)imageSurfaceAtIndex:(unint64_t)a3
{
  uint64_t v8 = 0;
  unint64_t v3 = [(NSArray *)self->_images objectAtIndex:a3];
  [v3 getValue:&v8];

  Property = (void *)CGImageGetProperty();
  uint64_t v5 = Property;
  if (Property) {
    id v6 = Property;
  }
  return v5;
}

- (VKMapSnapshot)initWithCoder:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)VKMapSnapshot;
  id v5 = [(VKMapSnapshot *)&v86 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"displayStylesCount"];
    *((void *)v5 + 9) = v6;
    if (v6)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorSpace"];
      uint64_t v8 = (void *)*((void *)v5 + 12);
      *((void *)v5 + 12) = v7;

      size_t size = 0;
      id v65 = v4;
      objc_super v9 = (const void *)[v65 decodeBytesForKey:@"displayStyles" returnedLength:&size];
      if (size == 6 * *((void *)v5 + 9))
      {
        double v10 = malloc_type_malloc(size, 0xF4B29679uLL);
        *((void *)v5 + 8) = v10;
        memcpy(v10, v9, size);
        id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v12 = objc_opt_class();
        v60 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
        v61 = objc_msgSend(v65, "decodeObjectOfClasses:forKey:");
        if (v61)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            float64x2_t v30 = 0;
LABEL_41:

            goto LABEL_23;
          }
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          id obj = v61;
          uint64_t v13 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
          if (v13)
          {
            uint64_t v62 = *(void *)v82;
            CFStringRef theString2 = (const __CFString *)*MEMORY[0x1E4F1DC98];
            CFStringRef v59 = (const __CFString *)*MEMORY[0x1E4F1DC88];
LABEL_8:
            uint64_t v14 = 0;
            while (1)
            {
              if (*(void *)v82 != v62) {
                objc_enumerationMutation(obj);
              }
              long long v15 = *(void **)(*((void *)&v81 + 1) + 8 * v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_39;
              }
              IOSurfaceSetOwnership();
              *((void *)v5 + 2) = [v15 width];
              *((void *)v5 + 3) = [v15 height];
              if ([v15 pixelFormat] != 1111970369) {
                goto LABEL_39;
              }
              CFStringRef v16 = (const __CFString *)*((void *)v5 + 12);
              if (v16
                && ((CFComparisonResult v17 = CFStringCompare(v16, theString2, 0), v18 = theString2, v17 == kCFCompareEqualTo)
                 || (CFStringRef v19 = (const __CFString *)*((void *)v5 + 12)) != 0
                 && (v20 = CFStringCompare(v19, v59, 0), CFStringRef v18 = v59, v20 == kCFCompareEqualTo)))
              {
                CGColorSpaceRef DeviceRGB = CGColorSpaceCreateWithName(v18);
              }
              else
              {
                CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
              }
              v22 = DeviceRGB;
              id v23 = v15;
              float v24 = (const void *)[v23 baseAddress];
              size_t BytesPerElement = IOSurfaceGetBytesPerElement((IOSurfaceRef)v23);
              size_t BytesPerRow = IOSurfaceGetBytesPerRow((IOSurfaceRef)v23);
              size_t v27 = [v23 allocationSize];
              CFRetain(v23);
              v28 = CGDataProviderCreateWithData(v23, v24, v27, (CGDataProviderReleaseDataCallback)releaseIOSurface);
              [v23 incrementUseCount];
              image[0] = 0;
              image[0] = CGImageCreate(*((void *)v5 + 2), *((void *)v5 + 3), 8uLL, 8 * BytesPerElement, BytesPerRow, v22, 0x2006u, v28, 0, 1, kCGRenderingIntentDefault);
              CGImageSetProperty();
              float64x2_t v29 = [MEMORY[0x1E4F29238] valueWithBytes:image objCType:"^{CGImage=}"];
              [v66 addObject:v29];
              CGColorSpaceRelease(v22);
              CGDataProviderRelease(v28);

              if (v13 == ++v14)
              {
                uint64_t v13 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
                if (v13) {
                  goto LABEL_8;
                }
                break;
              }
            }
          }
        }
        else
        {
          v32 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v33 = objc_opt_class();
          v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
          id obj = [v65 decodeObjectOfClasses:v34 forKey:@"imageDatas"];

          if (obj)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_39;
            }
            long long v79 = 0u;
            long long v80 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            id v35 = obj;
            uint64_t v36 = [v35 countByEnumeratingWithState:&v77 objects:v87 count:16];
            if (v36)
            {
              uint64_t v37 = *(void *)v78;
              while (2)
              {
                for (uint64_t i = 0; i != v36; ++i)
                {
                  if (*(void *)v78 != v37) {
                    objc_enumerationMutation(v35);
                  }
                  CFDataRef v39 = *(const __CFData **)(*((void *)&v77 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    goto LABEL_39;
                  }
                  double v40 = CGDataProviderCreateWithCFData(v39);
                  image[0] = 0;
                  image[0] = CGImageCreateWithPNGDataProvider(v40, 0, 1, kCGRenderingIntentDefault);
                  CGDataProviderRelease(v40);
                  *((void *)v5 + 2) = CGImageGetWidth(image[0]);
                  *((void *)v5 + 3) = CGImageGetHeight(image[0]);
                  double v41 = [MEMORY[0x1E4F29238] valueWithBytes:image objCType:"^{CGImage=}"];
                  [v66 addObject:v41];
                }
                uint64_t v36 = [v35 countByEnumeratingWithState:&v77 objects:v87 count:16];
                if (v36) {
                  continue;
                }
                break;
              }
            }
          }
        }

        objc_storeStrong((id *)v5 + 1, v66);
        [v65 decodeDoubleForKey:@"scale"];
        *((void *)v5 + 4) = v42;
        [v65 decodeDoubleForKey:@"targetPointElevation"];
        *((void *)v5 + 6) = v43;
        long long v44 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v45 = objc_opt_class();
        uint64_t v46 = objc_opt_class();
        long long v47 = objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0);
        uint64_t v48 = [v65 decodeObjectOfClasses:v47 forKey:@"memoryStats"];
        uint64_t v49 = (void *)*((void *)v5 + 10);
        *((void *)v5 + 10) = v48;

        v50 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v51 = objc_opt_class();
        v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
        uint64_t v53 = [v65 decodeObjectOfClasses:v52 forKey:@"elevationRasters"];
        v54 = (void *)*((void *)v5 + 11);
        *((void *)v5 + 11) = v53;

        [v65 decodeFloatForKey:@"elevationScale"];
        *((_DWORD *)v5 + 10) = v55;
        id obj = [v65 decodeObjectOfClass:objc_opt_class() forKey:@"cameraState"];
        if (!strcmp((const char *)[obj objCType], "{VKCameraState={RigidTransform<double, double>={Matrix<double, 3, 1>=[3d]}{Quaternion<double>={Matrix<double, 3, 1>=[3d]}d}}d{Unit<geo::RadianUnitDescription, double>=d}d}"))
        {
          memset(v74, 0, sizeof(v74));
          *(_OWORD *)CGImageRef image = 0u;
          *(void *)&long long v75 = 0x3FF0000000000000;
          [obj getValue:image];
          v56 = [[VKCamera alloc] initWithRunLoopController:0];
          v57 = (void *)*((void *)v5 + 7);
          *((void *)v5 + 7) = v56;

          v58 = (void *)*((void *)v5 + 7);
          long long v67 = *(_OWORD *)image;
          uint64_t v68 = *(void *)&v74[0];
          long long v69 = *(_OWORD *)((char *)v74 + 8);
          uint64_t v70 = *((void *)&v74[1] + 1);
          long long v71 = v75;
          long long v72 = v76;
          [v58 setCameraState:&v67];
          float64x2_t v30 = (VKMapSnapshot *)v5;
LABEL_40:

          goto LABEL_41;
        }
LABEL_39:
        float64x2_t v30 = 0;
        goto LABEL_40;
      }
    }
  }
  float64x2_t v30 = 0;
LABEL_23:

  return v30;
}

- (id)_initWithImages:(id)a3 displayStyles:(id *)a4 displayStylesCount:(unint64_t)a5 scale:(double)a6 camera:(id)a7 elevationScale:(float)a8 targetPointElevation:(float)a9 colorSpace:(__CFString *)a10
{
  id v18 = a3;
  id v19 = a7;
  CFComparisonResult v20 = v19;
  float v21 = 0;
  if (v18 && v19 && a6 >= 1.0)
  {
    if ([v18 count] == a5)
    {
      v33.receiver = self;
      v33.super_class = (Class)VKMapSnapshot;
      v22 = [(VKMapSnapshot *)&v33 init];
      id v23 = v22;
      if (v22)
      {
        v22->_displayStylesCount = a5;
        size_t v24 = 6 * a5;
        double v25 = ($6EFE6C6748B912A6EAC8A8E593ED1344 *)malloc_type_malloc(v24, 0x1000040274DC3F3uLL);
        v23->_displayStyles = v25;
        memcpy(v25, a4, v24);
        uint64_t v26 = [v18 copy];
        images = v23->_images;
        v23->_images = (NSArray *)v26;

        if ([(NSArray *)v23->_images count])
        {
          image[0] = 0;
          v28 = [(NSArray *)v23->_images objectAtIndex:0];
          [v28 getValue:image];
          CGImageRetain(image[0]);
          v23->_width = CGImageGetWidth(image[0]);
          v23->_height = CGImageGetHeight(image[0]);

          for (unint64_t i = 1; i < [(NSArray *)v23->_images count]; ++i)
          {
            image[0] = 0;
            float64x2_t v30 = [(NSArray *)v23->_images objectAtIndex:i];
            [v30 getValue:image];
            CGImageRetain(image[0]);
          }
        }
        objc_storeStrong((id *)&v23->_vkCamera, a7);
        v23->_scale = a6;
        v23->_elevationScale = a8;
        v23->_targetPointElevation = a9;
        objc_storeStrong((id *)&v23->_colorSpace, a10);
      }
      self = v23;
      float v21 = self;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        LOWORD(image[0]) = 0;
        _os_log_fault_impl(&dword_1A1780000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: images.count == displayStylesCount", (uint8_t *)image, 2u);
      }
      float v21 = 0;
    }
  }

  return v21;
}

- (id)_initWithImages:(id)a3 displayStyles:(id *)a4 displayStylesCount:(unint64_t)a5 scale:(double)a6 camera:(id)a7
{
  LODWORD(v7) = 1.0;
  return [(VKMapSnapshot *)self _initWithImages:a3 displayStyles:a4 displayStylesCount:a5 scale:a7 camera:*MEMORY[0x1E4F1DC98] elevationScale:a6 targetPointElevation:v7 colorSpace:0.0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end