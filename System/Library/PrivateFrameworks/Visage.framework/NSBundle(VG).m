@interface NSBundle(VG)
+ (BOOL)vg_canSetResourcePath;
+ (id)vg_bundle;
+ (id)vg_bundleIdentifier;
+ (id)vg_packageBundle:()VG;
+ (id)vg_resourcePath;
+ (void)setVg_resourcePath:()VG;
@end

@implementation NSBundle(VG)

+ (id)vg_bundle
{
  if (+[NSBundle(VG) vg_bundle]::onceToken != -1) {
    dispatch_once(&+[NSBundle(VG) vg_bundle]::onceToken, &__block_literal_global_5);
  }
  v0 = (void *)+[NSBundle(VG) vg_bundle]::bundle;

  return v0;
}

+ (id)vg_bundleIdentifier
{
  if (+[NSBundle(VG) vg_bundleIdentifier]::onceToken != -1) {
    dispatch_once(&+[NSBundle(VG) vg_bundleIdentifier]::onceToken, &__block_literal_global_4_0);
  }
  v0 = (void *)+[NSBundle(VG) vg_bundleIdentifier]::bundleIdentifier;

  return v0;
}

+ (id)vg_resourcePath
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__NSBundle_VG__vg_resourcePath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[NSBundle(VG) vg_resourcePath]::onceToken != -1) {
    dispatch_once(&+[NSBundle(VG) vg_resourcePath]::onceToken, block);
  }
  v1 = (void *)_s_vg_resourcePath;

  return v1;
}

+ (BOOL)vg_canSetResourcePath
{
  return _s_vg_resourcePath == 0;
}

+ (void)setVg_resourcePath:()VG
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v9 = v3;
  if (_s_vg_resourcePath)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    v10 = @"value";
    v11[0] = _s_vg_resourcePath;
    v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v8 = [v6 exceptionWithName:@"Call Order Violation on vg_resourcePath." reason:@"Attempting to set vg_resourcePath after get method on vg_resourcePath was called." userInfo:v7];

    objc_exception_throw(v8);
  }
  uint64_t v4 = [v3 copy];
  v5 = (void *)_s_vg_setResourcePath;
  _s_vg_setResourcePath = v4;
}

+ (id)vg_packageBundle:()VG
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x263F086E0], "vg_bundle");
  v5 = [v4 pathForResource:v3 ofType:@"bundle"];

  v6 = [MEMORY[0x263F086E0] bundleWithPath:v5];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x263F086E0], "vg_bundle");
    v10 = [v9 bundlePath];
    v11 = [v10 stringByDeletingLastPathComponent];

    v12 = [v3 stringByAppendingPathExtension:@"bundle"];
    v13 = [v11 stringByAppendingPathComponent:v12];

    id v8 = [MEMORY[0x263F086E0] bundleWithPath:v13];
  }

  return v8;
}

@end