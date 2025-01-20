@interface IOSurface(VG)
+ (id)vg_surfaceWithPNGData:()VG;
- (BOOL)vg_convertARGB8888ToPlanarF:()VG;
- (BOOL)vg_scaleToSurface:()VG temporaryBuffer:;
- (IOSurface)vg_copyAlphaFromSurface:()VG;
- (IOSurface)vg_multiplyAlphaFromSurface:()VG;
- (NSObject)vg_convertSurfaceStride:()VG;
- (id)vg_basicProperties;
- (id)vg_copy;
- (id)vg_data;
- (id)vg_emptyLike;
- (id)vg_stack420Yp8_CbCr8ToL008;
- (id)vg_stack444Yp8_CbCr8ToL008;
- (id)vg_toFloat16Surface;
- (id)vg_toFloat32Surface;
- (uint64_t)_scaleToSurface:()VG temporaryBuffer:flags:;
- (uint64_t)debugQuickLookObject;
- (uint64_t)vg_bufferSizeForScalingToSurface:()VG;
- (uint64_t)vg_hasBasicProperties:()VG;
- (uint64_t)vg_vImageBuffer;
- (uint64_t)vg_vImageBufferOfPlaneAtIndex:()VG;
- (uint64_t)vg_vImageBufferWithCropOrigin:()VG cropSize:;
- (void)vg_convert420Yp8_CbCr8ToARGB8888:()VG;
- (void)vg_convert444Yp8_CbCr8FullRangeToARGB8888:()VG;
- (void)vg_convertARGB8888To420Yp8_CbCr8:()VG;
- (void)vg_convertARGB8888To444Yp8_CbCr8FullRange:()VG;
- (void)vg_copyToSurface:()VG;
- (void)vg_cropAndResizeYIntoSurface:()VG origin:size:;
- (void)vg_cropIntoSurface:()VG origin:;
- (void)vg_fillWithData:()VG;
- (void)vg_unstackL008To420Yp8_CbCr8:()VG;
- (void)vg_unstackL008To444Yp8_CbCr8:()VG;
@end

@implementation IOSurface(VG)

- (id)vg_basicProperties
{
  v12[7] = *MEMORY[0x263EF8340];
  v11[0] = *MEMORY[0x263F0ECF8];
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "width"));
  v12[0] = v2;
  v11[1] = *MEMORY[0x263F0ECC0];
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "height"));
  v12[1] = v3;
  v11[2] = *MEMORY[0x263F0ECB8];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "elementWidth"));
  v12[2] = v4;
  v11[3] = *MEMORY[0x263F0ECB0];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "elementHeight"));
  v12[3] = v5;
  v11[4] = *MEMORY[0x263F0ECA0];
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "bytesPerElement"));
  v12[4] = v6;
  v11[5] = *MEMORY[0x263F0ECA8];
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "bytesPerRow"));
  v12[5] = v7;
  v11[6] = *MEMORY[0x263F0ECC8];
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "pixelFormat"));
  v12[6] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:7];

  return v9;
}

- (id)vg_data
{
  uint64_t v2 = [a1 width];
  size_t v3 = [a1 bytesPerElement] * v2;
  uint64_t v4 = [a1 bytesPerRow];
  v5 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", objc_msgSend(a1, "height") * v3);
  [a1 lockWithOptions:1 seed:0];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __24__IOSurface_VG__vg_data__block_invoke;
  v14[3] = &unk_265570218;
  v14[4] = a1;
  v6 = (void (**)(void))MEMORY[0x261227FC0](v14);
  id v7 = a1;
  v8 = (char *)[v7 baseAddress];
  id v9 = v5;
  v10 = (char *)[v9 mutableBytes];
  for (unint64_t i = 0; i < [v7 height]; ++i)
  {
    memcpy(v10, v8, v3);
    v8 += v4;
    v10 += v3;
  }
  id v12 = v9;
  v6[2](v6);

  return v12;
}

- (uint64_t)vg_hasBasicProperties:()VG
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(a1, "vg_basicProperties");
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v6, "objectForKeyedSubscript:", v10, (void)v16);
        id v12 = [v5 objectForKeyedSubscript:v10];
        int v13 = [v11 isEqual:v12];

        if (!v13)
        {
          uint64_t v14 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_11:

  return v14;
}

- (uint64_t)vg_vImageBuffer
{
  id v3 = a1;
  *a2 = [v3 baseAddress];
  a2[1] = [v3 height];
  a2[2] = [v3 width];
  uint64_t result = [v3 bytesPerRow];
  a2[3] = result;
  return result;
}

- (uint64_t)vg_vImageBufferOfPlaneAtIndex:()VG
{
  id v5 = a1;
  *a3 = [v5 baseAddressOfPlaneAtIndex:a2];
  a3[1] = [v5 heightOfPlaneAtIndex:a2];
  a3[2] = [v5 widthOfPlaneAtIndex:a2];
  uint64_t result = [v5 bytesPerRowOfPlaneAtIndex:a2];
  a3[3] = result;
  return result;
}

- (uint64_t)vg_vImageBufferWithCropOrigin:()VG cropSize:
{
  id v7 = a1;
  uint64_t v8 = [v7 baseAddress];
  uint64_t v9 = v8 + [v7 bytesPerRow] * HIWORD(a2);
  *a4 = v9 + [v7 bytesPerElement] * (unsigned __int16)a2;
  a4[1] = HIWORD(a3);
  a4[2] = (unsigned __int16)a3;
  uint64_t result = [v7 bytesPerRow];
  a4[3] = result;
  return result;
}

- (id)vg_copy
{
  uint64_t v2 = [a1 allAttachments];
  id v3 = [v2 objectForKeyedSubscript:@"CreationProperties"];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F0ED00]) initWithProperties:v3];
  objc_msgSend(a1, "vg_copyToSurface:", v4);

  return v4;
}

- (id)vg_emptyLike
{
  id v2 = objc_alloc(MEMORY[0x263F0ED00]);
  id v3 = objc_msgSend(a1, "vg_basicProperties");
  id v4 = (void *)[v2 initWithProperties:v3];

  return v4;
}

- (void)vg_copyToSurface:()VG
{
  id v4 = a3;
  [v4 lockWithOptions:0 seed:0];
  [a1 lockWithOptions:1 seed:0];
  id v11 = v4;
  id v5 = (void *)[v11 baseAddress];
  id v6 = a1;
  id v7 = (const void *)[v6 baseAddress];
  uint64_t v8 = [v6 allocationSize];
  uint64_t v9 = [v11 allocationSize];
  if (v9 >= v8) {
    size_t v10 = v8;
  }
  else {
    size_t v10 = v9;
  }
  memcpy(v5, v7, v10);
  [v6 unlockWithOptions:1 seed:0];
  [v11 unlockWithOptions:0 seed:0];
}

