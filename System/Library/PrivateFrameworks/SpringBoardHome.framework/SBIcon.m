@interface SBIcon
+ (BOOL)forcesBackgroundIconGeneration;
+ (BOOL)hasIconImage;
+ (id)backgroundGenerationQueue;
+ (id)genericIconImageWithInfo:(SBIconImageInfo *)a3;
+ (id)genericIconLayerWithInfo:(SBIconImageInfo *)a3;
+ (id)iconImageFromUnmaskedImage:(id)a3 info:(SBIconImageInfo *)a4;
- (BOOL)canBeAddedToMultiItemDrag;
- (BOOL)canBeAddedToSubfolder;
- (BOOL)canBeReceivedByIcon;
- (BOOL)canGenerateIconsInBackground;
- (BOOL)canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (BOOL)canReceiveGrabbedIcon;
- (BOOL)canTightenLabel;
- (BOOL)canTruncateLabel;
- (BOOL)containsNodeIdentifier:(id)a3;
- (BOOL)hasApplication;
- (BOOL)hasApplicationPlaceholder;
- (BOOL)hasObserver:(id)a3;
- (BOOL)isAdditionalItemsIndicatorIcon;
- (BOOL)isAppClipIcon;
- (BOOL)isApplicationIcon;
- (BOOL)isBookmarkIcon;
- (BOOL)isCategoryIcon;
- (BOOL)isClusteredIconPlaceholder;
- (BOOL)isDebugIcon;
- (BOOL)isFolderIcon;
- (BOOL)isGrabbedIconPlaceholder;
- (BOOL)isGridSizeClassAllowed:(id)a3;
- (BOOL)isLaunchDisabledForObscuredReason;
- (BOOL)isLaunchEnabled;
- (BOOL)isLeafIcon;
- (BOOL)isLibraryPodIcon;
- (BOOL)isPlaceholder;
- (BOOL)isProgressPaused;
- (BOOL)isTimedOut;
- (BOOL)isUninstallSupported;
- (BOOL)isUninstalled;
- (BOOL)isWebAppIcon;
- (BOOL)isWidgetIcon;
- (BOOL)isWidgetStackIcon;
- (BOOL)performLaunchFromLocation:(id)a3 context:(id)a4;
- (BOOL)shouldAnimateProgress;
- (BOOL)shouldWarmUp;
- (BOOL)supportsRasterization;
- (BOOL)supportsStackConfiguration;
- (Class)iconImageViewClassForLocation:(id)a3;
- (NSArray)folderTitleOptions;
- (NSArray)iTunesCategoriesOrderedByRelevancy;
- (NSArray)tags;
- (NSString)automationID;
- (NSString)description;
- (NSString)displayName;
- (NSString)folderFallbackTitle;
- (NSString)gridSizeClass;
- (NSString)nodeIdentifier;
- (NSString)uninstallAlertBody;
- (NSString)uninstallAlertCancelTitle;
- (NSString)uninstallAlertConfirmTitle;
- (NSString)uninstallAlertTitle;
- (NSUserActivity)draggingUserActivity;
- (SBHIconGridSizeClassSet)supportedGridSizeClasses;
- (SBIcon)init;
- (SBIconDelegate)delegate;
- (double)progressPercent;
- (id)_sbhIconLibraryCollationString;
- (id)_sbhIconLibraryOverrideCollationSectionTitle;
- (id)accessoryTextForLocation:(id)a3;
- (id)application;
- (id)applicationBundleID;
- (id)applicationPlaceholder;
- (id)badgeNumberOrString;
- (id)containedNodeIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayNameForLocation:(id)a3;
- (id)folder;
- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3;
- (id)genericIconImageWithInfo:(SBIconImageInfo *)a3;
- (id)iconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (id)iconLibraryQueryingAlphaSortString;
- (id)iconLibraryQueryingFilterStrings;
- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4;
- (id)leafIdentifier;
- (id)makeIconImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (id)makeIconLayerFromImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (id)makeIconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (id)nodeDescriptionWithPrefix:(id)a3;
- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4;
- (id)overrideBadgeNumberOrString;
- (id)parentFolderIcon;
- (id)representedSceneIdentifier;
- (id)statusDescriptionForLocation:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)unmaskedIconImageWithInfo:(SBIconImageInfo *)a3;
- (int64_t)accessoryTypeForLocation:(id)a3;
- (int64_t)badgeValue;
- (int64_t)labelAccessoryType;
- (int64_t)localizedCompareDisplayNames:(id)a3;
- (int64_t)progressState;
- (void)_notifyAccessoriesDidUpdate;
- (void)_notifyImageDidUpdate;
- (void)_notifyLaunchEnabledDidChange;
- (void)_setPropertiesFromIcon:(id)a3;
- (void)addObserver:(id)a3;
- (void)applyTreatmentsToLayer:(id)a3;
- (void)archivableStateDidChange;
- (void)completeUninstall;
- (void)enumerateObserversUsingBlock:(id)a3;
- (void)iconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)launchFromLocation:(id)a3 context:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setBadge:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGridSizeClass:(id)a3;
- (void)setIconImageCacheIdentifier:(id)a3;
- (void)setOverrideBadgeNumberOrString:(id)a3;
- (void)setUninstalled;
@end

