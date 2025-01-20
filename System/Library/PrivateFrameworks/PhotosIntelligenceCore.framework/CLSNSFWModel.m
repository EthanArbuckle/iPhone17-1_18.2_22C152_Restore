@interface CLSNSFWModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3;
- (CLSNSFWModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (CLSSignalNode)generalNode;
- (id)initForTesting;
- (id)modelInfo;
- (id)nodeForSignalIdentifier:(unint64_t)a3;
- (unint64_t)version;
- (void)processSignals:(id)a3 intoProcessedSignals:(id)a4;
- (void)setupVersion32;
- (void)setupVersion33;
- (void)setupVersion50_4;
@end

@implementation CLSNSFWModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maleUnderwearNode, 0);
  objc_storeStrong((id *)&self->_underwearNode, 0);
  objc_storeStrong((id *)&self->_maleGenitalsNode, 0);
  objc_storeStrong((id *)&self->_femaleGenitalsNode, 0);
  objc_storeStrong((id *)&self->_buttocksNode, 0);
  objc_storeStrong((id *)&self->_maleBreastNode, 0);
  objc_storeStrong((id *)&self->_femaleBreastNode, 0);
  objc_storeStrong((id *)&self->_brassiereNode, 0);
  objc_storeStrong((id *)&self->_explicitNode, 0);
  objc_storeStrong((id *)&self->_generalNode, 0);
  objc_storeStrong((id *)&self->_noneNode, 0);
}

- (CLSSignalNode)generalNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)version
{
  return self->_version;
}

- (id)modelInfo
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __25__CLSNSFWModel_modelInfo__block_invoke;
  v8[3] = &unk_265454170;
  id v4 = v3;
  id v9 = v4;
  v5 = (void (**)(void, void, void))MEMORY[0x25A2E1E50](v8);
  ((void (**)(void, CLSSignalNode *, uint64_t))v5)[2](v5, self->_generalNode, 1);
  ((void (**)(void, CLSSignalNode *, uint64_t))v5)[2](v5, self->_explicitNode, 1);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_noneNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_brassiereNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_femaleBreastNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_maleBreastNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_buttocksNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_femaleGenitalsNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_maleGenitalsNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_underwearNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_maleUnderwearNode, 0);
  id v6 = v4;

  return v6;
}

