@interface SoftISPInputFrame
- (BOOL)processed;
- (SoftISPInputFrame)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 uniqueID:(unint64_t)a4 processingOptions:(id)a5;
- (double)sensorBlackLevel;
- (id)description;
- (id)initBinnedQuadraVariantOf:(id)a3 inputTexture:(id)a4;
- (id)portType;
- (uint64_t)averageSensorBlackLevel;
- (uint64_t)awbRegionOfInterestRectWithinSensorCropRect;
- (uint64_t)bindTexturesForConfig:(void *)a3 metalContext:;
- (uint64_t)cfaLayout;
- (uint64_t)compandingMode;
- (uint64_t)firstPixel;
- (uint64_t)frameID;
- (uint64_t)highQualitySensorReadoutRect;
- (uint64_t)huemapThumbnailDownscalingFactor;
- (uint64_t)inputBitDepth;
- (uint64_t)metadata;
- (uint64_t)pipelineBlackLevel;
- (uint64_t)pipelineFootRoom;
- (uint64_t)pipelineHeadRoom;
- (uint64_t)pixelBuffer;
- (uint64_t)processingOptions;
- (uint64_t)pts;
- (uint64_t)quadraBinningFactor;
- (uint64_t)rawThumbnailMainEv0;
- (uint64_t)rawThumbnailSifr;
- (uint64_t)registers;
- (uint64_t)sensorCropRect;
- (uint64_t)sensorHeadRoom;
- (uint64_t)sensorReadoutRect;
- (uint64_t)setProcessed:(uint64_t)result;
- (uint64_t)softQuadraBinningFactor;
- (uint64_t)textures;
- (uint64_t)tuningType;
- (uint64_t)uncorrectedSensorBlackLevel;
- (uint64_t)uncorrectedSensorHeadRoom;
- (uint64_t)uniqueID;
- (uint64_t)validBufferRect;
- (void)dealloc;
- (void)readLSCMetadata:(id *)a3;
- (void)releaseInputResources;
- (void)storeLSCMetadata:(id *)a3;
@end

@implementation SoftISPInputFrame

