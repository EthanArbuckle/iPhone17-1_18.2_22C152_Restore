@interface TUIHostingController
- ($61A80719B04F7407D3E47539F1B23CAA)feedId;
- (BOOL)_shouldVendViewForIdentifier:(id)a3 inGroup:(id)a4;
- (BOOL)geometryUpdatedFlag;
- (BOOL)hasProviderForIdentifier:(id)a3;
- (BOOL)needsGeometryUpdateWithOldTraitCollection:(id)a3 newTraitCollection:(id)a4;
- (NSHashTable)contentObservers;
- (NSHashTable)controllerObservers;
- (NSMutableDictionary)geometryMap;
- (NSMutableDictionary)providerObserversMap;
- (NSMutableDictionary)reuseMap;
- (NSMutableDictionary)statesMap;
- (NSMutableSet)activeGroups;
- (NSSet)contentIdentifiers;
- (TUIHostingController)initWithFeedId:(id)a3 delegate:(id)a4 viewController:(id)a5 manager:(id)a6;
- (TUIHostingControllerDelegate)delegate;
- (TUIHostingMap)hostingMap;
- (TUIManager)manager;
- (UITraitCollection)traitCollection;
- (UIViewController)viewController;
- (id)_determineSourceViewFromState:(id)a3 currentView:(id)a4;
- (id)_groupIdentifierForIdentifier:(id)a3;
- (id)_propertiesForIdentifier:(id)a3;
- (id)_reusableViewForRefId:(id)a3 inCurrentView:(id)a4;
- (id)newGeometryMap;
- (id)viewStateForIdentifier:(id)a3;
- (unint64_t)_popoverArrowDirectionFromProperties:(id)a3;
- (void)_activateGroup:(id)a3;
- (void)_configurePopoverLayoutForViewState:(id)a3 superview:(id)a4 shouldPresentViewController:(BOOL)a5;
- (void)_finishOngoingModalTransitionAnimationsWithCompletion:(id)a3;
- (void)_notifyGeometryUpdated;
- (void)_notifyProviderObserversForIdentifier:(id)a3 notifyControllerObservers:(BOOL)a4;
- (void)_presentPopoverLayoutForViewState:(id)a3 superview:(id)a4;
- (void)_removeProviderForViewState:(id)a3;
- (void)_updateGeomtry:(id)a3 forIdentifier:(id)a4;
- (void)addContentObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)addProvider:(id)a3 forIdentifier:(id)a4;
- (void)addProviderObserver:(id)a3 forIdentifier:(id)a4;
- (void)beginViewUpdates;
- (void)didEndDisplayForViewState:(id)a3;
- (void)endViewUpdates;
- (void)endViewUpdatesNotifyDelegate:(BOOL)a3;
- (void)makeAvailableForReuse:(id)a3;
- (void)removeContentObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeProviderForIdentifier:(id)a3;
- (void)removeProviderObserver:(id)a3 forIdentifier:(id)a4;
- (void)reset;
- (void)resetGeometryUpdatedFlag;
- (void)runAppearanceAnimationIfNeededForViewState:(id)a3;
- (void)runAppearanceTransitionForViewState:(id)a3 barButtonItem:(id)a4;
- (void)runAppearanceTransitionForViewState:(id)a3 superview:(id)a4;
- (void)runDisappearanceTransitionForViewState:(id)a3;
- (void)updateFrameIfNeeded:(BOOL)a3 forViewState:(id)a4 requestedSize:(CGSize)a5 insets:(UIEdgeInsets)a6;
- (void)updateGeometryForViewState:(id)a3 requestedSize:(CGSize)a4 insets:(UIEdgeInsets)a5;
- (void)updateHostingMap:(id)a3;
- (void)updatePopoverLayoutForViewState:(id)a3 superview:(id)a4;
- (void)updateTraitCollection:(id)a3;
- (void)updateVisible:(BOOL)a3 forIdentifier:(id)a4;
@end

@implementation TUIHostingController

