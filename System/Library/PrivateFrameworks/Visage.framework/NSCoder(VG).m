@interface NSCoder(VG)
- (CVPixelBufferRef)vg_createDecodedPixelBufferForKey:()VG;
- (__n128)vg_decodeRectForKey:()VG;
- (__n128)vg_decodeViewportForKey:()VG;
- (__n64)vg_decodeUshort2ForKey:()VG;
- (double)vg_decodeFloat2ForKey:()VG;
- (double)vg_decodeFloat3ForKey:()VG;
- (double)vg_decodeFloat3x3ForKey:()VG;
- (double)vg_decodeFloat4ForKey:()VG;
- (double)vg_decodeFloat4x4ForKey:()VG;
- (float)vg_decodeFloatForKey:()VG;
- (id)_vg_decodeSurfaceForKey:()VG;
- (id)vg_decodeArrayOfSurfacesForKey:()VG;
- (id)vg_decodeDictionaryOfSurfacesForKey:()VG;
- (id)vg_decodePixelBufferForKey:()VG;
- (id)vg_decodeRasterizationRateMapDescriptorForKey:()VG;
- (id)vg_decodeSurfaceForKey:()VG;
- (uint64_t)vg_decodeUint64ForKey:()VG;
- (uint64_t)vg_decodeUnsignedIntegerForKey:()VG;
- (uint64_t)vg_encodeFloat2:()VG forKey:;
- (uint64_t)vg_encodeFloat3:()VG forKey:;
- (uint64_t)vg_encodeFloat3x3:()VG forKey:;
- (uint64_t)vg_encodeFloat4:()VG forKey:;
- (uint64_t)vg_encodeFloat4x4:()VG forKey:;
- (uint64_t)vg_encodeRect:()VG forKey:;
- (uint64_t)vg_encodeUlong4:()VG forKey:;
- (uint64_t)vg_encodeUshort2:()VG forKey:;
- (uint64_t)vg_encodeViewport:()VG forKey:;
- (void)vg_decodeUlong4ForKey:()VG;
- (void)vg_encodeArrayOfSurfaces:()VG forKey:;
- (void)vg_encodeDictionaryOfSurfaces:()VG forKey:;
- (void)vg_encodeFloat:()VG forKey:;
- (void)vg_encodePixelBuffer:()VG forKey:;
- (void)vg_encodeRasterizationRateMapDescriptor:()VG forKey:;
- (void)vg_encodeSurface:()VG forKey:;
- (void)vg_encodeUint64:()VG forKey:;
- (void)vg_encodeUnsignedInteger:()VG forKey:;
@end

@implementation NSCoder(VG)

- (uint64_t)vg_encodeUshort2:()VG forKey:
{
  int v5 = a3;
  return [a1 encodeBytes:&v5 length:4 forKey:a4];
}

- (__n64)vg_decodeUshort2ForKey:()VG
{
  int __dst = 0;
  unint64_t v6 = 0;
  v3 = (const void *)[a1 decodeBytesForKey:a3 returnedLength:&v6];
  if (v3)
  {
    if (v6 >= 4) {
      size_t v4 = 4;
    }
    else {
      size_t v4 = v6;
    }
    memcpy(&__dst, v3, v4);
    result.n64_u16[2] = HIWORD(__dst);
    result.n64_u16[0] = __dst;
  }
  else
  {
    return 0;
  }
  return result;
}

- (uint64_t)vg_encodeUlong4:()VG forKey:
{
  long long v4 = a3[1];
  v6[0] = *a3;
  v6[1] = v4;
  return [a1 encodeBytes:v6 length:32 forKey:a4];
}

- (void)vg_decodeUlong4ForKey:()VG
{
  long long __dst = 0u;
  long long v10 = 0u;
  unint64_t v8 = 0;
  __n64 result = (void *)[a1 decodeBytesForKey:a2 returnedLength:&v8];
  if (result)
  {
    if (v8 >= 0x20) {
      size_t v5 = 32;
    }
    else {
      size_t v5 = v8;
    }
    __n64 result = memcpy(&__dst, result, v5);
    long long v7 = __dst;
    long long v6 = v10;
  }
  else
  {
    long long v6 = 0uLL;
    long long v7 = 0uLL;
  }
  *a3 = v7;
  a3[1] = v6;
  return result;
}

- (uint64_t)vg_encodeFloat2:()VG forKey:
{
  double v5 = a2;
  return [a1 encodeBytes:&v5 length:8 forKey:a4];
}

