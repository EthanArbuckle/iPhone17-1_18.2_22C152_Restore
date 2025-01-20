@interface CLSIVSNSFWModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3;
- (CLSIVSNSFWModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (CLSSignalNode)anyNode;
- (CLSSignalNode)buttocksNode;
- (CLSSignalNode)explicitNode;
- (CLSSignalNode)femaleBreastNode;
- (CLSSignalNode)femaleGenitalsNode;
- (CLSSignalNode)maleBreastNode;
- (CLSSignalNode)maleGenitalsNode;
- (CLSSignalNode)noneNode;
- (CLSSignalNode)underwearNode;
- (id)initForTesting;
- (id)modelInfo;
- (id)nodeForSignalIdentifier:(unint64_t)a3;
- (unint64_t)version;
- (void)processSignals:(id)a3 intoProcessedSignals:(id)a4;
- (void)setupVersion61;
- (void)setupVersion76;
- (void)setupVersion95;
- (void)setupVersion98;
@end

@implementation CLSIVSNSFWModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underwearNode, 0);
  objc_storeStrong((id *)&self->_noneNode, 0);
  objc_storeStrong((id *)&self->_maleGenitalsNode, 0);
  objc_storeStrong((id *)&self->_femaleGenitalsNode, 0);
  objc_storeStrong((id *)&self->_explicitNode, 0);
  objc_storeStrong((id *)&self->_buttocksNode, 0);
  objc_storeStrong((id *)&self->_maleBreastNode, 0);
  objc_storeStrong((id *)&self->_femaleBreastNode, 0);
  objc_storeStrong((id *)&self->_anyNode, 0);
}

- (CLSSignalNode)underwearNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 80, 1);
}

- (CLSSignalNode)noneNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 72, 1);
}

- (CLSSignalNode)maleGenitalsNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 64, 1);
}

- (CLSSignalNode)femaleGenitalsNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)explicitNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)buttocksNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 40, 1);
}

- (CLSSignalNode)maleBreastNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)femaleBreastNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)anyNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
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
  v8[2] = __28__CLSIVSNSFWModel_modelInfo__block_invoke;
  v8[3] = &unk_265454170;
  id v4 = v3;
  id v9 = v4;
  v5 = (void (**)(void, void, void))MEMORY[0x25A2E1E50](v8);
  ((void (**)(void, CLSSignalNode *, uint64_t))v5)[2](v5, self->_anyNode, 1);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_femaleBreastNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_maleBreastNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_buttocksNode, 0);
  ((void (**)(void, CLSSignalNode *, uint64_t))v5)[2](v5, self->_explicitNode, 1);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_femaleGenitalsNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_maleGenitalsNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_noneNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_underwearNode, 0);
  id v6 = v4;

  return v6;
}