- (TUIHostingController)initWithFeedId:(id)a3 delegate:(id)a4 viewController:(id)a5 manager:(id)a6
{
  id v10 = a4;
  v11 = (UIViewController *)a5;
  id v12 = a6;
  v30.receiver = self;
  v30.super_class = (Class)TUIHostingController;
  v13 = [(TUIHostingController *)&v30 init];
  v14 = v13;
  if (v13)
  {
    v13->_feedId.uniqueIdentifier = a3.var0;
    objc_storeWeak((id *)&v13->_delegate, v10);
    v14->_viewController = v11;
    uint64_t v15 = [(UIViewController *)v11 traitCollection];
    traitCollection = v14->_traitCollection;
    v14->_traitCollection = (UITraitCollection *)v15;

    uint64_t v17 = objc_opt_new();
    statesMap = v14->_statesMap;
    v14->_statesMap = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    geometryMap = v14->_geometryMap;
    v14->_geometryMap = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_new();
    providerObserversMap = v14->_providerObserversMap;
    v14->_providerObserversMap = (NSMutableDictionary *)v21;

    uint64_t v23 = +[NSHashTable hashTableWithOptions:517];
    contentObservers = v14->_contentObservers;
    v14->_contentObservers = (NSHashTable *)v23;

    uint64_t v25 = objc_opt_new();
    activeGroups = v14->_activeGroups;
    v14->_activeGroups = (NSMutableSet *)v25;

    uint64_t v27 = +[NSHashTable hashTableWithOptions:517];
    controllerObservers = v14->_controllerObservers;
    v14->_controllerObservers = (NSHashTable *)v27;

    objc_storeStrong((id *)&v14->_manager, a6);
    *(unsigned char *)&v14->_flags = 0;
  }

  return v14;
}

- (void)addProvider:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->_statesMap objectForKeyedSubscript:v7];

  if (v8) {
    [(TUIHostingController *)self removeProviderForIdentifier:v7];
  }
  v9 = TUIHostingLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    int v12 = 134218498;
    unint64_t v13 = uniqueIdentifier;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&def_141F14, v9, OS_LOG_TYPE_DEFAULT, "[fid:%lu] adding provider=%@ for identifier=%@", (uint8_t *)&v12, 0x20u);
  }

  v11 = [[_TUIHostedViewState alloc] initWithController:self provider:v6 identifier:v7];
  [(NSMutableDictionary *)self->_statesMap setObject:v11 forKeyedSubscript:v7];
  [(TUIHostingController *)self _notifyProviderObserversForIdentifier:v7 notifyControllerObservers:1];
}

- (BOOL)hasProviderForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_statesMap objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_removeProviderForViewState:(id)a3
{
  id v9 = a3;
  statesMap = self->_statesMap;
  v5 = [v9 identifier];
  id v6 = [(NSMutableDictionary *)statesMap objectForKeyedSubscript:v5];

  id v7 = v9;
  if (v6 == v9)
  {
    v8 = [v9 identifier];
    [(TUIHostingController *)self removeProviderForIdentifier:v8];

    id v7 = v9;
  }
}

- (void)removeProviderForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = TUIHostingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    unint64_t v20 = uniqueIdentifier;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&def_141F14, v5, OS_LOG_TYPE_DEFAULT, "[fid:%lu] remove provider for identifier=%@", buf, 0x16u);
  }

  [(NSMutableDictionary *)self->_statesMap setObject:0 forKeyedSubscript:v4];
  [(TUIHostingController *)self _updateGeomtry:0 forIdentifier:v4];
  [(TUIHostingController *)self _notifyProviderObserversForIdentifier:v4 notifyControllerObservers:1];
  id v7 = [(TUIHostingMap *)self->_hostingMap objectForKeyedSubscript:v4];
  v8 = [v7 groupIdentifier];

  if (v8)
  {
    [(NSMutableSet *)self->_activeGroups removeObject:v8];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = -[TUIHostingMap reverseEnumeratorForGroup:](self->_hostingMap, "reverseEnumeratorForGroup:", v8, 0);
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        unint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [(TUIHostingController *)self _notifyProviderObserversForIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) notifyControllerObservers:0];
          unint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (NSSet)contentIdentifiers
{
  return [(TUIHostingMap *)self->_hostingMap identifiers];
}

- (void)updateHostingMap:(id)a3
{
  v5 = (TUIHostingMap *)a3;
  id v6 = v5;
  p_hostingMap = &self->_hostingMap;
  if (self->_hostingMap != v5)
  {
    v8 = [(TUIHostingMap *)v5 identifiers];
    id v9 = [v8 mutableCopy];
    id v10 = [(TUIHostingMap *)*p_hostingMap identifiers];
    [v9 intersectSet:v10];

    id v11 = [v8 mutableCopy];
    uint64_t v12 = [(TUIHostingMap *)*p_hostingMap identifiers];
    [v11 unionSet:v12];

    v28 = v9;
    [v11 minusSet:v9];
    unint64_t v13 = [(TUIHostingMap *)*p_hostingMap identifiers];
    id v14 = [v13 mutableCopy];

    [v14 minusSet:v8];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v33 objects:v44 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          [(NSMutableDictionary *)self->_geometryMap removeObjectForKey:*(void *)(*((void *)&v33 + 1) + 8 * (void)v19)];
          uint64_t v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v33 objects:v44 count:16];
      }
      while (v17);
    }

    objc_storeStrong((id *)&self->_hostingMap, a3);
    if ([v11 count])
    {
      unint64_t v20 = TUIHostingLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
        uint64_t v27 = [(TUIHostingMap *)self->_hostingMap identifiers];
        *(_DWORD *)buf = 134218498;
        unint64_t v39 = uniqueIdentifier;
        __int16 v40 = 2112;
        v41 = v27;
        __int16 v42 = 2112;
        id v43 = v11;
        _os_log_debug_impl(&def_141F14, v20, OS_LOG_TYPE_DEBUG, "[fid:%lu] updated hosting map: identifiers=%@, differences=%@", buf, 0x20u);
      }
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    __int16 v21 = self->_contentObservers;
    id v22 = [(NSHashTable *)v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * (void)v25) hostingController:self didChangeContentIdentifiers:v11];
          uint64_t v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        id v23 = [(NSHashTable *)v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v23);
    }
  }
}