- (double)vg_decodeFloat2ForKey:()VG
{
  double v3 = 0.0;
  double __dst = 0.0;
  unint64_t v7 = 0;
  long long v4 = (const void *)[a1 decodeBytesForKey:a3 returnedLength:&v7];
  if (v4)
  {
    if (v7 >= 8) {
      size_t v5 = 8;
    }
    else {
      size_t v5 = v7;
    }
    memcpy(&__dst, v4, v5);
    return __dst;
  }
  return v3;
}

- (uint64_t)vg_encodeFloat3:()VG forKey:
{
  __n128 v5 = a2;
  return [a1 encodeBytes:&v5 length:16 forKey:a4];
}

- (double)vg_decodeFloat3ForKey:()VG
{
  long long __dst = 0uLL;
  unint64_t v6 = 0;
  double v3 = (const void *)[a1 decodeBytesForKey:a3 returnedLength:&v6];
  if (!v3) {
    return 0.0;
  }
  if (v6 >= 0x10) {
    size_t v4 = 16;
  }
  else {
    size_t v4 = v6;
  }
  memcpy(&__dst, v3, v4);
  return *(double *)&__dst;
}

- (uint64_t)vg_encodeFloat4:()VG forKey:
{
  __n128 v5 = a2;
  return [a1 encodeBytes:&v5 length:16 forKey:a4];
}

- (double)vg_decodeFloat4ForKey:()VG
{
  long long __dst = 0u;
  unint64_t v6 = 0;
  double v3 = (const void *)[a1 decodeBytesForKey:a3 returnedLength:&v6];
  double result = 0.0;
  if (v3)
  {
    if (v6 >= 0x10) {
      size_t v5 = 16;
    }
    else {
      size_t v5 = v6;
    }
    memcpy(&__dst, v3, v5);
    return *(double *)&__dst;
  }
  return result;
}

- (uint64_t)vg_encodeFloat4x4:()VG forKey:
{
  v8[0] = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a5;
  return [a1 encodeBytes:v8 length:64 forKey:a7];
}

- (double)vg_decodeFloat4x4ForKey:()VG
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(__dst, 0, sizeof(__dst));
  unint64_t v6 = 0;
  double v3 = (const void *)[a1 decodeBytesForKey:a3 returnedLength:&v6];
  double result = 0.0;
  if (v3)
  {
    if (v6 >= 0x40) {
      size_t v5 = 64;
    }
    else {
      size_t v5 = v6;
    }
    memcpy(__dst, v3, v5);
    return *(double *)__dst;
  }
  return result;
}

- (uint64_t)vg_encodeFloat3x3:()VG forKey:
{
  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  return [a1 encodeBytes:v7 length:48 forKey:a6];
}

- (double)vg_decodeFloat3x3ForKey:()VG
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(__dst, 0, sizeof(__dst));
  unint64_t v6 = 0;
  double v3 = (const void *)[a1 decodeBytesForKey:a3 returnedLength:&v6];
  double result = 0.0;
  if (v3)
  {
    if (v6 >= 0x30) {
      size_t v5 = 48;
    }
    else {
      size_t v5 = v6;
    }
    memcpy(__dst, v3, v5);
    return *(double *)__dst;
  }
  return result;
}

- (void)vg_encodeUnsignedInteger:()VG forKey:
{
  id v7 = a4;
  unint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  [a1 encodeObject:v6 forKey:v7];
}

- (uint64_t)vg_decodeUnsignedIntegerForKey:()VG
{
  id v4 = a3;
  size_t v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  uint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

- (void)vg_encodeUint64:()VG forKey:
{
  id v7 = a4;
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:a3];
  [a1 encodeObject:v6 forKey:v7];
}

- (uint64_t)vg_decodeUint64ForKey:()VG
{
  id v4 = a3;
  size_t v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  uint64_t v6 = [v5 unsignedLongLongValue];

  return v6;
}

- (void)vg_encodeFloat:()VG forKey:
{
  id v8 = a4;
  *(float *)&double v6 = a2;
  id v7 = [NSNumber numberWithFloat:v6];
  [a1 encodeObject:v7 forKey:v8];
}

