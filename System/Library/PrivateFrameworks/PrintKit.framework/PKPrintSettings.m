@interface PKPrintSettings
+ (BOOL)supportsSecureCoding;
+ (id)default;
+ (id)photo;
- (BOOL)annotationsImaged;
- (BOOL)isEqual:(id)a3;
- (NSArray)finishings;
- (NSArray)pageRanges;
- (NSArray)pageRanges_asStringArray;
- (NSString)documentPassword;
- (NSString)duplex;
- (NSString)fileType;
- (NSString)finishingTemplate;
- (NSString)inputSlot;
- (NSString)jobAccountID;
- (NSString)jobName;
- (NSString)jobPresetName;
- (NSString)mediaType;
- (NSString)orientation;
- (NSString)outputBin;
- (NSString)outputMode;
- (NSString)pageScale;
- (NSString)pageStackOrder;
- (NSString)printQuality;
- (NSString)thumbnailPosition;
- (NSURL)printerInfoURL;
- (NSURL)printerSuppliesURL;
- (PKPaper)paper;
- (PKPrintSettings)init;
- (PKPrintSettings)initWithCoder:(id)a3;
- (PKPrintSettings)initWithPaper:(id)a3;
- (PKPrintSettings)initWithSettings:(id)a3;
- (PKPrintSettings)initWithUserCodableDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)keyedNameToVisitName:(id)a3;
- (id)objectForKey:(id)a3;
- (id)userCodableDictionary;
- (int)copies;
- (unint64_t)hash;
- (void)_setupDefaults;
- (void)encodeWithCoder:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setAnnotationsImaged:(BOOL)a3;
- (void)setCopies:(int)a3;
- (void)setDocumentPassword:(id)a3;
- (void)setDuplex:(id)a3;
- (void)setFileType:(id)a3;
- (void)setFinishingTemplate:(id)a3;
- (void)setFinishings:(id)a3;
- (void)setFromUserCodableDictionary:(id)a3;
- (void)setInputSlot:(id)a3;
- (void)setJobAccountID:(id)a3;
- (void)setJobName:(id)a3;
- (void)setJobPresetName:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setOrientation:(id)a3;
- (void)setOutputBin:(id)a3;
- (void)setOutputMode:(id)a3;
- (void)setPageRanges:(id)a3;
- (void)setPageRanges_asStringArray:(id)a3;
- (void)setPageScale:(id)a3;
- (void)setPageStackOrder:(id)a3;
- (void)setPaper:(id)a3;
- (void)setPrintQuality:(id)a3;
- (void)setPrinterInfoURL:(id)a3;
- (void)setPrinterSuppliesURL:(id)a3;
- (void)setThumbnailPosition:(id)a3;
- (void)visitProperties:(Visitor *)a3;
@end

@implementation PKPrintSettings

- (void)_setupDefaults
{
  v3 = +[PKPaper genericLetterPaper];
  paper = self->_paper;
  self->_paper = v3;

  self->_copies = 1;
  orientation = self->_orientation;
  self->_orientation = 0;

  objc_storeStrong((id *)&self->_printQuality, @"3");
}

- (PKPrintSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKPrintSettings;
  v2 = [(PKPrintSettings *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PKPrintSettings *)v2 _setupDefaults];
  }
  return v3;
}

- (PKPrintSettings)initWithPaper:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPrintSettings;
  objc_super v5 = [(PKPrintSettings *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(PKPrintSettings *)v5 _setupDefaults];
    [(PKPrintSettings *)v6 setPaper:v4];
  }

  return v6;
}

- (PKPrintSettings)initWithSettings:(id)a3
{
  id v4 = [a3 userCodableDictionary];
  if (v4)
  {
    self = [(PKPrintSettings *)self initWithUserCodableDictionary:v4];
    objc_super v5 = self;
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 initWithSettings:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:2 forKey:@"version"];
  EncodeVisitor::visitProperties(self, v4);
}

- (PKPrintSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPrintSettings;
  objc_super v5 = [(PKPrintSettings *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(PKPrintSettings *)v5 _setupDefaults];
    if ([v4 decodeIntForKey:@"version"] != 2) {
      __assert_rtn("-[PKPrintSettings initWithCoder:]", "PKPrintSettings.m", 75, "[coder decodeIntForKey:@\"version\"] == 2");
    }
    DecodeVisitor::visitProperties(v6, v4);
  }

  return v6;
}

+ (id)default
{
  v2 = objc_opt_new();

  return v2;
}

