@interface PFVideoSharingOperation
+ (id)operationErrorWithCode:(int64_t)a3 underlyingError:(id)a4 withDescription:(id)a5;
- (BOOL)_ensureVideoProperties;
- (BOOL)_runExport;
- (BOOL)shouldStripAccessibilityDescription;
- (BOOL)shouldStripCaption;
- (BOOL)shouldStripLocation;
- (BOOL)shouldStripMetadata;
- (BOOL)success;
- (CLLocation)customLocation;
- (NSDate)customDate;
- (NSError)operationError;
- (NSString)customAccessibilityLabel;
- (NSString)customCaption;
- (NSString)exportFileType;
- (NSString)exportPreset;
- (NSString)outputFilename;
- (NSURL)outputDirectoryURL;
- (NSURL)resultingFileURL;
- (NSURL)videoURL;
- (PFAssetAdjustments)_adjustments;
- (PFVideoSharingOperation)initWithVideoURL:(id)a3 adjustmentData:(id)a4;
- (float)progress;
- (void)_setAdjustments:(id)a3;
- (void)_setOperationError:(id)a3;
- (void)_setSuccess:(BOOL)a3;
- (void)_setVideoURL:(id)a3;
- (void)_validateMetadata;
- (void)cancel;
- (void)main;
- (void)setCustomAccessibilityLabel:(id)a3;
- (void)setCustomCaption:(id)a3;
- (void)setCustomDate:(id)a3;
- (void)setCustomLocation:(id)a3;
- (void)setExportFileType:(id)a3;
- (void)setExportPreset:(id)a3;
- (void)setOutputDirectoryURL:(id)a3;
- (void)setOutputFilename:(id)a3;
- (void)setShouldStripAccessibilityDescription:(BOOL)a3;
- (void)setShouldStripCaption:(BOOL)a3;
- (void)setShouldStripLocation:(BOOL)a3;
- (void)setShouldStripMetadata:(BOOL)a3;
@end

@implementation PFVideoSharingOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__adjustments, 0);
  objc_storeStrong((id *)&self->_resultingFileURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_exportFileType, 0);
  objc_storeStrong((id *)&self->_exportPreset, 0);
  objc_storeStrong((id *)&self->_customAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_customCaption, 0);
  objc_storeStrong((id *)&self->_customDate, 0);
  objc_storeStrong((id *)&self->_customLocation, 0);
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong((id *)&self->_outputDirectoryURL, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_exportSession, 0);
  objc_storeStrong((id *)&self->_externalIsolation, 0);
  objc_storeStrong((id *)&self->_videoMetadata, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_audioMix, 0);

  objc_storeStrong((id *)&self->_videoAsset, 0);
}

- (void)_setAdjustments:(id)a3
{
}

- (PFAssetAdjustments)_adjustments
{
  return self->__adjustments;
}

- (NSURL)resultingFileURL
{
  return self->_resultingFileURL;
}

- (void)_setVideoURL:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (NSString)exportFileType
{
  return self->_exportFileType;
}

- (NSString)exportPreset
{
  return self->_exportPreset;
}

- (NSString)customAccessibilityLabel
{
  return self->_customAccessibilityLabel;
}

- (BOOL)shouldStripAccessibilityDescription
{
  return self->_shouldStripAccessibilityDescription;
}

- (NSString)customCaption
{
  return self->_customCaption;
}

- (BOOL)shouldStripCaption
{
  return self->_shouldStripCaption;
}

- (void)setCustomDate:(id)a3
{
}

- (NSDate)customDate
{
  return self->_customDate;
}

- (CLLocation)customLocation
{
  return self->_customLocation;
}

- (BOOL)shouldStripLocation
{
  return self->_shouldStripLocation;
}

- (BOOL)shouldStripMetadata
{
  return self->_shouldStripMetadata;
}

- (NSString)outputFilename
{
  return self->_outputFilename;
}

- (NSURL)outputDirectoryURL
{
  return self->_outputDirectoryURL;
}

- (NSError)operationError
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12790;
  v10 = __Block_byref_object_dispose__12791;
  id v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PFVideoSharingOperation_operationError__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __41__PFVideoSharingOperation_operationError__block_invoke(uint64_t a1)
{
}

