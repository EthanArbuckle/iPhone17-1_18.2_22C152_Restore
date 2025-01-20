@interface UIUDetector
+ (float)defaultIOUThreshold;
+ (int64_t)convertPlatform:(int64_t)a3;
- (UIUDetectorCompat)underlyingObject;
- (id)getDetectionsInScreen:(CGImage *)a3 addOCR:(BOOL)a4 addIcons:(BOOL)a5 addClickability:(BOOL)a6 addFocusElements:(BOOL)a7 nmsThreshold:(float)a8 useAccurateOCR:(BOOL)a9 error:(id *)a10;
- (id)initForPlatform:(int64_t)a3;
- (id)initForPlatform:(int64_t)a3 elementConfidence:(id)a4 clickabilityConfidence:(id)a5 elementConfig:(id)a6 clickabilityConfig:(id)a7;
@end

@implementation UIUDetector

+ (float)defaultIOUThreshold
{
  +[UIUDetectorCompat staticIOUThreshold];
  return result;
}

+ (int64_t)convertPlatform:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (id)initForPlatform:(int64_t)a3 elementConfidence:(id)a4 clickabilityConfidence:(id)a5 elementConfig:(id)a6 clickabilityConfig:(id)a7
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)UIUDetector;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  v15 = [(UIUDetector *)&v23 init];
  id v22 = 0;
  v16 = [[UIUDetectorCompat alloc] initWithPlatform:+[UIUDetector convertPlatform:a3] elementConfidenceThresholds:v14 clickabilityConfidenceThresholds:v13 elementConfig:v12 clickabilityConfig:v11 error:&v22];

  id v17 = v22;
  v18 = v17;
  if (v16 || !v17)
  {
    objc_storeStrong((id *)&v15->_underlyingObject, v16);
    v20 = v15;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v18 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_impl(&dword_2605EC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to initialize detector with error %@", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

- (id)initForPlatform:(int64_t)a3
{
  return [(UIUDetector *)self initForPlatform:a3 elementConfidence:0 clickabilityConfidence:0 elementConfig:0 clickabilityConfig:0];
}

- (id)getDetectionsInScreen:(CGImage *)a3 addOCR:(BOOL)a4 addIcons:(BOOL)a5 addClickability:(BOOL)a6 addFocusElements:(BOOL)a7 nmsThreshold:(float)a8 useAccurateOCR:(BOOL)a9 error:(id *)a10
{
  BOOL v10 = a9;
  BOOL v12 = a7;
  BOOL v13 = a6;
  BOOL v14 = a5;
  BOOL v15 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  v18 = [MEMORY[0x263EFF980] array];
  v19 = [(UIUDetector *)self underlyingObject];
  *(float *)&double v20 = a8;
  v21 = [v19 getUIObjectsInScreen:a3 addOCR:v15 addIconRecognition:v14 addClickability:v13 addFocusElements:v12 nmsThreshold:v10 useAccurateOCR:v20 error:a10];

  if (*a10)
  {
    id v22 = 0;
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [[UIObject alloc] initWithCompat:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          [v18 addObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v25);
    }

    id v22 = v18;
  }

  return v22;
}

- (UIUDetectorCompat)underlyingObject
{
  return (UIUDetectorCompat *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end