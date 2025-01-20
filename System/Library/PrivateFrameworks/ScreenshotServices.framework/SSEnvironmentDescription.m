@interface SSEnvironmentDescription
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)canAutosaveToFiles;
- (BOOL)hasOnenessScreen;
- (BOOL)skipShutterSound;
- (BSSettings)bsSettings;
- (CGSize)imagePixelSize;
- (CGSize)imagePointSize;
- (NSArray)elements;
- (NSArray)harvestedMetadata;
- (NSDate)date;
- (NSString)betaApplicationBundleID;
- (NSString)betaApplicationName;
- (NSString)currentApplicationBundleID;
- (NSString)identifier;
- (NSString)loggableDescription;
- (NSString)sessionIdentifier;
- (SSEnvironmentDescription)init;
- (SSEnvironmentDescription)initWithBSXPCCoder:(id)a3;
- (SSEnvironmentDescriptionAppleInternalOptions)appleInternalOptions;
- (SSImageSurface)imageSurface;
- (SSUIServiceOptions)serviceOptions;
- (double)imageScale;
- (unint64_t)externalFlashLayerRenderID;
- (unint64_t)presentationMode;
- (unsigned)externalFlashLayerContextID;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setAppleInternalOptions:(id)a3;
- (void)setBetaApplicationBundleID:(id)a3;
- (void)setBetaApplicationName:(id)a3;
- (void)setCanAutosaveToFiles:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setDebugElements:(id)a3;
- (void)setExternalFlashLayerContextID:(unsigned int)a3;
- (void)setExternalFlashLayerRenderID:(unint64_t)a3;
- (void)setHarvestedMetadata:(id)a3;
- (void)setHasOnenessScreen:(BOOL)a3;
- (void)setImagePixelSize:(CGSize)a3;
- (void)setImageScale:(double)a3;
- (void)setImageSurface:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setServiceOptions:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSkipShutterSound:(BOOL)a3;
- (void)takeElementsFromDisplayLayout:(id)a3;
@end

@implementation SSEnvironmentDescription

- (SSEnvironmentDescription)init
{
  v15.receiver = self;
  v15.super_class = (Class)SSEnvironmentDescription;
  v2 = [(SSEnvironmentDescription *)&v15 init];
  v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = [v3 UUIDString];
  identifier = v2->_identifier;
  v2->_identifier = (NSString *)v4;

  v6 = [MEMORY[0x263F08C38] UUID];
  uint64_t v7 = [v6 UUIDString];
  sessionIdentifier = v2->_sessionIdentifier;
  v2->_sessionIdentifier = (NSString *)v7;

  uint64_t v9 = [MEMORY[0x263EFF910] date];
  date = v2->_date;
  v2->_date = (NSDate *)v9;

  elements = v2->_elements;
  v2->_elements = (NSArray *)MEMORY[0x263EFFA68];

  v12 = objc_alloc_init(SSUIServiceOptions);
  serviceOptions = v2->_serviceOptions;
  v2->_serviceOptions = v12;

  [(SSUIServiceOptions *)v2->_serviceOptions setFlashStyle:0];
  [(SSUIServiceOptions *)v2->_serviceOptions setSaveLocation:0];
  return v2;
}

