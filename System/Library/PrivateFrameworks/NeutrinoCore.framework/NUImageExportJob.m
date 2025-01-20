@interface NUImageExportJob
- (BOOL)render:(id *)a3;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (CGImage)copyCGImageWithIOSurface:(id)a3 fromRect:(CGRect)a4 colorSpace:(id)a5 error:(id *)a6;
- (NUImageExportJob)initWithExportRequest:(id)a3;
- (NUImageExportJob)initWithImageExportRequest:(id)a3;
- (id)_filterProperties:(id)a3;
- (id)auxiliaryImageTypes;
- (id)auxiliaryImages;
- (id)evaluateRenderDependencies:(id *)a3;
- (id)imageDestinationOptions;
- (id)prepareNodeWithPipelineState:(id)a3 error:(id *)a4;
- (id)result;
- (void)cleanUp;
@end

@implementation NUImageExportJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxImageQueue, 0);
  objc_storeStrong((id *)&self->_auxImages, 0);

  objc_storeStrong((id *)&self->_destinationData, 0);
}

- (void)cleanUp
{
  v4.receiver = self;
  v4.super_class = (Class)NUImageExportJob;
  [(NURenderJob *)&v4 cleanUp];
  destinationData = self->_destinationData;
  self->_destinationData = 0;
}

