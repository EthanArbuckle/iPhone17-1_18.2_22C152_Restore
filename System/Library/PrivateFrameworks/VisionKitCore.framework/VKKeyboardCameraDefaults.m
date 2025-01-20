@interface VKKeyboardCameraDefaults
+ (VKKeyboardCameraDefaults)sharedInstance;
- (BOOL)BOOLForKey:(id)a3;
- (VKKeyboardCameraDefaults)init;
- (double)doubleForKey:(id)a3;
@end

@implementation VKKeyboardCameraDefaults

+ (VKKeyboardCameraDefaults)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_instance;
  return (VKKeyboardCameraDefaults *)v2;
}

void __42__VKKeyboardCameraDefaults_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VKKeyboardCameraDefaults);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;
}

- (VKKeyboardCameraDefaults)init
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VKKeyboardCameraDefaults;
  v2 = [(VKKeyboardCameraDefaults *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.KeyboardCamera"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    v5 = v2->_defaults;
    v9[0] = @"MaskOpacity";
    v9[1] = @"CutoutExpansionScale";
    v10[0] = &unk_1F357DDC0;
    v10[1] = &unk_1F357DDC0;
    v9[2] = @"CutoutRadiusScale";
    v9[3] = @"DimmingOpacity";
    v10[2] = &unk_1F357DDD0;
    v10[3] = &unk_1F357DDE0;
    v9[4] = @"DimmingRadius";
    v9[5] = @"HideTapToRadar";
    v10[4] = &unk_1F357DDF0;
    v10[5] = MEMORY[0x1E4F1CC28];
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
    [(NSUserDefaults *)v5 registerDefaults:v6];
  }
  return v2;
}

- (double)doubleForKey:(id)a3
{
  [(NSUserDefaults *)self->_defaults doubleForKey:a3];
  return result;
}

- (BOOL)BOOLForKey:(id)a3
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:a3];
}

- (void).cxx_destruct
{
}

@end