- (void)_setOperationError:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PFVideoSharingOperation__setOperationError___block_invoke;
  v7[3] = &unk_1E5B2F668;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

void __46__PFVideoSharingOperation__setOperationError___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  v2 = (id *)(*(void *)(a1 + 40) + 304);
  if (v1 != *v2) {
    objc_storeStrong(v2, v1);
  }
}

- (BOOL)success
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PFVideoSharingOperation_success__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__PFVideoSharingOperation_success__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 297);
  return result;
}

- (void)_setSuccess:(BOOL)a3
{
  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__PFVideoSharingOperation__setSuccess___block_invoke;
  v4[3] = &unk_1E5B2F640;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(externalIsolation, v4);
}

uint64_t __39__PFVideoSharingOperation__setSuccess___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 297)) {
    *(unsigned char *)(v2 + 297) = v1;
  }
  return result;
}

- (void)setExportFileType:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PFVideoSharingOperation_setExportFileType___block_invoke;
  v7[3] = &unk_1E5B2F668;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

uint64_t __45__PFVideoSharingOperation_setExportFileType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(*(void *)(a1 + 40) + 376);
  if (v2 != result)
  {
    uint64_t result = objc_msgSend((id)result, "isEqualToString:");
    if ((result & 1) == 0)
    {
      uint64_t v4 = [*(id *)(a1 + 32) copy];
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(v5 + 376);
      *(void *)(v5 + 376) = v4;
      return MEMORY[0x1F41817F8](v4, v6);
    }
  }
  return result;
}

- (void)setExportPreset:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__PFVideoSharingOperation_setExportPreset___block_invoke;
  v7[3] = &unk_1E5B2F668;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

uint64_t __43__PFVideoSharingOperation_setExportPreset___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(*(void *)(a1 + 40) + 368);
  if (v2 != result)
  {
    uint64_t result = objc_msgSend((id)result, "isEqualToString:");
    if ((result & 1) == 0)
    {
      uint64_t v4 = [*(id *)(a1 + 32) copy];
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(v5 + 368);
      *(void *)(v5 + 368) = v4;
      return MEMORY[0x1F41817F8](v4, v6);
    }
  }
  return result;
}

- (void)setOutputDirectoryURL:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PFVideoSharingOperation_setOutputDirectoryURL___block_invoke;
  v7[3] = &unk_1E5B2F668;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

uint64_t __49__PFVideoSharingOperation_setOutputDirectoryURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(*(void *)(a1 + 40) + 320);
  if (v2 != result)
  {
    uint64_t result = objc_msgSend((id)result, "isEqual:");
    if ((result & 1) == 0)
    {
      uint64_t v4 = [*(id *)(a1 + 32) copy];
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(v5 + 320);
      *(void *)(v5 + 320) = v4;
      return MEMORY[0x1F41817F8](v4, v6);
    }
  }
  return result;
}

- (void)setOutputFilename:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PFVideoSharingOperation_setOutputFilename___block_invoke;
  v7[3] = &unk_1E5B2F668;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

uint64_t __45__PFVideoSharingOperation_setOutputFilename___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(*(void *)(a1 + 40) + 328);
  if (v2 != result)
  {
    uint64_t result = objc_msgSend((id)result, "isEqualToString:");
    if ((result & 1) == 0)
    {
      uint64_t v4 = [*(id *)(a1 + 32) copy];
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(v5 + 328);
      *(void *)(v5 + 328) = v4;
      return MEMORY[0x1F41817F8](v4, v6);
    }
  }
  return result;
}

- (void)setCustomAccessibilityLabel:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PFVideoSharingOperation_setCustomAccessibilityLabel___block_invoke;
  v7[3] = &unk_1E5B2F668;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

uint64_t __55__PFVideoSharingOperation_setCustomAccessibilityLabel___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 360) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 40) copy];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 360);
    *(void *)(v4 + 360) = v3;
    return MEMORY[0x1F41817F8](v3, v5);
  }
  return result;
}

- (void)setShouldStripAccessibilityDescription:(BOOL)a3
{
  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PFVideoSharingOperation_setShouldStripAccessibilityDescription___block_invoke;
  v4[3] = &unk_1E5B2F640;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(externalIsolation, v4);
}

