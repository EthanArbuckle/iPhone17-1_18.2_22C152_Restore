@interface CLSMemeModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (BOOL)isMemeExclusiveFromSceneClassifications:(id)a3;
- (BOOL)isMemeFromSceneClassifications:(id)a3;
- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3;
- (CLSMemeModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (CLSSignalNode)documentNode;
- (CLSSignalNode)memeScreenshotEtcNode;
- (CLSSignalNode)negativeNode;
- (id)initForTesting;
- (id)modelInfo;
- (id)nodeForSignalIdentifier:(unint64_t)a3;
- (unint64_t)version;
- (void)setupVersion55;
- (void)setupVersion59;
- (void)setupVersion62;
@end

@implementation CLSMemeModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memeScreenshotEtcNode, 0);
  objc_storeStrong((id *)&self->_documentNode, 0);
  objc_storeStrong((id *)&self->_negativeNode, 0);
}

- (CLSSignalNode)memeScreenshotEtcNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)documentNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)negativeNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)isMemeFromSceneClassifications:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (-[CLSMemeModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:", objc_msgSend(v10, "extendedSceneIdentifier", (void)v12)))
        {
          if ([(CLSSignalNode *)self->_negativeNode passesWithSignal:v10]) {
            goto LABEL_14;
          }
          if ([(CLSSignalNode *)self->_memeScreenshotEtcNode passesWithSignal:v10]
            || [(CLSSignalNode *)self->_documentNode passesWithSignal:v10])
          {
            char v7 = 1;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
LABEL_14:
    char v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)isMemeExclusiveFromSceneClassifications:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (-[CLSMemeModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:", objc_msgSend(v10, "extendedSceneIdentifier", (void)v12)))
        {
          if ([(CLSSignalNode *)self->_negativeNode passesWithSignal:v10]) {
            goto LABEL_12;
          }
          v7 |= [(CLSSignalNode *)self->_memeScreenshotEtcNode passesWithSignal:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
LABEL_12:
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147482112;
}

- (id)modelInfo
{
  v11[3] = *MEMORY[0x263EF8340];
  v3 = [(CLSMemeModel *)self negativeNode];
  id v4 = [v3 signalInfoWithIsHierarchical:0];
  uint64_t v5 = [(CLSMemeModel *)self documentNode];
  uint64_t v6 = [v5 signalInfoWithIsHierarchical:0];
  v11[1] = v6;
  int v7 = [(CLSMemeModel *)self memeScreenshotEtcNode];
  uint64_t v8 = [v7 signalInfoWithIsHierarchical:0];
  v11[2] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];

  return v9;
}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  switch(a3)
  {
    case 0x7FFFFAFF:
      uint64_t v4 = [(CLSMemeModel *)self memeScreenshotEtcNode];
      goto LABEL_7;
    case 0x7FFFFAFE:
      uint64_t v4 = [(CLSMemeModel *)self documentNode];
      goto LABEL_7;
    case 0x7FFFFAFD:
      uint64_t v4 = [(CLSMemeModel *)self negativeNode];
LABEL_7:
      uint64_t v5 = (CLSSignalNode *)v4;
      goto LABEL_8;
  }
  if ([(CLSMemeModel *)self isResponsibleForSignalIdentifier:a3])
  {
    int v7 = objc_msgSend(NSString, "stringWithFormat:", @"Meme - Unknown (%X)", a3);
    uint64_t v5 = [[CLSSignalNode alloc] initWithIdentifier:a3 name:v7 operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_8:
  return v5;
}

- (void)setupVersion62
{
  self->_version = 62;
  v3 = [[CLSSignalNode alloc] initWithIdentifier:2147482365 name:@"Meme - Negative" operatingPoint:0.98 highPrecisionOperatingPoint:0.997 highRecallOperatingPoint:0.868];
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  uint64_t v5 = [[CLSSignalNode alloc] initWithIdentifier:2147482366 name:@"Meme - Document" operatingPoint:0.838 highPrecisionOperatingPoint:0.955 highRecallOperatingPoint:0.556];
  documentNode = self->_documentNode;
  self->_documentNode = v5;

  self->_memeScreenshotEtcNode = [[CLSSignalNode alloc] initWithIdentifier:2147482367 name:@"Meme - MemeScreenshotEtc" operatingPoint:0.91 highPrecisionOperatingPoint:0.98 highRecallOperatingPoint:0.6];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion59
{
  self->_version = 59;
  v3 = [[CLSSignalNode alloc] initWithIdentifier:2147482365 name:@"Meme - Negative" operatingPoint:0.858 highPrecisionOperatingPoint:0.935 highRecallOperatingPoint:0.232];
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  uint64_t v5 = [[CLSSignalNode alloc] initWithIdentifier:2147482366 name:@"Meme - Document" operatingPoint:0.543 highPrecisionOperatingPoint:0.866 highRecallOperatingPoint:0.282];
  documentNode = self->_documentNode;
  self->_documentNode = v5;

  self->_memeScreenshotEtcNode = [[CLSSignalNode alloc] initWithIdentifier:2147482367 name:@"Meme - MemeScreenshotEtc" operatingPoint:0.976 highPrecisionOperatingPoint:0.996 highRecallOperatingPoint:0.868];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion55
{
  self->_version = 55;
  v3 = [[CLSSignalNode alloc] initWithIdentifier:2147482365 name:@"Meme - Negative" operatingPoint:0.889 highPrecisionOperatingPoint:0.975 highRecallOperatingPoint:0.707];
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  uint64_t v5 = [[CLSSignalNode alloc] initWithIdentifier:2147482366 name:@"Meme - Document" operatingPoint:0.406 highPrecisionOperatingPoint:0.727 highRecallOperatingPoint:0.078];
  documentNode = self->_documentNode;
  self->_documentNode = v5;

  self->_memeScreenshotEtcNode = [[CLSSignalNode alloc] initWithIdentifier:2147482367 name:@"Meme - MemeScreenshotEtc" operatingPoint:0.993 highPrecisionOperatingPoint:0.997 highRecallOperatingPoint:0.925];
  MEMORY[0x270F9A758]();
}

- (id)initForTesting
{
  return [(CLSMemeModel *)self initWithSceneAnalysisVersion:62];
}

- (CLSMemeModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSMemeModel;
  uint64_t v4 = [(CLSMemeModel *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    if (a3 < 0x3E)
    {
      if (a3 < 0x3B)
      {
        if (a3 < 0x37)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v6 = objc_opt_class();
            *(_DWORD *)buf = 67109378;
            int v10 = a3;
            __int16 v11 = 2112;
            uint64_t v12 = v6;
            _os_log_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
          }

          return 0;
        }
        else
        {
          [(CLSMemeModel *)v4 setupVersion55];
        }
      }
      else
      {
        [(CLSMemeModel *)v4 setupVersion59];
      }
    }
    else
    {
      [(CLSMemeModel *)v4 setupVersion62];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 62;
}

+ (NSString)name
{
  return (NSString *)@"Meme Model";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 59;
  uint64_t v4 = 55;
  if (a3 < 0x37) {
    uint64_t v4 = 0;
  }
  if (a3 <= 0x3A) {
    unint64_t v3 = v4;
  }
  if (a3 <= 0x3D) {
    return v3;
  }
  else {
    return 62;
  }
}

@end