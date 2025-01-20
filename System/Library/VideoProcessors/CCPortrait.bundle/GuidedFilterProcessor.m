@interface GuidedFilterProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation GuidedFilterProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  v48[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14 = objc_msgSend_metalCommandBuffer(v11, v12, v13);
  v17 = objc_msgSend_device(v14, v15, v16);
  v20 = objc_msgSend_findKernel_device_(UniDeviceCache, v18, (uint64_t)v10, v17);
  if (v20)
  {
    v44 = v17;
    v21 = objc_msgSend_objectAtIndexedSubscript_(v9, v19, 0);
    uint64_t v24 = objc_msgSend_metalTexture(v21, v22, v23);

    id v45 = v9;
    v26 = objc_msgSend_objectAtIndexedSubscript_(v9, v25, 1);
    v46 = objc_msgSend_metalTexture(v26, v27, v28);

    v31 = objc_msgSend_metalTexture(v11, v29, v30);
    v43 = (void *)v24;
    v48[0] = v24;
    v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v32, (uint64_t)v48, 1);
    v36 = objc_msgSend_objectForKeyedSubscript_(v10, v34, @"iterations");
    if (v36)
    {
      v6 = objc_msgSend_objectForKeyedSubscript_(v10, v35, @"iterations");
      uint64_t v39 = objc_msgSend_unsignedIntegerValue(v6, v37, v38);
    }
    else
    {
      uint64_t v39 = 50;
    }
    v47 = v31;
    v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v35, (uint64_t)&v47, 1);
    objc_msgSend_encodeToCommandBuffer_sourceTextureArray_guidanceTexture_constraintsTextureArray_numberOfIterations_destinationTextureArray_(v20, v41, (uint64_t)v14, v33, v46, 0, v39, v40);

    if (v36) {
    v17 = v44;
    }
    id v9 = v45;
  }

  return v20 != 0;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3)
  {
    if (a3 != 1) {
      sub_262E4CC9C();
    }
    v3 = (int *)MEMORY[0x263F00868];
  }
  else
  {
    v3 = (int *)MEMORY[0x263F008D0];
  }
  return *v3;
}

+ (int)outputFormat
{
  return *MEMORY[0x263F008D0];
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  id v6 = a4;
  v8 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"imageExtents");
  if (!v8) {
    sub_262E4CCC8();
  }

  id v10 = objc_msgSend_objectForKeyedSubscript_(v6, v9, @"imageExtents");
  if (objc_msgSend_count(v10, v11, v12) <= (unint64_t)a3) {
    sub_262E4CCF4();
  }

  v14 = objc_msgSend_objectForKeyedSubscript_(v6, v13, @"imageExtents");
  uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(v14, v15, a3);
  objc_msgSend_CGRectValue(v16, v17, v18);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

@end