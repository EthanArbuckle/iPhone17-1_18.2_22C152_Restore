@interface UniMorphology
- (CGRect)extentForImage;
- (UniMorphology)initWithDevice:(id)a3;
- (id)inputNameArray;
- (id)outputImage:(id)a3;
- (id)outputNameArray;
- (id)run:(id)a3;
- (int)_loadShaders:(id)a3;
@end

@implementation UniMorphology

- (UniMorphology)initWithDevice:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UniMorphology;
  v5 = [(UniKernel *)&v10 init];
  v7 = v5;
  if (v5)
  {
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);
    objc_msgSend__loadShaders_(v7, v8, (uint64_t)v4);
  }

  return v7;
}

- (id)run:(id)a3
{
  v69[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_inputs(self, v5, v6);
  uint64_t v9 = objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x263F00968]);

  v12 = objc_msgSend_inputs(self, v10, v11);
  uint64_t v14 = objc_msgSend_objectForKey_(v12, v13, *MEMORY[0x263F009D0]);

  v16 = objc_msgSend__mtlTextureForImage_(UniKernel, v15, v9);
  id v68 = v16;
  uint64_t v18 = objc_msgSend__mtlTextureForImage_(UniKernel, v17, v14);
  if (!v16) {
    sub_262E493D4();
  }
  v21 = (void *)v18;
  if (!v18) {
    sub_262E49400();
  }
  v22 = objc_msgSend_inputs(self, v19, v20);
  v24 = objc_msgSend_objectForKey_(v22, v23, *MEMORY[0x263F00980]);

  v27 = objc_msgSend_inputs(self, v25, v26);
  v29 = objc_msgSend_objectForKey_(v27, v28, @"inputDoMin");

  v32 = objc_msgSend_device(v16, v30, v31);
  v35 = v32;
  uint64_t v65 = v14;
  v67 = (void *)v9;
  if (v4) {
    id v36 = v4;
  }
  else {
    id v36 = (id)objc_msgSend_newCommandQueue(v32, v33, v34, v14, v9);
  }
  v39 = v36;
  v40 = objc_msgSend_commandBuffer(v36, v37, v38, v65);
  v41 = objc_opt_class();
  v44 = objc_msgSend_description(v41, v42, v43);
  objc_msgSend_setLabel_(v40, v45, (uint64_t)v44);

  if (v29)
  {
    int v48 = objc_msgSend_BOOLValue(v29, v46, v47);
    objc_msgSend_floatValue(v24, v49, v50);
    float v52 = v51;
    if (!v48)
    {
      v53 = (objc_class *)MEMORY[0x263F13230];
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend_floatValue(v24, v46, v47);
    float v52 = v54;
  }
  v53 = (objc_class *)MEMORY[0x263F13238];
LABEL_11:
  id v55 = [v53 alloc];
  v58 = objc_msgSend_device(v4, v56, v57);
  v60 = objc_msgSend_initWithDevice_kernelWidth_kernelHeight_(v55, v59, (uint64_t)v58, (unint64_t)v52, (unint64_t)v52);

  if (!v60) {
    sub_262E4942C();
  }
  if (v16 == v21) {
    objc_msgSend_encodeToCommandBuffer_inPlaceTexture_fallbackCopyAllocator_(v60, v61, (uint64_t)v40, &v68, 0);
  }
  else {
    objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(v60, v61, (uint64_t)v40, v16, v21);
  }
  v69[0] = v40;
  v69[1] = v21;
  v63 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v62, (uint64_t)v69, 2);

  return v63;
}

- (CGRect)extentForImage
{
  id v4 = objc_msgSend_inputs(self, a2, v2);
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v4, v5, *MEMORY[0x263F009D0]);
  v8 = objc_msgSend__ciImageForInput_(self, v7, (uint64_t)v6);

  objc_msgSend_extent(v8, v9, v10);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)outputImage:(id)a3
{
  v63[2] = *MEMORY[0x263EF8340];
  v3 = objc_msgSend_copy(self, a2, (uint64_t)a3);
  uint64_t v6 = objc_msgSend_inputs(v3, v4, v5);
  v8 = objc_msgSend_objectForKey_(v6, v7, *MEMORY[0x263F00968]);

  uint64_t v10 = objc_msgSend__ciImageForInput_(v3, v9, (uint64_t)v8);
  double v13 = objc_msgSend_inputs(v3, v11, v12);
  double v15 = objc_msgSend_objectForKey_(v13, v14, *MEMORY[0x263F00980]);

  double v18 = objc_msgSend_inputs(v3, v16, v17);
  double v20 = objc_msgSend_objectForKey_(v18, v19, @"inputDoMin");

  id v23 = v10;
  if (v23)
  {
    v24 = @"CIMorphologyRectangleMinimum";
    if (v20 && !objc_msgSend_BOOLValue(v20, v21, v22)) {
      v24 = @"CIMorphologyRectangleMaximum";
    }
    v25 = v24;
    objc_msgSend_floatValue(v15, v26, v27);
    if (v30 <= 0.001)
    {

      v45 = v23;
    }
    else
    {
      objc_msgSend_extent(v23, v28, v29);
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      v41 = objc_msgSend_imageByClampingToExtent(v23, v39, v40);

      v62[0] = @"inputWidth";
      v62[1] = @"inputHeight";
      v63[0] = v15;
      v63[1] = v15;
      uint64_t v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v42, (uint64_t)v63, v62, 2);
      v45 = objc_msgSend_imageByApplyingFilter_withInputParameters_(v41, v44, (uint64_t)v25, v43);

      v65.origin.x = v32;
      v65.origin.y = v34;
      v65.size.width = v36;
      v65.size.height = v38;
      if (!CGRectIsInfinite(v65))
      {
        uint64_t v48 = objc_msgSend_imageByCroppingToRect_(v45, v46, v47, v32, v34, v36, v38);

        v45 = (void *)v48;
      }

      if (!v45) {
        goto LABEL_14;
      }
    }
    uint64_t v50 = objc_msgSend_imageWithCIImage_(UniImage, v49, (uint64_t)v45);
    if (v50)
    {
      float v52 = v50;
      objc_msgSend_setKernel_(v50, v51, (uint64_t)v3);
      goto LABEL_15;
    }
  }
  else
  {
    v45 = 0;
  }
LABEL_14:
  id v55 = [UniImage alloc];
  float v52 = objc_msgSend_initWithKernel_(v55, v56, (uint64_t)v3);
LABEL_15:
  uint64_t v57 = objc_msgSend_inputs(v3, v53, v54);
  v59 = objc_msgSend_objectForKeyedSubscript_(v57, v58, *MEMORY[0x263F009D0]);
  objc_msgSend_setTexture_(v52, v60, (uint64_t)v59);

  return v52;
}

- (id)inputNameArray
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F00968];
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

- (id)outputNameArray
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F009D0];
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

- (int)_loadShaders:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->kernelMax, 0);

  objc_storeStrong((id *)&self->kernelMin, 0);
}

@end