void __28__CLSIVSNSFWModel_modelInfo__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "signalInfoWithIsHierarchical:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (void)processSignals:(id)a3 intoProcessedSignals:(id)a4
{
  id v12 = a4;
  id v6 = [a3 objectForKeyedSubscript:&unk_2707710F0];
  [v6 doubleValue];
  double v8 = v7;

  objc_msgSend(v12, "setIsRecallinglyNSFWExplicit:", -[CLSSignalNode passesHighRecallWithConfidence:](self->_explicitNode, "passesHighRecallWithConfidence:", v8));
  objc_msgSend(v12, "setIsNSFWExplicit:", -[CLSSignalNode passesWithConfidence:](self->_explicitNode, "passesWithConfidence:", v8));
  objc_msgSend(v12, "setIsPreciselyNSFWExplicit:", -[CLSSignalNode passesHighRecallWithConfidence:](self->_explicitNode, "passesHighRecallWithConfidence:", v8));
  unint64_t version = self->_version;
  if (version <= 0x61)
  {
    v11 = v12;
    if (version <= 0x5E)
    {
      if (version <= 0x4B)
      {
        if (version < 0x3D) {
          goto LABEL_10;
        }
        double v10 = 0.96;
      }
      else
      {
        double v10 = 0.898;
      }
    }
    else
    {
      double v10 = 0.87;
    }
  }
  else
  {
    double v10 = 0.883;
  }
  [v12 setIsVeryPreciselyIVSNSFWExplicit:v8 >= v10];
  v11 = v12;
LABEL_10:
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147481600;
}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  switch(a3)
  {
    case 0x7FFFF8F6uLL:
      femaleBreastNode = self->_femaleBreastNode;
      goto LABEL_11;
    case 0x7FFFF8F7uLL:
      femaleBreastNode = self->_maleBreastNode;
      goto LABEL_11;
    case 0x7FFFF8F8uLL:
      femaleBreastNode = self->_buttocksNode;
      goto LABEL_11;
    case 0x7FFFF8F9uLL:
      femaleBreastNode = self->_femaleGenitalsNode;
      goto LABEL_11;
    case 0x7FFFF8FAuLL:
      femaleBreastNode = self->_maleGenitalsNode;
      goto LABEL_11;
    case 0x7FFFF8FBuLL:
      femaleBreastNode = self->_noneNode;
      goto LABEL_11;
    case 0x7FFFF8FCuLL:
      femaleBreastNode = self->_underwearNode;
      goto LABEL_11;
    case 0x7FFFF8FDuLL:
      femaleBreastNode = self->_anyNode;
      goto LABEL_11;
    case 0x7FFFF8FEuLL:
      femaleBreastNode = self->_explicitNode;
LABEL_11:
      id v4 = femaleBreastNode;
      break;
    default:
      if (-[CLSIVSNSFWModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:"))
      {
        double v7 = objc_msgSend(NSString, "stringWithFormat:", @"IVS NSFW - Unknown (%X)", a3);
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

- (void)setupVersion98
{
  self->_unint64_t version = 98;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147481853 name:@"IVS NSFW - Any" operatingPoint:0.73 highPrecisionOperatingPoint:0.91 highRecallOperatingPoint:0.24];
  anyNode = self->_anyNode;
  self->_anyNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147481846 name:@"IVS NSFW - FB" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v5;

  double v7 = [[CLSSignalNode alloc] initWithIdentifier:2147481847 name:@"IVS NSFW - MB" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:2147481848 name:@"IVS NSFW - BT" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147481854 name:@"IVS NSFW - Explicit" operatingPoint:0.68 highPrecisionOperatingPoint:0.883 highRecallOperatingPoint:0.29];
  explicitNode = self->_explicitNode;
  self->_explicitNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:2147481849 name:@"IVS NSFW - FG" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:2147481850 name:@"IVS NSFW - MG" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:2147481851 name:@"IVS NSFW - None" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  noneNode = self->_noneNode;
  self->_noneNode = v17;

  self->_underwearNode = [[CLSSignalNode alloc] initWithIdentifier:2147481852 name:@"IVS NSFW - UW" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion95
{
  self->_unint64_t version = 95;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147481853 name:@"IVS NSFW - Any" operatingPoint:0.66 highPrecisionOperatingPoint:0.87 highRecallOperatingPoint:0.2];
  anyNode = self->_anyNode;
  self->_anyNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147481846 name:@"IVS NSFW - FB" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v5;

  double v7 = [[CLSSignalNode alloc] initWithIdentifier:2147481847 name:@"IVS NSFW - MB" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:2147481848 name:@"IVS NSFW - BT" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147481854 name:@"IVS NSFW - Explicit" operatingPoint:0.527 highPrecisionOperatingPoint:0.873 highRecallOperatingPoint:0.167];
  explicitNode = self->_explicitNode;
  self->_explicitNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:2147481849 name:@"IVS NSFW - FG" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:2147481850 name:@"IVS NSFW - MG" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:2147481851 name:@"IVS NSFW - None" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  noneNode = self->_noneNode;
  self->_noneNode = v17;

  self->_underwearNode = [[CLSSignalNode alloc] initWithIdentifier:2147481852 name:@"IVS NSFW - UW" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion76
{
  self->_unint64_t version = 76;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147481853 name:@"IVS NSFW - Any" operatingPoint:0.77 highPrecisionOperatingPoint:0.91 highRecallOperatingPoint:0.18];
  anyNode = self->_anyNode;
  self->_anyNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147481846 name:@"IVS NSFW - FB" operatingPoint:0.48 highPrecisionOperatingPoint:0.79 highRecallOperatingPoint:0.15];
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v5;

  double v7 = [[CLSSignalNode alloc] initWithIdentifier:2147481847 name:@"IVS NSFW - MB" operatingPoint:0.19 highPrecisionOperatingPoint:0.74 highRecallOperatingPoint:0.08];
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:2147481848 name:@"IVS NSFW - BT" operatingPoint:0.32 highPrecisionOperatingPoint:0.62 highRecallOperatingPoint:0.1];
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147481854 name:@"IVS NSFW - Explicit" operatingPoint:0.63 highPrecisionOperatingPoint:0.84 highRecallOperatingPoint:0.21];
  explicitNode = self->_explicitNode;
  self->_explicitNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:2147481849 name:@"IVS NSFW - FG" operatingPoint:0.4 highPrecisionOperatingPoint:0.73 highRecallOperatingPoint:0.13];
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:2147481850 name:@"IVS NSFW - MG" operatingPoint:0.41 highPrecisionOperatingPoint:0.7 highRecallOperatingPoint:0.13];
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:2147481851 name:@"IVS NSFW - None" operatingPoint:0.15 highPrecisionOperatingPoint:0.64 highRecallOperatingPoint:0.05];
  noneNode = self->_noneNode;
  self->_noneNode = v17;

  self->_underwearNode = [[CLSSignalNode alloc] initWithIdentifier:2147481852 name:@"IVS NSFW - UW" operatingPoint:0.4 highPrecisionOperatingPoint:0.61 highRecallOperatingPoint:0.09];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion61
{
  self->_unint64_t version = 61;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147481853 name:@"IVS NSFW - Any" operatingPoint:0.87 highPrecisionOperatingPoint:0.95 highRecallOperatingPoint:0.11];
  anyNode = self->_anyNode;
  self->_anyNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147481846 name:@"IVS NSFW - FB" operatingPoint:0.14 highPrecisionOperatingPoint:0.82 highRecallOperatingPoint:0.04];
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v5;

  double v7 = [[CLSSignalNode alloc] initWithIdentifier:2147481847 name:@"IVS NSFW - MB" operatingPoint:0.46 highPrecisionOperatingPoint:0.89 highRecallOperatingPoint:0.02];
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:2147481848 name:@"IVS NSFW - BT" operatingPoint:0.62 highPrecisionOperatingPoint:0.68 highRecallOperatingPoint:0.07];
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147481854 name:@"IVS NSFW - Explicit" operatingPoint:0.17 highPrecisionOperatingPoint:0.76 highRecallOperatingPoint:0.02];
  explicitNode = self->_explicitNode;
  self->_explicitNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:2147481849 name:@"IVS NSFW - FG" operatingPoint:0.45 highPrecisionOperatingPoint:0.46 highRecallOperatingPoint:0.01];
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:2147481850 name:@"IVS NSFW - MG" operatingPoint:0.08 highPrecisionOperatingPoint:0.77 highRecallOperatingPoint:0.06];
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:2147481851 name:@"IVS NSFW - None" operatingPoint:0.13 highPrecisionOperatingPoint:0.82 highRecallOperatingPoint:0.01];
  noneNode = self->_noneNode;
  self->_noneNode = v17;

  self->_underwearNode = [[CLSSignalNode alloc] initWithIdentifier:2147481852 name:@"IVS NSFW - UW" operatingPoint:0.13 highPrecisionOperatingPoint:0.62 highRecallOperatingPoint:0.11];
  MEMORY[0x270F9A758]();
}

- (id)initForTesting
{
  return [(CLSIVSNSFWModel *)self initWithSceneAnalysisVersion:98];
}

- (CLSIVSNSFWModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSIVSNSFWModel;
  id v4 = [(CLSIVSNSFWModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x62)
    {
      if (a3 < 0x5F)
      {
        if (a3 < 0x4C)
        {
          if (a3 < 0x3D)
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
            [(CLSIVSNSFWModel *)v4 setupVersion61];
          }
        }
        else
        {
          [(CLSIVSNSFWModel *)v4 setupVersion76];
        }
      }
      else
      {
        [(CLSIVSNSFWModel *)v4 setupVersion95];
      }
    }
    else
    {
      [(CLSIVSNSFWModel *)v4 setupVersion98];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 98;
}

+ (NSString)name
{
  return (NSString *)@"IVS NSFW";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 95;
  uint64_t v4 = 76;
  uint64_t v5 = 61;
  if (a3 < 0x3D) {
    uint64_t v5 = 0;
  }
  if (a3 <= 0x4B) {
    uint64_t v4 = v5;
  }
  if (a3 <= 0x5E) {
    unint64_t v3 = v4;
  }
  if (a3 <= 0x61) {
    return v3;
  }
  else {
    return 98;
  }
}

@end