@interface PKDefaults
+ (BOOL)airPrintBeaconDiscoveryAllowed;
+ (BOOL)ippsIsRequired;
+ (BOOL)mcProfilePrintersOnlyAllowed;
+ (BOOL)urfIsOptional;
+ (BOOL)uriMatchesMCProfileAdded:(id)a3;
+ (NSArray)iCloudPrinters;
+ (NSArray)iCloudPrintersSync;
+ (NSXPCListener)listenerProxy;
+ (id)absoluteSpoolDirectory;
+ (id)lastUsedPrinters;
+ (id)lastUsedPrintersForPhoto:(BOOL)a3;
+ (id)requiredPDL;
+ (void)addLastUsedPrinter:(id)a3 duplexMode:(id)a4 lastUsedSize:(CGSize)a5 forPhoto:(BOOL)a6;
+ (void)addPrinterToiCloud:(id)a3 displayName:(id)a4;
+ (void)addPrinterToiCloud:(id)a3 displayName:(id)a4 location:(id)a5;
+ (void)getUpdatediCloudPrintersFromPrinterTool;
+ (void)lastUsedPrintersCompletionHandler:(id)a3;
+ (void)lastUsedPrintersForPhoto:(BOOL)a3 completionHandler:(id)a4;
+ (void)removePrinterFromiCloud:(id)a3;
+ (void)resetPKCloudData;
+ (void)seenPrintersCompletionHandler:(id)a3;
+ (void)setICloudPrinters:(id)a3;
+ (void)setListenerProxy:(id)a3;
+ (void)startiCloudListening;
+ (void)updateiCloudPrinterDisplayName:(id)a3 displayName:(id)a4;
+ (void)updateiCloudPrinterLocation:(id)a3 location:(id)a4;
@end

@implementation PKDefaults

+ (void)lastUsedPrintersCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = +[PKPrinterTool_Client sharedClient];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__PKDefaults_lastUsedPrintersCompletionHandler___block_invoke;
  v6[3] = &unk_2649EDDF0;
  id v5 = v3;
  id v7 = v5;
  [v4 getLastUsedPrintersForCurrentNetworkCompletionHandler:v6];
}

void __48__PKDefaults_lastUsedPrintersCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = a1;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v18 = a3;
  v20 = objc_opt_new();
  BOOL v19 = +[PKDefaults mcProfilePrintersOnlyAllowed];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v18;
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v3) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v23 != v4) {
        objc_enumerationMutation(obj);
      }
      v6 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      id v7 = objc_msgSend(v6, "objectForKeyedSubscript:", @"com.apple.mcprofile-added", v17);
      int v8 = [v7 BOOLValue];

      if (!v8)
      {
        if (v19) {
          continue;
        }
LABEL_10:
        v11 = v6;
        v12 = (NSMutableDictionary *)[(NSDictionary *)v11 mutableCopy];
        unxferSize(v12, v11, &cfstr_ComAppleLastUs_1.isa);
        unxferSize(v12, v11, &cfstr_ComAppleLastUs_0.isa);
        unxferSize(v12, v11, &cfstr_ComAppleLastUs.isa);

        [v20 addObject:v12];
        continue;
      }
      v9 = [v6 objectForKeyedSubscript:@"printer-dns-sd-name"];
      BOOL v10 = +[PKDefaults uriMatchesMCProfileAdded:v9];

      if (v10) {
        goto LABEL_10;
      }
    }
    uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v3);
LABEL_13:

  uint64_t v13 = *(void *)(v17 + 32);
  id v14 = v20;
  if ((unint64_t)[v14 count] > 3)
  {
    objc_msgSend(v14, "subarrayWithRange:", 0, 3);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = v14;
  }
  v16 = v15;

  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v16);
}

