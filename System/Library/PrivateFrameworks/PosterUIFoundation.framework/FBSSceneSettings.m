@interface FBSSceneSettings
@end

@implementation FBSSceneSettings

uint64_t __60__FBSSceneSettings_PosterUIFoundation__pui_sceneAttachments__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "contextId");
  uint64_t v6 = xpc_dictionary_get_uint64(v4, "renderId");
  int64_t int64 = xpc_dictionary_get_int64(v4, "level");

  v8 = *(void **)(a1 + 32);
  v9 = [[PUIPosterSceneAttachment alloc] initWithContextId:uint64 renderId:v6 level:int64];
  [v8 addObject:v9];

  return 1;
}

@end