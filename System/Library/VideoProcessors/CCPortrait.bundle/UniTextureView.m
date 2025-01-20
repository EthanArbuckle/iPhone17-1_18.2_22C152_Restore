@interface UniTextureView
- (CGRect)extentForImage;
- (UniTextureView)init;
- (UniTextureView)initWithDevice:(id)a3;
- (id)inputNameArray;
- (id)outputImage:(id)a3;
- (id)outputNameArray;
- (id)run:(id)a3;
- (id)sibling:(id)a3;
@end

@implementation UniTextureView

- (UniTextureView)init
{
  v3.receiver = self;
  v3.super_class = (Class)UniTextureView;
  return [(UniKernel *)&v3 init];
}

- (UniTextureView)initWithDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UniTextureView;
  v5 = [(UniKernel *)&v9 init];
  v7 = v5;
  if (v5) {
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);
  }

  return v7;
}

- (id)sibling:(id)a3
{
  id v4 = a3;
  if (!v4) {
    sub_262E4EA88();
  }
  v7 = v4;
  if ((objc_msgSend_usage(v4, v5, v6) & 0x10) == 0) {
    sub_262E4EAB4();
  }
  uint64_t v10 = objc_msgSend_pixelFormat(v7, v8, v9);
  if (v10 > 30)
  {
    switch(v10)
    {
      case 31:
        uint64_t v13 = 30;
        goto LABEL_17;
      case 70:
        uint64_t v13 = 71;
        goto LABEL_17;
      case 71:
        uint64_t v13 = 70;
        goto LABEL_17;
    }
LABEL_16:
    uint64_t v13 = 0;
    goto LABEL_17;
  }
  if (v10 == 10)
  {
    uint64_t v13 = 11;
    goto LABEL_17;
  }
  if (v10 == 11)
  {
    uint64_t v13 = 10;
    goto LABEL_17;
  }
  if (v10 != 30) {
    goto LABEL_16;
  }
  uint64_t v13 = 31;
LABEL_17:
  v14 = objc_msgSend_inputs(self, v11, v12);
  v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"desiredFormat");

  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = objc_msgSend_unsignedIntegerValue(v16, v17, v18);
    }
  }
  if (!v13) {
    sub_262E4EAE0();
  }
  v19 = objc_msgSend_parentTexture(v7, v17, v18);
  v22 = v19;
  if (v19 && objc_msgSend_pixelFormat(v19, v20, v21) == v13) {
    id v23 = v22;
  }
  else {
    id v23 = (id)objc_msgSend_newTextureViewWithPixelFormat_(v7, v20, v13);
  }
  v24 = v23;

  return v24;
}

- (id)run:(id)a3
{
  v54[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_inputs(self, v5, v6);
  uint64_t v9 = objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x263F009D0]);

  if (!v9) {
    sub_262E4EB0C();
  }
  uint64_t v12 = objc_msgSend_device(v9, v10, v11);
  v15 = v12;
  if (v4) {
    id v16 = v4;
  }
  else {
    id v16 = (id)objc_msgSend_newCommandQueue(v12, v13, v14);
  }
  v19 = v16;
  v20 = objc_msgSend_commandBuffer(v16, v17, v18);
  id v23 = objc_msgSend_mk(self, v21, v22);
  v28 = objc_msgSend_label(v23, v24, v25);
  if (v28)
  {
    v29 = objc_msgSend_mk(self, v26, v27);
    v32 = objc_msgSend_label(v29, v30, v31);
    objc_msgSend_setLabel_(v20, v33, (uint64_t)v32);
  }
  else
  {
    v34 = objc_opt_class();
    v29 = objc_msgSend_description(v34, v35, v36);
    objc_msgSend_setLabel_(v20, v37, (uint64_t)v29);
  }

  v40 = objc_msgSend_inputs(self, v38, v39);
  v42 = objc_msgSend_objectForKey_(v40, v41, *MEMORY[0x263F00968]);

  v44 = objc_msgSend__mtlTextureForImage_(UniKernel, v43, (uint64_t)v42);
  if (!v44) {
    sub_262E4EB38();
  }
  v47 = v44;
  uint64_t v48 = objc_msgSend_pixelFormat(v44, v45, v46);
  if (v48 == objc_msgSend_pixelFormat(v9, v49, v50)) {
    sub_262E4EB64();
  }
  v54[0] = v20;
  v54[1] = v9;
  v52 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v51, (uint64_t)v54, 2);

  return v52;
}