+ (id)lastUsedPrinters
{
  id v2 = a1;
  if (object_isClass(v2)) {
    [NSString stringWithUTF8String:"+[PKDefaults lastUsedPrinters]"];
  }
  else {
  uint64_t v3 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v2, "+[PKDefaults lastUsedPrinters]"];
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__PKDefaults_lastUsedPrinters__block_invoke;
  v6[3] = &__block_descriptor_40_e24_v16__0___v____NSArray__8l;
  void v6[4] = v2;
  uint64_t v4 = withDebuggableSemaphore<NSArray * {__strong}>(v3, v6, 3.0);

  return v4;
}

uint64_t __30__PKDefaults_lastUsedPrinters__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) lastUsedPrintersCompletionHandler:a2];
}

+ (void)lastUsedPrintersForPhoto:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v48 = *MEMORY[0x263EF8340];
  v30 = (void (**)(id, void *))a4;
  v32 = objc_opt_new();
  +[PKDefaults lastUsedPrinters];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v42;
    id v7 = PKPrinterWasLastUsedPrinterForDocumentKey;
    if (v4) {
      id v7 = PKPrinterWasLastUsedPrinterForPhotoKey;
    }
    int v8 = *v7;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v11 = [v10 objectForKey:v8];
        v12 = v11;
        if (v11 && [v11 BOOLValue])
        {
          [v32 addObject:v10];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v13 = obj;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v38;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v38 != v15) {
                  objc_enumerationMutation(v13);
                }
                if (*(void **)(*((void *)&v37 + 1) + 8 * j) != v10) {
                  objc_msgSend(v32, "addObject:");
                }
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
            }
            while (v14);
          }

          goto LABEL_23;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  if (![v32 count]) {
    [v32 addObjectsFromArray:obj];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v32;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = *(void **)(*((void *)&v33 + 1) + 8 * k);
        if (v4)
        {
          long long v22 = [*(id *)(*((void *)&v33 + 1) + 8 * k) objectForKeyedSubscript:@"com.apple.last-used-photo-size"];
          BOOL v23 = v22 == 0;

          if (v23) {
            continue;
          }
          long long v24 = [v21 objectForKeyedSubscript:@"com.apple.last-used-photo-size"];
          [v21 setObject:v24 forKeyedSubscript:@"com.apple.last-used-size"];
        }
        else
        {
          long long v25 = [*(id *)(*((void *)&v33 + 1) + 8 * k) objectForKeyedSubscript:@"com.apple.last-used-document-size"];
          BOOL v26 = v25 == 0;

          if (v26) {
            continue;
          }
          long long v24 = [v21 objectForKeyedSubscript:@"com.apple.last-used-document-size"];
          [v21 setObject:v24 forKeyedSubscript:@"com.apple.last-used-size"];
        }
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v18);
  }

  id v27 = v17;
  if ((unint64_t)[v27 count] > 3)
  {
    objc_msgSend(v27, "subarrayWithRange:", 0, 3);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v28 = v27;
  }
  v29 = v28;

  v30[2](v30, v29);
}

+ (id)lastUsedPrintersForPhoto:(BOOL)a3
{
  id v4 = a1;
  if (object_isClass(v4)) {
    [NSString stringWithUTF8String:"+[PKDefaults lastUsedPrintersForPhoto:]"];
  }
  else {
  uint64_t v5 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v4, "+[PKDefaults lastUsedPrintersForPhoto:]"];
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__PKDefaults_lastUsedPrintersForPhoto___block_invoke;
  v8[3] = &__block_descriptor_41_e24_v16__0___v____NSArray__8l;
  v8[4] = v4;
  BOOL v9 = a3;
  uint64_t v6 = withDebuggableSemaphore<NSArray * {__strong}>(v5, v8, 3.0);

  return v6;
}

uint64_t __39__PKDefaults_lastUsedPrintersForPhoto___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) lastUsedPrintersForPhoto:*(unsigned __int8 *)(a1 + 40) completionHandler:a2];
}

