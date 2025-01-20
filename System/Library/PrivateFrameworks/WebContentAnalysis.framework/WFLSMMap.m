@interface WFLSMMap
+ (id)mapFromFilePath:(id)a3;
+ (id)mapFromURL:(id)a3;
+ (id)mapWithMap:(__LSMMap *)a3;
- (NSNumber)threshold;
- (WFLSMMap)initWithMap:(__LSMMap *)a3;
- (WFLSMMap)initWithMapFromFilePath:(id)a3;
- (WFLSMMap)initWithMapFromURL:(id)a3;
- (__LSMMap)_map;
- (__LSMText)_createLSMTextFromString:(id)a3;
- (id)evaluate:(id)a3;
- (id)wordDump:(id)a3;
- (int64_t)numberOfCategories;
- (void)_setMap:(__LSMMap *)a3;
- (void)dealloc;
- (void)setThreshold:(id)a3;
@end

@implementation WFLSMMap

+ (id)mapWithMap:(__LSMMap *)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMap:a3];
  return v3;
}

+ (id)mapFromURL:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMapFromURL:a3];
  return v3;
}

+ (id)mapFromFilePath:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMapFromFilePath:a3];
  return v3;
}

- (WFLSMMap)initWithMap:(__LSMMap *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)WFLSMMap;
  v4 = [(WFLSMMap *)&v14 init];
  v5 = v4;
  if (v4)
  {
    [(WFLSMMap *)v4 _setMap:a3];
    CFDictionaryRef Properties = LSMMapGetProperties(a3);
    if (Properties
      && (uint64_t v8 = [(__CFDictionary *)Properties objectForKey:@"Explicit Threshold"]) != 0)
    {
      v9 = (void *)v8;
      [(WFLSMMap *)v5 setThreshold:v8];
      v10 = __WFDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        [v9 floatValue];
        *(_DWORD *)buf = 134217984;
        double v16 = v11;
        _os_log_impl(&dword_217734000, v10, OS_LOG_TYPE_INFO, "Threshold from LSM map: %f", buf, 0xCu);
      }
    }
    else
    {
      LODWORD(v7) = 1058977874;
      -[WFLSMMap setThreshold:](v5, "setThreshold:", [NSNumber numberWithFloat:v7]);
      v12 = __WFDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[WFLSMMap initWithMap:](v12);
      }
    }
  }
  return v5;
}

- (WFLSMMap)initWithMapFromURL:(id)a3
{
  char v12 = 0;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v12))BOOL v5 = v12 == 0; {
  else
  }
    BOOL v5 = 0;
  if (!v5)
  {
    v6 = __WFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WFLSMMap initWithMapFromURL:]();
    }
    return 0;
  }
  LSMMapRef v7 = LSMMapCreateFromURL((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFURLRef)a3, 0);
  if (!v7)
  {
    v10 = __WFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WFLSMMap initWithMapFromURL:]();
    }
    return 0;
  }
  LSMMapRef v8 = v7;
  v9 = [(WFLSMMap *)self initWithMap:v7];
  CFRelease(v8);
  return v9;
}

- (WFLSMMap)initWithMapFromFilePath:(id)a3
{
  uint64_t v4 = [NSURL fileURLWithPath:a3];
  return [(WFLSMMap *)self initWithMapFromURL:v4];
}

- (__LSMMap)_map
{
  return self->map;
}

- (void)_setMap:(__LSMMap *)a3
{
  CFRetain(a3);
  map = self->map;
  if (map) {
    CFRelease(map);
  }
  self->map = a3;
}

- (__LSMText)_createLSMTextFromString:(id)a3
{
  uint64_t v4 = LSMTextCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], self->map);
  if (!v4)
  {
    LSMMapRef v7 = __WFDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WFLSMMap _createLSMTextFromString:]();
    }
    return 0;
  }
  BOOL v5 = v4;
  if (a3)
  {
    if (LSMTextAddWords(v4, (CFStringRef)a3, 0, 0))
    {
      v6 = __WFDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[WFLSMMap _createLSMTextFromString:]();
      }
      return 0;
    }
  }
  else
  {
    LSMMapRef v8 = __WFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WFLSMMap _createLSMTextFromString:]();
    }
  }
  return v5;
}

- (int64_t)numberOfCategories
{
  return LSMMapGetCategoryCount(self->map);
}

- (id)evaluate:(id)a3
{
  uint64_t v4 = [(WFLSMMap *)self _createLSMTextFromString:a3];
  LSMResultRef v5 = LSMResultCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], self->map, v4, [(WFLSMMap *)self numberOfCategories], 0);
  CFRelease(v4);
  if (!v5)
  {
    v6 = __WFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WFLSMMap evaluate:]();
    }
  }
  LSMMapRef v7 = +[WFLSMResult LSMResultWithLSMResultRef:v5 threshold:[(WFLSMMap *)self threshold]];
  if (v5) {
    CFRelease(v5);
  }
  return v7;
}

- (id)wordDump:(id)a3
{
  uint64_t v4 = [(WFLSMMap *)self _createLSMTextFromString:a3];
  LSMResultRef v5 = CFWriteStreamCreateWithAllocatedBuffers((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFAllocatorRef)*MEMORY[0x263EFFB08]);
  CFWriteStreamOpen(v5);
  LSMMapWriteToStream(self->map, v4, v5, 0);
  CFWriteStreamClose(v5);
  v6 = (void *)CFWriteStreamCopyProperty(v5, (CFStreamPropertyKey)*MEMORY[0x263EFFE98]);
  CFRelease(v5);
  CFRelease(v4);
  LSMMapRef v7 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v6, "bytes"));

  LSMMapRef v8 = objc_msgSend((id)objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "newlineCharacterSet")), "mutableCopy");
  [v8 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
  v9 = objc_msgSend((id)objc_msgSend(v8, "reverseObjectEnumerator"), "allObjects");
  return (id)[v9 componentsJoinedByString:@"\n"];
}

- (void)dealloc
{
  map = self->map;
  if (map) {
    CFRelease(map);
  }
  v4.receiver = self;
  v4.super_class = (Class)WFLSMMap;
  [(WFLSMMap *)&v4 dealloc];
}

- (NSNumber)threshold
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setThreshold:(id)a3
{
}

- (void)initWithMap:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217734000, log, OS_LOG_TYPE_ERROR, "*** WFLSMMap initWithMap: unable to retrieve threshold from map file.", v1, 2u);
}

- (void)initWithMapFromURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_217734000, v0, OS_LOG_TYPE_ERROR, "**** WFLSMMap initWithMapFromURL:%@ an error occurred loading the map", v1, 0xCu);
}

- (void)initWithMapFromURL:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_217734000, v0, OS_LOG_TYPE_ERROR, "**** WFLSMMap initWithMapFromURL:%@ file doesn't exist", v1, 0xCu);
}

- (void)_createLSMTextFromString:.cold.1()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217734000, v0, v1, "**** %@: Couldn't create text", v2, v3, v4, v5, v6);
}

- (void)_createLSMTextFromString:.cold.2()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217734000, v0, v1, "**** %@: Couldn't create text because the strippedContent is nil", v2, v3, v4, v5, v6);
}

- (void)_createLSMTextFromString:.cold.3()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217734000, v0, v1, "**** %@: LSMTextAddWords failed", v2, v3, v4, v5, v6);
}

- (void)evaluate:.cold.1()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217734000, v0, v1, "**** %@: LSMResultCreate failed", v2, v3, v4, v5, v6);
}

@end