@implementation SBIcon

- (id)overrideBadgeNumberOrString
{
  return self->_overrideBadgeNumberOrString;
}

- (int64_t)accessoryTypeForLocation:(id)a3
{
  v3 = [(SBIcon *)self accessoryTextForLocation:a3];
  int64_t v4 = v3 != 0;

  return v4;
}

- (id)accessoryTextForLocation:(id)a3
{
  v3 = [(SBIcon *)self badgeNumberOrString];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v3;
  v6 = v5;
  v7 = v5;
  if (isKindOfClass)
  {
    if ([v5 integerValue] < 1)
    {
      v7 = 0;
    }
    else
    {
      v8 = objc_msgSend(MEMORY[0x1E4F28EE0], "sbf_cachedDecimalNumberFormatter");
      v7 = [v8 stringFromNumber:v6];
    }
  }

  return v7;
}

- (BOOL)isFolderIcon
{
  return 0;
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (int64_t)progressState
{
  return 0;
}

- (Class)iconImageViewClassForLocation:(id)a3
{
  return (Class)objc_opt_class();
}

- (double)progressPercent
{
  return 0.0;
}

- (BOOL)isProgressPaused
{
  return 0;
}

- (BOOL)isApplicationIcon
{
  return 0;
}

- (BOOL)isLaunchEnabled
{
  return 1;
}

- (BOOL)isLaunchDisabledForObscuredReason
{
  return 0;
}

- (BOOL)isBookmarkIcon
{
  return 0;
}

- (id)applicationBundleID
{
  return 0;
}

- (NSString)nodeIdentifier
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"SBIcon:%p", self);
}

- (id)statusDescriptionForLocation:(id)a3
{
  return 0;
}

- (BOOL)canTruncateLabel
{
  return 1;
}

- (BOOL)canTightenLabel
{
  return 1;
}

- (void)addObserver:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    BOOL v4 = [(NSHashTable *)self->_observers containsObject:v9];
    id v5 = v9;
    if (v4) {
      goto LABEL_8;
    }
    observers = self->_observers;
    if (!observers)
    {
      v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v9];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ cannot be observed by a nil object", objc_opt_class() format];
  }
  id v5 = v9;
LABEL_8:
}

- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SBIcon *)self nodeIdentifier];
  int v9 = [v8 isEqual:v7];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F1CA80] setWithObject:v6];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_notifyLaunchEnabledDidChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 iconLaunchEnabledDidChange:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyAccessoriesDidUpdate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 iconAccessoriesDidUpdate:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)shouldAnimateProgress
{
  return 1;
}

