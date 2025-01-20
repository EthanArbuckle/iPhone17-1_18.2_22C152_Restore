@interface LocalToneMappingConfig
- (LocalToneMappingConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4;
- (int)getLocalToneCurveDimsForOutputFrame:(id)a3 width:(unint64_t *)a4 height:(unint64_t *)a5 lumaEntries:(unint64_t *)a6;
- (int)getToneMappingConfigForInputFrame:(id)a3 outputFrame:(id)a4 bounds:(id)a5 config:(id *)a6 localCurves:(id)a7 globalLumaCurve:(id)a8 perComponentCurve:(id)a9;
@end

@implementation LocalToneMappingConfig

- (LocalToneMappingConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7) {
    goto LABEL_9;
  }
  v12.receiver = self;
  v12.super_class = (Class)LocalToneMappingConfig;
  self = [(SoftISPConfig *)&v12 initWithStaticParameters:v6];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_5;
  }
  -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", [v8 maximumWidth] | ((unint64_t)objc_msgSend(v8, "maximumHeight") << 32));
  [(SoftISPConfig *)self setInputPixelFormat:0];
  [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:MEMORY[0x263EFFA68]];
  [(SoftISPConfig *)self setOutputPixelFormat:875704422];
  v9 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self outputPixelFormat]);
  [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v9];

  v10 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

  if (!v10)
  {
LABEL_9:
    FigDebugAssert3();

    self = 0;
  }
LABEL_5:

  return self;
}

