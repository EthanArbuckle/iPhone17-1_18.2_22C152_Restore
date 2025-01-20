@interface TGIE5ModelConfigurationObjC
- (BOOL)isEqual:(id)a3;
- (BOOL)useEnergyEfficientMode;
- (BOOL)useModelCatalogE5CompilerCache;
- (NSSet)adapterConfigurations;
- (NSSet)e5Functions;
- (NSString)assetIdentifier;
- (NSString)modelBundlePath;
- (NSString)serializeModelIOPath;
- (TGIE5BaseModelObjC)baseModel;
- (TGIE5ModelConfiguration)modelConfiguration;
- (TGIE5ModelConfigurationObjC)initWithModelType:(int64_t)a3 modelBundlePath:(id)a4 e5Functions:(id)a5 adapterConfigurations:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)modelType;
- (unint64_t)hash;
- (void)setAssetIdentifier:(id)a3;
- (void)setBaseModel:(id)a3;
- (void)setSerializeModelIOPath:(id)a3;
- (void)setUseEnergyEfficientMode:(BOOL)a3;
- (void)setUseModelCatalogE5CompilerCache:(BOOL)a3;
@end

@implementation TGIE5ModelConfigurationObjC

- (TGIE5ModelConfigurationObjC)initWithModelType:(int64_t)a3 modelBundlePath:(id)a4 e5Functions:(id)a5 adapterConfigurations:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)TGIE5ModelConfigurationObjC;
  v13 = [(TGIE5ModelConfigurationObjC *)&v23 init];
  v14 = v13;
  if (v13)
  {
    v13->_modelType = a3;
    uint64_t v15 = [v10 copy];
    modelBundlePath = v14->_modelBundlePath;
    v14->_modelBundlePath = (NSString *)v15;

    uint64_t v17 = [v12 copy];
    adapterConfigurations = v14->_adapterConfigurations;
    v14->_adapterConfigurations = (NSSet *)v17;

    uint64_t v19 = [v11 copy];
    e5Functions = v14->_e5Functions;
    v14->_e5Functions = (NSSet *)v19;

    *(_WORD *)&v14->_useEnergyEfficientMode = 0;
    assetIdentifier = v14->_assetIdentifier;
    v14->_assetIdentifier = (NSString *)&stru_270BD5D98;
  }
  return v14;
}