- (float)vg_decodeFloatForKey:()VG
{
  id v4 = a3;
  size_t v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (void)vg_encodeSurface:()VG forKey:
{
  id v17 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 encodeObject:v17 forKey:v6];
  }
  else if (v17)
  {
    float v7 = [v17 allAttachments];
    id v8 = [v7 objectForKeyedSubscript:@"CreationProperties"];
    v9 = (void *)[v8 mutableCopy];

    long long v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "bytesPerRow"));
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F0ED50]];

    v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "allocationSize"));
    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263F0ED30]];

    v12 = [v6 stringByAppendingPathExtension:@"surfaceProperties"];
    [a1 encodeObject:v9 forKey:v12];

    [v17 lockWithOptions:1 seed:0];
    id v13 = v17;
    uint64_t v14 = [v13 baseAddress];
    uint64_t v15 = [v13 allocationSize];
    v16 = subkey((NSString *)v6, (objc_selector *)sel_baseAddress);
    [a1 encodeBytes:v14 length:v15 forKey:v16];

    [v13 unlockWithOptions:1 seed:0];
  }
}

- (id)vg_decodeSurfaceForKey:()VG
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    size_t v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  }
  else
  {
    id v6 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
    float v7 = [v6 decodedSurface];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      objc_msgSend(a1, "_vg_decodeSurfaceForKey:", v4);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    size_t v5 = v9;
  }

  return v5;
}

- (id)_vg_decodeSurfaceForKey:()VG
{
  v43[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v41 = 0;
  id v5 = a1;
  id v6 = subkey(v4, (objc_selector *)sel_baseAddress);
  float v7 = (const void *)[v5 decodeBytesForKey:v6 returnedLength:&v41];

  id v8 = [(NSString *)v4 stringByAppendingPathExtension:@"surfaceProperties"];
  int v9 = [v5 containsValueForKey:v8];

  if (v9)
  {
    long long v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [(NSString *)v4 stringByAppendingPathExtension:@"surfaceProperties"];
    v16 = [v5 decodeObjectOfClasses:v14 forKey:v15];
  }
  else
  {
    uint64_t v17 = objc_opt_class();
    v18 = subkey(v4, (objc_selector *)sel_pixelFormat);
    uint64_t v14 = [v5 decodeObjectOfClass:v17 forKey:v18];

    if (!v14) {
      goto LABEL_11;
    }
    v19 = subkey(v4, (objc_selector *)sel_width);
    uint64_t v20 = [v5 decodeIntegerForKey:v19];

    v21 = subkey(v4, (objc_selector *)sel_height);
    uint64_t v22 = [v5 decodeIntegerForKey:v21];

    v23 = subkey(v4, (objc_selector *)sel_bytesPerElement);
    uint64_t v24 = [v5 decodeIntegerForKey:v23];

    v25 = subkey(v4, (objc_selector *)sel_bytesPerRow);
    uint64_t v26 = [v5 decodeIntegerForKey:v25];

    v42[0] = *MEMORY[0x263F0ECF8];
    uint64_t v15 = [NSNumber numberWithInteger:v20];
    v43[0] = v15;
    v42[1] = *MEMORY[0x263F0ECC0];
    v27 = [NSNumber numberWithInteger:v22];
    v43[1] = v27;
    v42[2] = *MEMORY[0x263F0EC98];
    v28 = [NSNumber numberWithUnsignedInteger:v41];
    uint64_t v29 = *MEMORY[0x263F0ECC8];
    v43[2] = v28;
    v43[3] = v14;
    uint64_t v30 = *MEMORY[0x263F0ECA8];
    v42[3] = v29;
    v42[4] = v30;
    v31 = [NSNumber numberWithInteger:v26];
    v43[4] = v31;
    v42[5] = *MEMORY[0x263F0ECA0];
    v32 = [NSNumber numberWithInteger:v24];
    v43[5] = v32;
    v16 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:6];
  }
  v33 = (void *)[objc_alloc(MEMORY[0x263F0ED00]) initWithProperties:v16];
  uint64_t v14 = v33;
  if (v33)
  {
    [v33 lockWithOptions:0 seed:0];
    id v34 = v14;
    v35 = (void *)[v34 baseAddress];
    int64_t v36 = v41;
    uint64_t v37 = [v34 allocationSize];
    if (v37 >= v36) {
      size_t v38 = v36;
    }
    else {
      size_t v38 = v37;
    }
    memcpy(v35, v7, v38);
    [v34 unlockWithOptions:0 seed:0];
    id v39 = v34;
  }

LABEL_11:

  return v14;
}