- (void)beginViewUpdates
{
}

- (void)endViewUpdates
{
}

- (void)endViewUpdatesNotifyDelegate:(BOOL)a3
{
  unint64_t viewUpdates = self->_viewUpdates;
  if (viewUpdates)
  {
    unint64_t v5 = viewUpdates - 1;
    self->_unint64_t viewUpdates = v5;
    if (!v5)
    {
      uint64_t flags = (uint64_t)self->_flags;
      if ((*(unsigned char *)&self->_flags & 2) != 0)
      {
        *(unsigned char *)&self->_uint64_t flags = flags & 0xFD;
        if ((flags & 1) == 0)
        {
          BOOL v7 = a3;
          v8 = TUIHostingLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            sub_1921CC();
          }

          *(unsigned char *)&self->_flags |= 1u;
          if (v7)
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            [WeakRetained hostingControllerGeometryUpdated:self];
          }
        }
      }
    }
  }
}

- (void)reset
{
  [(NSMutableDictionary *)self->_geometryMap removeAllObjects];
  v3 = [(TUIHostingMap *)self->_hostingMap identifiers];
  hostingMap = self->_hostingMap;
  self->_hostingMap = 0;

  if ([v3 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unint64_t v5 = self->_contentObservers;
    id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) hostingController:didChangeContentIdentifiers:self v3 v10];
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  *(unsigned char *)&self->_flags &= 0xFCu;
  [(TUIHostingController *)self _notifyGeometryUpdated];
}

- (BOOL)_shouldVendViewForIdentifier:(id)a3 inGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableSet *)self->_activeGroups containsObject:v7])
  {
    BOOL v8 = 0;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = -[TUIHostingMap reverseEnumeratorForGroup:](self->_hostingMap, "reverseEnumeratorForGroup:", v7, 0);
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v17 + 1) + 8 * v13);
        if (v14 == v6
          || ([v6 isEqual:*(void *)(*((void *)&v17 + 1) + 8 * v13)] & 1) != 0)
        {
          break;
        }
        id v15 = [(NSMutableDictionary *)self->_statesMap objectForKeyedSubscript:v14];

        if (v15)
        {
          BOOL v8 = 0;
          goto LABEL_16;
        }
        if (v11 == (id)++v13)
        {
          id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
          BOOL v8 = 1;
          if (v11) {
            goto LABEL_5;
          }
          goto LABEL_16;
        }
      }
    }
    BOOL v8 = 1;
LABEL_16:
  }
  return v8;
}

- (id)viewStateForIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUIManager *)self->_manager viewRegistry];
  id v6 = [v4 type];
  unsigned int v7 = [v5 useHostedViewFactoryForType:v6];

  if (v7)
  {
    BOOL v8 = [v4 identifierWithoutModelIdentifier];
    id v9 = [(NSMutableDictionary *)self->_reuseMap objectForKeyedSubscript:v8];
    if (v9)
    {
      [(NSMutableDictionary *)self->_reuseMap removeObjectForKey:v8];
      id v10 = v9;
    }
    else
    {
      id v11 = [(TUIManager *)self->_manager viewRegistry];
      uint64_t v12 = [v4 type];
      uint64_t v13 = [v11 hostedViewFactoryForType:v12];

      viewController = self->_viewController;
      id v15 = [v4 type];
      id v16 = [v4 identifier];
      long long v17 = [v4 parameters];
      long long v18 = [v13 viewController:viewController hostedViewWithType:v15 identifier:v16 parameters:v17];

      if (v18) {
        id v10 = -[_TUIHostedFactoryViewState initWithIdentifier:view:flags:]([_TUIHostedFactoryViewState alloc], "initWithIdentifier:view:flags:", v4, v18, [v13 hostedViewFlags]);
      }
      else {
        id v10 = 0;
      }
    }
  }
  else
  {
    if (v4)
    {
      BOOL v8 = [(NSMutableDictionary *)self->_statesMap objectForKeyedSubscript:v4];
    }
    else
    {
      BOOL v8 = 0;
    }
    if ([(_TUIHostedFactoryViewState *)v8 isAvailable])
    {
      BOOL v8 = v8;
      id v10 = v8;
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

- (void)updateVisible:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    unint64_t v5 = [(NSMutableDictionary *)self->_statesMap objectForKeyedSubscript:a4];
  }
  else
  {
    unint64_t v5 = 0;
  }
  id v6 = v5;
  [v5 setVisible:v4];
}

