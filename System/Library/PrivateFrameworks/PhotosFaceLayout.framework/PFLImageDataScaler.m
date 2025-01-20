@interface PFLImageDataScaler
- (CGRect)inputCrop;
- (CGSize)inputSize;
- (CGSize)outputSize;
- (NSData)data;
- (PFLImageDataScaler)initWithSize:(CGSize)a3 crop:(CGRect)a4 data:(id)a5 orientation:(unsigned int)a6 type:(id)a7 outputSize:(CGSize)a8;
- (UTType)type;
- (unsigned)orientation;
- (void)cropAndScaleWithCompletion:(id)a3;
@end

@implementation PFLImageDataScaler

- (PFLImageDataScaler)initWithSize:(CGSize)a3 crop:(CGRect)a4 data:(id)a5 orientation:(unsigned int)a6 type:(id)a7 outputSize:(CGSize)a8
{
  CGFloat height = a8.height;
  CGFloat width = a8.width;
  CGFloat v13 = a4.size.height;
  CGFloat v14 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v17 = a3.height;
  CGFloat v18 = a3.width;
  id v20 = a5;
  id v21 = a7;
  v33.receiver = self;
  v33.super_class = (Class)PFLImageDataScaler;
  v22 = [(PFLImageDataScaler *)&v33 init];
  v23 = v22;
  if (v22)
  {
    v22->_inputSize.CGFloat width = v18;
    v22->_inputSize.CGFloat height = v17;
    v22->_inputCrop.origin.CGFloat x = x;
    v22->_inputCrop.origin.CGFloat y = y;
    v22->_inputCrop.size.CGFloat width = v14;
    v22->_inputCrop.size.CGFloat height = v13;
    objc_storeStrong((id *)&v22->_data, a5);
    v23->_orientation = a6;
    objc_storeStrong((id *)&v23->_type, a7);
    v23->_outputSize.CGFloat width = width;
    v23->_outputSize.CGFloat height = height;
    v24 = [(id)*MEMORY[0x263F1DB40] identifier];
    v25 = [(id)*MEMORY[0x263F1DAE8] identifier];
    v26 = [(UTType *)v23->_type identifier];
    int v27 = [v26 isEqualToString:v24];

    if (v27)
    {
      uint64_t v28 = 0x3FEB333333333333;
    }
    else
    {
      v29 = [(UTType *)v23->_type identifier];
      int v30 = [v29 isEqualToString:v25];

      if (!v30)
      {
        v31 = pfl_layout_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[PFLImageDataScaler initWithSize:crop:data:orientation:type:outputSize:]((id *)&v23->_type, v31);
        }

        v23 = 0;
        goto LABEL_10;
      }
      uint64_t v28 = 0x3FECCCCCCCCCCCCDLL;
    }
    *(void *)&v23->_compressionQualitCGFloat y = v28;
LABEL_10:
  }
  return v23;
}