+ (void)addLastUsedPrinter:(id)a3 duplexMode:(id)a4 lastUsedSize:(CGSize)a5 forPhoto:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = (__CFString *)a4;
  v12 = [v10 browseInfo];
  int v13 = [v12 isEphemeral];

  if (v13)
  {
    uint64_t v14 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22EA54000, v14, OS_LOG_TYPE_INFO, "Not adding ephemeral printer to last used", buf, 2u);
    }
  }
  else
  {
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = [v10 uuid];

    if (v15)
    {
      v16 = [v10 uuid];
      [v14 setObject:v16 forKeyedSubscript:@"printer-uuid"];
    }
    uint64_t v17 = [v10 name];
    long long v39 = (void *)v17;
    if (v17) {
      [v14 setObject:v17 forKeyedSubscript:@"printer-dns-sd-name"];
    }
    uint64_t v18 = [v10 browseInfo];
    uint64_t v19 = [v18 bonjourName];
    uint64_t v20 = [v19 dataRepresentation];

    long long v38 = (void *)v20;
    if (v20) {
      [v14 setObject:v20 forKeyedSubscript:@"com.apple.printer-endpoint-data"];
    }
    uint64_t v21 = [v10 displayName];
    long long v37 = (void *)v21;
    if (v21) {
      [v14 setObject:v21 forKeyedSubscript:@"com.apple.printkit.printer-display-name"];
    }
    long long v22 = [v10 location];
    if (v22) {
      [v14 setObject:v22 forKeyedSubscript:@"com.apple.printkit.printer-location"];
    }
    BOOL v23 = [v10 printerURL];
    long long v24 = v23;
    if (v23)
    {
      long long v25 = [v23 absoluteString];
      [v14 setObject:v25 forKeyedSubscript:@"com.apple.printer-url"];
    }
    BOOL v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "type"));
    [v14 setObject:v26 forKeyedSubscript:@"com.apple.printer-type"];

    if (v11
      && (@"one-sided" == v11 || @"two-sided-long-edge" == v11 || @"two-sided-short-edge" == v11))
    {
      [v14 setObject:v11 forKeyedSubscript:@"sides"];
    }
    if ([v10 isFromMCProfile]) {
      [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"com.apple.mcprofile-added"];
    }
    if (v6)
    {
      [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"com.apple.was-last-used-printer-for-photo"];
      id v27 = PKPrinterLastUsedPhotoSizeKey;
    }
    else
    {
      [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"com.apple.was-last-used-printer-for-document"];
      id v27 = PKPrinterLastUsedDocumentSizeKey;
    }
    id v28 = *v27;
    if (width > 0.0 && height > 0.0)
    {
      v29 = pwgMediaForSize((const char *)(int)(width * 2540.0 / 72.0 + 0.5), (int)(height * 2540.0 / 72.0 + 0.5), (char *)buf);
      if (v29)
      {
        v30 = [NSString stringWithFormat:@"%@-pwg_reference", v28];
        v31 = [NSString stringWithUTF8String:*(void *)v29];
        [v14 setObject:v31 forKeyedSubscript:v30];

        LODWORD(v31) = *((_DWORD *)v29 + 7);
        double v32 = (double)*((int *)v29 + 6) * 72.0 / 2540.0;
        v40[0] = @"width";
        long long v33 = [NSNumber numberWithDouble:v32];
        v40[1] = @"height";
        v41[0] = v33;
        long long v34 = [NSNumber numberWithDouble:(double)(int)v31 * 72.0 / 2540.0];
        v41[1] = v34;
        long long v35 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
        [v14 setObject:v35 forKeyedSubscript:v28];
      }
      else
      {
        v42[0] = @"width";
        v30 = [NSNumber numberWithDouble:width];
        v42[1] = @"height";
        v43[0] = v30;
        long long v33 = [NSNumber numberWithDouble:height];
        v43[1] = v33;
        long long v34 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
        [v14 setObject:v34 forKeyedSubscript:v28];
      }
    }
    long long v36 = +[PKPrinterTool_Client sharedClient];
    [v36 setLastUsedPrintersForCurrentNetwork:v14];
  }
}

