@interface ISUDownload
+ (id)downloadExternalProperties;
+ (id)downloadProperties;
+ (void)initialize;
- (BOOL)isContentRestricted;
- (BOOL)isPausable;
- (BOOL)isPurchase;
- (ISUDownload)initWithManagedDownload:(id)a3;
- (NSNumber)storeItemIdentifier;
- (NSNumber)storePreorderIdentifier;
- (NSString)artistName;
- (NSString)phaseIdentifier;
- (NSString)statusDescription;
- (NSString)title;
- (NSURL)thumbnailImageURL;
- (SSDownload)managedDownload;
- (double)estimatedSecondsRemaining;
- (double)percentComplete;
- (id)copyLocalizedStatusString;
- (int64_t)bytesDownloaded;
- (int64_t)bytesTotal;
- (void)dealloc;
- (void)resetPreorderState;
- (void)setManagedDownload:(id)a3;
@end

@implementation ISUDownload

+ (id)downloadProperties
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&__Properties count:9];
}

+ (id)downloadExternalProperties
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&__ExternalProperties count:5];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = *MEMORY[0x263F7B610];
    __Properties = *MEMORY[0x263F7B5F0];
    qword_2681B5510 = v2;
    uint64_t v3 = *MEMORY[0x263F7B648];
    qword_2681B5518 = *MEMORY[0x263F7B638];
    qword_2681B5520 = v3;
    uint64_t v4 = *MEMORY[0x263F7B6D8];
    qword_2681B5528 = *MEMORY[0x263F7B628];
    qword_2681B5530 = v4;
    uint64_t v5 = *MEMORY[0x263F7B730];
    qword_2681B5538 = *MEMORY[0x263F7B6E8];
    qword_2681B5540 = v5;
    qword_2681B5548 = *MEMORY[0x263F7B738];
    uint64_t v6 = *MEMORY[0x263F7B548];
    __ExternalProperties = *MEMORY[0x263F7B540];
    qword_2681B54E8 = v6;
    uint64_t v7 = *MEMORY[0x263F7B558];
    qword_2681B54F0 = *MEMORY[0x263F7B550];
    qword_2681B54F8 = v7;
    qword_2681B5500 = *MEMORY[0x263F7B560];
  }
}

- (ISUDownload)initWithManagedDownload:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ISUDownload;
  uint64_t v4 = [(ISUDownload *)&v7 init];
  if (v4)
  {
    v4->_download = (SSDownload *)a3;
    uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.iTunesStoreUI.ISUDownload.%p", v4);
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v5 UTF8String], 0);
  }
  return v4;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)ISUDownload;
  [(ISUDownload *)&v4 dealloc];
}

- (NSString)artistName
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__44;
  v10 = __Block_byref_object_dispose__44;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__ISUDownload_artistName__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __25__ISUDownload_artistName__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 8) valueForProperty:__Properties];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (int64_t)bytesDownloaded
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__ISUDownload_bytesDownloaded__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__ISUDownload_bytesDownloaded__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "valueForExternalProperty:", __ExternalProperties), "longLongValue");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)bytesTotal
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__ISUDownload_bytesTotal__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__ISUDownload_bytesTotal__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "valueForExternalProperty:", qword_2681B54E8), "longLongValue");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)copyLocalizedStatusString
{
  int64_t v3 = [(ISUDownload *)self phaseIdentifier];
  if ([(NSString *)v3 isEqualToString:*MEMORY[0x263F7B5C8]])
  {
    objc_super v4 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = @"DOWNLOAD_ERROR";
LABEL_11:
    objc_super v7 = (NSString *)[v4 localizedStringForKey:v5 value:&stru_26DB8C5F8 table:0];
LABEL_12:
    return v7;
  }
  if ([(ISUDownload *)self isContentRestricted])
  {
    objc_super v4 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = @"RESTRICTED";
    goto LABEL_11;
  }
  if ([(NSString *)v3 isEqualToString:*MEMORY[0x263F7B5E0]])
  {
    unint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL;
    objc_super v4 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v6 == 1) {
      uint64_t v5 = @"DOWNLOAD_PAUSED";
    }
    else {
      uint64_t v5 = @"TAP_TO_RESUME";
    }
    goto LABEL_11;
  }
  if ([(NSString *)v3 isEqualToString:*MEMORY[0x263F7B5E8]])
  {
    objc_super v4 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = @"WAITING";
    goto LABEL_11;
  }
  v25 = [(ISUDownload *)self statusDescription];
  if ([(NSString *)v25 length])
  {
    objc_super v7 = v25;
    goto LABEL_12;
  }
  if (![(NSString *)v3 isEqualToString:*MEMORY[0x263F7B5C0]]) {
    goto LABEL_23;
  }
  uint64_t v9 = [(ISUDownload *)self bytesDownloaded];
  uint64_t v10 = [(ISUDownload *)self bytesTotal];
  if (v10 < 1 || v9 <= 0)
  {
    objc_super v4 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = @"UNKNOWN_PROGRESS";
    goto LABEL_11;
  }
  if (v9 >= (unint64_t)v10)
  {
LABEL_23:
    objc_super v4 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = @"PROCESSING_DOWNLOAD";
    goto LABEL_11;
  }
  [(ISUDownload *)self estimatedSecondsRemaining];
  if (v11 >= 0.0)
  {
    double v15 = v11;
    id v16 = [NSString alloc];
    v17 = objc_msgSend(v16, "initWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"TIME_FORMAT", &stru_26DB8C5F8, 0), v15 / 0x3CuLL, v15 % 0x3C);
    uint64_t v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
    id v19 = [NSString alloc];
    v20 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v18 == 1) {
      v21 = @"TIME_PROGRESS_LONG";
    }
    else {
      v21 = @"TIME_PROGRESS";
    }
    uint64_t v22 = [v20 localizedStringForKey:v21 value:&stru_26DB8C5F8 table:0];
    uint64_t v23 = CPFSSizeStrings();
    v24 = objc_msgSend(v19, "initWithFormat:", v22, v23, CPFSSizeStrings(), v17);

    return v24;
  }
  else
  {
    id v12 = [NSString alloc];
    uint64_t v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DATA_PROGRESS", &stru_26DB8C5F8, 0);
    uint64_t v14 = CPFSSizeStrings();
    return (id)objc_msgSend(v12, "initWithFormat:", v13, v14, CPFSSizeStrings());
  }
}

