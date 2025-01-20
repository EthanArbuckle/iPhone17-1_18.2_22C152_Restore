@interface TSUFileProviderUtilities
+ (void)bookmarkableStringFromDocumentURL:(id)a3 completion:(id)a4;
+ (void)didUpdateAlternateContentsDocumentForDocumentAtURL:(id)a3 completion:(id)a4;
+ (void)fetchAlternateContentsURLForDocumentURL:(id)a3 completion:(id)a4;
+ (void)initialize;
+ (void)setAlternateContentsURL:(id)a3 onDocumentURL:(id)a4 completion:(id)a5;
- (TSUFileProviderUtilities)init;
@end

@implementation TSUFileProviderUtilities

- (TSUFileProviderUtilities)init
{
  v2 = [NSString stringWithUTF8String:"-[TSUFileProviderUtilities init]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileProviderUtilities.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v2 file:v3 lineNumber:22 isFatal:0 description:"Do not call method"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUFileProviderUtilities init]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (void)initialize
{
  if (initialize_once != -1) {
    dispatch_once(&initialize_once, &__block_literal_global_22);
  }
}

void *__38__TSUFileProviderUtilities_initialize__block_invoke()
{
  v1 = 0;
  _FPSetAlternateContentsURLOnDocumentURL = TSUSoftLinkingGetFrameworkFunction(0, @"FileProvider", "FPSetAlternateContentsURLOnDocumentURL", &v1);
  _FPFetchAlternateContentsURLForDocumentURL = TSUSoftLinkingGetFrameworkFunction(0, @"FileProvider", "FPFetchAlternateContentsURLForDocumentURL", &v1);
  _FPDidUpdateAlternateContentsDocumentForDocumentAtURL = TSUSoftLinkingGetFrameworkFunction(0, @"FileProvider", "FPDidUpdateAlternateContentsDocumentForDocumentAtURL", &v1);
  result = TSUSoftLinkingGetFrameworkFunction(0, @"FileProvider", "FPBookmarkableStringFromDocumentURL", &v1);
  _FPBookmarkableStringFromDocumentURL = result;
  return result;
}

+ (void)setAlternateContentsURL:(id)a3 onDocumentURL:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void (**)(void, void))v9;
  v11 = (void (*)(id, id, void *))_FPSetAlternateContentsURLOnDocumentURL;
  if (_FPSetAlternateContentsURLOnDocumentURL)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __77__TSUFileProviderUtilities_setAlternateContentsURL_onDocumentURL_completion___block_invoke;
    v13[3] = &unk_264D61608;
    id v14 = v9;
    v11(v8, v7, v13);
  }
  else if (v9)
  {
    v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
    ((void (**)(void, void *))v10)[2](v10, v12);
  }
}

uint64_t __77__TSUFileProviderUtilities_setAlternateContentsURL_onDocumentURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)fetchAlternateContentsURLForDocumentURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void, void))v6;
  id v8 = (void (*)(id, void *))_FPFetchAlternateContentsURLForDocumentURL;
  if (_FPFetchAlternateContentsURLForDocumentURL)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __79__TSUFileProviderUtilities_fetchAlternateContentsURLForDocumentURL_completion___block_invoke;
    v10[3] = &unk_264D61630;
    id v11 = v6;
    v8(v5, v10);
  }
  else if (v6)
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
    ((void (**)(void, void, void *))v7)[2](v7, 0, v9);
  }
}

uint64_t __79__TSUFileProviderUtilities_fetchAlternateContentsURLForDocumentURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)didUpdateAlternateContentsDocumentForDocumentAtURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  id v8 = (void (*)(id, void *))_FPDidUpdateAlternateContentsDocumentForDocumentAtURL;
  if (_FPDidUpdateAlternateContentsDocumentForDocumentAtURL)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __90__TSUFileProviderUtilities_didUpdateAlternateContentsDocumentForDocumentAtURL_completion___block_invoke;
    v10[3] = &unk_264D61608;
    id v11 = v6;
    v8(v5, v10);
  }
  else if (v6)
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
    ((void (**)(void, void *))v7)[2](v7, v9);
  }
}

uint64_t __90__TSUFileProviderUtilities_didUpdateAlternateContentsDocumentForDocumentAtURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)bookmarkableStringFromDocumentURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void, void))v6;
  id v8 = (void (*)(id, void *))_FPBookmarkableStringFromDocumentURL;
  if (_FPBookmarkableStringFromDocumentURL)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __73__TSUFileProviderUtilities_bookmarkableStringFromDocumentURL_completion___block_invoke;
    v10[3] = &unk_264D61658;
    id v11 = v6;
    v8(v5, v10);
  }
  else if (v6)
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
    ((void (**)(void, void, void *))v7)[2](v7, 0, v9);
  }
}

uint64_t __73__TSUFileProviderUtilities_bookmarkableStringFromDocumentURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end