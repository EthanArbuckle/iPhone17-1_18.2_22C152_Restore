@interface PKPrinter
+ (BOOL)printerLookupWithName:(id)a3 andTimeout:(double)a4;
+ (PKPrinter)printerWithBonjourEndpoint:(id)a3 discoveryTimeout:(double)a4 completionHandler:(id)a5;
+ (PKPrinter)printerWithEndpointData:(id)a3 discoveryTime:(double)a4 completionHandler:(id)a5;
+ (PKPrinter)printerWithName:(id)a3;
+ (PKPrinter)printerWithName:(id)a3 discoveryTimeout:(double)a4;
+ (PKPrinter)printerWithName:(id)a3 discoveryTimeout:(double)a4 completionHandler:(id)a5;
+ (PKPrinter)printerWithURL:(id)a3 discoveryTimeout:(double)a4 completionHandler:(id)a5;
+ (PKPrinter)printerWithiCloudPrinter:(id)a3 discoveryTime:(double)a4 completionHandler:(id)a5;
- (BOOL)_allowedToPrintToThisPrinter;
- (BOOL)hasIdentifyPrinterOp;
- (BOOL)hasPrintInfoSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMCProfile;
- (BOOL)isPaperReady:(id)a3;
- (BOOL)isiCloudPrinter;
- (BOOL)knowsReadyPaperList;
- (BOOL)supportsColor;
- (BOOL)supportsDuplex;
- (BOOL)supportsJobAccountID;
- (NSData)printerImageData;
- (NSDate)lastUsedDate;
- (NSDictionary)printInfoSupported;
- (NSString)bonjourDisplayName;
- (NSString)displayName;
- (NSString)location;
- (NSString)makeAndModel;
- (NSString)name;
- (NSString)uuid;
- (NSURL)printerURL;
- (PKPrinterBrowseInfo)browseInfo;
- (id)availableRollPapersPreferBorderless:(BOOL)a3;
- (id)bonjourName;
- (id)debugDescription;
- (id)initPKPrinterWithBrowseInfo:(id)a3;
- (id)matchedPaper:(id)a3 preferBorderless:(BOOL)a4 withDuplexMode:(id)a5 didMatch:(BOOL *)a6;
- (id)paperListForDuplexMode:(id)a3;
- (id)papersForDocumentWithSize:(CGSize)a3 andDuplex:(BOOL)a4;
- (id)papersForDocumentWithSize:(CGSize)a3 scaleUpOnRoll:(BOOL)a4 andDuplex:(BOOL)a5;
- (id)papersForPhotoWithSize:(CGSize)a3;
- (int64_t)accessState;
- (int64_t)jobAccountIDSupport;
- (int64_t)kind;
- (int64_t)sendData:(const char *)a3 ofLength:(int64_t)a4;
- (int64_t)startJob:(id)a3 ofType:(id)a4;
- (int64_t)type;
- (unint64_t)jobTypesSupported;
- (void)_checkAvailable:(double)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)_identifySelf:(id)a3;
- (void)_setInitialAccessStateFromBrowseInfo;
- (void)_updateAccessState:(int64_t)a3;
- (void)_updateDescription:(id)a3 browseInfo:(id)a4;
- (void)_updateiCloudPrinterInfo;
- (void)abortJobCompletionHandler:(id)a3;
- (void)cancelUnlock;
- (void)finalizeJob:(BOOL)a3 completionHandler:(id)a4;
- (void)finishJobCompletionHandler:(id)a3;
- (void)getSupplyLevels:(id)a3;
- (void)identifySelf;
- (void)pollForPrinterAttributes:(id)a3 completionHandler:(id)a4;
- (void)pollForPrinterStatusQueue:(id)a3 completionHandler:(id)a4;
- (void)printURL:(id)a3 ofType:(id)a4 printSettings:(id)a5 completionHandler:(id)a6;
- (void)printURL:(id)a3 ofType:(id)a4 printSettings:(id)a5 completionHandlerWithLocalJobNumber:(id)a6;
- (void)removeCredentialsFromKeychain;
- (void)unlockWithCompletionHandler:(id)a3;
- (void)withDescriptionAsync:(id)a3;
@end

@implementation PKPrinter

- (PKPrinterBrowseInfo)browseInfo
{
  return self->_browseInfo;
}

- (id)initPKPrinterWithBrowseInfo:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPrinter;
  v6 = [(PKPrinter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_browseInfo, a3);
    printerDescription = v7->_printerDescription;
    v7->_printerDescription = 0;

    [(PKPrinter *)v7 _setInitialAccessStateFromBrowseInfo];
    [(PKPrinter *)v7 _updateiCloudPrinterInfo];
  }

  return v7;
}

- (BOOL)_allowedToPrintToThisPrinter
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(PKPrinterBrowseInfo *)self->_browseInfo isIPPS]
    || !+[PKDefaults ippsIsRequired])
  {
    if (!+[PKDefaults mcProfilePrintersOnlyAllowed]) {
      return 1;
    }
    id v5 = [(PKPrinter *)self printerURL];
    v6 = [v5 absoluteString];
    BOOL v7 = +[PKDefaults uriMatchesMCProfileAdded:v6];

    if (v7) {
      return 1;
    }
    v3 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      objc_super v10 = self;
      __int16 v11 = 2080;
      v12 = "";
      v4 = "%@: managed configuration requires only known printers%s";
      goto LABEL_10;
    }
  }
  else
  {
    v3 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      objc_super v10 = self;
      __int16 v11 = 2080;
      v12 = "";
      v4 = "%@: ipps is required for this printer%s";
LABEL_10:
      _os_log_impl(&dword_22EA54000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v9, 0x16u);
    }
  }

  return 0;
}