- (void)vg_encodeArrayOfSurfaces:()VG forKey:
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [v12 count];
  id v8 = [NSString stringWithFormat:@"%@_count", v6];
  objc_msgSend(a1, "vg_encodeUnsignedInteger:forKey:", v7, v8);

  for (unint64_t i = 0; i < [v12 count]; ++i)
  {
    long long v10 = (void *)[[NSString alloc] initWithFormat:@"%@_surface_%lu", v6, i];
    uint64_t v11 = [v12 objectAtIndexedSubscript:i];
    objc_msgSend(a1, "vg_encodeSurface:forKey:", v11, v10);
  }
}

- (id)vg_decodeArrayOfSurfacesForKey:()VG
{
  id v4 = a3;
  id v5 = [NSString stringWithFormat:@"%@_count", v4];
  uint64_t v6 = objc_msgSend(a1, "vg_decodeUnsignedIntegerForKey:", v5);

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v6];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      int v9 = (void *)[[NSString alloc] initWithFormat:@"%@_surface_%lu", v4, i];
      long long v10 = objc_msgSend(a1, "vg_decodeSurfaceForKey:", v9);
      [v7 addObject:v10];
    }
  }

  return v7;
}

- (void)vg_encodeDictionaryOfSurfaces:()VG forKey:
{
  id v15 = a3;
  id v6 = a4;
  uint64_t v7 = [v15 count];
  id v8 = [NSString stringWithFormat:@"%@_count", v6];
  objc_msgSend(a1, "vg_encodeUnsignedInteger:forKey:", v7, v8);

  int v9 = [v15 allKeys];
  for (unint64_t i = 0; i < [v15 count]; ++i)
  {
    uint64_t v11 = [v9 objectAtIndexedSubscript:i];
    id v12 = [v15 objectForKeyedSubscript:v11];
    uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"%@_surface_k_%lu", v6, i];
    uint64_t v14 = (void *)[[NSString alloc] initWithFormat:@"%@_surface_v_%lu", v6, i];
    [a1 encodeObject:v11 forKey:v13];
    objc_msgSend(a1, "vg_encodeSurface:forKey:", v12, v14);
  }
}

- (id)vg_decodeDictionaryOfSurfacesForKey:()VG
{
  id v4 = a3;
  id v5 = [NSString stringWithFormat:@"%@_count", v4];
  uint64_t v6 = objc_msgSend(a1, "vg_decodeUnsignedIntegerForKey:", v5);

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v6];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      int v9 = (void *)[[NSString alloc] initWithFormat:@"%@_surface_k_%lu", v4, i];
      long long v10 = (void *)[[NSString alloc] initWithFormat:@"%@_surface_v_%lu", v4, i];
      uint64_t v11 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v9];
      id v12 = objc_msgSend(a1, "vg_decodeSurfaceForKey:", v10);
      [v7 setObject:v12 forKey:v11];
    }
  }

  return v7;
}

- (void)vg_encodePixelBuffer:()VG forKey:
{
  id v7 = a4;
  uint64_t v6 = CVPixelBufferGetIOSurface(a3);
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F08160] format:@"Only supports IOSurface backed pixel buffers"];
  }
  objc_msgSend(a1, "vg_encodeSurface:forKey:", v6, v7);
}

- (id)vg_decodePixelBufferForKey:()VG
{
  v1 = objc_msgSend(a1, "vg_createDecodedPixelBufferForKey:");

  return v1;
}

- (CVPixelBufferRef)vg_createDecodedPixelBufferForKey:()VG
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_msgSend(a1, "vg_decodeSurfaceForKey:");
  v1 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferRef v5 = 0;
  uint64_t v6 = @"PixelFormatDescription";
  v7[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v2 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v1, v2, &v5);
  CVPixelBufferRef v3 = v5;

  return v3;
}

- (uint64_t)vg_encodeRect:()VG forKey:
{
  a2.n128_f64[1] = a3;
  a4.n128_f64[1] = a5;
  v8[0] = a2;
  v8[1] = a4;
  return [a1 encodeBytes:v8 length:32 forKey:a7];
}

- (__n128)vg_decodeRectForKey:()VG
{
  memset(__dst, 0, sizeof(__dst));
  unint64_t v6 = 0;
  CVPixelBufferRef v3 = (const void *)[a1 decodeBytesForKey:a3 returnedLength:&v6];
  if (v3)
  {
    if (v6 >= 0x20) {
      size_t v4 = 32;
    }
    else {
      size_t v4 = v6;
    }
    memcpy(__dst, v3, v4);
    return (__n128)__dst[0];
  }
  else
  {
    return (__n128)0;
  }
}