- (void)takeElementsFromDisplayLayout:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = objc_msgSend(v4, "elements", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [[SSEnvironmentElement alloc] initWithDisplayLayoutElement:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
        [(NSArray *)v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  elements = self->_elements;
  self->_elements = v5;
}

- (void)setDebugElements:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SSEnvironmentDescription *)self identifier];
  [v4 encodeObject:v5 forKey:@"SSEnvironmentDescriptionIdentifier"];

  v6 = [(SSEnvironmentDescription *)self elements];
  [v4 encodeCollection:v6 forKey:@"SSEnvironmentDescriptionElements"];

  uint64_t v7 = [(SSEnvironmentDescription *)self imageSurface];
  [v4 encodeObject:v7 forKey:@"SSEnvironmentDescriptionImageSurface"];

  [(SSEnvironmentDescription *)self imagePixelSize];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"SSEnvironmentDescriptionImagePixelSize");
  [(SSEnvironmentDescription *)self imageScale];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SSEnvironmentDescriptionImageScale");
  uint64_t v8 = [(SSEnvironmentDescription *)self sessionIdentifier];
  [v4 encodeObject:v8 forKey:@"SSEnvironmentDescriptionSessionIdentifier"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[SSEnvironmentDescription presentationMode](self, "presentationMode"), @"SSEnvironmentDescriptionPresentationMode");
  uint64_t v9 = [(SSEnvironmentDescription *)self serviceOptions];
  [v4 encodeObject:v9 forKey:@"SSEnvironmentDescriptionServiceOptions"];

  uint64_t v10 = [(SSEnvironmentDescription *)self appleInternalOptions];
  [v4 encodeObject:v10 forKey:@"SSEnvironmentDescriptionAppleInternalOptions"];

  v11 = [(SSEnvironmentDescription *)self date];
  [v4 encodeObject:v11 forKey:@"SSEnvironmentDescriptionDate"];

  v12 = [(SSEnvironmentDescription *)self betaApplicationBundleID];
  [v4 encodeObject:v12 forKey:@"SSEnvironmentDescriptionBetaApplicationBundleID"];

  long long v13 = [(SSEnvironmentDescription *)self betaApplicationName];
  [v4 encodeObject:v13 forKey:@"SSEnvironmentDescriptionBetaApplicationName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SSEnvironmentDescription canAutosaveToFiles](self, "canAutosaveToFiles"), @"SSEnvironmentDescriptionCanAutosaveToFilesKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[SSEnvironmentDescription skipShutterSound](self, "skipShutterSound"), @"SSEnvironmentDescriptionSkipShutterSoundKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[SSEnvironmentDescription hasOnenessScreen](self, "hasOnenessScreen"), @"SSEnvironmentDescriptionHasOnenessScreenKey");
  objc_msgSend(v4, "encodeUInt64:forKey:", -[SSEnvironmentDescription externalFlashLayerRenderID](self, "externalFlashLayerRenderID"), @"SSEnvironmentDescriptionExternalFlashLayerRenderIDKey");
  objc_msgSend(v4, "encodeUInt64:forKey:", -[SSEnvironmentDescription externalFlashLayerContextID](self, "externalFlashLayerContextID"), @"SSEnvironmentDescriptionExternalFlashLayerContextIDKey");
  id v14 = [(SSEnvironmentDescription *)self harvestedMetadata];
  [v4 encodeCollection:v14 forKey:@"SSEnvironmentDescriptionHarvestedMetadataKey"];
}

