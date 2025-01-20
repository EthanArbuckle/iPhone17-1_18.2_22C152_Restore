@interface ApplyBlurMapArgs
+ (id)validKeys;
- (ApplyBlurMapArgs)init;
- (ApplyBlurMapArgs)initWithDictionary:(id)a3;
- (ApplyBlurMapIntermediates)intermediates;
- (BOOL)validateForCoreImage;
- (BOOL)validateForMetal;
- (MTLTexture)outputImageChroma;
- (MTLTexture)outputImageLuma;
- (NSData)metadata;
- (NSDictionary)options;
- (NSString)captureFolderMiscPath;
- (float)inputScale;
- (float)lumaNoiseAmplitude;
- (float)maxBlur;
- (float)simulatedAperture;
- (id)description;
- (id)inputAlpha;
- (id)inputBlurMap;
- (id)inputGainMap;
- (id)inputImage;
- (id)inputImageChroma;
- (id)inputImageLuma;
- (void)setCaptureFolderMiscPath:(id)a3;
- (void)setInputAlpha:(id)a3;
- (void)setInputBlurMap:(id)a3;
- (void)setInputGainMap:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputImageChroma:(id)a3;
- (void)setInputImageLuma:(id)a3;
- (void)setInputScale:(float)a3;
- (void)setIntermediates:(id)a3;
- (void)setLumaNoiseAmplitude:(float)a3;
- (void)setMaxBlur:(float)a3;
- (void)setMetadata:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOutputImageChroma:(id)a3;
- (void)setOutputImageLuma:(id)a3;
- (void)setSimulatedAperture:(float)a3;
@end

@implementation ApplyBlurMapArgs

- (ApplyBlurMapArgs)init
{
  v7.receiver = self;
  v7.super_class = (Class)ApplyBlurMapArgs;
  v2 = [(ApplyBlurMapArgs *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_inputScale = 1.0;
    v4 = objc_alloc_init(ApplyBlurMapIntermediates);
    intermediates = v3->_intermediates;
    v3->_intermediates = v4;
  }
  return v3;
}

+ (id)validKeys
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], a2, @"options", @"metadata", @"simulatedAperture", @"maxBlur", @"inputScale", @"lumaNoiseAmplitude", @"inputBlurMap", @"inputAlpha", @"inputImage", @"inputImageLuma", @"inputImageChroma", @"inputGainMap", @"outputImageLuma", @"outputImageChroma", @"intermediates", @"captureFolderMiscPath", 0);
}

- (id)description
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  v6 = objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p\n", v4, self);
  v8 = objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], v7, @"simulatedAperture", @"maxBlur", @"inputScale", @"lumaNoiseAmplitude", 0);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v9 = objc_opt_class();
  v12 = objc_msgSend_validKeys(v9, v10, v11);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v30, v34, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(NSString **)(*((void *)&v30 + 1) + 8 * i);
        SEL v19 = NSSelectorFromString(v18);
        uint64_t v21 = objc_msgSend_methodForSelector_(self, v20, (uint64_t)v19);
        if (v21)
        {
          v23 = (float (*)(ApplyBlurMapArgs *, SEL))v21;
          if (objc_opt_respondsToSelector())
          {
            if (objc_msgSend_containsObject_(v8, v22, (uint64_t)v18))
            {
              float v24 = v23(self, v19);
              objc_msgSend_appendFormat_(v6, v25, @"\t%@: %g,\n", v18, v24);
            }
            else
            {
              v26 = v23(self, v19);
              objc_msgSend_appendFormat_(v6, v27, @"\t%@: %@,\n", v18, v26);
            }
          }
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v22, (uint64_t)&v30, v34, 16);
    }
    while (v15);
  }

  objc_msgSend_appendFormat_(v6, v28, @">\n");

  return v6;
}

