@interface UISSceneRequestOptions
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)preserveLayout;
- (BOOL)requestBackground;
- (BOOL)requestCenterSlot;
- (BOOL)requestFullscreen;
- (BOOL)requestQuickLookScene;
- (NSSet)actions;
- (NSString)interactionIdentifier;
- (NSString)sourceIdentifier;
- (UISScenePlacementConfiguration)scenePlacementConfiguration;
- (UISSceneRequestOptions)initWithBSXPCCoder:(id)a3;
- (int64_t)sceneRequestIntent;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setInteractionIdentifier:(id)a3;
- (void)setPreserveLayout:(BOOL)a3;
- (void)setRequestBackground:(BOOL)a3;
- (void)setRequestCenterSlot:(BOOL)a3;
- (void)setRequestFullscreen:(BOOL)a3;
- (void)setRequestQuickLookScene:(BOOL)a3;
- (void)setScenePlacementConfiguration:(id)a3;
- (void)setSceneRequestIntent:(int64_t)a3;
- (void)setSourceIdentifier:(id)a3;
@end

@implementation UISSceneRequestOptions

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UISSceneRequestOptions;
  id v4 = a3;
  [(FBSWorkspaceSceneRequestOptions *)&v10 encodeWithBSXPCCoder:v4];
  v5 = [(FBSWorkspaceSceneRequestOptions *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(UISSceneRequestOptions *)self sourceIdentifier];
  [v4 encodeObject:v6 forKey:@"sourceIdentifier"];

  v7 = [(UISSceneRequestOptions *)self interactionIdentifier];
  [v4 encodeObject:v7 forKey:@"interactionIdentifier"];

  v8 = [(UISSceneRequestOptions *)self actions];
  [v4 encodeCollection:v8 forKey:@"actions"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[UISSceneRequestOptions sceneRequestIntent](self, "sceneRequestIntent"), @"sceneRequestIntent");
  v9 = [(UISSceneRequestOptions *)self scenePlacementConfiguration];
  [v4 encodeObject:v9 forKey:@"placementConfiguration"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneRequestOptions requestFullscreen](self, "requestFullscreen"), @"requestFullscreen");
  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneRequestOptions requestBackground](self, "requestBackground"), @"requestBackground");
  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneRequestOptions requestCenterSlot](self, "requestCenterSlot"), @"requestCenterSlot");
  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneRequestOptions preserveLayout](self, "preserveLayout"), @"preserveLayout");
  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneRequestOptions requestQuickLookScene](self, "requestQuickLookScene"), @"requestQuickLookScene");
}

- (UISSceneRequestOptions)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UISSceneRequestOptions;
  v5 = [(FBSWorkspaceSceneRequestOptions *)&v13 initWithBSXPCCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeStringForKey:@"identifier"];
    [(FBSWorkspaceSceneRequestOptions *)v5 setIdentifier:v6];

    v7 = [v4 decodeStringForKey:@"sourceIdentifier"];
    [(UISSceneRequestOptions *)v5 setSourceIdentifier:v7];

    v8 = [v4 decodeStringForKey:@"interactionIdentifier"];
    [(UISSceneRequestOptions *)v5 setInteractionIdentifier:v8];

    uint64_t v9 = objc_opt_class();
    objc_super v10 = [v4 decodeCollectionOfClass:v9 containingClass:objc_opt_class() forKey:@"actions"];
    [(UISSceneRequestOptions *)v5 setActions:v10];

    -[UISSceneRequestOptions setSceneRequestIntent:](v5, "setSceneRequestIntent:", [v4 decodeInt64ForKey:@"sceneRequestIntent"]);
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placementConfiguration"];
    [(UISSceneRequestOptions *)v5 setScenePlacementConfiguration:v11];

    -[UISSceneRequestOptions setRequestFullscreen:](v5, "setRequestFullscreen:", [v4 decodeBoolForKey:@"requestFullscreen"]);
    -[UISSceneRequestOptions setRequestBackground:](v5, "setRequestBackground:", [v4 decodeBoolForKey:@"requestBackground"]);
    -[UISSceneRequestOptions setRequestCenterSlot:](v5, "setRequestCenterSlot:", [v4 decodeBoolForKey:@"requestCenterSlot"]);
    -[UISSceneRequestOptions setPreserveLayout:](v5, "setPreserveLayout:", [v4 decodeBoolForKey:@"preserveLayout"]);
    -[UISSceneRequestOptions setRequestQuickLookScene:](v5, "setRequestQuickLookScene:", [v4 decodeBoolForKey:@"requestQuickLookScene"]);
  }

  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISSceneRequestOptions;
  if (-[UISSceneRequestOptions isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  }
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (BOOL)requestFullscreen
{
  return self->_requestFullscreen;
}

- (void)setRequestFullscreen:(BOOL)a3
{
  self->_requestFullscreen = a3;
}

- (BOOL)requestBackground
{
  return self->_requestBackground;
}

- (void)setRequestBackground:(BOOL)a3
{
  self->_requestBackground = a3;
}

- (BOOL)preserveLayout
{
  return self->_preserveLayout;
}

- (void)setPreserveLayout:(BOOL)a3
{
  self->_preserveLayout = a3;
}

- (int64_t)sceneRequestIntent
{
  return self->_sceneRequestIntent;
}

- (void)setSceneRequestIntent:(int64_t)a3
{
  self->_sceneRequestIntent = a3;
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (void)setInteractionIdentifier:(id)a3
{
}

- (BOOL)requestQuickLookScene
{
  return self->_requestQuickLookScene;
}

- (void)setRequestQuickLookScene:(BOOL)a3
{
  self->_requestQuickLookScene = a3;
}

- (UISScenePlacementConfiguration)scenePlacementConfiguration
{
  return self->_scenePlacementConfiguration;
}

- (void)setScenePlacementConfiguration:(id)a3
{
}

- (BOOL)requestCenterSlot
{
  return self->_requestCenterSlot;
}

- (void)setRequestCenterSlot:(BOOL)a3
{
  self->_requestCenterSlot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenePlacementConfiguration, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

@end