- (void)vg_cropIntoSurface:()VG origin:
{
  id v6 = a3;
  unsigned __int16 v7 = [v6 width];
  unsigned __int16 v8 = [v6 height];
  uint64_t v9 = [v6 bytesPerElement];
  [a1 lockWithOptions:1 seed:0];
  [v6 lockWithOptions:0 seed:0];
  HIWORD(v12) = v8;
  LOWORD(v12) = v7;
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", a4, v12);
  if (v6) {
    objc_msgSend(v6, "vg_vImageBuffer");
  }
  uint64_t v10 = v8;
  if (v8)
  {
    size_t v11 = v9 * v7;
    do
    {
      memcpy(0, 0, v11);
      --v10;
    }
    while (v10);
  }
  [a1 unlockWithOptions:1 seed:0];
  [v6 unlockWithOptions:0 seed:0];
}

- (void)vg_cropAndResizeYIntoSurface:()VG origin:size:
{
  id v8 = a3;
  [a1 lockWithOptions:1 seed:0];
  [v8 lockWithOptions:0 seed:0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__IOSurface_VG__vg_cropAndResizeYIntoSurface_origin_size___block_invoke;
  v17[3] = &unk_265570218;
  v17[4] = a1;
  uint64_t v9 = (void (**)(void))MEMORY[0x261227FC0](v17);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__IOSurface_VG__vg_cropAndResizeYIntoSurface_origin_size___block_invoke_2;
  v15[3] = &unk_265570218;
  id v10 = v8;
  id v16 = v10;
  size_t v11 = (void (**)(void))MEMORY[0x261227FC0](v15);
  memset(&dest, 0, sizeof(dest));
  if (v10) {
    objc_msgSend(v10, "vg_vImageBuffer");
  }
  size_t v12 = [a1 bytesPerRowOfPlaneAtIndex:0];
  v13.data = (void *)([a1 baseAddressOfPlaneAtIndex:0]
                    + v12 * HIWORD(a4)
                    + (unsigned __int16)a4);
  v13.height = HIWORD(a5);
  v13.width = (unsigned __int16)a5;
  v13.rowBytes = v12;
  vImageScale_Planar8(&v13, &dest, 0, 0);
  v11[2](v11);

  v9[2](v9);
}

- (uint64_t)debugQuickLookObject
{
  return [MEMORY[0x263F00650] imageWithIOSurface:a1];
}

- (void)vg_convert420Yp8_CbCr8ToARGB8888:()VG
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x263EFAA38];
  if ([v4 pixelFormat] == 32)
  {
    v6.i64[0] = 0x3000200010000;
  }
  else
  {
    if ([v4 pixelFormat] != 1111970369) {
      goto LABEL_6;
    }
    v6.i64[0] = 0x100020003;
  }
  *(_DWORD *)permuteMap = vmovn_s16(v6).u32[0];
LABEL_6:
  __int32 v7 = [a1 pixelFormat];
  v8.i32[0] = 875704422;
  v9.i32[0] = v7;
  int8x8_t v10 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v9, v8), 0), (int8x8_t)0x1000000FFLL, (int8x8_t)0x10000000EBLL);
  pixelRange.Yp_bias = 16 * (v7 != 875704422);
  pixelRange.CbCr_bias = 128;
  pixelRange.YpRangeMax = v10.i32[0];
  if (v7 == 875704422) {
    int32_t v11 = 255;
  }
  else {
    int32_t v11 = 240;
  }
  pixelRange.CbCrRangeMax = v11;
  *(int8x8_t *)&pixelRange.YpMax = v10;
  pixelRange.CbCrMax = v11;
  pixelRange.CbCrMin = 16 * (v7 != 875704422);
  vImageConvert_YpCbCrToARGB_GenerateConversion(v5, &pixelRange, &outInfo, kvImage420Yp8_CbCr8, kvImageARGB8888, 0);
  [a1 lockWithOptions:1 seed:0];
  [v4 lockWithOptions:0 seed:0];
  memset(&srcYp, 0, sizeof(srcYp));
  objc_msgSend(a1, "vg_vImageBufferOfPlaneAtIndex:", 0);
  memset(&srcCbCr, 0, sizeof(srcCbCr));
  objc_msgSend(a1, "vg_vImageBufferOfPlaneAtIndex:", 1);
  memset(&v12, 0, sizeof(v12));
  if (v4) {
    objc_msgSend(v4, "vg_vImageBuffer", *(_OWORD *)&v12.data, *(_OWORD *)&v12.width);
  }
  vImageConvert_420Yp8_CbCr8ToARGB8888(&srcYp, &srcCbCr, &v12, &outInfo, permuteMap, 0xFFu, 0);
  [v4 unlockWithOptions:0 seed:0];
  [a1 unlockWithOptions:1 seed:0];
}

- (void)vg_convertARGB8888To420Yp8_CbCr8:()VG
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (const vImage_ARGBToYpCbCrMatrix *)*MEMORY[0x263EFAA20];
  if ([a1 pixelFormat] == 32)
  {
    v6.i64[0] = 0x3000200010000;
  }
  else
  {
    if ([a1 pixelFormat] != 1111970369) {
      goto LABEL_6;
    }
    v6.i64[0] = 0x100020003;
  }
  *(_DWORD *)permuteMap = vmovn_s16(v6).u32[0];
LABEL_6:
  __int32 v7 = [v4 pixelFormat];
  v8.i32[0] = 875704422;
  v9.i32[0] = v7;
  int8x8_t v10 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v9, v8), 0), (int8x8_t)0x1000000FFLL, (int8x8_t)0x10000000EBLL);
  pixelRange.Yp_bias = 16 * (v7 != 875704422);
  pixelRange.CbCr_bias = 128;
  pixelRange.YpRangeMax = v10.i32[0];
  if (v7 == 875704422) {
    int32_t v11 = 255;
  }
  else {
    int32_t v11 = 240;
  }
  pixelRange.CbCrRangeMax = v11;
  *(int8x8_t *)&pixelRange.YpMax = v10;
  pixelRange.CbCrMax = v11;
  pixelRange.CbCrMin = 16 * (v7 != 875704422);
  vImageConvert_ARGBToYpCbCr_GenerateConversion(v5, &pixelRange, &outInfo, kvImageARGB8888, kvImage420Yp8_CbCr8, 0);
  [a1 lockWithOptions:1 seed:0];
  [v4 lockWithOptions:0 seed:0];
  memset(&src, 0, sizeof(src));
  objc_msgSend(a1, "vg_vImageBuffer");
  memset(&destYp, 0, sizeof(destYp));
  if (v4)
  {
    objc_msgSend(v4, "vg_vImageBufferOfPlaneAtIndex:", 0);
    objc_msgSend(v4, "vg_vImageBufferOfPlaneAtIndex:", 1, 0, 0, 0, 0, destYp.data, destYp.height, destYp.width, destYp.rowBytes);
  }
  else
  {
    memset(&v12, 0, sizeof(v12));
  }
  vImageConvert_ARGB8888To420Yp8_CbCr8(&src, &destYp, &v12, &outInfo, permuteMap, 0);
  [v4 unlockWithOptions:0 seed:0];
  [a1 unlockWithOptions:1 seed:0];
}

