@interface UniScaleImage
- (CGRect)extentForImage;
- (UniScaleImage)initWithDevice:(id)a3;
- (id)_identifyGPU:(id)a3;
- (id)inputNameArray;
- (id)outputImage:(id)a3;
- (id)outputNameArray;
- (id)run:(id)a3;
- (int)_loadShaders:(id)a3;
@end

@implementation UniScaleImage

- (UniScaleImage)initWithDevice:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UniScaleImage;
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
  v68[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_inputs(self, v5, v6);
  v9 = objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x263F00968]);

  v12 = objc_msgSend_inputs(self, v10, v11);
  v14 = objc_msgSend_objectForKey_(v12, v13, *MEMORY[0x263F009D0]);

  v16 = objc_msgSend__mtlTextureForImage_(UniKernel, v15, (uint64_t)v9);
  uint64_t v18 = objc_msgSend__mtlTextureForImage_(UniKernel, v17, (uint64_t)v14);
  if (!v16) {
    sub_262E4E898();
  }
  v21 = (void *)v18;
  if (!v18) {
    sub_262E4E8C4();
  }
  v22 = objc_msgSend_device(v16, v19, v20);
  v64 = v22;
  if (v4) {
    id v25 = v4;
  }
  else {
    id v25 = (id)objc_msgSend_newCommandQueue(v22, v23, v24);
  }
  v28 = v25;
  v29 = objc_msgSend_commandBuffer(v25, v26, v27);
  v30 = objc_opt_class();
  v33 = objc_msgSend_description(v30, v31, v32);
  objc_msgSend_setLabel_(v29, v34, (uint64_t)v33);

  if (self->_downsampleRGBA)
  {
    uint64_t v37 = objc_msgSend_width(v16, v35, v36);
    if (v37 == objc_msgSend_width(v21, v38, v39)
      && (uint64_t v42 = objc_msgSend_height(v16, v40, v41), v42 == objc_msgSend_height(v21, v43, v44)))
    {
      v45 = objc_msgSend_blitCommandEncoder(v29, v40, v41);
      objc_msgSend_copyFromTexture_toTexture_(v45, v46, (uint64_t)v16, v21);
      objc_msgSend_endEncoding(v45, v47, v48);
    }
    else
    {
      v50 = objc_msgSend_computeCommandEncoder(v29, v40, v41);
      objc_msgSend_setComputePipelineState_(v50, v51, (uint64_t)self->_downsampleRGBA);
      objc_msgSend_setTexture_atIndex_(v50, v52, (uint64_t)v16, 0);
      objc_msgSend_setTexture_atIndex_(v50, v53, (uint64_t)v21, 1);
      v67[0] = (unint64_t)(objc_msgSend_width(v21, v54, v55) + 15) >> 4;
      v67[1] = (unint64_t)(objc_msgSend_height(v21, v56, v57) + 15) >> 4;
      v67[2] = 1;
      int64x2_t v65 = vdupq_n_s64(0x10uLL);
      uint64_t v66 = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v50, v58, (uint64_t)v67, &v65);
      objc_msgSend_endEncoding(v50, v59, v60);
    }
    v61 = v64;
    v68[0] = v29;
    v68[1] = v21;
    v62 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v49, (uint64_t)v68, 2);
  }
  else
  {
    v62 = 0;
    v61 = v64;
  }

  return v62;
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
  v3 = objc_msgSend_copy(self, a2, (uint64_t)a3);
  uint64_t v6 = objc_msgSend_inputs(v3, v4, v5);
  v8 = objc_msgSend_objectForKey_(v6, v7, *MEMORY[0x263F00968]);

  uint64_t v10 = objc_msgSend__ciImageForInput_(v3, v9, (uint64_t)v8);
  double v13 = objc_msgSend_inputs(v3, v11, v12);
  double v15 = objc_msgSend_objectForKey_(v13, v14, *MEMORY[0x263F00990]);

  id v18 = v10;
  if (v18)
  {
    memset(&v40, 0, sizeof(v40));
    objc_msgSend_X(v15, v16, v17);
    CGFloat v20 = v19;
    objc_msgSend_Y(v15, v21, v22);
    CGAffineTransformMakeScale(&v40, v20, v23);
    CGAffineTransform v39 = v40;
    if (CGAffineTransformIsIdentity(&v39))
    {
      id v25 = v18;
      objc_msgSend_imageWithCIImage_(UniImage, v24, (uint64_t)v18);
    }
    else
    {
      CGAffineTransform v39 = v40;
      id v25 = objc_msgSend_imageByApplyingTransform_highQualityDownsample_(v18, v24, (uint64_t)&v39, 0);

      if (!v25) {
        goto LABEL_9;
      }
      objc_msgSend_imageWithCIImage_(UniImage, v26, (uint64_t)v25);
    uint64_t v27 = };
    if (v27)
    {
      v29 = v27;
      objc_msgSend_setKernel_(v27, v28, (uint64_t)v3);
      goto LABEL_10;
    }
  }
  else
  {
    id v25 = 0;
  }