void __25__CLSNSFWModel_modelInfo__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "signalInfoWithIsHierarchical:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (void)processSignals:(id)a3 intoProcessedSignals:(id)a4
{
  id v17 = a4;
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:&unk_270771108];
  [v7 doubleValue];
  double v9 = v8;

  v10 = [v6 objectForKeyedSubscript:&unk_270771120];
  [v10 doubleValue];

  v11 = [v6 objectForKeyedSubscript:&unk_270771138];

  [v11 doubleValue];
  double v13 = v12;

  if (self->_version < 0x32)
  {
    objc_msgSend(v17, "setIsRecallinglyNSFWExplicit:", -[CLSSignalNode passesHighRecallWithConfidence:](self->_explicitNode, "passesHighRecallWithConfidence:", v13));
    objc_msgSend(v17, "setIsNSFWExplicit:", -[CLSSignalNode passesWithConfidence:](self->_explicitNode, "passesWithConfidence:", v13));
  }
  else
  {
    BOOL v14 = v9 <= 0.3 && v13 >= 0.29;
    [v17 setIsPreciselyNSFWExplicit:v14];
    BOOL v15 = v9 <= 0.39 && v13 >= 0.15;
    [v17 setIsNSFWExplicit:v15];
    BOOL v16 = v9 <= 0.66 && v13 >= 0.08;
    [v17 setIsRecallinglyNSFWExplicit:v16];
  }
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147483136;
}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  switch(a3)
  {
    case 0x7FFFFEF5uLL:
      noneNode = self->_noneNode;
      goto LABEL_13;
    case 0x7FFFFEF6uLL:
      noneNode = self->_generalNode;
      goto LABEL_13;
    case 0x7FFFFEF7uLL:
      noneNode = self->_explicitNode;
      goto LABEL_13;
    case 0x7FFFFEF8uLL:
      noneNode = self->_brassiereNode;
      goto LABEL_13;
    case 0x7FFFFEF9uLL:
      noneNode = self->_femaleBreastNode;
      goto LABEL_13;
    case 0x7FFFFEFAuLL:
      noneNode = self->_maleBreastNode;
      goto LABEL_13;
    case 0x7FFFFEFBuLL:
      noneNode = self->_buttocksNode;
      goto LABEL_13;
    case 0x7FFFFEFCuLL:
      noneNode = self->_femaleGenitalsNode;
      goto LABEL_13;
    case 0x7FFFFEFDuLL:
      noneNode = self->_maleGenitalsNode;
      goto LABEL_13;
    case 0x7FFFFEFEuLL:
      noneNode = self->_underwearNode;
      goto LABEL_13;
    case 0x7FFFFEFFuLL:
      noneNode = self->_maleUnderwearNode;
LABEL_13:
      id v4 = noneNode;
      break;
    default:
      if (-[CLSNSFWModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:"))
      {
        v7 = objc_msgSend(NSString, "stringWithFormat:", @"NSFW - Unknown (%X)", a3);
        id v4 = [[CLSSignalNode alloc] initWithIdentifier:a3 name:v7 operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
      }
      else
      {
        id v4 = 0;
      }
      break;
  }
  return v4;
}

- (void)setupVersion50_4
{
  self->_version = 50;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147483381 name:@"NSFW - None" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  noneNode = self->_noneNode;
  self->_noneNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147483382 name:@"NSFW - General" operatingPoint:0.69 highPrecisionOperatingPoint:0.86 highRecallOperatingPoint:0.43];
  generalNode = self->_generalNode;
  self->_generalNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:2147483383 name:@"NSFW - Explicit" operatingPoint:0.28 highPrecisionOperatingPoint:0.43 highRecallOperatingPoint:0.09];
  explicitNode = self->_explicitNode;
  self->_explicitNode = v7;

  double v9 = [[CLSSignalNode alloc] initWithIdentifier:2147483384 name:@"NSFW - BR" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  brassiereNode = self->_brassiereNode;
  self->_brassiereNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147483385 name:@"NSFW - FB" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v11;

  double v13 = [[CLSSignalNode alloc] initWithIdentifier:2147483386 name:@"NSFW - MB" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v13;

  BOOL v15 = [[CLSSignalNode alloc] initWithIdentifier:2147483387 name:@"NSFW - BT" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v15;

  id v17 = [[CLSSignalNode alloc] initWithIdentifier:2147483388 name:@"NSFW - FG" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:2147483389 name:@"NSFW - MG" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v19;

  v21 = [[CLSSignalNode alloc] initWithIdentifier:2147483390 name:@"NSFW - UW" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  underwearNode = self->_underwearNode;
  self->_underwearNode = v21;

  self->_maleUnderwearNode = [[CLSSignalNode alloc] initWithIdentifier:2147483391 name:@"NSFW - MU" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion33
{
  self->_version = 33;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147483381 name:@"NSFW - None" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  noneNode = self->_noneNode;
  self->_noneNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147483382 name:@"NSFW - General" operatingPoint:0.37 highPrecisionOperatingPoint:0.63 highRecallOperatingPoint:0.22];
  generalNode = self->_generalNode;
  self->_generalNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:2147483383 name:@"NSFW - Explicit" operatingPoint:0.21 highPrecisionOperatingPoint:0.33 highRecallOperatingPoint:0.08];
  explicitNode = self->_explicitNode;
  self->_explicitNode = v7;

  double v9 = [[CLSSignalNode alloc] initWithIdentifier:2147483384 name:@"NSFW - BR" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  brassiereNode = self->_brassiereNode;
  self->_brassiereNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147483385 name:@"NSFW - FB" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v11;

  double v13 = [[CLSSignalNode alloc] initWithIdentifier:2147483386 name:@"NSFW - MB" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v13;

  BOOL v15 = [[CLSSignalNode alloc] initWithIdentifier:2147483387 name:@"NSFW - BT" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v15;

  id v17 = [[CLSSignalNode alloc] initWithIdentifier:2147483388 name:@"NSFW - FG" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:2147483389 name:@"NSFW - MG" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v19;

  v21 = [[CLSSignalNode alloc] initWithIdentifier:2147483390 name:@"NSFW - UW" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  underwearNode = self->_underwearNode;
  self->_underwearNode = v21;

  self->_maleUnderwearNode = [[CLSSignalNode alloc] initWithIdentifier:2147483391 name:@"NSFW - MU" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion32
{
  self->_version = 32;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147483381 name:@"NSFW - None" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  noneNode = self->_noneNode;
  self->_noneNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147483382 name:@"NSFW - General" operatingPoint:0.79 highPrecisionOperatingPoint:0.92 highRecallOperatingPoint:0.49];
  generalNode = self->_generalNode;
  self->_generalNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:2147483383 name:@"NSFW - Explicit" operatingPoint:0.21 highPrecisionOperatingPoint:0.39 highRecallOperatingPoint:0.06];
  explicitNode = self->_explicitNode;
  self->_explicitNode = v7;

  double v9 = [[CLSSignalNode alloc] initWithIdentifier:2147483384 name:@"NSFW - BR" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  brassiereNode = self->_brassiereNode;
  self->_brassiereNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147483385 name:@"NSFW - FB" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v11;

  double v13 = [[CLSSignalNode alloc] initWithIdentifier:2147483386 name:@"NSFW - MB" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v13;

  BOOL v15 = [[CLSSignalNode alloc] initWithIdentifier:2147483387 name:@"NSFW - BT" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v15;

  id v17 = [[CLSSignalNode alloc] initWithIdentifier:2147483388 name:@"NSFW - FG" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:2147483389 name:@"NSFW - MG" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v19;

  v21 = [[CLSSignalNode alloc] initWithIdentifier:2147483390 name:@"NSFW - UW" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  underwearNode = self->_underwearNode;
  self->_underwearNode = v21;

  self->_maleUnderwearNode = [[CLSSignalNode alloc] initWithIdentifier:2147483391 name:@"NSFW - MU" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  MEMORY[0x270F9A758]();
}

- (id)initForTesting
{
  return [(CLSNSFWModel *)self initWithSceneAnalysisVersion:50];
}

- (CLSNSFWModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSNSFWModel;
  id v4 = [(CLSNSFWModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x32)
    {
      if (a3 < 0x21)
      {
        if (a3 == 32)
        {
          [(CLSNSFWModel *)v4 setupVersion32];
        }
        else
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
      }
      else
      {
        [(CLSNSFWModel *)v4 setupVersion33];
      }
    }
    else
    {
      [(CLSNSFWModel *)v4 setupVersion50];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 50;
}

+ (NSString)name
{
  return (NSString *)@"NSFW";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 33;
  if (a3 <= 0x20) {
    unint64_t v3 = 32 * (a3 == 32);
  }
  if (a3 <= 0x31) {
    return v3;
  }
  else {
    return 50;
  }
}

@end