uint64_t __66__PFVideoSharingOperation_setShouldStripAccessibilityDescription___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 315) != v2) {
    *(unsigned char *)(v1 + 315) = v2;
  }
  return result;
}

- (void)setCustomCaption:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PFVideoSharingOperation_setCustomCaption___block_invoke;
  v7[3] = &unk_1E5B2F668;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

uint64_t __44__PFVideoSharingOperation_setCustomCaption___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 352) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 40) copy];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 352);
    *(void *)(v4 + 352) = v3;
    return MEMORY[0x1F41817F8](v3, v5);
  }
  return result;
}

- (void)setShouldStripCaption:(BOOL)a3
{
  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PFVideoSharingOperation_setShouldStripCaption___block_invoke;
  v4[3] = &unk_1E5B2F640;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(externalIsolation, v4);
}

uint64_t __49__PFVideoSharingOperation_setShouldStripCaption___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 314) != v2) {
    *(unsigned char *)(v1 + 314) = v2;
  }
  return result;
}

- (void)setCustomLocation:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PFVideoSharingOperation_setCustomLocation___block_invoke;
  v7[3] = &unk_1E5B2F668;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

uint64_t __45__PFVideoSharingOperation_setCustomLocation___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 336) isEqual:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 40) copy];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 336);
    *(void *)(v4 + 336) = v3;
    return MEMORY[0x1F41817F8](v3, v5);
  }
  return result;
}

- (void)setShouldStripLocation:(BOOL)a3
{
  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PFVideoSharingOperation_setShouldStripLocation___block_invoke;
  v4[3] = &unk_1E5B2F640;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(externalIsolation, v4);
}

uint64_t __50__PFVideoSharingOperation_setShouldStripLocation___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 313)) {
    *(unsigned char *)(v2 + 313) = v1;
  }
  return result;
}

- (void)setShouldStripMetadata:(BOOL)a3
{
  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PFVideoSharingOperation_setShouldStripMetadata___block_invoke;
  v4[3] = &unk_1E5B2F640;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(externalIsolation, v4);
}

uint64_t __50__PFVideoSharingOperation_setShouldStripMetadata___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 312)) {
    *(unsigned char *)(v2 + 312) = v1;
  }
  return result;
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)PFVideoSharingOperation;
  [(PFVideoSharingOperation *)&v5 cancel];
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PFVideoSharingOperation_cancel__block_invoke;
  block[3] = &unk_1E5B2F5F0;
  block[4] = self;
  dispatch_sync(externalIsolation, block);
}

uint64_t __33__PFVideoSharingOperation_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 288) cancelExport];
}

