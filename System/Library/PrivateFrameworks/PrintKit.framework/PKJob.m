@interface PKJob
+ (BOOL)supportsSecureCoding;
+ (id)currentJob;
+ (id)jobForJobID:(int64_t)a3;
+ (id)jobs;
+ (void)currentJobCompletionHandler:(id)a3;
+ (void)jobsCompletionHandler:(id)a3;
- (NSArray)jobPrinterStateReasons;
- (NSArray)jobStateReasons;
- (NSData)printerEndpointData;
- (NSData)thumbnailImage;
- (NSDate)timeAtCompleted;
- (NSDate)timeAtCreation;
- (NSDate)timeAtProcessing;
- (NSString)PIN;
- (NSString)jobPrinterStateMessage;
- (NSString)jobStateMessage;
- (NSString)localizedJobOptions;
- (NSString)localizedStatusString;
- (NSString)printerDisplayName;
- (NSString)printerLocation;
- (PKJob)initWithCoder:(id)a3;
- (PKJob)initWithJobID:(int)a3 updateState:(id)a4;
- (PKJob)initWithUserCodableDictionary:(id)a3;
- (PKMutableJobState)updatableState;
- (PKPrintSettings)settings;
- (PKPrinter)printer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)userCodableDictionary;
- (int64_t)localJobID;
- (int64_t)mediaProgress;
- (int64_t)mediaSheets;
- (int64_t)mediaSheetsCompleted;
- (int64_t)printerKind;
- (int64_t)remoteJobId;
- (int64_t)state;
- (int64_t)update;
- (void)_updateJobState:(id)a3;
- (void)_withPrinterAsync:(id)a3;
- (void)cancel;
- (void)encodeWithCoder:(id)a3;
- (void)updateCompletionHandler:(id)a3;
@end

@implementation PKJob

- (PKJob)initWithJobID:(int)a3 updateState:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKJob;
  v8 = [(PKJob *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_localJobID = a3;
    objc_storeStrong((id *)&v8->_updatableState, a4);
  }

  return v9;
}

- (PKJob)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKJob;
  v5 = [(PKJob *)&v9 init];
  if (v5)
  {
    v5->_localJobID = [v4 decodeIntForKey:@"_localJobID"];
    uint64_t v6 = [v4 decodeObjectForKey:@"_updatableState"];
    updatableState = v5->_updatableState;
    v5->_updatableState = (PKMutableJobState *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->_localJobID forKey:@"_localJobID"];
  [v4 encodeObject:self->_updatableState forKey:@"_updatableState"];
}

- (id)userCodableDictionary
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"localJobID";
  v3 = [NSNumber numberWithInt:self->_localJobID];
  v7[1] = @"updatableState";
  v8[0] = v3;
  id v4 = [(PKMutableJobState *)self->_updatableState userCodableDictionary];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (PKJob)initWithUserCodableDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKJob;
  v5 = [(PKJob *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"localJobID"];
    v5->_localJobID = [v6 intValue];

    id v7 = [PKMutableJobState alloc];
    v8 = [v4 objectForKeyedSubscript:@"updatableState"];
    uint64_t v9 = [(PKMutableJobState *)v7 initWithUserCodableDictionary:v8];
    updatableState = v5->_updatableState;
    v5->_updatableState = (PKMutableJobState *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t localJobID = self->_localJobID;
  uint64_t v6 = (void *)[(PKMutableJobState *)self->_updatableState copy];
  id v7 = (void *)[v4 initWithJobID:localJobID updateState:v6];

  return v7;
}

- (void)_withPrinterAsync:(id)a3
{
  id v7 = (void (**)(id, void))a3;
  id v4 = [(PKJob *)self updatableState];
  v5 = [v4 printerEndpointData];

  if (v5)
  {
    uint64_t v6 = +[PKPrinterBonjourEndpoint endpointWithData:v5];
    +[PKPrinter printerWithBonjourEndpoint:v6 discoveryTimeout:v7 completionHandler:1.0];
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (PKPrinter)printer
{
  cachedPrinter = self->_cachedPrinter;
  if (!cachedPrinter)
  {
    id v4 = self;
    if (object_isClass(v4)) {
      [NSString stringWithUTF8String:"-[PKJob printer]"];
    }
    else {
    v5 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v4, "-[PKJob printer]"];
    }

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __16__PKJob_printer__block_invoke;
    v9[3] = &unk_2649EE298;
    v9[4] = v4;
    withDebuggableSemaphore<PKPrinter * {__strong}>(v5, v9, 3.0);
    uint64_t v6 = (PKPrinter *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_cachedPrinter;
    self->_cachedPrinter = v6;

    cachedPrinter = self->_cachedPrinter;
  }

  return cachedPrinter;
}

uint64_t __16__PKJob_printer__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _withPrinterAsync:a2];
}

+ (id)jobForJobID:(int64_t)a3
{
  id v4 = a1;
  if (object_isClass(v4)) {
    [NSString stringWithUTF8String:"+[PKJob jobForJobID:]"];
  }
  else {
  v5 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v4, "+[PKJob jobForJobID:]"];
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __21__PKJob_jobForJobID___block_invoke;
  void v8[3] = &__block_descriptor_48_e22_v16__0___v____PKJob__8l;
  v8[4] = v4;
  v8[5] = a3;
  uint64_t v6 = withDebuggableSemaphore<PKJob * {__strong}>(v5, v8, 3.0);

  return v6;
}

void __21__PKJob_jobForJobID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __21__PKJob_jobForJobID___block_invoke_2;
  v7[3] = &unk_2649EE2C0;
  v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 jobsCompletionHandler:v7];
}

