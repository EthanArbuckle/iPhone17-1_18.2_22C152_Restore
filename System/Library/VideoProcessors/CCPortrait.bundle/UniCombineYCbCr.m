@interface UniCombineYCbCr
- (UniCombineYCbCr)init;
- (UniCombineYCbCr)initWithDevice:(id)a3;
- (id)inputNameArray;
- (id)outputImage:(id)a3;
- (id)outputNameArray;
- (id)run:(id)a3;
@end

@implementation UniCombineYCbCr

- (UniCombineYCbCr)init
{
}

- (UniCombineYCbCr)initWithDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UniCombineYCbCr;
  v5 = [(UniKernel *)&v9 init];
  v7 = v5;
  if (v5) {
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);
  }

  return v7;
}

- (id)run:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  v3 = objc_msgSend_null(MEMORY[0x263EFF9D0], a2, (uint64_t)a3);
  v7[0] = v3;
  v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v4, (uint64_t)v7, 1);

  return v5;
}

- (id)outputImage:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_copy(self, v5, v6);
  v10 = objc_msgSend_inputs(v7, v8, v9);
  v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x263F00968]);
  v14 = objc_msgSend__ciImageForInput_(v7, v13, (uint64_t)v12);

  if (!v14) {
    sub_262E4C5E4();
  }
  v17 = objc_msgSend_inputs(v7, v15, v16);
  v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, @"inputChroma");
  v21 = objc_msgSend__ciImageForInput_(v7, v20, (uint64_t)v19);

  if (!v21) {
    sub_262E4C610();
  }
  v24 = objc_msgSend_imageWithYImage_CrCbImage_CrCbScale_matrix_fullRange_colorSpace_(MEMORY[0x263F00650], v22, (uint64_t)v14, v21, 2, 709, 1, 0);
  if (v24
    && (objc_msgSend_imageWithCIImage_(UniImage, v23, (uint64_t)v24),
        (v25 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v27 = v25;
    objc_msgSend_setKernel_(v25, v26, (uint64_t)v7);
  }
  else
  {
    v30 = [UniImage alloc];
    v27 = objc_msgSend_initWithKernel_(v30, v31, (uint64_t)v7);
  }
  v32 = objc_msgSend_inputs(v7, v28, v29);
  v34 = objc_msgSend_objectForKeyedSubscript_(v32, v33, *MEMORY[0x263F009D0]);
  objc_msgSend_setTexture_(v27, v35, (uint64_t)v34);

  v38 = objc_msgSend_texture(v27, v36, v37);
  if (!v38) {
    sub_262E4C63C();
  }

  return v27;
}

- (id)inputNameArray
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F00968];
  v4[1] = @"inputChroma";
  v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 2);

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