- (float)progress
{
  uint64_t v6 = 0;
  v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PFVideoSharingOperation_progress__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__35__PFVideoSharingOperation_progress__block_invoke(void *result)
{
  int v1 = result;
  uint64_t v2 = result[4];
  if (*(unsigned char *)(v2 + 296))
  {
    uint64_t result = *(void **)(v2 + 288);
    if (result) {
      uint64_t result = (void *)[result progress];
    }
    else {
      float v3 = 1.0;
    }
  }
  else
  {
    float v3 = 0.0;
  }
  *(float *)(*(void *)(v1[5] + 8) + 24) = v3;
  return result;
}

- (BOOL)_runExport
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  v51 = [(PFVideoSharingOperation *)self videoURL];
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__12790;
  v105 = __Block_byref_object_dispose__12791;
  id v106 = 0;
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__12790;
  v99 = __Block_byref_object_dispose__12791;
  id v100 = 0;
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__12790;
  v93 = __Block_byref_object_dispose__12791;
  id v94 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__12790;
  v87 = __Block_byref_object_dispose__12791;
  id v88 = 0;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PFVideoSharingOperation__runExport__block_invoke;
  block[3] = &unk_1E5B2F578;
  block[4] = self;
  void block[5] = &v101;
  block[6] = &v95;
  block[7] = &v89;
  block[8] = &v83;
  dispatch_sync(externalIsolation, block);
  v50 = [v51 pathExtension];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithFilenameExtension:");
  objc_super v5 = [v4 identifier];

  id v6 = v5;
  v7 = [(PFVideoSharingOperation *)self _adjustments];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  v10 = [[PFVideoAVObjectBuilder alloc] initWithVideoAsset:self->_videoAsset videoAdjustments:v9];
  v48 = v9;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__12790;
  v80 = __Block_byref_object_dispose__12791;
  id v81 = 0;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__12790;
  v74 = __Block_byref_object_dispose__12791;
  id v75 = 0;
  id v11 = (void *)v90[5];
  uint64_t v12 = *MEMORY[0x1E4F15758];
  if (!v11) {
    id v11 = (void *)*MEMORY[0x1E4F15758];
  }
  id v13 = v11;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __37__PFVideoSharingOperation__runExport__block_invoke_2;
  v69[3] = &unk_1E5B2F5A0;
  v69[4] = &v76;
  v69[5] = &v70;
  v49 = v10;
  [(PFVideoAVObjectBuilder *)v10 requestExportSessionWithExportPreset:v13 resultHandler:v69];
  if (v71[5])
  {
    id v14 = [(id)objc_opt_class() operationErrorWithCode:4, v71[5], @"AVAssetExportSession could not create session for video asset: %@ with preset %@", self->_videoAsset, v13 underlyingError withDescription];
  }
  else
  {
    id v14 = 0;
  }
  v15 = v77;
  if (v77[5])
  {
    *(void *)&long long v113 = 0;
    *((void *)&v113 + 1) = &v113;
    uint64_t v114 = 0x3032000000;
    v115 = __Block_byref_object_copy__12790;
    v116 = __Block_byref_object_dispose__12791;
    v16 = (void *)v84[5];
    if (!v16) {
      v16 = v6;
    }
    id v17 = v16;
    id v117 = v17;
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__12790;
    v67 = __Block_byref_object_dispose__12791;
    id v18 = v50;
    id v68 = v18;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v108 = v17;
      __int16 v109 = 2114;
      id v110 = v18;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Preferred outputFileType is %{public}@, file extension: %{public}@", buf, 0x16u);
      v15 = v77;
    }
    v19 = [(id)v15[5] supportedFileTypes];
    int v20 = [v19 containsObject:*(void *)(*((void *)&v113 + 1) + 40)];

    if (([v13 isEqualToString:v12] & v20 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        v21 = *(void **)(*((void *)&v113 + 1) + 40);
        v22 = @"Incompatible";
        if (v20) {
          v22 = @"Compatible";
        }
        *(_DWORD *)buf = 138543874;
        id v108 = v13;
        __int16 v109 = 2114;
        id v110 = v21;
        __int16 v111 = 2114;
        v112 = v22;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Preset is either not passthrough (%{public}@), or outputFileType (%{public}@) is unsupported (%{public}@), so determining compatible file types...", buf, 0x20u);
      }
      dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
      v24 = (void *)v77[5];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __37__PFVideoSharingOperation__runExport__block_invoke_31;
      v59[3] = &unk_1E5B2F5C8;
      v61 = &v113;
      v62 = &v63;
      v25 = v23;
      v60 = v25;
      [v24 determineCompatibleFileTypesWithCompletionHandler:v59];
      dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    }
    v26 = [(id)v96[5] URLByAppendingPathComponent:v102[5]];
    v27 = [v26 URLByAppendingPathExtension:v64[5]];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v108 = v27;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Output file URL will be %{public}@.", buf, 0xCu);
    }
    v28 = [MEMORY[0x1E4F28CB8] defaultManager];
    v29 = [v27 path];
    int v30 = [v28 fileExistsAtPath:v29];

    if (v30)
    {
      v31 = MEMORY[0x1E4F14500];
      id v32 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v47 = [v27 path];
        *(_DWORD *)buf = 138543362;
        id v108 = v47;
        _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PFVideoSharingOperation] Output file already exists at path: %{public}@. Aborting video remaking.", buf, 0xCu);
      }
      v33 = objc_opt_class();
      v34 = [v27 path];
      uint64_t v35 = [v33 operationErrorWithCode:3, 0, @"Output file already exists at path: %@", v34 underlyingError withDescription];

      int v36 = 0;
      id v14 = (id)v35;
    }
    else
    {
      [(id)v77[5] setOutputFileType:*(void *)(*((void *)&v113 + 1) + 40)];
      [(id)v77[5] setOutputURL:v27];
      [(id)v77[5] setMetadata:self->_videoMetadata];
      v38 = self->_externalIsolation;
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __37__PFVideoSharingOperation__runExport__block_invoke_37;
      v58[3] = &unk_1E5B2F690;
      v58[4] = self;
      v58[5] = &v76;
      dispatch_sync(v38, v58);
      dispatch_semaphore_t v39 = dispatch_semaphore_create(0);
      v40 = (void *)v77[5];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __37__PFVideoSharingOperation__runExport__block_invoke_2_38;
      v56[3] = &unk_1E5B2F5F0;
      v41 = v39;
      v57 = v41;
      [v40 exportAsynchronouslyWithCompletionHandler:v56];
      dispatch_semaphore_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
      if ([(id)v77[5] status] == 3)
      {
        int v36 = 1;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Operation complete.", buf, 2u);
        }
      }
      else
      {
        v42 = [(id)v77[5] error];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v108 = v42;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PFVideoSharingOperation] Encountered error in export session %@.", buf, 0xCu);
        }
        uint64_t v43 = [(id)objc_opt_class() operationErrorWithCode:5 underlyingError:v42 withDescription:@"Error in export session"];

        int v36 = 0;
        id v14 = (id)v43;
      }
      v44 = self->_externalIsolation;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __37__PFVideoSharingOperation__runExport__block_invoke_42;
      v52[3] = &unk_1E5B2F618;
      v52[4] = self;
      id v14 = v14;
      id v53 = v14;
      char v55 = v36;
      id v54 = v27;
      dispatch_sync(v44, v52);
    }
    _Block_object_dispose(&v63, 8);

    _Block_object_dispose(&v113, 8);
    BOOL v37 = v36 != 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      videoAsset = self->_videoAsset;
      LODWORD(v113) = 138412290;
      *(void *)((char *)&v113 + 4) = videoAsset;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PFVideoSharingOperation] Could not create export session from video asset: %@", (uint8_t *)&v113, 0xCu);
    }
    [(PFVideoSharingOperation *)self _setOperationError:v14];
    BOOL v37 = 0;
  }

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v89, 8);

  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v101, 8);

  return v37;
}

