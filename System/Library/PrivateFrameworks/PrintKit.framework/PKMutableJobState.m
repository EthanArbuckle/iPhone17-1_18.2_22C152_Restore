@interface PKMutableJobState
+ (BOOL)supportsSecureCoding;
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
- (NSString)printerDisplayName;
- (NSString)printerLocation;
- (PKMutableJobState)init;
- (PKMutableJobState)initWithCoder:(id)a3;
- (PKMutableJobState)initWithUserCodableDictionary:(id)a3;
- (PKPrintSettings)settings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)userCodableDictionary;
- (int64_t)localJobID;
- (int64_t)mediaProgress;
- (int64_t)mediaSheets;
- (int64_t)mediaSheetsCompleted;
- (int64_t)printerKind;
- (int64_t)remoteJobId;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setJobPrinterStateMessage:(id)a3;
- (void)setJobPrinterStateReasons:(id)a3;
- (void)setJobStateMessage:(id)a3;
- (void)setJobStateReasons:(id)a3;
- (void)setLocalJobID:(int64_t)a3;
- (void)setMediaProgress:(int64_t)a3;
- (void)setMediaSheets:(int64_t)a3;
- (void)setMediaSheetsCompleted:(int64_t)a3;
- (void)setPIN:(id)a3;
- (void)setPrinterDisplayName:(id)a3;
- (void)setPrinterEndpointData:(id)a3;
- (void)setPrinterKind:(int64_t)a3;
- (void)setPrinterLocation:(id)a3;
- (void)setRemoteJobId:(int64_t)a3;
- (void)setSettings:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setTimeAtCompleted:(id)a3;
- (void)setTimeAtCreation:(id)a3;
- (void)setTimeAtProcessing:(id)a3;
- (void)visitProperties:(Visitor *)a3;
@end

@implementation PKMutableJobState

- (PKMutableJobState)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKMutableJobState;
  return [(PKMutableJobState *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v14 = 0;
  objc_super v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v14];
  id v4 = v14;
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v13 = 0;
    v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v13];
    id v8 = v13;
    v6 = v8;
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      v7 = v7;
      v11 = v7;
      goto LABEL_16;
    }
    v10 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_22EA54000, v10, OS_LOG_TYPE_ERROR, "couldn't create from archive: %@", buf, 0xCu);
    }
  }
  else
  {
    v6 = v4;
    v7 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_22EA54000, v7, OS_LOG_TYPE_ERROR, "couldn't create archive: %@", buf, 0xCu);
    }
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (PKMutableJobState)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKMutableJobState;
  BOOL v5 = [(PKMutableJobState *)&v8 init];
  v6 = v5;
  if (v5) {
    DecodeVisitor::visitProperties(v5, v4);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)userCodableDictionary
{
  objc_super v3 = objc_opt_new();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__PKMutableJobState_userCodableDictionary__block_invoke;
  v6[3] = &unk_2649EE4D8;
  id v4 = v3;
  id v7 = v4;
  UserCodedSerializationVisitor::visitProperties(self, (uint64_t)v6);

  return v4;
}

void __42__PKMutableJobState_userCodableDictionary__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a2;
  objc_super v8 = a3;
  BOOL v9 = v8[2](v8, *a5);
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
}

- (PKMutableJobState)initWithUserCodableDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMutableJobState;
  BOOL v5 = [(PKMutableJobState *)&v9 init];
  if (v5)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__PKMutableJobState_initWithUserCodableDictionary___block_invoke;
    v7[3] = &unk_2649EE4D8;
    id v8 = v4;
    UserCodedSerializationVisitor::visitProperties(v5, (uint64_t)v7);
  }
  return v5;
}

void __51__PKMutableJobState_initWithUserCodableDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void **a5)
{
  id v13 = a2;
  id v8 = a4;
  objc_super v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
    uint64_t v11 = v8[2](v8, v10);
    v12 = *a5;
    *a5 = (void *)v11;
  }
}

