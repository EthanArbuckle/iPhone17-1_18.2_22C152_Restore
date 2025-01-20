@interface TGIE5BaseModelObjC
- (BOOL)load:(id *)a3;
- (BOOL)useEnergyEfficientMode;
- (NSURL)modelURL;
- (TGIE5ANESessionObjC)aneSession;
- (TGIE5BaseModelObjC)initWithModelConfiguration:(id)a3;
- (id).cxx_construct;
- (shared_ptr<cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase>)baseModel;
- (unordered_map<std::string,)sharedConstants;
- (void)moveToDynamicState;
- (void)moveToFullyLoadedState;
- (void)setAneSession:(id)a3;
- (void)setBaseModel:(shared_ptr<cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase>)a3;
@end

@implementation TGIE5BaseModelObjC

- (TGIE5BaseModelObjC)initWithModelConfiguration:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TGIE5BaseModelObjC;
  v5 = [(TGIE5BaseModelObjC *)&v18 init];
  if (v5)
  {
    v6 = NSURL;
    v7 = [v4 modelBundlePath];
    uint64_t v8 = [v6 URLWithString:v7];
    modelURL = v5->_modelURL;
    v5->_modelURL = (NSURL *)v8;

    os_log_t v10 = os_log_create("com.apple.tokengenerationinference", "E5LanguageModel");
    log = v5->_log;
    v5->_log = (OS_os_log *)v10;

    v5->_useEnergyEfficientMode = [v4 useEnergyEfficientMode];
    v12 = [TGIE5ANESessionObjC alloc];
    v13 = v5->_modelURL;
    uint64_t v14 = [v4 useEnergyEfficientMode];
    v15 = [v4 assetIdentifier];
    v16 = [(TGIE5ANESessionObjC *)v12 initWithResourceURL:v13 useEnergyEfficientMode:v14 assetIdentifier:v15];
    [(TGIE5BaseModelObjC *)v5 setAneSession:v16];
  }
  return v5;
}

- (BOOL)load:(id *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = self->_log;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
  {
    v5 = [(TGIE5BaseModelObjC *)self modelURL];
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
    _os_log_impl(&dword_25FA51000, (os_log_t)v4, OS_LOG_TYPE_INFO, "Loading base model with model : %@", (uint8_t *)&buf, 0xCu);
  }
  [(TGIE5BaseModelObjC *)self modelURL];
  uint64_t v8 = [(id)objc_claimAutoreleasedReturnValue() path];
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&buf, &v8);
  cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase::create(&buf, v6);
}

- (unordered_map<std::string,)sharedConstants
{
  [(TGIE5BaseModelObjC *)self baseModel];
  cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase::getSharedConstants(v5, (uint64_t)retstr);
  result = v6;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
  return result;
}

- (void)moveToDynamicState
{
  id v2 = [(TGIE5BaseModelObjC *)self aneSession];
  [v2 stop];
}

- (void)moveToFullyLoadedState
{
  id v2 = [(TGIE5BaseModelObjC *)self aneSession];
  [v2 resume];
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (shared_ptr<cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase>)baseModel
{
  objc_copyCppObjectAtomic(v2, &self->_baseModel, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setBaseModel:(shared_ptr<cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase>)a3
{
}

- (BOOL)useEnergyEfficientMode
{
  return self->_useEnergyEfficientMode;
}

- (TGIE5ANESessionObjC)aneSession
{
  return (TGIE5ANESessionObjC *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAneSession:(id)a3
{
}

- (void).cxx_destruct
{
  cntrl = self->_baseModel.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_aneSession, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

- (void)load:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 16);
  id v4 = a2;
  int v5 = 136315138;
  uint64_t v6 = v3(a1);
  _os_log_error_impl(&dword_25FA51000, v4, OS_LOG_TYPE_ERROR, "Failed to load model: %s.", (uint8_t *)&v5, 0xCu);
}

@end