- (SSEnvironmentDescription)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SSEnvironmentDescription *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentDescriptionIdentifier"];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [v4 decodeCollectionOfClass:v8 containingClass:objc_opt_class() forKey:@"SSEnvironmentDescriptionElements"];
  elements = v5->_elements;
  v5->_elements = (NSArray *)v9;

  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentDescriptionImageSurface"];
  imageSurface = v5->_imageSurface;
  v5->_imageSurface = (SSImageSurface *)v11;

  [v4 decodeCGSizeForKey:@"SSEnvironmentDescriptionImagePixelSize"];
  v5->_imagePixelSize.width = v13;
  v5->_imagePixelSize.height = v14;
  [v4 decodeDoubleForKey:@"SSEnvironmentDescriptionImageScale"];
  v5->_imageScale = v15;
  uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentDescriptionSessionIdentifier"];
  sessionIdentifier = v5->_sessionIdentifier;
  v5->_sessionIdentifier = (NSString *)v16;

  v5->_presentationMode = [v4 decodeInt64ForKey:@"SSEnvironmentDescriptionPresentationMode"];
  uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentDescriptionServiceOptions"];
  serviceOptions = v5->_serviceOptions;
  v5->_serviceOptions = (SSUIServiceOptions *)v18;

  uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentDescriptionAppleInternalOptions"];
  appleInternalOptions = v5->_appleInternalOptions;
  v5->_appleInternalOptions = (SSEnvironmentDescriptionAppleInternalOptions *)v20;

  uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentDescriptionDate"];
  date = v5->_date;
  v5->_date = (NSDate *)v22;

  uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentDescriptionBetaApplicationBundleID"];
  betaApplicationBundleID = v5->_betaApplicationBundleID;
  v5->_betaApplicationBundleID = (NSString *)v24;

  uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentDescriptionBetaApplicationName"];
  betaApplicationName = v5->_betaApplicationName;
  v5->_betaApplicationName = (NSString *)v26;

  v5->_canAutosaveToFiles = [v4 decodeBoolForKey:@"SSEnvironmentDescriptionCanAutosaveToFilesKey"];
  v5->_skipShutterSound = [v4 decodeBoolForKey:@"SSEnvironmentDescriptionSkipShutterSoundKey"];
  v5->_hasOnenessScreen = [v4 decodeBoolForKey:@"SSEnvironmentDescriptionHasOnenessScreenKey"];
  v5->_externalFlashLayerRenderID = [v4 decodeUInt64ForKey:@"SSEnvironmentDescriptionExternalFlashLayerRenderIDKey"];
  v5->_externalFlashLayerContextID = [v4 decodeUInt64ForKey:@"SSEnvironmentDescriptionExternalFlashLayerContextIDKey"];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = [v4 decodeCollectionOfClass:v28 containingClass:objc_opt_class() forKey:@"SSEnvironmentDescriptionHarvestedMetadataKey"];

  harvestedMetadata = v5->_harvestedMetadata;
  v5->_harvestedMetadata = (NSArray *)v29;

  return v5;
}

- (NSString)loggableDescription
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = NSString;
  v5 = [(SSEnvironmentDescription *)self identifier];
  uint64_t v6 = [v5 shorterLoggableString];
  uint64_t v7 = [v4 stringWithFormat:@"identifier: %@ ", v6];
  [v3 appendString:v7];

  uint64_t v8 = NSString;
  [(SSEnvironmentDescription *)self imagePixelSize];
  uint64_t v9 = NSStringFromCGSize(v48);
  uint64_t v10 = [v8 stringWithFormat:@"pixelSize: %@ ", v9];
  [v3 appendString:v10];

  uint64_t v11 = NSString;
  [(SSEnvironmentDescription *)self imageScale];
  CGFloat v13 = objc_msgSend(v11, "stringWithFormat:", @"scale: %f ", v12);
  [v3 appendString:v13];

  CGFloat v14 = NSString;
  double v15 = [(SSEnvironmentDescription *)self sessionIdentifier];
  uint64_t v16 = [v15 shorterLoggableString];
  v17 = [v14 stringWithFormat:@"sessionIdentifier: %@ ", v16];
  [v3 appendString:v17];

  [v3 appendString:@"elements: ["];
  uint64_t v18 = NSString;
  v19 = [(SSEnvironmentDescription *)self betaApplicationBundleID];
  uint64_t v20 = [v18 stringWithFormat:@"beta app bundleID: %@", v19];
  [v3 appendString:v20];

  v21 = NSString;
  uint64_t v22 = [(SSEnvironmentDescription *)self betaApplicationName];
  v23 = [v21 stringWithFormat:@"beta app name: %@", v22];
  [v3 appendString:v23];

  uint64_t v24 = NSString;
  if ([(SSEnvironmentDescription *)self canAutosaveToFiles]) {
    v25 = @"YES";
  }
  else {
    v25 = @"NO";
  }
  uint64_t v26 = [v24 stringWithFormat:@"can autosave to files: %@", v25];
  [v3 appendString:v26];

  v27 = NSString;
  if ([(SSEnvironmentDescription *)self skipShutterSound]) {
    uint64_t v28 = @"YES";
  }
  else {
    uint64_t v28 = @"NO";
  }
  uint64_t v29 = [v27 stringWithFormat:@"skip shutter sound: %@", v28];
  [v3 appendString:v29];

  v30 = NSString;
  if ([(SSEnvironmentDescription *)self hasOnenessScreen]) {
    v31 = @"YES";
  }
  else {
    v31 = @"NO";
  }
  v32 = [v30 stringWithFormat:@"has oneness screen: %@", v31];
  [v3 appendString:v32];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v33 = [(SSEnvironmentDescription *)self elements];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        [v3 appendString:@"<"];
        v39 = [v38 loggableDescription];
        [v3 appendString:v39];

        [v3 appendString:@">"];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v35);
  }

  [v3 appendString:@"]"];
  return (NSString *)v3;
}

