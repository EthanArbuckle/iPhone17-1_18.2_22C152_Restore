@interface UniGaussianBlur
- (UniGaussianBlur)init;
- (UniGaussianBlur)initWithDevice:(id)a3;
- (id)inputNameArray;
- (id)outputImage:(id)a3;
- (id)outputNameArray;
- (id)run:(id)a3;
@end

@implementation UniGaussianBlur

- (UniGaussianBlur)init
{
  v3.receiver = self;
  v3.super_class = (Class)UniGaussianBlur;
  return [(UniKernel *)&v3 init];
}

- (UniGaussianBlur)initWithDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UniGaussianBlur;
  v5 = [(UniKernel *)&v9 init];
  v7 = v5;
  if (v5) {
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);
  }

  return v7;
}

- (id)run:(id)a3
{
  v74[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v73[0] = @"name";
  v73[1] = @"inputRadius";
  v74[0] = @"MPSImageGaussianBlur";
  v7 = objc_msgSend_inputs(self, v5, v6);
  uint64_t v8 = *MEMORY[0x263F00980];
  v10 = objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x263F00980]);
  v74[1] = v10;
  v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v74, v73, 2);

  v15 = objc_msgSend_device(v4, v13, v14);
  v17 = objc_msgSend_findKernel_device_(UniDeviceCache, v16, (uint64_t)v12, v15);

  v18 = NSString;
  v21 = objc_msgSend_inputs(self, v19, v20);
  v23 = objc_msgSend_objectForKeyedSubscript_(v21, v22, v8);
  v25 = objc_msgSend_stringWithFormat_(v18, v24, @"GaussianBlur_sigma_%@", v23);
  objc_msgSend_setLabel_(v17, v26, (uint64_t)v25);

  if (!v17) {
    sub_262E4CBC0();
  }
  if (v4)
  {
    id v31 = v4;
  }
  else
  {
    v32 = objc_msgSend_device(self, v27, v28);
    id v31 = (id)objc_msgSend_newCommandQueue(v32, v33, v34);
  }
  v35 = objc_msgSend_commandBuffer(v31, v29, v30);
  v38 = objc_msgSend_mk(self, v36, v37);
  v43 = objc_msgSend_label(v38, v39, v40);
  if (v43)
  {
    v44 = objc_msgSend_mk(self, v41, v42);
    v47 = objc_msgSend_label(v44, v45, v46);
    objc_msgSend_setLabel_(v35, v48, (uint64_t)v47);
  }
  else
  {
    v49 = objc_opt_class();
    v44 = objc_msgSend_description(v49, v50, v51);
    objc_msgSend_setLabel_(v35, v52, (uint64_t)v44);
  }

  v55 = objc_msgSend_inputs(self, v53, v54);
  v57 = objc_msgSend_objectForKeyedSubscript_(v55, v56, *MEMORY[0x263F00968]);
  v59 = objc_msgSend__mtlTextureForImage_(UniKernel, v58, (uint64_t)v57);
  id v71 = v59;

  v62 = objc_msgSend_inputs(self, v60, v61);
  v64 = objc_msgSend_objectForKeyedSubscript_(v62, v63, *MEMORY[0x263F009D0]);
  v66 = objc_msgSend__mtlTextureForImage_(UniKernel, v65, (uint64_t)v64);

  if (!v59) {
    sub_262E4CBEC();
  }
  if (!v66) {
    sub_262E4CC18();
  }
  if (v59 == v66) {
    objc_msgSend_encodeToCommandBuffer_inPlaceTexture_fallbackCopyAllocator_(v17, v67, (uint64_t)v35, &v71, 0);
  }
  else {
    objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(v17, v67, (uint64_t)v35, v59, v66);
  }
  v72[0] = v35;
  v72[1] = v66;
  v69 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v68, (uint64_t)v72, 2);

  return v69;
}

- (id)outputImage:(id)a3
{
  v57[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_copy(self, v5, v6);
  v10 = objc_msgSend_inputs(v7, v8, v9);
  v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x263F00968]);
  uint64_t v14 = objc_msgSend__ciImageForInput_(v7, v13, (uint64_t)v12);

  if (!v14) {
    sub_262E4CC44();
  }
  objc_msgSend_extent(v14, v15, v16);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v27 = objc_msgSend_imageByClampingToExtent(v14, v25, v26);

  uint64_t v56 = *MEMORY[0x263F00980];
  uint64_t v30 = objc_msgSend_inputs(v7, v28, v29);
  v32 = objc_msgSend_objectForKeyedSubscript_(v30, v31, v56);
  v57[0] = v32;
  uint64_t v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v33, (uint64_t)v57, &v56, 1);
  v36 = objc_msgSend_imageByApplyingFilter_withInputParameters_(v27, v35, @"CIGaussianBlur", v34);
  v39 = objc_msgSend_imageByCroppingToRect_(v36, v37, v38, v18, v20, v22, v24);

  if (v39
    && (objc_msgSend_imageWithCIImage_(UniImage, v40, (uint64_t)v39),
        (v41 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v43 = v41;
    objc_msgSend_setKernel_(v41, v42, (uint64_t)v7);
  }
  else
  {
    uint64_t v46 = [UniImage alloc];
    v43 = objc_msgSend_initWithKernel_(v46, v47, (uint64_t)v7);
  }
  v48 = objc_msgSend_inputs(v7, v44, v45);
  v50 = objc_msgSend_objectForKeyedSubscript_(v48, v49, *MEMORY[0x263F009D0]);
  objc_msgSend_setTexture_(v43, v51, (uint64_t)v50);

  uint64_t v54 = objc_msgSend_texture(v43, v52, v53);
  if (!v54) {
    sub_262E4CC70();
  }

  return v43;
}

- (id)inputNameArray
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F00968];
  v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

- (id)outputNameArray
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F009D0];
  v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

@end