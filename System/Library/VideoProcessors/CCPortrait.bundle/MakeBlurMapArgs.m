@interface MakeBlurMapArgs
+ (id)validKeys;
- (BOOL)validateForCoreImage;
- (BOOL)validateForMetal;
- (CGRect)focusWindow;
- (MTLTexture)outputBlurMap;
- (MakeBlurMapArgs)init;
- (MakeBlurMapArgs)initWithDictionary:(id)a3;
- (MakeBlurMapIntermediates)intermediates;
- (NSArray)facePoints;
- (NSData)metadata;
- (NSDictionary)options;
- (NSString)captureFolderMiscPath;
- (float)focalLengthInPixels;
- (float)inputScale;
- (float)maxBlur;
- (float)normalizedFocalLength;
- (float)simulatedAperture;
- (id)description;
- (id)inputGainMap;
- (id)inputGlasses;
- (id)inputHair;
- (id)inputImage;
- (id)inputImageChroma;
- (id)inputImageLuma;
- (id)inputSegmentation;
- (id)inputShiftMap;
- (void)setCaptureFolderMiscPath:(id)a3;
- (void)setFacePoints:(id)a3;
- (void)setFocalLengthInPixels:(float)a3;
- (void)setFocusWindow:(CGRect)a3;
- (void)setInputGainMap:(id)a3;
- (void)setInputGlasses:(id)a3;
- (void)setInputHair:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputImageChroma:(id)a3;
- (void)setInputImageLuma:(id)a3;
- (void)setInputScale:(float)a3;
- (void)setInputSegmentation:(id)a3;
- (void)setInputShiftMap:(id)a3;
- (void)setIntermediates:(id)a3;
- (void)setMaxBlur:(float)a3;
- (void)setMetadata:(id)a3;
- (void)setNormalizedFocalLength:(float)a3;
- (void)setOptions:(id)a3;
- (void)setOutputBlurMap:(id)a3;
- (void)setSimulatedAperture:(float)a3;
@end

@implementation MakeBlurMapArgs

- (MakeBlurMapArgs)init
{
  v8.receiver = self;
  v8.super_class = (Class)MakeBlurMapArgs;
  v2 = [(MakeBlurMapArgs *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_inputScale = 1.0;
    CGSize v4 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v2->_focusWindow.origin = (CGPoint)*MEMORY[0x263F001A0];
    v2->_focusWindow.size = v4;
    v5 = objc_alloc_init(MakeBlurMapIntermediates);
    intermediates = v3->_intermediates;
    v3->_intermediates = v5;

    v3->_focalLengthInPixels = 0.0;
    v3->_normalizedFocalLength = 0.0;
  }
  return v3;
}

+ (id)validKeys
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], a2, @"options", @"metadata", @"simulatedAperture", @"focalLengthInPixels", @"maxBlur", @"inputScale", @"focusWindow", @"facePoints", @"inputImage", @"inputImageLuma", @"inputImageChroma", @"inputShiftMap", @"inputSegmentation", @"inputHair", @"inputGlasses", @"inputGainMap", @"intermediates",
               @"captureFolderMiscPath",
               0);
}

- (id)description
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  v6 = objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p\n", v4, self);
  objc_super v8 = objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], v7, @"simulatedAperture", @"focalLengthInPixels", @"maxBlur", @"inputScale", @"focusWindow", 0);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v9 = objc_opt_class();
  v12 = objc_msgSend_validKeys(v9, v10, v11);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v39, v43, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(NSString **)(*((void *)&v39 + 1) + 8 * i);
        SEL v19 = NSSelectorFromString(v18);
        uint64_t v21 = objc_msgSend_methodForSelector_(self, v20, (uint64_t)v19);
        if (v21)
        {
          v23 = (double (*)(MakeBlurMapArgs *, SEL))v21;
          if (objc_opt_respondsToSelector())
          {
            if (objc_msgSend_containsObject_(v8, v22, (uint64_t)v18))
            {
              if (objc_msgSend_isEqualToString_(v18, v24, @"focusWindow"))
              {
                double v25 = v23(self, v19);
                objc_msgSend_appendFormat_(v6, v26, @"\t%@: { x=%g,y=%g width=%g, height=%g },\n", v18, *(void *)&v25, v27, v28, v29);
              }
              else
              {
                double v35 = (float)v23(self, v19);
                objc_msgSend_appendFormat_(v6, v32, @"\t%@: %g,\n", v18, *(void *)&v35, v36, v37, v38);
              }
            }
            else
            {
              v30 = v23(self, v19);
              objc_msgSend_appendFormat_(v6, v31, @"\t%@: %@,\n", v18, v30);
            }
          }
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v22, (uint64_t)&v39, v43, 16);
    }
    while (v15);
  }

  objc_msgSend_appendFormat_(v6, v33, @">\n");

  return v6;
}

