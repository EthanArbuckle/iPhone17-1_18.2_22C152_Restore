@interface RawNightModeInferenceCommon
+ (id)getRawNightModeNetworkBasePath;
+ (id)getRawNightModeNetworkPathFromBasePath:(id)a3 fromNetworkName:(id)a4;
+ (id)getTilePadding:(id)a3 forGain:(float)a4;
+ (int)getLSCParams:(id *)a3 fromMetadata:(id)a4 fromCameraInfoByPortType:(id)a5 fromLSCGainMapParameters:(id)a6;
@end

@implementation RawNightModeInferenceCommon

+ (id)getRawNightModeNetworkBasePath
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 persistentDomainForName:@"com.apple.coremedia"];

  v4 = [v3 objectForKeyedSubscript:@"imaging_networks_path"];
  v5 = v4;
  if (v4) {
    v6 = v4;
  }
  else {
    v6 = @"/System/Library/ImagingNetworks";
  }

  return v6;
}

+ (id)getRawNightModeNetworkPathFromBasePath:(id)a3 fromNetworkName:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F08850] defaultManager];
  id v28 = 0;
  v8 = [v7 contentsOfDirectoryAtPath:v5 error:&v28];
  id v9 = v28;

  v10 = FigCapturePlatformIdentifierString();
  v11 = FigCaptureGetModelSpecificName();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v22 = v9;
    id v23 = v5;
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (((objc_msgSend(v17, "containsString:", @"espresso.net", v22, v23, (void)v24) & 1) != 0
           || [v17 containsString:@"espresso.bundle"])
          && [v17 containsString:v6]
          && (([v17 containsString:v11] & 1) != 0
           || [v17 containsString:v10]))
        {
          id v18 = v17;
          goto LABEL_15;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v14) {
        continue;
      }
      break;
    }
    id v18 = 0;
LABEL_15:
    id v9 = v22;
    id v5 = v23;
  }
  else
  {
    id v18 = 0;
  }

  v19 = [v5 stringByAppendingString:@"/"];

  v20 = [v19 stringByAppendingString:v18];

  return v20;
}

+ (id)getTilePadding:(id)a3 forGain:(float)a4
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
LABEL_6:
      v8 = v6;
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(float *)&double v7 = a4;
      objc_msgSend(v5, "cmi_selectValueForGain:", v7);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    FigSignalErrorAt();
    v8 = &unk_270E983E0;
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    v8 = 0;
  }
LABEL_8:

  return v8;
}

+ (int)getLSCParams:(id *)a3 fromMetadata:(id)a4 fromCameraInfoByPortType:(id)a5 fromLSCGainMapParameters:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  char v38 = 0;
  id v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  if (!v12
    || ([v10 objectForKeyedSubscript:v12], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
    goto LABEL_13;
  }
  uint64_t v14 = v13;
  uint64_t v15 = [v13 objectForKeyedSubscript:*MEMORY[0x263F2F758]];
  if (!v15)
  {
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
LABEL_20:

    goto LABEL_13;
  }
  v16 = (void *)v15;
  unsigned int v17 = objc_msgSend(v9, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F5E0], 1, 0);
  if (!v17)
  {
LABEL_19:
    int v36 = FigSignalErrorAt();

    goto LABEL_20;
  }
  unsigned int v18 = v17;
  unsigned int v19 = objc_msgSend(v16, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2EF50], 0, &v38);
  if (!v38
    || (unsigned int v20 = v19,
        unsigned int v21 = objc_msgSend(v16, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2EF38], 0, &v38),
        !v38))
  {
    FigDebugAssert3();
    goto LABEL_19;
  }
  int8x8_t v22 = vand_s8((int8x8_t)vdup_n_s32(v18), (int8x8_t)0xFFFF0000FFFFLL);
  int8x8_t v23 = vand_s8((int8x8_t)__PAIR64__(v21, v20), (int8x8_t)0xFFFF0000FFFFLL);
  HIWORD(a3[1].var0) = v23.i32[1] / (unsigned __int32)v22.i32[1];
  LOWORD(a3[1].var0) = v23.i32[0] / (unsigned __int32)v22.i32[0];
  double v24 = *MEMORY[0x263F001A0];
  double v25 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v26 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v27 = *(double *)(MEMORY[0x263F001A0] + 24);
  objc_msgSend(v9, "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F660], &v38, *MEMORY[0x263F001A0], v25, v26, v27);
  if (!v38) {
    goto LABEL_18;
  }
  double v30 = v28;
  double v31 = v29;
  objc_msgSend(v9, "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F680], &v38, v24, v25, v26, v27);
  if (!v38
    || (HIWORD(a3->var0) = (int)(v33 + (double)((int)v31 / v18)),
        LOWORD(a3->var0) = (int)(v32 + (double)((int)v30 / v18)),
        int v34 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", *MEMORY[0x263F2F808], 0, &v38),
        !v38)
    || (LODWORD(v35) = 1.0, v34)
    && (objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F7E8], &v38, v35), !v38))
  {
LABEL_18:
    FigDebugAssert3();
    goto LABEL_19;
  }
  a3[2].var0 = *(float *)&v35;

  int v36 = 0;
LABEL_13:

  return v36;
}

@end