+ (id)photo
{
  v2 = [PKPrintSettings alloc];
  v3 = +[PKPaper generic4x6Paper];
  id v4 = [(PKPrintSettings *)v2 initWithPaper:v3];

  [(PKPrintSettings *)v4 setObject:@"5" forKey:@"print-quality"];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__PKPrintSettings_isEqual___block_invoke;
    v7[3] = &unk_2649EE5A0;
    v7[4] = &v8;
    CompareVisitor::visitProperties(self, v4, v7);
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __27__PKPrintSettings_isEqual___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 200))(a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)hash
{
  v2 = [(PKPrintSettings *)self userCodableDictionary];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)userCodableDictionary
{
  unint64_t v3 = objc_opt_new();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__PKPrintSettings_userCodableDictionary__block_invoke;
  v6[3] = &unk_2649EE4D8;
  id v4 = v3;
  id v7 = v4;
  UserCodedSerializationVisitor::visitProperties(self, (uint64_t)v6);

  return v4;
}

void __40__PKPrintSettings_userCodableDictionary__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v11 = a2;
  id v8 = a3;
  v9 = v8;
  if (*a5)
  {
    uint64_t v10 = (*((void (**)(id))v8 + 2))(v8);
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v11];
  }
}

- (PKPrintSettings)initWithUserCodableDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPrintSettings;
  BOOL v5 = [(PKPrintSettings *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(PKPrintSettings *)v5 _setupDefaults];
    [(PKPrintSettings *)v6 setFromUserCodableDictionary:v4];
  }

  return v6;
}

- (void)setFromUserCodableDictionary:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__PKPrintSettings_setFromUserCodableDictionary___block_invoke;
  v6[3] = &unk_2649EE4D8;
  id v7 = v4;
  id v5 = v4;
  UserCodedSerializationVisitor::visitProperties(self, (uint64_t)v6);
}

void __48__PKPrintSettings_setFromUserCodableDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void **a5)
{
  id v12 = a2;
  objc_super v8 = a4;
  v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  if (v9)
  {
    uint64_t v10 = v8[2](v8, v9);
    id v11 = *a5;
    *a5 = (void *)v10;
  }
}

- (id)debugDescription
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  objc_super v8 = __Block_byref_object_copy__4;
  v9 = __Block_byref_object_dispose__4;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__PKPrintSettings_debugDescription__block_invoke;
  v4[3] = &unk_2649EE578;
  v4[4] = self;
  v4[5] = &v5;
  DescVisitor::visitProperties(self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__PKPrintSettings_debugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = NSString;
  id v10 = [*(id *)(a1 + 32) description];
  uint64_t v5 = (*(void (**)(uint64_t))(*(void *)a2 + 208))(a2);
  v6 = (*(void (**)(uint64_t))(*(void *)a2 + 200))(a2);
  uint64_t v7 = [v4 stringWithFormat:@"%@ Encoded classes: %@, properties %@", v10, v5, v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)visitProperties:(Visitor *)a3
{
  (*((void (**)(Visitor *, SEL))a3->var0 + 2))(a3, a2);
  (*((void (**)(Visitor *, __CFString *, PKPaper **))a3->var0 + 19))(a3, @"paper", &self->_paper);
  (*((void (**)(Visitor *, __CFString *, NSURL **))a3->var0 + 8))(a3, @"printerInfoURL", &self->_printerInfoURL);
  (*((void (**)(Visitor *, __CFString *, NSURL **))a3->var0 + 8))(a3, @"printerSuppliesURL", &self->_printerSuppliesURL);
  (*((void (**)(Visitor *, __CFString *, BOOL *))a3->var0 + 3))(a3, @"annotationsImaged", &self->_annotationsImaged);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"copies", &self->_copies);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"documentPassword", &self->_documentPassword);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"duplex", &self->_duplex);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"finishingTemplate", &self->_finishingTemplate);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 14))(a3, @"finishings", &self->_finishings);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"inputSlot", &self->_inputSlot);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"mediaType", &self->_mediaType);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"jobAccountID", &self->_jobAccountID);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"jobName", &self->_jobName);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"orientation", &self->_orientation);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"outputBin", &self->_outputBin);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"outputMode", &self->_outputMode);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"pageScale", &self->_pageScale);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"pageStackOrder", &self->_pageStackOrder);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"printQuality", &self->_printQuality);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"thumbnailPosition", &self->_thumbnailPosition);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"fileType", &self->_fileType);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 15))(a3, @"pageRanges_asStringArray", &self->_pageRanges_asStringArray);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"jobPresetName", &self->_jobPresetName);
  uint64_t v5 = (void (*)(Visitor *))*((void *)a3->var0 + 24);

  v5(a3);
}