- (void)enumerateObserversUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t, char *))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      char v12 = 0;
      v4[2](v4, v11, &v12);
      if (v12) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)isTimedOut
{
  return 0;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBIcon *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (BOOL)isWidgetIcon
{
  return 0;
}

- (BOOL)isDebugIcon
{
  return 0;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v5 = [(SBIcon *)self nodeIdentifier];
  if (v5 == self) {
    id v7 = (id)[v4 appendPointer:self withName:@"nodeID"];
  }
  else {
    id v6 = (id)[v4 appendObject:v5 withName:@"nodeID"];
  }
  uint64_t v8 = [(SBIcon *)self applicationBundleID];
  [v4 appendString:v8 withName:@"bundleID" skipIfEmpty:1];

  uint64_t v9 = [(SBIcon *)self gridSizeClass];
  uint64_t v10 = v9;
  if (v9 != @"SBHIconGridSizeClassDefault" && (-[__CFString isEqualToString:](v9, "isEqualToString:") & 1) == 0)
  {
    uint64_t v11 = SBHStringForIconGridSizeClass(v10);
    [v4 appendString:v11 withName:@"gridSizeClass"];
  }
  return v4;
}

- (id)badgeNumberOrString
{
  id overrideBadgeNumberOrString = self->_overrideBadgeNumberOrString;
  if (!overrideBadgeNumberOrString) {
    id overrideBadgeNumberOrString = self->_badgeNumberOrString;
  }
  id v3 = overrideBadgeNumberOrString;
  return v3;
}

- (void)setBadge:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend(self->_badgeNumberOrString, "isEqual:") & 1) == 0)
  {
    objc_storeStrong(&self->_badgeNumberOrString, a3);
    [(SBIcon *)self noteBadgeDidChange];
  }
}

- (void)applyTreatmentsToLayer:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBIcon *)self isTimedOut] || [(SBIcon *)self progressState])
  {
    id v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
    id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
    uint64_t v7 = [v6 CGColor];
    [v5 setValue:v7 forKey:*MEMORY[0x1E4F3A148]];

    v9[0] = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v4 setFilters:v8];
  }
  else
  {
    [v4 setFilters:MEMORY[0x1E4F1CBF0]];
  }
}

- (BOOL)isAdditionalItemsIndicatorIcon
{
  return 0;
}

- (BOOL)isLibraryPodIcon
{
  return 0;
}

- (BOOL)isAppClipIcon
{
  return 0;
}

- (BOOL)isWebAppIcon
{
  return 0;
}

- (id)application
{
  return 0;
}

- (id)applicationPlaceholder
{
  return 0;
}

- (BOOL)hasApplication
{
  v2 = [(SBIcon *)self application];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasApplicationPlaceholder
{
  v2 = [(SBIcon *)self applicationPlaceholder];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isGrabbedIconPlaceholder
{
  return 0;
}

- (BOOL)isClusteredIconPlaceholder
{
  return 0;
}

- (BOOL)isLeafIcon
{
  return 0;
}

- (id)leafIdentifier
{
  return 0;
}

- (id)representedSceneIdentifier
{
  return 0;
}

- (id)folder
{
  return 0;
}

- (id)parentFolderIcon
{
  v2 = [(SBIcon *)self folder];
  BOOL v3 = [v2 parentFolder];
  id v4 = [v3 icon];

  return v4;
}

- (BOOL)isCategoryIcon
{
  return 0;
}

- (id)iconLibraryQueryingAlphaSortString
{
  return [(SBIcon *)self displayNameForLocation:@"SBIconLocationRoot"];
}

- (id)iconLibraryQueryingFilterStrings
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SBIcon *)self displayNameForLocation:@"SBIconLocationAppLibrarySearch"];
  BOOL v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (id)_sbhIconLibraryCollationString
{
  uint64_t v2 = [(SBIcon *)self displayNameForLocation:@"SBIconLocationAppLibrarySearch"];
  BOOL v3 = v2;
  if (!v2) {
    uint64_t v2 = &stru_1F2FA0300;
  }
  id v4 = [(__CFString *)v2 localizedUppercaseString];

  return v4;
}

- (id)_sbhIconLibraryOverrideCollationSectionTitle
{
  return 0;
}