void __37__PFVideoSharingOperation__runExport__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) outputFilename];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) outputDirectoryURL];
  uint64_t v7 = [v6 copy];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = [*(id *)(a1 + 32) exportPreset];
  uint64_t v11 = [v10 copy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  id v17 = [*(id *)(a1 + 32) exportFileType];
  uint64_t v14 = [v17 copy];
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

void __37__PFVideoSharingOperation__runExport__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __37__PFVideoSharingOperation__runExport__block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 containsObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)]) {
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Preferred outputFileType is not among the compatible file types", (uint8_t *)&v19, 2u);
  }
  uint64_t v4 = (void *)*MEMORY[0x1E4F15AA8];
  if ([v3 containsObject:*MEMORY[0x1E4F15AA8]])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      id v5 = MEMORY[0x1E4F14500];
      id v6 = "[PFVideoSharingOperation] Found MP4, choosing that.";
LABEL_10:
      _os_log_impl(&dword_1A41FE000, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v19, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  uint64_t v4 = (void *)*MEMORY[0x1E4F15AB0];
  if ([v3 containsObject:*MEMORY[0x1E4F15AB0]])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      id v5 = MEMORY[0x1E4F14500];
      id v6 = "[PFVideoSharingOperation] Found MOV, choosing that.";
      goto LABEL_10;
    }
LABEL_11:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    goto LABEL_12;
  }
  uint64_t v15 = [v3 firstObject];
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v19 = 138412290;
    uint64_t v20 = v18;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Picking %@, which is the first of the available types.", (uint8_t *)&v19, 0xCu);
  }
LABEL_12:
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
    uint64_t v8 = [v7 preferredFilenameExtension];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) uppercaseString];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __37__PFVideoSharingOperation__runExport__block_invoke_37(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 296) = 1;
}

