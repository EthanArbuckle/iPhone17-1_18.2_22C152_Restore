id WatchControlAssetsBundle()
{
  void *v0;
  uint64_t vars8;

  if (WatchControlAssetsBundle_onceToken != -1) {
    dispatch_once(&WatchControlAssetsBundle_onceToken, &__block_literal_global);
  }
  v0 = (void *)WatchControlAssetsBundle_bundle;
  return v0;
}

uint64_t __WatchControlAssetsBundle_block_invoke()
{
  WatchControlAssetsBundle_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

id WCImageForAssetName(void *a1)
{
  v1 = (void *)MEMORY[0x263F1C6B0];
  id v2 = a1;
  v3 = WatchControlAssetsBundle();
  v4 = [v1 imageNamed:v2 inBundle:v3 withConfiguration:0];

  return v4;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}