- (void)updateGeometryForViewState:(id)a3 requestedSize:(CGSize)a4 insets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double height = a4.height;
  double width = a4.width;
  id v22 = a3;
  uint64_t v12 = [v22 identifier];
  uint64_t v13 = [(TUIHostingMap *)self->_hostingMap objectForKeyedSubscript:v12];
  if (![v13 presentation])
  {
    id v14 = [v22 view];
    double v15 = UIEdgeInsetsZero.left;
    double v20 = UIEdgeInsetsZero.right;
    double v21 = UIEdgeInsetsZero.bottom;
    [v14 bounds];
    long long v18 = -[TUIHostingGeometry initWithRequestedSize:layoutSize:erasableInsets:]([TUIHostingGeometry alloc], "initWithRequestedSize:layoutSize:erasableInsets:", width, height, left + right + v16, top + bottom + v17, UIEdgeInsetsZero.top, v15, v21, v20);
    long long v19 = [(NSMutableDictionary *)self->_geometryMap objectForKeyedSubscript:v12];
    if (([v19 isEqualToGeometry:v18] & 1) == 0) {
      [(TUIHostingController *)self _updateGeomtry:v18 forIdentifier:v12];
    }
  }
}

- (void)_updateGeomtry:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = TUIHostingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    int v10 = 134218498;
    unint64_t v11 = uniqueIdentifier;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_debug_impl(&def_141F14, v8, OS_LOG_TYPE_DEBUG, "[fid:%lu] updated geometry=%@ for identifier=%@", (uint8_t *)&v10, 0x20u);
  }

  [(NSMutableDictionary *)self->_geometryMap setObject:v6 forKeyedSubscript:v7];
  [(TUIHostingController *)self _notifyGeometryUpdated];
}

- (void)_notifyGeometryUpdated
{
  if (self->_viewUpdates)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      v3 = TUIHostingLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        sub_19229C();
      }

      *(unsigned char *)&self->_flags |= 2u;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    BOOL v4 = TUIHostingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_192234();
    }

    *(unsigned char *)&self->_flags |= 1u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained hostingControllerGeometryUpdated:self];
  }
}

- (BOOL)needsGeometryUpdateWithOldTraitCollection:(id)a3 newTraitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 preferredContentSizeCategory];
  BOOL v8 = [v6 preferredContentSizeCategory];
  if (v7 != v8
    || (id v9 = [v5 horizontalSizeClass], v9 != objc_msgSend(v6, "horizontalSizeClass"))
    || (id v10 = [v5 verticalSizeClass], v10 != objc_msgSend(v6, "verticalSizeClass"))
    || (id v11 = [v5 layoutDirection], v11 != objc_msgSend(v6, "layoutDirection")))
  {

    goto LABEL_8;
  }
  id v12 = [v5 legibilityWeight];
  id v13 = [v6 legibilityWeight];

  if (v12 != v13)
  {
LABEL_8:
    BOOL v14 = 1;
    goto LABEL_9;
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (void)updateTraitCollection:(id)a3
{
  id v6 = a3;
  unsigned int v5 = -[TUIHostingController needsGeometryUpdateWithOldTraitCollection:newTraitCollection:](self, "needsGeometryUpdateWithOldTraitCollection:newTraitCollection:", self->_traitCollection);
  objc_storeStrong((id *)&self->_traitCollection, a3);
  if (v5)
  {
    [(NSMutableDictionary *)self->_geometryMap removeAllObjects];
    [(TUIHostingController *)self _notifyGeometryUpdated];
  }
}

- (id)newGeometryMap
{
  if ([(NSMutableDictionary *)self->_geometryMap count])
  {
    v3 = [TUIHostingGeometryMap alloc];
    geometryMap = self->_geometryMap;
    unsigned int v5 = [(TUIHostingMap *)self->_hostingMap identifiers];
    id v6 = [(TUIHostingGeometryMap *)v3 initWithMap:geometryMap identifiers:v5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = TUIHostingLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_192304();
  }

  return v6;
}

- (void)resetGeometryUpdatedFlag
{
  *(unsigned char *)&self->_flags &= ~1u;
}

- (BOOL)geometryUpdatedFlag
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)addProviderObserver:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = TUIHostingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    int v11 = 134218498;
    unint64_t v12 = uniqueIdentifier;
    __int16 v13 = 2048;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&def_141F14, v8, OS_LOG_TYPE_DEFAULT, "[fid:%lu] add observer=%p for identifier=%@", (uint8_t *)&v11, 0x20u);
  }

  id v10 = [(NSMutableDictionary *)self->_providerObserversMap objectForKeyedSubscript:v7];
  if (!v10)
  {
    id v10 = +[NSHashTable hashTableWithOptions:517];
    [(NSMutableDictionary *)self->_providerObserversMap setObject:v10 forKeyedSubscript:v7];
  }
  [v10 addObject:v6];
}

