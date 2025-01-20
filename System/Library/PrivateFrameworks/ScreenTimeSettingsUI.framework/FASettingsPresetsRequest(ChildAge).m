@interface FASettingsPresetsRequest(ChildAge)
- (void)st_fetchCachedPresetsWithCompletion:()ChildAge;
@end

@implementation FASettingsPresetsRequest(ChildAge)

- (void)st_fetchCachedPresetsWithCompletion:()ChildAge
{
  id v4 = a3;
  SEL v5 = NSSelectorFromString(&cfstr_Fetchcachedpre.isa);
  if (objc_opt_respondsToSelector())
  {
    v6 = _Block_copy(v4);
    [a1 performSelector:v5 withObject:v6];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FASettingsPresetsRequest(ChildAge) st_fetchCachedPresetsWithCompletion:]();
    }
    id v7 = objc_alloc(MEMORY[0x263F3BFE8]);
    v8 = (void *)[v7 initWithAvailablePresets:MEMORY[0x263EFFA68] expectedPreset:0 currentPreset:0];
    (*((void (**)(id, void *, void))v4 + 2))(v4, v8, 0);
  }
}

- (void)st_fetchCachedPresetsWithCompletion:()ChildAge .cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "fetchCachedPresetsWithCompletion not available", v0, 2u);
}

@end