- (TGIE5ModelConfiguration)modelConfiguration
{
  v2 = v1;
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v4 = [v1 modelType];
  if (v4 == 1) {
    int v5 = 1;
  }
  else {
    int v5 = 2 * (v4 == 2);
  }
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v6 = [v2 adapterConfigurations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (v10)
        {
          [v10 adapterConfiguration];
        }
        else
        {
          uint64_t v44 = 0;
          *(_OWORD *)v42 = 0u;
          *(_OWORD *)__p = 0u;
          *(_OWORD *)v40 = 0u;
          *(_OWORD *)v41 = 0u;
        }
        std::vector<TGIE5AdapterConfiguration>::push_back[abi:ne180100](&v49, (long long *)v40);
        if (SHIBYTE(v44) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v42[1]) < 0) {
          operator delete(v41[1]);
        }
        if (SHIBYTE(v41[0]) < 0) {
          operator delete(v40[0]);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v7);
  }

  uint64_t v37 = 0;
  unint64_t v38 = 0;
  unint64_t v39 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = [v2 e5Functions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        if (v15)
        {
          [v15 e5Function];
        }
        else
        {
          *(_OWORD *)v42 = 0u;
          *(_OWORD *)__p = 0u;
          *(_OWORD *)v40 = 0u;
          *(_OWORD *)v41 = 0u;
        }
        unint64_t v16 = v38;
        if (v38 >= v39)
        {
          uint64_t v19 = std::vector<TGIE5Function>::__push_back_slow_path<TGIE5Function>(&v37, (long long *)v40);
        }
        else
        {
          long long v17 = *(_OWORD *)v40;
          *(void **)(v38 + 16) = v41[0];
          *(_OWORD *)unint64_t v16 = v17;
          v40[1] = 0;
          v41[0] = 0;
          v40[0] = 0;
          *(void **)(v16 + 24) = v41[1];
          *(unsigned char *)(v16 + 32) = 0;
          *(unsigned char *)(v16 + 56) = 0;
          if (LOBYTE(__p[1]))
          {
            long long v18 = *(_OWORD *)v42;
            *(void **)(v16 + 48) = __p[0];
            *(_OWORD *)(v16 + 32) = v18;
            v42[1] = 0;
            __p[0] = 0;
            v42[0] = 0;
            *(unsigned char *)(v16 + 56) = 1;
          }
          uint64_t v19 = v16 + 64;
        }
        unint64_t v38 = v19;
        if (LOBYTE(__p[1]) && SHIBYTE(__p[0]) < 0) {
          operator delete(v42[0]);
        }
        if (SHIBYTE(v41[0]) < 0) {
          operator delete(v40[0]);
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v52 count:16];
    }
    while (v12);
  }

  *(_OWORD *)v40 = 0u;
  *(_OWORD *)v41 = 0u;
  LODWORD(v42[0]) = 1065353216;
  v20 = [v2 baseModel];
  BOOL v21 = v20 == 0;

  if (!v21)
  {
    v22 = [v2 baseModel];
    objc_super v23 = v22;
    if (v22)
    {
      [v22 sharedConstants];
    }
    else
    {
      uint64_t v32 = 0;
      memset(v31, 0, sizeof(v31));
    }
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>>>::__move_assign((uint64_t)v40, (uint64_t *)v31);
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::~__hash_table((uint64_t)v31);
  }
  id v24 = [v2 modelBundlePath];
  v29 = (char *)[v24 UTF8String];
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v30.__pn_, &v29);
  std::__fs::filesystem::__canonical((std::__fs::filesystem::path *)v31, &v30, 0);
  if (SHIBYTE(v30.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__pn_.__r_.__value_.__l.__data_);
  }

  retstr->var0 = v5;
  *(_OWORD *)retstr->var1.var0.var0.var0.var0.var0.var0 = *(_OWORD *)v31;
  *((void *)&retstr->var1.var0.var0.var0.var0.var1 + 2) = *(void *)&v31[16];
  memset(v31, 0, 24);
  retstr->var1.var0.var0.var1.var0[0] = 0;
  retstr->var1.var0.var0.var1.var0[1] = 0;
  retstr->var1.var0.var0.var1.var0[2] = 0;
  std::vector<TGIE5AdapterConfiguration>::__init_with_size[abi:ne180100]<TGIE5AdapterConfiguration*,TGIE5AdapterConfiguration*>(retstr->var1.var0.var0.var1.var0, v49, v50, 0x8E38E38E38E38E39 * ((v50 - v49) >> 3));
  *(void *)&retstr[1].var0 = 0;
  retstr[1].var1.var0.var0.var0.var0.var1.var0 = 0;
  retstr[1].var1.var0.var0.var0.var0.var1.var1 = 0;
  std::vector<TGIE5Function>::__init_with_size[abi:ne180100]<TGIE5Function*,TGIE5Function*>(&retstr[1].var0, v37, v38, (uint64_t)(v38 - v37) >> 6);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>>>::__hash_table((uint64_t)(&retstr[1].var1.var0.var0.var0.var0.var1 + 1), (uint64_t *)v40);
  retstr[2].var1.var0.var0.var0.var0.var1.var0 = 0;
  retstr[2].var1.var0.var0.var0.var0.var1.var1 = 0;
  *((void *)&retstr[2].var1.var0.var0.var0.var0.var1 + 2) = 0;
  LOBYTE(retstr[2].var1.var0.var0.var1.var0[0]) = [v2 useModelCatalogE5CompilerCache];
  v25 = [v2 serializeModelIOPath];
  BOOL v26 = v25 == 0;

  if (!v26)
  {
    id v27 = [v2 serializeModelIOPath];
    v30.__pn_.__r_.__value_.__r.__words[0] = [v27 UTF8String];
    std::__fs::filesystem::path::assign[abi:ne180100]<char const*>((std::string *)&retstr[2].var1, &v30.__pn_.__r_.__value_.__l.__data_);
  }
  if ((v31[23] & 0x80000000) != 0) {
    operator delete(*(void **)v31);
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::~__hash_table((uint64_t)v40);
  v40[0] = &v37;
  std::vector<TGIE5Function>::__destroy_vector::operator()[abi:ne180100]((void ***)v40);
  v40[0] = &v49;
  std::vector<TGIE5AdapterConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)v40);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [TGIE5ModelConfigurationObjC alloc];
  int64_t v5 = [(TGIE5ModelConfigurationObjC *)self modelType];
  v6 = [(TGIE5ModelConfigurationObjC *)self modelBundlePath];
  uint64_t v7 = [(TGIE5ModelConfigurationObjC *)self e5Functions];
  uint64_t v8 = [(TGIE5ModelConfigurationObjC *)self adapterConfigurations];
  v9 = [(TGIE5ModelConfigurationObjC *)v4 initWithModelType:v5 modelBundlePath:v6 e5Functions:v7 adapterConfigurations:v8];

  id v10 = [(TGIE5ModelConfigurationObjC *)self serializeModelIOPath];
  [(TGIE5ModelConfigurationObjC *)v9 setSerializeModelIOPath:v10];

  id v11 = [(TGIE5ModelConfigurationObjC *)self baseModel];
  [(TGIE5ModelConfigurationObjC *)v9 setBaseModel:v11];

  [(TGIE5ModelConfigurationObjC *)v9 setUseEnergyEfficientMode:[(TGIE5ModelConfigurationObjC *)self useEnergyEfficientMode]];
  [(TGIE5ModelConfigurationObjC *)v9 setUseModelCatalogE5CompilerCache:[(TGIE5ModelConfigurationObjC *)self useModelCatalogE5CompilerCache]];
  uint64_t v12 = [(TGIE5ModelConfigurationObjC *)self assetIdentifier];
  [(TGIE5ModelConfigurationObjC *)v9 setAssetIdentifier:v12];

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [TGIMutableE5ModelConfigurationObjC alloc];
  int64_t v5 = [(TGIE5ModelConfigurationObjC *)self modelType];
  v6 = [(TGIE5ModelConfigurationObjC *)self modelBundlePath];
  uint64_t v7 = [(TGIE5ModelConfigurationObjC *)self e5Functions];
  uint64_t v8 = [(TGIE5ModelConfigurationObjC *)self adapterConfigurations];
  v9 = [(TGIE5ModelConfigurationObjC *)v4 initWithModelType:v5 modelBundlePath:v6 e5Functions:v7 adapterConfigurations:v8];

  id v10 = [(TGIE5ModelConfigurationObjC *)self serializeModelIOPath];
  [(TGIE5ModelConfigurationObjC *)v9 setSerializeModelIOPath:v10];

  id v11 = [(TGIE5ModelConfigurationObjC *)self baseModel];
  [(TGIE5ModelConfigurationObjC *)v9 setBaseModel:v11];

  [(TGIE5ModelConfigurationObjC *)v9 setUseEnergyEfficientMode:[(TGIE5ModelConfigurationObjC *)self useEnergyEfficientMode]];
  [(TGIE5ModelConfigurationObjC *)v9 setUseModelCatalogE5CompilerCache:[(TGIE5ModelConfigurationObjC *)self useModelCatalogE5CompilerCache]];
  uint64_t v12 = [(TGIE5ModelConfigurationObjC *)self assetIdentifier];
  [(TGIE5ModelConfigurationObjC *)v9 setAssetIdentifier:v12];

  return v9;
}