- (void)removeProviderObserver:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = TUIHostingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    int v11 = 134218498;
    unint64_t v12 = uniqueIdentifier;
    __int16 v13 = 2048;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&def_141F14, v8, OS_LOG_TYPE_DEFAULT, "[fid:%lu] remove observer=%p for identifier=%@", (uint8_t *)&v11, 0x20u);
  }

  id v10 = [(NSMutableDictionary *)self->_providerObserversMap objectForKeyedSubscript:v7];
  [v10 removeObject:v6];
  if (v10 && ![v10 count]) {
    [(NSMutableDictionary *)self->_providerObserversMap setObject:0 forKeyedSubscript:v7];
  }
}

- (void)_notifyProviderObserversForIdentifier:(id)a3 notifyControllerObservers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = TUIHostingLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    unint64_t v31 = uniqueIdentifier;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&def_141F14, v7, OS_LOG_TYPE_DEFAULT, "[fid:%lu] notify observers for identifier=%@", buf, 0x16u);
  }

  id v9 = [(NSMutableDictionary *)self->_providerObserversMap objectForKeyedSubscript:v6];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = [v9 allObjects];
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * (void)v14) hostingProviderUpdatedForIdentifier:v6];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  if (v4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    __int16 v15 = [(NSHashTable *)self->_controllerObservers allObjects];
    id v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        long long v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) hostingControllerProvidersUpdated:self];
          long long v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }
  }
}

- (void)updatePopoverLayoutForViewState:(id)a3 superview:(id)a4
{
}

- (void)_presentPopoverLayoutForViewState:(id)a3 superview:(id)a4
{
}

- (void)_configurePopoverLayoutForViewState:(id)a3 superview:(id)a4 shouldPresentViewController:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  hostingMap = self->_hostingMap;
  id v11 = [v8 identifier];
  id v12 = [(TUIHostingMap *)hostingMap objectForKeyedSubscript:v11];

  if ([v12 presentation] == (char *)&def_141F14 + 1)
  {
    uint64_t v13 = [v8 viewController];
    unsigned __int8 v14 = [v13 isBeingPresented];

    if ((v14 & 1) == 0)
    {
      __int16 v15 = [(TUIHostingController *)self _determineSourceViewFromState:v8 currentView:v9];
      id v16 = [v8 viewController];
      id v17 = [v16 popoverPresentationController];
      uint64_t v18 = [v17 sourceView];

      if (!v15 || v15 == v18)
      {
        long long v27 = TUIHostingLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
          *(_DWORD *)buf = 134218498;
          unint64_t v33 = uniqueIdentifier;
          __int16 v34 = 2112;
          long long v35 = v15;
          __int16 v36 = 2112;
          v37 = v18;
          _os_log_debug_impl(&def_141F14, v27, OS_LOG_TYPE_DEBUG, "[fid:%lu] no need to update layout sourceView=%@ oldSourceView=%@", buf, 0x20u);
        }
      }
      else
      {
        long long v19 = [v8 viewController];
        [v19 setModalPresentationStyle:7];

        long long v20 = [v8 viewController];
        long long v21 = [v20 popoverPresentationController];
        [v21 setDelegate:v8];

        long long v22 = [v8 viewController];
        long long v23 = [v22 popoverPresentationController];
        [v23 setSourceView:v15];

        unint64_t v24 = [(TUIHostingController *)self _popoverArrowDirectionFromProperties:v12];
        long long v25 = [v8 viewController];
        long long v26 = [v25 popoverPresentationController];
        [v26 setPermittedArrowDirections:v24];

        if (!v5)
        {
LABEL_10:

          goto LABEL_11;
        }
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_CB9A0;
        v29[3] = &unk_251828;
        long long v30 = v8;
        unint64_t v31 = self;
        [(TUIHostingController *)self _finishOngoingModalTransitionAnimationsWithCompletion:v29];
        long long v27 = v30;
      }

      goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)runAppearanceTransitionForViewState:(id)a3 superview:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  hostingMap = self->_hostingMap;
  id v9 = [v6 identifier];
  id v10 = [(TUIHostingMap *)hostingMap objectForKeyedSubscript:v9];

  if ([v10 presentation])
  {
    if ([v10 presentation] == (char *)&def_141F14 + 1) {
      [(TUIHostingController *)self _presentPopoverLayoutForViewState:v6 superview:v7];
    }
  }
  else
  {
    id v11 = [v6 view];
    [v11 setAutoresizingMask:0];
    id v12 = [v6 viewController];
    [v12 beginAppearanceTransition:1 animated:0];

    [v7 addSubview:v11];
    uint64_t v13 = [v6 viewController];
    [v13 endAppearanceTransition];

    if (([v6 previouslyAppeared] & 1) == 0)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_CBC9C;
      v14[3] = &unk_252320;
      v14[4] = self;
      id v15 = v6;
      id v16 = v11;
      +[UIView performWithoutAnimation:v14];
    }
  }
}