void __21__PKJob_jobForJobID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a2;
  id v4 = (id)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "localJobID", (void)v8) == *(void *)(a1 + 40))
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)jobsCompletionHandler:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  if (_initPrintKitNotificiations(void)::sOnce != -1) {
    dispatch_once(&_initPrintKitNotificiations(void)::sOnce, &__block_literal_global_328);
  }
  if (printd_running_token < 0 || (uint64_t state64 = 0, notify_get_state(printd_running_token, &state64)) || !state64)
  {
    v3[2](v3, 0);
  }
  else
  {
    id v4 = +[PKPrinterTool_Client sharedClient];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __31__PKJob_jobsCompletionHandler___block_invoke;
    v5[3] = &unk_2649EE328;
    id v6 = v3;
    [v4 getRecentJobsCompletionHandler:v5];
  }
}

void __31__PKJob_jobsCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  uint64_t v8 = [v5 count];
  if (v8 == [v6 count])
  {
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        long long v10 = [PKJob alloc];
        long long v11 = [v5 objectAtIndexedSubscript:i];
        uint64_t v12 = [v11 intValue];
        uint64_t v13 = [v6 objectAtIndexedSubscript:i];
        v14 = [(PKJob *)v10 initWithJobID:v12 updateState:v13];

        [v7 addObject:v14];
      }
    }
  }
  else
  {
    v15 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22EA54000, v15, OS_LOG_TYPE_ERROR, "number of jobs incorrect for number of states", buf, 2u);
    }
  }
  v16 = [v7 sortedArrayUsingComparator:&__block_literal_global_6];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __31__PKJob_jobsCompletionHandler___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = [v6 state];
  uint64_t v9 = [v7 state];
  uint64_t v10 = v8 > v9;
  if (v8 != v9) {
    uint64_t v10 = -1;
  }
  if (v8 < v9) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v10;
  }

  if (!v11)
  {
    uint64_t v12 = [v6 timeAtCreation];
    uint64_t v13 = [v7 timeAtCreation];
    uint64_t v11 = [v12 compare:v13];

    if (!v11)
    {
      id v14 = v6;
      id v15 = v7;
      uint64_t v16 = [v14 number];
      uint64_t v17 = [v15 number];
      if (v16 < v17) {
        uint64_t v11 = -1;
      }
      else {
        uint64_t v11 = v16 > v17;
      }
    }
  }

  return v11;
}

+ (void)currentJobCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__PKJob_currentJobCompletionHandler___block_invoke;
  v6[3] = &unk_2649EE378;
  id v7 = v4;
  id v5 = v4;
  [a1 jobsCompletionHandler:v6];
}

