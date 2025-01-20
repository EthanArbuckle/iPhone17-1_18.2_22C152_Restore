@interface PFPhotoSharingOperation
+ (BOOL)outputSupportedForTypeIdentifier:(id)a3;
+ (id)operationErrorWithCode:(int64_t)a3 withDescription:(id)a4;
- (BOOL)shouldConvertToSRGB;
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
- (NSString)outputFilename;
- (NSURL)imageURL;
- (NSURL)outputDirectoryURL;
- (NSURL)resultingFileURL;
- (PFAssetAdjustments)_adjustments;
- (PFPhotoSharingOperation)initWithImageURL:(id)a3 adjustmentData:(id)a4;
- (float)progress;
- (void)_setAdjustments:(id)a3;
- (void)_setImageURL:(id)a3;
- (void)main;
- (void)setCustomAccessibilityLabel:(id)a3;
- (void)setCustomCaption:(id)a3;
- (void)setCustomDate:(id)a3;
- (void)setCustomLocation:(id)a3;
- (void)setOutputDirectoryURL:(id)a3;
- (void)setOutputFilename:(id)a3;
- (void)setShouldConvertToSRGB:(BOOL)a3;
- (void)setShouldStripAccessibilityDescription:(BOOL)a3;
- (void)setShouldStripCaption:(BOOL)a3;
- (void)setShouldStripLocation:(BOOL)a3;
- (void)setShouldStripMetadata:(BOOL)a3;
@end

@implementation PFPhotoSharingOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__adjustments, 0);
  objc_storeStrong((id *)&self->_resultingFileURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_customAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_customCaption, 0);
  objc_storeStrong((id *)&self->_customDate, 0);
  objc_storeStrong((id *)&self->_customLocation, 0);
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong((id *)&self->_outputDirectoryURL, 0);
  objc_storeStrong((id *)&self->_operationError, 0);

  objc_storeStrong((id *)&self->_externalIsolation, 0);
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

- (void)_setImageURL:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setShouldStripMetadata:(BOOL)a3
{
  self->_shouldStripMetadata = a3;
}

- (BOOL)shouldStripMetadata
{
  return self->_shouldStripMetadata;
}

- (void)setCustomDate:(id)a3
{
}

- (NSDate)customDate
{
  return self->_customDate;
}

- (BOOL)shouldConvertToSRGB
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PFPhotoSharingOperation_shouldConvertToSRGB__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__PFPhotoSharingOperation_shouldConvertToSRGB__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 269);
  return result;
}

- (void)setShouldConvertToSRGB:(BOOL)a3
{
  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PFPhotoSharingOperation_setShouldConvertToSRGB___block_invoke;
  v4[3] = &unk_1E5B2F640;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(externalIsolation, v4);
}

uint64_t __50__PFPhotoSharingOperation_setShouldConvertToSRGB___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 269) != v2) {
    *(unsigned char *)(v1 + 269) = v2;
  }
  return result;
}

- (BOOL)shouldStripLocation
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PFPhotoSharingOperation_shouldStripLocation__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__PFPhotoSharingOperation_shouldStripLocation__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 266);
  return result;
}

- (void)setShouldStripLocation:(BOOL)a3
{
  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PFPhotoSharingOperation_setShouldStripLocation___block_invoke;
  v4[3] = &unk_1E5B2F640;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(externalIsolation, v4);
}

uint64_t __50__PFPhotoSharingOperation_setShouldStripLocation___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 266) != v2) {
    *(unsigned char *)(v1 + 266) = v2;
  }
  return result;
}

- (BOOL)shouldStripAccessibilityDescription
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__PFPhotoSharingOperation_shouldStripAccessibilityDescription__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__PFPhotoSharingOperation_shouldStripAccessibilityDescription__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 268);
  return result;
}