intptr_t __37__PFVideoSharingOperation__runExport__block_invoke_2_38(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __37__PFVideoSharingOperation__runExport__block_invoke_42(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 288);
  *(void *)(v2 + 288) = 0;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 304), *(id *)(a1 + 40));
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = *(void **)(a1 + 48);
    id v5 = (id *)(*(void *)(a1 + 32) + 392);
    objc_storeStrong(v5, v4);
  }
}

- (void)_validateMetadata
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__12790;
  uint64_t v35 = __Block_byref_object_dispose__12791;
  id v36 = 0;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PFVideoSharingOperation__validateMetadata__block_invoke;
  block[3] = &unk_1E5B2F550;
  block[4] = self;
  void block[5] = &v49;
  block[6] = &v45;
  block[7] = &v41;
  block[8] = &v37;
  void block[9] = &v31;
  dispatch_sync(externalIsolation, block);
  if (*((unsigned char *)v50 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Stripping all metadata", buf, 2u);
    }
    uint64_t v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v5 = [(AVAsset *)self->_videoAsset metadata];
    id v6 = (void *)v5;
    if (*((unsigned char *)v46 + 24) || *((unsigned char *)v42 + 24) || *((unsigned char *)v38 + 24))
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
      if (*((unsigned char *)v46 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Stripping location from metadata", buf, 2u);
        }
        [v7 addObject:*MEMORY[0x1E4F15CB0]];
      }
      if (*((unsigned char *)v42 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Stripping caption from metadata", buf, 2u);
        }
        [v7 addObject:*MEMORY[0x1E4F15CA8]];
      }
      if (*((unsigned char *)v38 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Stripping accessibility description from metadata", buf, 2u);
        }
        [v7 addObject:*MEMORY[0x1E4F15C88]];
      }
      uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v55 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            id v13 = objc_msgSend(v12, "commonKey", (void)v26);
            uint64_t v14 = [v7 member:v13];
            BOOL v15 = v14 == 0;

            if (v15) {
              [(NSArray *)v4 addObject:v12];
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v55 count:16];
        }
        while (v9);
      }
    }
    else
    {
      uint64_t v4 = (NSArray *)v5;
    }
  }
  if (!*((unsigned char *)v38 + 24))
  {
    customAccessibilityLabel = self->_customAccessibilityLabel;
    if (customAccessibilityLabel)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        id v54 = (NSDate *)customAccessibilityLabel;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Applying custom accessibility label to metadata: %{private}@", buf, 0xCu);
        customAccessibilityLabel = self->_customAccessibilityLabel;
      }
      uint64_t v17 = +[PFSharingUtilities addAccessibilityDescription:toAVMetadata:](PFSharingUtilities, "addAccessibilityDescription:toAVMetadata:", customAccessibilityLabel, v4, (void)v26);

      uint64_t v4 = (NSArray *)v17;
    }
  }
  if (!*((unsigned char *)v42 + 24))
  {
    customCaption = self->_customCaption;
    if (customCaption)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v19 = self->_customAccessibilityLabel;
        *(_DWORD *)buf = 138477827;
        id v54 = (NSDate *)v19;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Applying custom caption label to metadata: %{private}@", buf, 0xCu);
        customCaption = self->_customCaption;
      }
      uint64_t v20 = +[PFSharingUtilities addDescription:toAVMetadata:](PFSharingUtilities, "addDescription:toAVMetadata:", customCaption, v4, (void)v26);

      uint64_t v4 = (NSArray *)v20;
    }
  }
  customDate = self->_customDate;
  if (customDate)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v54 = customDate;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Applying custom date to metadata: %{private}@", buf, 0xCu);
      customDate = self->_customDate;
    }
    uint64_t v22 = +[PFSharingUtilities addCustomDate:toAVMetadata:](PFSharingUtilities, "addCustomDate:toAVMetadata:", customDate, v4, (void)v26);

    uint64_t v4 = (NSArray *)v22;
  }
  if (!*((unsigned char *)v46 + 24))
  {
    dispatch_semaphore_t v23 = (NSDate *)v32[5];
    if (v23)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        id v54 = v23;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Applying custom location to metadata: %{private}@", buf, 0xCu);
        dispatch_semaphore_t v23 = (NSDate *)v32[5];
      }
      uint64_t v24 = +[PFSharingUtilities addCustomLocation:toAVMetadata:](PFSharingUtilities, "addCustomLocation:toAVMetadata:", v23, v4, (void)v26);

      uint64_t v4 = (NSArray *)v24;
    }
  }
  videoMetadata = self->_videoMetadata;
  self->_videoMetadata = v4;

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
}

