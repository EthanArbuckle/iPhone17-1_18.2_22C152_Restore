@interface CLSTabooEventModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3;
- (CLSSignalNode)bloodNode;
- (CLSSignalNode)demonstrationNode;
- (CLSSignalNode)destructionNode;
- (CLSSignalNode)fireDevastationNode;
- (CLSSignalNode)floodDevastationNode;
- (CLSSignalNode)funeralNode;
- (CLSSignalNode)hospitalNode;
- (CLSSignalNode)religiousSettingNode;
- (CLSSignalNode)vehicleCrashNode;
- (CLSSignalNode)warNode;
- (CLSTabooEventModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (id)initForTesting;
- (id)modelInfo;
- (id)nodeForSignalIdentifier:(unint64_t)a3;
- (unint64_t)version;
- (void)setupVersion32;
- (void)setupVersion33;
- (void)setupVersion50_4;
- (void)setupVersion85;
@end

@implementation CLSTabooEventModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warNode, 0);
  objc_storeStrong((id *)&self->_vehicleCrashNode, 0);
  objc_storeStrong((id *)&self->_religiousSettingNode, 0);
  objc_storeStrong((id *)&self->_hospitalNode, 0);
  objc_storeStrong((id *)&self->_funeralNode, 0);
  objc_storeStrong((id *)&self->_floodDevastationNode, 0);
  objc_storeStrong((id *)&self->_fireDevastationNode, 0);
  objc_storeStrong((id *)&self->_destructionNode, 0);
  objc_storeStrong((id *)&self->_demonstrationNode, 0);
  objc_storeStrong((id *)&self->_bloodNode, 0);
}

- (CLSSignalNode)warNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 88, 1);
}

- (CLSSignalNode)vehicleCrashNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 80, 1);
}

- (CLSSignalNode)religiousSettingNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 72, 1);
}

- (CLSSignalNode)hospitalNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 64, 1);
}

- (CLSSignalNode)funeralNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)floodDevastationNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)fireDevastationNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 40, 1);
}

- (CLSSignalNode)destructionNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)demonstrationNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)bloodNode
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
  v8[2] = __31__CLSTabooEventModel_modelInfo__block_invoke;
  v8[3] = &unk_265454170;
  id v4 = v3;
  id v9 = v4;
  v5 = (void (**)(void, void, void))MEMORY[0x25A2E1E50](v8);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_bloodNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_demonstrationNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_destructionNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_fireDevastationNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_floodDevastationNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_funeralNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_hospitalNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_religiousSettingNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_vehicleCrashNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_warNode, 0);
  id v6 = v4;

  return v6;
}

