@interface WebCoreStatistics
+ (BOOL)shouldPrintExceptions;
+ (id)javaScriptObjectTypeCounts;
+ (id)javaScriptProtectedObjectTypeCounts;
+ (id)memoryStatistics;
+ (id)statistics;
+ (int)autoreleasedPageCount;
+ (int)cachedFrameCount;
+ (int)cachedPageCount;
+ (unint64_t)cachedFontDataCount;
+ (unint64_t)cachedFontDataInactiveCount;
+ (unint64_t)glyphPageCount;
+ (unint64_t)iconPageURLMappingCount;
+ (unint64_t)iconRecordCount;
+ (unint64_t)iconRetainedPageURLCount;
+ (unint64_t)iconsWithDataCount;
+ (unint64_t)javaScriptGlobalObjectsCount;
+ (unint64_t)javaScriptNoGCAllowedObjectsCount;
+ (unint64_t)javaScriptObjectsCount;
+ (unint64_t)javaScriptProtectedGlobalObjectsCount;
+ (unint64_t)javaScriptProtectedObjectsCount;
+ (unint64_t)javaScriptReferencedObjectsCount;
+ (void)emptyCache;
+ (void)garbageCollectJavaScriptObjects;
+ (void)garbageCollectJavaScriptObjectsOnAlternateThreadForDebugging:(BOOL)a3;
+ (void)purgeInactiveFontData;
+ (void)setCacheDisabled:(BOOL)a3;
+ (void)setJavaScriptGarbageCollectorTimerEnabled:(BOOL)a3;
+ (void)setShouldPrintExceptions:(BOOL)a3;
+ (void)startIgnoringWebCoreNodeLeaks;
+ (void)stopIgnoringWebCoreNodeLeaks;
@end

@implementation WebCoreStatistics

+ (id)statistics
{
  return +[WebCache statistics];
}

+ (unint64_t)javaScriptObjectsCount
{
  v2 = (uint64_t *)MEMORY[0x1E4FB64D8];
  if (*MEMORY[0x1E4FB64D8])
  {
    MEMORY[0x1E4E43B00](v7);
    uint64_t v3 = *v2;
    if (!*v2) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1E4E43B00](v7, v4);
    uint64_t v3 = *v2;
    if (!*v2) {
LABEL_5:
    }
      uint64_t v3 = WebCore::commonVMSlow((WebCore *)v3);
  }
  unint64_t v5 = JSC::Heap::objectCount((JSC::Heap *)(v3 + 192));
  MEMORY[0x1E4E43B10](v7);
  return v5;
}

+ (unint64_t)javaScriptGlobalObjectsCount
{
  v2 = (uint64_t *)MEMORY[0x1E4FB64D8];
  if (*MEMORY[0x1E4FB64D8])
  {
    MEMORY[0x1E4E43B00](v7);
    uint64_t v3 = *v2;
    if (!*v2) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1E4E43B00](v7, v4);
    uint64_t v3 = *v2;
    if (!*v2) {
LABEL_5:
    }
      uint64_t v3 = WebCore::commonVMSlow((WebCore *)v3);
  }
  unint64_t v5 = JSC::Heap::globalObjectCount((JSC::Heap *)(v3 + 192));
  MEMORY[0x1E4E43B10](v7);
  return v5;
}

+ (unint64_t)javaScriptProtectedObjectsCount
{
  v2 = (uint64_t *)MEMORY[0x1E4FB64D8];
  if (*MEMORY[0x1E4FB64D8])
  {
    MEMORY[0x1E4E43B00](v7);
    uint64_t v3 = *v2;
    if (!*v2) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1E4E43B00](v7, v4);
    uint64_t v3 = *v2;
    if (!*v2) {
LABEL_5:
    }
      uint64_t v3 = WebCore::commonVMSlow((WebCore *)v3);
  }
  unint64_t v5 = JSC::Heap::protectedObjectCount((JSC::Heap *)(v3 + 192));
  MEMORY[0x1E4E43B10](v7);
  return v5;
}

+ (unint64_t)javaScriptProtectedGlobalObjectsCount
{
  v2 = (uint64_t *)MEMORY[0x1E4FB64D8];
  if (*MEMORY[0x1E4FB64D8])
  {
    MEMORY[0x1E4E43B00](v7);
    uint64_t v3 = *v2;
    if (!*v2) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1E4E43B00](v7, v4);
    uint64_t v3 = *v2;
    if (!*v2) {
LABEL_5:
    }
      uint64_t v3 = WebCore::commonVMSlow((WebCore *)v3);
  }
  unint64_t v5 = JSC::Heap::protectedGlobalObjectCount((JSC::Heap *)(v3 + 192));
  MEMORY[0x1E4E43B10](v7);
  return v5;
}