void __37__PKJob_currentJobCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  uint64_t v16 = (id *)&v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v7 state] <= 5)
        {
          objc_storeStrong(v16 + 5, v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__PKJob_currentJobCompletionHandler___block_invoke_29;
  void v8[3] = &unk_2649EE350;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = &v15;
  dispatch_async(MEMORY[0x263EF83A0], v8);

  _Block_object_dispose(&v15, 8);
}

uint64_t __37__PKJob_currentJobCompletionHandler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

+ (id)jobs
{
  id v2 = a1;
  if (object_isClass(v2)) {
    [NSString stringWithUTF8String:"+[PKJob jobs]"];
  }
  else {
  id v3 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v2, "+[PKJob jobs]"];
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __13__PKJob_jobs__block_invoke;
  v6[3] = &__block_descriptor_40_e24_v16__0___v____NSArray__8l;
  void v6[4] = v2;
  uint64_t v4 = withDebuggableSemaphore<NSArray * {__strong}>(v3, v6, 3.0);

  return v4;
}

uint64_t __13__PKJob_jobs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) jobsCompletionHandler:a2];
}

+ (id)currentJob
{
  id v2 = a1;
  if (object_isClass(v2)) {
    [NSString stringWithUTF8String:"+[PKJob currentJob]"];
  }
  else {
  id v3 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v2, "+[PKJob currentJob]"];
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __19__PKJob_currentJob__block_invoke;
  v6[3] = &__block_descriptor_40_e22_v16__0___v____PKJob__8l;
  void v6[4] = v2;
  uint64_t v4 = withDebuggableSemaphore<PKJob * {__strong}>(v3, v6, 3.0);

  return v4;
}

uint64_t __19__PKJob_currentJob__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) currentJobCompletionHandler:a2];
}

- (void)cancel
{
  id v3 = +[PKPrinterTool_Client sharedClient];
  objc_msgSend(v3, "cancelJob:", -[PKJob localJobID](self, "localJobID"));
}

- (void)_updateJobState:(id)a3
{
  id v9 = a3;
  updatableState = self->_updatableState;
  p_updatableState = &self->_updatableState;
  id v7 = [(PKMutableJobState *)updatableState thumbnailImage];
  objc_storeStrong((id *)p_updatableState, a3);
  uint64_t v8 = [(PKMutableJobState *)*p_updatableState thumbnailImage];

  if (!v8) {
    [(PKMutableJobState *)*p_updatableState setThumbnailImage:v7];
  }
}

- (void)updateCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PKPrinterTool_Client sharedClient];
  int64_t v6 = [(PKJob *)self localJobID];
  id v7 = [(PKMutableJobState *)self->_updatableState thumbnailImage];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__PKJob_updateCompletionHandler___block_invoke;
  v9[3] = &unk_2649EE3C0;
  id v8 = v4;
  v9[4] = self;
  id v10 = v8;
  [v5 getJobUpdateStatus:v6 includeThumbnail:v7 == 0 completionHandler:v9];
}

void __33__PKJob_updateCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    [*(id *)(a1 + 32) _updateJobState:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int64_t)update
{
  id v2 = self;
  if (object_isClass(v2)) {
    [NSString stringWithUTF8String:"-[PKJob update]"];
  }
  else {
  id v3 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v2, "-[PKJob update]"];
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __15__PKJob_update__block_invoke;
  v6[3] = &unk_2649EE3E8;
  void v6[4] = v2;
  int64_t v4 = withDebuggableSemaphore<PKStatus>(v3, v6, 3.0);

  return v4;
}

uint64_t __15__PKJob_update__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateCompletionHandler:a2];
}

- (int64_t)localJobID
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 localJobID];

  return v3;
}

- (NSString)printerDisplayName
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 printerDisplayName];

  return (NSString *)v3;
}

- (NSString)printerLocation
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 printerLocation];

  return (NSString *)v3;
}

- (int64_t)printerKind
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 printerKind];

  return v3;
}

- (PKPrintSettings)settings
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 settings];

  return (PKPrintSettings *)v3;
}

- (NSDate)timeAtCreation
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 timeAtCreation];

  return (NSDate *)v3;
}

- (int64_t)state
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 state];

  return v3;
}

- (int64_t)mediaSheetsCompleted
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 mediaSheetsCompleted];

  return v3;
}