- (id)keyedNameToVisitName:(id)a3
{
  v10[18] = *MEMORY[0x263EF8340];
  id v3 = a3;
  {
    v9[0] = @"com.apple.image-pdf-annotations";
    v9[1] = @"copies";
    v10[0] = @"annotationsImaged";
    v10[1] = @"copies";
    v9[2] = @"document-password";
    v9[3] = @"sides";
    v10[2] = @"documentPassword";
    v10[3] = @"duplex";
    v9[4] = @"com.apple.finishingTemplate";
    v9[5] = @"com.apple.finishings";
    v10[4] = @"finishingTemplate";
    v10[5] = @"finishings";
    v9[6] = @"com.apple.inputSlot";
    v9[7] = @"job-account-id";
    v10[6] = @"inputSlot";
    v10[7] = @"jobAccountID";
    v9[8] = @"job-name";
    v9[9] = @"com.apple.mediaType";
    v10[8] = @"jobName";
    v10[9] = @"mediaType";
    v9[10] = @"orientation-requested";
    v9[11] = @"com.apple.outputBin";
    v10[10] = @"orientation";
    v10[11] = @"outputBin";
    v9[12] = @"print-color-mode";
    v9[13] = @"page-ranges";
    v10[12] = @"outputMode";
    v10[13] = @"pageRanges";
    v9[14] = @"com.apple.page-scaling";
    v9[15] = @"com.apple.pageStackOrder";
    v10[14] = @"pageScale";
    v10[15] = @"pageStackOrder";
    v9[16] = @"print-quality";
    v9[17] = @"com.apple.thumbnail-position";
    v10[16] = @"printQuality";
    v10[17] = @"thumbnailPosition";
    -[PKPrintSettings keyedNameToVisitName:]::sMapping = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:18];
  }
  id v4 = [(id)-[PKPrintSettings keyedNameToVisitName:]::sMapping objectForKeyedSubscript:v3];
  if (!v4)
  {
    uint64_t v5 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_22EA54000, v5, OS_LOG_TYPE_ERROR, "No mapping to old style key from %@ anymore - use properties directly", (uint8_t *)&v7, 0xCu);
    }
  }

  return v4;
}

- (NSArray)pageRanges
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [(PKPrintSettings *)self pageRanges_asStringArray];
  id v3 = v2;
  if (v2)
  {
    id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = (void *)MEMORY[0x263F08D40];
          NSRange v10 = NSRangeFromString((NSString *)*(void *)(*((void *)&v13 + 1) + 8 * i));
          id v11 = objc_msgSend(v9, "valueWithRange:", v10.location, v10.length, (void)v13);
          [v4 addObject:v11];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setPageRanges:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          v18.location = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "rangeValue", (void)v12);
          id v11 = NSStringFromRange(v18);
          [v6 addObject:v11];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  [(PKPrintSettings *)self setPageRanges_asStringArray:v6];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (__CFString *)a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"com.apple.jobPreset"])
  {
    uint64_t v8 = [(__CFString *)v6 objectForKeyedSubscript:@"PresetInfo"];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"UIPrintInfoJobPresetKey"];
    NSRange v10 = [v9 objectForKeyedSubscript:@"JobPresetOption"];
    id v11 = [v10 objectForKeyedSubscript:@"preset-name"];
    [(PKPrintSettings *)self setJobPresetName:v11];
  }
  else if ([v7 isEqualToString:@"page-ranges"])
  {
    [(PKPrintSettings *)self setPageRanges:v6];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v7 isEqualToString:@"print-quality"])
    {
      uint64_t v12 = [(__CFString *)v6 integerValue];
      long long v13 = @"3";
      if (v12 != [@"3" integerValue])
      {
        uint64_t v14 = [(__CFString *)v6 integerValue];
        if (v14 == [@"5" integerValue]) {
          long long v13 = @"5";
        }
        else {
          long long v13 = @"4";
        }
      }
      long long v15 = v13;

      uint64_t v6 = v15;
    }
    long long v16 = [(PKPrintSettings *)self keyedNameToVisitName:v7];
    if (v16)
    {
      uint64_t v17 = [(PKPrintSettings *)self userCodableDictionary];
      NSRange v18 = [v17 objectForKeyedSubscript:v16];
      char v19 = [v18 isEqual:v6];

      if ((v19 & 1) == 0)
      {
        v21 = v16;
        v22 = v6;
        v20 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        [(PKPrintSettings *)self setFromUserCodableDictionary:v20];
      }
    }
    else
    {
      uint64_t v17 = _PKLogCategory(PKLogCategoryFramework);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v7;
        _os_log_impl(&dword_22EA54000, v17, OS_LOG_TYPE_ERROR, "No mapping to visit key %@", buf, 0xCu);
      }
    }
  }
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqualToString:@"orientation-requested"])
  {
    [(PKPrintSettings *)self setOrientation:0];
  }
  else
  {
    id v5 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_22EA54000, v5, OS_LOG_TYPE_ERROR, "No mapping to visit key %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)objectForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqualToString:@"page-ranges"])
  {
    id v5 = [(PKPrintSettings *)self pageRanges];
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__4;
    uint64_t v17 = __Block_byref_object_dispose__4;
    id v18 = 0;
    int v6 = [(PKPrintSettings *)self keyedNameToVisitName:v4];
    id v7 = v6;
    if (v6)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __32__PKPrintSettings_objectForKey___block_invoke;
      v10[3] = &unk_2649EEA70;
      id v11 = v6;
      uint64_t v12 = &v13;
      UserCodedSerializationVisitor::visitProperties(self, (uint64_t)v10);
      uint64_t v8 = v11;
    }
    else
    {
      uint64_t v8 = _PKLogCategory(PKLogCategoryFramework);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_22EA54000, v8, OS_LOG_TYPE_ERROR, "No mapping to visit key %@", buf, 0xCu);
      }
    }

    id v5 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }

  return v5;
}