- (ApplyBlurMapArgs)initWithDictionary:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)ApplyBlurMapArgs;
  v5 = [(ApplyBlurMapArgs *)&v68 init];
  v6 = v5;
  if (v5)
  {
    v5->_inputScale = 1.0;
    objc_super v7 = objc_alloc_init(ApplyBlurMapIntermediates);
    intermediates = v6->_intermediates;
    v6->_intermediates = v7;

    if (v4)
    {
      v60 = v6;
      v9 = objc_opt_class();
      v12 = objc_msgSend_validKeys(v9, v10, v11);
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      objc_msgSend_allKeys(v4, v13, v14);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v64, v75, 16);
      if (!v16) {
        goto LABEL_41;
      }
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v65;
      uint64_t v61 = *(void *)v65;
      while (1)
      {
        uint64_t v20 = 0;
        uint64_t v62 = v18;
        do
        {
          if (*(void *)v65 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v64 + 1) + 8 * v20);
          if (objc_msgSend_containsObject_(v12, v17, (uint64_t)v21))
          {
            v23 = v12;
            float v24 = objc_msgSend_substringToIndex_(v21, v22, 1);
            v27 = objc_msgSend_capitalizedString(v24, v25, v26);
            v29 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v21, v28, 0, 1, v27);

            objc_msgSend_stringWithFormat_(NSString, v30, @"set%@:", v29);
            long long v31 = (NSString *)objc_claimAutoreleasedReturnValue();
            SEL v32 = NSSelectorFromString(v31);
            id v33 = v4;
            uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v4, v34, (uint64_t)v21);
            if (v35) {
              BOOL v36 = v32 == 0;
            }
            else {
              BOOL v36 = 1;
            }
            if (v36) {
              goto LABEL_36;
            }
            if (objc_opt_respondsToSelector())
            {
              uint64_t v38 = objc_msgSend_methodForSelector_(v60, v37, (uint64_t)v32);
              if (v38)
              {
                v39 = (void (*)(ApplyBlurMapArgs *, SEL))v38;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v40 = v35;
                  uint64_t v43 = objc_msgSend_count(v40, v41, v42);
                  if (v43 == 4)
                  {
                    objc_msgSend_CGRectValue(v40, v44, v45);
                    v39(v60, v32);
                  }
                  else
                  {
                    if (v43 == 2)
                    {
                      objc_msgSend_CGPointValue(v40, v44, v45);
                      v39(v60, v32);
                      goto LABEL_35;
                    }
                    v49 = uni_logger_api();
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                    {
                      v55 = (NSString *)objc_opt_class();
                      *(_DWORD *)buf = 136446722;
                      v70 = "-[ApplyBlurMapArgs initWithDictionary:]";
                      __int16 v71 = 2112;
                      v72 = (NSString *)v21;
                      __int16 v73 = 2112;
                      v74 = v55;
                      v56 = v55;
                      _os_log_error_impl(&dword_262E0F000, v49, OS_LOG_TYPE_ERROR, "%{public}s Unexpected # of components for %@ on class %@", buf, 0x20u);
                    }
LABEL_33:
                  }
LABEL_35:

LABEL_36:
                  id v4 = v33;
                  v12 = v23;
                  uint64_t v19 = v61;
                  uint64_t v18 = v62;
                  goto LABEL_37;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  objc_msgSend_floatValue(v35, v53, v54);
                  v39(v60, v32);
                  goto LABEL_36;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  ((void (*)(ApplyBlurMapArgs *, SEL, void *))v39)(v60, v32, v35);
                  goto LABEL_36;
                }
                v40 = uni_logger_api();
                if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_35;
                }
                v57 = (NSString *)objc_opt_class();
                *(_DWORD *)buf = 136446722;
                v70 = "-[ApplyBlurMapArgs initWithDictionary:]";
                __int16 v71 = 2112;
                v72 = (NSString *)v21;
                __int16 v73 = 2112;
                v74 = v57;
                v49 = v57;
                v50 = v40;
                v51 = "%{public}s Unexpected type (not NSObject) for %@ on class %@";
              }
              else
              {
                v40 = uni_logger_api();
                if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_35;
                }
                v52 = (NSString *)objc_opt_class();
                *(_DWORD *)buf = 136446722;
                v70 = "-[ApplyBlurMapArgs initWithDictionary:]";
                __int16 v71 = 2112;
                v72 = v31;
                __int16 v73 = 2112;
                v74 = v52;
                v49 = v52;
                v50 = v40;
                v51 = "%{public}s can't find implementation for %@ in %@ class; results will be unpredictable";
              }
            }
            else
            {
              v40 = uni_logger_api();
              if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                goto LABEL_35;
              }
              v48 = (NSString *)objc_opt_class();
              *(_DWORD *)buf = 136446722;
              v70 = "-[ApplyBlurMapArgs initWithDictionary:]";
              __int16 v71 = 2112;
              v72 = v48;
              __int16 v73 = 2112;
              v74 = v31;
              v49 = v48;
              v50 = v40;
              v51 = "%{public}s Class %@ does not respond to selector %@; results will be unpredictable";
            }
            _os_log_error_impl(&dword_262E0F000, v50, OS_LOG_TYPE_ERROR, v51, buf, 0x20u);
            goto LABEL_33;
          }
          v29 = uni_logger_api();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v46 = (NSString *)objc_opt_class();
            *(_DWORD *)buf = 136446722;
            v70 = "-[ApplyBlurMapArgs initWithDictionary:]";
            __int16 v71 = 2112;
            v72 = v46;
            __int16 v73 = 2112;
            v74 = (NSString *)v21;
            v47 = v46;
            _os_log_error_impl(&dword_262E0F000, v29, OS_LOG_TYPE_ERROR, "%{public}s Invalid key for %@: %@; results will be unpredictable",
              buf,
              0x20u);
          }
LABEL_37:

          ++v20;
        }
        while (v18 != v20);
        uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v64, v75, 16);
        uint64_t v18 = v58;
        if (!v58)
        {
LABEL_41:

          v6 = v60;
          break;
        }
      }
    }
  }

  return v6;
}