+ (NSArray)iCloudPrintersSync
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[PKPrinterTool_Client sharedClient];
  id v4 = a1;
  if (object_isClass(v4)) {
    [NSString stringWithUTF8String:"+[PKDefaults iCloudPrintersSync]"];
  }
  else {
  uint64_t v5 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v4, "+[PKDefaults iCloudPrintersSync]"];
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __32__PKDefaults_iCloudPrintersSync__block_invoke;
  v19[3] = &unk_2649EDE58;
  id v6 = v3;
  id v20 = v6;
  id v7 = withDebuggableSemaphore<NSArray<NSDictionary *> * {__strong}>(v5, v19, 10.0);

  int v8 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        int v13 = +[PKiCloudPrinter PKiCloudPrinterWithInfo:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v8 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v10);
  }

  return (NSArray *)v8;
}

uint64_t __32__PKDefaults_iCloudPrintersSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) getiCloudPrintersWithCompletionHandler:a2];
}

+ (void)getUpdatediCloudPrintersFromPrinterTool
{
  id v2 = +[PKPrinterTool_Client sharedClient];
  [v2 getiCloudPrintersWithCompletionHandler:&__block_literal_global_5];
}

void __53__PKDefaults_getUpdatediCloudPrintersFromPrinterTool__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v12 = a2;
  id obj = (id)objc_opt_new();
  BOOL v2 = +[PKDefaults mcProfilePrintersOnlyAllowed];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v12;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v8 = +[PKiCloudPrinter PKiCloudPrinterWithInfo:](PKiCloudPrinter, "PKiCloudPrinterWithInfo:", v7, v12);
        if (![v8 isFromMCProfile])
        {
          if (v2) {
            goto LABEL_11;
          }
LABEL_10:
          [obj addObject:v8];
          goto LABEL_11;
        }
        id v9 = [v7 objectForKeyedSubscript:@"printer-dns-sd-name"];
        BOOL v10 = +[PKDefaults uriMatchesMCProfileAdded:v9];

        if (v10) {
          goto LABEL_10;
        }
LABEL_11:
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  objc_storeStrong((id *)&_iCloudPrinters, obj);
  uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:@"com.apple.printkit.iCloudPrintersChanged.notification" object:0];
}

+ (NSArray)iCloudPrinters
{
  +[PKDefaults startiCloudListening];
  BOOL v2 = (void *)_iCloudPrinters;
  if (!_iCloudPrinters)
  {
    +[PKDefaults getUpdatediCloudPrintersFromPrinterTool];
    BOOL v2 = (void *)_iCloudPrinters;
  }

  return (NSArray *)v2;
}

+ (void)startiCloudListening
{
  if (+[PKDefaults startiCloudListening]::onceToken != -1) {
    dispatch_once(&+[PKDefaults startiCloudListening]::onceToken, &__block_literal_global_21);
  }
}

void __34__PKDefaults_startiCloudListening__block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)pk_iCloudPrintersChanged, @"com.apple.printerTool.iCloud-printers-changed", 0, (CFNotificationSuspensionBehavior)0);
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  id v1 = (id)[v2 addObserverForName:@"PRINTERTOOL_ICLOUDPRINTERS_CHANGED_NOTIFICATION" object:0 queue:0 usingBlock:&__block_literal_global_30_0];
}

uint64_t __34__PKDefaults_startiCloudListening__block_invoke_2()
{
  return +[PKDefaults getUpdatediCloudPrintersFromPrinterTool];
}

+ (void)setICloudPrinters:(id)a3
{
  id v5 = a3;
  +[PKDefaults startiCloudListening];
  objc_storeStrong((id *)&_iCloudPrinters, a3);
  uint64_t v4 = +[PKPrinterTool_Client sharedClient];
  [v4 setiCloudPrinters:v5];
}