- (BOOL)render:(id *)a3
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v91 = NUAssertLogger_12849();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      v92 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v92;
      _os_log_error_impl(&dword_1A9892000, v91, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v94 = NUAssertLogger_12849();
    BOOL v95 = os_log_type_enabled(v94, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v95)
      {
        v98 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v99 = (void *)MEMORY[0x1E4F29060];
        id v100 = v98;
        v101 = [v99 callStackSymbols];
        v102 = [v101 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v98;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v102;
        _os_log_error_impl(&dword_1A9892000, v94, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v95)
    {
      v96 = [MEMORY[0x1E4F29060] callStackSymbols];
      v97 = [v96 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v97;
      _os_log_error_impl(&dword_1A9892000, v94, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageExportJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 342, @"Invalid parameter not satisfying: %s", v103, v104, v105, v106, (uint64_t)"error != NULL");
  }
  v115 = -[NURenderJob renderer:](self, "renderer:");
  if (v115)
  {
    v3 = [(NURenderJob *)self prepareNode];
    v116 = [v3 imageProperties:a3];

    if (v116)
    {
      v112 = [(NUImageExportJob *)self imageExportRequest];
      objc_super v4 = [v112 colorSpace];
      v5 = v4;
      if (v4)
      {
        id v6 = v4;
      }
      else
      {
        id v6 = [v116 colorSpace];
      }
      v8 = v6;

      if ([v8 isRGB])
      {
        v113 = v8;
      }
      else
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_124);
        }
        v9 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v8;
          _os_log_impl(&dword_1A9892000, v9, OS_LOG_TYPE_DEFAULT, "Destination color space is not RGB, falling back to sRGB: %{public}@", buf, 0xCu);
        }
        uint64_t v10 = +[NUColorSpace sRGBColorSpace];

        v113 = (void *)v10;
      }
      uint64_t v11 = [(NURenderJob *)self imageSize];
      uint64_t v13 = v12;
      v111 = [v112 format];
      v110 = [v111 pixelFormat];
      v108 = [v115 context];
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
      if ([v113 isExtended] && (objc_msgSend(v110, "supportsExtendedRange") & 1) == 0)
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_12864);
        }
        v15 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          v16 = NSString;
          v17 = v15;
          v18 = [v16 stringWithFormat:@"XDR colorspace (%@) is incompatible with format (%@)", v113, v110];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v18;
          _os_log_impl(&dword_1A9892000, v17, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          uint64_t v19 = _NULogOnceToken;
        }
        else
        {
          uint64_t v19 = -1;
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v19 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_12864);
          }
          v20 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v26 = (void *)MEMORY[0x1E4F29060];
            id v27 = v25;
            v28 = v20;
            v29 = [v26 callStackSymbols];
            v30 = [v29 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v25;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v30;
            _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (v19 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_12864);
          }
          v31 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v83 = (void *)MEMORY[0x1E4F29060];
            v84 = v31;
            v85 = [v83 callStackSymbols];
            v86 = [v85 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v86;
            _os_log_error_impl(&dword_1A9892000, v84, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
          }
        }
        _NUAssertContinueHandler((uint64_t)"-[NUImageExportJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 378, @"XDR colorspace (%@) is incompatible with format (%@)", v21, v22, v23, v24, (uint64_t)v113);
      }
      if ([v113 isHDR] && objc_msgSend(v110, "bitsPerComponent") <= 9)
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_12864);
        }
        v32 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          v33 = NSString;
          v34 = v32;
          v35 = [v33 stringWithFormat:@"HDR colorspace (%@) is incompatible with format (%@)", v113, v110];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v35;
          _os_log_impl(&dword_1A9892000, v34, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          uint64_t v36 = _NULogOnceToken;
        }
        else
        {
          uint64_t v36 = -1;
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v36 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_12864);
          }
          v37 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v43 = (void *)MEMORY[0x1E4F29060];
            id v44 = v42;
            v45 = v37;
            v46 = [v43 callStackSymbols];
            v47 = [v46 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v42;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v47;
            _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (v36 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_12864);
          }
          v48 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v87 = (void *)MEMORY[0x1E4F29060];
            v88 = v48;
            v89 = [v87 callStackSymbols];
            v90 = [v89 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v90;
            _os_log_error_impl(&dword_1A9892000, v88, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
          }
        }
        _NUAssertContinueHandler((uint64_t)"-[NUImageExportJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 379, @"HDR colorspace (%@) is incompatible with format (%@)", v38, v39, v40, v41, (uint64_t)v113);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v127 = __Block_byref_object_copy__12873;
      v128 = __Block_byref_object_dispose__12874;
      id v129 = 0;
      v49 = [(NUImageExportJob *)self imageExportRequest];
      int v50 = [v49 renderWithIOSurface];

      if ((v50 & isKindOfClass) != 0)
      {
        v51 = [(NURenderJob *)self outputImage];
        image = -[NUImageExportJob copyCGImageWithIOSurface:fromRect:colorSpace:error:](self, "copyCGImageWithIOSurface:fromRect:colorSpace:error:", v51, v113, a3, 0.0, 0.0, (double)v11, (double)v13);
      }
      else if (objc_opt_respondsToSelector())
      {
        v51 = [(NURenderJob *)self outputImage];
        uint64_t v52 = [v110 CIFormat];
        uint64_t v53 = [v113 CGColorSpace];
        v124[0] = MEMORY[0x1E4F143A8];
        v124[1] = 3221225472;
        v124[2] = __27__NUImageExportJob_render___block_invoke;
        v124[3] = &unk_1E5D949D0;
        v124[4] = buf;
        image = (CGImage *)objc_msgSend(v108, "createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:", v51, v52, 1, v53, 1, v124, 0.0, 0.0, (double)v11, (double)v13);
      }
      else
      {
        v51 = [(NURenderJob *)self outputImage];
        image = (CGImage *)objc_msgSend(v108, "createCGImage:fromRect:format:colorSpace:deferred:", v51, objc_msgSend(v110, "CIFormat"), objc_msgSend(v113, "CGColorSpace"), 1, 0.0, 0.0, (double)v11, (double)v13);
      }

      if (image)
      {
        if ([v112 renderToData])
        {
          v54 = (NSData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
          destinationData = self->_destinationData;
          self->_destinationData = v54;

          v56 = self->_destinationData;
          v57 = [v111 fileType];
          v58 = CGImageDestinationCreateWithData((CFMutableDataRef)v56, v57, 1uLL, 0);
        }
        else
        {
          v57 = [v112 destinationURL];
          v61 = [v111 fileType];
          v58 = CGImageDestinationCreateWithURL((CFURLRef)v57, v61, 1uLL, 0);
        }
        if (v58)
        {
          CFDictionaryRef v62 = [(NUImageExportJob *)self imageDestinationOptions];
          CGImageDestinationAddImage(v58, image, v62);
          v107 = v62;
          v63 = [(NUImageExportJob *)self auxiliaryImages];
          long long v122 = 0u;
          long long v123 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          v64 = [(NUImageExportJob *)self auxiliaryImageTypes];
          uint64_t v65 = [v64 countByEnumeratingWithState:&v120 objects:v125 count:16];
          if (v65)
          {
            uint64_t v66 = *(void *)v121;
LABEL_63:
            uint64_t v67 = 0;
            while (1)
            {
              if (*(void *)v121 != v66) {
                objc_enumerationMutation(v64);
              }
              v68 = *(void **)(*((void *)&v120 + 1) + 8 * v67);
              v69 = [v63 objectForKeyedSubscript:v68];
              if (v69) {
                goto LABEL_70;
              }
              uint64_t v70 = NUAuxiliaryImageTypeFromString(v68);
              v71 = [v116 auxiliaryImagePropertiesForType:v70];
              BOOL v72 = v71 == 0;

              if (!v72) {
                break;
              }
LABEL_71:
              if (v65 == ++v67)
              {
                uint64_t v65 = [v64 countByEnumeratingWithState:&v120 objects:v125 count:16];
                if (v65) {
                  goto LABEL_63;
                }
                goto LABEL_73;
              }
            }
            v73 = [(NURenderJob *)self renderNode];
            id v119 = 0;
            v69 = [v73 originalAuxiliaryImageForType:v70 error:&v119];
            id v74 = v119;

            if (!v69)
            {
              *a3 = +[NUError errorWithCode:1 reason:@"Failed to get original aux image" object:v68 underlyingError:v74];

              int v77 = 0;
              goto LABEL_76;
            }

LABEL_70:
            id v118 = 0;
            CFDictionaryRef v75 = [v69 dictionaryRepresentationForAuxiliaryDataType:&v118];
            v76 = (__CFString *)v118;
            CGImageDestinationAddAuxiliaryDataInfo(v58, v76, v75);

            goto LABEL_71;
          }
LABEL_73:
          int v77 = 1;
LABEL_76:

          if (!CGImageDestinationFinalize(v58))
          {
            v78 = [(NURenderJob *)self request];
            v79 = (void *)[v78 copy];
            *a3 = +[NUError failureError:@"Failed to finalize CGImageDestination" object:v79];

            int v77 = 0;
          }
          if (*(void *)(*(void *)&buf[8] + 40))
          {
            v80 = [(NURenderJob *)self request];
            v81 = (void *)[v80 copy];
            *a3 = +[NUError errorWithCode:1 reason:@"Error during CGImageDestination finalize" object:v81 underlyingError:*(void *)(*(void *)&buf[8] + 40)];

            int v77 = 0;
          }
          CFRelease(v58);
        }
        else
        {
          v107 = [(NURenderJob *)self request];
          v63 = (void *)[v107 copy];
          +[NUError failureError:@"Failed to create CGImageDestinationRef" object:v63];
          int v77 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        CGImageRelease(image);
        BOOL v7 = v77 != 0;
      }
      else
      {
        v59 = [(NURenderJob *)self request];
        v60 = (void *)[v59 copy];
        *a3 = +[NUError failureError:@"Failed to create CGImageRef" object:v60];

        BOOL v7 = 0;
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to get image properties" object:0 underlyingError:*a3];
      BOOL v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __27__NUImageExportJob_render___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  if (v12)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_124);
    }
    uint64_t v13 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)MEMORY[0x1E4F29238];
      *(double *)v20 = a3;
      *(double *)&v20[1] = a4;
      *(double *)&v20[2] = a5;
      *(double *)&v20[3] = a6;
      v18 = v13;
      uint64_t v19 = [v17 valueWithBytes:v20 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "createCGImage callback for rect: %@, error: %@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v16 = *(void *)(v14 + 40);
    v15 = (id *)(v14 + 40);
    if (!v16) {
      objc_storeStrong(v15, a2);
    }
  }
}