- (void)vg_encodeRasterizationRateMapDescriptor:()VG forKey:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = [v6 layerCount];
  id v8 = subkey(v7, (objc_selector *)sel_layerCount);
  objc_msgSend(a1, "vg_encodeUnsignedInteger:forKey:", v23, v8);

  if (v6)
  {
    [v6 screenSize];
    uint64_t v9 = v24;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
  }
  long long v10 = subkey(v7, (objc_selector *)sel_width);
  objc_msgSend(a1, "vg_encodeUnsignedInteger:forKey:", v9, v10);

  if (v6)
  {
    [v6 screenSize];
    uint64_t v11 = v25;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
  }
  id v12 = subkey(v7, (objc_selector *)sel_height);
  objc_msgSend(a1, "vg_encodeUnsignedInteger:forKey:", v11, v12);

  if (v23)
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      uint64_t v14 = (NSString *)[[NSString alloc] initWithFormat:@"%@_layer_%lu", v7, i];
      id v15 = [v6 layers];
      v16 = [v15 objectAtIndexedSubscript:i];

      uint64_t v17 = [v16 horizontalSampleStorage];
      if (v16)
      {
        [v16 sampleCount];
        uint64_t v18 = v24;
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v24 = 0;
        uint64_t v25 = 0;
      }
      v19 = subkey(v14, (objc_selector *)sel_horizontalSampleStorage);
      [a1 encodeBytes:v17 length:4 * v18 forKey:v19];

      uint64_t v20 = [v16 verticalSampleStorage];
      if (v16)
      {
        [v16 sampleCount];
        uint64_t v21 = v25;
      }
      else
      {
        uint64_t v21 = 0;
        uint64_t v24 = 0;
        uint64_t v25 = 0;
      }
      uint64_t v22 = subkey(v14, (objc_selector *)sel_verticalSampleStorage);
      [a1 encodeBytes:v20 length:4 * v21 forKey:v22];
    }
  }
}

- (id)vg_decodeRasterizationRateMapDescriptorForKey:()VG
{
  uint64_t v22 = a3;
  size_t v4 = subkey(v22, (objc_selector *)sel_layerCount);
  uint64_t v5 = objc_msgSend(a1, "vg_decodeUnsignedIntegerForKey:", v4);

  id v6 = subkey(v22, (objc_selector *)sel_width);
  uint64_t v7 = objc_msgSend(a1, "vg_decodeUnsignedIntegerForKey:", v6);

  id v8 = subkey(v22, (objc_selector *)sel_height);
  uint64_t v9 = objc_msgSend(a1, "vg_decodeUnsignedIntegerForKey:", v8);

  id v10 = objc_alloc_init(MEMORY[0x263F12978]);
  v26[0] = v7;
  v26[1] = v9;
  v26[2] = 1;
  [v10 setScreenSize:v26];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v12 = (NSString *)[[NSString alloc] initWithFormat:@"%@_layer_%lu", v22, i];
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      id v13 = a1;
      uint64_t v14 = subkey(v12, (objc_selector *)sel_horizontalSampleStorage);
      uint64_t v15 = [v13 decodeBytesForKey:v14 returnedLength:&v25];

      id v16 = v13;
      uint64_t v17 = subkey(v12, (objc_selector *)sel_verticalSampleStorage);
      uint64_t v18 = [v16 decodeBytesForKey:v17 returnedLength:&v24];

      id v19 = objc_alloc(MEMORY[0x263F12968]);
      v23[0] = v25;
      v23[1] = v24;
      v23[2] = 0;
      uint64_t v20 = (void *)[v19 initWithSampleCount:v23 horizontal:v15 vertical:v18];
      [v10 setLayer:v20 atIndex:i];
    }
  }

  return v10;
}

- (uint64_t)vg_encodeViewport:()VG forKey:
{
  return [a1 encodeBytes:a3 length:48 forKey:a4];
}

- (__n128)vg_decodeViewportForKey:()VG
{
  uint64_t v7 = 0;
  uint64_t v4 = [a1 decodeBytesForKey:a2 returnedLength:&v7];
  long long v5 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)a3 = *(_OWORD *)v4;
  *(_OWORD *)(a3 + 16) = v5;
  __n128 result = *(__n128 *)(v4 + 32);
  *(__n128 *)(a3 + 32) = result;
  return result;
}

@end