+ (void)addPrinterToiCloud:(id)a3 displayName:(id)a4
{
}

+ (void)addPrinterToiCloud:(id)a3 displayName:(id)a4 location:(id)a5
{
  id v7 = +[PKiCloudPrinter PKiCloudPrinterWithPKPrinter:a3 displayName:a4 location:a5];
  id v5 = +[PKPrinterTool_Client sharedClient];
  [v5 addPrinterToiCloud:v7];
  id v6 = (void *)_iCloudPrinters;
  _iCloudPrinters = 0;
}

+ (void)removePrinterFromiCloud:(id)a3
{
  id v5 = a3;
  +[PKDefaults startiCloudListening];
  id v3 = +[PKPrinterTool_Client sharedClient];
  [v3 removePrinterFromiCloud:v5];
  uint64_t v4 = (void *)_iCloudPrinters;
  _iCloudPrinters = 0;
}

+ (void)updateiCloudPrinterDisplayName:(id)a3 displayName:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  +[PKDefaults startiCloudListening];
  if (v8)
  {
    id v6 = +[PKPrinterTool_Client sharedClient];
    [v6 updateiCloudPrinterDisplayName:v8 newDisplayName:v5];
    id v7 = (void *)_iCloudPrinters;
    _iCloudPrinters = 0;
  }
}

+ (void)updateiCloudPrinterLocation:(id)a3 location:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  +[PKDefaults startiCloudListening];
  if (v8)
  {
    id v6 = +[PKPrinterTool_Client sharedClient];
    [v6 updateiCloudPrinterLocation:v8 location:v5];
    id v7 = (void *)_iCloudPrinters;
    _iCloudPrinters = 0;
  }
}

+ (void)resetPKCloudData
{
  +[PKDefaults startiCloudListening];
  id v4 = +[PKPrinterTool_Client sharedClient];
  [v4 resetPKCloudData];
  id v2 = (void *)_iCloudPrinters;
  _iCloudPrinters = 0;

  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"com.apple.printkit.iCloudPrintersChanged.notification" object:0];
}

+ (void)seenPrintersCompletionHandler:(id)a3
{
  id v4 = a3;
  id v3 = +[PKPrinterTool_Client sharedClient];
  [v3 getLastUsedPrintersForCurrentNetworkCompletionHandler:v4];
}

+ (BOOL)urfIsOptional
{
  if (+[PKDefaults(PrintKitPrivate) urfIsOptional]::sOncePredicate != -1) {
    dispatch_once(&+[PKDefaults(PrintKitPrivate) urfIsOptional]::sOncePredicate, &__block_literal_global_60);
  }
  return +[PKDefaults(PrintKitPrivate) urfIsOptional]::optionalURF;
}

uint64_t __44__PKDefaults_PrintKitPrivate__urfIsOptional__block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"PrintKitOptionalURF", @".GlobalPreferences", 0);
  +[PKDefaults(PrintKitPrivate) urfIsOptional]::optionalURF = result != 0;
  return result;
}

+ (id)requiredPDL
{
  if (+[PKDefaults urfIsOptional]) {
    id v2 = 0;
  }
  else {
    id v2 = @"image/urf";
  }

  return v2;
}

+ (BOOL)ippsIsRequired
{
  if (+[PKDefaults(PrintKitPrivate) ippsIsRequired]::sOncePredicateIPPSRequired != -1) {
    dispatch_once(&+[PKDefaults(PrintKitPrivate) ippsIsRequired]::sOncePredicateIPPSRequired, &__block_literal_global_68);
  }
  return +[PKDefaults(PrintKitPrivate) ippsIsRequired]::ippsRequired;
}

