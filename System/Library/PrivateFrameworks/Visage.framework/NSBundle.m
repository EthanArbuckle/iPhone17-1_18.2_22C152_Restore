@interface NSBundle
@end

@implementation NSBundle

uint64_t __25__NSBundle_VG__vg_bundle__block_invoke()
{
  +[NSBundle(VG) vg_bundle]::bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

void __35__NSBundle_VG__vg_bundleIdentifier__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x263F086E0], "vg_bundle");
  uint64_t v1 = [v0 bundleIdentifier];
  v2 = (void *)+[NSBundle(VG) vg_bundleIdentifier]::bundleIdentifier;
  +[NSBundle(VG) vg_bundleIdentifier]::bundleIdentifier = v1;

  if (!+[NSBundle(VG) vg_bundleIdentifier]::bundleIdentifier)
  {
    +[NSBundle(VG) vg_bundleIdentifier]::bundleIdentifier = @"com.apple.visage";
  }
}

uint64_t __31__NSBundle_VG__vg_resourcePath__block_invoke()
{
  if (_s_vg_setResourcePath)
  {
    _s_vg_resourcePath = (uint64_t)(id)_s_vg_setResourcePath;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "vg_bundle");
    v0 = [(id)objc_claimAutoreleasedReturnValue() resourcePath];
    uint64_t v1 = [v0 copy];
    v2 = (void *)_s_vg_resourcePath;
    _s_vg_resourcePath = v1;
  }

  return MEMORY[0x270F9A758]();
}

@end