+ (PKPrinter)printerWithURL:(id)a3 discoveryTimeout:(double)a4 completionHandler:(id)a5
{
  id v10 = a5;
  v8 = +[PKPrinterBonjourEndpoint endpointWithURL:a3];
  [a1 printerWithBonjourEndpoint:v8 discoveryTimeout:v10 completionHandler:a4];

  return result;
}

+ (PKPrinter)printerWithName:(id)a3 discoveryTimeout:(double)a4 completionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = (void (**)(id, void))a5;
  if (([v8 hasPrefix:@"ipp:"] & 1) != 0
    || ([v8 hasPrefix:@"ipps:"] & 1) != 0)
  {
    id v10 = PKURLWithString(v8);
    if (v10)
    {
      __int16 v11 = +[PKPrinterBonjourEndpoint endpointWithURL:v10];
    }
    else
    {
      __int16 v11 = 0;
    }

    if (v11) {
      goto LABEL_7;
    }
  }
  else
  {
    __int16 v11 = +[PKPrinterBonjourEndpoint endpointWithBonjourString:v8];
    if (v11)
    {
LABEL_7:
      [a1 printerWithBonjourEndpoint:v11 discoveryTimeout:v9 completionHandler:a4];
      goto LABEL_12;
    }
  }
  v12 = _PKLogCategory(PKLogCategoryFramework);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    id v15 = a1;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2080;
    v19 = "";
    _os_log_impl(&dword_22EA54000, v12, OS_LOG_TYPE_DEFAULT, "%@: Couldn't create a bonjour endpoint from '%@'%s", (uint8_t *)&v14, 0x20u);
  }

  v9[2](v9, 0);
LABEL_12:

  return result;
}

+ (PKPrinter)printerWithBonjourEndpoint:(id)a3 discoveryTimeout:(double)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = dispatch_get_global_queue(0, 0);
  id v9 = a3;
  dispatch_async(v8, &__block_literal_global_10);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__PKPrinter_printerWithBonjourEndpoint_discoveryTimeout_completionHandler___block_invoke_2;
  v12[3] = &unk_2649EEB08;
  id v13 = v7;
  id v10 = v7;
  +[PKPrinterBrowseInfo findPrinterWithBonjourEndpoint:v9 withTimeout:v12 completionHandler:a4];

  return result;
}

id __75__PKPrinter_printerWithBonjourEndpoint_discoveryTimeout_completionHandler___block_invoke()
{
  return +[PKDefaults iCloudPrinters];
}

void __75__PKPrinter_printerWithBonjourEndpoint_discoveryTimeout_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && ([v3 _allowedToPrintToThisPrinter] & 1) != 0)
  {
    [v3 _updateiCloudPrinterInfo];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (PKPrinter)printerWithEndpointData:(id)a3 discoveryTime:(double)a4 completionHandler:(id)a5
{
  id v10 = (void (**)(id, void))a5;
  id v8 = +[PKPrinterBonjourEndpoint endpointWithData:a3];
  if (v8) {
    [a1 printerWithBonjourEndpoint:v8 discoveryTimeout:v10 completionHandler:a4];
  }
  else {
    v10[2](v10, 0);
  }

  return result;
}

+ (PKPrinter)printerWithiCloudPrinter:(id)a3 discoveryTime:(double)a4 completionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = [[PKCloudResolveContext alloc] initWithPKCloudPrinter:v7 timeout:v8 completionHandler:a4];
  id v10 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [v7 displayName];
    int v13 = 138412546;
    int v14 = v9;
    __int16 v15 = 2112;
    __int16 v16 = v11;
    _os_log_impl(&dword_22EA54000, v10, OS_LOG_TYPE_DEFAULT, "Created icloud resolution context %@ for %@", (uint8_t *)&v13, 0x16u);
  }
  [(PKCloudResolveContext *)v9 start];

  return result;
}

+ (PKPrinter)printerWithName:(id)a3
{
  id v3 = [a1 printerWithName:a3 discoveryTimeout:2.0];

  return (PKPrinter *)v3;
}

+ (PKPrinter)printerWithName:(id)a3 discoveryTimeout:(double)a4
{
  id v6 = a3;
  id v7 = a1;
  if (object_isClass(v7)) {
    [NSString stringWithUTF8String:"+[PKPrinter printerWithName:discoveryTimeout:]"];
  }
  else {
  id v8 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v7, "+[PKPrinter printerWithName:discoveryTimeout:]"];
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__PKPrinter_printerWithName_discoveryTimeout___block_invoke;
  v12[3] = &unk_2649EEB30;
  id v14 = v7;
  id v9 = v6;
  id v13 = v9;
  double v15 = a4;
  id v10 = withDebuggableSemaphore<PKPrinter * {__strong}>(v8, v12, a4);

  return (PKPrinter *)v10;
}

uint64_t __46__PKPrinter_printerWithName_discoveryTimeout___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) printerWithName:*(void *)(a1 + 32) discoveryTimeout:a2 completionHandler:*(double *)(a1 + 48)];
}

+ (BOOL)printerLookupWithName:(id)a3 andTimeout:(double)a4
{
  v4 = [a1 printerWithName:a3 discoveryTimeout:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v5 = v4;
    id v6 = [(PKPrinter *)self uuid];
    id v7 = [v5 uuid];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_updateDescription:(id)a3 browseInfo:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (v10) {
    objc_storeStrong((id *)&self->_printerDescription, a3);
  }
  if (v7) {
    objc_storeStrong((id *)&self->_browseInfo, a4);
  }
  char v8 = [MEMORY[0x263EFF910] date];
  printerDescriptionTime = self->_printerDescriptionTime;
  self->_printerDescriptionTime = v8;
}

- (void)_updateiCloudPrinterInfo
{
  id v3 = +[PKDefaults iCloudPrinters];
  id v4 = v3;
  if (v3)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__PKPrinter__updateiCloudPrinterInfo__block_invoke;
    v8[3] = &unk_2649EEB58;
    v8[4] = self;
    uint64_t v5 = [v3 indexOfObjectPassingTest:v8];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      iCloudPrinter = self->_iCloudPrinter;
      self->_iCloudPrinter = 0;
    }
    else
    {
      id v7 = [v4 objectAtIndexedSubscript:v5];
      iCloudPrinter = self->_iCloudPrinter;
      self->_iCloudPrinter = v7;
    }
  }
}

