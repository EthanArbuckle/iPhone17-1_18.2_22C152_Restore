@interface UniSourceOver
- (CGRect)extentForImage;
- (UniSourceOver)init;
- (UniSourceOver)initWithDevice:(id)a3;
- (id)inputNameArray;
- (id)outputImage:(id)a3;
- (id)outputNameArray;
- (id)run:(id)a3;
@end

@implementation UniSourceOver

- (UniSourceOver)init
{
  v3.receiver = self;
  v3.super_class = (Class)UniSourceOver;
  return [(UniKernel *)&v3 init];
}

- (UniSourceOver)initWithDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UniSourceOver;
  v5 = [(UniKernel *)&v9 init];
  v7 = v5;
  if (v5) {
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);
  }

  return v7;
}

- (id)run:(id)a3
{
  v70[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_inputs(self, v5, v6);
  uint64_t v9 = objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x263F00968]);

  v11 = objc_msgSend__mtlTextureForImage_(UniKernel, v10, v9);
  if (!v11) {
    sub_262E4E840();
  }
  v14 = v11;
  v66 = (void *)v9;
  v15 = objc_msgSend_device(v11, v12, v13);
  v65 = v15;
  if (v4) {
    id v18 = v4;
  }
  else {
    id v18 = (id)objc_msgSend_newCommandQueue(v15, v16, v17);
  }
  v21 = v18;
  v22 = objc_msgSend_commandBuffer(v18, v19, v20);
  v23 = objc_opt_class();
  v26 = objc_msgSend_description(v23, v24, v25);
  objc_msgSend_setLabel_(v22, v27, (uint64_t)v26);

  v30 = objc_msgSend_inputs(self, v28, v29);
  v32 = objc_msgSend_objectForKey_(v30, v31, @"inputBlitImage");

  v34 = objc_msgSend__mtlTextureForImage_(UniKernel, v33, (uint64_t)v32);
  v37 = objc_msgSend_inputs(self, v35, v36);
  v39 = objc_msgSend_objectForKey_(v37, v38, @"destOrigin");

  v42 = objc_msgSend_blitCommandEncoder(v22, v40, v41);
  memset(v69, 0, sizeof(v69));
  v68[0] = objc_msgSend_width(v34, v43, v44);
  v68[1] = objc_msgSend_height(v34, v45, v46);
  v68[2] = 1;
  objc_msgSend_X(v39, v47, v48);
  unint64_t v50 = (unint64_t)v49;
  uint64_t v53 = objc_msgSend_height(v14, v51, v52);
  objc_msgSend_Y(v39, v54, v55);
  v67[0] = v50;
  v67[1] = v53 - (objc_msgSend_height(v34, v57, v58) + (unint64_t)v56);
  v67[2] = 0;
  objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(v42, v59, (uint64_t)v34, 0, 0, v69, v68, v14, 0, 0, v67);
  objc_msgSend_endEncoding(v42, v60, v61);
  v70[0] = v22;
  v70[1] = v14;
  v63 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v62, (uint64_t)v70, 2);

  return v63;
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
  v102[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_copy(self, v5, v6);
  uint64_t v10 = objc_msgSend_inputs(v7, v8, v9);
  uint64_t v11 = *MEMORY[0x263F00968];
  double v13 = objc_msgSend_objectForKeyedSubscript_(v10, v12, *MEMORY[0x263F00968]);
  double v15 = objc_msgSend__ciImageForInput_(v7, v14, (uint64_t)v13);

  if (!v15) {
    sub_262E4E86C();
  }
  v96 = v4;
  id v16 = v15;
  double v19 = objc_msgSend_inputs(v7, v17, v18);
  double v21 = objc_msgSend_objectForKey_(v19, v20, @"inputBlitImage");

  v23 = objc_msgSend__ciImageForInput_(v7, v22, (uint64_t)v21);
  v26 = objc_msgSend_inputs(v7, v24, v25);
  v28 = objc_msgSend_objectForKey_(v26, v27, @"destOrigin");

  v31 = objc_msgSend_inputs(v7, v29, v30);
  v33 = objc_msgSend_objectForKey_(v31, v32, @"_scale");

  if (v23)
  {
    float v36 = 1.0;
    if (v33)
    {
      objc_msgSend_floatValue(v33, v34, v35);
      float v36 = v37;
    }
    CGAffineTransformMakeScale(&v100, 1.0, -1.0);
    v39 = objc_msgSend_imageByApplyingTransform_(v23, v38, (uint64_t)&v100);

    objc_msgSend_extent(v39, v40, v41);
    CGFloat v43 = -v42;
    objc_msgSend_extent(v39, v44, v45);
    CGAffineTransformMakeTranslation(&v99, v43, -v46);
    uint64_t v48 = objc_msgSend_imageByApplyingTransform_(v39, v47, (uint64_t)&v99);

    double v51 = v36;
    if (v36 != 1.0)
    {
      CGAffineTransformMakeScale(&v98, v36, v36);
      uint64_t v53 = objc_msgSend_imageByApplyingTransform_(v48, v52, (uint64_t)&v98);

      uint64_t v48 = (void *)v53;
    }
    objc_msgSend_X(v28, v49, v50);
    CGFloat v55 = v54 * v51;
    objc_msgSend_Y(v28, v56, v57);
    CGAffineTransformMakeTranslation(&v97, v55, v58 * v51);
    v23 = objc_msgSend_imageByApplyingTransform_(v48, v59, (uint64_t)&v97);

    uint64_t v101 = *MEMORY[0x263F00930];
    v102[0] = v16;
    uint64_t v61 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v60, (uint64_t)v102, &v101, 1);
    v63 = objc_msgSend_imageByApplyingFilter_withInputParameters_(v23, v62, @"CISourceOverCompositing", v61);

    objc_msgSend_extent(v63, v64, v65);
    CGFloat v67 = v66;
    CGFloat v69 = v68;
    CGFloat v71 = v70;
    CGFloat v73 = v72;
    objc_msgSend_extent(v16, v74, v75);
    v105.origin.x = v76;
    v105.origin.y = v77;
    v105.size.width = v78;
    v105.size.height = v79;
    v104.origin.x = v67;
    v104.origin.y = v69;
    v104.size.width = v71;
    v104.size.height = v73;
    if (!CGRectEqualToRect(v104, v105))
    {
      objc_msgSend_extent(v16, v34, v80);
      uint64_t v83 = objc_msgSend_imageByCroppingToRect_(v63, v81, v82);

      v63 = (void *)v83;
    }
    if (!v63) {
      goto LABEL_14;
    }
  }
  else
  {
    v63 = v16;
  }
  v84 = objc_msgSend_imageWithCIImage_(UniImage, v34, (uint64_t)v63);
  if (v84)
  {
    v86 = v84;
    objc_msgSend_setKernel_(v84, v85, (uint64_t)v7);
    goto LABEL_15;
  }
LABEL_14:
  v89 = [UniImage alloc];
  v86 = objc_msgSend_initWithKernel_(v89, v90, (uint64_t)v7);
LABEL_15:
  v91 = objc_msgSend_inputs(v7, v87, v88);
  v93 = objc_msgSend_objectForKeyedSubscript_(v91, v92, v11);
  objc_msgSend_setTexture_(v86, v94, (uint64_t)v93);

  return v86;
}

- (id)inputNameArray
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F00968];
  v4[1] = @"inputBlitImage";
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 2);

  return v2;
}

- (id)outputNameArray
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F00968];
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

@end