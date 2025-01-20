@interface SBSAppDragLocalContext
- (BOOL)cancelsViaScaleAndFade;
- (BOOL)isSourceLocal;
- (NSArray)customIconDataSourceConfigurations;
- (NSSet)containedIconIdentifiers;
- (NSSet)launchActions;
- (NSString)activeCustomIconDataSourceUniqueIdentifier;
- (NSString)applicationBundleIdentifier;
- (NSString)draggedSceneIdentifier;
- (NSString)droppedIconIdentifier;
- (NSString)gridSizeClass;
- (NSString)uniqueIdentifier;
- (NSURL)launchURL;
- (NSUserActivity)userActivity;
- (SBSAppDragLocalContext)initWithUniqueIdentifier:(id)a3 withLaunchActions:(id)a4 startLocation:(int64_t)a5;
- (UIView)portaledPreview;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)startLocation;
- (void)setActiveCustomIconDataSourceUniqueIdentifier:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setCancelsViaScaleAndFade:(BOOL)a3;
- (void)setContainedIconIdentifiers:(id)a3;
- (void)setCustomIconDataSourceConfigurations:(id)a3;
- (void)setDraggedSceneIdentifier:(id)a3;
- (void)setDroppedIconIdentifier:(id)a3;
- (void)setGridSizeClass:(id)a3;
- (void)setLaunchURL:(id)a3;
- (void)setPortaledPreview:(id)a3;
- (void)setSourceLocal:(BOOL)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUserActivity:(id)a3;
@end

@implementation SBSAppDragLocalContext

- (SBSAppDragLocalContext)initWithUniqueIdentifier:(id)a3 withLaunchActions:(id)a4 startLocation:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBSAppDragLocalContext;
  v10 = [(SBSAppDragLocalContext *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    launchActions = v10->_launchActions;
    v10->_launchActions = (NSSet *)v13;

    v10->_startLocation = a5;
  }

  return v10;
}

- (id)description
{
  return [(SBSAppDragLocalContext *)self descriptionWithMultilinePrefix:@"\t"];
}

- (void)setGridSizeClass:(id)a3
{
  if (a3 && (unint64_t)a3 <= 5)
  {
    v4 = off_1E566DC20[(void)a3 - 1];
    id v5 = a3;
    v6 = v4;
  }
  else
  {
    v6 = (__CFString *)a3;
  }
  v7 = (NSString *)[(__CFString *)v6 copy];
  gridSizeClass = self->_gridSizeClass;
  self->_gridSizeClass = v7;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSAppDragLocalContext *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_uniqueIdentifier withName:@"uniqueIdentifier"];
  id v6 = (id)[v4 appendObject:self->_applicationBundleIdentifier withName:@"applicationBundleIdentifier"];
  id v7 = (id)[v4 appendObject:self->_containedIconIdentifiers withName:@"containedIconIdentifiers" skipIfNil:1];
  id v8 = (id)[v4 appendObject:self->_launchActions withName:@"launchActions" skipIfNil:1];
  id v9 = (id)[v4 appendInteger:self->_startLocation withName:@"startLocation"];
  id v10 = (id)[v4 appendObject:self->_launchActions withName:@"launchActions" skipIfNil:1];
  id v11 = (id)[v4 appendObject:self->_launchURL withName:@"launchURL" skipIfNil:1];
  id v12 = (id)[v4 appendObject:self->_draggedSceneIdentifier withName:@"draggedSceneIdentifier" skipIfNil:1];
  id v13 = (id)[v4 appendObject:self->_portaledPreview withName:@"portaledPreview" skipIfNil:1];
  id v14 = (id)[v4 appendBool:self->_cancelsViaScaleAndFade withName:@"cancelsViaScaleAndFade" ifEqualTo:1];
  id v15 = (id)[v4 appendBool:self->_sourceLocal withName:@"sourceLocal"];
  id v16 = (id)[v4 appendObject:self->_droppedIconIdentifier withName:@"droppedIconIdentifier" skipIfNil:1];
  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBSAppDragLocalContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (int64_t)startLocation
{
  return self->_startLocation;
}

- (NSSet)containedIconIdentifiers
{
  return self->_containedIconIdentifiers;
}

- (void)setContainedIconIdentifiers:(id)a3
{
}

- (NSString)activeCustomIconDataSourceUniqueIdentifier
{
  return self->_activeCustomIconDataSourceUniqueIdentifier;
}

- (void)setActiveCustomIconDataSourceUniqueIdentifier:(id)a3
{
}

- (NSArray)customIconDataSourceConfigurations
{
  return self->_customIconDataSourceConfigurations;
}

- (void)setCustomIconDataSourceConfigurations:(id)a3
{
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (NSString)draggedSceneIdentifier
{
  return self->_draggedSceneIdentifier;
}

- (void)setDraggedSceneIdentifier:(id)a3
{
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
}

- (UIView)portaledPreview
{
  return self->_portaledPreview;
}

- (void)setPortaledPreview:(id)a3
{
}

- (BOOL)cancelsViaScaleAndFade
{
  return self->_cancelsViaScaleAndFade;
}

- (void)setCancelsViaScaleAndFade:(BOOL)a3
{
  self->_cancelsViaScaleAndFade = a3;
}

- (BOOL)isSourceLocal
{
  return self->_sourceLocal;
}

- (void)setSourceLocal:(BOOL)a3
{
  self->_sourceLocal = a3;
}

- (NSString)droppedIconIdentifier
{
  return self->_droppedIconIdentifier;
}

- (void)setDroppedIconIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_droppedIconIdentifier, 0);
  objc_storeStrong((id *)&self->_portaledPreview, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_draggedSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
  objc_storeStrong((id *)&self->_customIconDataSourceConfigurations, 0);
  objc_storeStrong((id *)&self->_activeCustomIconDataSourceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_containedIconIdentifiers, 0);
  objc_storeStrong((id *)&self->_launchActions, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end