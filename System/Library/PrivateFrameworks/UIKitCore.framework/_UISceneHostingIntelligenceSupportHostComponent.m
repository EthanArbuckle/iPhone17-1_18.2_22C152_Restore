@interface _UISceneHostingIntelligenceSupportHostComponent
- (void)collectRemoteContentInVisibleRect:(CGRect)a3 withRemoteContextWrapper:(id)a4;
@end

@implementation _UISceneHostingIntelligenceSupportHostComponent

- (void)collectRemoteContentInVisibleRect:(CGRect)a3 withRemoteContextWrapper:(id)a4
{
  +[_UISceneHostingIntelligenceSupportActionToClient actionForCollectRemoteContentInVisibleRect:withRemoteContextWrapper:](_UISceneHostingIntelligenceSupportActionToClient, "actionForCollectRemoteContentInVisibleRect:withRemoteContextWrapper:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(FBSSceneComponent *)self scene];
  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  [v5 sendPrivateActions:v6];
}

@end