- (SoftISPInputFrame)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 uniqueID:(unint64_t)a4 processingOptions:(id)a5
{
  id v9 = a5;
  v10 = v9;
  char v103 = 0;
  if (!a3)
  {
    FigDebugAssert3();
    goto LABEL_55;
  }
  if (!v9
    || (v102.receiver = self,
        v102.super_class = (Class)SoftISPInputFrame,
        v11 = [(SoftISPInputFrame *)&v102 init],
        (self = v11) == 0))
  {
    FigDebugAssert3();
    goto LABEL_57;
  }
  *((void *)v11 + 42) = a4;
  CMSampleBufferGetPresentationTimeStamp(&v101, a3);
  *(CMTime *)((char *)self + 448) = v101;
  CFStringRef v12 = (const __CFString *)*MEMORY[0x263F2EF78];
  uint64_t v13 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EF78], 0);
  v14 = (void *)*((void *)self + 39);
  *((void *)self + 39) = v13;

  if (!*((void *)self + 39)) {
    goto LABEL_57;
  }
  objc_storeStrong((id *)self + 40, a5);
  *((_DWORD *)self + 41) = objc_msgSend(v10, "cmi_intValueForKey:defaultValue:found:", @"TuningType", 0, 0);
  uint64_t v15 = CMGetAttachment(a3, @"ISPRegistersDictionary", 0);
  v16 = (void *)*((void *)self + 41);
  *((void *)self + 41) = v15;

  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer) {
    goto LABEL_57;
  }
  v18 = ImageBuffer;
  __int16 v19 = objc_msgSend(*((id *)self + 39), "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F510], 0, 0);
  __int16 v20 = objc_msgSend(*((id *)self + 39), "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F668], 0, &v103);
  if (!v103) {
    goto LABEL_57;
  }
  __int16 v21 = v20;
  char v22 = objc_msgSend(*((id *)self + 39), "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F6C0], 0xFFFFFFFFLL, 0);
  char v23 = objc_msgSend(*((id *)self + 39), "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F3C8], 0xFFFFFFFFLL, 0);
  char v24 = objc_msgSend(*((id *)self + 39), "cmi_BOOLValueForKey:defaultValue:found:", *MEMORY[0x263F2F638], 0, 0);
  char v25 = objc_msgSend(*((id *)self + 39), "cmi_BOOLValueForKey:defaultValue:found:", *MEMORY[0x263F2F5D8], 0, 0);
  *((_WORD *)self + 172) = v19;
  *((_WORD *)self + 173) = v21;
  *((unsigned char *)self + 348) = v24;
  *((unsigned char *)self + 349) = v25;
  *((unsigned char *)self + 350) = v22;
  *((unsigned char *)self + 351) = v23;
  int v26 = determineCompandingMode(v18, *((void **)self + 39));
  *((_DWORD *)self + 46) = v26;
  if (!v26) {
    goto LABEL_56;
  }
  int Pixel = determineFirstPixel(v18, *((void **)self + 39));
  *((_DWORD *)self + 44) = Pixel;
  if (Pixel == -1) {
    goto LABEL_56;
  }
  unsigned int v28 = determineCFALayout(v18, *((void **)self + 39));
  *((_DWORD *)self + 45) = v28;
  if (!v28) {
    goto LABEL_56;
  }
  unsigned int v29 = v28;
  uint64_t v30 = *MEMORY[0x263F2F5E0];
  int v31 = objc_msgSend(*((id *)self + 39), "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F5E0], 1, 0);
  *((_DWORD *)self + 42) = v31;
  if (!v31) {
    goto LABEL_56;
  }
  *((_DWORD *)self + 43) = 1;
  double v32 = *MEMORY[0x263F001A0];
  double v33 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v34 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v35 = *(double *)(MEMORY[0x263F001A0] + 24);
  objc_msgSend(*((id *)self + 39), "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F660], &v103, *MEMORY[0x263F001A0], v33, v34, v35);
  if (!v103) {
    goto LABEL_57;
  }
  double v40 = v38;
  double v41 = v39;
  *((_DWORD *)self + 88) = (int)v36;
  *((_DWORD *)self + 89) = (int)v37;
  *((_DWORD *)self + 90) = v38;
  *((_DWORD *)self + 91) = v39;
  objc_msgSend(*((id *)self + 39), "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F680], &v103, v32, v33, v34, v35);
  if (!v103) {
    goto LABEL_57;
  }
  int v46 = (int)v42;
  *((_DWORD *)self + 92) = (int)v42;
  int v47 = (int)v43;
  *((_DWORD *)self + 93) = (int)v43;
  unsigned int v48 = v44;
  *((_DWORD *)self + 94) = v44;
  unsigned int v49 = v45;
  *((_DWORD *)self + 95) = v45;
  int v50 = v29 == 3 ? 3 : 1;
  if ((v50 & v46) != 0) {
    goto LABEL_56;
  }
  if ((v50 & v47) != 0) {
    goto LABEL_56;
  }
  if ((v50 & v48) != 0) {
    goto LABEL_56;
  }
  if ((v50 & v49) != 0) {
    goto LABEL_56;
  }
  unsigned int v51 = v46 + v48;
  int v52 = *((_DWORD *)self + 42);
  if (v52 * v51 > *((_DWORD *)self + 90)) {
    goto LABEL_56;
  }
  if (v52 * (v47 + v49) > *((_DWORD *)self + 91)) {
    goto LABEL_56;
  }
  objc_msgSend(*((id *)self + 39), "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F500], &v103, 0.0, 0.0, (double)v48, (double)v49);
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  int v61 = objc_msgSend(*((id *)self + 39), "cmi_unsignedIntValueForKey:defaultValue:found:", v30, 1, 0);
  *((_DWORD *)self + 42) = v61;
  *((_DWORD *)self + 96) = (int)v54;
  int v62 = (int)v56;
  unsigned int v63 = v58;
  *((_DWORD *)self + 97) = (int)v56;
  *((_DWORD *)self + 98) = v58;
  unsigned int v64 = v60;
  *((_DWORD *)self + 99) = v60;
  if ((v50 & (int)v54) != 0) {
    goto LABEL_56;
  }
  if ((v50 & v62) != 0) {
    goto LABEL_56;
  }
  if ((v50 & v63) != 0) {
    goto LABEL_56;
  }
  if ((v50 & v64) != 0) {
    goto LABEL_56;
  }
  if (!v61) {
    goto LABEL_56;
  }
  if ((int)v54 + v63 > *((_DWORD *)self + 94)) {
    goto LABEL_56;
  }
  if (v62 + v64 > *((_DWORD *)self + 95)) {
    goto LABEL_56;
  }
  *((_DWORD *)self + 43) = 1;
  unsigned int Width = CVPixelBufferGetWidth(v18);
  unsigned int Height = CVPixelBufferGetHeight(v18);
  objc_msgSend(*((id *)self + 39), "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F6E0], 0, 0.0, 0.0, (double)Width, (double)Height);
  *((_DWORD *)self + 100) = (int)v67;
  int v69 = (int)v68;
  unsigned int v71 = v70;
  *((_DWORD *)self + 101) = (int)v68;
  *((_DWORD *)self + 102) = v70;
  unsigned int v73 = v72;
  *((_DWORD *)self + 103) = v72;
  if ((v50 & (int)v67) != 0
    || (v50 & v69) != 0
    || (v50 & v71) != 0
    || (v50 & v73) != 0
    || (int v74 = *((_DWORD *)self + 42), (*((_DWORD *)self + 92) + v71) * v74 > *((_DWORD *)self + 90))
    || (*((_DWORD *)self + 93) + v73) * v74 > *((_DWORD *)self + 91)
    || (int)v67 + v71 > Width
    || v69 + v73 > Height)
  {
LABEL_56:
    FigSignalErrorAt();
LABEL_57:
    a3 = 0;
    goto LABEL_55;
  }
  objc_msgSend(*((id *)self + 40), "cmi_cgRectForKey:defaultValue:found:", @"AWBRegionOfInterestRectWithinSensorCropRect", 0, 0.0, 0.0, v40, v41);
  *((_DWORD *)self + 104) = (int)v75 & ~v50;
  *((_DWORD *)self + 105) = (int)v76 & ~v50;
  *((_DWORD *)self + 106) = v77 & ~v50;
  *((_DWORD *)self + 107) = v78 & ~v50;
  int v79 = determineInputBitDepth(v18, *((void **)self + 39));
  *((_DWORD *)self + 47) = 10;
  *((_DWORD *)self + 48) = v79;
  int v80 = objc_msgSend(*((id *)self + 39), "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F648], 0, &v103);
  if (!v103) {
    goto LABEL_64;
  }
  int v81 = v80 << (16 - *((_DWORD *)self + 47));
  *((_DWORD *)self + 51) = v81;
  *((_DWORD *)self + 52) = 0xFFFF - v81;
  v82 = (void *)*((void *)self + 39);
  if (v23 != -1)
  {
    objc_msgSend(v82, "cmi_simdInt4ValueForKey:defaultValue:found:", *MEMORY[0x263F2F658], &v103, 0.0);
    if (v103) {
      goto LABEL_42;
    }
LABEL_64:
    FigDebugAssert3();
    goto LABEL_56;
  }
  objc_msgSend(v82, "cmi_simdInt4ValueForKey:defaultValue:found:", *MEMORY[0x263F2F650], &v103, 0.0);
  if (!v103) {
    goto LABEL_64;
  }
LABEL_42:
  v84 = (const float *)((char *)self + 204);
  int32x4_t v85 = (int32x4_t)vld1q_dup_f32(v84);
  int32x4_t v86 = vaddq_s32(v85, v83);
  int32x2_t v87 = vadd_s32(*(int32x2_t *)v86.i8, (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v86, (int8x16_t)v86, 8uLL));
  *((int32x4_t *)self + 27) = v86;
  int v88 = v87.i32[1] + v87.i32[0] + 5;
  if (v87.i32[1] + v87.i32[0] + 2 >= 0) {
    int v88 = v87.i32[1] + v87.i32[0] + 2;
  }
  *((_DWORD *)self + 49) = v88 >> 2;
  *((_DWORD *)self + 50) = 0xFFFF - vmaxvq_s32(v86);
  int v89 = objc_msgSend(*((id *)self + 39), "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F388], 8448, 0);
  *((_DWORD *)self + 53) = v89;
  *((_DWORD *)self + 54) = 0x4000;
  if (*((_DWORD *)self + 45) == 3) {
    int v90 = 16;
  }
  else {
    int v90 = 8;
  }
  *((_DWORD *)self + 55) = 0xFFFF - v89;
  *((_DWORD *)self + 56) = v90;
  *((void *)self + 29) = CFRetain(a3);
  *((void *)self + 30) = CVPixelBufferRetain(v18);
  v91 = (__CVBuffer *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EF88], 0);
  *((void *)self + 31) = v91;
  if (v91)
  {
    CFTypeRef v92 = CVBufferCopyAttachment(v91, v12, 0);
    v93 = (void *)*((void *)self + 35);
    *((void *)self + 35) = v92;

    if (!*((void *)self + 35)) {
      goto LABEL_56;
    }
  }
  else
  {
    *((void *)self + 32) = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EF70], 0);
    CFTypeRef v94 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EF90], 0);
    *((void *)self + 33) = v94;
    v95 = (__CVBuffer *)*((void *)self + 32);
    if (v95)
    {
      if (v94)
      {
        CFTypeRef v96 = CVBufferCopyAttachment(v95, v12, 0);
        v97 = (void *)*((void *)self + 35);
        *((void *)self + 35) = v96;

        if (!*((void *)self + 35)) {
          goto LABEL_56;
        }
        CFTypeRef v98 = CVBufferCopyAttachment(*((CVBufferRef *)self + 33), v12, 0);
        v99 = (void *)*((void *)self + 36);
        *((void *)self + 36) = v98;

        if (!*((void *)self + 36)) {
          goto LABEL_56;
        }
      }
    }
  }
  self = self;
  a3 = (opaqueCMSampleBuffer *)self;
LABEL_55:

  return (SoftISPInputFrame *)a3;
}

- (id)initBinnedQuadraVariantOf:(id)a3 inputTexture:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  v6 = (uint32x2_t *)a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7 && v6[22].i32[1] == 3 && (uint64_t v9 = [*(id *)&v6[39] mutableCopy]) != 0)
  {
    v10 = (SoftISPInputFrame *)v9;
    v24.receiver = self;
    v24.super_class = (Class)SoftISPInputFrame;
    id v11 = [(SoftISPInputFrame *)&v24 init];
    if (v11)
    {
      CFStringRef v12 = (uint32x2_t *)v11;
      *((uint32x2_t *)v11 + 31) = v6[31];
      *((uint32x2_t *)v11 + 32) = v6[32];
      *((uint32x2_t *)v11 + 33) = v6[33];
      objc_storeStrong((id *)v11 + 35, *(id *)&v6[35]);
      objc_storeStrong((id *)&v12[36], *(id *)&v6[36]);
      objc_storeStrong((id *)&v12[37], *(id *)&v6[37]);
      objc_storeStrong((id *)&v12[38], *(id *)&v6[38]);
      objc_storeStrong((id *)&v12[40], *(id *)&v6[40]);
      objc_storeStrong((id *)&v12[41], *(id *)&v6[41]);
      v12[20].i32[1] = v6[20].i32[1];
      v12[42] = v6[42];
      v12[43] = v6[43];
      long long v13 = *(_OWORD *)v6[56].i8;
      v12[58] = v6[58];
      *(_OWORD *)v12[56].i8 = v13;
      v12[21].i32[0] = 2 * v6[21].i32[0];
      v12[21].i32[1] = 2 * v6[21].i32[1];
      v12[22].i32[0] = v6[22].i32[0];
      v12[22].i32[1] = 2;
      v12[23].i32[0] = v6[23].i32[0];
      *(_OWORD *)v12[44].i8 = *(_OWORD *)v6[44].i8;
      v12[46] = (uint32x2_t)vshr_n_s32((int32x2_t)vsra_n_u32(v6[46], v6[46], 0x1FuLL), 1uLL);
      v12[47] = vshr_n_u32(v6[47], 1uLL);
      v12[48] = (uint32x2_t)vshr_n_s32((int32x2_t)vsra_n_u32(v6[48], v6[48], 0x1FuLL), 1uLL);
      v12[49] = vshr_n_u32(v6[49], 1uLL);
      *(_OWORD *)v12[52].i8 = *(_OWORD *)v6[52].i8;
      v12[23].i32[1] = v6[23].i32[1];
      v12[24].i32[0] = v6[24].i32[0];
      *(_OWORD *)v12[54].i8 = *(_OWORD *)v6[54].i8;
      v12[24].i32[1] = v6[24].i32[1];
      v12[25].i32[0] = v6[25].i32[0];
      v12[25].i32[1] = v6[25].i32[1];
      v12[26].i32[0] = v6[26].i32[0];
      v12[26].i32[1] = v6[26].i32[1];
      v12[27].i32[0] = v6[27].i32[0];
      v12[27].i32[1] = v6[27].i32[1];
      v12[28].i32[0] = (unsigned __int32)v6[28].i32[0] >> 1;
      v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      [(SoftISPInputFrame *)v10 setObject:v14 forKeyedSubscript:*MEMORY[0x263F2F5E0]];

      v26.origin.x = (double)v12[46].i32[0];
      v26.origin.y = (double)v12[46].i32[1];
      LODWORD(v15) = v12[47].i32[0];
      v26.size.width = (double)v15;
      LODWORD(v16) = v12[47].i32[1];
      v26.size.height = (double)v16;
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v26);
      [(SoftISPInputFrame *)v10 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x263F2F680]];

      v18 = (void *)v12[39];
      v12[39] = (uint32x2_t)v10;
      __int16 v19 = v10;

      v25[0] = v8;
      uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
      __int16 v21 = (void *)v12[34];
      v12[34] = (uint32x2_t)v20;

      self = v12;
      char v22 = self;
    }
    else
    {
      FigDebugAssert3();
      char v22 = 0;
      self = v10;
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    char v22 = 0;
  }

  return v22;
}

- (uint64_t)cfaLayout
{
  if (result) {
    return *(unsigned int *)(result + 180);
  }
  return result;
}

- (uint64_t)metadata
{
  if (result) {
    return *(void *)(result + 312);
  }
  return result;
}

- (uint64_t)rawThumbnailMainEv0
{
  if (result) {
    return *(void *)(result + 296);
  }
  return result;
}

- (uint64_t)rawThumbnailSifr
{
  if (result) {
    return *(void *)(result + 304);
  }
  return result;
}

- (uint64_t)processingOptions
{
  if (result) {
    return *(void *)(result + 320);
  }
  return result;
}

- (uint64_t)registers
{
  if (result) {
    return *(void *)(result + 328);
  }
  return result;
}

- (uint64_t)tuningType
{
  if (result) {
    return *(unsigned int *)(result + 164);
  }
  return result;
}

- (uint64_t)uniqueID
{
  if (result) {
    return *(void *)(result + 336);
  }
  return result;
}

- (uint64_t)frameID
{
  if (result) {
    return *(void *)(result + 344);
  }
  return result;
}

- (uint64_t)pts
{
  if (result)
  {
    *(_OWORD *)a2 = *(_OWORD *)(result + 448);
    *(void *)(a2 + 16) = *(void *)(result + 464);
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  return result;
}

- (uint64_t)quadraBinningFactor
{
  if (result) {
    return *(unsigned int *)(result + 168);
  }
  return result;
}

- (uint64_t)softQuadraBinningFactor
{
  if (result) {
    return *(unsigned int *)(result + 172);
  }
  return result;
}

- (uint64_t)firstPixel
{
  if (result) {
    return *(unsigned int *)(result + 176);
  }
  return result;
}

- (uint64_t)compandingMode
{
  if (result) {
    return *(unsigned int *)(result + 184);
  }
  return result;
}

- (uint64_t)sensorCropRect
{
  if (result) {
    return *(void *)(result + 352);
  }
  return result;
}

- (uint64_t)sensorReadoutRect
{
  if (result) {
    return *(void *)(result + 368);
  }
  return result;
}

- (uint64_t)highQualitySensorReadoutRect
{
  if (result) {
    return *(void *)(result + 384);
  }
  return result;
}

- (uint64_t)awbRegionOfInterestRectWithinSensorCropRect
{
  if (result) {
    return *(void *)(result + 416);
  }
  return result;
}

- (uint64_t)inputBitDepth
{
  if (result) {
    return *(unsigned int *)(result + 192);
  }
  return result;
}

- (double)sensorBlackLevel
{
  if (a1) {
    long long v1 = *(_OWORD *)(a1 + 432);
  }
  else {
    *(void *)&long long v1 = 0;
  }
  return *(double *)&v1;
}

- (uint64_t)averageSensorBlackLevel
{
  if (result) {
    return *(unsigned int *)(result + 196);
  }
  return result;
}

- (uint64_t)sensorHeadRoom
{
  if (result) {
    return *(unsigned int *)(result + 200);
  }
  return result;
}

- (uint64_t)uncorrectedSensorBlackLevel
{
  if (result) {
    return *(unsigned int *)(result + 204);
  }
  return result;
}

- (uint64_t)uncorrectedSensorHeadRoom
{
  if (result) {
    return *(unsigned int *)(result + 208);
  }
  return result;
}

- (uint64_t)pipelineBlackLevel
{
  if (result) {
    return *(unsigned int *)(result + 212);
  }
  return result;
}

- (uint64_t)pipelineFootRoom
{
  if (result) {
    return *(unsigned int *)(result + 216);
  }
  return result;
}

- (uint64_t)pipelineHeadRoom
{
  if (result) {
    return *(unsigned int *)(result + 220);
  }
  return result;
}

- (uint64_t)huemapThumbnailDownscalingFactor
{
  if (result) {
    return *(unsigned int *)(result + 224);
  }
  return result;
}

- (void)dealloc
{
  -[SoftISPInputFrame releaseInputResources]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)SoftISPInputFrame;
  [(SoftISPInputFrame *)&v3 dealloc];
}

- (void)releaseInputResources
{
  if (a1)
  {
    v2 = *(void **)(a1 + 272);
    *(void *)(a1 + 272) = 0;

    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 240));
    *(void *)(a1 + 240) = 0;
    objc_super v3 = *(const void **)(a1 + 232);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 232) = 0;
    }
  }
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = *((void *)self + 42);
  *(_OWORD *)&time.value = *((_OWORD *)self + 28);
  time.epoch = *((void *)self + 58);
  id v7 = [v3 stringWithFormat:@"%@(uniqueID=%llu, pts=%f, captureIdx=%u, sensorIdx=0x%x, tmIdx=%d, bracketIdx=%d, isSIFR=%u, isPB=%u, tuningType=%d)", v5, v6, CMTimeGetSeconds(&time), *((unsigned __int16 *)self + 172), *((unsigned __int16 *)self + 173), *((char *)self + 350), *((char *)self + 351), *((unsigned __int8 *)self + 348), *((unsigned __int8 *)self + 349), *((unsigned int *)self + 41)];

  return v7;
}