- (void)setShouldStripAccessibilityDescription:(BOOL)a3
{
  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PFPhotoSharingOperation_setShouldStripAccessibilityDescription___block_invoke;
  v4[3] = &unk_1E5B2F640;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(externalIsolation, v4);
}

uint64_t __66__PFPhotoSharingOperation_setShouldStripAccessibilityDescription___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 268) != v2) {
    *(unsigned char *)(v1 + 268) = v2;
  }
  return result;
}

- (BOOL)shouldStripCaption
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PFPhotoSharingOperation_shouldStripCaption__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__PFPhotoSharingOperation_shouldStripCaption__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 267);
  return result;
}

- (void)setShouldStripCaption:(BOOL)a3
{
  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PFPhotoSharingOperation_setShouldStripCaption___block_invoke;
  v4[3] = &unk_1E5B2F640;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(externalIsolation, v4);
}

uint64_t __49__PFPhotoSharingOperation_setShouldStripCaption___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 267) != v2) {
    *(unsigned char *)(v1 + 267) = v2;
  }
  return result;
}

- (NSString)customAccessibilityLabel
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__4910;
  v10 = __Block_byref_object_dispose__4911;
  id v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PFPhotoSharingOperation_customAccessibilityLabel__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __51__PFPhotoSharingOperation_customAccessibilityLabel__block_invoke(uint64_t a1)
{
}

- (void)setCustomAccessibilityLabel:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PFPhotoSharingOperation_setCustomAccessibilityLabel___block_invoke;
  v7[3] = &unk_1E5B2F668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

uint64_t __55__PFPhotoSharingOperation_setCustomAccessibilityLabel___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(a1 + 32) + 312) = [*(id *)(a1 + 40) copy];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (NSString)customCaption
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__4910;
  v10 = __Block_byref_object_dispose__4911;
  id v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PFPhotoSharingOperation_customCaption__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __40__PFPhotoSharingOperation_customCaption__block_invoke(uint64_t a1)
{
}

- (void)setCustomCaption:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PFPhotoSharingOperation_setCustomCaption___block_invoke;
  v7[3] = &unk_1E5B2F668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

uint64_t __44__PFPhotoSharingOperation_setCustomCaption___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 304) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(a1 + 32) + 304) = [*(id *)(a1 + 40) copy];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (CLLocation)customLocation
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__4910;
  v10 = __Block_byref_object_dispose__4911;
  id v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PFPhotoSharingOperation_customLocation__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CLLocation *)v3;
}

void __41__PFPhotoSharingOperation_customLocation__block_invoke(uint64_t a1)
{
}

- (void)setCustomLocation:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PFPhotoSharingOperation_setCustomLocation___block_invoke;
  v7[3] = &unk_1E5B2F668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

uint64_t __45__PFPhotoSharingOperation_setCustomLocation___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 288) isEqual:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(a1 + 32) + 288) = [*(id *)(a1 + 40) copy];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (NSString)outputFilename
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__4910;
  v10 = __Block_byref_object_dispose__4911;
  id v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PFPhotoSharingOperation_outputFilename__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __41__PFPhotoSharingOperation_outputFilename__block_invoke(uint64_t a1)
{
}

- (void)setOutputFilename:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PFPhotoSharingOperation_setOutputFilename___block_invoke;
  v7[3] = &unk_1E5B2F668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

uint64_t __45__PFPhotoSharingOperation_setOutputFilename___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 280);
  if (result != v2)
  {
    uint64_t result = objc_msgSend((id)result, "isEqualToString:");
    if ((result & 1) == 0)
    {
      *(void *)(*(void *)(a1 + 32) + 280) = [*(id *)(a1 + 40) copy];
      return MEMORY[0x1F41817F8]();
    }
  }
  return result;
}

- (NSURL)outputDirectoryURL
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__4910;
  v10 = __Block_byref_object_dispose__4911;
  id v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PFPhotoSharingOperation_outputDirectoryURL__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __45__PFPhotoSharingOperation_outputDirectoryURL__block_invoke(uint64_t a1)
{
}