- (void)vg_convert444Yp8_CbCr8FullRangeToARGB8888:()VG
{
  id v4 = a3;
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0, v4);
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __59__IOSurface_VG__vg_convert444Yp8_CbCr8FullRangeToARGB8888___block_invoke;
  v50[3] = &unk_265570218;
  v50[4] = a1;
  v38 = (void (**)(void))MEMORY[0x261227FC0](v50);
  [v4 lockWithOptions:0 seed:0];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __59__IOSurface_VG__vg_convert444Yp8_CbCr8FullRangeToARGB8888___block_invoke_2;
  v48[3] = &unk_265570218;
  id v5 = v4;
  id v49 = v5;
  v39 = (void (**)(void))MEMORY[0x261227FC0](v48);
  int v42 = [a1 bytesPerRowOfPlaneAtIndex:0];
  int v41 = [a1 bytesPerRowOfPlaneAtIndex:1];
  int v40 = [v5 bytesPerRow];
  id v6 = a1;
  uint64_t v46 = [v6 baseAddressOfPlaneAtIndex:0];
  id v47 = v6;
  uint64_t v7 = [v47 baseAddressOfPlaneAtIndex:1];
  id v8 = v5;
  uint64_t v9 = [v8 baseAddress];
  int v10 = 0;
  unsigned int v11 = 0;
  unsigned int v12 = 0;
  unsigned int v13 = 0;
  while ([v47 height] > v13)
  {
    unsigned int v43 = v13;
    unsigned int v44 = v12;
    unsigned int v14 = 0;
    unsigned int v45 = v11;
    while ([v47 width] > v14)
    {
      LOBYTE(v15) = *(unsigned char *)(v46 + v10 + v14);
      LOBYTE(v16) = *(unsigned char *)(v7 + v11);
      LOBYTE(v17) = *(unsigned char *)(v7 + v11 + 1);
      _Q0 = vaddq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)xmmword_260D23E70, (float)v15 * 0.0039216), (float32x4_t)xmmword_260D23E80, (float)v16 * 0.0039216), (float32x4_t)xmmword_260D23E90, (float)v17 * 0.0039216), (float32x4_t)xmmword_260D23EA0);
      _S1 = 1132396544;
      float v20 = vmlas_n_f32(0.5, 255.0, _Q0.f32[0]);
      if (v20 <= 255.0) {
        float v21 = v20;
      }
      else {
        float v21 = 255.0;
      }
      if (v20 >= 0.0) {
        float v22 = v21;
      }
      else {
        float v22 = 0.0;
      }
      __asm { FMLA            S2, S1, V0.S[1] }
      if (_S2 <= 255.0) {
        float v28 = _S2;
      }
      else {
        float v28 = 255.0;
      }
      if (_S2 >= 0.0) {
        float v29 = v28;
      }
      else {
        float v29 = 0.0;
      }
      __asm { FMLA            S2, S1, V0.S[2] }
      if (_S2 <= 255.0) {
        _Q0.f32[0] = _S2;
      }
      else {
        _Q0.f32[0] = 255.0;
      }
      if (_S2 >= 0.0) {
        float v31 = _Q0.f32[0];
      }
      else {
        float v31 = 0.0;
      }
      if (objc_msgSend(v8, "pixelFormat", *(double *)_Q0.i64) == 32) {
        unsigned int v32 = v12 + 1;
      }
      else {
        unsigned int v32 = v12 + 2;
      }
      if ([v8 pixelFormat] == 32) {
        unsigned int v33 = v12 + 2;
      }
      else {
        unsigned int v33 = v12 + 1;
      }
      int v34 = [v8 pixelFormat];
      int v35 = [v8 pixelFormat];
      unsigned int v36 = v12 + 3;
      if (v34 == 32) {
        unsigned int v37 = v12 + 3;
      }
      else {
        unsigned int v37 = v12;
      }
      if (v35 == 32) {
        unsigned int v36 = v12;
      }
      *(unsigned char *)(v9 + v36) = -1;
      *(unsigned char *)(v9 + v32) = (int)v22;
      *(unsigned char *)(v9 + v33) = (int)v29;
      *(unsigned char *)(v9 + v37) = (int)v31;
      ++v14;
      v12 += 4;
      v11 += 2;
    }
    unsigned int v13 = v43 + 1;
    unsigned int v12 = v44 + v40;
    unsigned int v11 = v45 + v41;
    v10 += v42;
  }
  v39[2](v39);

  v38[2](v38);
}

- (void)vg_convertARGB8888To444Yp8_CbCr8FullRange:()VG
{
  id v4 = a3;
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0, v4);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __59__IOSurface_VG__vg_convertARGB8888To444Yp8_CbCr8FullRange___block_invoke;
  v48[3] = &unk_265570218;
  void v48[4] = a1;
  unsigned int v37 = (void (**)(void))MEMORY[0x261227FC0](v48);
  [v4 lockWithOptions:0 seed:0];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __59__IOSurface_VG__vg_convertARGB8888To444Yp8_CbCr8FullRange___block_invoke_2;
  v46[3] = &unk_265570218;
  id v5 = v4;
  id v47 = v5;
  v38 = (void (**)(void))MEMORY[0x261227FC0](v46);
  int v41 = [v5 bytesPerRowOfPlaneAtIndex:0];
  int v40 = [v5 bytesPerRowOfPlaneAtIndex:1];
  int v39 = [a1 bytesPerRow];
  id v6 = v5;
  uint64_t v44 = [v6 baseAddressOfPlaneAtIndex:0];
  id v7 = v6;
  uint64_t v8 = [v7 baseAddressOfPlaneAtIndex:1];
  id v45 = a1;
  uint64_t v9 = [v45 baseAddress];
  int v10 = 0;
  uint64_t v43 = 0;
  int v42 = 1;
  while ([v45 height] > HIDWORD(v43))
  {
    unsigned int v11 = 0;
    unsigned int v12 = v42;
    unsigned int v13 = v43;
    while ([v45 width] > v11)
    {
      if ([v7 pixelFormat] == 32) {
        unsigned int v14 = v13 + 1;
      }
      else {
        unsigned int v14 = v13 + 2;
      }
      if ([v7 pixelFormat] == 32) {
        unsigned int v15 = v13 + 2;
      }
      else {
        unsigned int v15 = v13 + 1;
      }
      int v16 = [v7 pixelFormat];
      int v17 = [v7 pixelFormat];
      unsigned int v22 = v13 + 3;
      if (v16 == 32) {
        unsigned int v23 = v13 + 3;
      }
      else {
        unsigned int v23 = v13;
      }
      if (v17 == 32) {
        unsigned int v22 = v13;
      }
      LOBYTE(v18) = *(unsigned char *)(v9 + v22);
      LOBYTE(v19) = *(unsigned char *)(v9 + v14);
      LOBYTE(v20) = *(unsigned char *)(v9 + v15);
      LOBYTE(v21) = *(unsigned char *)(v9 + v23);
      _Q1 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)xmmword_260D23EB0, (float)v19 * 0.0039216), (float32x4_t)xmmword_260D23EC0, (float)v20 * 0.0039216), (float32x4_t)xmmword_260D23ED0, (float)v21 * 0.0039216), (float32x4_t)xmmword_260D23EE0, (float)v18 * 0.0039216);
      _S0 = 255.0;
      float v26 = vmlas_n_f32(0.5, 255.0, _Q1.f32[0]);
      if (v26 <= 255.0) {
        float v27 = v26;
      }
      else {
        float v27 = 255.0;
      }
      if (v26 >= 0.0) {
        float v28 = v27;
      }
      else {
        float v28 = 0.0;
      }
      *(unsigned char *)(v44 + v10 + v11) = (int)v28;
      __asm { FMLA            S2, S0, V1.S[1] }
      if (_S2 <= 255.0) {
        float v34 = _S2;
      }
      else {
        float v34 = 255.0;
      }
      if (_S2 >= 0.0) {
        float v35 = v34;
      }
      else {
        float v35 = 0.0;
      }
      *(unsigned char *)(v8 + v12 - 1) = (int)v35;
      __asm { FMLA            S2, S0, V1.S[2] }
      if (_S2 <= 255.0) {
        _S0 = _S2;
      }
      if (_S2 < 0.0) {
        _S0 = 0.0;
      }
      *(unsigned char *)(v8 + v12) = (int)_S0;
      ++v11;
      v12 += 2;
      v13 += 4;
    }
    v42 += v40;
    LODWORD(v43) = v43 + v39;
    ++HIDWORD(v43);
    v10 += v41;
  }
  v38[2](v38);

  v37[2](v37);
}

