@interface SBFolderIcon
+ (BOOL)hasIconImage;
- (BOOL)canBeAddedToMultiItemDrag;
- (BOOL)canBeAddedToSubfolder;
- (BOOL)containsNodeIdentifier:(id)a3;
- (BOOL)isFolderIcon;
- (BOOL)isProgressPaused;
- (Class)iconImageViewClassForLocation:(id)a3;
- (NSString)description;
- (SBFolder)folder;
- (SBFolderIcon)initWithFolder:(id)a3;
- (SBFolderIcon)initWithFolderIcon:(id)a3 copyFolder:(BOOL)a4;
- (double)progressPercent;
- (id)badgeNumberOrString;
- (id)containedNodeIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayNameForLocation:(id)a3;
- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3;
- (id)genericIconImageWithInfo:(SBIconImageInfo *)a3;
- (id)iconAtListIndex:(unint64_t)a3 iconIndex:(unint64_t)a4;
- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4;
- (id)leafIconsWithBadgesSortedByImportance;
- (id)nodeDescriptionWithPrefix:(id)a3;
- (id)nodeIdentifier;
- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4;
- (id)rootFolder;
- (int64_t)progressState;
- (unint64_t)gridCellIndexForIconIndex:(unint64_t)a3;
- (unint64_t)listIndexForContainedIcon:(id)a3;
- (void)_adjustForIconsAdded:(id)a3 removed:(id)a4;
- (void)_containedIconAccessoriesDidUpdate:(id)a3;
- (void)_containedIconImageChanged:(id)a3;
- (void)_containedIconLaunchEnabledDidUpdate:(id)a3;
- (void)_performDelayedIconUpdates;
- (void)_updateBadgeValue;
- (void)_updateProgress;
- (void)addNodeObserver:(id)a3;
- (void)badgeBehaviorProviderDidChange:(id)a3;
- (void)dealloc;
- (void)folder:(id)a3 didAddList:(id)a4;
- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5;
- (void)iconAccessoriesDidUpdate:(id)a3;
- (void)iconLaunchEnabledDidChange:(id)a3;
- (void)invalidateUpdateIconRunLoopObserver;
- (void)localeChanged;
- (void)node:(id)a3 didAddContainedNodeIdentifiers:(id)a4;
- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4;
- (void)nodeDidMoveContainedNodes:(id)a3;
- (void)noteContainedIcon:(id)a3 replacedIcon:(id)a4;
- (void)noteContainedIconsAdded:(id)a3 removed:(id)a4;
- (void)removeNodeObserver:(id)a3;
- (void)scheduleUpdateIconRunLoopObserver;
@end

@implementation SBFolderIcon

- (BOOL)isFolderIcon
{
  return 1;
}

- (int64_t)progressState
{
  if (self->_delayedIconUpdates || self->_updateIconRunLoopObserver) {
    [(SBFolderIcon *)self _performDelayedIconUpdates];
  }
  return self->_progressState;
}

- (double)progressPercent
{
  if (self->_delayedIconUpdates || self->_updateIconRunLoopObserver) {
    [(SBFolderIcon *)self _performDelayedIconUpdates];
  }
  return self->_progressPercent;
}

- (BOOL)isProgressPaused
{
  return 0;
}

- (Class)iconImageViewClassForLocation:(id)a3
{
  return (Class)self;
}

- (id)nodeIdentifier
{
  return [(SBFolder *)self->_folder nodeIdentifier];
}

- (id)displayNameForLocation:(id)a3
{
  return [(SBFolder *)self->_folder displayName];
}

- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4
{
  return [(SBFolder *)self->_folder indexPathsForContainedNodeIdentifier:a3 prefixPath:a4];
}

- (void)iconLaunchEnabledDidChange:(id)a3
{
  id v6 = a3;
  v4 = [(SBFolderIcon *)self folder];
  int v5 = [v4 containsIcon:v6];

  if (v5)
  {
    [(SBFolderIcon *)self _containedIconImageChanged:v6];
    [(SBFolderIcon *)self _containedIconLaunchEnabledDidUpdate:v6];
  }
}