+ (id)javaScriptProtectedObjectTypeCounts
{
  v2 = (uint64_t *)MEMORY[0x1E4FB64D8];
  if (*MEMORY[0x1E4FB64D8])
  {
    MEMORY[0x1E4E43B00](v11);
    uint64_t v3 = *v2;
    if (*v2) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1E4E43B00](v11, v4);
    uint64_t v3 = *v2;
    if (*v2) {
      goto LABEL_6;
    }
  }
  uint64_t v3 = WebCore::commonVMSlow((WebCore *)v3);
LABEL_6:
  JSC::Heap::protectedObjectTypeCounts((uint64_t *)&v9, (JSC::Heap *)(v3 + 192));
  createNSCountedSet((uint64_t *)&cf, (uint64_t *)v9);
  CFTypeRef v6 = (id)CFMakeCollectable(cf);
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(void *)v7) {
      WTF::fastFree((WTF *)(*(void *)v7 - 16), v5);
    }
    WTF::fastFree(v7, v5);
  }
  MEMORY[0x1E4E43B10](v11);
  return (id)v6;
}

+ (id)javaScriptObjectTypeCounts
{
  v2 = (uint64_t *)MEMORY[0x1E4FB64D8];
  if (*MEMORY[0x1E4FB64D8])
  {
    MEMORY[0x1E4E43B00](v11);
    uint64_t v3 = *v2;
    if (*v2) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1E4E43B00](v11, v4);
    uint64_t v3 = *v2;
    if (*v2) {
      goto LABEL_6;
    }
  }
  uint64_t v3 = WebCore::commonVMSlow((WebCore *)v3);
LABEL_6:
  JSC::Heap::objectTypeCounts((uint64_t *)&v9, (JSC::Heap *)(v3 + 192));
  createNSCountedSet((uint64_t *)&cf, (uint64_t *)v9);
  CFTypeRef v6 = (id)CFMakeCollectable(cf);
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(void *)v7) {
      WTF::fastFree((WTF *)(*(void *)v7 - 16), v5);
    }
    WTF::fastFree(v7, v5);
  }
  MEMORY[0x1E4E43B10](v11);
  return (id)v6;
}

+ (void)garbageCollectJavaScriptObjects
{
  uint64_t v2 = WebCore::GCController::singleton((WebCore::GCController *)a1);
  MEMORY[0x1F416CE70](v2);
}

+ (void)garbageCollectJavaScriptObjectsOnAlternateThreadForDebugging:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = WebCore::GCController::singleton((WebCore::GCController *)a1);
  MEMORY[0x1F416CE80](v4, v3);
}

+ (void)setJavaScriptGarbageCollectorTimerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = WebCore::GCController::singleton((WebCore::GCController *)a1);
  MEMORY[0x1F416CE78](v4, v3);
}

+ (unint64_t)iconPageURLMappingCount
{
  return 0;
}

+ (unint64_t)iconRetainedPageURLCount
{
  return 0;
}

+ (unint64_t)iconRecordCount
{
  return 0;
}

+ (unint64_t)iconsWithDataCount
{
  return 0;
}

+ (unint64_t)cachedFontDataCount
{
  uint64_t v2 = WebCore::FontCache::forCurrentThread((WebCore::FontCache *)a1);
  return MEMORY[0x1F41737C8](v2);
}

+ (unint64_t)cachedFontDataInactiveCount
{
  uint64_t v2 = WebCore::FontCache::forCurrentThread((WebCore::FontCache *)a1);
  return MEMORY[0x1F41737B0](v2);
}

+ (void)purgeInactiveFontData
{
  uint64_t v2 = WebCore::FontCache::forCurrentThread((WebCore::FontCache *)a1);
  MEMORY[0x1F41737B8](v2, 0xFFFFFFFFLL);
}

+ (unint64_t)glyphPageCount
{
  return *MEMORY[0x1E4FB6528];
}

