@interface _UIWindowSceneActivationPrewarmAction
+ (id)actionWithMorphContainer:(id)a3 alphaSource:(id)a4 sourceIdentifier:(id)a5 interactionIdentifier:(id)a6 requestCenterSlot:(BOOL)a7 requestFullscreen:(BOOL)a8 responseHandler:(id)a9;
- (BOOL)requestCenterSlot;
- (BOOL)requestFullscreen;
- (NSString)interactionIdentifier;
- (NSString)sourceAppBundleIdentifier;
- (NSString)sourceSceneIdentifier;
- (int64_t)UIActionType;
- (unint64_t)deparentingPortalAlphaSourceLayerRenderId;
- (unint64_t)morphContainerRenderId;
- (unsigned)sourceLayerContextId;
@end

@implementation _UIWindowSceneActivationPrewarmAction

+ (id)actionWithMorphContainer:(id)a3 alphaSource:(id)a4 sourceIdentifier:(id)a5 interactionIdentifier:(id)a6 requestCenterSlot:(BOOL)a7 requestFullscreen:(BOOL)a8 responseHandler:(id)a9
{
  BOOL v38 = a8;
  BOOL v9 = a7;
  id v14 = a9;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_opt_new();
  v20 = [v18 layer];
  v21 = [v20 context];
  uint64_t v22 = [v21 contextId];

  v23 = [v18 layer];

  uint64_t RenderId = CALayerGetRenderId();
  v25 = [v17 layer];

  uint64_t v26 = CALayerGetRenderId();
  v27 = [NSNumber numberWithUnsignedInt:v22];
  [v19 setObject:v27 forSetting:1];

  v28 = [NSNumber numberWithUnsignedLongLong:RenderId];
  [v19 setObject:v28 forSetting:2];

  v29 = [NSNumber numberWithUnsignedLongLong:v26];
  [v19 setObject:v29 forSetting:3];

  v30 = [MEMORY[0x1E4F28B50] mainBundle];
  v31 = [v30 bundleIdentifier];
  [v19 setObject:v31 forSetting:4];

  [v19 setObject:v16 forSetting:5];
  [v19 setObject:v15 forSetting:6];

  v32 = [NSNumber numberWithBool:v9];
  [v19 setObject:v32 forSetting:7];

  v33 = [NSNumber numberWithBool:v38];
  [v19 setObject:v33 forSetting:8];

  id v34 = objc_alloc((Class)a1);
  v35 = [MEMORY[0x1E4F4F670] responderWithHandler:v14];

  v36 = (void *)[v34 initWithInfo:v19 responder:v35];
  return v36;
}

- (unsigned)sourceLayerContextId
{
  v2 = [(_UIWindowSceneActivationPrewarmAction *)self info];
  v3 = [v2 objectForSetting:1];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)morphContainerRenderId
{
  v2 = [(_UIWindowSceneActivationPrewarmAction *)self info];
  v3 = [v2 objectForSetting:2];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)deparentingPortalAlphaSourceLayerRenderId
{
  v2 = [(_UIWindowSceneActivationPrewarmAction *)self info];
  v3 = [v2 objectForSetting:3];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (NSString)sourceAppBundleIdentifier
{
  v2 = [(_UIWindowSceneActivationPrewarmAction *)self info];
  v3 = [v2 objectForSetting:4];

  return (NSString *)v3;
}

- (NSString)sourceSceneIdentifier
{
  v2 = [(_UIWindowSceneActivationPrewarmAction *)self info];
  v3 = [v2 objectForSetting:5];

  return (NSString *)v3;
}

- (NSString)interactionIdentifier
{
  v2 = [(_UIWindowSceneActivationPrewarmAction *)self info];
  v3 = [v2 objectForSetting:6];

  return (NSString *)v3;
}

- (BOOL)requestCenterSlot
{
  v2 = [(_UIWindowSceneActivationPrewarmAction *)self info];
  v3 = [v2 objectForSetting:7];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)requestFullscreen
{
  v2 = [(_UIWindowSceneActivationPrewarmAction *)self info];
  v3 = [v2 objectForSetting:8];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (int64_t)UIActionType
{
  return 40;
}

@end