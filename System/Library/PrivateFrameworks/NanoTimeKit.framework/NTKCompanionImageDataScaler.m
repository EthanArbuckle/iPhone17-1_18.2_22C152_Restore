@interface NTKCompanionImageDataScaler
- (CGRect)inputCrop;
- (CGSize)inputSize;
- (CGSize)outputSize;
- (NSData)data;
- (NTKCompanionImageDataScaler)initWithSize:(CGSize)a3 crop:(CGRect)a4 data:(id)a5 orientation:(int64_t)a6 outputSize:(CGSize)a7;
- (NTKCompanionImageDataScaler)initWithSize:(CGSize)a3 crop:(CGRect)a4 data:(id)a5 orientation:(int64_t)a6 type:(id)a7 outputSize:(CGSize)a8;
- (UTType)type;
- (int64_t)orientation;
- (void)cropAndScaleWithCompletion:(id)a3;
@end

@implementation NTKCompanionImageDataScaler

- (NTKCompanionImageDataScaler)initWithSize:(CGSize)a3 crop:(CGRect)a4 data:(id)a5 orientation:(int64_t)a6 type:(id)a7 outputSize:(CGSize)a8
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
  v33.super_class = (Class)NTKCompanionImageDataScaler;
  v22 = [(NTKCompanionImageDataScaler *)&v33 init];
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
    v24 = [(id)*MEMORY[0x1E4F44410] identifier];
    v25 = [(id)*MEMORY[0x1E4F443E0] identifier];
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
        v31 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[NTKCompanionImageDataScaler initWithSize:crop:data:orientation:type:outputSize:]((id *)&v23->_type, v31);
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

- (NTKCompanionImageDataScaler)initWithSize:(CGSize)a3 crop:(CGRect)a4 data:(id)a5 orientation:(int64_t)a6 outputSize:(CGSize)a7
{
  return -[NTKCompanionImageDataScaler initWithSize:crop:data:orientation:type:outputSize:](self, "initWithSize:crop:data:orientation:type:outputSize:", a5, a6, *MEMORY[0x1E4F44410], a3.width, a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a7.width, a7.height);
}