- (void)setOutputDirectoryURL:(id)a3
{
  id v4 = a3;
  externalIsolation = self->_externalIsolation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PFPhotoSharingOperation_setOutputDirectoryURL___block_invoke;
  v7[3] = &unk_1E5B2F668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(externalIsolation, v7);
}

uint64_t __49__PFPhotoSharingOperation_setOutputDirectoryURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 272);
  if (result != v2)
  {
    uint64_t result = objc_msgSend((id)result, "isEqual:");
    if ((result & 1) == 0)
    {
      *(void *)(*(void *)(a1 + 32) + 272) = [*(id *)(a1 + 40) copy];
      return MEMORY[0x1F41817F8]();
    }
  }
  return result;
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
  v5[2] = __34__PFPhotoSharingOperation_success__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__PFPhotoSharingOperation_success__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 265);
  return result;
}

- (float)progress
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PFPhotoSharingOperation_progress__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  if (*((unsigned char *)v7 + 24)) {
    float v3 = 1.0;
  }
  else {
    float v3 = 0.0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__PFPhotoSharingOperation_progress__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 264);
  return result;
}

- (NSError)operationError
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__4910;
  v10 = __Block_byref_object_dispose__4911;
  id v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PFPhotoSharingOperation_operationError__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __41__PFPhotoSharingOperation_operationError__block_invoke(uint64_t a1)
{
}

