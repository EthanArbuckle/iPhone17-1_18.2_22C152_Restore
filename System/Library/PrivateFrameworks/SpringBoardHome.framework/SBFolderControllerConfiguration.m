@interface SBFolderControllerConfiguration
- (BOOL)addsFocusGuidesForWrapping;
- (BOOL)isVertical;
- (BOOL)snapsToPageBoundariesAfterScrolling;
- (CGRect)initialViewFrame;
- (NSString)description;
- (NSString)originatingIconLocation;
- (SBFolder)folder;
- (SBFolderControllerAnimationContext)animationContext;
- (SBFolderControllerConfiguration)init;
- (SBFolderControllerConfiguration)initWithConfiguration:(id)a3;
- (SBFolderControllerDelegate)folderDelegate;
- (SBFolderIconImageCache)folderIconImageCache;
- (SBHIconImageAppearance)overrideIconImageAppearance;
- (SBHIconImageCache)iconImageCache;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconViewProviding)iconViewProvider;
- (SBNestingViewControllerDelegate)delegate;
- (UIView)headerView;
- (_UILegibilitySettings)legibilitySettings;
- (double)headerHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)iconSpacingAxisMatchingBehavior;
- (int64_t)orientation;
- (unint64_t)allowedOrientations;
- (unint64_t)userInterfaceLayoutDirectionHandling;
- (void)setAddsFocusGuidesForWrapping:(BOOL)a3;
- (void)setAllowedOrientations:(unint64_t)a3;
- (void)setAnimationContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFolder:(id)a3;
- (void)setFolderDelegate:(id)a3;
- (void)setFolderIconImageCache:(id)a3;
- (void)setHeaderHeight:(double)a3;
- (void)setHeaderView:(id)a3;
- (void)setIconImageCache:(id)a3;
- (void)setIconSpacingAxisMatchingBehavior:(int64_t)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setInitialViewFrame:(CGRect)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOriginatingIconLocation:(id)a3;
- (void)setOverrideIconImageAppearance:(id)a3;
- (void)setSnapsToPageBoundariesAfterScrolling:(BOOL)a3;
- (void)setUserInterfaceLayoutDirectionHandling:(unint64_t)a3;
- (void)setVertical:(BOOL)a3;
@end

@implementation SBFolderControllerConfiguration

- (NSString)originatingIconLocation
{
  return self->_originatingIconLocation;
}

- (SBFolderControllerDelegate)folderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderDelegate);
  return (SBFolderControllerDelegate *)WeakRetained;
}

- (SBNestingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBNestingViewControllerDelegate *)WeakRetained;
}

- (SBFolderControllerAnimationContext)animationContext
{
  return self->_animationContext;
}

- (SBFolderControllerConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SBFolderControllerConfiguration;
  v5 = [(SBFolderControllerConfiguration *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 folder];
    folder = v5->_folder;
    v5->_folder = (SBFolder *)v6;

    v5->_orientation = [v4 orientation];
    v5->_allowedOrientations = [v4 allowedOrientations];
    uint64_t v8 = [v4 listLayoutProvider];
    listLayoutProvider = v5->_listLayoutProvider;
    v5->_listLayoutProvider = (SBIconListLayoutProvider *)v8;

    v10 = [v4 iconViewProvider];
    objc_storeWeak((id *)&v5->_iconViewProvider, v10);

    v11 = [v4 delegate];
    objc_storeWeak((id *)&v5->_delegate, v11);

    v12 = [v4 folderDelegate];
    objc_storeWeak((id *)&v5->_folderDelegate, v12);

    uint64_t v13 = [v4 legibilitySettings];
    legibilitySettings = v5->_legibilitySettings;
    v5->_legibilitySettings = (_UILegibilitySettings *)v13;

    uint64_t v15 = [v4 folderIconImageCache];
    folderIconImageCache = v5->_folderIconImageCache;
    v5->_folderIconImageCache = (SBFolderIconImageCache *)v15;

    uint64_t v17 = [v4 iconImageCache];
    iconImageCache = v5->_iconImageCache;
    v5->_iconImageCache = (SBHIconImageCache *)v17;

    uint64_t v19 = [v4 animationContext];
    animationContext = v5->_animationContext;
    v5->_animationContext = (SBFolderControllerAnimationContext *)v19;

    uint64_t v21 = [v4 headerView];
    headerView = v5->_headerView;
    v5->_headerView = (UIView *)v21;

    [v4 headerHeight];
    v5->_headerHeight = v23;
    v24 = [v4 originatingIconLocation];
    uint64_t v25 = [v24 copy];
    originatingIconLocation = v5->_originatingIconLocation;
    v5->_originatingIconLocation = (NSString *)v25;

    v5->_userInterfaceLayoutDirectionHandling = [v4 userInterfaceLayoutDirectionHandling];
    v5->_vertical = [v4 isVertical];
    [v4 initialViewFrame];
    v5->_initialViewFrame.origin.x = v27;
    v5->_initialViewFrame.origin.y = v28;
    v5->_initialViewFrame.size.width = v29;
    v5->_initialViewFrame.size.height = v30;
    v5->_snapsToPageBoundariesAfterScrolling = [v4 snapsToPageBoundariesAfterScrolling];
    v5->_addsFocusGuidesForWrapping = [v4 addsFocusGuidesForWrapping];
    v31 = [v4 overrideIconImageAppearance];
    uint64_t v32 = [v31 copy];
    overrideIconImageAppearance = v5->_overrideIconImageAppearance;
    v5->_overrideIconImageAppearance = (SBHIconImageAppearance *)v32;

    v5->_iconSpacingAxisMatchingBehavior = [v4 iconSpacingAxisMatchingBehavior];
  }

  return v5;
}

