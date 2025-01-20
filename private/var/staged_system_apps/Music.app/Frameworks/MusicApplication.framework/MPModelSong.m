@interface MPModelSong
+ (id)requiredLibraryNavigationHandlerProperties;
+ (id)requiredStoreNavigationHandlerProperties;
- (BOOL)shouldVisuallyDisableFor:(int64_t)a3;
- (NSString)musicTypeIdentifier;
- (NSString)shortDescription;
- (double)preferredArtworkAspectRatio;
- (id)libraryNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4;
- (id)pickableObjectFor:(int64_t)a3;
- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4;
- (void)loadCatalogSongsWithCompletionHandler:(void *)aBlock;
- (void)loadLibraryRequestedProperties:(id)a3 completionHandler:(id)a4;
@end

@implementation MPModelSong

- (id)pickableObjectFor:(int64_t)a3
{
  v5 = 0;
  if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x13) != 0) {
    v5 = self;
  }
  return v5;
}

- (NSString)musicTypeIdentifier
{
  NSString v2 = sub_AB64D0();

  return (NSString *)v2;
}

- (BOOL)shouldVisuallyDisableFor:(int64_t)a3
{
  return ((unint64_t)a3 > 7) | (0x3Eu >> a3) & 1;
}

- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  return sub_17B598(self, (int)a2, a3, a4, (uint64_t (*)(id))sub_17BD0C, (uint64_t)&block_descriptor_20_1);
}

+ (id)requiredStoreNavigationHandlerProperties
{
  id v2 = sub_17BE44();

  return v2;
}

- (void)loadLibraryRequestedProperties:(id)a3 completionHandler:(id)a4
{
}

- (void)loadCatalogSongsWithCompletionHandler:(void *)aBlock
{
  v4 = _Block_copy(aBlock);
  _Block_copy(v4);
  id v5 = a1;
  sub_17C038(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (id)libraryNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  return sub_17B598(self, (int)a2, a3, a4, (uint64_t (*)(id))sub_17C168, (uint64_t)&block_descriptor_46);
}

+ (id)requiredLibraryNavigationHandlerProperties
{
  id v2 = sub_17C508();

  return v2;
}

- (NSString)shortDescription
{
  return (NSString *)sub_7CFD48(self, (uint64_t)a2, (void (*)(void))sub_7CF238);
}

- (double)preferredArtworkAspectRatio
{
  id v2 = self;
  double v3 = sub_81D994();

  return v3;
}

@end