- (void)_containedIconImageChanged:(id)a3
{
  id v4 = a3;
  if ([(SBFolderIcon *)self listIndexForContainedIcon:v4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__SBFolderIcon__containedIconImageChanged___block_invoke;
    v5[3] = &unk_1E6AB2B60;
    v5[4] = self;
    id v6 = v4;
    [(SBIcon *)self enumerateObserversUsingBlock:v5];
  }
}

- (void)_containedIconAccessoriesDidUpdate:(id)a3
{
  id v4 = a3;
  if ([(SBFolderIcon *)self listIndexForContainedIcon:v4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    v7 = __51__SBFolderIcon__containedIconAccessoriesDidUpdate___block_invoke;
    v8 = &unk_1E6AB2B60;
    v9 = self;
    id v10 = v4;
    [(SBIcon *)self enumerateObserversUsingBlock:&v5];
    [(SBIcon *)self _notifyAccessoriesDidUpdate];
  }
}

- (void)iconAccessoriesDidUpdate:(id)a3
{
  id v4 = a3;
  [(SBFolderIcon *)self scheduleUpdateIconRunLoopObserver];
  [(SBFolderIcon *)self _containedIconAccessoriesDidUpdate:v4];
}

- (void)scheduleUpdateIconRunLoopObserver
{
  if (!self->_updateIconRunLoopObserver && !self->_delayedIconUpdates)
  {
    objc_initWeak(&location, self);
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__SBFolderIcon_scheduleUpdateIconRunLoopObserver__block_invoke;
    v5[3] = &unk_1E6AAD210;
    objc_copyWeak(&v6, &location);
    self->_updateIconRunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 0, 0, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_updateIconRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_containedIconLaunchEnabledDidUpdate:(id)a3
{
  id v4 = a3;
  if ([(SBFolderIcon *)self listIndexForContainedIcon:v4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__SBFolderIcon__containedIconLaunchEnabledDidUpdate___block_invoke;
    v5[3] = &unk_1E6AB2B60;
    void v5[4] = self;
    id v6 = v4;
    [(SBIcon *)self enumerateObserversUsingBlock:v5];
  }
}

void __53__SBFolderIcon__containedIconLaunchEnabledDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 folderIcon:*(void *)(a1 + 32) containedIconLaunchEnabledDidChange:*(void *)(a1 + 40)];
  }
}

void __51__SBFolderIcon__containedIconAccessoriesDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 folderIcon:*(void *)(a1 + 32) containedIconAccessoriesDidUpdate:*(void *)(a1 + 40)];
  }
}

void __43__SBFolderIcon__containedIconImageChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 folderIcon:*(void *)(a1 + 32) containedIconImageDidUpdate:*(void *)(a1 + 40)];
  }
}

- (unint64_t)listIndexForContainedIcon:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(SBFolderIcon *)self folder];
  id v6 = [v5 lists];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 indexForIcon:v4] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = [(SBFolderIcon *)self folder];
          v14 = [v13 lists];
          unint64_t v8 = [v14 indexOfObject:v12];

          goto LABEL_11;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_11:

  return v8;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (id)badgeNumberOrString
{
  if (self->_delayedIconUpdates || self->_updateIconRunLoopObserver) {
    [(SBFolderIcon *)self _performDelayedIconUpdates];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBFolderIcon;
  id v3 = [(SBIcon *)&v5 badgeNumberOrString];
  return v3;
}

- (void)noteContainedIconsAdded:(id)a3 removed:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  [(SBFolderIcon *)self _adjustForIconsAdded:v6 removed:v8];
  uint64_t v7 = [v6 count];

  if (v7 || [v8 count]) {
    [(SBIcon *)self reloadIconImage];
  }
}

