@interface UIPrinter
+ (UIPrinter)printerWithURL:(NSURL *)url;
- (BOOL)supportsColor;
- (BOOL)supportsDuplex;
- (BOOL)supportsJobAccountID;
- (NSArray)finishingTemplates;
- (NSArray)loadedPapers;
- (NSArray)outputBins;
- (NSArray)printerFinishingOptions;
- (NSArray)supportedMediaTypes;
- (NSArray)supportedPapers;
- (NSArray)supportedPresets;
- (NSArray)supportedQualities;
- (NSArray)supportedTrays;
- (NSDictionary)printerInfoDict;
- (NSString)displayLocation;
- (NSString)displayName;
- (NSString)makeAndModel;
- (NSURL)URL;
- (UIPrinter)init;
- (UIPrinterJobTypes)supportedJobTypes;
- (id)_initWithPrinter:(id)a3;
- (id)_initWithURL:(id)a3;
- (id)_internalPrinter;
- (id)_printerID;
- (int64_t)jobAccountIDSupport;
- (void)contactPrinter:(void *)completionHandler;
- (void)loadPrinterInfoDict;
- (void)setPrinterInfoDict:(id)a3;
- (void)set_internalPrinter:(id)a3;
@end

@implementation UIPrinter

+ (UIPrinter)printerWithURL:(NSURL *)url
{
  v4 = url;
  v5 = (void *)[objc_alloc((Class)a1) _initWithURL:v4];

  id v6 = v5;
  return (UIPrinter *)v6;
}

- (id)_initWithURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIPrinter;
  id v6 = [(UIPrinter *)&v10 init];
  if (v6)
  {
    v7 = objc_alloc_init(UIPrinterInternals);
    id printerInfo = v6->_printerInfo;
    v6->_id printerInfo = v7;

    objc_storeStrong((id *)&v6->_url_, a3);
  }

  return v6;
}

- (id)_initWithPrinter:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPrinter;
  id v6 = [(UIPrinter *)&v11 init];
  if (v6)
  {
    v7 = objc_alloc_init(UIPrinterInternals);
    id printerInfo = v6->_printerInfo;
    v6->_id printerInfo = v7;

    objc_storeStrong((id *)v6->_printerInfo + 1, a3);
    url = v6->_url_;
    v6->_url_ = 0;
  }
  return v6;
}

- (UIPrinter)init
{
  return 0;
}

- (NSURL)URL
{
  url = self->_url_;
  if (!url)
  {
    v4 = [*((id *)self->_printerInfo + 1) printerURL];
    id v5 = self->_url_;
    self->_url_ = v4;

    url = self->_url_;
  }
  return url;
}

- (NSString)displayName
{
  v2 = [*((id *)self->_printerInfo + 1) displayName];
  v3 = v2;
  if (!v2) {
    v2 = &stru_1F3C9D3F8;
  }
  v4 = v2;

  return v4;
}