- (BOOL)vg_convertARGB8888ToPlanarF:()VG
{
  if ([a1 pixelFormat] != 32
    && [a1 pixelFormat] != 1111970369
    && [a1 pixelFormat] != 1380401729)
  {
    return 0;
  }
  [a1 lockWithOptions:1 seed:0];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__IOSurface_VG__vg_convertARGB8888ToPlanarF___block_invoke;
  v14[3] = &unk_265570218;
  v14[4] = a1;
  id v5 = (void (**)(void))MEMORY[0x261227FC0](v14);
  long long v12 = 0u;
  long long v13 = 0u;
  objc_msgSend(a1, "vg_vImageBuffer");
  *(_OWORD *)&src.data = v12;
  src.rowBytes = *((void *)&v13 + 1);
  src.width = 4 * v13;
  long long v6 = a3[1];
  *(_OWORD *)&v10.data = *a3;
  v10.rowBytes = *((void *)&v6 + 1);
  v10.width = 4 * v6;
  vImage_Error v7 = vImageConvert_Planar8toPlanarF(&src, &v10, 255.0, 0.0, 0x100u);
  v5[2](v5);
  BOOL v8 = v7 == 0;

  return v8;
}

- (id)vg_toFloat32Surface
{
  v20[4] = *MEMORY[0x263EF8340];
  if ([a1 pixelFormat] == 1278226534
    || [a1 pixelFormat] == 1717855600)
  {
    id v2 = a1;
  }
  else if ([a1 pixelFormat] == 1278226536 {
         || [a1 pixelFormat] == 1751410032)
  }
  {
    id v4 = objc_alloc(MEMORY[0x263F0ED00]);
    v19[0] = *MEMORY[0x263F0ECF8];
    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "width"));
    v20[0] = v5;
    v19[1] = *MEMORY[0x263F0ECC0];
    long long v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "height"));
    uint64_t v7 = *MEMORY[0x263F0ECC8];
    v20[1] = v6;
    v20[2] = &unk_270CFDC78;
    uint64_t v8 = *MEMORY[0x263F0ECA0];
    v19[2] = v7;
    v19[3] = v8;
    v20[3] = &unk_270CFDC90;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
    vImage_Buffer v10 = (void *)[v4 initWithProperties:v9];

    [v10 lockWithOptions:0 seed:0];
    [a1 lockWithOptions:1 seed:0];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __36__IOSurface_VG__vg_toFloat32Surface__block_invoke;
    v17[3] = &unk_265570218;
    id v11 = v10;
    id v18 = v11;
    long long v12 = (void (**)(void))MEMORY[0x261227FC0](v17);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __36__IOSurface_VG__vg_toFloat32Surface__block_invoke_2;
    v16[3] = &unk_265570218;
    v16[4] = a1;
    long long v13 = (void (**)(void))MEMORY[0x261227FC0](v16);
    memset(&src, 0, sizeof(src));
    objc_msgSend(a1, "vg_vImageBuffer");
    memset(&v14, 0, sizeof(v14));
    if (v11) {
      objc_msgSend(v11, "vg_vImageBuffer", *(_OWORD *)&v14.data, *(_OWORD *)&v14.width);
    }
    if (vImageConvert_Planar16FtoPlanarF(&src, &v14, 0)) {
      id v2 = 0;
    }
    else {
      id v2 = v11;
    }
    v13[2](v13);

    v12[2](v12);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)vg_toFloat16Surface
{
  v20[4] = *MEMORY[0x263EF8340];
  if ([a1 pixelFormat] == 1278226536
    || [a1 pixelFormat] == 1751410032)
  {
    id v2 = a1;
  }
  else if ([a1 pixelFormat] == 1278226534 {
         || [a1 pixelFormat] == 1717855600)
  }
  {
    id v4 = objc_alloc(MEMORY[0x263F0ED00]);
    v19[0] = *MEMORY[0x263F0ECF8];
    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "width"));
    v20[0] = v5;
    v19[1] = *MEMORY[0x263F0ECC0];
    long long v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "height"));
    uint64_t v7 = *MEMORY[0x263F0ECC8];
    v20[1] = v6;
    v20[2] = &unk_270CFDCA8;
    uint64_t v8 = *MEMORY[0x263F0ECA0];
    v19[2] = v7;
    v19[3] = v8;
    v20[3] = &unk_270CFDCC0;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
    vImage_Buffer v10 = (void *)[v4 initWithProperties:v9];

    [v10 lockWithOptions:0 seed:0];
    [a1 lockWithOptions:1 seed:0];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __36__IOSurface_VG__vg_toFloat16Surface__block_invoke;
    v17[3] = &unk_265570218;
    id v11 = v10;
    id v18 = v11;
    long long v12 = (void (**)(void))MEMORY[0x261227FC0](v17);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __36__IOSurface_VG__vg_toFloat16Surface__block_invoke_2;
    v16[3] = &unk_265570218;
    v16[4] = a1;
    long long v13 = (void (**)(void))MEMORY[0x261227FC0](v16);
    memset(&src, 0, sizeof(src));
    objc_msgSend(a1, "vg_vImageBuffer");
    memset(&v14, 0, sizeof(v14));
    if (v11) {
      objc_msgSend(v11, "vg_vImageBuffer", *(_OWORD *)&v14.data, *(_OWORD *)&v14.width);
    }
    if (vImageConvert_PlanarFtoPlanar16F(&src, &v14, 0)) {
      id v2 = 0;
    }
    else {
      id v2 = v11;
    }
    v13[2](v13);

    v12[2](v12);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (NSObject)vg_convertSurfaceStride:()VG
{
  v33[5] = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 width];
  if ([a1 bytesPerElement] * v5 <= a3)
  {
    id v8 = objc_alloc(MEMORY[0x263F0ED00]);
    v32[0] = *MEMORY[0x263F0ECF8];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "width"));
    v33[0] = v9;
    v32[1] = *MEMORY[0x263F0ECC0];
    vImage_Buffer v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "height"));
    v33[1] = v10;
    v32[2] = *MEMORY[0x263F0ECC8];
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "pixelFormat"));
    v33[2] = v11;
    v32[3] = *MEMORY[0x263F0ECA0];
    long long v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "bytesPerElement"));
    v33[3] = v12;
    v32[4] = *MEMORY[0x263F0ECA8];
    long long v13 = [NSNumber numberWithUnsignedLong:a3];
    v33[4] = v13;
    vImage_Buffer v14 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];
    unsigned int v15 = (void *)[v8 initWithProperties:v14];

    [v15 lockWithOptions:0 seed:0];
    [a1 lockWithOptions:1 seed:0];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __41__IOSurface_VG__vg_convertSurfaceStride___block_invoke;
    v29[3] = &unk_265570218;
    id v16 = v15;
    id v30 = v16;
    int v17 = (void (**)(void))MEMORY[0x261227FC0](v29);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __41__IOSurface_VG__vg_convertSurfaceStride___block_invoke_2;
    v28[3] = &unk_265570218;
    v28[4] = a1;
    id v18 = (void (**)(void))MEMORY[0x261227FC0](v28);
    id v19 = a1;
    unsigned int v20 = (char *)[v19 baseAddress];
    id v21 = v16;
    unsigned int v22 = (char *)[v21 baseAddress];
    unint64_t v23 = [v19 bytesPerRow];
    unint64_t v24 = v23;
    unint64_t v25 = 0;
    if (v23 >= a3) {
      size_t v26 = a3;
    }
    else {
      size_t v26 = v23;
    }
    while (v25 < [v19 height])
    {
      memcpy(v22, v20, v26);
      ++v25;
      v22 += a3;
      v20 += v24;
    }
    long long v6 = v21;
    v18[2](v18);

    v17[2](v17);
    uint64_t v7 = v6;
  }
  else
  {
    long long v6 = __VGLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_260C8D000, v6, OS_LOG_TYPE_ERROR, " Invalid stride size. ", buf, 2u);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (IOSurface)vg_multiplyAlphaFromSurface:()VG
{
  id v4 = a3;
  uint64_t v5 = [(IOSurface *)a1 vg_emptyLike];
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v19, v4, 1);
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v18, a1, 1);
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v17, v5, 0);
  for (uint64_t i = 0; i < [(IOSurface *)a1 height]; ++i)
  {
    for (uint64_t j = 0; j < [(IOSurface *)a1 width]; ++j)
    {
      uint64_t v9 = (char *)v18[2] + (uint64_t)v18[3] * i + (uint64_t)v18[4] * j;
      vImage_Buffer v10 = (char *)v17[2] + (uint64_t)v17[3] * i + (uint64_t)v17[4] * j;
      LOBYTE(v8) = *((unsigned char *)v19[2] + (uint64_t)v19[3] * i + (uint64_t)v19[4] * j);
      unsigned int v11 = 1132396544;
      float v12 = (float)v8 / 255.0;
      if (v12 > 1.0) {
        float v12 = 1.0;
      }
      LOBYTE(v11) = *v9;
      *(float *)&unsigned int v13 = v12 * (float)v11;
      char *v10 = (int)*(float *)&v13;
      LOBYTE(v13) = v9[1];
      *(float *)&unsigned int v14 = v12 * (float)v13;
      v10[1] = (int)*(float *)&v14;
      LOBYTE(v14) = v9[2];
      *(float *)&unsigned int v15 = v12 * (float)v14;
      v10[2] = (int)*(float *)&v15;
      LOBYTE(v15) = v9[3];
      v10[3] = (int)(float)(v12 * (float)v15);
    }
  }
  vg::IOSurfaceData::~IOSurfaceData(v17);
  vg::IOSurfaceData::~IOSurfaceData(v18);
  vg::IOSurfaceData::~IOSurfaceData(v19);

  return v5;
}