- (void)_adjustForIconsAdded:(id)a3 removed:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA80] setWithSet:v6];
  [v8 removeObject:self];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__SBFolderIcon__adjustForIconsAdded_removed___block_invoke;
  v21[3] = &unk_1E6AADA50;
  v21[4] = self;
  [v7 enumerateObjectsUsingBlock:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __45__SBFolderIcon__adjustForIconsAdded_removed___block_invoke_2;
  v20[3] = &unk_1E6AADA50;
  v20[4] = self;
  [v8 enumerateObjectsUsingBlock:v20];
  if (v6)
  {
    id v9 = [v6 setByAddingObjectsFromSet:v7];
  }
  else
  {
    id v9 = v7;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v15, "isApplicationIcon", (void)v16)
          && ([v15 hasApplicationPlaceholder] & 1) != 0)
        {

          [(SBFolderIcon *)self _updateProgress];
          goto LABEL_15;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

LABEL_15:
  [(SBFolderIcon *)self _updateBadgeValue];
}

- (void)_updateProgress
{
  v2 = self;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v3 = [(SBFolderIcon *)self folder];
  id v4 = [v3 leafIcons];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (!v5)
  {

    goto LABEL_24;
  }
  uint64_t v6 = v5;
  v26 = v2;
  unint64_t v7 = 0;
  int v27 = 0;
  uint64_t v28 = 0;
  uint64_t v8 = *(void *)v31;
  double v9 = 0.0;
  do
  {
    uint64_t v10 = 0;
    uint64_t v11 = sel_isFailed;
    do
    {
      if (*(void *)v31 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
      uint64_t v13 = [v12 progressState];
      if ([v12 isApplicationIcon])
      {
        v14 = [v12 applicationPlaceholder];
        if (objc_opt_respondsToSelector())
        {
          [v12 applicationPlaceholder];
          unint64_t v29 = v7;
          uint64_t v15 = v6;
          uint64_t v16 = v8;
          long long v17 = v11;
          v19 = long long v18 = v4;
          int v20 = [v19 isFailed];

          id v4 = v18;
          uint64_t v11 = v17;
          uint64_t v8 = v16;
          uint64_t v6 = v15;
          unint64_t v7 = v29;

          if (v20)
          {
            uint64_t v21 = SBLogCommon();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v22 = [v12 applicationPlaceholder];
              *(_DWORD *)buf = 136315394;
              v35 = "-[SBFolderIcon _updateProgress]";
              __int16 v36 = 2114;
              v37 = v22;
              _os_log_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_INFO, "%s: Assumed app with placeholder was installed: %{public}@", buf, 0x16u);
            }
            double v9 = v9 + 1.0;
            unint64_t v7 = v29 + 1;
            int v27 = 1;
            goto LABEL_17;
          }
        }
        else
        {
        }
      }
      if (v13 == 2)
      {
        [v12 progressPercent];
        double v9 = v9 + v24;
        ++v7;
        HIDWORD(v28) = 1;
      }
      else if (v13 == 1)
      {
        [v12 progressPercent];
        double v9 = v9 + v23;
        ++v7;
        LODWORD(v28) = 1;
      }
LABEL_17:
      ++v10;
    }
    while (v6 != v10);
    uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
  }
  while (v6);

  v2 = v26;
  if (((HIDWORD(v28) | v28 & v27) & 1) == 0)
  {
LABEL_24:
    v2->_progressState = 0;
    v2->_progressPercent = 0.0;
    [(SBFolderIcon *)v2 _updateBadgeValue];
    goto LABEL_25;
  }
  v26->_progressState = 2;
  double v25 = v9 / (double)v7;
  if (v25 > 1.0) {
    double v25 = 1.0;
  }
  v26->_progressPercent = v25;
LABEL_25:
  [(SBIcon *)v2 _notifyAccessoriesDidUpdate];
}

- (void)_performDelayedIconUpdates
{
  self->_delayedIconUpdates = 0;
  [(SBFolderIcon *)self invalidateUpdateIconRunLoopObserver];
  [(SBFolderIcon *)self _updateBadgeValue];
  [(SBFolderIcon *)self _updateProgress];
}

- (void)_updateBadgeValue
{
  id v4 = [(SBFolderIcon *)self folder];
  id v3 = [v4 badge];
  [(SBIcon *)self setBadge:v3];
}

- (void)invalidateUpdateIconRunLoopObserver
{
  updateIconRunLoopObserver = self->_updateIconRunLoopObserver;
  if (updateIconRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(updateIconRunLoopObserver);
    CFRelease(self->_updateIconRunLoopObserver);
    self->_updateIconRunLoopObserver = 0;
  }
}

