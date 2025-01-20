@interface OutputNoiseModel
+ (id)generateNoiseModelFromReferenceFrameMetadata:(id)a3 nFusedFrames:(int)a4 tuningPlist:(id)a5;
@end

@implementation OutputNoiseModel

+ (id)generateNoiseModelFromReferenceFrameMetadata:(id)a3 nFusedFrames:(int)a4 tuningPlist:(id)a5
{
  v36[5] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (void **)a5;
  v9 = v8;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  int v34 = 0;
  if (v7 && a4 > 0 && v8)
  {
    float v10 = *(float *)([v7 exposureParams] + 20);
    float v11 = estimateLTMSoftGainFromFrameProperties(v7, 1);
    if (*(unsigned char *)([v7 exposureParams] + 98)) {
      float v12 = *(float *)([v7 exposureParams] + 48);
    }
    else {
      float v12 = 1.0;
    }
    float v13 = (float)(v10 * v11) / v12;
    float v14 = interpolate_with_gain(v9[2], v13);
    float v15 = interpolate_with_gain(v9[3], v13);
    float v16 = interpolate_with_gain(v9[4], v13);
    float v17 = interpolate_with_gain(v9[5], v13);
    uint64_t v32 = *(void *)([v7 exposureParams] + 76);
    LODWORD(v33) = *(_DWORD *)([v7 exposureParams] + 84);
    int v34 = *(_DWORD *)([v7 exposureParams] + 20);
    HIDWORD(v33) = 1065353216;
    [MEMORY[0x263F2EDA0] calculateBasicNoiseModelFromParams:&v32];
    float v18 = (float)(v11 / v12) * sqrtf((float)(0.0 / 1046500.0) / (float)a4);
    float v19 = sqrtf((float)((float)(v11 / v12) * (float)(0.0 / 1023.0)) / (float)a4);
    uint64_t v20 = *MEMORY[0x263F2F160];
    v36[0] = &unk_270E986B0;
    uint64_t v21 = *MEMORY[0x263F2F140];
    v35[0] = v20;
    v35[1] = v21;
    *(float *)&double v22 = v14 * v18;
    v23 = [NSNumber numberWithFloat:v22];
    v36[1] = v23;
    v35[2] = *MEMORY[0x263F2F148];
    *(float *)&double v24 = v15 * v19;
    v25 = [NSNumber numberWithFloat:v24];
    v36[2] = v25;
    v35[3] = *MEMORY[0x263F2F158];
    *(float *)&double v26 = v16 * v19;
    v27 = [NSNumber numberWithFloat:v26];
    v36[3] = v27;
    v35[4] = *MEMORY[0x263F2F150];
    *(float *)&double v28 = v17;
    v29 = [NSNumber numberWithFloat:v28];
    v36[4] = v29;
    v30 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:5];
  }
  else
  {
    FigDebugAssert3();
    v30 = 0;
  }

  return v30;
}

@end