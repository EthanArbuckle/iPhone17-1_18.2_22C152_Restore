@interface SLUresMitigatorConfigDecoder
- (SLUresMitigatorConfigDecoder)initWithConfigFile:(id)a3 errOut:(id *)a4;
- (id)getBnnsIrWeightFile;
- (id)getInputOpsMap;
- (id)getModelFile;
- (id)getOutputMap;
- (id)getSupportedInputOrigins;
- (id)getVersion;
@end

@implementation SLUresMitigatorConfigDecoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_configDict, 0);
}

- (id)getSupportedInputOrigins
{
  return [(NSDictionary *)self->_configDict objectForKeyedSubscript:@"SupportedInputOrigins"];
}

- (id)getOutputMap
{
  return [(NSDictionary *)self->_configDict objectForKeyedSubscript:@"OutputMap"];
}

- (id)getInputOpsMap
{
  return [(NSDictionary *)self->_configDict objectForKeyedSubscript:@"InputOpsMap"];
}

- (id)getVersion
{
  return [(NSDictionary *)self->_configDict objectForKeyedSubscript:@"Version"];
}

- (id)getBnnsIrWeightFile
{
  v3 = [(NSDictionary *)self->_configDict objectForKeyedSubscript:@"BnnsIrWeightFile"];

  if (v3)
  {
    resourcePath = self->_resourcePath;
    v5 = [(NSDictionary *)self->_configDict objectForKeyedSubscript:@"BnnsIrWeightFile"];
    v6 = [(NSString *)resourcePath stringByAppendingPathComponent:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)getModelFile
{
  uint64_t v3 = *MEMORY[0x263F38178];
  v4 = [(NSDictionary *)self->_configDict objectForKeyedSubscript:*MEMORY[0x263F38178]];

  if (v4)
  {
    resourcePath = self->_resourcePath;
    v6 = [(NSDictionary *)self->_configDict objectForKeyedSubscript:v3];
    v7 = [(NSString *)resourcePath stringByAppendingPathComponent:v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (SLUresMitigatorConfigDecoder)initWithConfigFile:(id)a3 errOut:(id *)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SLUresMitigatorConfigDecoder;
  v7 = [(SLUresMitigatorConfigDecoder *)&v25 init];
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = [v6 stringByDeletingLastPathComponent];
  resourcePath = v7->_resourcePath;
  v7->_resourcePath = (NSString *)v8;

  uint64_t v10 = [MEMORY[0x263F38060] decodeJsonFromFile:v6];
  configDict = v7->_configDict;
  v7->_configDict = (NSDictionary *)v10;

  v12 = v7->_configDict;
  if (v12)
  {
    uint64_t v13 = [(NSDictionary *)v12 objectForKeyedSubscript:*MEMORY[0x263F38178]];
    if (v13)
    {
      v14 = (void *)v13;
      v15 = [(NSDictionary *)v7->_configDict objectForKeyedSubscript:@"InputOpsMap"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [(NSDictionary *)v7->_configDict objectForKeyedSubscript:@"OutputMap"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
  }
  v18 = [NSString stringWithFormat:@"Missing config for Ures %@", v7->_configDict];
  v19 = (void *)MEMORY[0x263F087E8];
  v26 = @"reason";
  v27[0] = v18;
  v20 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  v21 = [v19 errorWithDomain:@"com.apple.sl" code:105 userInfo:v20];

  if (!a4)
  {

LABEL_11:
    v23 = v7;
    goto LABEL_12;
  }
  id v22 = v21;
  *a4 = v22;

  v23 = 0;
LABEL_12:

  return v23;
}

@end