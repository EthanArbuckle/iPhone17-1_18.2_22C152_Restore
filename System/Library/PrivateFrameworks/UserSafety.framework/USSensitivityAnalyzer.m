@interface USSensitivityAnalyzer
+ (BOOL)_isAnalysisEnabled:(id)a3;
+ (BOOL)_isCommunicationSafetyEnabled:(id)a3;
+ (BOOL)_isNudityDetectionEnabled:(id)a3;
+ (BOOL)_isNudityDetectionEnabledForAnyOfServices:(id)a3 scanningPolicy:(id)a4;
+ (BOOL)_isNudityDetectionEnabledForApplication:(id)a3 scanningPolicy:(id)a4;
+ (BOOL)_isNudityDetectionEnabledForService:(id)a3 scanningPolicy:(id)a4;
+ (BOOL)isAnalysisEnabled;
+ (BOOL)isCommunicationSafetyEnabled;
+ (BOOL)isNudityDetectionEnabled;
+ (BOOL)isNudityDetectionEnabledForAnyOfServices:(id)a3;
+ (BOOL)isNudityDetectionEnabledForService:(id)a3;
+ (Class)entitlementsReaderClass;
+ (Class)settingsReaderClass;
+ (id)subscribeForAnalysisEnabledChanges:(id)a3;
- (SCMediaAnalysisService)madService;
- (USSensitivityAnalyzer)init;
- (USSensitivityAnalyzer)initWithQueue:(id)a3;
- (USSensitivityAnalyzer)initWithQueue:(id)a3 madService:(id)a4;
- (void)analyzeCGImage:(CGImage *)a3 withOrientation:(unsigned int)a4 completionHandler:(id)a5;
- (void)analyzeImageFile:(id)a3 completionHandler:(id)a4;
- (void)analyzeImageWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 completionHandler:(id)a5;
- (void)analyzeVideoFile:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)analyzeVideoFile:(id)a3 useBlastdoor:(BOOL)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)analyzeVideoWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)setMadService:(id)a3;
@end

@implementation USSensitivityAnalyzer

+ (id)subscribeForAnalysisEnabledChanges:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F17680];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__USSensitivityAnalyzer_subscribeForAnalysisEnabledChanges___block_invoke;
  v9[3] = &unk_26556E230;
  id v10 = v3;
  id v5 = v3;
  v6 = [v4 subscribeForAnalysisAvailabilityChanges:v9];
  v7 = [[USAnalysisEnablementSubscription alloc] initWithObserver:v6];

  return v7;
}

+ (BOOL)isCommunicationSafetyEnabled
{
  id v2 = a1;
  id v3 = objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  LOBYTE(v2) = [v2 _isCommunicationSafetyEnabled:v3];

  return (char)v2;
}

+ (BOOL)isNudityDetectionEnabled
{
  id v2 = a1;
  id v3 = objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  LOBYTE(v2) = [v2 _isNudityDetectionEnabled:v3];

  return (char)v2;
}

+ (Class)settingsReaderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_isNudityDetectionEnabled:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_msgSend(a1, "entitlementsReaderClass"), "readCurrentServices");
  if (v5)
  {
    char v6 = [a1 _isNudityDetectionEnabledForAnyOfServices:v5 scanningPolicy:v4];
  }
  else
  {
    v7 = objc_msgSend((id)objc_msgSend(a1, "entitlementsReaderClass"), "readCurrentBundleIdentifier");
    char v6 = [a1 _isNudityDetectionEnabledForApplication:v7 scanningPolicy:v4];
  }
  return v6;
}

+ (Class)entitlementsReaderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_isNudityDetectionEnabledForAnyOfServices:(id)a3 scanningPolicy:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(a1, "_isNudityDetectionEnabledForService:scanningPolicy:", *(void *)(*((void *)&v15 + 1) + 8 * i), v7, (void)v15))
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

+ (BOOL)_isNudityDetectionEnabledForService:(id)a3 scanningPolicy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 policy] == 1)
  {
    id v7 = [v6 services];
    char v8 = [v7 containsObject:v5];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)_isCommunicationSafetyEnabled:(id)a3
{
  return [a3 policy] == 2;
}

- (USSensitivityAnalyzer)init
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.UserSafety.USSensitivityAnalyzer", 0);
  id v4 = [(USSensitivityAnalyzer *)self initWithQueue:v3];

  return v4;
}

- (USSensitivityAnalyzer)initWithQueue:(id)a3
{
  return [(USSensitivityAnalyzer *)self initWithQueue:a3 madService:0];
}

- (USSensitivityAnalyzer)initWithQueue:(id)a3 madService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)USSensitivityAnalyzer;
  uint64_t v9 = [(USSensitivityAnalyzer *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_madService, a4);
      uint64_t v11 = [objc_alloc(MEMORY[0x263F17680]) initWithQueue:v7 madService:v8];
    }
    else
    {
      uint64_t v12 = objc_opt_new();
      madService = v10->_madService;
      v10->_madService = (SCMediaAnalysisService *)v12;

      uint64_t v11 = [objc_alloc(MEMORY[0x263F17680]) initWithQueue:v7];
    }
    scsAnalyzer = v10->_scsAnalyzer;
    v10->_scsAnalyzer = (SCSensitivityAnalyzer *)v11;
  }
  return v10;
}