- (uint64_t)bindTexturesForConfig:(void *)a3 metalContext:
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    if (!v5 || !v6 || *(void *)(a1 + 272))
    {
      a1 = FigSignalErrorAt();
      v10 = 0;
      goto LABEL_27;
    }
    v8 = [v5 inputMTLPixelFormatForPlane];
    uint64_t v9 = [v8 count];

    v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v9];
    if (!v10) {
      goto LABEL_37;
    }
    if (v9)
    {
      uint64_t v11 = 0;
      do
      {
        CFStringRef v12 = [v5 inputMTLPixelFormatForPlane];
        long long v13 = [v12 objectAtIndexedSubscript:v11];
        uint64_t v14 = [v13 unsignedIntegerValue];

        uint64_t v15 = [v7 bindPixelBufferToMTL2DTexture:*(void *)(a1 + 240) pixelFormat:v14 usage:17 plane:v11];
        if (!v15) {
          goto LABEL_37;
        }
        unint64_t v16 = (void *)v15;
        [v10 addObject:v15];
      }
      while (v9 != ++v11);
    }
    if (*(void *)(a1 + 248))
    {
      uint64_t v17 = objc_msgSend(v7, "bindPixelBufferToMTLBuffer:");
      uint64_t v39 = v17;
      if (!v17) {
        goto LABEL_36;
      }
      v18 = (void *)v17;
      int BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 248));
      id v20 = v18;
      uint64_t v40 = (uint64_t)v20;
      uint64_t v21 = (uint64_t)v20;
      int v22 = BytesPerRow;
    }
    else
    {
      if (!*(void *)(a1 + 256) || !*(void *)(a1 + 264))
      {
        uint64_t v30 = 0;
        double v33 = 0;
        goto LABEL_26;
      }
      uint64_t v34 = objc_msgSend(v7, "bindPixelBufferToMTLBuffer:");
      uint64_t v39 = v34;
      if (!v34
        || (uint64_t v21 = v34,
            int v22 = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 256)),
            [v7 bindPixelBufferToMTLBuffer:*(void *)(a1 + 264)],
            uint64_t v35 = objc_claimAutoreleasedReturnValue(),
            (uint64_t v40 = v35) == 0))
      {
LABEL_36:
        FigDebugAssert3();
LABEL_37:
        a1 = FigSignalErrorAt();
LABEL_27:
        for (uint64_t i = 8; i != -8; i -= 8)

        goto LABEL_30;
      }
      id v20 = (id)v35;
      int BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 264));
    }
    char v38 = 0;
    uint64_t v23 = *(void *)(a1 + 248);
    objc_msgSend(*(id *)(a1 + 280), "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F6E0], &v38, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
    if (v38)
    {
      uint64_t v26 = v24;
      id v27 = (id)v21;
      uint64_t v28 = v25 >> (v23 != 0);
      uint64_t v29 = [v7 create2DTextureFromBuffer:v27 offset:0 stride:v22 width:v26 height:v28 format:23 usage:1];
      if (v29)
      {
        uint64_t v30 = (void *)v29;
        if (v23) {
          uint64_t v31 = (v28 * BytesPerRow);
        }
        else {
          uint64_t v31 = 0;
        }
        uint64_t v32 = [v7 create2DTextureFromBuffer:v20 offset:v31 stride:BytesPerRow width:v26 height:v28 format:23 usage:1];
        if (!v32)
        {
          FigDebugAssert3();
          a1 = FigSignalErrorAt();

          goto LABEL_27;
        }
        double v33 = (void *)v32;
        objc_storeStrong((id *)(a1 + 296), v30);
        objc_storeStrong((id *)(a1 + 304), v33);
LABEL_26:
        objc_storeStrong((id *)(a1 + 272), v10);

        a1 = 0;
        goto LABEL_27;
      }
    }
    goto LABEL_36;
  }
LABEL_30:

  return a1;
}

- (id)portType
{
  if (a1)
  {
    a1 = [a1[39] objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)storeLSCMetadata:(id *)a3
{
}

- (void)readLSCMetadata:(id *)a3
{
}

- (uint64_t)pixelBuffer
{
  if (result) {
    return *(void *)(result + 240);
  }
  return result;
}

- (uint64_t)textures
{
  if (result) {
    return *(void *)(result + 272);
  }
  return result;
}

- (BOOL)processed
{
  if (result) {
    return *(unsigned char *)(result + 160) != 0;
  }
  return result;
}

- (uint64_t)setProcessed:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 160) = a2;
  }
  return result;
}

- (uint64_t)validBufferRect
{
  if (result) {
    return *(void *)(result + 400);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 41, 0);
  objc_storeStrong((id *)self + 40, 0);
  objc_storeStrong((id *)self + 39, 0);
  objc_storeStrong((id *)self + 38, 0);
  objc_storeStrong((id *)self + 37, 0);
  objc_storeStrong((id *)self + 36, 0);
  objc_storeStrong((id *)self + 35, 0);
  objc_storeStrong((id *)self + 34, 0);

  objc_super v3 = (void *)*((void *)self + 19);
}

@end