- (CGImage)copyCGImageWithIOSurface:(id)a3 fromRect:(CGRect)a4 colorSpace:(id)a5 error:(id *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  if (!a6)
  {
    uint64_t v41 = NUAssertLogger_12849();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v80 = v42;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v44 = NUAssertLogger_12849();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v45)
      {
        v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v56 = (void *)MEMORY[0x1E4F29060];
        id v57 = v55;
        v58 = [v56 callStackSymbols];
        v59 = [v58 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v80 = v55;
        __int16 v81 = 2114;
        v82 = v59;
        _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v45)
    {
      v46 = [MEMORY[0x1E4F29060] callStackSymbols];
      v47 = [v46 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v80 = v47;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageExportJob copyCGImageWithIOSurface:fromRect:colorSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 281, @"Invalid parameter not satisfying: %s", v60, v61, v62, v63, (uint64_t)"error != nil");
  }
  v15 = v14;
  if (!v14)
  {
    v48 = NUAssertLogger_12849();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "colorSpace != nil");
      *(_DWORD *)buf = 138543362;
      v80 = v49;
      _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v51 = NUAssertLogger_12849();
    BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (v50)
    {
      if (v52)
      {
        v64 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v65 = (void *)MEMORY[0x1E4F29060];
        id v66 = v64;
        uint64_t v67 = [v65 callStackSymbols];
        v68 = [v67 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v80 = v64;
        __int16 v81 = 2114;
        v82 = v68;
        _os_log_error_impl(&dword_1A9892000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v52)
    {
      uint64_t v53 = [MEMORY[0x1E4F29060] callStackSymbols];
      v54 = [v53 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v80 = v54;
      _os_log_error_impl(&dword_1A9892000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageExportJob copyCGImageWithIOSurface:fromRect:colorSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 282, @"Invalid parameter not satisfying: %s", v69, v70, v71, v72, (uint64_t)"colorSpace != nil");
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_124);
  }
  uint64_t v16 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9892000, v16, OS_LOG_TYPE_DEFAULT, "NUImageExportJob exporting with IOSurface", buf, 2u);
  }
  v17 = [(NURenderJob *)self renderer:a6];
  if (v17)
  {
    [v13 extent];
    double v19 = v18;
    double v21 = v20;
    int v22 = [v15 isHDR];
    unint64_t v23 = vcvtpd_s64_f64(v19);
    unint64_t v24 = vcvtpd_s64_f64(v21);
    if (v22) {
      uint64_t v25 = 2019963440;
    }
    else {
      uint64_t v25 = 875704422;
    }
    id v26 = +[NUVideoUtilities newPixelBufferOfSize:format:](NUVideoUtilities, "newPixelBufferOfSize:format:", v23, v24, v25);
    if (v26)
    {
      int v27 = [v15 isHDR];
      v28 = (uint64_t *)MEMORY[0x1E4F24C30];
      if (!v27) {
        v28 = (uint64_t *)MEMORY[0x1E4F24C40];
      }
      uint64_t v29 = *v28;
      uint64_t v77 = *MEMORY[0x1E4F24C18];
      uint64_t v78 = v29;
      CFDictionaryRef theAttachments = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      CVBufferSetAttachments((CVBufferRef)[v26 CVPixelBuffer], theAttachments, kCVAttachmentMode_ShouldPropagate);
      buffer = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v26 CVPixelBuffer]);
      v30 = (void *)[objc_alloc(MEMORY[0x1E4F1E070]) initWithIOSurface:buffer];
      objc_msgSend(v30, "setColorSpace:", objc_msgSend(v15, "CGColorSpace"));
      v31 = [(NURenderJob *)self request];
      v32 = [v31 name];
      [v30 setLabel:v32];

      v33 = [v17 context];
      v34 = objc_msgSend(v33, "startTaskToRender:fromRect:toDestination:atPoint:error:", v13, v30, a6, x, y, width, height, 0.0, 0.0);
      v35 = v34;
      if (v34)
      {
        uint64_t v36 = [v34 waitUntilCompletedAndReturnError:a6];
        if (v36)
        {
          uint64_t v75 = *MEMORY[0x1E4F2FDE0];
          uint64_t v76 = MEMORY[0x1E4F1CC38];
          v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          CFPropertyListRef v38 = CGColorSpaceCopyPropertyList((CGColorSpaceRef)[v15 CGColorSpace]);
          if (v38)
          {
            IOSurfaceSetValue(buffer, (CFStringRef)*MEMORY[0x1E4F2F068], v38);
            CFRelease(v38);
          }
          uint64_t v39 = (CGImage *)CGImageCreateFromIOSurface();
        }
        else
        {
          +[NUError errorWithCode:1 reason:@"failed to waitUntilCompletedAndReturnError for image export" object:0 underlyingError:*a6];
          uint64_t v39 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        +[NUError errorWithCode:1 reason:@"failed to startTaskToRender for image export" object:0 underlyingError:*a6];
        uint64_t v39 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"IOSurface path failed in image export" object:0];
      uint64_t v39 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v39 = 0;
  }

  return v39;
}

- (id)evaluateRenderDependencies:(id *)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v61.receiver = self;
  v61.super_class = (Class)NUImageExportJob;
  v5 = -[NURenderJob evaluateRenderDependencies:](&v61, sel_evaluateRenderDependencies_);
  if (v5)
  {
    id v6 = [(NURenderJob *)self prepareNode];
    id v60 = 0;
    uint64_t v7 = [v6 imageProperties:&v60];
    id v8 = v60;

    BOOL v45 = (void *)v7;
    if (v7)
    {
      id v43 = v8;
      v9 = [(NUImageExportJob *)self imageExportRequest];
      uint64_t v10 = [v9 auxImages];
      uint64_t v11 = (void *)[v10 mutableCopy];
      id v12 = v11;
      if (v11) {
        id v13 = v11;
      }
      else {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      id v14 = v13;
      id v44 = v5;

      id obj = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v15 = [(NUImageExportJob *)self auxiliaryImageTypes];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v56 objects:v63 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v57;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v57 != v18) {
              objc_enumerationMutation(v15);
            }
            double v20 = *(void **)(*((void *)&v56 + 1) + 8 * v19);
            double v21 = [v14 objectForKeyedSubscript:v20];
            uint64_t v22 = NUAuxiliaryImageTypeFromString(v20);
            if (!v21)
            {
              uint64_t v23 = v22;
              unint64_t v24 = [v45 auxiliaryImagePropertiesForType:v22];

              if (v24)
              {
                uint64_t v25 = [(NURenderJob *)self prepareNode];
                char v26 = [v25 canPropagateOriginalAuxiliaryData:v23];

                if ((v26 & 1) == 0) {
                  [obj addObject:v20];
                }
              }
            }

            ++v19;
          }
          while (v17 != v19);
          uint64_t v27 = [v15 countByEnumeratingWithState:&v56 objects:v63 count:16];
          uint64_t v17 = v27;
        }
        while (v27);
      }

      objc_storeStrong((id *)&self->_auxImages, v14);
      v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v29 = (OS_dispatch_queue *)dispatch_queue_create("NUExportImageJob.auxiliaryImages", v28);
      auxImageQueue = self->_auxImageQueue;
      self->_auxImageQueue = v29;

      id v48 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v44];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id obja = obj;
      uint64_t v31 = [obja countByEnumeratingWithState:&v52 objects:v62 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v53 != v33) {
              objc_enumerationMutation(obja);
            }
            v35 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            uint64_t v36 = [NUAuxiliaryImageRenderRequest alloc];
            v37 = [(NURenderJob *)self request];
            CFPropertyListRef v38 = [(NURenderRequest *)v36 initWithRequest:v37];

            [(NUAuxiliaryImageRenderRequest *)v38 setAuxiliaryImageType:NUAuxiliaryImageTypeFromString(v35)];
            [(NUAuxiliaryImageRenderRequest *)v38 setSkipRenderIfNotRequired:1];
            [(NURenderRequest *)v38 setResponseQueue:self->_auxImageQueue];
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __47__NUImageExportJob_evaluateRenderDependencies___block_invoke;
            v49[3] = &unk_1E5D949A8;
            id v50 = v14;
            v51 = v35;
            [(NURenderRequest *)v38 setCompletionBlock:v49];
            id v39 = [(NUAuxiliaryImageRenderRequest *)v38 newRenderJob];
            uint64_t v40 = [(NURenderJob *)self prepareNode];
            [v39 setPrepareNode:v40];

            uint64_t v41 = [(NURenderJob *)self resolvedSpaceMap];
            [v39 setResolvedSpaceMap:v41];

            [v48 addObject:v39];
          }
          uint64_t v32 = [obja countByEnumeratingWithState:&v52 objects:v62 count:16];
        }
        while (v32);
      }

      id v8 = v43;
      v5 = v44;
    }
    else
    {
      id v14 = [(NURenderJob *)self prepareNode];
      +[NUError errorWithCode:1 reason:@"Failed to get image properties" object:v14 underlyingError:v8];
      id v48 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v48 = 0;
  }

  return v48;
}