uint64_t __37__PKPrinter__updateiCloudPrinterInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqual:a2];
}

- (void)withDescriptionAsync:(id)a3
{
  id v4 = (void (**)(id, PKPrinterDescription *))a3;
  uint64_t v5 = self->_printerDescription;
  if (v5)
  {
    id v6 = [MEMORY[0x263EFF910] date];
    [v6 timeIntervalSinceDate:self->_printerDescriptionTime];
    if (v7 > 5.0)
    {
      char v8 = _PKLogCategory(PKLogCategoryFramework);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22EA54000, v8, OS_LOG_TYPE_DEFAULT, "refreshing printer description after timeout", buf, 2u);
      }

      id v9 = [v6 addTimeInterval:60.0];
      printerDescriptionTime = self->_printerDescriptionTime;
      self->_printerDescriptionTime = v9;

      __int16 v11 = [(PKPrinter *)self bonjourName];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __34__PKPrinter_withDescriptionAsync___block_invoke;
      v15[3] = &unk_2649EEB80;
      v15[4] = self;
      PrintdRPC::GetPrinterDescription(v11, 0, v15);
    }
    v4[2](v4, v5);
  }
  else
  {
    v12 = [(PKPrinter *)self bonjourName];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __34__PKPrinter_withDescriptionAsync___block_invoke_2;
    v13[3] = &unk_2649EEBA8;
    v13[4] = self;
    id v14 = v4;
    PrintdRPC::GetPrinterDescription(v12, 0, v13);
  }
}

uint64_t __34__PKPrinter_withDescriptionAsync___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateDescription:a2 browseInfo:a3];
}

void __34__PKPrinter_withDescriptionAsync___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _updateDescription:v6 browseInfo:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = [(PKPrinter *)self description];
  id v5 = (void *)v4;
  if (self->_printerDescription) {
    id v6 = ", has_desc";
  }
  else {
    id v6 = "";
  }
  double v7 = [v3 stringWithFormat:@"%@ { %@%s }", v4, self->_browseInfo, v6];

  return v7;
}

- (NSURL)printerURL
{
  id v3 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
  uint64_t v4 = self;
  if (object_isClass(v4)) {
    [NSString stringWithUTF8String:"-[PKPrinter printerURL]"];
  }
  else {
  id v5 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v4, "-[PKPrinter printerURL]"];
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __23__PKPrinter_printerURL__block_invoke;
  v9[3] = &unk_2649EDEC0;
  id v6 = v3;
  id v10 = v6;
  double v7 = withDebuggableSemaphore<NSURL * {__strong}>(v5, v9, 5.0);

  return (NSURL *)v7;
}

uint64_t __23__PKPrinter_printerURL__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) withResolvedURL:a2];
}

- (NSString)name
{
  v2 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
  id v3 = [v2 persistentNameRepresentationForPrintKitUI];

  return (NSString *)v3;
}

- (id)bonjourName
{
  return [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
}

- (NSString)bonjourDisplayName
{
  v2 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
  uint64_t v3 = [v2 displayNameForPrintKitUI];

  if (v3) {
    uint64_t v4 = (__CFString *)v3;
  }
  else {
    uint64_t v4 = &stru_26E251B90;
  }

  return (NSString *)v4;
}

- (NSString)displayName
{
  uint64_t v3 = [(PKiCloudPrinter *)self->_iCloudPrinter displayName];
  if (!v3)
  {
    id v5 = [(PKPrinter *)self bonjourDisplayName];
    if (v5)
    {
      uint64_t v3 = v5;
      uint64_t v7 = [(__CFString *)v5 rangeOfString:@" @ "];
      if (v7 != 0x7FFFFFFFFFFFFFFFLL && v6)
      {
        uint64_t v8 = [(__CFString *)v3 substringToIndex:v7];

        uint64_t v3 = (__CFString *)v8;
      }
    }
    else
    {
      uint64_t v3 = &stru_26E251B90;
    }
  }

  return (NSString *)v3;
}

- (NSString)location
{
  uint64_t v3 = [(PKiCloudPrinter *)self->_iCloudPrinter location];
  if (!v3)
  {
    uint64_t v3 = [(PKPrinterBrowseInfo *)self->_browseInfo location];
    if (!v3)
    {
      uint64_t v4 = [(PKPrinter *)self bonjourDisplayName];
      uint64_t v5 = [v4 rangeOfString:@" @ "];
      uint64_t v3 = 0;
      if (v5 != 0x7FFFFFFFFFFFFFFFLL && v6)
      {
        uint64_t v3 = [v4 substringFromIndex:v5 + v6];
      }
    }
  }

  return (NSString *)v3;
}

- (BOOL)isiCloudPrinter
{
  return self->_iCloudPrinter != 0;
}

- (NSDate)lastUsedDate
{
  return [(PKiCloudPrinter *)self->_iCloudPrinter lastUsedDate];
}

- (NSData)printerImageData
{
  return [(PKiCloudPrinter *)self->_iCloudPrinter printerImageData];
}

- (NSString)makeAndModel
{
  return [(PKPrinterBrowseInfo *)self->_browseInfo makeAndModel];
}

- (NSString)uuid
{
  v2 = [(PKPrinterBrowseInfo *)self->_browseInfo uuid];
  uint64_t v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (BOOL)isFromMCProfile
{
  uint64_t v3 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
  if ([v3 provenance] == 1)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(PKPrinter *)self printerURL];
    uint64_t v6 = [v5 absoluteString];
    BOOL v4 = +[PKDefaults uriMatchesMCProfileAdded:v6];
  }
  return v4;
}