- (MakeBlurMapArgs)initWithDictionary:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)MakeBlurMapArgs;
  v5 = [(MakeBlurMapArgs *)&v69 init];
  v6 = v5;
  if (v5)
  {
    v5->_inputScale = 1.0;
    CGSize v7 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v5->_focusWindow.origin = (CGPoint)*MEMORY[0x263F001A0];
    v5->_focusWindow.size = v7;
    objc_super v8 = objc_alloc_init(MakeBlurMapIntermediates);
    intermediates = v6->_intermediates;
    v6->_intermediates = v8;

    if (v4)
    {
      v61 = v6;
      v10 = objc_opt_class();
      v13 = objc_msgSend_validKeys(v10, v11, v12);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      objc_msgSend_allKeys(v4, v14, v15);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v65, v76, 16);
      if (!v17) {
        goto LABEL_41;
      }
      uint64_t v19 = v17;
      uint64_t v20 = *(void *)v66;
      uint64_t v62 = *(void *)v66;
      while (1)
      {
        uint64_t v21 = 0;
        uint64_t v63 = v19;
        do
        {
          if (*(void *)v66 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v65 + 1) + 8 * v21);
          if (objc_msgSend_containsObject_(v13, v18, (uint64_t)v22))
          {
            v24 = v13;
            double v25 = objc_msgSend_substringToIndex_(v22, v23, 1);
            uint64_t v28 = objc_msgSend_capitalizedString(v25, v26, v27);
            v30 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v22, v29, 0, 1, v28);

            objc_msgSend_stringWithFormat_(NSString, v31, @"set%@:", v30);
            v32 = (NSString *)objc_claimAutoreleasedReturnValue();
            SEL v33 = NSSelectorFromString(v32);
            id v34 = v4;
            uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v4, v35, (uint64_t)v22);
            if (v36) {
              BOOL v37 = v33 == 0;
            }
            else {
              BOOL v37 = 1;
            }
            if (v37) {
              goto LABEL_36;
            }
            if (objc_opt_respondsToSelector())
            {
              uint64_t v39 = objc_msgSend_methodForSelector_(v61, v38, (uint64_t)v33);
              if (v39)
              {
                long long v40 = (void (*)(MakeBlurMapArgs *, SEL))v39;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v41 = v36;
                  uint64_t v44 = objc_msgSend_count(v41, v42, v43);
                  if (v44 == 4)
                  {
                    objc_msgSend_CGRectValue(v41, v45, v46);
                    v40(v61, v33);
                  }
                  else
                  {
                    if (v44 == 2)
                    {
                      objc_msgSend_CGPointValue(v41, v45, v46);
                      v40(v61, v33);
                      goto LABEL_35;
                    }
                    v50 = uni_logger_api();
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                    {
                      v56 = (NSString *)objc_opt_class();
                      *(_DWORD *)buf = 136446722;
                      v71 = "-[MakeBlurMapArgs initWithDictionary:]";
                      __int16 v72 = 2112;
                      v73 = (NSString *)v22;
                      __int16 v74 = 2112;
                      v75 = v56;
                      v57 = v56;
                      _os_log_error_impl(&dword_262E0F000, v50, OS_LOG_TYPE_ERROR, "%{public}s Unexpected # of components for %@ on class %@", buf, 0x20u);
                    }
LABEL_33:
                  }
LABEL_35:

LABEL_36:
                  id v4 = v34;
                  v13 = v24;
                  uint64_t v20 = v62;
                  uint64_t v19 = v63;
                  goto LABEL_37;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  objc_msgSend_floatValue(v36, v54, v55);
                  v40(v61, v33);
                  goto LABEL_36;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  ((void (*)(MakeBlurMapArgs *, SEL, void *))v40)(v61, v33, v36);
                  goto LABEL_36;
                }
                long long v41 = uni_logger_api();
                if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_35;
                }
                v58 = (NSString *)objc_opt_class();
                *(_DWORD *)buf = 136446722;
                v71 = "-[MakeBlurMapArgs initWithDictionary:]";
                __int16 v72 = 2112;
                v73 = (NSString *)v22;
                __int16 v74 = 2112;
                v75 = v58;
                v50 = v58;
                v51 = v41;
                v52 = "%{public}s Unexpected type (not NSObject) for %@ on class %@";
              }
              else
              {
                long long v41 = uni_logger_api();
                if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_35;
                }
                v53 = (NSString *)objc_opt_class();
                *(_DWORD *)buf = 136446722;
                v71 = "-[MakeBlurMapArgs initWithDictionary:]";
                __int16 v72 = 2112;
                v73 = v32;
                __int16 v74 = 2112;
                v75 = v53;
                v50 = v53;
                v51 = v41;
                v52 = "%{public}s can't find implementation for %@ in %@ class; results will be unpredictable";
              }
            }
            else
            {
              long long v41 = uni_logger_api();
              if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                goto LABEL_35;
              }
              v49 = (NSString *)objc_opt_class();
              *(_DWORD *)buf = 136446722;
              v71 = "-[MakeBlurMapArgs initWithDictionary:]";
              __int16 v72 = 2112;
              v73 = v49;
              __int16 v74 = 2112;
              v75 = v32;
              v50 = v49;
              v51 = v41;
              v52 = "%{public}s Class %@ does not respond to selector %@; results will be unpredictable";
            }
            _os_log_error_impl(&dword_262E0F000, v51, OS_LOG_TYPE_ERROR, v52, buf, 0x20u);
            goto LABEL_33;
          }
          v30 = uni_logger_api();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v47 = (NSString *)objc_opt_class();
            *(_DWORD *)buf = 136446722;
            v71 = "-[MakeBlurMapArgs initWithDictionary:]";
            __int16 v72 = 2112;
            v73 = v47;
            __int16 v74 = 2112;
            v75 = (NSString *)v22;
            v48 = v47;
            _os_log_error_impl(&dword_262E0F000, v30, OS_LOG_TYPE_ERROR, "%{public}s Invalid key for %@: %@; results will be unpredictable",
              buf,
              0x20u);
          }