- (int)getLocalToneCurveDimsForOutputFrame:(id)a3 width:(unint64_t *)a4 height:(unint64_t *)a5 lumaEntries:(unint64_t *)a6
{
  v9 = [a3 metadata];
  v10 = v9;
  if (!a4
    || !a5
    || !a6
    || !v9
    || ([v9 objectForKeyedSubscript:*MEMORY[0x263F2F530]],
        (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    id v12 = 0;
LABEL_14:
    int v18 = FigSignalErrorAt();
    goto LABEL_11;
  }
  id v12 = v11;
  v13 = (_WORD *)[v12 bytes];
  if (!v13
    || (v14 = v13, unint64_t LTM_validWidth = getLTM_validWidth(v13), (*a4 = LTM_validWidth) == 0)
    || (unint64_t LTM_validHeight = getLTM_validHeight(v14), (*a5 = LTM_validHeight) == 0)
    || (unint64_t LTM_ltmCurveEntryCount = getLTM_ltmCurveEntryCount(v14), (*a6 = LTM_ltmCurveEntryCount) == 0))
  {
    FigDebugAssert3();
    goto LABEL_14;
  }
  int v18 = 0;
LABEL_11:

  return v18;
}

- (int)getToneMappingConfigForInputFrame:(id)a3 outputFrame:(id)a4 bounds:(id)a5 config:(id *)a6 localCurves:(id)a7 globalLumaCurve:(id)a8 perComponentCurve:(id)a9
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v19 = [a4 metadata];
  v21 = v19;
  char v89 = 0;
  if (!a6 || !v16 || !v17 || !v18) {
    goto LABEL_20;
  }
  LODWORD(v20) = 1132462080;
  objc_msgSend(v19, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F6E8], &v89, v20);
  float v23 = v22 * 0.0039062;
  LODWORD(v24) = 1.0;
  objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F6F0], &v89, v24);
  float v26 = v25;
  LODWORD(v27) = 1132462080;
  objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F6F8], &v89, v27);
  a6->var0 = (float)(v23 / v26) / (float)(v28 * 0.0039062);
  v29 = -[SoftISPInputFrame processingOptions]((uint64_t)v14);
  char v30 = objc_msgSend(v29, "cmi_BOOLValueForKey:defaultValue:found:", @"ApplyCCM", 0, 0);

  if (v30)
  {
    a6[10].var0 = 0.0;
    *(void *)&a6[8].var0 = 1065353216;
    a6[14].var0 = 0.0;
    *(void *)&a6[12].var0 = 0x3F80000000000000;
    a6[18].var0 = 1.0;
    *(void *)&a6[16].var0 = 0;
  }
  else
  {
    v31 = [v21 objectForKeyedSubscript:*MEMORY[0x263F2F3F0]];
    if (!v31) {
      goto LABEL_21;
    }
    id v32 = v31;
    uint64_t v33 = [v32 bytes];
    uint64_t v34 = *(void *)v33;
    uint64_t v35 = *(void *)(v33 + 12);
    float v36 = *(float *)(v33 + 20);
    uint64_t v37 = *(void *)(v33 + 24);
    float v38 = *(float *)(v33 + 32);
    a6[10].var0 = *(float *)(v33 + 8);
    *(void *)&a6[8].var0 = v34;
    a6[14].var0 = v36;
    *(void *)&a6[12].var0 = v35;
    a6[18].var0 = v38;
    *(void *)&a6[16].var0 = v37;
  }
  v39 = [v21 objectForKeyedSubscript:*MEMORY[0x263F2F530]];
  if (!v39)
  {
LABEL_20:
    FigDebugAssert3();
LABEL_21:
    int v71 = FigSignalErrorAt();
    goto LABEL_19;
  }
  id v40 = v39;
  uint64_t v41 = [v40 bytes];
  if (!v41
    || (v42 = (_WORD *)v41,
        [v21 objectForKeyedSubscript:*MEMORY[0x263F2F4D8]],
        (v43 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v71 = FigSignalErrorAt();
LABEL_24:

    goto LABEL_19;
  }
  id v81 = v43;
  uint64_t v44 = [v81 bytes];
  if (!v44
    || (v45 = (_WORD *)v44,
        [v21 objectForKeyedSubscript:*MEMORY[0x263F2F4E8]],
        (v46 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v71 = FigSignalErrorAt();

    goto LABEL_24;
  }
  v80 = v40;
  id v79 = v46;
  uint64_t v47 = [v79 bytes];
  if (v47 && *v45 == 257)
  {
    uint64_t v49 = v47;
    v73 = v21;
    v74 = v18;
    v75 = v17;
    v76 = v16;
    uint64_t v77 = (uint64_t)v15;
    id v78 = v14;
    uint64_t v50 = 0;
    LOWORD(v48) = v45[257];
    HIWORD(v51) = 18303;
    float v52 = (float)v48 / 65535.0;
    do
    {
      LOWORD(v51) = v45[v50 + 1];
      float v51 = (float)LODWORD(v51) / v52;
      *(_WORD *)&v90[v50 * 2] = (int)v51;
      ++v50;
    }
    while (v50 != 257);
    uint64_t LTM_lutsBytesPerRow = getLTM_lutsBytesPerRow(v42);
    uint64_t LTM_lutsBytesPerColumn = getLTM_lutsBytesPerColumn(v42);
    uint64_t LTM_leftPadding = getLTM_leftPadding(v42);
    unint64_t LTM_validWidth = getLTM_validWidth(v42);
    uint64_t LTM_topPadding = getLTM_topPadding(v42);
    unint64_t LTM_validHeight = getLTM_validHeight(v42);
    uint64_t LTM_ltmCurveEntryCount = getLTM_ltmCurveEntryCount(v42);
    uint64_t LTM_data = getLTM_data(v42, (unint64_t)(LTM_leftPadding * LTM_lutsBytesPerColumn + LTM_topPadding * LTM_lutsBytesPerRow) >> 1);
    memset(v88, 0, 24);
    v88[3] = LTM_ltmCurveEntryCount;
    v88[4] = LTM_validWidth;
    v88[5] = LTM_validHeight;
    id v16 = v76;
    [v76 replaceRegion:v88 mipmapLevel:0 slice:0 withBytes:LTM_data bytesPerRow:LTM_lutsBytesPerColumn bytesPerImage:LTM_lutsBytesPerRow];
    memset(v85, 0, sizeof(v85));
    long long v86 = xmmword_263480550;
    uint64_t v87 = 1;
    id v17 = v75;
    [v75 replaceRegion:v85 mipmapLevel:0 withBytes:v90 bytesPerRow:514];
    memset(v82, 0, sizeof(v82));
    long long v83 = xmmword_263480550;
    uint64_t v84 = 1;
    id v18 = v74;
    [v74 replaceRegion:v82 mipmapLevel:0 withBytes:v49 + 2 bytesPerRow:514];
    id v15 = (id)v77;
    -[SoftISPBounds processingRegionWithinOutputBufferInPixels](v77);
    int8x8_t v61 = (int8x8_t)vdup_n_s32(0xFFFEu);
    int32x2_t v63 = (int32x2_t)vand_s8(v62, v61);
    unsigned int LTM_tileWidth = getLTM_tileWidth(v42);
    int32x2_t v65 = (int32x2_t)vand_s8((int8x8_t)__PAIR64__(getLTM_tileHeight(v42), LTM_tileWidth), v61);
    int32x2_t v66 = vmul_s32(v65, (int32x2_t)__PAIR64__(LTM_validHeight, LTM_validWidth));
    int8x8_t v67 = (int8x8_t)vsra_n_s32(vshr_n_s32(vshr_n_s32(vshl_n_s32(vsub_s32(v63, v66), 0x10uLL), 0x10uLL), 1uLL), vshr_n_s32(vshl_n_s32(v65, 0x10uLL), 0x10uLL), 1uLL);
    uint64_t v68 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels](v77);
    uint32x2_t v69 = vsra_n_u32(vshr_n_u32((uint32x2_t)vshr_n_s32(vshl_n_s32((int32x2_t)vsra_n_u32((uint32x2_t)v67, (uint32x2_t)vand_s8(v67, (int8x8_t)0xFFFF0000FFFFLL), 0xFuLL), 0x10uLL), 0x10uLL), 1uLL), vsra_n_u32((uint32x2_t)v68, (uint32x2_t)v68, 0x1FuLL), 1uLL);
    HIWORD(a6[3].var0) = v69.i16[2];
    LOWORD(a6[3].var0) = v69.i16[0];
    uint32x2_t v70 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)vsub_s32(v66, v65), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    HIWORD(a6[4].var0) = v70.i16[2];
    LOWORD(a6[4].var0) = v70.i16[0];

    int v71 = 0;
    id v14 = v78;
    v21 = v73;
  }
  else
  {
    FigDebugAssert3();
    int v71 = FigSignalErrorAt();
  }
LABEL_19:

  return v71;
}

@end