- (IOSurface)vg_copyAlphaFromSurface:()VG
{
  id v4 = a3;
  uint64_t v5 = [(IOSurface *)a1 vg_emptyLike];
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v16, v4, 1);
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v15, a1, 1);
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v14, v5, 0);
  for (uint64_t i = 0; i < [(IOSurface *)a1 height]; ++i)
  {
    for (uint64_t j = 0; j < [(IOSurface *)a1 width]; ++j)
    {
      uint64_t v9 = (char *)v15[2] + (uint64_t)v15[3] * i + (uint64_t)v15[4] * j;
      vImage_Buffer v10 = (char *)v14[2] + (uint64_t)v14[3] * i + (uint64_t)v14[4] * j;
      LOBYTE(v8) = *((unsigned char *)v16[2] + (uint64_t)v16[3] * i + (uint64_t)v16[4] * j);
      unsigned int v11 = 1132396544;
      float v12 = (float)v8 / 255.0;
      if (v12 > 1.0) {
        float v12 = 1.0;
      }
      LOBYTE(v11) = *v9;
      char *v10 = (int)(float)(v12 * (float)v11);
      v10[1] = v9[1];
      v10[2] = v9[2];
      v10[3] = v9[3];
    }
  }
  vg::IOSurfaceData::~IOSurfaceData(v14);
  vg::IOSurfaceData::~IOSurfaceData(v15);
  vg::IOSurfaceData::~IOSurfaceData(v16);

  return v5;
}

