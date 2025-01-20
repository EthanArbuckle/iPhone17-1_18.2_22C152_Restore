@interface MPModelObject
+ (id)requiredStoreNavigationHandlerProperties;
- (BOOL)shouldVisuallyDisableFor:(int64_t)a3;
- (NSString)musicTypeIdentifier;
- (NSString)shortDescription;
- (double)preferredArtworkAspectRatio;
- (id)pickableObjectFor:(int64_t)a3;
- (id)storeContentItemObjectPropertiesFor:(id)a3;
- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4;
- (void)loadCatalogSongsWithCompletionHandler:(void *)aBlock;
- (void)loadLibraryRequestedProperties:(id)a3 completionHandler:(id)a4;
- (void)loadStoreRequestedProperties:(id)a3 completionHandler:(id)a4;
@end

@implementation MPModelObject

- (id)pickableObjectFor:(int64_t)a3
{
  v4 = self;
  v5 = [(MPModelObject *)v4 innermostModelObject];

  if (v5 == v4)
  {
    id v7 = 0;
  }
  else
  {
    v6 = [(MPModelObject *)v4 innermostModelObject];
    id v7 = [(MPModelObject *)v6 pickableObjectFor:a3];

    v4 = v6;
  }

  return v7;
}

- (NSString)musicTypeIdentifier
{
  v2 = self;
  id v3 = [(MPModelObject *)v2 pickableObjectFor:0];
  if (v3)
  {
    v4 = v3;
    id v5 = [v3 musicTypeIdentifier];
    if (v5)
    {
      v6 = v5;
      sub_AB6510();

      NSString v7 = sub_AB64D0();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
  }
  else
  {
  }
  NSString v7 = 0;
LABEL_7:

  return (NSString *)v7;
}

- (BOOL)shouldVisuallyDisableFor:(int64_t)a3
{
  return 0;
}

- (void)loadStoreRequestedProperties:(id)a3 completionHandler:(id)a4
{
}

- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  v4 = _Block_copy(a4);
  _Block_release(v4);

  return 0;
}

- (void)loadLibraryRequestedProperties:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  NSString v7 = (void (*)(void *, void, void))v6[2];
  id v8 = a3;
  v9 = self;
  v7(v6, 0, 0);
  _Block_release(v6);
}

- (void)loadCatalogSongsWithCompletionHandler:(void *)aBlock
{
  v4 = _Block_copy(aBlock);
  id v5 = (void (*)(void *, void, void))v4[2];
  id v6 = a1;
  v5(v4, 0, 0);
  _Block_release(v4);
}

+ (id)requiredStoreNavigationHandlerProperties
{
  id v0 = [self emptyPropertySet];

  return v0;
}

- (id)storeContentItemObjectPropertiesFor:(id)a3
{
  return a3;
}

- (NSString)shortDescription
{
  NSString v2 = sub_AB64D0();

  return (NSString *)v2;
}

- (double)preferredArtworkAspectRatio
{
  self;
  NSString v2 = (void *)swift_dynamicCastObjCClass();
  if (!v2)
  {
    self;
    NSString v2 = (void *)swift_dynamicCastObjCClass();
    if (!v2) {
      return 1.0;
    }
  }

  [v2 preferredArtworkAspectRatio];
  return result;
}

@end