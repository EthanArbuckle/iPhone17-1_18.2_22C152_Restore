@interface PISpatioTemporalGuidedFilterProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)outputIsOpaque;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation PISpatioTemporalGuidedFilterProcessor

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E4F1E300];
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (int)outputFormat
{
  return *MEMORY[0x1E4F1E300];
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v72 = [v10 metalCommandBuffer];
  uint64_t v11 = [v72 device];
  v12 = [v8 objectAtIndexedSubscript:0];
  v75 = v8;
  uint64_t v69 = [v8 objectAtIndexedSubscript:1];
  v70 = v12;
  v13 = [v12 metalTexture];
  v73 = v10;
  v80 = [v10 metalTexture];
  uint64_t v14 = [v13 width];
  uint64_t v15 = [v13 height];
  uint64_t v16 = [v9 objectForKeyedSubscript:@"epsilon"];
  v17 = (void *)v16;
  v18 = &unk_1F000A2C8;
  if (v16) {
    v18 = (void *)v16;
  }
  unint64_t v19 = v18;

  uint64_t v20 = [v9 objectForKeyedSubscript:@"radius"];
  v21 = (void *)v20;
  v22 = &unk_1F0009920;
  if (v20) {
    v22 = (void *)v20;
  }
  id v23 = v22;

  uint64_t v24 = [v9 objectForKeyedSubscript:@"channels"];
  v25 = (void *)v24;
  if (v24) {
    v26 = (__CFString *)v24;
  }
  else {
    v26 = @"RGB";
  }
  v27 = v26;

  v76 = v27;
  int v28 = [(__CFString *)v27 isEqualToString:@"RGB"];
  uint64_t v29 = [v9 objectForKeyedSubscript:@"iterations"];
  v30 = (void *)v29;
  v31 = &unk_1F0009938;
  if (v29) {
    v31 = (void *)v29;
  }
  id v78 = v31;

  v74 = v9;
  v32 = [v9 objectForKeyedSubscript:@"constrainToAlpha"];
  int v33 = [v32 BOOLValue];

  v34 = (void *)MEMORY[0x1E4F355D8];
  v67 = v23;
  uint64_t v35 = (2 * [v23 unsignedIntegerValue]) | 1;
  v68 = (void *)v19;
  [(id)v19 floatValue];
  if (v28) {
    uint64_t v36 = 3;
  }
  else {
    uint64_t v36 = 1;
  }
  objc_msgSend(v34, "filterDescriptorWithWidth:height:arrayLength:kernelSpatialDiameter:kernelTemporalDiameter:epsilon:sourceChannels:guideChannels:", v14, v15, 1, v35, 1, v36, 3);
  v66 = v71 = (void *)v11;
  v37 = (void *)[objc_alloc(MEMORY[0x1E4F355D0]) initWithDevice:v11 filterDescriptor:v66];
  id v81 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v77 = 0;
  int v64 = v33;
  if (v33) {
    v77 = objc_msgSend(v13, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", objc_msgSend(v13, "pixelFormat"), objc_msgSend(v13, "textureType"), 0, 1, 0, 1, 17106181);
  }
  v38 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, objc_msgSend(v80, "width"), objc_msgSend(v80, "height"), 0);
  [v38 setStorageMode:2];
  [v38 setUsage:3];
  v65 = v37;
  if (v28)
  {
    int v63 = v28;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v39 = [&unk_1F000AA60 countByEnumeratingWithState:&v82 objects:v89 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v83 != v41) {
            objc_enumerationMutation(&unk_1F000AA60);
          }
          unint64_t v19 = (65793 * [*(id *)(*((void *)&v82 + 1) + 8 * i) unsignedCharValue]) | v19 & 0xFFFFFFFF00000000 | 0x1000000;
          v43 = objc_msgSend(v13, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", objc_msgSend(v13, "pixelFormat"), objc_msgSend(v13, "textureType"), 0, 1, 0, 1, v19);
          [v81 addObject:v43];
          v44 = [v80 device];
          v45 = (void *)[v44 newTextureWithDescriptor:v38];

          [v79 addObject:v45];
        }
        uint64_t v40 = [&unk_1F000AA60 countByEnumeratingWithState:&v82 objects:v89 count:16];
      }
      while (v40);
    }
    if (v64)
    {
      v88[0] = v77;
      v88[1] = v77;
      v88[2] = v77;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:3];
    }
    else
    {
      v46 = 0;
    }
    v50 = v72;
    v48 = (void *)v69;
    v37 = v65;
    int v28 = v63;
    v49 = v79;
  }
  else
  {
    if ([(__CFString *)v76 isEqualToString:@"Red"])
    {
      uint64_t v47 = 16908802;
      v48 = (void *)v69;
      v49 = v79;
    }
    else
    {
      v48 = (void *)v69;
      v49 = v79;
      if ([(__CFString *)v76 isEqualToString:@"Green"])
      {
        uint64_t v47 = 16974595;
      }
      else if ([(__CFString *)v76 isEqualToString:@"Blue"])
      {
        uint64_t v47 = 17040388;
      }
      else
      {
        uint64_t v47 = 0x1000000;
      }
    }
    v51 = objc_msgSend(v13, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", objc_msgSend(v13, "pixelFormat"), objc_msgSend(v13, "textureType"), 0, 1, 0, 1, v47);
    [v81 addObject:v51];
    v46 = 0;
    if (v33)
    {
      v87 = v77;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
    }
    v52 = [v80 device];
    v53 = (void *)[v52 newTextureWithDescriptor:v38];

    [v49 addObject:v53];
    v50 = v72;
  }
  v54 = [v48 metalTexture];
  objc_msgSend(v37, "encodeToCommandBuffer:sourceTextureArray:guidanceTexture:constraintsTextureArray:numberOfIterations:destinationTextureArray:", v50, v81, v54, v46, objc_msgSend(v78, "unsignedIntegerValue"), v49);

  if (v28)
  {
    v55 = v80;
    +[PICombineRGBKernel combineRGBTextures:v49 intoDestinationTexture:v80 withCommandBuffer:v50];
  }
  else
  {
    v56 = [v49 objectAtIndexedSubscript:0];
    v86[0] = v56;
    v57 = [v49 objectAtIndexedSubscript:0];
    v86[1] = v57;
    [v49 objectAtIndexedSubscript:0];
    v58 = v48;
    v60 = v59 = v46;
    v86[2] = v60;
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:3];
    v55 = v80;
    +[PICombineRGBKernel combineRGBTextures:v61 intoDestinationTexture:v80 withCommandBuffer:v50];

    v49 = v79;
    v46 = v59;
    v48 = v58;

    v37 = v65;
  }

  return 1;
}

@end