void __47__NUImageExportJob_evaluateRenderDependencies___block_invoke(uint64_t a1, void *a2)
{
  id v6 = 0;
  v3 = [a2 result:&v6];
  id v4 = v6;
  if (v3)
  {
    v5 = [v3 auxiliaryImage];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

- (id)prepareNodeWithPipelineState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)NUImageExportJob;
  id v7 = [(NURenderJob *)&v36 prepareNodeWithPipelineState:v6 error:a4];
  if (v7)
  {
    id v8 = [(NUImageExportJob *)self imageExportRequest];
    int v9 = [v8 applyOrientationAsMetadata];

    if (v9)
    {
      uint64_t v10 = [v7 outputImageGeometry:a4];
      if (!v10)
      {
        uint64_t v16 = 0;
        goto LABEL_35;
      }
      uint64_t v11 = v10;
      uint64_t v12 = [v10 orientation];
      uint64_t v13 = 6;
      if (v12 != 8) {
        uint64_t v13 = v12;
      }
      if (v12 == 6) {
        uint64_t v14 = 8;
      }
      else {
        uint64_t v14 = v13;
      }
      v15 = [(NUOrientationNode *)[NUResetOrientationNode alloc] initWithOrientation:v14 input:v7];

      id v7 = v15;
    }
  }
  if ([v6 auxiliaryImageType] == 1)
  {
    uint64_t v16 = [v7 imageProperties:a4];
    if (!v16) {
      goto LABEL_35;
    }
    uint64_t v17 = [(NUImageExportJob *)self imageExportRequest];
    uint64_t v18 = [v17 colorSpace];
    uint64_t v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [v16 colorSpace];
    }
    double v21 = v20;

    if (+[NUGlobalSettings enableHDRSupport])
    {
      if ([v21 isHDR]) {
        int v22 = 1;
      }
      else {
        int v22 = [v21 isExtended];
      }
    }
    else
    {
      int v22 = 0;
    }
    if ([v16 isHDR])
    {
      uint64_t v23 = [NUHDRToneMapNode alloc];
      [v16 contentHeadroom];
      double v25 = v24;
      double v26 = 1.0;
      if (v22)
      {
        [v21 headroom];
        double v26 = v27;
      }
      v28 = v23;
    }
    else
    {
      if (![v16 hasGainMap]) {
        goto LABEL_33;
      }
      [v16 gainMapHeadroom];
      int v31 = v30 > 1.0 ? v22 : 0;
      if (v31 != 1
        || !+[NUGlobalSettings renderMeteorPlusAsHDR])
      {
        goto LABEL_33;
      }
      uint64_t v32 = [NUHDRGainMapNode alloc];
      [v16 gainMapHeadroom];
      double v25 = v33;
      [v21 headroom];
      double v26 = v34;
      v28 = v32;
    }
    uint64_t v29 = [v28 initWithInput:v7 contentHeadroom:v25 displayHeadroom:v26];

    id v7 = (id)v29;
LABEL_33:
  }
  id v7 = v7;
  uint64_t v16 = v7;