- (CGRect)extentForImage
{
  id v4 = objc_msgSend_inputs(self, a2, v2);
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v4, v5, *MEMORY[0x263F00968]);
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
  v81[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_copy(self, v5, v6);
  uint64_t v10 = objc_msgSend_inputs(v7, v8, v9);
  uint64_t v11 = *MEMORY[0x263F00968];
  double v13 = objc_msgSend_objectForKeyedSubscript_(v10, v12, *MEMORY[0x263F00968]);
  double v15 = objc_msgSend__ciImageForInput_(v7, v14, (uint64_t)v13);

  if (!v15) {
    sub_262E4EB90();
  }
  v79 = v4;
  id v16 = v15;
  double v19 = objc_msgSend_inputs(v7, v17, v18);
  double v21 = objc_msgSend_objectForKeyedSubscript_(v19, v20, @"desiredFormat");

  id v23 = v16;
  if (!v21) {
    goto LABEL_17;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    uint64_t v25 = v21;
  }
  else {
    uint64_t v25 = 0;
  }
  id v28 = v25;
  uint64_t v29 = 0;
  if (isKindOfClass) {
    uint64_t v29 = objc_msgSend_unsignedIntegerValue(v21, v26, v27, v4);
  }
  v30 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v26, @"ur_sRGB_to_Linear", v79);
  v34 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v31, @"ur_Linear_to_sRGB");
  if (v29 == 70)
  {
    objc_msgSend_extent(v16, v32, v33);
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    id v80 = v16;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v54, (uint64_t)&v80, 1);
    v44 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_(v34, v55, (uint64_t)v44, v47, v49, v51, v53);
    goto LABEL_12;
  }
  if (v29 == 71)
  {
    objc_msgSend_extent(v16, v32, v33);
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    v81[0] = v16;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v43, (uint64_t)v81, 1);
    v44 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_(v30, v45, (uint64_t)v44, v36, v38, v40, v42);
    id v23 = LABEL_12:;

    goto LABEL_16;
  }
  uni_logger_api();
  v44 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR)) {
    sub_262E4EBBC((uint64_t)v21, v44);
  }
  id v23 = v16;
LABEL_16:

  if (!v23)
  {
LABEL_19:
    v61 = [UniImage alloc];
    v58 = objc_msgSend_initWithKernel_(v61, v62, (uint64_t)v7);
    goto LABEL_20;
  }
LABEL_17:
  v56 = objc_msgSend_imageWithCIImage_(UniImage, v22, (uint64_t)v23, v79);
  if (!v56) {
    goto LABEL_19;
  }
  v58 = v56;
  objc_msgSend_setKernel_(v56, v57, (uint64_t)v7);
LABEL_20:
  v63 = objc_msgSend_inputs(v7, v59, v60);
  v65 = objc_msgSend_objectForKeyedSubscript_(v63, v64, v11);
  v67 = objc_msgSend__mtlTextureForImage_(UniKernel, v66, (uint64_t)v65);

  v70 = (uint64_t *)MEMORY[0x263F009D0];
  if (v67 && objc_msgSend_conformsToProtocol_(v67, v68, (uint64_t)&unk_270E2A1A0))
  {
    uint64_t v71 = objc_msgSend_sibling_(v7, v68, (uint64_t)v67);

    if (v71)
    {
      v72 = objc_msgSend_inputs(v7, v68, v69);
      objc_msgSend_setObject_forKeyedSubscript_(v72, v73, v71, *v70);

      v67 = (void *)v71;
    }
    else
    {
      v67 = 0;
    }
  }
  v74 = objc_msgSend_inputs(v7, v68, v69);
  v76 = objc_msgSend_objectForKeyedSubscript_(v74, v75, *v70);
  objc_msgSend_setTexture_(v58, v77, (uint64_t)v76);

  return v58;
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

@end