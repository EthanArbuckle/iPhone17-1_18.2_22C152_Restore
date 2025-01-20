@interface UIWindowKeyWindowAPIIsSceneLevel
@end

@implementation UIWindowKeyWindowAPIIsSceneLevel

void ___UIWindowKeyWindowAPIIsSceneLevel_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  _MergedGlobals_162 = dyld_program_sdk_at_least();
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("KeyWindow", (unint64_t *)algn_1EB259DC8) + 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if (_MergedGlobals_162) {
      v1 = @"YES";
    }
    else {
      v1 = @"NO";
    }
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_DEFAULT, "Key window API is scene-level: %@", (uint8_t *)&v2, 0xCu);
  }
}

@end