- (void)runAppearanceTransitionForViewState:(id)a3 barButtonItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  hostingMap = self->_hostingMap;
  id v9 = [v6 identifier];
  id v10 = [(TUIHostingMap *)hostingMap objectForKeyedSubscript:v9];

  if ([v10 presentation] == (char *)&def_141F14 + 1)
  {
    id v11 = [v6 viewController];
    unsigned __int8 v12 = [v11 isBeingPresented];

    if ((v12 & 1) == 0)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_CBE28;
      v13[3] = &unk_252678;
      id v14 = v6;
      id v15 = v7;
      id v16 = self;
      id v17 = v10;
      [(TUIHostingController *)self _finishOngoingModalTransitionAnimationsWithCompletion:v13];
    }
  }
}

- (id)_determineSourceViewFromState:(id)a3 currentView:(id)a4
{
  id v6 = a4;
  id v7 = [a3 identifier];
  id v8 = [(TUIHostingMap *)self->_hostingMap objectForKeyedSubscript:v7];
  id v9 = [v8 designatedIdentifier];
  if (v9)
  {
    uint64_t v10 = [(TUIHostingController *)self _reusableViewForRefId:v9 inCurrentView:v6];
    id v11 = (void *)v10;
    if (v10) {
      unsigned __int8 v12 = (void *)v10;
    }
    else {
      unsigned __int8 v12 = v6;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = v6;
  }

  return v13;
}

- (id)_reusableViewForRefId:(id)a3 inCurrentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = TUIProtocolCast(&OBJC_PROTOCOL___TUIReusableRenderView, v7);
  id v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  uint64_t v10 = [v8 layoutAttributes];
  id v11 = [v10 refId];
  unsigned int v12 = [v11 isEqualToString:v6];

  if (v12)
  {
    id v13 = v7;
    goto LABEL_15;
  }
  id v13 = [v9 descendentViewWithRefId:v6];
  if (!v13)
  {
LABEL_5:
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = [v7 subviews];
    id v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [(TUIHostingController *)self _reusableViewForRefId:v6 inCurrentView:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          if (v19)
          {
            id v13 = (id)v19;

            goto LABEL_15;
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v13 = 0;
  }
LABEL_15:

  return v13;
}

- (void)_finishOngoingModalTransitionAnimationsWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  if (v4)
  {
    BOOL v5 = [(UIViewController *)self->_viewController presentedViewController];
    if ((([v5 isBeingDismissed] & 1) != 0
       || [v5 isBeingPresented])
      && ([v5 transitionCoordinator],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      id v7 = [v5 transitionCoordinator];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_CC3E8;
      v8[3] = &unk_254FC8;
      id v9 = v4;
      [v7 animateAlongsideTransition:&stru_254FA0 completion:v8];
    }
    else
    {
      v4[2](v4);
    }
  }
}

- (void)runAppearanceAnimationIfNeededForViewState:(id)a3
{
  id v4 = a3;
  hostingMap = self->_hostingMap;
  id v6 = [v4 identifier];
  id v7 = [(TUIHostingMap *)hostingMap objectForKeyedSubscript:v6];

  if (![v7 presentation])
  {
    id v8 = [v4 view];
    if (([v4 previouslyAppeared] & 1) == 0)
    {
      [v4 setPreviouslyAppeared:1];
      id v9 = TUIHostingLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
        unsigned int v12 = [v4 identifier];
        *(_DWORD *)buf = 134218498;
        unint64_t v18 = uniqueIdentifier;
        __int16 v19 = 2112;
        long long v20 = v12;
        __int16 v21 = 2048;
        long long v22 = v8;
        _os_log_debug_impl(&def_141F14, v9, OS_LOG_TYPE_DEBUG, "[fid:%lu] show view for identifier=%@ view=%p", buf, 0x20u);
      }
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_CC644;
      v15[3] = &unk_251990;
      id v10 = v8;
      id v16 = v10;
      +[UIView performWithoutAnimation:v15];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_CC6B4;
      v13[3] = &unk_251990;
      id v14 = v10;
      +[UIView animateWithDuration:32 delay:v13 usingSpringWithDamping:0 initialSpringVelocity:0.3 options:0.1 animations:0.7 completion:0.1];
    }
  }
}

- (void)runDisappearanceTransitionForViewState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 view];
  id v6 = [v4 viewController];

  if (v6)
  {
    id v7 = [v4 viewController];
    id v8 = [v7 parentViewController];

    if (v8)
    {
      unsigned int v9 = +[TUIFeedView areFeedUpdatesAnimated];
      id v10 = [v4 viewController];
      id v11 = v10;
      if (!v9)
      {
        [v10 beginAppearanceTransition:0 animated:0];

        [v4 recycleViewWithController:self];
        long long v23 = [v4 viewController];
        [v23 endAppearanceTransition];

        goto LABEL_12;
      }
      [v10 beginAppearanceTransition:0 animated:1];

      unsigned int v12 = TUIHostingLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
        long long v25 = [v4 identifier];
        *(_DWORD *)buf = 134218498;
        unint64_t v36 = uniqueIdentifier;
        __int16 v37 = 2112;
        v38 = v25;
        __int16 v39 = 2048;
        __int16 v40 = v5;
        _os_log_debug_impl(&def_141F14, v12, OS_LOG_TYPE_DEBUG, "[fid:%lu] removing view for identifier=%@ view=%p", buf, 0x20u);
      }
      id v13 = objc_alloc((Class)UIViewPropertyAnimator);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_CCB24;
      v33[3] = &unk_251990;
      id v14 = v5;
      id v34 = v14;
      id v15 = [v13 initWithDuration:v33 controlPoint1:0.2 controlPoint2:0.33 animations:0.0, 0.67, 1.0];
      id v16 = objc_alloc((Class)UIViewPropertyAnimator);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_CCB30;
      v31[3] = &unk_251990;
      id v17 = v14;
      id v32 = v17;
      id v18 = [v16 initWithDuration:v31 controlPoint1:0.28 controlPoint2:0.33 animations:0.0, 0.83, 0.76];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_CCB88;
      v28[3] = &unk_254FF0;
      id v29 = v17;
      id v30 = v4;
      [v18 addCompletion:v28];
      [v15 startAnimation];
      [v18 startAnimation];

      __int16 v19 = v34;
      goto LABEL_10;
    }
    long long v20 = [v4 viewController];
    __int16 v21 = [v20 presentingViewController];

    if (v21)
    {
      long long v22 = [v4 identifier];
      [(TUIHostingController *)self updateVisible:0 forIdentifier:v22];

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_CCBE0;
      v26[3] = &unk_251990;
      id v27 = v4;
      [(TUIHostingController *)self _finishOngoingModalTransitionAnimationsWithCompletion:v26];
      __int16 v19 = v27;
LABEL_10:
    }
  }
  else
  {
    [v4 recycleViewWithController:self];
  }