- (id)vg_stack420Yp8_CbCr8ToL008
{
  v39[4] = *MEMORY[0x263EF8340];
  [a1 lockWithOptions:1 seed:0];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __43__IOSurface_VG__vg_stack420Yp8_CbCr8ToL008__block_invoke;
  v37[3] = &unk_265570218;
  v37[4] = a1;
  id v2 = (void (**)(void))MEMORY[0x261227FC0](v37);
  memset(&src, 0, sizeof(src));
  objc_msgSend(a1, "vg_vImageBufferOfPlaneAtIndex:", 0);
  long long v34 = 0u;
  long long v35 = 0u;
  objc_msgSend(a1, "vg_vImageBufferOfPlaneAtIndex:", 1);
  unsigned __int16 height = src.height;
  __int16 width = src.width;
  unsigned __int16 v5 = WORD4(v34);
  unsigned __int16 v4 = v35;
  id v6 = objc_alloc(MEMORY[0x263F0ED00]);
  v38[0] = *MEMORY[0x263F0ECF8];
  uint64_t v7 = [NSNumber numberWithInt:2 * v4];
  v39[0] = v7;
  v38[1] = *MEMORY[0x263F0ECC0];
  unsigned int v8 = [NSNumber numberWithInt:v5 + height];
  uint64_t v9 = *MEMORY[0x263F0ECC8];
  v39[1] = v8;
  v39[2] = &unk_270CFDCD8;
  uint64_t v10 = *MEMORY[0x263F0ECA0];
  v38[2] = v9;
  v38[3] = v10;
  v39[3] = &unk_270CFDCF0;
  unsigned int v11 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
  float v12 = (void *)[v6 initWithProperties:v11];

  [v12 lockWithOptions:0 seed:0];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __43__IOSurface_VG__vg_stack420Yp8_CbCr8ToL008__block_invoke_18;
  v32[3] = &unk_265570218;
  id v13 = v12;
  id v33 = v13;
  unsigned int v14 = (void (**)(void))MEMORY[0x261227FC0](v32);
  memset(&dest, 0, sizeof(dest));
  if (v13)
  {
    HIWORD(v29) = height;
    LOWORD(v29) = width;
    objc_msgSend(v13, "vg_vImageBufferWithCropOrigin:cropSize:", 0, v29);
  }
  vImageCopyBuffer(&src, &dest, 1uLL, 0);
  if (v13)
  {
    HIWORD(v28) = height;
    LOWORD(v28) = 0;
    HIWORD(v27) = v5;
    LOWORD(v27) = v4;
    objc_msgSend(v13, "vg_vImageBufferWithCropOrigin:cropSize:", v28, v27);
    long long v30 = 0u;
    LOWORD(v26) = v4;
    HIWORD(v26) = height;
    objc_msgSend(v13, "vg_vImageBufferWithCropOrigin:cropSize:", v26, v27);
  }
  else
  {
    *((void *)&v30 + 1) = 0;
  }
  unint64_t v15 = *((void *)&v34 + 1);
  if (*((void *)&v34 + 1))
  {
    unint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = v34;
    uint64_t v19 = v35;
    do
    {
      if (v19)
      {
        unsigned int v20 = 0;
        id v21 = (char *)(v18 + 1);
        do
        {
          *unsigned int v20 = *(v21 - 1);
          char v22 = *v21;
          v21 += 2;
          (v20++)[v17] = v22;
          uint64_t v19 = v35;
        }
        while ((unint64_t)v20 < (unint64_t)v35);
        unint64_t v15 = *((void *)&v34 + 1);
      }
      v18 += *((void *)&v35 + 1);
      v17 += *((void *)&v30 + 1);
      ++v16;
    }
    while (v16 < v15);
  }
  id v23 = v13;
  v14[2](v14);

  v2[2](v2);

  return v23;
}

- (void)vg_unstackL008To420Yp8_CbCr8:()VG
{
  id v4 = a3;
  [a1 lockWithOptions:1 seed:0];
  [v4 lockWithOptions:0 seed:0];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __46__IOSurface_VG__vg_unstackL008To420Yp8_CbCr8___block_invoke;
  v22[3] = &unk_265570218;
  v22[4] = a1;
  unsigned __int16 v5 = (void (**)(void))MEMORY[0x261227FC0](v22);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __46__IOSurface_VG__vg_unstackL008To420Yp8_CbCr8___block_invoke_2;
  v20[3] = &unk_265570218;
  id v6 = v4;
  id v21 = v6;
  uint64_t v7 = (void (**)(void))MEMORY[0x261227FC0](v20);
  long long v8 = 0uLL;
  memset(&dest, 0, sizeof(dest));
  if (v6)
  {
    objc_msgSend(v6, "vg_vImageBufferOfPlaneAtIndex:", 0);
    long long v17 = 0u;
    long long v18 = 0u;
    objc_msgSend(v6, "vg_vImageBufferOfPlaneAtIndex:", 1);
    *((void *)&v8 + 1) = dest.width;
    *(int32x2_t *)&long long v8 = vmovn_s64(*(int64x2_t *)&dest.height);
  }
  else
  {
    long long v17 = 0uLL;
    long long v18 = 0uLL;
  }
  long long v11 = v8;
  int32x2_t v9 = vrev64_s32(*(int32x2_t *)&v8);
  HIWORD(v15) = v9.i16[2];
  LOWORD(v15) = v9.i16[0];
  memset(&src, 0, sizeof(src));
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", 0, v15, (void)v11);
  vImageCopyBuffer(&src, &dest, 1uLL, 0);
  LOWORD(v14) = 0;
  int32x2_t v10 = vzip1_s32(0, *(int32x2_t *)&v11);
  HIWORD(v14) = v10.i16[2];
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", v14, 0, *(void *)&v10, *((void *)&v11 + 1));
  LOWORD(v13) = 0;
  HIWORD(v13) = v12;
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", v13, 0);
  v7[2](v7);

  v5[2](v5);
}