- (NSDate)timeAtProcessing
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 timeAtProcessing];

  return (NSDate *)v3;
}

- (NSDate)timeAtCompleted
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 timeAtCompleted];

  return (NSDate *)v3;
}

- (int64_t)mediaSheets
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 mediaSheets];

  return v3;
}

- (int64_t)mediaProgress
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 mediaProgress];

  return v3;
}

- (int64_t)remoteJobId
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 remoteJobId];

  return v3;
}

- (NSString)PIN
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 PIN];

  return (NSString *)v3;
}

- (NSString)jobPrinterStateMessage
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 jobPrinterStateMessage];

  return (NSString *)v3;
}

- (NSArray)jobPrinterStateReasons
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 jobPrinterStateReasons];

  return (NSArray *)v3;
}

- (NSString)jobStateMessage
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 jobStateMessage];

  return (NSString *)v3;
}

- (NSArray)jobStateReasons
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 jobStateReasons];

  return (NSArray *)v3;
}

- (NSData)thumbnailImage
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 thumbnailImage];

  return (NSData *)v3;
}

- (NSData)printerEndpointData
{
  id v2 = [(PKJob *)self updatableState];
  int64_t v3 = [v2 printerEndpointData];

  return (NSData *)v3;
}

- (NSString)localizedStatusString
{
  int64_t v3 = [(PKJob *)self state];
  int64_t v4 = v3;
  if (v3 == 10 || v3 == 5)
  {
    uint64_t v5 = self;
    uint64_t v6 = [(PKJob *)v5 mediaSheetsCompleted];
    uint64_t v7 = (v6 & ~(v6 >> 63)) + 1;
    if ([(PKJob *)v5 mediaSheets] >= 1 && v7 >= [(PKJob *)v5 mediaSheets]) {
      uint64_t v7 = [(PKJob *)v5 mediaSheets];
    }
    id v8 = (void *)MEMORY[0x263F08A30];
    id v9 = [NSNumber numberWithInteger:v7];
    id v10 = [v8 localizedStringFromNumber:v9 numberStyle:0];
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;
  int64_t v12 = v4 - 3;
  long long v13 = "Printer status - Hold";
  long long v14 = @"Hold";
  switch(v12)
  {
    case 0:
LABEL_10:
      long long v13 = "Printer status - Waiting";
      long long v14 = @"Waiting";
      goto LABEL_16;
    case 1:
      goto LABEL_16;
    case 2:
    case 7:

      long long v13 = "Printer status - Hold";
      long long v14 = @"Hold";
      switch(v12)
      {
        case 0:
          goto LABEL_10;
        case 1:
          goto LABEL_16;
        case 2:
          v19 = self;
          if ([(PKJob *)v19 mediaSheets] < 1)
          {
            uint64_t v17 = 0;
          }
          else
          {
            uint64_t v20 = [(PKJob *)v19 mediaSheets];
            v21 = (void *)MEMORY[0x263F08A30];
            uint64_t v22 = [NSNumber numberWithInteger:v20];
            uint64_t v17 = [v21 localizedStringFromNumber:v22 numberStyle:0];
          }
          if (v17) {
            PKLocalizedString(&cfstr_PrintingOf.isa, "Value for print status panel printing page <n> of <m>");
          }
          else {
          uint64_t v15 = PKLocalizedString(&cfstr_PrintingPage.isa, " Value for print status panel printing page <n>");
          }
          if (v15)
          {
            uint64_t v16 = [NSString stringWithValidatedFormat:v15, @"%@ %@", 0, v11, v17 validFormatSpecifiers error];
          }
          else
          {
            uint64_t v16 = 0;
          }
          break;
        case 3:
          goto LABEL_12;
        case 4:
          goto LABEL_13;
        case 5:
          goto LABEL_14;
        case 6:
          goto LABEL_15;
        case 7:
          v23 = PKLocalizedString(&cfstr_CancelingPage.isa, "Printer status - Canceling page <n>");
          uint64_t v16 = [NSString stringWithValidatedFormat:v23, @"%@", 0, v11 validFormatSpecifiers error];

          uint64_t v15 = 0;
          uint64_t v17 = 0;
          break;
        default:
          goto LABEL_11;
      }
      goto LABEL_17;
    case 3:
LABEL_12:
      long long v13 = "Printer status - Stopped";
      long long v14 = @"Stopped";
      goto LABEL_16;
    case 4:
LABEL_13:
      long long v13 = "Printer status - Canceled";
      long long v14 = @"Canceled";
      goto LABEL_16;
    case 5:
LABEL_14:
      long long v13 = "Printer status - Failed";
      long long v14 = @"Failed";
      goto LABEL_16;
    case 6:
LABEL_15:
      long long v13 = "Printer status - Finished";
      long long v14 = @"Finished";
      goto LABEL_16;
    default:
LABEL_11:
      long long v13 = "Printer status - Unknown";
      long long v14 = @"Unknown";
LABEL_16:
      uint64_t v15 = 0;
      uint64_t v16 = PKLocalizedString(&v14->isa, v13);
      uint64_t v17 = 0;
LABEL_17:

      return (NSString *)v16;
  }
}

- (NSString)localizedJobOptions
{
  v45[3] = *MEMORY[0x263EF8340];
  v38 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  int64_t v3 = [(PKJob *)self settings];
  int64_t v4 = [v3 duplex];
  if (v4)
  {
    uint64_t v5 = [(PKJob *)self settings];
    uint64_t v6 = [v5 duplex];
    char v7 = [v6 isEqualToString:@"one-sided"];

    if ((v7 & 1) == 0)
    {
      v39 = PKLocalizedString(&cfstr_DoubleSided.isa, "Label for double sided printing");
      [v38 addObject:v39];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v39 = PKLocalizedString(&cfstr_SingleSided.isa, "Label for single sided printing");
  [v38 addObject:v39];
LABEL_6:
  id v8 = [(PKJob *)self settings];
  id v9 = [v8 outputMode];

  if (v9)
  {
    id v10 = [(PKJob *)self settings];
    id v11 = [v10 outputMode];

    v45[0] = @"monochrome";
    v45[1] = @"auto-monochrome";
    v45[2] = @"process-monochrome";
    int64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
    if ([v12 containsObject:v11]) {
      PKLocalizedString(&cfstr_BlackWhite.isa, "Label for black & white (grayscale) printing");
    }
    else {
    uint64_t v13 = PKLocalizedString(&cfstr_Color.isa, "Label for color printing");
    }

    [v38 addObject:v13];
    v39 = (void *)v13;
  }
  long long v14 = [(PKJob *)self settings];
  uint64_t v15 = [v14 finishings];
  BOOL v16 = v15 == 0;

  if (!v16)
  {
    uint64_t v17 = [(PKJob *)self settings];
    v18 = [v17 finishings];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v20)
    {
      v37 = self;
      int v21 = 0;
      int v22 = 0;
      uint64_t v23 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v41 != v23) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          v21 |= [&unk_26E264F88 containsObject:v25];
          v22 |= [&unk_26E264FA0 containsObject:v25];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v20);

      self = v37;
      if (v21)
      {
        uint64_t v26 = PKLocalizedString(&cfstr_Staple.isa, "The printer will staple the job");

        v39 = (void *)v26;
        [v38 addObject:v26];
      }
      if (v22)
      {
        uint64_t v27 = PKLocalizedString(&cfstr_Punch.isa, "The printer will hole-punch the job");

        v39 = (void *)v27;
        [v38 addObject:v27];
      }
    }
    else
    {
    }
  }
  v28 = [(PKJob *)self settings];
  v29 = [v28 paper];
  BOOL v30 = v29 == 0;

  if (!v30)
  {
    v31 = [(PKJob *)self settings];
    v32 = [v31 paper];

    v33 = [v32 localizedName];
    if (v33) {
      [v38 addObject:v33];
    }
  }
  v34 = PKLocalizedString(&stru_26E25BED0.isa, "localized comma for joining strings");
  v35 = [v38 componentsJoinedByString:v34];

  return (NSString *)v35;
}

- (PKMutableJobState)updatableState
{
  return (PKMutableJobState *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatableState, 0);

  objc_storeStrong((id *)&self->_cachedPrinter, 0);
}

@end