- (int64_t)type
{
  return [(PKPrinterBrowseInfo *)self->_browseInfo type];
}

- (int64_t)kind
{
  v2 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
  if ([v2 provenance] == 8) {
    int64_t v3 = 3;
  }
  else {
    int64_t v3 = 4;
  }

  return v3;
}

- (BOOL)supportsJobAccountID
{
  return (unint64_t)([(PKPrinter *)self jobAccountIDSupport] - 1) < 2;
}

- (int64_t)jobAccountIDSupport
{
  int64_t result = (int64_t)self->_printerDescription;
  if (result) {
    return [(id)result jobAccountIDSupport];
  }
  return result;
}

- (unint64_t)jobTypesSupported
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [(PKPrinterBrowseInfo *)self->_browseInfo txtRecord];
  int64_t v3 = [v2 objectForKey:@"kind"];

  if (v3)
  {
    BOOL v4 = [v3 lowercaseString];
    uint64_t v5 = [v4 componentsSeparatedByString:@","];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          __int16 v11 = objc_msgSend(&unk_26E263BD0, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v10), (void)v14);
          v12 = v11;
          if (v11) {
            v7 |= [v11 unsignedIntValue];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)hasPrintInfoSupported
{
  return self->_printerDescription != 0;
}

- (NSDictionary)printInfoSupported
{
  v2 = self;
  if (object_isClass(v2)) {
    [NSString stringWithUTF8String:"-[PKPrinter printInfoSupported]"];
  }
  else {
  int64_t v3 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v2, "-[PKPrinter printInfoSupported]"];
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__PKPrinter_printInfoSupported__block_invoke;
  v6[3] = &unk_2649EEBF8;
  v6[4] = v2;
  BOOL v4 = withDebuggableSemaphore<NSDictionary * {__strong}>(v3, v6, 5.0);

  return (NSDictionary *)v4;
}

void __31__PKPrinter_printInfoSupported__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__PKPrinter_printInfoSupported__block_invoke_2;
  v6[3] = &unk_2649EEBD0;
  id v7 = v3;
  id v5 = v3;
  [v4 withDescriptionAsync:v6];
}

void __31__PKPrinter_printInfoSupported__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 printInfoSupportedDictionary];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (BOOL)hasIdentifyPrinterOp
{
  return [(PKPrinterDescription *)self->_printerDescription identifyActions] != 0;
}

- (void)identifySelf
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __25__PKPrinter_identifySelf__block_invoke;
  v3[3] = &unk_2649EEC20;
  objc_copyWeak(&v4, &location);
  [(PKPrinter *)self withDescriptionAsync:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __25__PKPrinter_identifySelf__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _identifySelf:v5];

    id v3 = v5;
  }
}

- (void)_identifySelf:(id)a3
{
  id v9 = a3;
  id v4 = objc_opt_new();
  if (([v9 identifyActions] & 1) != 0
    && (PKLocalizedString(&cfstr_AirprintReady.isa, "AirPrint ready message to be shown on printer"),
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    [v4 addObject:@"display"];
  }
  else
  {
    id v6 = 0;
  }
  if (([v9 identifyActions] & 2) != 0) {
    [v4 addObject:@"flash"];
  }
  if (([v9 identifyActions] & 4) != 0) {
    [v4 addObject:@"sound"];
  }
  id v7 = [(PKPrinter *)self browseInfo];
  uint64_t v8 = [v7 bonjourName];
  PrintdRPC::IdentifyPrinter(v8, v6, v4);
}

- (void)_updateAccessState:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = _PKLogCategory(PKLogCategoryFramework);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t accessState = self->_accessState;
    int v7 = 138413058;
    uint64_t v8 = self;
    __int16 v9 = 1024;
    int v10 = accessState;
    __int16 v11 = 1024;
    int v12 = a3;
    __int16 v13 = 2080;
    long long v14 = "";
    _os_log_impl(&dword_22EA54000, v5, OS_LOG_TYPE_DEFAULT, "%@: _accessState %d to %d%s", (uint8_t *)&v7, 0x22u);
  }

  self->_int64_t accessState = a3;
}

- (void)unlockWithCompletionHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _PKLogCategory(PKLogCategoryFramework);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t accessState = self->_accessState;
    *(_DWORD *)buf = 138412802;
    long long v17 = self;
    __int16 v18 = 1024;
    int v19 = accessState;
    __int16 v20 = 2080;
    v21 = "";
    _os_log_impl(&dword_22EA54000, v5, OS_LOG_TYPE_DEFAULT, "%@: unlockWithCompletionHandler current accessState=%d%s", buf, 0x1Cu);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__PKPrinter_unlockWithCompletionHandler___block_invoke;
  v14[3] = &unk_2649EEC48;
  id v7 = v4;
  id v15 = v7;
  uint64_t v8 = MEMORY[0x230FA9020](v14);
  __int16 v9 = (void *)v8;
  if (self->_accessState <= 0)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    int v10 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__PKPrinter_unlockWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_2649EEC70;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v9;
    PrintdRPC::CheckAccessStateAsync(v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __41__PKPrinter_unlockWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__PKPrinter_unlockWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_2649EDCF0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __41__PKPrinter_unlockWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __41__PKPrinter_unlockWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v4);
    [v6 _updateAccessState:a2];
  }
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v7();
}

- (void)cancelUnlock
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = _PKLogCategory(PKLogCategoryFramework);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412546;
    uint64_t v5 = self;
    __int16 v6 = 2080;
    id v7 = "";
    _os_log_impl(&dword_22EA54000, v3, OS_LOG_TYPE_DEFAULT, "%@: cancelUnlock%s", (uint8_t *)&v4, 0x16u);
  }

  PKCancelAlert(&cfstr_Cancelunlock.isa);
}