- (SBFolderIcon)initWithFolder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBFolderIcon;
  uint64_t v6 = [(SBIcon *)&v21 init];
  unint64_t v7 = v6;
  if (v6)
  {
    p_folder = (id *)&v6->_folder;
    objc_storeStrong((id *)&v6->_folder, a3);
    [*p_folder addNodeObserver:v7];
    [*p_folder setIcon:v7];
    [*p_folder addFolderObserver:v7];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v9 = objc_msgSend(*p_folder, "allIcons", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v13++) addObserver:v7];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }

    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    nodeObservers = v7->_nodeObservers;
    v7->_nodeObservers = (NSHashTable *)v14;

    v7->_delayedIconUpdates = 1;
  }

  return v7;
}

- (SBFolderIcon)initWithFolderIcon:(id)a3 copyFolder:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 folder];
  unint64_t v7 = (void *)[v6 copy];
  uint64_t v8 = [(SBFolderIcon *)self initWithFolder:v7];
  double v9 = v8;
  if (v8)
  {
    v8->_progressState = *((void *)v5 + 9);
    v8->_progressPercent = *((double *)v5 + 10);
    if (!*((unsigned char *)v5 + 96))
    {
      uint64_t v10 = [v5 badgeNumberOrString];
      [(SBIcon *)v9 setBadge:v10];

      v9->_delayedIconUpdates = 0;
    }
  }

  return v9;
}

- (void)dealloc
{
  [(SBFolderIcon *)self invalidateUpdateIconRunLoopObserver];
  v3.receiver = self;
  v3.super_class = (Class)SBFolderIcon;
  [(SBFolderIcon *)&v3 dealloc];
}

- (id)rootFolder
{
  v2 = [(SBFolderIcon *)self folder];
  objc_super v3 = [v2 rootFolder];

  return v3;
}

- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3
{
  return 0;
}

- (id)genericIconImageWithInfo:(SBIconImageInfo *)a3
{
  return 0;
}

+ (BOOL)hasIconImage
{
  return 0;
}

- (void)localeChanged
{
  v3.receiver = self;
  v3.super_class = (Class)SBFolderIcon;
  [(SBIcon *)&v3 localeChanged];
  [(SBFolderIcon *)self _updateBadgeValue];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SBFolderIcon;
  id v4 = [(SBIcon *)&v8 description];
  id v5 = [(SBFolder *)self->_folder description];
  uint64_t v6 = [v3 stringWithFormat:@"%@ Folder: %@", v4, v5];

  return (NSString *)v6;
}

void __49__SBFolderIcon_scheduleUpdateIconRunLoopObserver__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performDelayedIconUpdates];
}

uint64_t __45__SBFolderIcon__adjustForIconsAdded_removed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObserver:*(void *)(a1 + 32)];
}

uint64_t __45__SBFolderIcon__adjustForIconsAdded_removed___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addObserver:*(void *)(a1 + 32)];
}

- (void)noteContainedIcon:(id)a3 replacedIcon:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v10 = a3;
  objc_super v8 = [v6 setWithObject:v10];
  double v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];

  [(SBFolderIcon *)self _adjustForIconsAdded:v8 removed:v9];
  [(SBFolderIcon *)self _containedIconImageChanged:v10];
}