- (CGSize)imagePointSize
{
  [(SSEnvironmentDescription *)self imagePixelSize];
  double v4 = v3;
  double v6 = v5;
  [(SSEnvironmentDescription *)self imageScale];
  double v8 = v6 / v7;
  double v9 = v4 / v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (NSString)currentApplicationBundleID
{
  v2 = [(SSEnvironmentDescription *)self elements];
  if ([v2 count])
  {
    double v3 = [v2 firstObject];
    double v4 = [v3 bundleIdentifier];
  }
  else
  {
    double v4 = 0;
  }

  return (NSString *)v4;
}

- (BSSettings)bsSettings
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v3 setObject:self forSetting:1];
  return (BSSettings *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)elements
{
  return self->_elements;
}

- (SSImageSurface)imageSurface
{
  return self->_imageSurface;
}

- (void)setImageSurface:(id)a3
{
}

- (CGSize)imagePixelSize
{
  double width = self->_imagePixelSize.width;
  double height = self->_imagePixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImagePixelSize:(CGSize)a3
{
  self->_imagePixelSize = a3;
}

- (double)imageScale
{
  return self->_imageScale;
}

- (void)setImageScale:(double)a3
{
  self->_imageScale = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (SSUIServiceOptions)serviceOptions
{
  return self->_serviceOptions;
}

- (void)setServiceOptions:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)externalFlashLayerRenderID
{
  return self->_externalFlashLayerRenderID;
}

- (void)setExternalFlashLayerRenderID:(unint64_t)a3
{
  self->_externalFlashLayerRenderID = a3;
}

- (unsigned)externalFlashLayerContextID
{
  return self->_externalFlashLayerContextID;
}

- (void)setExternalFlashLayerContextID:(unsigned int)a3
{
  self->_externalFlashLayerContextID = a3;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (SSEnvironmentDescriptionAppleInternalOptions)appleInternalOptions
{
  return self->_appleInternalOptions;
}

- (void)setAppleInternalOptions:(id)a3
{
}

- (NSString)betaApplicationBundleID
{
  return self->_betaApplicationBundleID;
}

- (void)setBetaApplicationBundleID:(id)a3
{
}

- (NSString)betaApplicationName
{
  return self->_betaApplicationName;
}

- (void)setBetaApplicationName:(id)a3
{
}

- (BOOL)canAutosaveToFiles
{
  return self->_canAutosaveToFiles;
}

- (void)setCanAutosaveToFiles:(BOOL)a3
{
  self->_canAutosaveToFiles = a3;
}

- (BOOL)skipShutterSound
{
  return self->_skipShutterSound;
}

- (void)setSkipShutterSound:(BOOL)a3
{
  self->_skipShutterSound = a3;
}

- (BOOL)hasOnenessScreen
{
  return self->_hasOnenessScreen;
}

- (void)setHasOnenessScreen:(BOOL)a3
{
  self->_hasOnenessScreen = a3;
}

- (NSArray)harvestedMetadata
{
  return self->_harvestedMetadata;
}

- (void)setHarvestedMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_harvestedMetadata, 0);
  objc_storeStrong((id *)&self->_betaApplicationName, 0);
  objc_storeStrong((id *)&self->_betaApplicationBundleID, 0);
  objc_storeStrong((id *)&self->_appleInternalOptions, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_serviceOptions, 0);
  objc_storeStrong((id *)&self->_imageSurface, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

@end