LABEL_12:
}

- (void)didEndDisplayForViewState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 viewController];
  [v5 beginAppearanceTransition:0 animated:0];

  [v4 recycleViewWithController:self];
  id v6 = [v4 viewController];

  [v6 endAppearanceTransition];
}

- (void)makeAvailableForReuse:(id)a3
{
  id v4 = a3;
  reuseMap = self->_reuseMap;
  if (!reuseMap)
  {
    id v6 = (NSMutableDictionary *)objc_opt_new();
    id v7 = self->_reuseMap;
    self->_reuseMap = v6;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_CCE00;
    v10[3] = &unk_251990;
    v10[4] = self;
    TUIDispatchAsyncViaRunLoop((uint64_t)v10);
    reuseMap = self->_reuseMap;
  }
  id v8 = [v4 identifier];
  unsigned int v9 = [v8 identifierWithoutModelIdentifier];
  [(NSMutableDictionary *)reuseMap setObject:v4 forKeyedSubscript:v9];
}

- (void)addContentObserver:(id)a3
{
}

- (void)removeContentObserver:(id)a3
{
}

- (id)_groupIdentifierForIdentifier:(id)a3
{
  v3 = [(TUIHostingMap *)self->_hostingMap objectForKeyedSubscript:a3];
  id v4 = [v3 groupIdentifier];

  return v4;
}