- (id)vg_stack444Yp8_CbCr8ToL008
{
  v39[4] = *MEMORY[0x263EF8340];
  [a1 lockWithOptions:1 seed:0];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __43__IOSurface_VG__vg_stack444Yp8_CbCr8ToL008__block_invoke;
  v37[3] = &unk_265570218;
  v37[4] = a1;
  id v2 = (void (**)(void))MEMORY[0x261227FC0](v37);
  memset(&src, 0, sizeof(src));
  objc_msgSend(a1, "vg_vImageBufferOfPlaneAtIndex:", 0);
  long long v34 = 0u;
  long long v35 = 0u;
  objc_msgSend(a1, "vg_vImageBufferOfPlaneAtIndex:", 1);
  unsigned __int16 width = src.width;
  unsigned __int16 height = src.height;
  LOWORD(v5) = v35;
  WORD2(v5) = WORD4(v34);
  uint64_t v25 = v5;
  id v6 = objc_alloc(MEMORY[0x263F0ED00]);
  v38[0] = *MEMORY[0x263F0ECF8];
  uint64_t v7 = [NSNumber numberWithUnsignedShort:width];
  v39[0] = v7;
  v38[1] = *MEMORY[0x263F0ECC0];
  long long v8 = [NSNumber numberWithInt:3 * height];
  uint64_t v9 = *MEMORY[0x263F0ECC8];
  v39[1] = v8;
  v39[2] = &unk_270CFDCD8;
  uint64_t v10 = *MEMORY[0x263F0ECA0];
  v38[2] = v9;
  v38[3] = v10;
  v39[3] = &unk_270CFDCF0;
  long long v11 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
  __int16 v12 = (void *)[v6 initWithProperties:v11];

  [v12 lockWithOptions:0 seed:0];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __43__IOSurface_VG__vg_stack444Yp8_CbCr8ToL008__block_invoke_2;
  v32[3] = &unk_265570218;
  id v13 = v12;
  id v33 = v13;
  unsigned int v14 = (void (**)(void))MEMORY[0x261227FC0](v32);
  memset(&dest, 0, sizeof(dest));
  if (v13)
  {
    HIWORD(v29) = height;
    LOWORD(v29) = width;
    objc_msgSend(v13, "vg_vImageBufferWithCropOrigin:cropSize:", 0, v29);
  }
  vImageCopyBuffer(&src, &dest, 1uLL, 0);
  if (v13)
  {
    HIWORD(v28) = height;
    LOWORD(v28) = 0;
    HIWORD(v27) = WORD2(v25);
    LOWORD(v27) = v25;
    objc_msgSend(v13, "vg_vImageBufferWithCropOrigin:cropSize:", v28, v27);
    long long v30 = 0u;
    HIWORD(v26) = 2 * height;
    LOWORD(v26) = 0;
    objc_msgSend(v13, "vg_vImageBufferWithCropOrigin:cropSize:", v26, v27);
  }
  else
  {
    *((void *)&v30 + 1) = 0;
  }
  unint64_t v15 = *((void *)&v34 + 1);
  if (*((void *)&v34 + 1))
  {
    unint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = v34;
    uint64_t v19 = v35;
    do
    {
      if (v19)
      {
        unsigned int v20 = 0;
        id v21 = (char *)(v18 + 1);
        do
        {
          *unsigned int v20 = *(v21 - 1);
          char v22 = *v21;
          v21 += 2;
          (v20++)[v17] = v22;
          uint64_t v19 = v35;
        }
        while ((unint64_t)v20 < (unint64_t)v35);
        unint64_t v15 = *((void *)&v34 + 1);
      }
      v18 += *((void *)&v35 + 1);
      v17 += *((void *)&v30 + 1);
      ++v16;
    }
    while (v16 < v15);
  }
  id v23 = v13;
  v14[2](v14);

  v2[2](v2);

  return v23;
}

- (void)vg_unstackL008To444Yp8_CbCr8:()VG
{
  id v4 = a3;
  [a1 lockWithOptions:1 seed:0];
  [v4 lockWithOptions:0 seed:0];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __46__IOSurface_VG__vg_unstackL008To444Yp8_CbCr8___block_invoke;
  v22[3] = &unk_265570218;
  v22[4] = a1;
  uint64_t v5 = (void (**)(void))MEMORY[0x261227FC0](v22);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __46__IOSurface_VG__vg_unstackL008To444Yp8_CbCr8___block_invoke_2;
  v20[3] = &unk_265570218;
  id v6 = v4;
  id v21 = v6;
  uint64_t v7 = (void (**)(void))MEMORY[0x261227FC0](v20);
  long long v8 = 0uLL;
  memset(&dest, 0, sizeof(dest));
  if (v6)
  {
    objc_msgSend(v6, "vg_vImageBufferOfPlaneAtIndex:", 0);
    long long v17 = 0u;
    long long v18 = 0u;
    objc_msgSend(v6, "vg_vImageBufferOfPlaneAtIndex:", 1);
    *(int32x2_t *)&long long v8 = vmovn_s64(*(int64x2_t *)&dest.height);
  }
  else
  {
    long long v17 = 0uLL;
    long long v18 = 0uLL;
  }
  int32x2_t v12 = (int32x2_t)v8;
  int32x2_t v9 = vrev64_s32(*(int32x2_t *)&v8);
  HIWORD(v15) = v9.i16[2];
  LOWORD(v15) = v9.i16[0];
  memset(&src, 0, sizeof(src));
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", 0, v15);
  vImageCopyBuffer(&src, &dest, 1uLL, 0);
  LOWORD(v14) = 0;
  int32x2_t v10 = vzip1_s32(0, v12);
  __int16 v11 = v10.i16[0];
  HIWORD(v14) = v10.i16[2];
  HIWORD(v13) = 0;
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", v14, 0);
  LOWORD(v13) = v11;
  *(_DWORD *)((char *)&v13 + 2) = (unsigned __int16)(2 * v12.i16[0]);
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", v13, HIDWORD(v13));
  v7[2](v7);

  v5[2](v5);
}