LABEL_9:
  uint64_t v32 = [UniImage alloc];
  v29 = objc_msgSend_initWithKernel_(v32, v33, (uint64_t)v3);
LABEL_10:
  v34 = objc_msgSend_inputs(v3, v30, v31);
  uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v34, v35, *MEMORY[0x263F009D0]);
  objc_msgSend_setTexture_(v29, v37, (uint64_t)v36);

  return v29;
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
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F086E0];
  uint64_t v6 = objc_opt_class();
  v8 = objc_msgSend_bundleForClass_(v5, v7, v6);
  uint64_t v10 = v8;
  if (v8)
  {
    double v11 = objc_msgSend_pathForResource_ofType_(v8, v9, @"default", @"metallib");
    id v43 = 0;
    double v13 = objc_msgSend_newLibraryWithFile_error_(v4, v12, (uint64_t)v11, &v43);
    id v14 = v43;
    uint64_t v17 = objc_msgSend_resourcePath(v10, v15, v16);
    double v19 = objc_msgSend__identifyGPU_(self, v18, (uint64_t)v4);
    CGAffineTransform v40 = (void *)v17;
    double v21 = objc_msgSend_stringWithFormat_(NSString, v20, @"%@/%@", v17, v19);
    id v42 = v14;
    CGFloat v23 = objc_msgSend_newPipelineLibraryWithFilePath_error_(v4, v22, (uint64_t)v21, &v42);
    uint64_t v24 = v42;

    if (v13)
    {
      uint64_t v26 = objc_msgSend_newFunctionWithName_(v13, v25, @"bilinearResampling");
      if (!v26)
      {
        uni_logger_api();
        uint64_t v27 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR)) {
          sub_262E4E9B8(v13, v27, v28);
        }

        __assert_rtn("-[UniScaleImage _loadShaders:]", "UniScaleImage.m", 162, "function");
      }
      v30 = (void *)v26;
      CGAffineTransform v39 = v11;
      uint64_t v31 = objc_opt_new();
      objc_msgSend_setPipelineLibrary_(v31, v32, (uint64_t)v23);
      objc_msgSend_setComputeFunction_(v31, v33, (uint64_t)v30);
      uint64_t v41 = v24;
      uint64_t v37 = (MTLComputePipelineState *)objc_msgSend_newComputePipelineStateWithDescriptor_error_(v4, v34, (uint64_t)v31, &v41);
      v38 = v41;

      downsampleRGBA = self->_downsampleRGBA;
      self->_downsampleRGBA = v37;

      double v11 = v39;
      int v29 = 0;
      uint64_t v24 = v38;
    }
    else
    {
      int v29 = -1;
    }
  }
  else
  {
    uint64_t v24 = uni_logger_api();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_262E4E8F0();
    }
    int v29 = -1;
  }

  return v29;
}

- (id)_identifyGPU:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_name(v3, v4, v5);
  if (objc_msgSend_containsString_(v6, v7, @"Apple"))
  {
    NSSelectorFromString(&cfstr_Architecture.isa);
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
    {
      double v15 = &stru_270E15D18;
      goto LABEL_15;
    }
    uint64_t v6 = objc_msgSend_architecture(v3, v9, v10);
    double v13 = objc_msgSend_name(v6, v11, v12);
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, @"applegpu_", &stru_270E15D18);
    double v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v18 = objc_msgSend_revision(v6, v16, v17);
    if (objc_msgSend_containsString_(v18, v19, @"A"))
    {
      char v21 = 0;
    }
    else if (objc_msgSend_containsString_(v15, v20, @"g16p"))
    {
      uint64_t v24 = objc_msgSend_revision(v6, v22, v23);
      char v21 = objc_msgSend_containsString_(v24, v25, @"B0") ^ 1;
    }
    else
    {
      char v21 = 1;
    }

    char v27 = objc_msgSend_containsString_(v15, v26, @"g17p");
    if ((v21 & 1) == 0 && (v27 & 1) == 0)
    {
      v30 = NSString;
      uint64_t v31 = objc_msgSend_revision(v6, v28, v29);
      v34 = objc_msgSend_lowercaseString(v31, v32, v33);
      uint64_t v36 = objc_msgSend_stringWithFormat_(v30, v35, @"%@_%@", v15, v34);

      double v15 = (__CFString *)v36;
    }
  }
  else
  {
    double v15 = &stru_270E15D18;
  }

LABEL_15:

  return v15;
}

- (void).cxx_destruct
{
}

@end