- (void)removeCredentialsFromKeychain
{
  id v3 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
  PrintdRPC::RemoveKeychainItem(v3, v4);

  [(PKPrinter *)self _setInitialAccessStateFromBrowseInfo];
}

- (void)_setInitialAccessStateFromBrowseInfo
{
  id v3 = [(PKPrinterBrowseInfo *)self->_browseInfo txtRecord];
  id v6 = [v3 objectForKeyedSubscript:@"air"];

  int v4 = v6;
  if (v6)
  {
    int64_t v5 = [v6 isEqualToString:@"none"] ^ 1;
    int v4 = v6;
  }
  else
  {
    int64_t v5 = 0;
  }
  self->_int64_t accessState = v5;
}

- (void)_checkAvailable:(double)a3 queue:(id)a4 completionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v8 = a4;
  id v9 = a5;
  int v10 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
  int v11 = [v10 provenance];

  if (v11 == 2)
  {
    id v12 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
      long long v14 = [v13 provenanceIdentifier];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2080;
      v26 = (uint64_t (*)(uint64_t, uint64_t))"";
      _os_log_impl(&dword_22EA54000, v12, OS_LOG_TYPE_DEFAULT, "%@: extension printer (%{public}@) always available%s", buf, 0x20u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke;
    block[3] = &unk_2649EEC98;
    id v24 = v9;
    dispatch_async(v8, block);
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v26 = __Block_byref_object_copy__6;
    v27 = __Block_byref_object_dispose__6;
    id v28 = (id)MEMORY[0x230FA9020](v9);
    id v15 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v8);
    dispatch_time_t v16 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke_111;
    handler[3] = &unk_2649EECC0;
    handler[4] = buf;
    dispatch_source_set_event_handler(v15, handler);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke_2;
    v21[3] = &unk_2649EECC0;
    v21[4] = buf;
    dispatch_source_set_cancel_handler(v15, v21);
    long long v17 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke_3;
    v19[3] = &unk_2649EECE8;
    v19[4] = self;
    __int16 v18 = v15;
    __int16 v20 = v18;
    PrintdRPC::GetPrinterDescription(v17, 1, v19);

    dispatch_resume(v18);
    _Block_object_dispose(buf, 8);
  }
}

uint64_t __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke_111(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _updateDescription:a2 browseInfo:a3];
  int v4 = *(NSObject **)(a1 + 40);

  dispatch_source_cancel(v4);
}

- (void)pollForPrinterAttributes:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(PKPrinter *)self bonjourName];
  PrintdRPC::QueryPrinterWithAttributess(v7, v8, v6);
}

- (void)pollForPrinterStatusQueue:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v9 = _PKLogCategory(PKLogCategoryFramework);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int v19 = self;
    _os_log_impl(&dword_22EA54000, v9, OS_LOG_TYPE_DEFAULT, "PKPrinter<%p>: pollForPrinterStatusQueue: start", buf, 0xCu);
  }

  int v11 = PrinterStatusQueuePoll::requestedAttributess(v10);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__PKPrinter_pollForPrinterStatusQueue_completionHandler___block_invoke;
  v14[3] = &unk_2649EED10;
  void v14[4] = self;
  CFAbsoluteTime v17 = Current;
  id v12 = v6;
  id v15 = v12;
  id v13 = v7;
  id v16 = v13;
  [(PKPrinter *)self pollForPrinterAttributes:v11 completionHandler:v14];
}

void __57__PKPrinter_pollForPrinterStatusQueue_completionHandler___block_invoke(uint64_t a1, void **a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  int v4 = objc_opt_new();
  int64_t v5 = _PKLogCategory(PKLogCategoryFramework);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = v6;
    _os_log_impl(&dword_22EA54000, v5, OS_LOG_TYPE_DEFAULT, "PKPrinter<%p>: pollForPrinterStatusQueue: done", buf, 0xCu);
  }

  if (a2)
  {
    v30 = objc_opt_new();
    uint64_t v29 = Printd_Parameters::_get_PrinterMandatoryJobAttributes(a2);
    if ([v29 count])
    {
      if ([v29 containsObject:@"job-password"])
      {
        id v7 = PKLocalizedString(&cfstr_ThisPrinterReq.isa, "PIN required message.");
        [v30 addObject:v7];
      }
      if ([v29 containsObject:@"job-account-id"])
      {
        id v8 = PKLocalizedString(&cfstr_ThisPrinterReq_0.isa, "Warning string for printers requiring an ID for job accounting");
        [v30 addObject:v8];
      }
    }
    id v28 = Printd_Parameters::_get_PrinterStateReasons(a2);
    if (v28)
    {
      id v9 = Printd_Parameters::_get_MediaSourceSupported(a2);
      int v10 = Printd_Parameters::_get_PrinterInputTray(a2);
      v27 = +[PKTray traysWithMediaSourceSupported:v9 printerInputTrays:v10];

      v26 = +[PKTray filter:v27 withBlock:&__block_literal_global_337_0];
      int v11 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v12 = v26;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:buf count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v35;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v35 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v17 = v16;
              __int16 v18 = [v17 localizedName];
              [v11 addObject:v18];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:buf count:16];
        }
        while (v13);
      }

      int v19 = PKCopyLocalizedPrinterStateReasons(v28, v11);
      if (v19) {
        [v30 addObjectsFromArray:v19];
      }
    }
    uint64_t v20 = [MEMORY[0x263EFF910] date];
    [v4 setObject:v20 forKey:@"printer-status-time"];

    [v4 setObject:v30 forKey:@"synth-printer-state-reasons-localized"];
  }
  else
  {
    v21 = PKLocalizedString(&cfstr_ThePrinterIsOf.isa, "The printer is offline.");
    v38 = v21;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];

    [v4 setObject:v30 forKey:@"synth-printer-state-reasons-localized"];
  }

  uint64_t v22 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56)];
  [v4 setObject:v22 forKey:@"synth-printer-state-printer-rtt"];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__PKPrinter_pollForPrinterStatusQueue_completionHandler___block_invoke_133;
  block[3] = &unk_2649EDD58;
  v23 = *(NSObject **)(a1 + 40);
  id v24 = *(id *)(a1 + 48);
  id v32 = v4;
  id v33 = v24;
  id v25 = v4;
  dispatch_async(v23, block);
}

