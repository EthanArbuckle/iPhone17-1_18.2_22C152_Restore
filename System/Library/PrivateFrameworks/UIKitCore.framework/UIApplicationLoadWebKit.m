@interface UIApplicationLoadWebKit
@end

@implementation UIApplicationLoadWebKit

void ___UIApplicationLoadWebKit_block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB25B920)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __WebKitLegacyLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5302F30;
    uint64_t v6 = 0;
    qword_1EB25B920 = _sl_dlopen();
  }
  v0 = (void *)qword_1EB25B920;
  if (!qword_1EB25B920)
  {
    v0 = [MEMORY[0x1E4F28B00] currentHandler];
    v3 = [NSString stringWithUTF8String:"void *WebKitLegacyLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"UIApplication.m", 5516, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  WebKitFramework = (uint64_t)v0;
  off_1EB25B710 = (uint64_t (*)(void))dlsym(v0, "WebKitInitialize");
  off_1EB25B718 = (uint64_t (*)(void, void))dlsym((void *)WebKitFramework, "WebKitSetBackgroundAndForegroundNotificationNames");
  off_1EB25B720 = (uint64_t (*)(void))dlsym((void *)WebKitFramework, "WebKitSetInvalidWebBackgroundTaskIdentifier");
  off_1EB25B728 = (uint64_t (*)(void))dlsym((void *)WebKitFramework, "WebKitSetStartBackgroundTaskBlock");
  off_1EB25B730 = (uint64_t (*)(void))dlsym((void *)WebKitFramework, "WebKitSetEndBackgroundTaskBlock");
  off_1EB25B710();
  off_1EB25B718(@"UIApplicationDidEnterBackgroundNotification", @"UIApplicationWillEnterForegroundNotification");
  off_1EB25B720(0);
  off_1EB25B728(&__block_literal_global_1504);
  off_1EB25B730(&__block_literal_global_1507_0);
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"UIApplicationLoadedWebKit" object:0];
}

uint64_t ___UIApplicationLoadWebKit_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [(id)UIApp _beginBackgroundTaskWithExpirationHandler:a2];
}

uint64_t ___UIApplicationLoadWebKit_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [(id)UIApp _endBackgroundTask:a2];
}

@end