LABEL_35:

  return v16;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (id)result
{
  v3 = [(NUImageExportJob *)self imageExportRequest];
  id v4 = objc_alloc_init(_NUImageExportResult);
  if ([v3 renderToData])
  {
    [(_NUImageExportResult *)v4 setDestinationData:self->_destinationData];
  }
  else
  {
    v5 = [v3 destinationURL];
    [(_NUExportResult *)v4 setDestinationURL:v5];
  }
  id v6 = [(NURenderJob *)self outputGeometry];
  [(_NUExportResult *)v4 setGeometry:v6];

  return v4;
}

- (id)auxiliaryImages
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__12873;
  uint64_t v10 = __Block_byref_object_dispose__12874;
  id v11 = 0;
  auxImageQueue = self->_auxImageQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__NUImageExportJob_auxiliaryImages__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(auxImageQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __35__NUImageExportJob_auxiliaryImages__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 240) copy];

  return MEMORY[0x1F41817F8]();
}

- (id)auxiliaryImageTypes
{
  v2 = [(NUImageExportJob *)self imageExportRequest];
  id v3 = [v2 auxiliaryImageTypes];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NUImageExportRequest defaultAuxiliaryImageTypes];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)imageDestinationOptions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(NUImageExportJob *)self imageExportRequest];
  id v4 = [v3 imageProperties];
  if (!v4)
  {
    id v5 = [(NURenderJob *)self prepareNode];

    if (!v5)
    {
      uint64_t v10 = NUAssertLogger_12849();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [NSString stringWithFormat:@"Missing prepare node"];
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v11;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v13 = NUAssertLogger_12849();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v14)
        {
          uint64_t v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v18 = (void *)MEMORY[0x1E4F29060];
          id v19 = v17;
          id v20 = [v18 callStackSymbols];
          double v21 = [v20 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v29 = v17;
          __int16 v30 = 2114;
          int v31 = v21;
          _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v14)
      {
        v15 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v16;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUImageExportJob imageDestinationOptions]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 122, @"Missing prepare node", v22, v23, v24, v25, v26);
    }
    uint64_t v6 = [(NURenderJob *)self prepareNode];
    uint64_t v27 = 0;
    id v7 = [v6 imageProperties:&v27];

    if (v7)
    {
      id v4 = [v7 metadata];
    }
    else
    {
      id v4 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  uint64_t v8 = [(NUImageExportJob *)self _filterProperties:v4];

  return v8;
}