void __45__PKDefaults_PrintKitPrivate__ippsIsRequired__block_invoke()
{
  id v0 = [(id)getMCProfileConnectionClass() sharedConnection];
  +[PKDefaults(PrintKitPrivate) ippsIsRequired]::ippsRequired = [v0 isAirPrintTrustedTLSRequirementEnforced];
}

+ (BOOL)mcProfilePrintersOnlyAllowed
{
  if (+[PKDefaults(PrintKitPrivate) mcProfilePrintersOnlyAllowed]::sOncePredicateProfileOnly != -1) {
    dispatch_once(&+[PKDefaults(PrintKitPrivate) mcProfilePrintersOnlyAllowed]::sOncePredicateProfileOnly, &__block_literal_global_70);
  }
  return +[PKDefaults(PrintKitPrivate) mcProfilePrintersOnlyAllowed]::onlyProfilePrintersAllowed;
}

void __59__PKDefaults_PrintKitPrivate__mcProfilePrintersOnlyAllowed__block_invoke()
{
  id v0 = [(id)getMCProfileConnectionClass() sharedConnection];
  char v1 = [v0 isAirPrintAllowed];

  +[PKDefaults(PrintKitPrivate) mcProfilePrintersOnlyAllowed]::onlyProfilePrintersAllowed = v1 ^ 1;
}

+ (BOOL)airPrintBeaconDiscoveryAllowed
{
  if (+[PKDefaults(PrintKitPrivate) airPrintBeaconDiscoveryAllowed]::sOncePredicateProfileOnly != -1) {
    dispatch_once(&+[PKDefaults(PrintKitPrivate) airPrintBeaconDiscoveryAllowed]::sOncePredicateProfileOnly, &__block_literal_global_72);
  }
  return +[PKDefaults(PrintKitPrivate) airPrintBeaconDiscoveryAllowed]::allowed;
}

void __61__PKDefaults_PrintKitPrivate__airPrintBeaconDiscoveryAllowed__block_invoke()
{
  id v0 = [(id)getMCProfileConnectionClass() sharedConnection];
  +[PKDefaults(PrintKitPrivate) airPrintBeaconDiscoveryAllowed]::allowed = [v0 isAirPrintiBeaconDiscoveryAllowed];
}

+ (BOOL)uriMatchesMCProfileAdded:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(id)getMCProfileConnectionClass() sharedConnection];
  id v5 = [v4 knownAirPrintIPPURLStrings];

  BOOL v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        if (v6 || (BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * i), ![v10 caseInsensitiveCompare:v3]))
        {
          BOOL v6 = 1;
        }
        else
        {
          uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"ipp://" withString:@"ipps://"];
          BOOL v6 = [v11 caseInsensitiveCompare:v3] == 0;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v6;
}

+ (id)absoluteSpoolDirectory
{
  id v3 = +[PKPrinterTool_Client sharedClient];
  id v4 = a1;
  if (object_isClass(v4)) {
    [NSString stringWithUTF8String:"+[PKDefaults(PrintKitPrivate) absoluteSpoolDirectory]"];
  }
  else {
  id v5 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v4, "+[PKDefaults(PrintKitPrivate) absoluteSpoolDirectory]"];
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__PKDefaults_PrintKitPrivate__absoluteSpoolDirectory__block_invoke;
  v9[3] = &unk_2649EDEC0;
  id v6 = v3;
  id v10 = v6;
  uint64_t v7 = withDebuggableSemaphore<NSURL * {__strong}>(v5, v9, 5.0);

  if (!v7)
  {
    uint64_t v7 = [NSURL fileURLWithPath:@"/private/var/tmp/" isDirectory:1];
  }

  return v7;
}

uint64_t __53__PKDefaults_PrintKitPrivate__absoluteSpoolDirectory__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "printerTool_realPathForTmp:", a2);
}

+ (void)setListenerProxy:(id)a3
{
}

+ (NSXPCListener)listenerProxy
{
  return (NSXPCListener *)(id)gProxyListener;
}

@end