- (unint64_t)hash
{
  int64_t v3 = [(TGIE5ModelConfigurationObjC *)self modelType];
  uint64_t v4 = [(TGIE5ModelConfigurationObjC *)self modelBundlePath];
  uint64_t v5 = [v4 hash];

  v6 = [(TGIE5ModelConfigurationObjC *)self adapterConfigurations];
  uint64_t v7 = [v6 hash];

  BOOL v8 = [(TGIE5ModelConfigurationObjC *)self useEnergyEfficientMode];
  v9 = [(TGIE5ModelConfigurationObjC *)self baseModel];
  uint64_t v10 = [v9 hash];

  id v11 = [(TGIE5ModelConfigurationObjC *)self serializeModelIOPath];
  uint64_t v12 = [v11 hash];

  BOOL v13 = [(TGIE5ModelConfigurationObjC *)self useModelCatalogE5CompilerCache];
  v14 = [(TGIE5ModelConfigurationObjC *)self assetIdentifier];
  unint64_t v15 = v5 ^ v3 ^ v7 ^ v8 ^ (unint64_t)v10 ^ v12 ^ v13 ^ [v14 hash];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(TGIE5ModelConfigurationObjC *)self modelType];
    if (v6 == [v5 modelType])
    {
      uint64_t v7 = [(TGIE5ModelConfigurationObjC *)self modelBundlePath];
      BOOL v8 = [v5 modelBundlePath];
      if ([v7 isEqual:v8])
      {
        v9 = [(TGIE5ModelConfigurationObjC *)self adapterConfigurations];
        uint64_t v10 = [v5 adapterConfigurations];
        if (TGIIsEqualAllowingNil(v9, v10))
        {
          id v11 = [(TGIE5ModelConfigurationObjC *)self e5Functions];
          uint64_t v12 = [v5 e5Functions];
          if ([v11 isEqual:v12])
          {
            v22 = [(TGIE5ModelConfigurationObjC *)self baseModel];
            BOOL v21 = [v5 baseModel];
            if (TGIIsEqualAllowingNil(v22, v21))
            {
              v20 = [(TGIE5ModelConfigurationObjC *)self serializeModelIOPath];
              uint64_t v19 = [v5 serializeModelIOPath];
              if (TGIIsEqualAllowingNil(v20, v19)
                && (int v13 = [(TGIE5ModelConfigurationObjC *)self useEnergyEfficientMode],
                    v13 == [v5 useEnergyEfficientMode])
                && (int v14 = -[TGIE5ModelConfigurationObjC useModelCatalogE5CompilerCache](self, "useModelCatalogE5CompilerCache"), v14 == [v5 useModelCatalogE5CompilerCache]))
              {
                long long v17 = [(TGIE5ModelConfigurationObjC *)self assetIdentifier];
                long long v18 = [v5 assetIdentifier];
                BOOL v15 = v17 == v18;
              }
              else
              {
                BOOL v15 = 0;
              }
            }
            else
            {
              BOOL v15 = 0;
            }
          }
          else
          {
            BOOL v15 = 0;
          }
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)description
{
  v14[7] = *MEMORY[0x263EF8340];
  v13[0] = @"modelType";
  int64_t v3 = TGIE5ModelTypeObjcToString([(TGIE5ModelConfigurationObjC *)self modelType]);
  v14[0] = v3;
  v13[1] = @"modelBundlePath";
  id v4 = [(TGIE5ModelConfigurationObjC *)self modelBundlePath];
  v14[1] = v4;
  v13[2] = @"e5Functions";
  id v5 = [(TGIE5ModelConfigurationObjC *)self e5Functions];
  v14[2] = v5;
  v13[3] = @"adapterConfigurations";
  int64_t v6 = [(TGIE5ModelConfigurationObjC *)self adapterConfigurations];
  v14[3] = v6;
  v13[4] = @"useEnergyEfficientMode";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[TGIE5ModelConfigurationObjC useEnergyEfficientMode](self, "useEnergyEfficientMode"));
  v14[4] = v7;
  v13[5] = @"useModelCatalogE5CompilerCache";
  BOOL v8 = objc_msgSend(NSNumber, "numberWithBool:", -[TGIE5ModelConfigurationObjC useModelCatalogE5CompilerCache](self, "useModelCatalogE5CompilerCache"));
  v14[5] = v8;
  v13[6] = @"assetIdentifier";
  v9 = [(TGIE5ModelConfigurationObjC *)self assetIdentifier];
  v14[6] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:7];
  id v11 = [v10 description];

  return v11;
}

- (int64_t)modelType
{
  return self->_modelType;
}

- (NSString)modelBundlePath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)adapterConfigurations
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)e5Functions
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)serializeModelIOPath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSerializeModelIOPath:(id)a3
{
}

- (TGIE5BaseModelObjC)baseModel
{
  return (TGIE5BaseModelObjC *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBaseModel:(id)a3
{
}

- (BOOL)useEnergyEfficientMode
{
  return self->_useEnergyEfficientMode;
}

- (void)setUseEnergyEfficientMode:(BOOL)a3
{
  self->_useEnergyEfficientMode = a3;
}

- (BOOL)useModelCatalogE5CompilerCache
{
  return self->_useModelCatalogE5CompilerCache;
}

- (void)setUseModelCatalogE5CompilerCache:(BOOL)a3
{
  self->_useModelCatalogE5CompilerCache = a3;
}

- (NSString)assetIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAssetIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
  objc_storeStrong((id *)&self->_serializeModelIOPath, 0);
  objc_storeStrong((id *)&self->_e5Functions, 0);
  objc_storeStrong((id *)&self->_adapterConfigurations, 0);

  objc_storeStrong((id *)&self->_modelBundlePath, 0);
}

@end