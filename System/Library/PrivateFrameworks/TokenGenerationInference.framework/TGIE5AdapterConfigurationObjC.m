@interface TGIE5AdapterConfigurationObjC
- (BOOL)isEqual:(id)a3;
- (NSString)adapterType;
- (NSString)mutableWeightsFilePath;
- (NSString)symbolName;
- (TGIE5AdapterConfiguration)adapterConfiguration;
- (TGIE5AdapterConfigurationObjC)initWithAdapterType:(id)a3 symbolName:(id)a4 mutableWeightsFilePath:(id)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation TGIE5AdapterConfigurationObjC

- (TGIE5AdapterConfigurationObjC)initWithAdapterType:(id)a3 symbolName:(id)a4 mutableWeightsFilePath:(id)a5
{
  v25[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (__CFString *)a5;
  v23.receiver = self;
  v23.super_class = (Class)TGIE5AdapterConfigurationObjC;
  v11 = [(TGIE5AdapterConfigurationObjC *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    adapterType = v11->_adapterType;
    v11->_adapterType = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    symbolName = v11->_symbolName;
    v11->_symbolName = (NSString *)v14;

    uint64_t v16 = [(__CFString *)v10 copy];
    mutableWeightsFilePath = v11->_mutableWeightsFilePath;
    v11->_mutableWeightsFilePath = (NSString *)v16;

    v24[0] = @"adapterType";
    v24[1] = @"symbolName";
    v25[0] = v8;
    v25[1] = v9;
    v24[2] = @"mutableWeightsFilePath";
    if (v10) {
      v18 = v10;
    }
    else {
      v18 = @"nil";
    }
    v25[2] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
    uint64_t v20 = [v19 description];
    description = v11->_description;
    v11->_description = (NSString *)v20;
  }
  return v11;
}

- (TGIE5AdapterConfiguration)adapterConfiguration
{
  v2 = v1;
  objc_msgSend(v1, "adapterType", 0, 0, 0);
  id v4 = objc_claimAutoreleasedReturnValue();
  std::string::basic_string[abi:ne180100]<0>(retstr, (char *)[v4 UTF8String]);
  id v5 = [v2 symbolName];
  std::string::basic_string[abi:ne180100]<0>(retstr->var0.var0.var1.var0, (char *)[v5 UTF8String]);
  id v6 = [v2 mutableWeightsFilePath];
  id v9 = (char *)[v6 UTF8String];
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)&retstr[1], &v9);

  id v9 = (char *)&v8;
  std::vector<TGIE5Function>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);
  return result;
}

- (unint64_t)hash
{
  v3 = [(TGIE5AdapterConfigurationObjC *)self adapterType];
  uint64_t v4 = [v3 hash];

  id v5 = [(TGIE5AdapterConfigurationObjC *)self symbolName];
  uint64_t v6 = [v5 hash];

  v7 = [(TGIE5AdapterConfigurationObjC *)self mutableWeightsFilePath];
  unint64_t v8 = v6 ^ v4 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(TGIE5AdapterConfigurationObjC *)self adapterType];
    v7 = [v5 adapterType];
    if ([v6 isEqual:v7])
    {
      unint64_t v8 = [(TGIE5AdapterConfigurationObjC *)self symbolName];
      id v9 = [v5 symbolName];
      if ([v8 isEqual:v9])
      {
        v10 = [(TGIE5AdapterConfigurationObjC *)self mutableWeightsFilePath];
        v11 = [v5 mutableWeightsFilePath];
        char v12 = [v10 isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)adapterType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)mutableWeightsFilePath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableWeightsFilePath, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_adapterType, 0);

  objc_storeStrong((id *)&self->_description, 0);
}

@end