uint64_t __57__PKPrinter_pollForPrinterStatusQueue_completionHandler___block_invoke_133(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getSupplyLevels:(id)a3
{
  int v4 = (SuppliesPoll *)a3;
  int64_t v5 = SuppliesPoll::requestedAttributess(v4);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__PKPrinter_getSupplyLevels___block_invoke;
  v7[3] = &unk_2649EED38;
  uint64_t v6 = v4;
  id v8 = v6;
  [(PKPrinter *)self pollForPrinterAttributes:v5 completionHandler:v7];
}

void __29__PKPrinter_getSupplyLevels___block_invoke(uint64_t a1, void **a2)
{
  if (a2)
  {
    uint64_t v3 = suppliesForPollResponse(a2);
  }
  else
  {
    uint64_t v3 = 0;
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__PKPrinter_getSupplyLevels___block_invoke_2;
  v7[3] = &unk_2649EDD58;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __29__PKPrinter_getSupplyLevels___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)supportsColor
{
  return self->_supportsColor;
}

- (BOOL)supportsDuplex
{
  return self->_supportsDuplex;
}

- (int64_t)accessState
{
  return self->_accessState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_job_request, 0);
  objc_storeStrong((id *)&self->_printerDescriptionTime, 0);
  objc_storeStrong((id *)&self->_iCloudPrinter, 0);
  objc_storeStrong((id *)&self->_printerDescription, 0);

  objc_storeStrong((id *)&self->_browseInfo, 0);
}

- (BOOL)knowsReadyPaperList
{
  uint64_t v2 = [(PKPrinterDescription *)self->_printerDescription paperList];
  char v3 = [v2 hasMediaReady];

  return v3;
}

- (BOOL)isPaperReady:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPrinterDescription *)self->_printerDescription paperList];
  char v6 = [v5 isPaperReady:v4];

  return v6;
}

- (id)availableRollPapersPreferBorderless:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKPrinterDescription *)self->_printerDescription paperList];
  id v5 = [v4 availableRollPapersPreferBorderless:v3];

  return v5;
}

- (id)papersForPhotoWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(PKPrinterDescription *)self->_printerDescription paperList];
  char v6 = objc_msgSend(v5, "papersForPhotoWithSize:", width, height);

  return v6;
}

- (id)paperListForDuplexMode:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPrinterDescription *)self->_printerDescription paperList];
  char v6 = [v5 paperListForDuplexMode:v4];

  return v6;
}

- (id)papersForDocumentWithSize:(CGSize)a3 andDuplex:(BOOL)a4
{
  return -[PKPrinter papersForDocumentWithSize:scaleUpOnRoll:andDuplex:](self, "papersForDocumentWithSize:scaleUpOnRoll:andDuplex:", 0, a4, a3.width, a3.height);
}

- (id)papersForDocumentWithSize:(CGSize)a3 scaleUpOnRoll:(BOOL)a4 andDuplex:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double height = a3.height;
  double width = a3.width;
  id v9 = [(PKPrinterDescription *)self->_printerDescription paperList];
  int v10 = objc_msgSend(v9, "papersForDocumentWithSize:scaleUpOnRoll:andDuplex:", v6, v5, width, height);

  return v10;
}

- (id)matchedPaper:(id)a3 preferBorderless:(BOOL)a4 withDuplexMode:(id)a5 didMatch:(BOOL *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = [(PKPrinterDescription *)self->_printerDescription paperList];
  uint64_t v13 = [v12 matchedPaper:v10 preferBorderless:v8 withDuplexMode:v11 didMatch:a6];

  return v13;
}

