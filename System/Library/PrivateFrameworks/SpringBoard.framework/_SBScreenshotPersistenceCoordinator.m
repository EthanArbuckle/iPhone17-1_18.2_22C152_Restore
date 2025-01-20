@interface _SBScreenshotPersistenceCoordinator
- (BOOL)_isWritingSnapshot;
- (void)_decrementWriteCount;
- (void)_incrementWriteCount;
- (void)saveScreenshot:(id)a3 withCompletion:(id)a4;
@end

@implementation _SBScreenshotPersistenceCoordinator

- (void)saveScreenshot:(id)a3 withCompletion:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if (!v14)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_SBScreenshotPersistenceCoordinator.m", 63, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];
  }
  [(_SBScreenshotPersistenceCoordinator *)self _incrementWriteCount];
  v8 = __PhotoLibrarySaveImageFunction_saveImageFunction;
  if (__PhotoLibrarySaveImageFunction_saveImageFunction) {
    goto LABEL_7;
  }
  v9 = (void *)__PhotoLibraryHandle_photoLibraryHandle;
  if (__PhotoLibraryHandle_photoLibraryHandle) {
    goto LABEL_6;
  }
  v10 = MEMORY[0x1D948B3A0]();
  v11 = [v10 stringByAppendingPathComponent:@"System/Library/PrivateFrameworks/PhotoLibrary.framework/PhotoLibrary"];

  id v12 = v11;
  __PhotoLibraryHandle_photoLibraryHandle = (uint64_t)dlopen((const char *)[v12 fileSystemRepresentation], 1);

  v9 = (void *)__PhotoLibraryHandle_photoLibraryHandle;
  if (__PhotoLibraryHandle_photoLibraryHandle)
  {
LABEL_6:
    v8 = dlsym(v9, "PLSaveImageToCameraRollWithTypeAndExtension");
    __PhotoLibrarySaveImageFunction_saveImageFunction = v8;
LABEL_7:
    ((void (*)(id, __CFString *, __CFString *, _SBScreenshotPersistenceCoordinator *, char *, void))v8)(v14, @"public.png", @"PNG", self, sel__finishedWritingScreenshot_didFinishSavingWithError_context_, 0);
    goto LABEL_8;
  }
  ((void (*)(id, __CFString *, __CFString *, _SBScreenshotPersistenceCoordinator *, char *, void))__PhotoLibrarySaveImageFunction_saveImageFunction)(v14, @"public.png", @"PNG", self, sel__finishedWritingScreenshot_didFinishSavingWithError_context_, 0);
LABEL_8:
}

- (BOOL)_isWritingSnapshot
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_screenshotWriteCount != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)_incrementWriteCount
{
  obj = self;
  objc_sync_enter(obj);
  ++obj->_screenshotWriteCount;
  objc_sync_exit(obj);
}

- (void)_decrementWriteCount
{
  obj = self;
  objc_sync_enter(obj);
  unint64_t screenshotWriteCount = obj->_screenshotWriteCount;
  if (screenshotWriteCount) {
    obj->_unint64_t screenshotWriteCount = screenshotWriteCount - 1;
  }
  objc_sync_exit(obj);
}

@end