uint64_t __44__PFVideoSharingOperation__validateMetadata__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) shouldStripMetadata];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) shouldStripLocation];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) shouldStripCaption];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) shouldStripAccessibilityDescription];
  uint64_t v2 = [*(id *)(a1 + 32) customLocation];
  uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (BOOL)_ensureVideoProperties
{
  uint64_t v4 = [(PFVideoSharingOperation *)self videoURL];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F166C8];
    uint64_t v2 = [(PFVideoSharingOperation *)self videoURL];
    id v6 = [v5 assetWithURL:v2];
  }
  else
  {
    id v6 = 0;
  }
  objc_storeStrong((id *)&self->_videoAsset, v6);
  if (v4)
  {
  }
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v8 = v7;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__12790;
  v25 = __Block_byref_object_dispose__12791;
  id v26 = 0;
  videoAsset = self->_videoAsset;
  if (!videoAsset) {
    goto LABEL_9;
  }
  char v30 = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__PFVideoSharingOperation__ensureVideoProperties__block_invoke;
  v15[3] = &unk_1E5B2F528;
  id v16 = &unk_1EF7CAE38;
  uint64_t v17 = self;
  int v19 = &v27;
  uint64_t v20 = &v21;
  uint64_t v10 = v7;
  uint64_t v18 = v10;
  [(AVAsset *)videoAsset loadValuesAsynchronouslyForKeys:&unk_1EF7CAE38 completionHandler:v15];
  dispatch_time_t v11 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v10, v11);

  if (*((unsigned char *)v28 + 24))
  {
    BOOL v12 = 1;
  }
  else
  {
LABEL_9:
    id v13 = [(id)objc_opt_class() operationErrorWithCode:2 underlyingError:v22[5] withDescription:@"Unable to ensure video properties."];
    [(PFVideoSharingOperation *)self _setOperationError:v13];

    BOOL v12 = *((unsigned char *)v28 + 24) != 0;
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v12;
}

intptr_t __49__PFVideoSharingOperation__ensureVideoProperties__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        dispatch_semaphore_t v8 = *(void **)(*(void *)(a1 + 40) + 248);
        id v14 = 0;
        uint64_t v9 = [v8 statusOfValueForKey:v7 error:&v14];
        id v10 = v14;
        if (v9 != 2)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
          uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
          BOOL v12 = *(void **)(v11 + 40);
          *(void *)(v11 + 40) = v10;

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)main
{
  if ([(PFVideoSharingOperation *)self _ensureVideoProperties])
  {
    [(PFVideoSharingOperation *)self _validateMetadata];
    BOOL v3 = [(PFVideoSharingOperation *)self _runExport];
  }
  else
  {
    BOOL v3 = 0;
  }

  [(PFVideoSharingOperation *)self _setSuccess:v3];
}

- (PFVideoSharingOperation)initWithVideoURL:(id)a3 adjustmentData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PFVideoSharingOperation;
  dispatch_semaphore_t v8 = [(PFVideoSharingOperation *)&v14 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(PFVideoSharingOperation *)v8 _setVideoURL:v6];
    [(PFVideoSharingOperation *)v9 _setAdjustments:v7];
    id v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PFVideoSharingOperation.isolationQueue", v10);
    externalIsolation = v9->_externalIsolation;
    v9->_externalIsolation = (OS_dispatch_queue *)v11;
  }
  return v9;
}

+ (id)operationErrorWithCode:(int64_t)a3 underlyingError:(id)a4 withDescription:(id)a5
{
  id v7 = a4;
  if (a5)
  {
    dispatch_semaphore_t v8 = (objc_class *)NSString;
    id v9 = a5;
    a5 = (id)[[v8 alloc] initWithFormat:v9 arguments:&v14];
  }
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  [v10 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  [v10 setObject:a5 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  dispatch_queue_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PFVideoSharingOperationErrorDomain" code:a3 userInfo:v10];

  return v11;
}

@end