- (void)main
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  CFURLRef v3 = [(PFPhotoSharingOperation *)self imageURL];
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x3032000000;
  v109 = __Block_byref_object_copy__4910;
  v110 = __Block_byref_object_dispose__4911;
  id v111 = 0;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__4910;
  v104 = __Block_byref_object_dispose__4911;
  id v105 = 0;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__4910;
  v98 = __Block_byref_object_dispose__4911;
  id v99 = 0;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__4910;
  v92 = __Block_byref_object_dispose__4911;
  id v93 = 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__4910;
  v86 = __Block_byref_object_dispose__4911;
  id v87 = 0;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__4910;
  v80 = __Block_byref_object_dispose__4911;
  id v81 = 0;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  char v75 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PFPhotoSharingOperation_main__block_invoke;
  block[3] = &unk_1E5B2DE28;
  block[4] = self;
  block[5] = &v106;
  block[6] = &v100;
  block[7] = &v94;
  block[8] = &v88;
  block[9] = &v82;
  block[10] = &v76;
  block[11] = &v72;
  block[12] = &v68;
  block[13] = &v64;
  block[14] = &v60;
  block[15] = &v56;
  dispatch_sync(externalIsolation, block);
  if (!v3 || !v107[5] || !v77[5])
  {
    uint64_t v21 = [(id)objc_opt_class() operationErrorWithCode:2, @"Image URL, filename or output directory is missing. ImageURL: %@, filename: %@, outputDirectory: %@", v3, v107[5], v77[5] withDescription];
LABEL_26:
    v20 = (void *)v21;
    id v7 = 0;
    id v6 = 0;
    CFURLRef v16 = 0;
    char v22 = 0;
    goto LABEL_27;
  }
  BOOL v5 = CGImageSourceCreateWithURL(v3, 0);
  isrc = v5;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFURLRef v113 = v3;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PFPhotoSharingOperation] Could not create imageSource from image URL: %@", buf, 0xCu);
    }
    uint64_t v21 = [(id)objc_opt_class() operationErrorWithCode:3, @"Could not create imageSource from image URL: %@", v3 withDescription];
    goto LABEL_26;
  }
  id v6 = +[PFUniformTypeUtilities typeWithIdentifier:CGImageSourceGetType(v5)];
  id v7 = v6;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      CFURLRef v113 = v3;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Could not determine the UTI type for file: %{public}@. Falling back to JPG.", buf, 0xCu);
    }
    id v7 = (id)*MEMORY[0x1E4F44410];
  }
  uint64_t v8 = objc_opt_class();
  char v9 = [v7 identifier];
  LOBYTE(v8) = [(id)v8 outputSupportedForTypeIdentifier:v9];

  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      CFURLRef v113 = (const __CFURL *)v7;
      __int16 v114 = 2114;
      CFURLRef v115 = v3;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Output to file type: %{public}@ is not supported when performing metadata changes for file: %{public}@. Falling back to JPG.", buf, 0x16u);
    }
    id v10 = (id)*MEMORY[0x1E4F44410];

    id v7 = v10;
  }
  CGImageDestinationRef idst = [(__CFURL *)v3 pathExtension];
  id v11 = [v7 preferredFilenameExtension];
  if (!v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      CFURLRef v113 = (const __CFURL *)v7;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Could not determine the extension from type: %{public}@.", buf, 0xCu);
    }
    id v11 = idst;
  }
  v12 = [(__CFString *)v11 uppercaseString];
  int v13 = [v12 isEqualToString:@"JPEG"];

  if (v13)
  {

    id v11 = @"JPG";
  }
  v14 = [(__CFString *)v11 uppercaseString];

  v15 = [(id)v107[5] stringByAppendingPathExtension:v14];
  CFURLRef v16 = [(id)v77[5] URLByAppendingPathComponent:v15];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    CFURLRef v113 = v16;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Output file URL will be %{public}@", buf, 0xCu);
  }
  CFURLRef v17 = [(__CFURL *)v16 path];
  v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v19 = [v18 fileExistsAtPath:v17];

  if (v19)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFURLRef v113 = v17;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PFPhotoSharingOperation] Output file already exists at path: %{public}@. Aborting photo remaking.", buf, 0xCu);
    }
    v20 = [(id)objc_opt_class() operationErrorWithCode:4, @"Output file already exists at path: %@", v17 withDescription];
  }
  else
  {
    v20 = 0;
  }

  if (v19)
  {
    char v22 = 0;
    idsta = 0;
    goto LABEL_100;
  }
  v26 = [v7 identifier];
  idsta = CGImageDestinationCreateWithURL(v16, v26, 1uLL, 0);

  if (!idsta)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFURLRef v113 = (const __CFURL *)v7;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PFPhotoSharingOperation] Could not create image destination for file type: %{public}@. Aborting photo remaking.", buf, 0xCu);
    }
    uint64_t v38 = [(id)objc_opt_class() operationErrorWithCode:5, @"Could not create image destination for file type: %@, file URL: %@", v7, v16 withDescription];
    char v22 = 0;
    idsta = 0;
    goto LABEL_99;
  }
  v47 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*((unsigned char *)v65 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Stripping location", buf, 2u);
    }
    [v47 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2F4A0]];
  }
  if (*((unsigned char *)v57 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Converting to SRGB", buf, 2u);
    }
    [v47 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2F450]];
  }
  int v45 = *((unsigned __int8 *)v61 + 24);
  if (!*((unsigned char *)v65 + 24))
  {
    CFURLRef v27 = (const __CFURL *)v101[5];
    if (v27)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        CFURLRef v113 = v27;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Applying custom location: %{private}@", buf, 0xCu);
        CFURLRef v27 = (const __CFURL *)v101[5];
      }
      v28 = +[PFSharingUtilities gpsDictionaryForLocation:v27];
      if (v28)
      {
        [v47 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F2FA18]];
        [v47 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2F440]];
      }
    }
  }
  CFDictionaryRef v46 = CGImageSourceCopyPropertiesAtIndex(isrc, 0, 0);
  CFURLRef v29 = (const __CFURL *)v95[5];
  if (v29)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      CFURLRef v113 = v29;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Applying custom date: %{private}@", buf, 0xCu);
    }
    uint64_t v30 = *MEMORY[0x1E4F2F800];
    v31 = [(__CFDictionary *)v46 objectForKeyedSubscript:*MEMORY[0x1E4F2F800]];
    v44 = +[PFSharingUtilities addCreationDate:v95[5] toExifDictionary:v31];

    uint64_t v32 = *MEMORY[0x1E4F2FD40];
    v33 = [(__CFDictionary *)v46 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
    v34 = +[PFSharingUtilities addCreationDate:v95[5] toTIFFDictionary:v33];

    [v47 setObject:v44 forKeyedSubscript:v30];
    [v47 setObject:v34 forKeyedSubscript:v32];
    [v47 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2F440]];
  }
  if (*((unsigned char *)v73 + 24) || v89[5] || v83[5])
  {
    uint64_t v35 = *MEMORY[0x1E4F2FB80];
    v36 = [(__CFDictionary *)v46 objectForKeyedSubscript:*MEMORY[0x1E4F2FB80]];
    v37 = (void *)[v36 mutableCopy];

    if (*((unsigned char *)v73 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Removing Caption from IPTC", buf, 2u);
      }
      [v37 removeObjectForKey:*MEMORY[0x1E4F2FB58]];
    }
    else
    {
      CFURLRef v39 = (const __CFURL *)v89[5];
      if (v39)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          CFURLRef v113 = v39;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Applying Caption \"%{private}@\" to IPTC", buf, 0xCu);
        }
        if (!v37)
        {
          v37 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        [v37 setObject:v89[5] forKeyedSubscript:*MEMORY[0x1E4F2FB58]];
      }
    }
    if (*((unsigned char *)v69 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Removing Artwork Content Description from IPTC", buf, 2u);
      }
      [v37 removeObjectForKey:*MEMORY[0x1E4F2FB98]];
    }
    else
    {
      CFURLRef v40 = (const __CFURL *)v83[5];
      if (v40)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          CFURLRef v113 = v40;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Applying Artwork Content Descrption \"%{private}@\" to IPTC", buf, 0xCu);
        }
        if (!v37)
        {
          v37 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        [v37 setObject:v83[5] forKey:*MEMORY[0x1E4F2FB98]];
      }
    }
    if (v37)
    {
      [v47 setObject:v37 forKeyedSubscript:v35];
      [v47 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2F440]];
    }
  }
  if (!v45)
  {
    size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(isrc);
    CGImageDestinationAddImageFromSource(idsta, isrc, PrimaryImageIndex, (CFDictionaryRef)v47);
    goto LABEL_87;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(isrc, 0, 0);
  if (ImageAtIndex)
  {
    CGImageDestinationAddImage(idsta, ImageAtIndex, (CFDictionaryRef)v47);
    CGImageRelease(ImageAtIndex);
LABEL_87:
    LODWORD(ImageAtIndex) = 1;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543875;
    CFURLRef v113 = v3;
    __int16 v114 = 2114;
    CFURLRef v115 = v16;
    __int16 v116 = 2113;
    v117 = v47;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Finalizing image from source URL: %{public}@, Out URL: %{public}@. Applying destination options: %{private}@", buf, 0x20u);
  }
  if (ImageAtIndex && CGImageDestinationFinalize(idsta))
  {
    char v22 = 1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Operation complete.", buf, 2u);
    }
    uint64_t v38 = (uint64_t)v20;
  }
  else
  {
    CFURLRef v43 = [NSString stringWithFormat:@"Source URL: %@ (Source type: %@), output Type: %@, output URL: %@", v3, v6, v7, v16];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543619;
      CFURLRef v113 = v43;
      __int16 v114 = 2113;
      CFURLRef v115 = (const __CFURL *)v47;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PFPhotoSharingOperation] Unable to finalize image destination. %{public}@. Destination options: %{private}@", buf, 0x16u);
    }
    uint64_t v38 = [(id)objc_opt_class() operationErrorWithCode:6, @"Unable to finalize image destination. %@", v43 withDescription];

    char v22 = 0;
  }

  v20 = v47;
