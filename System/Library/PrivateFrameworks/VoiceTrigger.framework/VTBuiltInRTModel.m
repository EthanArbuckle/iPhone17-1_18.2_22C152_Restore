@interface VTBuiltInRTModel
+ (id)sharedInstance;
- (NSDictionary)builtInRTModelDictionary;
- (void)dealloc;
- (void)setBuiltInRTModelDictionary:(id)a3;
@end

@implementation VTBuiltInRTModel

- (void).cxx_destruct
{
}

- (void)setBuiltInRTModelDictionary:(id)a3
{
}

- (NSDictionary)builtInRTModelDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)dealloc
{
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating VTBuiltInRTModel", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)VTBuiltInRTModel;
  [(VTBuiltInRTModel *)&v4 dealloc];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_75);
  }
  v2 = (void *)sharedInstance_sharedRTModel;

  return v2;
}

uint64_t __34__VTBuiltInRTModel_sharedInstance__block_invoke()
{
  sharedInstance_sharedRTModel = objc_alloc_init(VTBuiltInRTModel);

  return MEMORY[0x270F9A758]();
}

@end