- (id)_filterProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(NUImageExportJob *)self imageExportRequest];
  uint64_t v6 = (void *)[v4 mutableCopy];

  if ([v5 applyOrientationAsMetadata])
  {
    id v7 = [(NURenderJob *)self outputGeometry];
    uint64_t v8 = [v7 orientation];
  }
  else
  {
    uint64_t v8 = 1;
  }
  int v9 = [NSNumber numberWithInteger:v8];
  [v6 setObject:v9 forKey:*MEMORY[0x1E4F2FCA0]];

  uint64_t v10 = *MEMORY[0x1E4F2FD40];
  id v11 = [v6 objectForKey:*MEMORY[0x1E4F2FD40]];
  uint64_t v12 = (void *)[v11 mutableCopy];

  if (v12)
  {
    uint64_t v13 = [NSNumber numberWithInteger:v8];
    [v12 setObject:v13 forKey:*MEMORY[0x1E4F2FD70]];

    [v6 setObject:v12 forKey:v10];
  }
  BOOL v14 = (void *)[v6 mutableCopy];
  v15 = [v14 objectForKey:@"{TIFF}"];
  uint64_t v16 = [v15 objectForKey:@"Model"];

  if ([v16 isEqualToString:@"Apple Vision Pro"])
  {
    uint64_t v17 = [v14 objectForKey:@"{HEIF}"];
    uint64_t v18 = [v17 objectForKey:@"CameraExtrinsics"];

    id v19 = [v14 objectForKey:@"{HEIF}"];
    id v20 = [v19 objectForKey:@"CameraModel"];

    if (v18)
    {
      double v21 = [v14 objectForKey:@"{HEIF}"];
      [v21 removeObjectForKey:@"CameraExtrinsics"];
    }
    if (v20)
    {
      uint64_t v22 = [v14 objectForKey:@"{HEIF}"];
      [v22 removeObjectForKey:@"CameraModel"];
    }
    id v23 = v14;

    uint64_t v6 = v23;
  }
  uint64_t v24 = [v5 format];
  [v24 addImageDestinationOptionsToImageProperties:v6];

  id v25 = v6;
  return v25;
}

- (NUImageExportJob)initWithExportRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12864);
  }
  id v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = NSString;
    id v7 = v5;
    uint64_t v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    id v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    int v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_12864);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_12864);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    BOOL v14 = (void *)MEMORY[0x1E4F29060];
    v15 = v13;
    uint64_t v16 = [v14 callStackSymbols];
    uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    int v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  v15 = v18;
  uint64_t v22 = [v20 callStackSymbols];
  id v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  int v31 = specific;
  __int16 v32 = 2114;
  double v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUImageExportJob initWithExportRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 59, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUImageExportJob)initWithImageExportRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUImageExportJob;
  return [(NUExportJob *)&v4 initWithExportRequest:a3];
}

@end