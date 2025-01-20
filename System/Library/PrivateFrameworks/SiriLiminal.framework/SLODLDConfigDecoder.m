@interface SLODLDConfigDecoder
- (BOOL)isSPMModelMmapable;
- (NSDictionary)dictionary;
- (NSString)resourcePath;
- (SLODLDConfigDecoder)initWithConfigFile:(id)a3;
- (id)getBertModelFile;
- (id)getBertModelOutputNodes;
- (id)getConfigVersion;
- (id)getOdldModelBnnsIrWeightFile;
- (id)getOutputSpecs;
- (id)getRegexMapConfig;
- (id)getSPMEncoderOptions;
- (id)getSPMModelFile;
- (unint64_t)getInputType;
- (unint64_t)getPreProcessorType;
- (unint64_t)getTokenizerType;
- (void)setDictionary:(id)a3;
- (void)setResourcePath:(id)a3;
@end

@implementation SLODLDConfigDecoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

- (void)setDictionary:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setResourcePath:(id)a3
{
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (BOOL)isSPMModelMmapable
{
  v2 = [MEMORY[0x263F38060] getOdldValueForKey:@"tokenizer" categoryKey:*MEMORY[0x263F38160] configDict:self->_dictionary];
  v3 = [v2 objectForKeyedSubscript:@"mmapModel"];

  if (v3)
  {
    v4 = [v2 objectForKeyedSubscript:@"mmapModel"];
    LOBYTE(v3) = [v4 BOOLValue];
  }
  return (char)v3;
}

- (id)getBertModelOutputNodes
{
  v2 = [MEMORY[0x263F38060] getOdldValueForKey:*MEMORY[0x263F38158] categoryKey:*MEMORY[0x263F38160] configDict:self->_dictionary];
  v3 = [v2 objectForKeyedSubscript:@"outputNodeName"];

  if (v3)
  {
    v3 = [v2 objectForKeyedSubscript:@"outputNodeName"];
  }

  return v3;
}

- (id)getOdldModelBnnsIrWeightFile
{
  v3 = [MEMORY[0x263F38060] getOdldValueForKey:@"BnnsIrWeightFile" categoryKey:*MEMORY[0x263F38160] configDict:self->_dictionary];
  v4 = [(SLODLDConfigDecoder *)self getBertModelFile];
  if ([v4 hasSuffix:*MEMORY[0x263F37F90]]
    && ([v3 objectForKeyedSubscript:@"BnnsIrWeightFile"],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    resourcePath = self->_resourcePath;
    v7 = [v3 objectForKeyedSubscript:@"BnnsIrWeightFile"];
    v8 = [(NSString *)resourcePath stringByAppendingPathComponent:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getBertModelFile
{
  return (id)[MEMORY[0x263F38060] getOdldModelFileFromConfigDict:self->_dictionary resourcePath:self->_resourcePath];
}

- (id)getSPMEncoderOptions
{
  v2 = [MEMORY[0x263F38060] getOdldValueForKey:@"tokenizer" categoryKey:*MEMORY[0x263F38160] configDict:self->_dictionary];
  v3 = [v2 objectForKeyedSubscript:@"spmEncodeOptions"];

  if (v3)
  {
    v3 = [v2 objectForKeyedSubscript:@"spmEncodeOptions"];
  }

  return v3;
}

- (id)getSPMModelFile
{
  v3 = [MEMORY[0x263F38060] getOdldValueForKey:@"tokenizer" categoryKey:*MEMORY[0x263F38160] configDict:self->_dictionary];
  v4 = [v3 objectForKeyedSubscript:@"spmModel"];

  if (v4)
  {
    resourcePath = self->_resourcePath;
    v6 = [v3 objectForKeyedSubscript:@"spmModel"];
    v7 = [(NSString *)resourcePath stringByAppendingPathComponent:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getRegexMapConfig
{
  v3 = [MEMORY[0x263F38060] getOdldValueForKey:@"preprocessing" categoryKey:*MEMORY[0x263F38160] configDict:self->_dictionary];
  v4 = [v3 objectForKeyedSubscript:@"regexMapConfig"];

  if (v4)
  {
    resourcePath = self->_resourcePath;
    v6 = [v3 objectForKeyedSubscript:@"regexMapConfig"];
    v7 = [(NSString *)resourcePath stringByAppendingPathComponent:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)getTokenizerType
{
  v2 = [MEMORY[0x263F38060] getOdldValueForKey:@"tokenizer" categoryKey:*MEMORY[0x263F38160] configDict:self->_dictionary];
  v3 = [v2 objectForKeyedSubscript:@"spmModel"];

  return v3 != 0;
}

- (unint64_t)getPreProcessorType
{
  v2 = [MEMORY[0x263F38060] getOdldValueForKey:@"preprocessing" categoryKey:*MEMORY[0x263F38160] configDict:self->_dictionary];
  v3 = [v2 objectForKeyedSubscript:@"regexMapConfig"];

  return v3 != 0;
}

- (id)getOutputSpecs
{
  return [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"outputSpecs"];
}

- (unint64_t)getInputType
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"inputType"];
  if ([v2 isEqualToString:@"PostITN"])
  {
    unint64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"PreITN"])
  {
    unint64_t v3 = 2;
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)getConfigVersion
{
  return [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"version"];
}

- (SLODLDConfigDecoder)initWithConfigFile:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SLODLDConfigDecoder;
  v5 = [(SLODLDConfigDecoder *)&v23 init];
  if (!v5)
  {
LABEL_12:
    v14 = v5;
    goto LABEL_13;
  }
  v6 = [MEMORY[0x263F38060] decodeJsonFromFile:v4];
  v7 = v6;
  if (v6)
  {
    v8 = [(NSDictionary *)v6 objectForKeyedSubscript:@"version"];

    if (v8)
    {
LABEL_9:
      uint64_t v15 = [v4 stringByDeletingLastPathComponent];
      resourcePath = v5->_resourcePath;
      v5->_resourcePath = (NSString *)v15;

      v17 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v5->_resourcePath;
        *(_DWORD *)buf = 136315394;
        v25 = "-[SLODLDConfigDecoder initWithConfigFile:]";
        __int16 v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_21EFF4000, v17, OS_LOG_TYPE_DEFAULT, "%s Decoded config at path: %@", buf, 0x16u);
      }
      dictionary = v5->_dictionary;
      v5->_dictionary = v7;

      goto LABEL_12;
    }
  }
  v9 = [NSString stringWithFormat:@"Missing config for regex matcher %@", v7];
  v10 = (void *)MEMORY[0x263F087E8];
  v28 = @"reason";
  v29[0] = v9;
  v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
  v12 = [v10 errorWithDomain:@"com.apple.sl" code:115 userInfo:v11];

  if (!v12)
  {

    goto LABEL_9;
  }
  v13 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v21 = v13;
    v22 = [v12 localizedDescription];
    *(_DWORD *)buf = 136315394;
    v25 = "-[SLODLDConfigDecoder initWithConfigFile:]";
    __int16 v26 = 2112;
    v27 = v22;
    _os_log_error_impl(&dword_21EFF4000, v21, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v14 = 0;
LABEL_13:

  return v14;
}

@end