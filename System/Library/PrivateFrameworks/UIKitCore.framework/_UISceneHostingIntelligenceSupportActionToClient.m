@interface _UISceneHostingIntelligenceSupportActionToClient
+ (id)actionForCollectRemoteContentInVisibleRect:(CGRect)a3 withRemoteContextWrapper:(id)a4;
- (void)executeActionForWindowHostingScene:(id)a3;
@end

@implementation _UISceneHostingIntelligenceSupportActionToClient

+ (id)actionForCollectRemoteContentInVisibleRect:(CGRect)a3 withRemoteContextWrapper:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  [v11 setObject:&unk_1ED3F6DC8 forSetting:0];
  v12 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", x, y, width, height);
  [v11 setObject:v12 forSetting:1];

  v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];

  [v11 setObject:v13 forSetting:2];
  v14 = (void *)[objc_alloc((Class)a1) initWithInfo:v11 responder:0];

  return v14;
}

- (void)executeActionForWindowHostingScene:(id)a3
{
  id v21 = a3;
  v4 = [(_UISceneHostingIntelligenceSupportActionToClient *)self info];
  v5 = [v4 objectForSetting:0];
  uint64_t v6 = [v5 unsignedIntegerValue];

  v7 = v21;
  if (!v6)
  {
    v8 = [(_UISceneHostingIntelligenceSupportActionToClient *)self info];
    v9 = [v8 objectForSetting:1];
    objc_msgSend(v9, "bs_CGRectValue");
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    v18 = [(_UISceneHostingIntelligenceSupportActionToClient *)self info];
    v19 = [v18 objectForSetting:2];

    if (v19)
    {
      v20 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClass:fromData:error:", +[_UIApplicationIntelligenceSupport remoteContextWrapperClass](_UIApplicationIntelligenceSupport, "remoteContextWrapperClass"), v19, 0);
      v23.origin.double x = v11;
      v23.origin.double y = v13;
      v23.size.double width = v15;
      v23.size.double height = v17;
      if (!CGRectIsNull(v23) && v20) {
        +[_UIApplicationIntelligenceSupport collectRemoteContentForWindowHostingScene:inVisibleRect:withRemoteContextWrapper:](_UIApplicationIntelligenceSupport, "collectRemoteContentForWindowHostingScene:inVisibleRect:withRemoteContextWrapper:", v21, v20, v11, v13, v15, v17);
      }
    }
    v7 = v21;
  }
}

@end