void __32__PKPrintSettings_objectForKey___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v12 = a2;
  uint64_t v8 = a3;
  if ([v12 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v9 = v8[2](v8, *a5);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (PKPaper)paper
{
  return (PKPaper *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPaper:(id)a3
{
}

- (NSURL)printerInfoURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrinterInfoURL:(id)a3
{
}

- (NSURL)printerSuppliesURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrinterSuppliesURL:(id)a3
{
}

- (BOOL)annotationsImaged
{
  return self->_annotationsImaged;
}

- (void)setAnnotationsImaged:(BOOL)a3
{
  self->_annotationsImaged = a3;
}

- (int)copies
{
  return self->_copies;
}

- (void)setCopies:(int)a3
{
  self->_copies = a3;
}

- (NSString)documentPassword
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDocumentPassword:(id)a3
{
}

- (NSString)duplex
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDuplex:(id)a3
{
}

- (NSString)finishingTemplate
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFinishingTemplate:(id)a3
{
}

- (NSArray)finishings
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFinishings:(id)a3
{
}

- (NSString)inputSlot
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInputSlot:(id)a3
{
}

- (NSString)mediaType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMediaType:(id)a3
{
}

- (NSString)jobAccountID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setJobAccountID:(id)a3
{
}

- (NSString)jobName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setJobName:(id)a3
{
}

- (NSString)orientation
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOrientation:(id)a3
{
}

- (NSString)outputBin
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setOutputBin:(id)a3
{
}

- (NSString)outputMode
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setOutputMode:(id)a3
{
}

- (NSString)pageScale
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPageScale:(id)a3
{
}

- (NSString)pageStackOrder
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPageStackOrder:(id)a3
{
}

- (NSString)printQuality
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPrintQuality:(id)a3
{
}

- (NSString)thumbnailPosition
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setThumbnailPosition:(id)a3
{
}

- (NSString)jobPresetName
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setJobPresetName:(id)a3
{
}

- (NSString)fileType
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFileType:(id)a3
{
}

- (NSArray)pageRanges_asStringArray
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPageRanges_asStringArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageRanges_asStringArray, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_jobPresetName, 0);
  objc_storeStrong((id *)&self->_thumbnailPosition, 0);
  objc_storeStrong((id *)&self->_printQuality, 0);
  objc_storeStrong((id *)&self->_pageStackOrder, 0);
  objc_storeStrong((id *)&self->_pageScale, 0);
  objc_storeStrong((id *)&self->_outputMode, 0);
  objc_storeStrong((id *)&self->_outputBin, 0);
  objc_storeStrong((id *)&self->_orientation, 0);
  objc_storeStrong((id *)&self->_jobName, 0);
  objc_storeStrong((id *)&self->_jobAccountID, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_inputSlot, 0);
  objc_storeStrong((id *)&self->_finishings, 0);
  objc_storeStrong((id *)&self->_finishingTemplate, 0);
  objc_storeStrong((id *)&self->_duplex, 0);
  objc_storeStrong((id *)&self->_documentPassword, 0);
  objc_storeStrong((id *)&self->_printerSuppliesURL, 0);
  objc_storeStrong((id *)&self->_printerInfoURL, 0);

  objc_storeStrong((id *)&self->_paper, 0);
}

@end