- (void)printURL:(id)a3 ofType:(id)a4 printSettings:(id)a5 completionHandlerWithLocalJobNumber:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = _PKLogCategory(PKLogCategoryFramework);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v33 = self;
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 2112;
    long long v37 = v11;
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2080;
    uint64_t v41 = "";
    _os_log_impl(&dword_22EA54000, v14, OS_LOG_TYPE_DEFAULT, "%@: printURL:%@ ofType:%@ printSettings:%@%s", buf, 0x34u);
  }

  BOOL v15 = [(PKPrinter *)self _allowedToPrintToThisPrinter];
  if (v10) {
    BOOL v16 = v15;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16)
  {
    if ([(__CFString *)v11 isEqual:@"image/heic"])
    {
      id v17 = @"image/jpeg";
    }
    else
    {
      int v18 = [(__CFString *)v11 isEqual:@"image/png"];
      id v17 = @"image/jpeg";
      if (!v18) {
        id v17 = v11;
      }
    }
    int v19 = v17;
    uint64_t v20 = [(PKPrinterDescription *)self->_printerDescription jpegFeatures];
    char v21 = [v20 containsObject:@"icc"];

    uint64_t v22 = [PKPrintJobRequest alloc];
    v23 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
    id v24 = [(PKPrintJobRequest *)v22 initWithPrinterName:v23];

    [(PKPrintJobRequest *)v24 setPrintSettings:v12];
    [(PKPrintJobRequest *)v24 setFileType:v19];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __89__PKPrinter_Printing__printURL_ofType_printSettings_completionHandlerWithLocalJobNumber___block_invoke;
    v26[3] = &unk_2649EED60;
    id v30 = v13;
    id v27 = v10;
    id v25 = v24;
    id v28 = v25;
    uint64_t v29 = v11;
    char v31 = v21;
    [(PKPrintJobRequest *)v25 startRequestCompletionHandler:v26];
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

void __89__PKPrinter_Printing__printURL_ofType_printSettings_completionHandlerWithLocalJobNumber___block_invoke(uint64_t a1, char a2)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (softLinkPUTIsPersistentURL(*(const __CFURL **)(a1 + 32)))
    {
      BOOL v3 = *(void **)(a1 + 32);
      id v4 = *(void **)(a1 + 56);
      id v5 = *(id *)(a1 + 40);
      id v6 = v3;
      id v7 = v4;
      BOOL v8 = dispatch_get_global_queue(0, 0);
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v60 = 3221225472;
      v61 = (__CFString *)___ZL27writePersistentURLToPrinterP17PKPrintJobRequestP5NSURLU13block_pointerFvP8NSNumberE_block_invoke;
      v62 = &unk_2649EEEC0;
      id v64 = v5;
      id v65 = v7;
      id v63 = v6;
      id v9 = v6;
      id v10 = v7;
      id v11 = v5;
      dispatch_async(v8, &block);
    }
    else
    {
      int v13 = [*(id *)(a1 + 48) isEqual:@"application/pdf"];
      BOOL v15 = *(void **)(a1 + 32);
      uint64_t v14 = *(void **)(a1 + 40);
      if (v13)
      {
        BOOL v16 = *(void **)(a1 + 56);
        id v17 = *(void **)(a1 + 32);
        writeURLToPrinter(v14, v17, v16);
      }
      else
      {
        int v18 = *(unsigned __int8 *)(a1 + 64);
        uint64_t v20 = *(void **)(a1 + 48);
        int v19 = *(void **)(a1 + 56);
        id v54 = v14;
        CFURLRef v21 = v15;
        id v55 = v20;
        id v22 = v19;
        v23 = CGImageSourceCreateWithURL(v21, 0);
        if (v23)
        {
          int v24 = [v55 isEqual:@"image/jpeg"];
          if (v18) {
            char v25 = 1;
          }
          else {
            char v25 = v24 ^ 1;
          }
          if ((v25 & 1) != 0 || (CFDictionaryRef v26 = CGImageSourceCopyProperties(v23, 0)) == 0)
          {
            int v29 = 0;
          }
          else
          {
            CFDictionaryRef cf = v26;
            v47 = [(__CFDictionary *)cf objectForKeyedSubscript:*MEMORY[0x263F0F358]];
            v48 = [v47 objectForKeyedSubscript:*MEMORY[0x263F0F488]];
            v50 = [v48 objectAtIndexedSubscript:0];
            id v27 = [v50 objectForKeyedSubscript:*MEMORY[0x263F0F4B8]];
            if (v27)
            {
              id v28 = 0;
            }
            else
            {
              ImageAtIndex = CGImageSourceCreateImageAtIndex(v23, 0, 0);
              id v28 = ImageAtIndex;
              if (ImageAtIndex && (ColorSpace = CGImageGetColorSpace(ImageAtIndex)) != 0)
              {
                id v27 = CGColorSpaceGetName(ColorSpace);
              }
              else
              {
                id v27 = 0;
              }
            }
            uint64_t v32 = *MEMORY[0x263F00250];
            uint64_t block = *MEMORY[0x263F002D8];
            uint64_t v60 = v32;
            v61 = @"Apple Wide Color Sharing Profile";
            id v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&block count:3];
            __int16 v34 = v33;
            if (v27) {
              int v29 = [v33 containsObject:v27] ^ 1;
            }
            else {
              int v29 = 0;
            }
            if (v28) {
              CFRelease(v28);
            }
            CFRelease(cf);
          }
          if ((v24 ^ 1 | v29) == 1)
          {
            id cfa = v54;
            id v35 = v22;
            __int16 v36 = jpegWithImageSource(v23, v18 == 0);
            long long v37 = v36;
            if (v36)
            {
              BOOL v38 = v18 != 0;
              v56[0] = MEMORY[0x263EF8330];
              v56[1] = 3221225472;
              v56[2] = ___ZL34convertFromImageSourceAndWriteJPEGP17PKPrintJobRequestP13CGImageSourcebhU13block_pointerFvP8NSNumberE_block_invoke;
              v56[3] = &unk_2649EEF38;
              id v39 = v36;
              id v57 = v39;
              id v58 = v35;
              __int16 v40 = (void *)MEMORY[0x230FA9020](v56);
              if ((v38 | v24) == 1)
              {
                writeURLToPrinter(cfa, v39, v40);
              }
              else
              {
                id v51 = cfa;
                CFURLRef v41 = (const __CFURL *)v39;
                id v42 = v40;
                CFURLRef v49 = v41;
                v43 = CGImageSourceCreateWithURL(v41, 0);
                v44 = v43;
                if (v43)
                {
                  v45 = jpegWithImageSource(v43, 1);
                  CFRelease(v44);
                  if (v45)
                  {
                    uint64_t block = MEMORY[0x263EF8330];
                    uint64_t v60 = 3221225472;
                    v61 = (__CFString *)___ZL21convertToSharableJPEGP17PKPrintJobRequestP5NSURLU13block_pointerFvP8NSNumberE_block_invoke;
                    v62 = &unk_2649EEF38;
                    id v46 = v45;
                    id v63 = v46;
                    id v64 = v42;
                    writeURLToPrinter(v51, v46, &block);
                  }
                  else
                  {
                    (*((void (**)(id, void))v42 + 2))(v42, 0);
                  }
                }
                else
                {
                  (*((void (**)(id, void))v42 + 2))(v42, 0);
                }
              }
            }
            else
            {
              (*((void (**)(id, void))v35 + 2))(v35, 0);
            }
          }
          else
          {
            writeURLToPrinter(v54, v21, v22);
          }
          CFRelease(v23);
        }
        else
        {
          (*((void (**)(id, void))v22 + 2))(v22, 0);
        }
      }
    }
  }
  else
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v12();
  }
}