LABEL_37:

          ++v21;
        }
        while (v19 != v21);
        uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v65, v76, 16);
        uint64_t v19 = v59;
        if (!v59)
        {
LABEL_41:

          v6 = v61;
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
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_simulatedAperture <= 0.0
    || self->_normalizedFocalLength <= 0.0
    || ((maxBlur = self->_maxBlur, maxBlur > 0.0) ? (BOOL v4 = maxBlur > 1.0) : (BOOL v4 = 1),
        v4 || self->_inputScale <= 0.0 || CGRectIsEmpty(self->_focusWindow) || self->_inputImage))
  {
LABEL_24:
    LOBYTE(v6) = 0;
    return v6;
  }
  int v6 = objc_msgSend_conformsToProtocol_(self->_inputImageLuma, v5, (uint64_t)&unk_270E2A1A0);
  if (v6)
  {
    int v6 = objc_msgSend_conformsToProtocol_(self->_inputImageChroma, v7, (uint64_t)&unk_270E2A1A0);
    if (v6)
    {
      int v6 = objc_msgSend_conformsToProtocol_(self->_inputShiftMap, v8, (uint64_t)&unk_270E2A1A0);
      if (v6)
      {
        id inputSegmentation = self->_inputSegmentation;
        if (!inputSegmentation
          || (int v6 = objc_msgSend_conformsToProtocol_(inputSegmentation, v9, (uint64_t)&unk_270E2A1A0)) != 0)
        {
          id inputHair = self->_inputHair;
          if (!inputHair || (int v6 = objc_msgSend_conformsToProtocol_(inputHair, v9, (uint64_t)&unk_270E2A1A0)) != 0)
          {
            id inputGlasses = self->_inputGlasses;
            if (!inputGlasses
              || (int v6 = objc_msgSend_conformsToProtocol_(inputGlasses, v9, (uint64_t)&unk_270E2A1A0)) != 0)
            {
              int v6 = objc_msgSend_conformsToProtocol_(self->_outputBlurMap, v9, (uint64_t)&unk_270E2A1A0);
              if (v6)
              {
                if (objc_msgSend_validateForMetal(self->_intermediates, v13, v14))
                {
                  LOBYTE(v6) = 1;
                  return v6;
                }
                goto LABEL_24;
              }
            }
          }
        }
      }
    }
  }
  return v6;
}