- (BOOL)validateForMetal
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_simulatedAperture <= 0.0) {
    goto LABEL_20;
  }
  float maxBlur = self->_maxBlur;
  BOOL v5 = maxBlur <= 0.0 || maxBlur > 1.0;
  if (v5 || self->_inputScale <= 0.0 || self->_lumaNoiseAmplitude < 0.0) {
    goto LABEL_20;
  }
  int v6 = objc_msgSend_conformsToProtocol_(self->_inputBlurMap, v3, (uint64_t)&unk_270E2A1A0);
  if (!v6) {
    return v6;
  }
  id inputAlpha = self->_inputAlpha;
  if (inputAlpha)
  {
    int v6 = objc_msgSend_conformsToProtocol_(inputAlpha, v7, (uint64_t)&unk_270E2A1A0);
    if (!v6) {
      return v6;
    }
  }
  if (self->_inputImage)
  {
LABEL_20:
    LOBYTE(v6) = 0;
    return v6;
  }
  int v6 = objc_msgSend_conformsToProtocol_(self->_inputImageLuma, v7, (uint64_t)&unk_270E2A1A0);
  if (v6)
  {
    int v6 = objc_msgSend_conformsToProtocol_(self->_inputImageChroma, v9, (uint64_t)&unk_270E2A1A0);
    if (v6)
    {
      int v6 = objc_msgSend_conformsToProtocol_(self->_outputImageLuma, v10, (uint64_t)&unk_270E2A1A0);
      if (v6)
      {
        int v6 = objc_msgSend_conformsToProtocol_(self->_outputImageChroma, v11, (uint64_t)&unk_270E2A1A0);
        if (v6)
        {
          if (objc_msgSend_validateForMetal(self->_intermediates, v12, v13))
          {
            LOBYTE(v6) = 1;
            return v6;
          }
          goto LABEL_20;
        }
      }
    }
  }
  return v6;
}

- (BOOL)validateForCoreImage
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_simulatedAperture <= 0.0) {
    return 0;
  }
  float maxBlur = self->_maxBlur;
  if (maxBlur <= 0.0 || maxBlur > 1.0) {
    return 0;
  }
  if (self->_inputScale <= 0.0) {
    return 0;
  }
  if (self->_lumaNoiseAmplitude < 0.0) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (self->_inputAlpha)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  if (self->_inputImage)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || self->_inputImageLuma || self->_inputImageChroma) {
      return 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  return !self->_outputImageLuma && !self->_outputImageChroma;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (float)simulatedAperture
{
  return self->_simulatedAperture;
}

- (void)setSimulatedAperture:(float)a3
{
  self->_simulatedAperture = a3;
}

- (float)maxBlur
{
  return self->_maxBlur;
}

- (void)setMaxBlur:(float)a3
{
  self->_float maxBlur = a3;
}

- (float)inputScale
{
  return self->_inputScale;
}

- (void)setInputScale:(float)a3
{
  self->_inputScale = a3;
}

- (float)lumaNoiseAmplitude
{
  return self->_lumaNoiseAmplitude;
}

- (void)setLumaNoiseAmplitude:(float)a3
{
  self->_lumaNoiseAmplitude = a3;
}

- (id)inputBlurMap
{
  return self->_inputBlurMap;
}

- (void)setInputBlurMap:(id)a3
{
}

- (id)inputAlpha
{
  return self->_inputAlpha;
}

- (void)setInputAlpha:(id)a3
{
}

- (id)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (id)inputImageLuma
{
  return self->_inputImageLuma;
}

- (void)setInputImageLuma:(id)a3
{
}

- (id)inputImageChroma
{
  return self->_inputImageChroma;
}

- (void)setInputImageChroma:(id)a3
{
}

- (id)inputGainMap
{
  return self->_inputGainMap;
}

- (void)setInputGainMap:(id)a3
{
}

- (MTLTexture)outputImageLuma
{
  return self->_outputImageLuma;
}

- (void)setOutputImageLuma:(id)a3
{
}

- (MTLTexture)outputImageChroma
{
  return self->_outputImageChroma;
}

- (void)setOutputImageChroma:(id)a3
{
}

- (ApplyBlurMapIntermediates)intermediates
{
  return self->_intermediates;
}

- (void)setIntermediates:(id)a3
{
}

- (NSString)captureFolderMiscPath
{
  return self->_captureFolderMiscPath;
}

- (void)setCaptureFolderMiscPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureFolderMiscPath, 0);
  objc_storeStrong((id *)&self->_intermediates, 0);
  objc_storeStrong((id *)&self->_outputImageChroma, 0);
  objc_storeStrong((id *)&self->_outputImageLuma, 0);
  objc_storeStrong(&self->_inputGainMap, 0);
  objc_storeStrong(&self->_inputImageChroma, 0);
  objc_storeStrong(&self->_inputImageLuma, 0);
  objc_storeStrong(&self->_inputImage, 0);
  objc_storeStrong(&self->_inputAlpha, 0);
  objc_storeStrong(&self->_inputBlurMap, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end