- (void)badgeBehaviorProviderDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBFolderIcon *)self _updateBadgeValue];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(SBFolderIcon *)self folder];
  uint64_t v6 = [v5 allIcons];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 isFolderIcon]) {
          [v11 badgeBehaviorProviderDidChange:v4];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)leafIconsWithBadgesSortedByImportance
{
  objc_super v3 = [(SBFolderIcon *)self rootFolder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 effectiveBadgeBehaviorProvider];
    if (v4)
    {
      id v5 = [(SBFolderIcon *)self folder];
      if ([v5 isEmpty])
      {
        id v6 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke;
        v15[3] = &unk_1E6AB1900;
        id v16 = v4;
        id v8 = v7;
        id v17 = v8;
        [v5 enumerateAllIconsUsingBlock:v15];
        if ([v8 count])
        {
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke_3;
          v13[3] = &unk_1E6AB2BA8;
          id v14 = &__block_literal_global_55;
          uint64_t v9 = [MEMORY[0x1E4F1CBF0] indexesOfObjectsPassingTest:v13];
          [v8 removeObjectsAtIndexes:v9];

          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke_4;
          v11[3] = &unk_1E6AB2BD0;
          id v12 = &__block_literal_global_55;
          [v8 sortUsingComparator:v11];
        }
        id v6 = (id)[v8 copy];
      }
    }
    else
    {
      id v6 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

void __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "allowsBadgingForIcon:"))
  {
    if ([v4 isLeafIcon])
    {
      objc_super v3 = [v4 badgeNumberOrString];

      if (v3) {
        [*(id *)(a1 + 40) addObject:v4];
      }
    }
  }
}

uint64_t __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke_2(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  v2 = [a2 badgeNumberOrString];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v2 isEqualToString:@"!"])
      {
        uint64_t v3 = -1;
      }
      else
      {
        uint64_t v3 = [v2 integerValue];
        if (v3 >= 1)
        {
          [v2 rangeOfString:@"+"];
          if (v4) {
            ++v3;
          }
        }
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
  }

  return v3;
}

BOOL __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() < 1;
}

uint64_t __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7 >= v8)
  {
    if (v7 > v8)
    {
      uint64_t v9 = 1;
    }
    else
    {
      id v10 = [v5 displayName];
      uint64_t v11 = [v6 displayName];
      uint64_t v9 = [v10 localizedStandardCompare:v11];
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (BOOL)canBeAddedToMultiItemDrag
{
  return 0;
}

- (BOOL)canBeAddedToSubfolder
{
  return 0;
}

- (unint64_t)gridCellIndexForIconIndex:(unint64_t)a3
{
  return a3;
}

- (id)iconAtListIndex:(unint64_t)a3 iconIndex:(unint64_t)a4
{
  id v6 = [(SBFolderIcon *)self folder];
  unint64_t v7 = [v6 listAtIndex:a3];
  unint64_t v8 = [v7 iconAtIndex:a4];

  return v8;
}

- (BOOL)containsNodeIdentifier:(id)a3
{
  return [(SBFolder *)self->_folder containsNodeIdentifier:a3];
}

- (id)containedNodeIdentifiers
{
  return [(SBFolder *)self->_folder containedNodeIdentifiers];
}

- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4
{
  return [(SBFolder *)self->_folder nodesAlongIndexPath:a3 consumedIndexes:a4];
}

- (void)addNodeObserver:(id)a3
{
  id v4 = a3;
  if (!-[NSHashTable containsObject:](self->_nodeObservers, "containsObject:")) {
    [(NSHashTable *)self->_nodeObservers addObject:v4];
  }
}

- (void)removeNodeObserver:(id)a3
{
}

- (id)nodeDescriptionWithPrefix:(id)a3
{
  return [(SBFolder *)self->_folder nodeDescriptionWithPrefix:a3];
}

- (void)node:(id)a3 didAddContainedNodeIdentifiers:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_folder == a3)
  {
    unint64_t v7 = (void *)[(NSHashTable *)self->_nodeObservers copy];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "node:didAddContainedNodeIdentifiers:", self, v6, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_folder == a3)
  {
    unint64_t v7 = (void *)[(NSHashTable *)self->_nodeObservers copy];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "node:didRemoveContainedNodeIdentifiers:", self, v6, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)nodeDidMoveContainedNodes:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_folder == a3)
  {
    id v4 = (void *)[(NSHashTable *)self->_nodeObservers copy];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "nodeDidMoveContainedNodes:", self, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)folder:(id)a3 didAddList:(id)a4
{
  if (![a3 indexOfList:a4])
  {
    [(SBIcon *)self reloadIconImage];
  }
}

- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5
{
  if (objc_msgSend(a5, "containsIndex:", 0, a4))
  {
    [(SBIcon *)self reloadIconImage];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFolder:self->_folder];
  [v4 _setPropertiesFromIcon:self];
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_nodeObservers, 0);
}

@end