- (SBIcon)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBIcon;
  uint64_t v2 = [(SBIcon *)&v5 init];
  BOOL v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_gridSizeClass, @"SBHIconGridSizeClassDefault");
  }
  return v3;
}

- (NSString)description
{
  return (NSString *)[(SBIcon *)self descriptionWithMultilinePrefix:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_super v5 = v4;
  if (v4)
  {
    [v4 _setPropertiesFromIcon:self];
    id v6 = v5;
  }

  return v5;
}

- (BOOL)hasObserver:(id)a3
{
  return [(NSHashTable *)self->_observers containsObject:a3];
}

- (BOOL)containsNodeIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SBIcon *)self nodeIdentifier];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (id)containedNodeIdentifiers
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA80];
  BOOL v3 = [(SBIcon *)self nodeIdentifier];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4
{
  objc_super v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4 + 1];
  [v5 insertObject:self atIndex:0];
  return v5;
}

- (id)nodeDescriptionWithPrefix:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [NSString string];
  }
  objc_super v5 = [(SBIcon *)self nodeIdentifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = NSString;
  if (isKindOfClass)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@%@", v4, v5];
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [(SBIcon *)self displayNameForLocation:@"SBIconLocationNone"];
    uint64_t v8 = [v7 stringWithFormat:@"%@%@-%p (%@)", v4, v9, v5, v10];
  }
  return v8;
}

- (BOOL)shouldWarmUp
{
  return 1;
}

- (id)displayNameForLocation:(id)a3
{
  return 0;
}

- (NSString)displayName
{
  return (NSString *)[(SBIcon *)self displayNameForLocation:@"SBIconLocationNone"];
}

- (int64_t)localizedCompareDisplayNames:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBIcon *)self displayNameForLocation:@"SBIconLocationNone"];
  if (v5) {
    char v6 = (__CFString *)v5;
  }
  else {
    char v6 = &stru_1F2FA0300;
  }
  uint64_t v7 = [v4 displayNameForLocation:@"SBIconLocationNone"];

  if (v7) {
    uint64_t v8 = (__CFString *)v7;
  }
  else {
    uint64_t v8 = &stru_1F2FA0300;
  }
  int64_t v9 = [(__CFString *)v6 localizedStandardCompare:v8];

  return v9;
}

- (NSArray)tags
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)supportsStackConfiguration
{
  return 0;
}

- (BOOL)supportsRasterization
{
  return 1;
}

+ (id)iconImageFromUnmaskedImage:(id)a3 info:(SBIconImageInfo *)a4
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = objc_alloc(MEMORY[0x1E4F6F1E8]);
  id v12 = v10;
  uint64_t v13 = [v12 CGImage];
  [v12 scale];
  long long v14 = objc_msgSend(v11, "initWithCGImage:scale:", v13);
  id v15 = objc_alloc(MEMORY[0x1E4F6F248]);
  v27[0] = v14;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v17 = (void *)[v15 initWithImages:v16];

  uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v9, v8, v7);
  [v18 setShape:1];
  v19 = [v17 prepareImageForDescriptor:v18];
  v20 = v19;
  if (v19)
  {
    v21 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v22 = [v19 CGImage];
    [v20 scale];
    objc_msgSend(v21, "imageWithCGImage:scale:orientation:", v22, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = v12;
  }
  v24 = v23;
  if ([v12 flipsForRightToLeftLayoutDirection])
  {
    uint64_t v25 = [v24 imageFlippedForRightToLeftLayoutDirection];

    v24 = (void *)v25;
  }

  return v24;
}

- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  id v11 = [(SBIcon *)self unmaskedIconImageWithInfo:a3];
  if (v11)
  {
    id v12 = objc_msgSend((id)objc_opt_class(), "iconImageFromUnmaskedImage:info:", v11, v10, v9, v8, v7);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)makeIconImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  if (a4) {
    [(SBIcon *)self generateIconImageWithInfo:a3];
  }
  else {
  double v5 = [(SBIcon *)self unmaskedIconImageWithInfo:a3];
  }
  return v5;
}