LABEL_99:

  v20 = (void *)v38;
LABEL_100:
  CFRelease(isrc);
  if (idsta) {
    CFRelease(idsta);
  }
LABEL_27:
  v23 = self->_externalIsolation;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __31__PFPhotoSharingOperation_main__block_invoke_31;
  v51[3] = &unk_1E5B2F618;
  char v54 = v22;
  v51[4] = self;
  id v52 = v20;
  CFURLRef v53 = v16;
  CFURLRef v24 = v16;
  id v25 = v20;
  dispatch_sync(v23, v51);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v100, 8);

  _Block_object_dispose(&v106, 8);
}

void __31__PFPhotoSharingOperation_main__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 280) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1[4] + 288) copy];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1[4] + 296) copy];
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = [*(id *)(a1[4] + 304) copy];
  uint64_t v12 = *(void *)(a1[8] + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = [*(id *)(a1[4] + 312) copy];
  uint64_t v15 = *(void *)(a1[9] + 8);
  CFURLRef v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = [*(id *)(a1[4] + 272) copy];
  uint64_t v18 = *(void *)(a1[10] + 8);
  int v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = *(unsigned char *)(a1[4] + 267);
  *(unsigned char *)(*(void *)(a1[12] + 8) + 24) = *(unsigned char *)(a1[4] + 268);
  *(unsigned char *)(*(void *)(a1[13] + 8) + 24) = *(unsigned char *)(a1[4] + 266);
  *(unsigned char *)(*(void *)(a1[14] + 8) + 24) = *(unsigned char *)(a1[4] + 270);
  *(unsigned char *)(*(void *)(a1[15] + 8) + 24) = *(unsigned char *)(a1[4] + 269);
}