- (void)printURL:(id)a3 ofType:(id)a4 printSettings:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__PKPrinter_Printing__printURL_ofType_printSettings_completionHandler___block_invoke;
  v12[3] = &unk_2649EED88;
  id v13 = v10;
  id v11 = v10;
  [(PKPrinter *)self printURL:a3 ofType:a4 printSettings:a5 completionHandlerWithLocalJobNumber:v12];
}

uint64_t __71__PKPrinter_Printing__printURL_ofType_printSettings_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 1280;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (int64_t)startJob:(id)a3 ofType:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (char *)a4;
  BOOL v8 = _PKLogCategory(PKLogCategoryFramework);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v22 = self;
    __int16 v23 = 2112;
    int v24 = v7;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2080;
    id v28 = "";
    _os_log_impl(&dword_22EA54000, v8, OS_LOG_TYPE_DEFAULT, "%@: startJob ofType:%@ printSettings:%@%s", buf, 0x2Au);
  }

  if ([(PKPrinter *)self _allowedToPrintToThisPrinter])
  {
    id v9 = [PKPrintJobRequest alloc];
    id v10 = [(PKPrinterBrowseInfo *)self->_browseInfo bonjourName];
    id v11 = [(PKPrintJobRequest *)v9 initWithPrinterName:v10];

    [(PKPrintJobRequest *)v11 setPrintSettings:v6];
    [(PKPrintJobRequest *)v11 setFileType:v7];
    if (v11)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __39__PKPrinter_Printing__startJob_ofType___block_invoke;
      v19[3] = &unk_2649EEDB0;
      id v12 = v11;
      p_super = &v12->super;
      if (withDebuggableSemaphore<BOOL>(@"startJob:ofType:", v19, 5.0))
      {
        id v13 = _PKLogCategory(PKLogCategoryFramework);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22EA54000, v13, OS_LOG_TYPE_DEFAULT, "Job submission - Job stream created", buf, 2u);
        }

        uint64_t v14 = v12;
        int64_t v15 = 0;
        BOOL v16 = &self->_job_request->super;
        self->_job_request = v14;
      }
      else
      {
        BOOL v16 = _PKLogCategory(PKLogCategoryFramework);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22EA54000, v16, OS_LOG_TYPE_DEFAULT, "Job submission - Could not create job", buf, 2u);
        }
        int64_t v15 = 1280;
      }

      id v17 = p_super;
    }
    else
    {
      id v17 = _PKLogCategory(PKLogCategoryFramework);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = self;
        __int16 v23 = 2080;
        int v24 = "";
        _os_log_impl(&dword_22EA54000, v17, OS_LOG_TYPE_DEFAULT, "%@: unable to create ipp request%s", buf, 0x16u);
      }
      int64_t v15 = 1280;
    }
  }
  else
  {
    int64_t v15 = 1280;
  }

  return v15;
}

uint64_t __39__PKPrinter_Printing__startJob_ofType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) startRequestCompletionHandler:a2];
}

- (int64_t)sendData:(const char *)a3 ofLength:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_job_request)
  {
    id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:a4];
    id v6 = self->_job_request;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__PKPrinter_Printing__sendData_ofLength___block_invoke;
    v11[3] = &unk_2649EEDD8;
    id v12 = v6;
    id v13 = v5;
    id v7 = v5;
    BOOL v8 = v6;
    if (withDebuggableSemaphore<BOOL>(@"sendData:ofLength:", v11, 5.0)) {
      int64_t v9 = 0;
    }
    else {
      int64_t v9 = 1024;
    }
  }
  else
  {
    id v7 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int64_t v15 = self;
      __int16 v16 = 2080;
      id v17 = "";
      _os_log_impl(&dword_22EA54000, v7, OS_LOG_TYPE_DEFAULT, "%@: sendData called outside startJob/finishJob%s", buf, 0x16u);
    }
    int64_t v9 = 1282;
  }

  return v9;
}

uint64_t __41__PKPrinter_Printing__sendData_ofLength___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeRequestData:*(void *)(a1 + 40) completionHandler:a2];
}

- (void)abortJobCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__PKPrinter_Printing__abortJobCompletionHandler___block_invoke;
  v6[3] = &unk_2649EED88;
  id v7 = v4;
  id v5 = v4;
  [(PKPrinter *)self finalizeJob:1 completionHandler:v6];
}

uint64_t __49__PKPrinter_Printing__abortJobCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)finishJobCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__PKPrinter_Printing__finishJobCompletionHandler___block_invoke;
  v6[3] = &unk_2649EED88;
  id v7 = v4;
  id v5 = v4;
  [(PKPrinter *)self finalizeJob:0 completionHandler:v6];
}

uint64_t __50__PKPrinter_Printing__finishJobCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 1282;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)finalizeJob:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void))a4;
  job_request = self->_job_request;
  if (job_request)
  {
    self->_job_request = 0;
    BOOL v8 = job_request;

    [(PKPrintJobRequest *)v8 finishRequest:v4 completionHandler:v6];
  }
  else
  {
    int64_t v9 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = self;
      __int16 v12 = 2080;
      id v13 = "";
      _os_log_impl(&dword_22EA54000, v9, OS_LOG_TYPE_DEFAULT, "%@: -finishJob called without -startJob%s", (uint8_t *)&v10, 0x16u);
    }

    if (v6) {
      v6[2](v6, 0);
    }
  }
}

@end