void __31__CLSTabooEventModel_modelInfo__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "signalInfoWithIsHierarchical:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147482624;
}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  switch(a3)
  {
    case 0x7FFFFCF6uLL:
      destructionNode = self->_destructionNode;
      goto LABEL_14;
    case 0x7FFFFCF7uLL:
      destructionNode = self->_bloodNode;
      goto LABEL_14;
    case 0x7FFFFCF8uLL:
      destructionNode = self->_demonstrationNode;
      goto LABEL_14;
    case 0x7FFFFCF9uLL:
      destructionNode = self->_fireDevastationNode;
      goto LABEL_14;
    case 0x7FFFFCFAuLL:
      destructionNode = self->_floodDevastationNode;
      goto LABEL_14;
    case 0x7FFFFCFBuLL:
      destructionNode = self->_funeralNode;
      goto LABEL_14;
    case 0x7FFFFCFCuLL:
      destructionNode = self->_hospitalNode;
      goto LABEL_14;
    case 0x7FFFFCFDuLL:
      destructionNode = self->_religiousSettingNode;
      goto LABEL_14;
    case 0x7FFFFCFEuLL:
      destructionNode = self->_vehicleCrashNode;
      goto LABEL_14;
    case 0x7FFFFCFFuLL:
      destructionNode = self->_warNode;
LABEL_14:
      id v6 = destructionNode;
      break;
    default:
      if (-[CLSTabooEventModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:"))
      {
        v5 = objc_msgSend(NSString, "stringWithFormat:", @"TE - Unknown (%X)", a3);
        id v6 = [[CLSSignalNode alloc] initWithIdentifier:a3 name:v5 operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
      }
      else
      {
        id v6 = 0;
      }
      break;
  }
  return v6;
}

- (void)setupVersion85
{
  self->_version = 85;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147482871 name:@"TE - Blood" operatingPoint:0.09 highPrecisionOperatingPoint:0.32 highRecallOperatingPoint:0.02];
  bloodNode = self->_bloodNode;
  self->_bloodNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147482872 name:@"TE - Demonstration" operatingPoint:0.08 highPrecisionOperatingPoint:0.41 highRecallOperatingPoint:0.06];
  demonstrationNode = self->_demonstrationNode;
  self->_demonstrationNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:2147482870 name:@"TE - Destruction" operatingPoint:0.19 highPrecisionOperatingPoint:0.39 highRecallOperatingPoint:0.04];
  destructionNode = self->_destructionNode;
  self->_destructionNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:2147482873 name:@"TE - Fire Devastation" operatingPoint:0.06 highPrecisionOperatingPoint:0.29 highRecallOperatingPoint:0.04];
  fireDevastationNode = self->_fireDevastationNode;
  self->_fireDevastationNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147482874 name:@"TE - Flood Devastation" operatingPoint:0.17 highPrecisionOperatingPoint:0.31 highRecallOperatingPoint:0.04];
  floodDevastationNode = self->_floodDevastationNode;
  self->_floodDevastationNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:2147482875 name:@"TE - Funeral" operatingPoint:0.08 highPrecisionOperatingPoint:0.24 highRecallOperatingPoint:0.03];
  funeralNode = self->_funeralNode;
  self->_funeralNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:2147482876 name:@"TE - Hospital" operatingPoint:0.12 highPrecisionOperatingPoint:0.31 highRecallOperatingPoint:0.05];
  hospitalNode = self->_hospitalNode;
  self->_hospitalNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:2147482877 name:@"TE - Religious Setting" operatingPoint:0.12 highPrecisionOperatingPoint:0.28 highRecallOperatingPoint:0.06];
  religiousSettingNode = self->_religiousSettingNode;
  self->_religiousSettingNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:2147482878 name:@"TE - Vehicle Crash" operatingPoint:0.1 highPrecisionOperatingPoint:0.21 highRecallOperatingPoint:0.03];
  vehicleCrashNode = self->_vehicleCrashNode;
  self->_vehicleCrashNode = v19;

  self->_warNode = [[CLSSignalNode alloc] initWithIdentifier:2147482879 name:@"TE - War" operatingPoint:0.1 highPrecisionOperatingPoint:0.19 highRecallOperatingPoint:0.02];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion50_4
{
  self->_version = 50;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147482871 name:@"TE - Blood" operatingPoint:0.04 highPrecisionOperatingPoint:0.16 highRecallOperatingPoint:0.04];
  bloodNode = self->_bloodNode;
  self->_bloodNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147482872 name:@"TE - Demonstration" operatingPoint:0.15 highPrecisionOperatingPoint:0.22 highRecallOperatingPoint:0.05];
  demonstrationNode = self->_demonstrationNode;
  self->_demonstrationNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:2147482870 name:@"TE - Destruction" operatingPoint:0.11 highPrecisionOperatingPoint:0.27 highRecallOperatingPoint:0.05];
  destructionNode = self->_destructionNode;
  self->_destructionNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:2147482873 name:@"TE - Fire Devastation" operatingPoint:0.26 highPrecisionOperatingPoint:0.36 highRecallOperatingPoint:0.06];
  fireDevastationNode = self->_fireDevastationNode;
  self->_fireDevastationNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147482874 name:@"TE - Flood Devastation" operatingPoint:0.12 highPrecisionOperatingPoint:0.18 highRecallOperatingPoint:0.03];
  floodDevastationNode = self->_floodDevastationNode;
  self->_floodDevastationNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:2147482875 name:@"TE - Funeral" operatingPoint:0.16 highPrecisionOperatingPoint:0.3 highRecallOperatingPoint:0.06];
  funeralNode = self->_funeralNode;
  self->_funeralNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:2147482876 name:@"TE - Hospital" operatingPoint:0.19 highPrecisionOperatingPoint:0.23 highRecallOperatingPoint:0.05];
  hospitalNode = self->_hospitalNode;
  self->_hospitalNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:2147482877 name:@"TE - Religious Setting" operatingPoint:0.13 highPrecisionOperatingPoint:0.37 highRecallOperatingPoint:0.09];
  religiousSettingNode = self->_religiousSettingNode;
  self->_religiousSettingNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:2147482878 name:@"TE - Vehicle Crash" operatingPoint:0.1 highPrecisionOperatingPoint:0.17 highRecallOperatingPoint:0.02];
  vehicleCrashNode = self->_vehicleCrashNode;
  self->_vehicleCrashNode = v19;

  self->_warNode = [[CLSSignalNode alloc] initWithIdentifier:2147482879 name:@"TE - War" operatingPoint:0.07 highPrecisionOperatingPoint:0.07 highRecallOperatingPoint:0.03];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion33
{
  self->_version = 33;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147482871 name:@"TE - Blood" operatingPoint:0.53 highPrecisionOperatingPoint:0.57 highRecallOperatingPoint:0.14];
  bloodNode = self->_bloodNode;
  self->_bloodNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147482872 name:@"TE - Demonstration" operatingPoint:0.39 highPrecisionOperatingPoint:0.59 highRecallOperatingPoint:0.25];
  demonstrationNode = self->_demonstrationNode;
  self->_demonstrationNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:2147482870 name:@"TE - Destruction" operatingPoint:0.46 highPrecisionOperatingPoint:0.49 highRecallOperatingPoint:0.28];
  destructionNode = self->_destructionNode;
  self->_destructionNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:2147482873 name:@"TE - Fire Devastation" operatingPoint:0.5 highPrecisionOperatingPoint:0.73 highRecallOperatingPoint:0.48];
  fireDevastationNode = self->_fireDevastationNode;
  self->_fireDevastationNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147482874 name:@"TE - Flood Devastation" operatingPoint:0.42 highPrecisionOperatingPoint:0.64 highRecallOperatingPoint:0.18];
  floodDevastationNode = self->_floodDevastationNode;
  self->_floodDevastationNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:2147482875 name:@"TE - Funeral" operatingPoint:0.29 highPrecisionOperatingPoint:0.65 highRecallOperatingPoint:0.29];
  funeralNode = self->_funeralNode;
  self->_funeralNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:2147482876 name:@"TE - Hospital" operatingPoint:0.46 highPrecisionOperatingPoint:0.51 highRecallOperatingPoint:0.26];
  hospitalNode = self->_hospitalNode;
  self->_hospitalNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:2147482877 name:@"TE - Religious Setting" operatingPoint:0.34 highPrecisionOperatingPoint:0.49 highRecallOperatingPoint:0.09];
  religiousSettingNode = self->_religiousSettingNode;
  self->_religiousSettingNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:2147482878 name:@"TE - Vehicle Crash" operatingPoint:0.21 highPrecisionOperatingPoint:0.27 highRecallOperatingPoint:0.11];
  vehicleCrashNode = self->_vehicleCrashNode;
  self->_vehicleCrashNode = v19;

  self->_warNode = [[CLSSignalNode alloc] initWithIdentifier:2147482879 name:@"TE - War" operatingPoint:0.12 highPrecisionOperatingPoint:0.36 highRecallOperatingPoint:0.08];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion32
{
  self->_version = 32;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147482871 name:@"TE - Blood" operatingPoint:0.24 highPrecisionOperatingPoint:0.24 highRecallOperatingPoint:0.24];
  bloodNode = self->_bloodNode;
  self->_bloodNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147482872 name:@"TE - Demonstration" operatingPoint:0.75 highPrecisionOperatingPoint:0.75 highRecallOperatingPoint:0.75];
  demonstrationNode = self->_demonstrationNode;
  self->_demonstrationNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:2147482873 name:@"TE - Fire Devastation" operatingPoint:0.13 highPrecisionOperatingPoint:0.13 highRecallOperatingPoint:0.13];
  fireDevastationNode = self->_fireDevastationNode;
  self->_fireDevastationNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:2147482874 name:@"TE - Flood Devastation" operatingPoint:0.22 highPrecisionOperatingPoint:0.22 highRecallOperatingPoint:0.22];
  floodDevastationNode = self->_floodDevastationNode;
  self->_floodDevastationNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147482875 name:@"TE - Funeral" operatingPoint:0.33 highPrecisionOperatingPoint:0.33 highRecallOperatingPoint:0.33];
  funeralNode = self->_funeralNode;
  self->_funeralNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:2147482876 name:@"TE - Hospital" operatingPoint:0.52 highPrecisionOperatingPoint:0.52 highRecallOperatingPoint:0.52];
  hospitalNode = self->_hospitalNode;
  self->_hospitalNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:2147482877 name:@"TE - Religious Setting" operatingPoint:0.66 highPrecisionOperatingPoint:0.66 highRecallOperatingPoint:0.66];
  religiousSettingNode = self->_religiousSettingNode;
  self->_religiousSettingNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:2147482878 name:@"TE - Vehicle Crash" operatingPoint:0.01 highPrecisionOperatingPoint:0.01 highRecallOperatingPoint:0.01];
  vehicleCrashNode = self->_vehicleCrashNode;
  self->_vehicleCrashNode = v17;

  self->_warNode = [[CLSSignalNode alloc] initWithIdentifier:2147482879 name:@"TE - War" operatingPoint:0.26 highPrecisionOperatingPoint:0.26 highRecallOperatingPoint:0.26];
  MEMORY[0x270F9A758]();
}

- (id)initForTesting
{
  return [(CLSTabooEventModel *)self initWithSceneAnalysisVersion:85];
}

- (CLSTabooEventModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSTabooEventModel;
  id v4 = [(CLSTabooEventModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x55)
    {
      if (a3 < 0x32)
      {
        if (a3 < 0x21)
        {
          if (a3 == 32)
          {
            [(CLSTabooEventModel *)v4 setupVersion32];
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
          [(CLSTabooEventModel *)v4 setupVersion33];
        }
      }
      else
      {
        [(CLSTabooEventModel *)v4 setupVersion50];
      }
    }
    else
    {
      [(CLSTabooEventModel *)v4 setupVersion85];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 85;
}

+ (NSString)name
{
  return (NSString *)@"Taboo Event";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 50;
  uint64_t v4 = 33;
  if (a3 <= 0x20) {
    uint64_t v4 = 32 * (a3 == 32);
  }
  if (a3 <= 0x31) {
    unint64_t v3 = v4;
  }
  if (a3 <= 0x54) {
    return v3;
  }
  else {
    return 85;
  }
}

@end