- (void)vg_fillWithData:()VG
{
  id v4 = a3;
  uint64_t v5 = [a1 width];
  uint64_t v6 = [a1 bytesPerElement];
  uint64_t v7 = [a1 bytesPerRow];
  [a1 lockWithOptions:0 seed:0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __33__IOSurface_VG__vg_fillWithData___block_invoke;
  v15[3] = &unk_265570218;
  void v15[4] = a1;
  long long v8 = (void (**)(void))MEMORY[0x261227FC0](v15);
  id v9 = v4;
  int32x2_t v10 = (char *)[v9 bytes];
  id v11 = a1;
  int32x2_t v12 = (char *)[v11 baseAddress];
  unint64_t v13 = 0;
  size_t v14 = v6 * v5;
  while (v13 < [v11 height])
  {
    memcpy(v12, v10, v14);
    ++v13;
    v10 += v14;
    v12 += v7;
  }
  v8[2](v8);
}

+ (id)vg_surfaceWithPNGData:()VG
{
  v71[1] = *MEMORY[0x263EF8340];
  CFDataRef data = a3;
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v70 = *MEMORY[0x263F0F600];
  v71[0] = MEMORY[0x263EFFA80];
  id v4 = [NSDictionary dictionaryWithObjects:v71 forKeys:&v70 count:1];
  uint64_t v5 = (void *)[v3 initWithDictionary:v4];

  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kCGImageSourceCreateUnpremultipliedPNG"];
  CGImageSourceRef v6 = CGImageSourceCreateWithData(data, (CFDictionaryRef)v5);
  uint64_t v7 = (CGImageSource *)CFAutorelease(v6);
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, (CFDictionaryRef)v5);
  id v9 = (CGImage *)CFAutorelease(ImageAtIndex);
  DataProvider = CGImageGetDataProvider(v9);
  CFDataRef v11 = CGDataProviderCopyData(DataProvider);
  CFDataRef v12 = (const __CFData *)CFAutorelease(v11);
  CFDictionaryRef v13 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
  CFAutorelease(v13);
  v57 = CFDataRef theData = v12;
  size_t v14 = [v57 objectForKeyedSubscript:*MEMORY[0x263F0F248]];
  unsigned int v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F0F2C0]];

  if (!v15) {
    goto LABEL_3;
  }
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v15 options:0];
  long long v17 = (void *)MEMORY[0x263EFFA08];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  id v21 = objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
  id v65 = 0;
  char v22 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v21 fromData:v16 error:&v65];
  id v23 = v65;

  if (!v22)
  {
LABEL_3:
    ColorSpace = CGImageGetColorSpace(v9);
    CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
    size_t BitsPerPixel = CGImageGetBitsPerPixel(v9);
    size_t v27 = BitsPerPixel;
    uint64_t v28 = 1278226488;
    if (Model || BitsPerPixel != 8)
    {
      if (Model || BitsPerPixel != 16)
      {
        if (BitsPerPixel == 32 && Model == kCGColorSpaceModelRGB) {
          uint64_t v28 = 1380401729;
        }
        else {
          uint64_t v28 = 0;
        }
      }
      else
      {
        uint64_t v28 = 1278226742;
      }
    }
    v68[0] = *MEMORY[0x263F0ECF8];
    long long v30 = [NSNumber numberWithUnsignedLong:CGImageGetWidth(v9)];
    v69[0] = v30;
    v68[1] = *MEMORY[0x263F0ECC0];
    float v31 = [NSNumber numberWithUnsignedLong:CGImageGetHeight(v9)];
    v69[1] = v31;
    v68[2] = *MEMORY[0x263F0ECC8];
    unsigned int v32 = [NSNumber numberWithUnsignedInt:v28];
    v69[2] = v32;
    v68[3] = *MEMORY[0x263F0ECA0];
    id v33 = [NSNumber numberWithUnsignedLong:v27 >> 3];
    v69[3] = v33;
    char v22 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:4];
  }
  long long v34 = (void *)[objc_alloc(MEMORY[0x263F0ED00]) initWithProperties:v22];
  int v35 = [v34 pixelFormat];
  if (v35 == 32) {
    goto LABEL_18;
  }
  if (v35 != 875704422)
  {
    if (v35 != 1111970369)
    {
      objc_msgSend(v34, "vg_fillWithData:", theData);
      goto LABEL_35;
    }
LABEL_18:
    src.CFDataRef data = (void *)CFDataGetBytePtr(theData);
    src.unsigned __int16 height = [v34 height];
    src.unsigned __int16 width = [v34 width];
    uint64_t v36 = [v34 width];
    src.rowBytes = [v34 bytesPerElement] * v36;
    [v34 lockWithOptions:0 seed:0];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __39__IOSurface_VG__vg_surfaceWithPNGData___block_invoke;
    v62[3] = &unk_265570218;
    id v37 = v34;
    id v63 = v37;
    v38 = (void (**)(void))MEMORY[0x261227FC0](v62);
    memset(&dest, 0, sizeof(dest));
    if (v37) {
      objc_msgSend(v37, "vg_vImageBuffer");
    }
    if ([v37 pixelFormat] == 32)
    {
      v39.i64[0] = 0x2000100000003;
    }
    else
    {
      if ([v37 pixelFormat] != 1111970369)
      {
LABEL_28:
        vImagePermuteChannels_ARGB8888(&src, &dest, permuteMap, 0x10u);
        v38[2](v38);

        goto LABEL_35;
      }
      v39.i64[0] = 0x3000000010002;
    }
    *(_DWORD *)permuteMap = vmovn_s16(v39).u32[0];
    goto LABEL_28;
  }
  id v40 = objc_alloc(MEMORY[0x263F0ED00]);
  v66[0] = *MEMORY[0x263F0ECF8];
  int v41 = NSNumber;
  if ([v34 width])
  {
    uint64_t v43 = [v34 width];
    uint64_t v44 = [v34 width];
    uint64_t v45 = v44 & 1;
    if (v44 < 0) {
      uint64_t v45 = -v45;
    }
    uint64_t v42 = v43 - v45 + 2;
  }
  else
  {
    uint64_t v42 = [v34 width];
  }
  uint64_t v46 = [v41 numberWithInteger:v42];
  v67[0] = v46;
  v66[1] = *MEMORY[0x263F0ECC0];
  id v47 = NSNumber;
  uint64_t v48 = [v34 height];
  uint64_t v49 = [v34 height];
  uint64_t v50 = v49 + 2;
  if (v49 >= -1) {
    uint64_t v50 = v49 + 1;
  }
  v51 = [v47 numberWithInteger:v48 + (v50 >> 1)];
  uint64_t v52 = *MEMORY[0x263F0ECC8];
  v67[1] = v51;
  v67[2] = &unk_270CFDCD8;
  uint64_t v53 = *MEMORY[0x263F0ECA0];
  v66[2] = v52;
  v66[3] = v53;
  v67[3] = &unk_270CFDCF0;
  v54 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:4];
  v55 = (void *)[v40 initWithProperties:v54];

  objc_msgSend(v55, "vg_fillWithData:", theData);
  objc_msgSend(v55, "vg_unstackL008To420Yp8_CbCr8:", v34);

LABEL_35:

  return v34;
}

- (BOOL)vg_scaleToSurface:()VG temporaryBuffer:
{
  return [a1 _scaleToSurface:a3 temporaryBuffer:a4 flags:0] == 0;
}

- (uint64_t)vg_bufferSizeForScalingToSurface:()VG
{
  return [a1 _scaleToSurface:a3 temporaryBuffer:0 flags:128];
}

- (uint64_t)_scaleToSurface:()VG temporaryBuffer:flags:
{
  long long v8 = a3;
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v17, a1, 1);
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v16, v8, 0);
  memset(&src, 0, sizeof(src));
  [(IOSurface *)a1 vg_vImageBuffer];
  memset(&v14, 0, sizeof(v14));
  if (v8) {
    [(IOSurface *)v8 vg_vImageBuffer];
  }
  int v9 = [(IOSurface *)a1 pixelFormat];
  uint64_t v10 = -21778;
  if (v9 > 1278226533)
  {
    if (v9 <= 1380401728)
    {
      if (v9 != 1278226534)
      {
        int v11 = 1278226536;
LABEL_14:
        if (v9 == v11)
        {
          vImage_Error v12 = vImageScale_Planar16F(&src, &v14, a4, a5);
LABEL_21:
          uint64_t v10 = v12;
          goto LABEL_22;
        }
        goto LABEL_22;
      }
LABEL_20:
      vImage_Error v12 = vImageScale_PlanarF(&src, &v14, a4, a5);
      goto LABEL_21;
    }
    if (v9 != 1380401729)
    {
      if (v9 != 1717855600)
      {
        int v11 = 1751410032;
        goto LABEL_14;
      }
      goto LABEL_20;
    }
LABEL_19:
    vImage_Error v12 = vImageScale_ARGB8888(&src, &v14, a4, a5);
    goto LABEL_21;
  }
  if (v9 <= 1111970368)
  {
    if (v9 != 32 && v9 != 1094862674) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  if (v9 == 1111970369) {
    goto LABEL_19;
  }
  if (v9 == 1278226488)
  {
    vImage_Error v12 = vImageScale_Planar8(&src, &v14, a4, a5);
    goto LABEL_21;
  }
LABEL_22:
  vg::IOSurfaceData::~IOSurfaceData(v16);
  vg::IOSurfaceData::~IOSurfaceData(v17);

  return v10;
}

@end