+ (BOOL)shouldPrintExceptions
{
  if (!*MEMORY[0x1E4FB64D8]) {
    WebCore::commonVMSlow((WebCore *)a1);
  }
  uint64_t v2 = (WebCore::PageConsoleClient *)MEMORY[0x1E4E43B00](v5);
  char shouldPrintExceptions = WebCore::PageConsoleClient::shouldPrintExceptions(v2);
  MEMORY[0x1E4E43B10](v5);
  return shouldPrintExceptions;
}

+ (void)setShouldPrintExceptions:(BOOL)a3
{
  BOOL v3 = a3;
  if (!*MEMORY[0x1E4FB64D8]) {
    WebCore::commonVMSlow((WebCore *)a1);
  }
  MEMORY[0x1E4E43B00](v4);
  WebCore::PageConsoleClient::setShouldPrintExceptions((WebCore::PageConsoleClient *)v3);
  MEMORY[0x1E4E43B10](v4);
}

+ (void)emptyCache
{
}

+ (void)setCacheDisabled:(BOOL)a3
{
}

+ (void)startIgnoringWebCoreNodeLeaks
{
}

+ (void)stopIgnoringWebCoreNodeLeaks
{
}

+ (id)memoryStatistics
{
  v18[7] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v2 = (WebCore *)WTF::fastMallocStatistics(&v14, (WTF *)a1);
  BOOL v3 = (uint64_t *)MEMORY[0x1E4FB64D8];
  if (!*MEMORY[0x1E4FB64D8]) {
    WebCore::commonVMSlow(v2);
  }
  MEMORY[0x1E4E43B00](v13);
  uint64_t v4 = *v3;
  if (!*v3) {
    uint64_t v4 = WebCore::commonVMSlow(0);
  }
  uint64_t v5 = JSC::Heap::size((JSC::Heap *)(v4 + 192));
  uint64_t v6 = *v3;
  if (!*v3) {
    uint64_t v6 = WebCore::commonVMSlow(0);
  }
  v7 = (JSC *)JSC::Heap::capacity((JSC::Heap *)(v6 + 192));
  uint64_t v8 = JSC::globalMemoryStatistics(v7);
  uint64_t v10 = v9;
  v17[0] = @"FastMallocReservedVMBytes";
  v18[0] = [NSNumber numberWithUnsignedLong:v14];
  v17[1] = @"FastMallocCommittedVMBytes";
  v18[1] = [NSNumber numberWithUnsignedLong:v15];
  v17[2] = @"FastMallocFreeListBytes";
  v18[2] = [NSNumber numberWithUnsignedLong:v16];
  v17[3] = @"JavaScriptHeapSize";
  v18[3] = [NSNumber numberWithUnsignedLong:v5];
  v17[4] = @"JavaScriptFreeSize";
  v18[4] = [NSNumber numberWithUnsignedLong:(char *)v7 - v5];
  v17[5] = @"JavaScriptStackSize";
  v18[5] = [NSNumber numberWithUnsignedLong:v8];
  v17[6] = @"JavaScriptJITSize";
  v18[6] = [NSNumber numberWithUnsignedLong:v10];
  v11 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:7];
  MEMORY[0x1E4E43B10](v13);
  return v11;
}

+ (int)cachedPageCount
{
  uint64_t v2 = (void *)WebCore::BackForwardCache::singleton((WebCore::BackForwardCache *)a1);
  if (*v2) {
    return *(_DWORD *)(*v2 - 12);
  }
  else {
    return 0;
  }
}

+ (int)cachedFrameCount
{
  uint64_t v2 = WebCore::BackForwardCache::singleton((WebCore::BackForwardCache *)a1);
  return MEMORY[0x1F4174DF8](v2);
}

+ (int)autoreleasedPageCount
{
  return 0;
}

+ (unint64_t)javaScriptNoGCAllowedObjectsCount
{
  return 0;
}

+ (unint64_t)javaScriptReferencedObjectsCount
{
  uint64_t v2 = (uint64_t *)MEMORY[0x1E4FB64D8];
  if (*MEMORY[0x1E4FB64D8])
  {
    MEMORY[0x1E4E43B00](v7);
    uint64_t v3 = *v2;
    if (!*v2) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1E4E43B00](v7, v4);
    uint64_t v3 = *v2;
    if (!*v2) {
LABEL_5:
    }
      uint64_t v3 = WebCore::commonVMSlow((WebCore *)v3);
  }
  unint64_t v5 = JSC::Heap::protectedObjectCount((JSC::Heap *)(v3 + 192));
  MEMORY[0x1E4E43B10](v7);
  return v5;
}

@end