- (id)makeIconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  return 0;
}

- (id)makeIconLayerFromImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v7 = v6;
  double v8 = v5;
  double v9 = [(SBIcon *)self iconImageWithInfo:a3 traitCollection:a4 options:a5];
  id v10 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v8, v7);
  id v11 = v9;
  objc_msgSend(v10, "setContents:", objc_msgSend(v11, "CGImage"));

  return v10;
}

- (id)iconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  id v15 = a3;
  long long v16 = -[SBIcon makeIconLayerWithInfo:traitCollection:options:](self, "makeIconLayerWithInfo:traitCollection:options:", v15, a4, v13, v12, v11, v10);
  if (!v16)
  {
    long long v16 = -[SBIcon makeIconLayerFromImageWithInfo:traitCollection:options:](self, "makeIconLayerFromImageWithInfo:traitCollection:options:", v15, a4, v13, v12, v11, v10);
  }

  return v16;
}

- (BOOL)canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  return 1;
}

+ (id)backgroundGenerationQueue
{
  if (backgroundGenerationQueue_onceToken != -1) {
    dispatch_once(&backgroundGenerationQueue_onceToken, &__block_literal_global_67);
  }
  uint64_t v2 = (void *)backgroundGenerationQueue_backgroundGenerationQueue;
  return v2;
}

void __35__SBIcon_backgroundGenerationQueue__block_invoke()
{
  id v2 = [MEMORY[0x1E4F4F730] serial];
  uint64_t v0 = BSDispatchQueueCreate();
  v1 = (void *)backgroundGenerationQueue_backgroundGenerationQueue;
  backgroundGenerationQueue_backgroundGenerationQueue = v0;
}

- (void)iconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  double v12 = v9;
  double v13 = v8;
  double v14 = v7;
  double v15 = v6;
  v17 = a3;
  uint64_t v18 = (void (**)(id, void *))(id)a5;
  if (-[SBIcon canMakeIconLayerQuicklyWithInfo:traitCollection:options:](self, "canMakeIconLayerQuicklyWithInfo:traitCollection:options:", v17, a4, v15, v14, v13, v12))
  {
    v19 = -[SBIcon iconLayerWithInfo:traitCollection:options:](self, "iconLayerWithInfo:traitCollection:options:", v17, a4, v15, v14, v13, v12);
    v18[2](v18, v19);
  }
  else
  {
    v20 = [(id)objc_opt_class() backgroundGenerationQueue];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __70__SBIcon_iconLayerWithInfo_traitCollection_options_completionHandler___block_invoke;
    v21[3] = &unk_1E6AB4C30;
    v21[4] = self;
    double v24 = v15;
    double v25 = v14;
    double v26 = v13;
    double v27 = v12;
    uint64_t v22 = v17;
    id v28 = a4;
    id v23 = v18;
    dispatch_async(v20, v21);
  }
}

void __70__SBIcon_iconLayerWithInfo_traitCollection_options_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareToMakeLayerWithInfo:traitCollection:options:", *(void *)(a1 + 40), *(void *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v2 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  BSDispatchMain();
}

void __70__SBIcon_iconLayerWithInfo_traitCollection_options_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "iconLayerWithInfo:traitCollection:options:", *(void *)(a1 + 40), *(void *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)unmaskedIconImageWithInfo:(SBIconImageInfo *)a3
{
  return 0;
}

- (id)genericIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  double v11 = objc_opt_class();
  return (id)objc_msgSend(v11, "genericIconImageWithInfo:", v10, v9, v8, v7);
}