- (void)visitProperties:(Visitor *)a3
{
  (*((void (**)(Visitor *, SEL))a3->var0 + 2))(a3, a2);
  (*((void (**)(Visitor *, __CFString *, int64_t *))a3->var0 + 5))(a3, @"localJobID", &self->_localJobID);
  (*((void (**)(Visitor *, __CFString *, NSData **))a3->var0 + 9))(a3, @"printerEndpointData", &self->_printerEndpointData);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"printerDisplayName", &self->_printerDisplayName);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"printerLocation", &self->_printerLocation);
  int64_t printerKind = self->_printerKind;
  (*((void (**)(Visitor *, __CFString *, int64_t *))a3->var0 + 5))(a3, @"printerKind", &printerKind);
  self->_int64_t printerKind = printerKind;
  (*((void (**)(Visitor *, __CFString *, PKPrintSettings **))a3->var0 + 21))(a3, @"settings", &self->_settings);
  (*((void (**)(Visitor *, __CFString *, NSDate **))a3->var0 + 11))(a3, @"timeAtCreation", &self->_timeAtCreation);
  int64_t printerKind = self->_state;
  (*((void (**)(Visitor *, __CFString *, int64_t *))a3->var0 + 5))(a3, @"state", &printerKind);
  self->_state = printerKind;
  (*((void (**)(Visitor *, __CFString *, int64_t *))a3->var0 + 5))(a3, @"mediaSheetsCompleted", &self->_mediaSheetsCompleted);
  (*((void (**)(Visitor *, __CFString *, NSDate **))a3->var0 + 11))(a3, @"timeAtProcessing", &self->_timeAtProcessing);
  (*((void (**)(Visitor *, __CFString *, NSDate **))a3->var0 + 11))(a3, @"timeAtCompleted", &self->_timeAtCompleted);
  (*((void (**)(Visitor *, __CFString *, int64_t *))a3->var0 + 5))(a3, @"mediaSheets", &self->_mediaSheets);
  (*((void (**)(Visitor *, __CFString *, int64_t *))a3->var0 + 5))(a3, @"mediaProgress", &self->_mediaProgress);
  (*((void (**)(Visitor *, __CFString *, int64_t *))a3->var0 + 5))(a3, @"remoteJobId", &self->_remoteJobId);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"PIN", &self->_PIN);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"jobPrinterStateMessage", &self->_jobPrinterStateMessage);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 15))(a3, @"jobPrinterStateReasons", &self->_jobPrinterStateReasons);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"jobStateMessage", &self->_jobStateMessage);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 15))(a3, @"jobStateReasons", &self->_jobStateReasons);
  (*((void (**)(Visitor *, __CFString *, NSData **))a3->var0 + 9))(a3, @"thumbnailImage", &self->_thumbnailImage);
  (*((void (**)(Visitor *))a3->var0 + 24))(a3);
}

- (int64_t)localJobID
{
  return self->_localJobID;
}

- (void)setLocalJobID:(int64_t)a3
{
  self->_localJobID = a3;
}

- (NSData)printerEndpointData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrinterEndpointData:(id)a3
{
}

- (NSString)printerDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrinterDisplayName:(id)a3
{
}

- (NSString)printerLocation
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrinterLocation:(id)a3
{
}

- (int64_t)printerKind
{
  return self->_printerKind;
}

- (void)setPrinterKind:(int64_t)a3
{
  self->_int64_t printerKind = a3;
}

- (PKPrintSettings)settings
{
  return (PKPrintSettings *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSettings:(id)a3
{
}

- (NSDate)timeAtCreation
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimeAtCreation:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)mediaSheetsCompleted
{
  return self->_mediaSheetsCompleted;
}

- (void)setMediaSheetsCompleted:(int64_t)a3
{
  self->_mediaSheetsCompleted = a3;
}

- (NSDate)timeAtProcessing
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTimeAtProcessing:(id)a3
{
}

- (NSDate)timeAtCompleted
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTimeAtCompleted:(id)a3
{
}

- (int64_t)mediaSheets
{
  return self->_mediaSheets;
}

- (void)setMediaSheets:(int64_t)a3
{
  self->_mediaSheets = a3;
}

- (int64_t)mediaProgress
{
  return self->_mediaProgress;
}

- (void)setMediaProgress:(int64_t)a3
{
  self->_mediaProgress = a3;
}

- (int64_t)remoteJobId
{
  return self->_remoteJobId;
}

- (void)setRemoteJobId:(int64_t)a3
{
  self->_remoteJobId = a3;
}

- (NSString)PIN
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPIN:(id)a3
{
}

- (NSString)jobPrinterStateMessage
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setJobPrinterStateMessage:(id)a3
{
}

- (NSArray)jobPrinterStateReasons
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setJobPrinterStateReasons:(id)a3
{
}

- (NSString)jobStateMessage
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setJobStateMessage:(id)a3
{
}

- (NSArray)jobStateReasons
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setJobStateReasons:(id)a3
{
}

- (NSData)thumbnailImage
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setThumbnailImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_jobStateReasons, 0);
  objc_storeStrong((id *)&self->_jobStateMessage, 0);
  objc_storeStrong((id *)&self->_jobPrinterStateReasons, 0);
  objc_storeStrong((id *)&self->_jobPrinterStateMessage, 0);
  objc_storeStrong((id *)&self->_PIN, 0);
  objc_storeStrong((id *)&self->_timeAtCompleted, 0);
  objc_storeStrong((id *)&self->_timeAtProcessing, 0);
  objc_storeStrong((id *)&self->_timeAtCreation, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_printerLocation, 0);
  objc_storeStrong((id *)&self->_printerDisplayName, 0);

  objc_storeStrong((id *)&self->_printerEndpointData, 0);
}

@end