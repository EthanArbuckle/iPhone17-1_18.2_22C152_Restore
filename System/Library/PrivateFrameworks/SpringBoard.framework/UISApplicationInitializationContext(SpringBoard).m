@interface UISApplicationInitializationContext(SpringBoard)
+ (id)sb_embeddedDisplayDefaultContext;
+ (id)sb_embeddedDisplayDefaultContextForSystemUIScenes;
@end

@implementation UISApplicationInitializationContext(SpringBoard)

+ (id)sb_embeddedDisplayDefaultContext
{
  v2 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  BOOL v3 = [v2 deviceClass] == 2;
  id v4 = [a1 alloc];
  v5 = objc_msgSend(MEMORY[0x1E4FB33E0], "sb_embeddedDisplayDefaultContext");
  v6 = objc_msgSend(MEMORY[0x1E4FB33D8], "sb_defaultContext");
  v7 = (void *)[v4 initWithMainDisplayContext:v5 launchDisplayContext:0 deviceContext:v6 persistedSceneIdentifiers:0 supportAppSceneRequests:v3];

  return v7;
}

+ (id)sb_embeddedDisplayDefaultContextForSystemUIScenes
{
  id v1 = [a1 alloc];
  v2 = objc_msgSend(MEMORY[0x1E4FB33E0], "sb_mainThreadFree_embeddedDisplayDefaultContext");
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB33D8], "sb_defaultContext");
  id v4 = (void *)[v1 initWithMainDisplayContext:v2 launchDisplayContext:0 deviceContext:v3 persistedSceneIdentifiers:0 supportAppSceneRequests:1];

  return v4;
}

@end