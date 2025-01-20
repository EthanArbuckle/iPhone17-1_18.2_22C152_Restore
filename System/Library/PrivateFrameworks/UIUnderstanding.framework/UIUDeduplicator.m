@interface UIUDeduplicator
+ (BOOL)areModelsAvailable;
+ (BOOL)downloadModelSet:(int64_t)a3 timeout:(double)a4;
+ (BOOL)downloadModels:(double)a3;
- (UIDeduplicatorCompat)underlyingObject;
- (UIUDeduplicator)initWithPortraitModels;
- (UIUDeduplicator)initWithSquareModels;
- (id)addElementsForScreen:(id)a3 candidates:(id)a4 screenGroupID:(id)a5;
- (id)identifyElements:(id)a3 elements:(id)a4;
- (id)identifyImage:(id)a3 image:(CGImage *)a4;
- (id)init:(int64_t)a3;
- (void)setDebugMode;
@end

@implementation UIUDeduplicator

- (id)init:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UIUDeduplicator;
  v4 = [(UIUDeduplicator *)&v13 init];
  if (a3 != 2) {
    a3 = a3 == 1;
  }
  id v12 = 0;
  v5 = [[UIDeduplicatorCompat alloc] initWithPlatform:a3 error:&v12];
  id v6 = v12;
  underlyingObject = v4->_underlyingObject;
  v4->_underlyingObject = v5;

  if (v4->_underlyingObject) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    v9 = v4;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[UIUDeduplicator init:](v6);
    }
    v9 = 0;
  }

  return v9;
}

- (UIUDeduplicator)initWithPortraitModels
{
  return (UIUDeduplicator *)[(UIUDeduplicator *)self init:0];
}

- (UIUDeduplicator)initWithSquareModels
{
  return (UIUDeduplicator *)[(UIUDeduplicator *)self init:1];
}

- (id)identifyImage:(id)a3 image:(CGImage *)a4
{
  id v6 = a3;
  v7 = [(UIUDeduplicator *)self underlyingObject];
  id v12 = 0;
  BOOL v8 = [v7 identifyScreenshotWithId:v6 image:a4 error:&v12];
  id v9 = v12;

  if (v8 || !v9)
  {
    v10 = [[UIUScreenShot alloc] initWithContents:v8];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[UIUDeduplicator identifyImage:image:]((uint64_t)v6, v9);
    }
    v10 = 0;
  }

  return v10;
}

- (id)identifyElements:(id)a3 elements:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [MEMORY[0x263EFF980] array];
  id v9 = [v6 underlyingObject];
  v10 = [(UIUDeduplicator *)self underlyingObject];
  id v28 = 0;
  v11 = [v10 identifyElementsWithScreenshot:v9 rectArray:v7 error:&v28];
  id v12 = v28;

  if (v11 || !v12)
  {
    v23 = v9;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = v11;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[UIUDedupeElement alloc] initWithContents:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          [v8 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v18);
    }

    id v15 = v8;
    id v9 = v23;
  }
  else
  {
    objc_super v13 = [v6 underlyingObject];
    v14 = [v13 imageID];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[UIUDeduplicator identifyElements:elements:]((uint64_t)v14, v12);
    }

    id v15 = (id)MEMORY[0x263EFFA68];
  }

  return v15;
}

- (id)addElementsForScreen:(id)a3 candidates:(id)a4 screenGroupID:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 underlyingObject];
  id v12 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v27 + 1) + 8 * i) underlyingObject];
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [(UIUDeduplicator *)self underlyingObject];
  id v26 = 0;
  v20 = [v19 addElementsForScreenWithTargetScreenshot:v11 candidateElements:v12 screenGroupID:v10 error:&v26];
  id v21 = v26;

  if (v20 || !v21)
  {
    long long v24 = [[UIUAddedElements alloc] initWithContents:v20];
  }
  else
  {
    v22 = [v8 underlyingObject];
    v23 = [v22 imageID];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[UIUDeduplicator addElementsForScreen:candidates:screenGroupID:]((uint64_t)v23, v21);
    }

    long long v24 = 0;
  }

  return v24;
}

- (void)setDebugMode
{
  id v2 = [(UIUDeduplicator *)self underlyingObject];
  [v2 setDebugTo:1];
}

+ (BOOL)areModelsAvailable
{
  return +[UIUModelFetcher areModelsAvailable];
}

+ (BOOL)downloadModelSet:(int64_t)a3 timeout:(double)a4
{
  return +[UIUModelFetcher downloadModelSet:a3 timeout:a4];
}

+ (BOOL)downloadModels:(double)a3
{
  return [a1 downloadModelSet:0 timeout:a3];
}

- (UIDeduplicatorCompat)underlyingObject
{
  return (UIDeduplicatorCompat *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (void)init:(void *)a1 .cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [a1 localizedDescription];
  int v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_2605EC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create deduplicator with error %@", (uint8_t *)&v2, 0xCu);
}

- (void)identifyImage:(uint64_t)a1 image:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2605EC000, &_os_log_internal, v3, "Failed to load image %@ with error %@", v4, v5, v6, v7, v8);
}

- (void)identifyElements:(uint64_t)a1 elements:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2605EC000, &_os_log_internal, v3, "Failed to identify elements on image %@ with error: %@", v4, v5, v6, v7, v8);
}

- (void)addElementsForScreen:(uint64_t)a1 candidates:(void *)a2 screenGroupID:.cold.1(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2605EC000, &_os_log_internal, v3, "Failed to add elements for screenshot %@ with error: %@", v4, v5, v6, v7, v8);
}

@end