- (void)_activateGroup:(id)a3
{
}

- (id)_propertiesForIdentifier:(id)a3
{
  return [(TUIHostingMap *)self->_hostingMap objectForKeyedSubscript:a3];
}

- (void)updateFrameIfNeeded:(BOOL)a3 forViewState:(id)a4 requestedSize:(CGSize)a5 insets:(UIEdgeInsets)a6
{
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  double height = a5.height;
  double width = a5.width;
  BOOL v12 = a3;
  id v14 = a4;
  hostingMap = self->_hostingMap;
  id v16 = [v14 identifier];
  id v17 = [(TUIHostingMap *)hostingMap objectForKeyedSubscript:v16];
  id v18 = [v17 presentation];

  if (!v18)
  {
    __int16 v19 = [v14 view];
    long long v20 = TUIHostingLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
      __int16 v37 = [v14 identifier];
      v38 = +[NSNumber numberWithBool:v12];
      v53.double width = width;
      v53.double height = height;
      __int16 v39 = NSStringFromCGSize(v53);
      v56.double top = top;
      v56.double left = left;
      v56.double bottom = bottom;
      v56.double right = right;
      __int16 v40 = NSStringFromUIEdgeInsets(v56);
      int v41 = 134219266;
      unint64_t v42 = uniqueIdentifier;
      __int16 v43 = 2112;
      v44 = v19;
      __int16 v45 = 2112;
      v46 = v37;
      __int16 v47 = 2112;
      v48 = v38;
      __int16 v49 = 2112;
      v50 = v39;
      __int16 v51 = 2112;
      v52 = v40;
      _os_log_debug_impl(&def_141F14, v20, OS_LOG_TYPE_DEBUG, "[fid:%lu] updateFrameIfNeeded view=%@ identifier=%@ needsUpdate=%@ requestedSize=%@ insets=%@", (uint8_t *)&v41, 0x3Eu);
    }
    if (v12)
    {
      unsigned __int8 v21 = [v14 flags];
      double v22 = fmax(width - left - right, 0.0);
      double v23 = fmax(height - top - bottom, 0.0);
      if (v21) {
        double v24 = 1.79769313e308;
      }
      else {
        double v24 = v22;
      }
      if ((v21 & 2) != 0) {
        double v25 = 1.79769313e308;
      }
      else {
        double v25 = v23;
      }
      long long v26 = [v14 view];
      [v26 sizeThatFits:v24, v25];
      double v28 = v27;
      double v30 = v29;

      [v19 setFrame:left, top, v28, v30];
    }
    else
    {
      [v19 bounds];
      CGFloat x = v54.origin.x;
      CGFloat y = v54.origin.y;
      CGFloat v33 = v54.size.width;
      CGFloat v34 = v54.size.height;
      double v35 = left + CGRectGetMidX(v54);
      v55.origin.CGFloat x = x;
      v55.origin.CGFloat y = y;
      v55.size.double width = v33;
      v55.size.double height = v34;
      [v19 setCenter:CGPointMake(v35, top + CGRectGetMidY(v55))];
    }
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (unint64_t)_popoverArrowDirectionFromProperties:(id)a3
{
  v3 = (char *)[a3 arrowDirection];
  if ((unint64_t)(v3 - 1) > 3) {
    return 15;
  }
  else {
    return qword_2434A0[(void)(v3 - 1)];
  }
}

- (NSMutableDictionary)statesMap
{
  return self->_statesMap;
}

- (TUIHostingMap)hostingMap
{
  return self->_hostingMap;
}

- (NSMutableDictionary)geometryMap
{
  return self->_geometryMap;
}

- (NSMutableDictionary)providerObserversMap
{
  return self->_providerObserversMap;
}

- (NSHashTable)contentObservers
{
  return self->_contentObservers;
}

- (NSMutableSet)activeGroups
{
  return self->_activeGroups;
}

- (NSHashTable)controllerObservers
{
  return self->_controllerObservers;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (TUIManager)manager
{
  return self->_manager;
}

- (NSMutableDictionary)reuseMap
{
  return self->_reuseMap;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (TUIHostingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUIHostingControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reuseMap, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_controllerObservers, 0);
  objc_storeStrong((id *)&self->_activeGroups, 0);
  objc_storeStrong((id *)&self->_contentObservers, 0);
  objc_storeStrong((id *)&self->_providerObserversMap, 0);
  objc_storeStrong((id *)&self->_geometryMap, 0);
  objc_storeStrong((id *)&self->_hostingMap, 0);

  objc_storeStrong((id *)&self->_statesMap, 0);
}

@end