- (void)cropAndScaleWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke;
  v7[3] = &unk_1E62C2290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 16))
  {
    double v3 = *(double *)(v2 + 64);
    double v4 = *(double *)(v2 + 72);
    double v5 = *(double *)(v2 + 96);
    double v6 = *(double *)(v2 + 104);
    double v7 = v3 / v4 * v6;
    if (v7 >= v5) {
      double v7 = *(double *)(v2 + 96);
    }
    double v8 = v5 / (v3 / v4);
    if (v8 >= v6) {
      double v8 = *(double *)(v2 + 104);
    }
    uint64_t v9 = (uint64_t)(v8 * v7);
    double v10 = v3 / v7;
    double v11 = v4 / v8;
    if (v10 < v11) {
      double v10 = v11;
    }
    uint64_t v12 = (uint64_t)(v10 * (*(double *)(v2 + 56) * (*(double *)(v2 + 48) * v10)));
    CGFloat v13 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 134218240;
      *(double *)((char *)&buf.a + 4) = (double)v9 * 0.000000953674316;
      WORD2(buf.b) = 2048;
      *(double *)((char *)&buf.b + 6) = (double)v12 * 0.000000953674316;
      _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "cropThenScale ==> %.3f MP; scaleThenCrop ==> %.3f MP",
        (uint8_t *)&buf,
        0x16u);
    }

    CGFloat v14 = (void *)MEMORY[0x1C1875BE0]();
    uint64_t v15 = *(void *)(a1 + 32);
    if (v9 >= v12)
    {
      CFDataRef v48 = *(const __CFData **)(v15 + 24);
      double v49 = *(double *)(v15 + 8);
      double v50 = *(double *)(v15 + 48);
      double v51 = *(double *)(v15 + 56);
      double v52 = *(double *)(v15 + 88);
      double v95 = *(double *)(v15 + 80);
      double v54 = *(double *)(v15 + 96);
      double v53 = *(double *)(v15 + 104);
      double v55 = *(double *)(v15 + 64);
      double v56 = *(double *)(v15 + 72);
      id v57 = *(id *)(v15 + 40);
      CGImageSourceRef v58 = CGImageSourceCreateWithData(v48, 0);
      if (v58)
      {
        v59 = v58;
        double v90 = v55;
        double v91 = v52;
        double v89 = v49;
        if (v53 * (v55 / v56) >= v54) {
          double v60 = v54;
        }
        else {
          double v60 = v53 * (v55 / v56);
        }
        if (v54 / (v55 / v56) >= v53) {
          double v61 = v53;
        }
        else {
          double v61 = v54 / (v55 / v56);
        }
        if (v55 / v60 >= v56 / v61) {
          double v62 = v55 / v60;
        }
        else {
          double v62 = v56 / v61;
        }
        double v63 = v50 * v62;
        if (v50 * v62 < v51 * v62) {
          double v63 = v51 * v62;
        }
        CGFloat v64 = *MEMORY[0x1E4F2FE28];
        CGFloat v65 = MEMORY[0x1E4F1CC38];
        *(void *)&v104.a = MEMORY[0x1E4F1CC38];
        CGFloat v66 = *MEMORY[0x1E4F2FF68];
        v103.a = v64;
        v103.b = v66;
        v67 = [NSNumber numberWithDouble:ceil(v63)];
        v103.c = *(CGFloat *)MEMORY[0x1E4F2FE48];
        *(void *)&v104.b = v67;
        v104.c = v65;
        CFDictionaryRef v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:3];

        ThumbnailAtIndeCGFloat x = CGImageSourceCreateThumbnailAtIndex(v59, 0, v68);
        if (ThumbnailAtIndex)
        {
          v70 = ThumbnailAtIndex;
          v93 = v57;
          CGAffineTransformMakeScale(&buf, v62, v62);
          v110.origin.CGFloat x = v95 + fmax((v54 - v60) * 0.5, 0.0);
          v110.origin.CGFloat y = v91 + fmax((v53 - v61) * 0.5, 0.0);
          v110.size.CGFloat width = v60;
          v110.size.CGFloat height = v61;
          CGRect v111 = CGRectApplyAffineTransform(v110, &buf);
          v111.origin.CGFloat x = rint(v111.origin.x);
          v111.origin.CGFloat y = rint(v111.origin.y);
          v111.size.CGFloat width = rint(v90);
          v111.size.CGFloat height = rint(v56);
          CGImageRef v71 = CGImageCreateWithImageInRect(v70, v111);
          if (v71)
          {
            v72 = v71;
            v96 = v14;
            v73 = [MEMORY[0x1E4F1CA58] data];
            v74 = [v93 identifier];
            v75 = CGImageDestinationCreateWithData(v73, v74, 1uLL, 0);

            if (v75)
            {
              if (v90 >= v56) {
                double v76 = v90;
              }
              else {
                double v76 = v56;
              }
              v105[0] = *MEMORY[0x1E4F2F430];
              v77 = [NSNumber numberWithDouble:v89];
              v99 = v77;
              v105[1] = *MEMORY[0x1E4F2F428];
              v78 = [NSNumber numberWithDouble:v76];
              v105[2] = *MEMORY[0x1E4F2F470];
              v100 = v78;
              CGFloat v101 = v65;
              CFDictionaryRef v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:v105 count:3];

              CGImageDestinationAddImage(v75, v72, v79);
              CGImageDestinationFinalize(v75);
              CFRelease(v75);
            }
            else
            {

              _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
              CFDictionaryRef v79 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v79, OS_LOG_TYPE_ERROR)) {
                __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_4();
              }
              v73 = 0;
            }
            CGFloat v14 = v96;

            CFRelease(v72);
          }
          else
          {
            v84 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
              __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_3();
            }

            v73 = 0;
          }
          CFRelease(v70);
          id v57 = v93;
        }
        else
        {
          v82 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
            __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_6();
          }

          v73 = 0;
        }
        CFRelease(v59);
      }
      else
      {
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        CFDictionaryRef v68 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_ERROR)) {
          __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_1();
        }
        v73 = 0;
      }

      uint64_t v87 = *(void *)(a1 + 32);
      v86 = *(void **)(v87 + 16);
      *(void *)(v87 + 16) = v73;
    }
    else
    {
      CFDataRef v16 = *(const __CFData **)(v15 + 24);
      uint64_t v17 = *(void *)(v15 + 32);
      double v18 = *(double *)(v15 + 8);
      double v19 = *(double *)(v15 + 80);
      double v20 = *(double *)(v15 + 88);
      double v21 = *(double *)(v15 + 96);
      double v22 = *(double *)(v15 + 104);
      double v23 = *(double *)(v15 + 64);
      double v24 = *(double *)(v15 + 72);
      id v25 = *(id *)(v15 + 40);
      v26 = CGImageSourceCreateWithData(v16, 0);
      if (v26)
      {
        int v27 = v26;
        ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(v26, 0, 0);
        if (ImageAtIndex)
        {
          v29 = ImageAtIndex;
          if (v22 * (v23 / v24) >= v21) {
            double v30 = v21;
          }
          else {
            double v30 = v22 * (v23 / v24);
          }
          double v31 = v19 + fmax((v21 - v30) * 0.5, 0.0);
          if (v21 / (v23 / v24) >= v22) {
            double v32 = v22;
          }
          else {
            double v32 = v21 / (v23 / v24);
          }
          size_t Width = CGImageGetWidth(ImageAtIndex);
          size_t Height = CGImageGetHeight(v29);
          memset(&buf, 0, sizeof(buf));
          NTKImagePresentationTransform(v17, Width, Height, (uint64_t)&v104);
          CGAffineTransformInvert(&buf, &v104);
          CGAffineTransform v103 = buf;
          v108.origin.CGFloat x = v31;
          v108.origin.CGFloat y = v20 + fmax((v22 - v32) * 0.5, 0.0);
          v108.size.CGFloat width = v30;
          v108.size.CGFloat height = v32;
          CGRect v109 = CGRectApplyAffineTransform(v108, &v103);
          CGImageRef v35 = CGImageCreateWithImageInRect(v29, v109);
          if (v35)
          {
            v36 = v35;
            v94 = v14;
            v37 = [MEMORY[0x1E4F1CA58] data];
            v38 = [v25 identifier];
            v39 = CGImageDestinationCreateWithData(v37, v38, 1uLL, 0);

            if (v39)
            {
              if (v23 >= v24) {
                double v40 = v23;
              }
              else {
                double v40 = v24;
              }
              uint64_t ImageOrientation = getImageOrientation(v27);
              v99 = (void *)*MEMORY[0x1E4F2F430];
              v42 = [NSNumber numberWithDouble:v18];
              *(void *)&v103.a = v42;
              v100 = (void *)*MEMORY[0x1E4F2F428];
              [NSNumber numberWithDouble:v40];
              v43 = id v92 = v25;
              double v44 = *MEMORY[0x1E4F2F470];
              *(void *)&v103.b = v43;
              *(void *)&v103.c = MEMORY[0x1E4F1CC38];
              uint64_t v45 = *MEMORY[0x1E4F2FCA0];
              CGFloat v101 = v44;
              uint64_t v102 = v45;
              v46 = [NSNumber numberWithUnsignedInt:ImageOrientation];
              *(void *)&v103.d = v46;
              CFDictionaryRef v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v99 count:4];

              id v25 = v92;
              CGImageDestinationAddImage(v39, v36, v47);
              CGImageDestinationFinalize(v39);
              CFRelease(v39);
            }
            else
            {

              _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
              CFDictionaryRef v47 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR)) {
                __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_4();
              }
              v37 = 0;
            }

            CFRelease(v36);
            CGFloat v14 = v94;
          }
          else
          {
            v83 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
              __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_3();
            }

            v37 = 0;
          }
          CFRelease(v29);
        }
        else
        {
          v81 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
            __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_2();
          }

          v37 = 0;
        }
        CFRelease(v27);
      }
      else
      {
        v80 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
          __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_1();
        }

        v37 = 0;
      }

      uint64_t v85 = *(void *)(a1 + 32);
      v86 = *(void **)(v85 + 16);
      *(void *)(v85 + 16) = v37;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_1;
  block[3] = &unk_1E62C0AE8;
  id v88 = *(id *)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v98 = v88;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_1(uint64_t a1)
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

- (int64_t)orientation
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
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v3 = [*a1 identifier];
  int v4 = 136315394;
  double v5 = "-[NTKCompanionImageDataScaler initWithSize:crop:data:orientation:type:outputSize:]";
  __int16 v6 = 2112;
  double v7 = v3;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "%s only supports JPEG and HEIC; not %@",
    (uint8_t *)&v4,
    0x16u);
}

void __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "Could not create imageSourceRef", v2, v3, v4, v5, v6);
}

void __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "Could not create originalImageRef", v2, v3, v4, v5, v6);
}

void __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "Could not create croppedImageRef", v2, v3, v4, v5, v6);
}

void __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "Could not create imageDestinationRef", v2, v3, v4, v5, v6);
}

void __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "Could not create thumbnailImageRef", v2, v3, v4, v5, v6);
}

@end