- (void)analyzeImageFile:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  scsAnalyzer = self->_scsAnalyzer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__USSensitivityAnalyzer_analyzeImageFile_completionHandler___block_invoke;
  v9[3] = &unk_26556E1E0;
  id v10 = v6;
  id v8 = v6;
  [(SCSensitivityAnalyzer *)scsAnalyzer analyzeImageFile:a3 completionHandler:v9];
}

void __60__USSensitivityAnalyzer_analyzeImageFile_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, [a2 isSensitive], v5);
  }
}

- (void)analyzeCGImage:(CGImage *)a3 withOrientation:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  scsAnalyzer = self->_scsAnalyzer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__USSensitivityAnalyzer_analyzeCGImage_withOrientation_completionHandler___block_invoke;
  v11[3] = &unk_26556E1E0;
  id v12 = v8;
  id v10 = v8;
  [(SCSensitivityAnalyzer *)scsAnalyzer analyzeCGImage:a3 orientation:v5 completionHandler:v11];
}

void __74__USSensitivityAnalyzer_analyzeCGImage_withOrientation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, [a2 isSensitive], v5);
  }
}

- (void)analyzeVideoFile:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  scsAnalyzer = self->_scsAnalyzer;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __76__USSensitivityAnalyzer_analyzeVideoFile_progressHandler_completionHandler___block_invoke;
  v17[3] = &unk_26556E208;
  id v18 = v8;
  id v19 = v9;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__USSensitivityAnalyzer_analyzeVideoFile_progressHandler_completionHandler___block_invoke_2;
  v15[3] = &unk_26556E1E0;
  id v16 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [(SCSensitivityAnalyzer *)scsAnalyzer analyzeVideoFile:v13 progressHandler:v17 completionHandler:v15];
}

uint64_t __76__USSensitivityAnalyzer_analyzeVideoFile_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __76__USSensitivityAnalyzer_analyzeVideoFile_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, [a2 isSensitive], v5);
  }
}

- (void)analyzeVideoFile:(id)a3 useBlastdoor:(BOOL)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  scsAnalyzer = self->_scsAnalyzer;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __89__USSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke;
  v19[3] = &unk_26556E208;
  id v20 = v10;
  id v21 = v11;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__USSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_2;
  v17[3] = &unk_26556E1E0;
  id v18 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  [(SCSensitivityAnalyzer *)scsAnalyzer analyzeVideoFile:v15 useBlastdoor:v8 progressHandler:v19 completionHandler:v17];
}

uint64_t __89__USSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __89__USSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, [a2 isSensitive], v5);
  }
}

- (void)analyzeImageWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  scsAnalyzer = self->_scsAnalyzer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __99__USSensitivityAnalyzer_analyzeImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke;
  v11[3] = &unk_26556E1E0;
  id v12 = v8;
  id v10 = v8;
  [(SCSensitivityAnalyzer *)scsAnalyzer analyzeImageWithLocalIdentifier:a3 fromPhotoLibraryWithURL:a4 completionHandler:v11];
}

void __99__USSensitivityAnalyzer_analyzeImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, [a2 isSensitive], v5);
  }
}

- (void)analyzeVideoWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  scsAnalyzer = self->_scsAnalyzer;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __115__USSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke;
  v19[3] = &unk_26556E208;
  id v20 = v10;
  id v21 = v11;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __115__USSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2;
  v17[3] = &unk_26556E1E0;
  id v18 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  [(SCSensitivityAnalyzer *)scsAnalyzer analyzeVideoWithLocalIdentifier:v15 fromPhotoLibraryWithURL:a4 progressHandler:v19 completionHandler:v17];
}

uint64_t __115__USSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __115__USSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, [a2 isSensitive], v5);
  }
}

+ (BOOL)isAnalysisEnabled
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  LOBYTE(v2) = [v2 _isAnalysisEnabled:v3];

  return (char)v2;
}

+ (BOOL)isNudityDetectionEnabledForService:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  LOBYTE(a1) = [a1 _isNudityDetectionEnabledForService:v4 scanningPolicy:v5];

  return (char)a1;
}

+ (BOOL)isNudityDetectionEnabledForAnyOfServices:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  LOBYTE(a1) = [a1 _isNudityDetectionEnabledForAnyOfServices:v4 scanningPolicy:v5];

  return (char)a1;
}

uint64_t __60__USSensitivityAnalyzer_subscribeForAnalysisEnabledChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, BOOL))(result + 16))(result, a2 == 2, a2 == 1);
  }
  return result;
}

+ (BOOL)_isAnalysisEnabled:(id)a3
{
  id v4 = a3;
  if ([a1 _isCommunicationSafetyEnabled:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [a1 _isNudityDetectionEnabled:v4];
  }

  return v5;
}

+ (BOOL)_isNudityDetectionEnabledForApplication:(id)a3 scanningPolicy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 policy] == 1)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F53EB8]) initWithBundleIdentifier:v5];
    id v8 = [v6 applications];
    char v9 = [v8 containsObject:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (SCMediaAnalysisService)madService
{
  return self->_madService;
}

- (void)setMadService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madService, 0);
  objc_storeStrong((id *)&self->_scsAnalyzer, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end