void __31__PFPhotoSharingOperation_main__block_invoke_31(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 264) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 265) = *(unsigned char *)(a1 + 56);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 256), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 265))
  {
    uint64_t v3 = *(void **)(a1 + 48);
    objc_storeStrong((id *)(v2 + 328), v3);
  }
}

- (PFPhotoSharingOperation)initWithImageURL:(id)a3 adjustmentData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PFPhotoSharingOperation;
  uint64_t v8 = [(PFPhotoSharingOperation *)&v14 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(PFPhotoSharingOperation *)v8 _setImageURL:v6];
    [(PFPhotoSharingOperation *)v9 _setAdjustments:v7];
    id v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PFPhotoSharingOperation.isolationQueue", v10);
    externalIsolation = v9->_externalIsolation;
    v9->_externalIsolation = (OS_dispatch_queue *)v11;
  }
  return v9;
}

+ (id)operationErrorWithCode:(int64_t)a3 withDescription:(id)a4
{
  if (a4)
  {
    uint64_t v5 = (objc_class *)NSString;
    id v6 = a4;
    id v7 = (void *)[[v5 alloc] initWithFormat:v6 arguments:&v12];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PFPhotoSharingOperationErrorDomain" code:a3 userInfo:v8];

  return v9;
}

+ (BOOL)outputSupportedForTypeIdentifier:(id)a3
{
  uint64_t v3 = outputSupportedForTypeIdentifier__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&outputSupportedForTypeIdentifier__onceToken, &__block_literal_global_4966);
  }
  char v5 = [(id)outputSupportedForTypeIdentifier__supportedImageDestinationTypeIdentifiers containsObject:v4];

  return v5;
}

uint64_t __60__PFPhotoSharingOperation_outputSupportedForTypeIdentifier___block_invoke()
{
  outputSupportedForTypeIdentifier__supportedImageDestinationTypeIdentifiers = (uint64_t)CGImageDestinationCopyTypeIdentifiers();

  return MEMORY[0x1F41817F8]();
}

@end