+ (id)genericIconImageWithInfo:(SBIconImageInfo *)a3
{
  uint64_t v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v11 = objc_msgSend(MEMORY[0x1E4F6F248], "genericApplicationIcon", a3);
  double v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v10, v9, v8);
  double v13 = [v11 prepareImageForDescriptor:v12];
  double v14 = v13;
  if (!v13
    || (double v15 = (void *)MEMORY[0x1E4FB1818],
        uint64_t v16 = [v13 CGImage],
        [v14 scale],
        objc_msgSend(v15, "imageWithCGImage:scale:orientation:", v16, 0),
        (v17 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v18 = SBLogIcon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v14;
      __int16 v24 = 2112;
      double v25 = v11;
      __int16 v26 = 2112;
      double v27 = v12;
      _os_log_error_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_ERROR, "Could not create generic application icon via IconServices. isImage=%@, genericIcon=%@, imageDescriptor=%@", buf, 0x20u);
    }

    v19 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __35__SBIcon_genericIconImageWithInfo___block_invoke;
    v21[3] = &__block_descriptor_64_e5_v8__0l;
    *(double *)&v21[4] = v10;
    *(double *)&void v21[5] = v9;
    *(double *)&v21[6] = v8;
    v21[7] = v7;
    v17 = objc_msgSend(MEMORY[0x1E4FB1818], "sbf_imageFromBGRAContextWithSize:scale:colorSpace:withAlpha:pool:drawing:encapsulation:", v19, 1, 0, v21, 0, v10, v9, v8);
    CGColorSpaceRelease(v19);
  }

  return v17;
}

void __35__SBIcon_genericIconImageWithInfo___block_invoke(double *a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, a1[4], a1[5], a1[7]);
  [v2 addClip];

  double v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 set];

  uint64_t v4 = *((void *)a1 + 4);
  uint64_t v5 = *((void *)a1 + 5);
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  UIRectFill(*(CGRect *)&v6);
}

+ (id)genericIconLayerWithInfo:(SBIconImageInfo *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  double v9 = [a1 genericIconImageWithInfo:a3];
  id v10 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v8, v7);
  [v10 setCornerRadius:v6];
  [v10 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  id v11 = v9;
  objc_msgSend(v10, "setContents:", objc_msgSend(v11, "CGImage"));

  return v10;
}

+ (BOOL)forcesBackgroundIconGeneration
{
  return 0;
}

- (BOOL)canGenerateIconsInBackground
{
  id v2 = objc_opt_class();
  return [v2 canGenerateIconsInBackground];
}

+ (BOOL)hasIconImage
{
  return 1;
}

- (void)setOverrideBadgeNumberOrString:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    double v4 = (void *)[v6 copy];
    id overrideBadgeNumberOrString = self->_overrideBadgeNumberOrString;
    self->_id overrideBadgeNumberOrString = v4;

    [(SBIcon *)self noteBadgeDidChange];
  }
}

- (int64_t)badgeValue
{
  if (self->_overrideBadgeNumberOrString)
  {
    id overrideBadgeNumberOrString = self->_overrideBadgeNumberOrString;
    return [overrideBadgeNumberOrString integerValue];
  }
  else
  {
    double v4 = [(SBIcon *)self badgeNumberOrString];
    int64_t v5 = [v4 integerValue];

    return v5;
  }
}

- (int64_t)labelAccessoryType
{
  if ([(SBIcon *)self isTimedOut]) {
    return 4;
  }
  else {
    return 0;
  }
}

- (NSString)automationID
{
  id v2 = [(SBIcon *)self displayNameForLocation:@"SBIconLocationNone"];
  double v3 = [@"BTN " stringByAppendingString:v2];

  return (NSString *)v3;
}

- (void)launchFromLocation:(id)a3 context:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(SBIcon *)self delegate];
  double v9 = SBLogIcon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138413058;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_DEFAULT, "SBIcon %@ launchFromLocation:%{public}@ context:%@ delegate:%@", (uint8_t *)&v10, 0x2Au);
  }

  if (![(SBIcon *)self performLaunchFromLocation:v6 context:v7]) {
    [v8 icon:self launchFromLocation:v6 context:v7];
  }
}

- (BOOL)performLaunchFromLocation:(id)a3 context:(id)a4
{
  return 0;
}

- (BOOL)isUninstallSupported
{
  return 0;
}

- (void)completeUninstall
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = SBLogIcon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    int64_t v5 = self;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Complete uninstall for icon: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setUninstalled
{
  self->_uninstalled = 1;
}