- (void)cropAndScaleWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke;
  v7[3] = &unk_26544BD88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 16))
  {
    reduceRectToAspectRatioAndCenter(*(double *)(v2 + 80), *(double *)(v2 + 88), *(double *)(v2 + 96), *(double *)(v2 + 104), *(double *)(v2 + 64) / *(double *)(v2 + 72));
    uint64_t v5 = (uint64_t)(v4 * v3);
    id v6 = *(double **)(a1 + 32);
    double v7 = v6[8] / v4;
    if (v7 < v6[9] / v3) {
      double v7 = v6[9] / v3;
    }
    uint64_t v8 = (uint64_t)(v7 * (v6[7] * (v6[6] * v7)));
    v9 = pfl_layout_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 134218240;
      *(double *)((char *)&buf.a + 4) = (double)v5 * 0.000000953674316;
      WORD2(buf.b) = 2048;
      *(double *)((char *)&buf.b + 6) = (double)v8 * 0.000000953674316;
      _os_log_impl(&dword_259336000, v9, OS_LOG_TYPE_DEFAULT, "cropThenScale ==> %.3f MP; scaleThenCrop ==> %.3f MP",
        (uint8_t *)&buf,
        0x16u);
    }

    v10 = (void *)MEMORY[0x25A2DC3E0]();
    uint64_t v11 = *(void *)(a1 + 32);
    double v12 = *(double *)(v11 + 96);
    if (v5 >= v8)
    {
      CFDataRef v46 = *(const __CFData **)(v11 + 32);
      uint64_t v47 = *(void *)(v11 + 8);
      double v48 = *(double *)(v11 + 48);
      double v49 = *(double *)(v11 + 56);
      double v50 = *(double *)(v11 + 80);
      double v51 = *(double *)(v11 + 88);
      double v52 = *(double *)(v11 + 104);
      double v53 = *(double *)(v11 + 72);
      double v95 = *(double *)(v11 + 64);
      id v54 = *(id *)(v11 + 40);
      CGImageSourceRef v55 = CGImageSourceCreateWithData(v46, 0);
      if (v55)
      {
        v56 = v55;
        uint64_t v89 = v47;
        double v59 = reduceRectToAspectRatioAndCenter(v50, v51, v12, v52, v95 / v53);
        CGFloat v61 = v60;
        CGFloat v62 = v57;
        CGFloat v63 = v58;
        if (v95 / v57 >= v53 / v58) {
          double v64 = v95 / v57;
        }
        else {
          double v64 = v53 / v58;
        }
        double v65 = v48 * v64;
        if (v48 * v64 < v49 * v64) {
          double v65 = v49 * v64;
        }
        CGFloat v66 = *MEMORY[0x263F0F5A8];
        CGFloat v67 = MEMORY[0x263EFFA88];
        *(void *)&v103.a = MEMORY[0x263EFFA88];
        CGFloat v68 = *MEMORY[0x263F0F638];
        v102.a = v66;
        v102.b = v68;
        v69 = objc_msgSend(NSNumber, "numberWithDouble:", ceil(v65), v89);
        v102.c = *(CGFloat *)MEMORY[0x263F0F5B8];
        *(void *)&v103.b = v69;
        v103.c = v67;
        CFDictionaryRef v70 = [NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:3];

        ThumbnailAtIndeCGFloat x = CGImageSourceCreateThumbnailAtIndex(v56, 0, v70);
        if (ThumbnailAtIndex)
        {
          v72 = ThumbnailAtIndex;
          v93 = v54;
          CGAffineTransformMakeScale(&buf, v64, v64);
          v109.origin.CGFloat x = v59;
          v109.origin.CGFloat y = v61;
          v109.size.CGFloat width = v62;
          v109.size.CGFloat height = v63;
          CGRect v110 = CGRectApplyAffineTransform(v109, &buf);
          v110.origin.CGFloat x = rint(v110.origin.x);
          v110.origin.CGFloat y = rint(v110.origin.y);
          v110.size.CGFloat width = rint(v95);
          v110.size.CGFloat height = rint(v53);
          CGImageRef v73 = CGImageCreateWithImageInRect(v72, v110);
          if (v73)
          {
            v74 = v73;
            v92 = v10;
            v37 = [MEMORY[0x263EFF990] data];
            v75 = [v93 identifier];
            v76 = CGImageDestinationCreateWithData(v37, v75, 1uLL, 0);

            if (v76)
            {
              if (v95 >= v53) {
                double v77 = v95;
              }
              else {
                double v77 = v53;
              }
              v104[0] = *MEMORY[0x263F0EFE8];
              v78 = [NSNumber numberWithDouble:v90];
              v98 = v78;
              v104[1] = *MEMORY[0x263F0EFE0];
              v79 = [NSNumber numberWithDouble:v77];
              v104[2] = *MEMORY[0x263F0F020];
              v99 = v79;
              CGFloat v100 = v67;
              CFDictionaryRef v80 = [NSDictionary dictionaryWithObjects:&v98 forKeys:v104 count:3];

              CGImageDestinationAddImage(v76, v74, v80);
              CGImageDestinationFinalize(v76);
              CFRelease(v76);
            }
            else
            {

              pfl_layout_log();
              CFDictionaryRef v80 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_ERROR)) {
                __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_4();
              }
              v37 = 0;
            }
            v10 = v92;

            CFRelease(v74);
          }
          else
          {
            v85 = pfl_layout_log();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
              __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_3();
            }

            v37 = 0;
          }
          id v54 = v93;
          CFRelease(v72);
        }
        else
        {
          v83 = pfl_layout_log();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
            __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_6();
          }

          v37 = 0;
        }
        CFRelease(v56);
      }
      else
      {
        pfl_layout_log();
        CFDictionaryRef v70 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR)) {
          __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_1();
        }
        v37 = 0;
      }
    }
    else
    {
      uint64_t v13 = *(unsigned int *)(v11 + 24);
      CFDataRef v14 = *(const __CFData **)(v11 + 32);
      double v15 = *(double *)(v11 + 8);
      double v16 = *(double *)(v11 + 80);
      double v17 = *(double *)(v11 + 88);
      double v18 = *(double *)(v11 + 104);
      double v19 = *(double *)(v11 + 64);
      double v20 = *(double *)(v11 + 72);
      id v21 = *(id *)(v11 + 40);
      v22 = CGImageSourceCreateWithData(v14, 0);
      if (v22)
      {
        v23 = v22;
        ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(v22, 0, 0);
        if (ImageAtIndex)
        {
          v25 = ImageAtIndex;
          double v26 = reduceRectToAspectRatioAndCenter(v16, v17, v12, v18, v19 / v20);
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          CGFloat v32 = v31;
          size_t Width = CGImageGetWidth(v25);
          size_t Height = CGImageGetHeight(v25);
          memset(&buf, 0, sizeof(buf));
          makePresentationTransform(v13, Width, Height, (uint64_t)&v103);
          CGAffineTransformInvert(&buf, &v103);
          CGAffineTransform v102 = buf;
          v107.origin.CGFloat x = v26;
          v107.origin.CGFloat y = v28;
          v107.size.CGFloat width = v30;
          v107.size.CGFloat height = v32;
          CGRect v108 = CGRectApplyAffineTransform(v107, &v102);
          CGImageRef v35 = CGImageCreateWithImageInRect(v25, v108);
          if (v35)
          {
            v36 = v35;
            v91 = v10;
            v37 = [MEMORY[0x263EFF990] data];
            v38 = [v21 identifier];
            v39 = CGImageDestinationCreateWithData(v37, v38, 1uLL, 0);

            if (v39)
            {
              if (v19 >= v20) {
                double v40 = v19;
              }
              else {
                double v40 = v20;
              }
              v98 = (void *)*MEMORY[0x263F0EFE8];
              v94 = [NSNumber numberWithDouble:v15];
              *(void *)&v102.a = v94;
              v99 = (void *)*MEMORY[0x263F0EFE0];
              v41 = [NSNumber numberWithDouble:v40];
              double v42 = *MEMORY[0x263F0F020];
              *(void *)&v102.b = v41;
              *(void *)&v102.c = MEMORY[0x263EFFA88];
              uint64_t v43 = *MEMORY[0x263F0F4C8];
              CGFloat v100 = v42;
              uint64_t v101 = v43;
              v44 = [NSNumber numberWithUnsignedInt:getImageOrientationFromSource(v23)];
              *(void *)&v102.d = v44;
              CFDictionaryRef v45 = [NSDictionary dictionaryWithObjects:&v102 forKeys:&v98 count:4];

              CGImageDestinationAddImage(v39, v36, v45);
              CGImageDestinationFinalize(v39);
              CFRelease(v39);
            }
            else
            {

              pfl_layout_log();
              CFDictionaryRef v45 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR)) {
                __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_4();
              }
              v37 = 0;
            }

            CFRelease(v36);
            v10 = v91;
          }
          else
          {
            v84 = pfl_layout_log();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
              __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_3();
            }

            v37 = 0;
          }
          CFRelease(v25);
        }
        else
        {
          v82 = pfl_layout_log();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
            __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_2();
          }

          v37 = 0;
        }
        CFRelease(v23);
      }
      else
      {
        v81 = pfl_layout_log();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
          __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_1();
        }

        v37 = 0;
      }
    }
    uint64_t v86 = *(void *)(a1 + 32);
    v87 = *(void **)(v86 + 16);
    *(void *)(v86 + 16) = v37;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_1;
  block[3] = &unk_26544BD60;
  id v88 = *(id *)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v97 = v88;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (CGSize)inputSize
{
  double width = self->_inputSize.width;
  double height = self->_inputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)inputCrop
{
  double x = self->_inputCrop.origin.x;
  double y = self->_inputCrop.origin.y;
  double width = self->_inputCrop.size.width;
  double height = self->_inputCrop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSData)data
{
  return self->_data;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (UTType)type
{
  return self->_type;
}

- (CGSize)outputSize
{
  double width = self->_outputSize.width;
  double height = self->_outputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
}

- (void)initWithSize:(id *)a1 crop:(NSObject *)a2 data:orientation:type:outputSize:.cold.1(id *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  double v3 = [*a1 identifier];
  int v4 = 136315394;
  uint64_t v5 = "-[PFLImageDataScaler initWithSize:crop:data:orientation:type:outputSize:]";
  __int16 v6 = 2112;
  double v7 = v3;
  _os_log_error_impl(&dword_259336000, a2, OS_LOG_TYPE_ERROR, "%s only supports JPEG and HEIC; not %@",
    (uint8_t *)&v4,
    0x16u);
}

void __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_259336000, v0, v1, "Could not create imageSourceRef", v2, v3, v4, v5, v6);
}

void __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_259336000, v0, v1, "Could not create originalImageRef", v2, v3, v4, v5, v6);
}

void __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_259336000, v0, v1, "Could not create croppedImageRef", v2, v3, v4, v5, v6);
}

void __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_259336000, v0, v1, "Could not create imageDestinationRef", v2, v3, v4, v5, v6);
}

void __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_259336000, v0, v1, "Could not create thumbnailImageRef", v2, v3, v4, v5, v6);
}

@end