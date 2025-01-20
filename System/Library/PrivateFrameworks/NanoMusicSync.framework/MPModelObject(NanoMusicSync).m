@interface MPModelObject(NanoMusicSync)
+ (id)nms_modelObjectWithLibraryPersistentID:()NanoMusicSync;
+ (id)nms_modelObjectWithLibraryPersistentID:()NanoMusicSync block:;
- (id)nms_recommendationObject;
- (id)nms_syncInfoContainerIdentifier;
- (uint64_t)nms_prefersCatalogRepresentation;
- (void)nms_setRecommendationObject:()NanoMusicSync;
- (void)nms_syncInfoContainerIdentifier;
@end

@implementation MPModelObject(NanoMusicSync)

- (uint64_t)nms_prefersCatalogRepresentation
{
  if (objc_opt_isKindOfClass()) {
    return [a1 isLibraryAdded] ^ 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return [a1 isLibraryAdded] ^ 1;
  }
  else {
    return 0;
  }
}

- (id)nms_syncInfoContainerIdentifier
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [a1 identifiers];
    uint64_t v3 = objc_msgSend(v2, "nms_syncInfoPlaylistIdentifier");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = NMLogForCategory(5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(MPModelObject(NanoMusicSync) *)(uint64_t)a1 nms_syncInfoContainerIdentifier];
      }

      id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Unsupported model type. Not allowed." userInfo:0];
      objc_exception_throw(v7);
    }
    v2 = [a1 identifiers];
    uint64_t v3 = objc_msgSend(v2, "nms_syncInfoAlbumIdentifier");
  }
  v4 = (void *)v3;

  return v4;
}

- (id)nms_recommendationObject
{
  return objc_getAssociatedObject(a1, sel_nms_recommendationObject);
}

- (void)nms_setRecommendationObject:()NanoMusicSync
{
}

+ (id)nms_modelObjectWithLibraryPersistentID:()NanoMusicSync
{
  v5 = (void *)MEMORY[0x263F11DB0];
  v6 = [MEMORY[0x263F11F10] kindWithModelClass:a1];
  id v7 = objc_msgSend(v5, "nms_identifierSetWithLibraryPersistentID:modelKind:", a3, v6);

  v8 = (void *)[[a1 alloc] initWithIdentifiers:v7];

  return v8;
}

+ (id)nms_modelObjectWithLibraryPersistentID:()NanoMusicSync block:
{
  v6 = (void *)MEMORY[0x263F11DB0];
  id v7 = (void *)MEMORY[0x263F11F10];
  id v8 = a4;
  v9 = [v7 kindWithModelClass:a1];
  v10 = objc_msgSend(v6, "nms_identifierSetWithLibraryPersistentID:modelKind:", a3, v9);

  v11 = (void *)[[a1 alloc] initWithIdentifiers:v10 block:v8];

  return v11;
}

- (void)nms_syncInfoContainerIdentifier
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_2228FD000, a2, OS_LOG_TYPE_ERROR, "Unsupported model type. Not allowed: %@. Model Object: %@", (uint8_t *)&v6, 0x16u);
}

@end