- (NSString)displayLocation
{
  v2 = (void *)*((void *)self->_printerInfo + 1);
  if (v2)
  {
    v3 = [v2 location];
    v4 = (void *)[v3 copy];
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (UIPrinterJobTypes)supportedJobTypes
{
  UIPrinterJobTypes result = *((void *)self->_printerInfo + 1);
  if (result) {
    return [(id)result jobTypesSupported];
  }
  return result;
}

- (NSString)makeAndModel
{
  v2 = (void *)*((void *)self->_printerInfo + 1);
  if (v2)
  {
    v3 = [v2 makeAndModel];
    v4 = (void *)[v3 copy];
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (BOOL)supportsColor
{
  v3 = (void *)*((void *)self->_printerInfo + 1);
  if (v3)
  {
    v3 = (void *)[v3 type];
    if (v3 != (void *)1) {
      LOBYTE(v3) = [*((id *)self->_printerInfo + 1) type] == 3;
    }
  }
  return (char)v3;
}

- (BOOL)supportsDuplex
{
  v3 = (void *)*((void *)self->_printerInfo + 1);
  if (v3) {
    LOBYTE(v3) = [v3 type] == 3 || objc_msgSend(*((id *)self->_printerInfo + 1), "type") == 2;
  }
  return (char)v3;
}

- (void)contactPrinter:(void *)completionHandler
{
  v4 = completionHandler;
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = &__block_literal_global_3;
  }
  id v6 = (void *)*((void *)self->_printerInfo + 1);
  if (v6)
  {
    [v6 _checkAvailable:MEMORY[0x1E4F14428] queue:v5 completionHandler:30.0];
  }
  else
  {
    url = self->_url_;
    if (url)
    {
      v8 = (void *)MEMORY[0x1E4F932F8];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __28__UIPrinter_contactPrinter___block_invoke_2;
      v9[3] = &unk_1E6DA1E80;
      v9[4] = self;
      id v10 = v5;
      [v8 printerWithURL:url discoveryTimeout:v9 completionHandler:30.0];
    }
    else
    {
      (*((void (**)(void *, void))v5 + 2))(v5, 0);
    }
  }
}

void __28__UIPrinter_contactPrinter___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "set_internalPrinter:", v4);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__UIPrinter_contactPrinter___block_invoke_3;
  v5[3] = &unk_1E6DA1BC0;
  id v6 = *(id *)(a1 + 40);
  BOOL v7 = v4 != 0;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __28__UIPrinter_contactPrinter___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)_internalPrinter
{
  return *((id *)self->_printerInfo + 1);
}

- (void)set_internalPrinter:(id)a3
{
}

- (id)_printerID
{
  return (id)[*((id *)self->_printerInfo + 1) name];
}

- (void)loadPrinterInfoDict
{
  id v3 = [*((id *)self->_printerInfo + 1) printInfoSupported];
  [(UIPrinter *)self setPrinterInfoDict:v3];
}

- (NSArray)printerFinishingOptions
{
  if (*((void *)self->_printerInfo + 1))
  {
    id v3 = [(UIPrinter *)self printerInfoDict];

    if (v3)
    {
      id v4 = [(UIPrinter *)self printerInfoDict];
      id v5 = [v4 objectForKey:*MEMORY[0x1E4F93378]];

      if ([v5 count]) {
        goto LABEL_6;
      }
    }
  }
  id v5 = 0;
LABEL_6:
  return (NSArray *)v5;
}

- (NSArray)finishingTemplates
{
  if (*((void *)self->_printerInfo + 1))
  {
    id v3 = [(UIPrinter *)self printerInfoDict];

    if (v3)
    {
      id v4 = [(UIPrinter *)self printerInfoDict];
      id v5 = [v4 objectForKey:*MEMORY[0x1E4F93368]];

      if ([v5 count]) {
        goto LABEL_6;
      }
    }
  }
  id v5 = 0;
LABEL_6:
  return (NSArray *)v5;
}

- (NSArray)outputBins
{
  if (*((void *)self->_printerInfo + 1))
  {
    id v3 = [(UIPrinter *)self printerInfoDict];

    if (v3)
    {
      id v4 = [(UIPrinter *)self printerInfoDict];
      id v5 = [v4 objectForKey:*MEMORY[0x1E4F93410]];

      if ([v5 count]) {
        goto LABEL_6;
      }
    }
  }
  id v5 = 0;
LABEL_6:
  return (NSArray *)v5;
}

- (NSArray)supportedPresets
{
  if (*((void *)self->_printerInfo + 1)
    && ([(UIPrinter *)self printerInfoDict],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(UIPrinter *)self printerInfoDict];
    id v5 = [v4 objectForKey:*MEMORY[0x1E4F933B8]];
  }
  else
  {
    id v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)supportedTrays
{
  if (*((void *)self->_printerInfo + 1)
    && ([(UIPrinter *)self printerInfoDict],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(UIPrinter *)self printerInfoDict];
    id v5 = [v4 objectForKey:*MEMORY[0x1E4F93388]];
  }
  else
  {
    id v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)loadedPapers
{
  return 0;
}

- (NSArray)supportedPapers
{
  return 0;
}

- (NSArray)supportedMediaTypes
{
  if (*((void *)self->_printerInfo + 1)
    && ([(UIPrinter *)self printerInfoDict],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(UIPrinter *)self printerInfoDict];
    id v5 = [v4 objectForKey:*MEMORY[0x1E4F933E0]];
  }
  else
  {
    id v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)supportedQualities
{
  if (*((void *)self->_printerInfo + 1)
    && ([(UIPrinter *)self printerInfoDict],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(UIPrinter *)self printerInfoDict];
    id v5 = [v4 objectForKey:*MEMORY[0x1E4F93478]];
  }
  else
  {
    id v5 = 0;
  }
  return (NSArray *)v5;
}

- (BOOL)supportsJobAccountID
{
  return [*((id *)self->_printerInfo + 1) supportsJobAccountID];
}

- (int64_t)jobAccountIDSupport
{
  return [*((id *)self->_printerInfo + 1) jobAccountIDSupport];
}

- (NSDictionary)printerInfoDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrinterInfoDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printerInfoDict, 0);
  objc_storeStrong((id *)&self->_url_, 0);
  objc_storeStrong(&self->_printerInfo, 0);
}

@end