- (int64_t)orientation
{
  int64_t orientation = self->_orientation;
  unint64_t allowedOrientations = self->_allowedOrientations;
  int v4 = SBFInterfaceOrientationMaskContainsInterfaceOrientation();
  unint64_t v5 = __clz(__rbit64(allowedOrientations));
  if (v5 <= 1) {
    unint64_t v5 = 1;
  }
  if (v4) {
    return orientation;
  }
  else {
    return v5;
  }
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (unint64_t)allowedOrientations
{
  return self->_allowedOrientations;
}

- (BOOL)addsFocusGuidesForWrapping
{
  return self->_addsFocusGuidesForWrapping;
}

- (unint64_t)userInterfaceLayoutDirectionHandling
{
  return self->_userInterfaceLayoutDirectionHandling;
}

- (BOOL)snapsToPageBoundariesAfterScrolling
{
  return self->_snapsToPageBoundariesAfterScrolling;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (CGRect)initialViewFrame
{
  double x = self->_initialViewFrame.origin.x;
  double y = self->_initialViewFrame.origin.y;
  double width = self->_initialViewFrame.size.width;
  double height = self->_initialViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)iconSpacingAxisMatchingBehavior
{
  return self->_iconSpacingAxisMatchingBehavior;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithConfiguration:self];
}

- (void)setOriginatingIconLocation:(id)a3
{
}

- (void)setFolder:(id)a3
{
}

- (SBFolderControllerConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBFolderControllerConfiguration;
  v2 = [(SBFolderControllerConfiguration *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_unint64_t allowedOrientations = 30;
    objc_storeStrong((id *)&v2->_originatingIconLocation, @"SBIconLocationNone");
    v3->_headerHeight = *(double *)MEMORY[0x1E4FB30D8];
    v3->_snapsToPageBoundariesAfterScrolling = 1;
  }
  return v3;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (void)setOverrideIconImageAppearance:(id)a3
{
}

- (void)setOrientation:(int64_t)a3
{
  self->_int64_t orientation = a3;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void)setIconViewProvider:(id)a3
{
}

- (void)setIconImageCache:(id)a3
{
}

- (void)setFolderIconImageCache:(id)a3
{
}

- (void)setFolderDelegate:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setAllowedOrientations:(unint64_t)a3
{
  self->_unint64_t allowedOrientations = a3;
}

- (void)setAddsFocusGuidesForWrapping:(BOOL)a3
{
  self->_addsFocusGuidesForWrapping = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_originatingIconLocation, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_animationContext, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_folderDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_folder, 0);
}

- (NSString)description
{
  return (NSString *)[(SBFolderControllerConfiguration *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBFolderControllerConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  objc_super v5 = [(SBFolderControllerConfiguration *)self folder];
  id v6 = (id)[v4 appendObject:v5 withName:@"folder"];

  id v7 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderControllerConfiguration orientation](self, "orientation"), @"orientation");
  id v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBFolderControllerConfiguration allowedOrientations](self, "allowedOrientations"), @"allowedOrientations");
  v9 = [(SBFolderControllerConfiguration *)self listLayoutProvider];
  id v10 = (id)[v4 appendObject:v9 withName:@"listLayoutProvider"];

  v11 = [(SBFolderControllerConfiguration *)self iconViewProvider];
  id v12 = (id)[v4 appendObject:v11 withName:@"iconViewProvider"];

  uint64_t v13 = [(SBFolderControllerConfiguration *)self delegate];
  id v14 = (id)[v4 appendObject:v13 withName:@"delegate"];

  uint64_t v15 = [(SBFolderControllerConfiguration *)self folderDelegate];
  id v16 = (id)[v4 appendObject:v15 withName:@"folderDelegate"];

  uint64_t v17 = [(SBFolderControllerConfiguration *)self legibilitySettings];
  id v18 = (id)[v4 appendObject:v17 withName:@"legibilitySettings"];

  uint64_t v19 = [(SBFolderControllerConfiguration *)self folderIconImageCache];
  id v20 = (id)[v4 appendObject:v19 withName:@"folderIconImageCache"];

  uint64_t v21 = [(SBFolderControllerConfiguration *)self iconImageCache];
  id v22 = (id)[v4 appendObject:v21 withName:@"iconImageCache"];

  double v23 = [(SBFolderControllerConfiguration *)self animationContext];
  id v24 = (id)[v4 appendObject:v23 withName:@"animationContext"];

  uint64_t v25 = [(SBFolderControllerConfiguration *)self headerView];
  id v26 = (id)[v4 appendObject:v25 withName:@"headerView"];

  [(SBFolderControllerConfiguration *)self headerHeight];
  id v27 = (id)objc_msgSend(v4, "appendFloat:withName:", @"headerHeight");
  CGFloat v28 = [(SBFolderControllerConfiguration *)self originatingIconLocation];
  id v29 = (id)[v4 appendObject:v28 withName:@"originatingIconLocation"];

  id v30 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderControllerConfiguration userInterfaceLayoutDirectionHandling](self, "userInterfaceLayoutDirectionHandling"), @"userInterfaceLayoutDirectionHandling");
  id v31 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFolderControllerConfiguration isVertical](self, "isVertical"), @"isVertical");
  [(SBFolderControllerConfiguration *)self initialViewFrame];
  id v32 = (id)objc_msgSend(v4, "appendRect:withName:", @"initialViewFrame");
  id v33 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFolderControllerConfiguration snapsToPageBoundariesAfterScrolling](self, "snapsToPageBoundariesAfterScrolling"), @"snapsToPageBoundariesAfterScrolling");
  id v34 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFolderControllerConfiguration addsFocusGuidesForWrapping](self, "addsFocusGuidesForWrapping"), @"addsFocusGuidesForWrapping");
  objc_super v35 = [(SBFolderControllerConfiguration *)self overrideIconImageAppearance];
  id v36 = (id)[v4 appendObject:v35 withName:@"overrideIconImageAppearance"];

  v37 = SBHStringForIconListIconSpacingAxisMatchingBehavior([(SBFolderControllerConfiguration *)self iconSpacingAxisMatchingBehavior]);
  [v4 appendString:v37 withName:@"iconSpacingAxisMatchingBehavior"];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBFolderControllerConfiguration *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void)setAnimationContext:(id)a3
{
}

- (void)setHeaderView:(id)a3
{
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (void)setUserInterfaceLayoutDirectionHandling:(unint64_t)a3
{
  self->_userInterfaceLayoutDirectionHandling = a3;
}

- (void)setInitialViewFrame:(CGRect)a3
{
  self->_initialViewFrame = a3;
}

- (void)setSnapsToPageBoundariesAfterScrolling:(BOOL)a3
{
  self->_snapsToPageBoundariesAfterScrolling = a3;
}

- (void)setIconSpacingAxisMatchingBehavior:(int64_t)a3
{
  self->_iconSpacingAxisMatchingBehavior = a3;
}

@end