- (double)estimatedSecondsRemaining
{
  uint64_t v6 = 0;
  objc_super v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__ISUDownload_estimatedSecondsRemaining__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__ISUDownload_estimatedSecondsRemaining__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "valueForExternalProperty:", qword_2681B54F0), "doubleValue");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)isContentRestricted
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__ISUDownload_isContentRestricted__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__ISUDownload_isContentRestricted__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "valueForProperty:", qword_2681B5518), "BOOLValue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isPausable
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__ISUDownload_isPausable__block_invoke;
  v7[3] = &unk_264812E70;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(dispatchQueue, v7);
  if (*((unsigned char *)v9 + 24))
  {
    objc_super v4 = [(ISUDownload *)self phaseIdentifier];
    char v5 = [(NSString *)v4 isEqual:*MEMORY[0x263F7B5C0]];
  }
  else
  {
    char v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __25__ISUDownload_isPausable__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "valueForProperty:", qword_2681B5510), "BOOLValue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isPurchase
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__ISUDownload_isPurchase__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__ISUDownload_isPurchase__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "valueForProperty:", qword_2681B5520), "BOOLValue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (SSDownload)managedDownload
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__44;
  uint64_t v10 = __Block_byref_object_dispose__44;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__ISUDownload_managedDownload__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (SSDownload *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__ISUDownload_managedDownload__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (double)percentComplete
{
  uint64_t v6 = 0;
  objc_super v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__ISUDownload_percentComplete__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__ISUDownload_percentComplete__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "valueForExternalProperty:", qword_2681B54F8), "doubleValue");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (NSString)phaseIdentifier
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__44;
  uint64_t v10 = __Block_byref_object_dispose__44;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__ISUDownload_phaseIdentifier__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__ISUDownload_phaseIdentifier__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 8) valueForProperty:qword_2681B5528];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)resetPreorderState
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__ISUDownload_resetPreorderState__block_invoke;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __33__ISUDownload_resetPreorderState__block_invoke(uint64_t a1)
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = qword_2681B5538;
  return [*(id *)(*(void *)(a1 + 32) + 8) resetCachedProperties:v2 count:1];
}

- (void)setManagedDownload:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__ISUDownload_setManagedDownload___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

void *__34__ISUDownload_setManagedDownload___block_invoke(void *result)
{
  v1 = *(void **)(result[4] + 8);
  if (v1 != (void *)result[5])
  {
    uint64_t v2 = result;

    id result = (id)v2[5];
    *(void *)(v2[4] + 8) = result;
  }
  return result;
}

- (NSString)statusDescription
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__44;
  uint64_t v10 = __Block_byref_object_dispose__44;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__ISUDownload_statusDescription__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __32__ISUDownload_statusDescription__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 8) valueForExternalProperty:qword_2681B5500];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)storeItemIdentifier
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__44;
  uint64_t v10 = __Block_byref_object_dispose__44;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__ISUDownload_storeItemIdentifier__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __34__ISUDownload_storeItemIdentifier__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 8) valueForProperty:qword_2681B5530];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)storePreorderIdentifier
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__44;
  uint64_t v10 = __Block_byref_object_dispose__44;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__ISUDownload_storePreorderIdentifier__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __38__ISUDownload_storePreorderIdentifier__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 8) valueForProperty:qword_2681B5538];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSURL)thumbnailImageURL
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__44;
  uint64_t v10 = __Block_byref_object_dispose__44;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__ISUDownload_thumbnailImageURL__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = (NSURL *)[NSURL URLWithString:v7[5]];
  }
  else {
    uint64_t v3 = 0;
  }

  _Block_object_dispose(&v6, 8);
  return v3;
}

id __32__ISUDownload_thumbnailImageURL__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 8) valueForProperty:qword_2681B5540];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)title
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__44;
  uint64_t v10 = __Block_byref_object_dispose__44;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __20__ISUDownload_title__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __20__ISUDownload_title__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 8) valueForProperty:qword_2681B5548];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end