- (NSString)uninstallAlertTitle
{
  double v3 = NSString;
  int v4 = SBHBundle();
  int64_t v5 = [v4 localizedStringForKey:@"UNINSTALL_ICON_TITLE_DELETE_WITH_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  uint64_t v6 = [(SBIcon *)self displayNameForLocation:@"SBIconLocationNone"];
  id v7 = objc_msgSend(v3, "stringWithFormat:", v5, v6);

  return (NSString *)v7;
}

- (NSString)uninstallAlertBody
{
  return 0;
}

- (NSString)uninstallAlertConfirmTitle
{
  id v2 = SBHBundle();
  double v3 = [v2 localizedStringForKey:@"UNINSTALL_ICON_BUTTON_DELETE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

  return (NSString *)v3;
}

- (NSString)uninstallAlertCancelTitle
{
  id v2 = SBHBundle();
  double v3 = [v2 localizedStringForKey:@"UNINSTALL_ICON_BUTTON_CANCEL" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

  return (NSString *)v3;
}

- (NSArray)folderTitleOptions
{
  return 0;
}

- (NSString)folderFallbackTitle
{
  return 0;
}

- (BOOL)canReceiveGrabbedIcon
{
  return 1;
}

- (BOOL)canBeReceivedByIcon
{
  return 1;
}

- (BOOL)canBeAddedToMultiItemDrag
{
  return 1;
}

- (NSArray)iTunesCategoriesOrderedByRelevancy
{
  return 0;
}

- (BOOL)canBeAddedToSubfolder
{
  double v3 = [(SBIcon *)self gridSizeClass];
  if (v3 == @"SBHIconGridSizeClassDefault")
  {
    char v5 = 1;
  }
  else
  {
    int v4 = [(SBIcon *)self gridSizeClass];
    char v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"];
  }
  return v5;
}

- (void)setGridSizeClass:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v4 = (NSString *)a3;
  char v5 = v4;
  if (self->_gridSizeClass != v4
    && !-[NSString isEqualToString:](v4, "isEqualToString:")
    && [(SBIcon *)self isGridSizeClassAllowed:v5])
  {
    uint64_t v6 = (NSString *)[(NSString *)v5 copy];
    gridSizeClass = self->_gridSizeClass;
    self->_gridSizeClass = v6;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v8 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector()) {
            [v13 iconGridSizeClassDidChange:self];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (BOOL)isGridSizeClassAllowed:(id)a3
{
  id v4 = a3;
  char v5 = [(SBIcon *)self supportedGridSizeClasses];
  char v6 = [v5 containsGridSizeClass:v4];

  return v6;
}

- (SBHIconGridSizeClassSet)supportedGridSizeClasses
{
  return (SBHIconGridSizeClassSet *)+[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses];
}

- (void)archivableStateDidChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 iconArchivableStateDidChange:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (NSUserActivity)draggingUserActivity
{
  return 0;
}

- (void)_setPropertiesFromIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 gridSizeClass];
  [(SBIcon *)self setGridSizeClass:v5];

  uint64_t v6 = [v4 badgeNumberOrString];
  [(SBIcon *)self setBadge:v6];

  uint64_t v7 = [v4 overrideBadgeNumberOrString];
  [(SBIcon *)self setOverrideBadgeNumberOrString:v7];

  LODWORD(v7) = [v4 isUninstalled];
  if (v7)
  {
    [(SBIcon *)self setUninstalled];
  }
}

- (id)succinctDescription
{
  id v2 = [(SBIcon *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void)_notifyImageDidUpdate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 iconImageDidUpdate:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (SBIconDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBIconDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setIconImageCacheIdentifier:(id)a3
{
}

- (BOOL)isUninstalled
{
  return self->_uninstalled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
  objc_storeStrong((id *)&self->_iconImageCacheIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_overrideBadgeNumberOrString, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_badgeNumberOrString, 0);
}

- (BOOL)isWidgetStackIcon
{
  return 0;
}

@end