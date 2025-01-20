@interface IMDebugScreenShotDataProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation IMDebugScreenShotDataProvider

- (id)debugDataFileName
{
  return @"ScreenShot.png";
}

- (id)debugData
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __42__IMDebugScreenShotDataProvider_debugData__block_invoke;
  block[3] = &unk_10578;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__IMDebugScreenShotDataProvider_debugData__block_invoke(uint64_t a1)
{
  id v2 = +[DebugUI debugViewController];
  image = [v2 screenShotImage];

  uint64_t v3 = UIImagePNGRepresentation(image);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end