- (BOOL)validateForCoreImage
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_simulatedAperture <= 0.0
    || self->_focalLengthInPixels <= 0.0 && self->_normalizedFocalLength <= 0.0)
  {
    return 0;
  }
  float maxBlur = self->_maxBlur;
  BOOL v4 = maxBlur <= 0.0 || maxBlur > 1.0;
  if (v4 || self->_inputScale <= 0.0 || CGRectIsEmpty(self->_focusWindow)) {
    return 0;
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
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!self->_inputSegmentation || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!self->_inputHair || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (!self->_inputGlasses || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (!self->_inputGainMap || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (!self->_outputBlurMap) {
              return 1;
            }
          }
        }
      }
    }
  }
  return 0;
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

- (float)focalLengthInPixels
{
  return self->_focalLengthInPixels;
}

- (void)setFocalLengthInPixels:(float)a3
{
  self->_focalLengthInPixels = a3;
}

- (float)normalizedFocalLength
{
  return self->_normalizedFocalLength;
}

- (void)setNormalizedFocalLength:(float)a3
{
  self->_normalizedFocalLength = a3;
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

- (CGRect)focusWindow
{
  double x = self->_focusWindow.origin.x;
  double y = self->_focusWindow.origin.y;
  double width = self->_focusWindow.size.width;
  double height = self->_focusWindow.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFocusWindow:(CGRect)a3
{
  self->_focusWindow = a3;
}

- (NSArray)facePoints
{
  return self->_facePoints;
}

- (void)setFacePoints:(id)a3
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

- (id)inputShiftMap
{
  return self->_inputShiftMap;
}

- (void)setInputShiftMap:(id)a3
{
}

- (id)inputSegmentation
{
  return self->_inputSegmentation;
}

- (void)setInputSegmentation:(id)a3
{
}

- (id)inputHair
{
  return self->_inputHair;
}

- (void)setInputHair:(id)a3
{
}

- (id)inputGlasses
{
  return self->_inputGlasses;
}

- (void)setInputGlasses:(id)a3
{
}

- (id)inputGainMap
{
  return self->_inputGainMap;
}

- (void)setInputGainMap:(id)a3
{
}

- (MTLTexture)outputBlurMap
{
  return self->_outputBlurMap;
}

- (void)setOutputBlurMap:(id)a3
{
}

- (MakeBlurMapIntermediates)intermediates
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
  objc_storeStrong((id *)&self->_outputBlurMap, 0);
  objc_storeStrong(&self->_inputGainMap, 0);
  objc_storeStrong(&self->_inputGlasses, 0);
  objc_storeStrong(&self->_inputHair, 0);
  objc_storeStrong(&self->_inputSegmentation, 0);
  objc_storeStrong(&self->_inputShiftMap, 0);
  objc_storeStrong(&self->_inputImageChroma, 0);
  objc_storeStrong(&self->_inputImageLuma, 0);
  objc_storeStrong(&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_facePoints, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end