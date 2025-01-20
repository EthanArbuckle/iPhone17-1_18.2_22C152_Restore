@interface TUILayoutController
- ($61A80719B04F7407D3E47539F1B23CAA)feedId;
- (BOOL)applyHostingGeometryMapUpdate:(id)a3;
- (BOOL)invalidateInstantiation:(id)a3;
- (BOOL)reportErrors;
- (BOOL)shouldRootLayoutInheritHeightWhenAuto;
- (BOOL)shouldRootLayoutInheritWidthWhenAuto;
- (NSDictionary)embeddedIdentifierMaps;
- (NSDictionary)embeddedUUIDs;
- (NSDictionary)embeddedUpdateControllers;
- (NSMapTable)hostingLayouts;
- (NSMapTable)layouts;
- (NSMutableArray)errors;
- (NSString)uid;
- (NSUUID)UUID;
- (TUIFeedEntry)entry;
- (TUIHostingGeometryMap)hostingGeometryMap;
- (TUIIdentifierMap)identifierMap;
- (TUIInstantiateContext)instantiateContext;
- (TUILayout)rootLayout;
- (TUILayoutController)initWithPackage:(id)a3 feedId:(id)a4 manager:(id)a5 transactionCoordinator:(id)a6 state:(id)a7 identifierMap:(id)a8 entry:(id)a9 environment:(id)a10 instantiateDelegate:(id)a11 actionDelegate:(id)a12 queue:(id)a13 renderMode:(unint64_t)a14;
- (TUIManager)manager;
- (TUIPackage)package;
- (TUIRootBox)rootBox;
- (TUIStatsEventCollector)statsCollector;
- (TUITransactionCoordinating)transactionCoordinator;
- (_TUIHostingGeometryReuseMap)hostingGeometryReuseMap;
- (double)contentsScale;
- (id)_createLayoutForModel:(id)a3 withParent:(id)a4;
- (id)axModelTree;
- (id)debugDumpEnvironmentContainerStructure;
- (id)hostingGeometryForIdentifier:(id)a3 requestedSize:(CGSize)a4;
- (id)imageResourceForKind:(id)a3 naturalSize:(CGSize)a4 contentsScale:(double)a5 instance:(id)a6 options:(id)a7;
- (id)intrinsicImageResourceForKind:(id)a3 instance:(id)a4 options:(id)a5;
- (id)layoutForModel:(id)a3;
- (id)loadResourceWithURL:(id)a3 error:(id *)a4;
- (id)renderModelAuxiliary:(id)a3;
- (id)renderModelLayer:(id)a3;
- (id)renderModelOfKind:(unint64_t)a3 context:(id)a4;
- (id)renderModelOfKind:(unint64_t)a3 transactionGroup:(id)a4;
- (id)renderModelSection:(unint64_t)a3 offset:(CGPoint)a4 uuid:(id)a5 transactionGroup:(id)a6;
- (void)_invalidateChildrenForModel:(id)a3;
- (void)_invalidateLayout:(id)a3 callOnInvalidate:(BOOL)a4;
- (void)_orphanLayout:(id)a3;
- (void)_unorphanLayout:(id)a3;
- (void)_updateEmbedded;
- (void)_updateRootLayout;
- (void)_validateChildren;
- (void)_validateChildrenForLayout:(id)a3;
- (void)addError:(id)a3;
- (void)addErrors:(id)a3;
- (void)cachedRenderModelValidatedForLayout:(id)a3;
- (void)dealloc;
- (void)invalidateAuxiliaryRenderModel;
- (void)invalidateCachedRenderModelForLayout:(id)a3;
- (void)invalidateChildren:(id)a3;
- (void)invalidateLayout:(id)a3;
- (void)registerHostingLayout:(id)a3 forIdentifier:(id)a4;
- (void)resetInstantiationStats:(BOOL)a3;
- (void)setErrors:(id)a3;
- (void)setReportErrors:(BOOL)a3;
- (void)setRootBox:(id)a3;
- (void)setShouldRootLayoutInheritHeightWhenAuto:(BOOL)a3;
- (void)setShouldRootLayoutInheritWidthWhenAuto:(BOOL)a3;
- (void)setStatsCollector:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUid:(id)a3;
- (void)updateEnvironment:(id)a3;
- (void)validateGroupedContainingLayout:(id)a3 withSize:(CGSize)a4;
- (void)validateInstantiationWithTransactionGroup:(id)a3;
- (void)validateLayout:(id)a3;
- (void)validateLayouts;
- (void)validateRenderModelsWithTransactionGroup:(id)a3;
@end

@implementation TUILayoutController

- (TUIPackage)package
{
  return self->_package;
}

- (TUILayoutController)initWithPackage:(id)a3 feedId:(id)a4 manager:(id)a5 transactionCoordinator:(id)a6 state:(id)a7 identifierMap:(id)a8 entry:(id)a9 environment:(id)a10 instantiateDelegate:(id)a11 actionDelegate:(id)a12 queue:(id)a13 renderMode:(unint64_t)a14
{
  id v18 = a3;
  id v51 = a5;
  id v19 = a5;
  id v20 = a8;
  id v60 = v19;
  id v52 = a6;
  id v21 = a6;
  id v59 = a7;
  id v58 = a8;
  id v55 = a9;
  id v56 = a10;
  id v57 = a11;
  id v22 = a12;
  id v54 = a13;
  v61.receiver = self;
  v61.super_class = (Class)TUILayoutController;
  v23 = [(TUILayoutController *)&v61 init];
  p_isa = (id *)&v23->super.isa;
  v25 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_package, a3);
    v25->_feedId.uniqueIdentifier = a4.var0;
    objc_storeStrong(p_isa + 15, v20);
    objc_storeStrong(p_isa + 21, a9);
    objc_storeStrong(p_isa + 19, v51);
    objc_storeStrong(p_isa + 20, v52);
    if (v18)
    {
      v26 = [[TUIInstantiateContext alloc] initWithDelegate:v57 package:v18 manager:v60 identifierMap:v58 environment:v56 state:v59 feedId:v25->_feedId.uniqueIdentifier];
      p_instantiateContext = (id *)&v25->_instantiateContext;
      instantiateContext = v25->_instantiateContext;
      v25->_instantiateContext = v26;
    }
    else
    {
      p_instantiateContext = (id *)&v25->_instantiateContext;
      instantiateContext = v25->_instantiateContext;
      v25->_instantiateContext = 0;
    }

    [*p_instantiateContext setActionDelegate:v22];
    [*p_instantiateContext setTransactionCoordinator:v21];
    [(TUIInstantiateContext *)v25->_instantiateContext setDynamicController:v25];
    uint64_t v29 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:512];
    layouts = v25->_layouts;
    v25->_layouts = (NSMapTable *)v29;

    uint64_t v31 = +[NSHashTable hashTableWithOptions:512];
    orphanLayouts = v25->_orphanLayouts;
    v25->_orphanLayouts = (NSHashTable *)v31;

    uint64_t v33 = +[NSHashTable hashTableWithOptions:512];
    invalidChildren = v25->_invalidChildren;
    v25->_invalidChildren = (NSHashTable *)v33;

    uint64_t v35 = +[NSHashTable hashTableWithOptions:512];
    invalidRenderModels = v25->_invalidRenderModels;
    v25->_invalidRenderModels = (NSHashTable *)v35;

    uint64_t v37 = +[NSHashTable hashTableWithOptions:512];
    invalidLayouts = v25->_invalidLayouts;
    v25->_invalidLayouts = (NSHashTable *)v37;

    uint64_t v39 = +[NSHashTable hashTableWithOptions:512];
    invalidInstantiators = v25->_invalidInstantiators;
    v25->_invalidInstantiators = (NSHashTable *)v39;

    objc_storeStrong(p_isa + 8, a13);
    v25->_renderMode = a14;
    v41 = +[NSUserDefaults standardUserDefaults];
    v25->_reportErrors = [v41 BOOLForKey:@"TUIReportErrors"];

    if (v25->_reportErrors)
    {
      uint64_t v42 = objc_opt_new();
      errors = v25->_errors;
      v25->_errors = (NSMutableArray *)v42;
    }
    else
    {
      errors = v25->_errors;
      v25->_errors = 0;
    }

    uint64_t v44 = +[NSHashTable hashTableWithOptions:517];
    invalidEnvironmentContainers = v25->_invalidEnvironmentContainers;
    v25->_invalidEnvironmentContainers = (NSHashTable *)v44;

    uint64_t v46 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:517];
    hostingLayouts = v25->_hostingLayouts;
    v25->_hostingLayouts = (NSMapTable *)v46;
  }
  return v25;
}

- (void)dealloc
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSMapTable *)self->_layouts objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) teardown];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)TUILayoutController;
  [(TUILayoutController *)&v7 dealloc];
}

- (double)contentsScale
{
  v2 = [(TUIInstantiateContext *)self->_instantiateContext environment];
  [v2 contentsScale];
  double v4 = v3;

  return v4;
}

- (void)updateEnvironment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUIInstantiateContext *)self->_instantiateContext environment];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = (uint64_t)[v5 differenceMaskWithEnvironment:v4];
    if ((v7 & 0x10) == 0) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v7 = 61;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v8 = [(NSMapTable *)self->_layouts objectEnumerator];
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = [*(id *)(*((void *)&v23 + 1) + 8 * i) layout];
        [v12 invalidateColors];
      }
      id v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

LABEL_13:
  [(TUIInstantiateContext *)self->_instantiateContext setEnvironment:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v13 = [(TUIInstantiateContext *)self->_instantiateContext environmentContainersUsingGlobals];
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
        if (v17
          && ((unint64_t)[*(id *)(*((void *)&v19 + 1) + 8 * (void)j) globalsEnvironmentUseMask] & v7) != 0&& objc_msgSend(v17, "validateGlobalsWithContext:", self->_instantiateContext))
        {
          [(NSHashTable *)self->_invalidEnvironmentContainers addObject:v17];
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  rootBox = self->_rootBox;
  if (rootBox) {
    sub_E0AF4(self->_invalidEnvironmentContainers, rootBox, v7, self->_instantiateContext);
  }
}

- (BOOL)invalidateInstantiation:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v4)
  {
LABEL_7:
    BOOL v5 = 0;
    goto LABEL_8;
  }
  if (!sub_E0D50(v4, self->_rootBox))
  {
    v6 = TUIInstantiationLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_192510((uint64_t)self, (uint64_t)v4, v6);
    }

    goto LABEL_7;
  }
  [(NSHashTable *)self->_invalidInstantiators addObject:v4];
  BOOL v5 = 1;
LABEL_8:

  return v5;
}

- (void)_invalidateChildrenForModel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    while (1)
    {
      id v7 = v5;
      v6 = [(NSMapTable *)self->_layouts objectForKey:v5];
      if (v6) {
        break;
      }
      v6 = [v7 parentModel];

      id v5 = v6;
      if (!v6)
      {
        id v7 = 0;
        goto LABEL_8;
      }
    }
    [(TUILayoutController *)self invalidateChildren:v6];
  }
  else
  {
    id v7 = 0;
    v6 = 0;
  }
LABEL_8:
}

- (void)validateInstantiationWithTransactionGroup:(id)a3
{
  id v4 = a3;
  instantiateContext = self->_instantiateContext;
  if (instantiateContext)
  {
    uint64_t v6 = *((void *)[(TUIInstantiateContext *)instantiateContext _context] + 96);
    if (v6)
    {
      char v7 = 0;
      *(void *)(v6 + 27848) = mach_absolute_time();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  char v7 = 1;
LABEL_6:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v50 = v7;
  uint64_t v49 = v6;
  long long v8 = +[NSHashTable hashTableWithOptions:512];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v9 = self->_invalidEnvironmentContainers;
  id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v60 objects:v79 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v61;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v61 != v11) {
          objc_enumerationMutation(v9);
        }
        [v8 addObject:*(void *)(*((void *)&v60 + 1) + 8 * i)];
      }
      id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v60 objects:v79 count:16];
    }
    while (v10);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v13 = self->_invalidInstantiators;
  id v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v56 objects:v78 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v57;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v57 != v15) {
          objc_enumerationMutation(v13);
        }
        [v8 addObject:*(void *)(*((void *)&v56 + 1) + 8 * (void)j)];
      }
      id v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v56 objects:v78 count:16];
    }
    while (v14);
  }

  id v51 = v8;
  id v17 = [v51 count];
  if (v17)
  {
    v48 = [v51 allObjects];
    memset(v75, 0, sizeof(v75));
    int v76 = 1065353216;
    sub_3ED8((uint64_t)v75, (unint64_t)(float)(unint64_t)v17);
    unint64_t v47 = (unint64_t)v17;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v18 = v48;
    id v19 = [v18 countByEnumeratingWithState:&v71 objects:v81 count:16];
    if (v19)
    {
      uint64_t v20 = 0;
      uint64_t v21 = *(void *)v72;
      do
      {
        for (k = 0; k != v19; k = (char *)k + 1)
        {
          if (*(void *)v72 != v21) {
            objc_enumerationMutation(v18);
          }
          v70[0] = *(void *)(*((void *)&v71 + 1) + 8 * (void)k);
          v80[0] = v70;
          sub_E4C98((uint64_t)v75, v70, (uint64_t)&std::piecewise_construct, v80)[3] = (char *)k + v20;
        }
        id v19 = [v18 countByEnumeratingWithState:&v71 objects:v81 count:16];
        v20 += (uint64_t)k;
      }
      while (v19);
    }

    TUI::Graph::Ordering::Ordering((TUI::Graph::Ordering *)v70, v47);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v23 = v18;
    id v24 = [v23 countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (v24)
    {
      unint64_t v25 = 0;
      uint64_t v26 = *(void *)v67;
      do
      {
        for (m = 0; m != v24; m = (char *)m + 1)
        {
          if (*(void *)v67 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = (char *)objc_unsafeClaimAutoreleasedReturnValue(sub_E4BFC(*(void **)(*((void *)&v66 + 1)
                                                                                   + 8 * (void)m)));
          if (v28)
          {
            while (1)
            {
              v64 = v28;
              uint64_t v29 = sub_E4EF0(v75, &v64);
              if (v29) {
                break;
              }
              sub_E4BFC(v28);
              v28 = (char *)objc_claimAutoreleasedReturnValue();

              if (!v28) {
                goto LABEL_38;
              }
            }
            TUI::Graph::Ordering::addEdge(v70, v29[3], v25);
          }
LABEL_38:
          ++v25;
        }
        id v24 = [v23 countByEnumeratingWithState:&v66 objects:v80 count:16];
      }
      while (v24);
    }

    TUI::Graph::Ordering::solve((TUI::Graph::Ordering *)v70, &v64);
    id v30 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v47];
    v32 = v64;
    uint64_t v31 = v65;
    if (v64 != v65)
    {
      do
      {
        uint64_t v33 = [v23 objectAtIndexedSubscript:*(void *)v32];
        [v30 addObject:v33];

        v32 += 8;
      }
      while (v32 != v31);
      v32 = v64;
    }
    if (v32)
    {
      v65 = v32;
      operator delete(v32);
    }
    TUI::Graph::Ordering::~Ordering((TUI::Graph::Ordering *)v70);
    sub_1265C((uint64_t)v75);
  }
  else
  {
    id v30 = &__NSArray0__struct;
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v34 = v30;
  id v35 = [v34 countByEnumeratingWithState:&v52 objects:v77 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v53;
    do
    {
      for (n = 0; n != v35; n = (char *)n + 1)
      {
        if (*(void *)v53 != v36) {
          objc_enumerationMutation(v34);
        }
        v38 = *(void **)(*((void *)&v52 + 1) + 8 * (void)n);
        if (sub_E0D50(v38, self->_rootBox))
        {
          unsigned int v39 = [(NSHashTable *)self->_invalidEnvironmentContainers containsObject:v38];
          id v40 = v38;
          v41 = v40;
          if (v39 || [v40 needsValidationForTransactionGroup:v4])
          {
            uint64_t v42 = [(NSMapTable *)self->_layouts objectForKey:v41];
            v43 = [v41 validateInstantiationWithContext:self->_instantiateContext transactionGroup:v4 layout:v42];
            [(TUILayoutController *)self _invalidateChildrenForModel:v43];
          }
        }
      }
      id v35 = [v34 countByEnumeratingWithState:&v52 objects:v77 count:16];
    }
    while (v35);
  }

  [(NSHashTable *)self->_invalidEnvironmentContainers removeAllObjects];
  [(NSHashTable *)self->_invalidInstantiators removeAllObjects];
  sub_E1630(self->_rootBox, self->_instantiateContext);
  [(NSHashTable *)self->_invalidEnvironmentContainers removeAllObjects];
  if ((v50 & 1) == 0)
  {
    unint64_t v44 = *(void *)(v49 + 27848);
    uint64_t v45 = mach_absolute_time();
    uint64_t v46 = v45 - v44;
    if (v44 >= v45) {
      uint64_t v46 = v44 - v45;
    }
    *(void *)(v49 + 27816) += v46;
  }
}

- (id)debugDumpEnvironmentContainerStructure
{
  if (self->_rootBox)
  {
    v2 = -[TUIInstantiateContext debugDumpEnvironmentContainerStructure:](self->_instantiateContext, "debugDumpEnvironmentContainerStructure:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)layoutForModel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMapTable *)self->_layouts objectForKey:v4];
    if ([v5 isLayout]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setRootBox:(id)a3
{
  id v5 = (TUIRootBox *)a3;
  p_rootBox = &self->_rootBox;
  if (self->_rootBox != v5)
  {
    rootLayout = self->_rootLayout;
    self->_rootLayout = 0;

    cachedRenderModel = self->_cachedRenderModel;
    self->_cachedRenderModel = 0;

    cachedAuxRenderModel = self->_cachedAuxRenderModel;
    self->_cachedAuxRenderModel = 0;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = [(NSMapTable *)self->_layouts objectEnumerator];
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) teardown];
        }
        id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [(NSMapTable *)self->_layouts removeAllObjects];
    [(NSHashTable *)self->_invalidLayouts removeAllObjects];
    [(NSHashTable *)self->_orphanLayouts removeAllObjects];
    [(NSHashTable *)self->_invalidRenderModels removeAllObjects];
    [(NSHashTable *)self->_invalidInstantiators removeAllObjects];
    objc_storeStrong((id *)&self->_rootBox, a3);
    if (*p_rootBox)
    {
      id v14 = [(TUILayoutController *)self _createLayoutForModel:*p_rootBox withParent:0];
      uint64_t v15 = [(TUILayoutController *)self layoutForModel:self->_rootBox];
      v16 = self->_rootLayout;
      self->_rootLayout = v15;

      sub_E1630(self->_rootBox, self->_instantiateContext);
    }
  }
}

- (void)invalidateLayout:(id)a3
{
}

- (void)_invalidateLayout:(id)a3 callOnInvalidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6 && ([v6 layoutIsInvalid] & 1) == 0)
  {
    [v7 setLayoutIsInvalid:1];
    if (v4) {
      [v7 onInvalidate];
    }
    long long v8 = [v7 layoutAncestor];
    id v9 = v8;
    if (!v8 || ([v8 layoutIsInvalid] & 1) == 0) {
      [(NSHashTable *)self->_invalidLayouts addObject:v7];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v10 = [v7 children];
    id v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          [(NSHashTable *)self->_invalidLayouts removeObject:*(void *)(*((void *)&v14 + 1) + 8 * (void)v13)];
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)invalidateAuxiliaryRenderModel
{
  cachedAuxRenderModel = self->_cachedAuxRenderModel;
  self->_cachedAuxRenderModel = 0;
}

- (void)invalidateChildren:(id)a3
{
  id v5 = a3;
  if (([v5 invalidChildren] & 1) == 0)
  {
    [v5 setInvalidChildren:1];
    [(NSHashTable *)self->_invalidChildren addObject:v5];
    BOOL v4 = [v5 layout];
    [(TUILayoutController *)self invalidateLayout:v4];
  }
}

- (void)validateLayout:(id)a3
{
  id v9 = a3;
  if (![v9 layoutIsInvalid]) {
    goto LABEL_9;
  }
  instantiateContext = self->_instantiateContext;
  if (instantiateContext)
  {
    uint64_t v5 = *((void *)[(TUIInstantiateContext *)instantiateContext _context] + 96);
    if (v5)
    {
      id v6 = objc_opt_class();
      sub_E1E48(v5, v6);
      char v7 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  char v7 = 1;
LABEL_7:
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:11];
  [v9 _validateLayout];
  [v9 setLayoutIsInvalid:0];
  [(NSHashTable *)self->_invalidLayouts removeObject:v9];
  if ((v7 & 1) == 0) {
    sub_E1F10(v5);
  }
LABEL_9:
}

- (void)validateGroupedContainingLayout:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  [v7 computedNaturalSize];
  if (v9 != width || v8 != height) {
    [v7 invalidateLayout];
  }
  if ([v7 layoutIsInvalid])
  {
    [(TUIStatsEventCollector *)self->_statsCollector recordEvent:11];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_E2164;
    v13[3] = &unk_2553A0;
    id v12 = v7;
    id v14 = v12;
    double v15 = width;
    double v16 = height;
    [v12 _validateLayoutWithBlock:v13];

    [v12 setLayoutIsInvalid:0];
    [(NSHashTable *)self->_invalidLayouts removeObject:v12];
  }
}

- (void)validateLayouts
{
  instantiateContext = self->_instantiateContext;
  if (!instantiateContext)
  {
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  uint64_t v4 = *((void *)[(TUIInstantiateContext *)instantiateContext _context] + 96);
  if (!v4)
  {
LABEL_5:
    char v5 = 1;
    goto LABEL_6;
  }
  char v5 = 0;
  *(void *)(v4 + 27856) = mach_absolute_time();
LABEL_6:
  [(TUILayoutController *)self _validateChildren];
  [(TUILayoutController *)self _updateRootLayout];
  while ([(NSHashTable *)self->_invalidLayouts count])
  {
    id v7 = [(NSHashTable *)self->_invalidLayouts anyObject];
    double v8 = [v7 model];
    if (v8)
    {
      while (v8 != self->_rootBox)
      {
        uint64_t v9 = [(TUIBox *)v8 parentModel];

        double v8 = (TUIRootBox *)v9;
        if (!v9) {
          goto LABEL_11;
        }
      }
      [(TUILayoutController *)self validateLayout:v7];
    }
    else
    {
LABEL_11:
      double v8 = 0;
      [(NSHashTable *)self->_invalidLayouts removeObject:v7];
    }
  }
  if ((v5 & 1) == 0)
  {
    unint64_t v10 = *(void *)(v4 + 27856);
    uint64_t v11 = mach_absolute_time();
    uint64_t v12 = v11 - v10;
    if (v10 >= v11) {
      uint64_t v12 = v10 - v11;
    }
    *(void *)(v4 + 27824) += v12;
  }
}

- (void)_updateRootLayout
{
  double v3 = [(TUILayoutController *)self instantiateContext];
  uint64_t v4 = [v3 environment];

  if (v4)
  {
    char v5 = [(TUILayoutController *)self instantiateContext];
    id v6 = [v5 environment];
    [v6 viewSize];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v10 = NAN;
    double v8 = NAN;
  }
  uint64_t v11 = [(TUILayout *)self->_rootLayout box];
  id v12 = [v11 layoutDirection];

  if (!v12)
  {
    v13 = [(TUILayoutController *)self instantiateContext];
    id v14 = [v13 environment];
    -[TUILayout setSpecifiedLayoutDirection:](self->_rootLayout, "setSpecifiedLayoutDirection:", [v14 layoutDirection]);
  }
  [(TUILayout *)self->_rootLayout setContainingWidth:v8];
  rootLayout = self->_rootLayout;

  [(TUILayout *)rootLayout setContainingHeight:v10];
}

- (id)_createLayoutForModel:(id)a3 withParent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (objc_class *)[v6 layoutClass];
  if (v8)
  {
    id v9 = [[v8 alloc] initWithModel:v6 parent:v7 controller:self];
    [(NSMapTable *)self->_layouts setObject:v9 forKey:v6];
    if ([v9 isLayout]) {
      [(TUILayoutController *)self _invalidateLayout:v9 callOnInvalidate:0];
    }
    [(TUILayoutController *)self invalidateChildren:v9];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_validateChildren
{
  if ([(NSHashTable *)self->_invalidChildren count])
  {
    while ([(NSHashTable *)self->_invalidChildren count])
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      double v3 = [(NSHashTable *)self->_invalidChildren setRepresentation];
      id v4 = [v3 countByEnumeratingWithState:&v38 objects:v45 count:16];
      if (!v4)
      {

        break;
      }
      char v5 = 0;
      uint64_t v6 = *(void *)v39;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v39 != v6) {
            objc_enumerationMutation(v3);
          }
          double v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v9 = [v8 model];
          if (v9)
          {
            while (v9 != self->_rootBox)
            {
              uint64_t v10 = [(TUIBox *)v9 parentModel];

              id v9 = (TUIRootBox *)v10;
              if (!v10) {
                goto LABEL_11;
              }
            }
            [(TUILayoutController *)self _validateChildrenForLayout:v8];
            [(NSHashTable *)self->_invalidChildren removeObject:v8];
            char v5 = 1;
          }
          else
          {
LABEL_11:
            [(NSHashTable *)self->_invalidChildren removeObject:v8];
            layouts = self->_layouts;
            id v12 = [v8 model];
            [(NSMapTable *)layouts removeObjectForKey:v12];

            id v9 = 0;
          }
        }
        id v4 = [v3 countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v4);

      if ((v5 & 1) == 0) {
        break;
      }
    }
    if (self->_rootBox)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v13 = [(NSHashTable *)self->_orphanLayouts objectEnumerator];
      id v14 = [v13 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v35;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v13);
            }
            long long v17 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
            [v17 teardown];
            long long v18 = self->_layouts;
            long long v19 = [v17 model];
            [(NSMapTable *)v18 removeObjectForKey:v19];

            [(NSHashTable *)self->_invalidRenderModels removeObject:v17];
            [(NSHashTable *)self->_invalidLayouts removeObject:v17];
          }
          id v14 = [v13 countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v14);
      }
    }
    else
    {
      [(NSMapTable *)self->_layouts removeAllObjects];
      [(NSHashTable *)self->_invalidRenderModels removeAllObjects];
      [(NSHashTable *)self->_invalidLayouts removeAllObjects];
    }
    [(NSHashTable *)self->_orphanLayouts removeAllObjects];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v20 = [(NSMapTable *)self->_layouts keyEnumerator];
    uint64_t v21 = [v20 allObjects];

    id v22 = [v21 countByEnumeratingWithState:&v30 objects:v43 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v31;
      do
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v21);
          }
          unint64_t v25 = (TUIRootBox *)*(id *)(*((void *)&v30 + 1) + 8 * (void)k);
          uint64_t v26 = v25;
          if (v25)
          {
            v27 = v25;
            while (v27 != self->_rootBox)
            {
              uint64_t v28 = [(TUIBox *)v27 parentModel];

              v27 = (TUIRootBox *)v28;
              if (!v28) {
                goto LABEL_37;
              }
            }
          }
          else
          {
LABEL_37:
            v27 = [(NSMapTable *)self->_layouts objectForKey:v26];
            [(NSMapTable *)self->_layouts removeObjectForKey:v26];
            [(NSHashTable *)self->_invalidRenderModels removeObject:v27];
            [(NSHashTable *)self->_invalidLayouts removeObject:v27];
            [(NSHashTable *)self->_invalidChildren removeObject:v27];
          }
        }
        id v22 = [v21 countByEnumeratingWithState:&v30 objects:v43 count:16];
      }
      while (v22);
    }

    if ([(NSHashTable *)self->_invalidChildren count])
    {
      uint64_t v29 = TUILayoutLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_19259C(buf, self->_feedId.uniqueIdentifier, [(NSHashTable *)self->_invalidChildren count], v29);
      }

      TUIDebugHaltInDebugger();
      [(NSHashTable *)self->_invalidChildren removeAllObjects];
    }
  }
}

- (void)_validateChildrenForLayout:(id)a3
{
  id v4 = a3;
  long long v20 = [v4 model];
  long long v18 = objc_opt_new();
  [v20 appendLayoutChildrenToArray:v18];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v18;
  uint64_t v6 = 0;
  id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [(NSMapTable *)self->_layouts objectForKey:v10];
        id v12 = v11;
        if (v11)
        {
          [v11 updateParent:v4];
          if ([(NSHashTable *)self->_orphanLayouts containsObject:v12]) {
            [(TUILayoutController *)self _unorphanLayout:v12];
          }
        }
        else
        {
          id v12 = [(TUILayoutController *)self _createLayoutForModel:v10 withParent:v4];
          if (!v12) {
            goto LABEL_13;
          }
        }
        if (!v6) {
          uint64_t v6 = objc_opt_new();
        }
        [v6 addObject:v12];
LABEL_13:
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  long long v19 = [v4 containers];
  [v4 setContainers:v6];
  [v4 setInvalidChildren:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v19;
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * (void)j);
        if ([v6 indexOfObjectIdenticalTo:v17] == (id)0x7FFFFFFFFFFFFFFFLL) {
          [(TUILayoutController *)self _orphanLayout:v17];
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  [v4 onContainersUpdated];
}

- (void)_unorphanLayout:(id)a3
{
  id v4 = a3;
  [(NSHashTable *)self->_orphanLayouts removeObject:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = [v4 containers];
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [(TUILayoutController *)self _unorphanLayout:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_orphanLayout:(id)a3
{
  id v4 = a3;
  [(NSHashTable *)self->_orphanLayouts addObject:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = [v4 containers];
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [(TUILayoutController *)self _orphanLayout:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)renderModelSection:(unint64_t)a3 offset:(CGPoint)a4 uuid:(id)a5 transactionGroup:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a5;
  id v12 = a6;
  instantiateContext = self->_instantiateContext;
  if (instantiateContext)
  {
    uint64_t v14 = *((void *)[(TUIInstantiateContext *)instantiateContext _context] + 96);
    if (v14)
    {
      char v15 = 0;
      *(void *)(v14 + 27864) = mach_absolute_time();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  char v15 = 1;
LABEL_6:
  cachedRenderModel = self->_cachedRenderModel;
  if (!cachedRenderModel)
  {
    id v38 = v12;
    id v39 = v11;
    uint64_t v17 = [TUIRenderContext alloc];
    long long v18 = [(TUIIdentifierMap *)self->_identifierMap renderModelIdentifierMap];
    embeddedIdentifierMaps = self->_embeddedIdentifierMaps;
    embeddedUpdateControllers = self->_embeddedUpdateControllers;
    embeddedUUIDs = self->_embeddedUUIDs;
    long long v22 = [(TUIInstantiateContext *)self->_instantiateContext environment];
    long long v23 = [(TUIRenderContext *)v17 initWithIdentifierMap:v18 embeddedIdentifierMaps:embeddedIdentifierMaps embeddedUpdateControllerMap:embeddedUpdateControllers embeddedUUIDMap:embeddedUUIDs environment:v22 uid:self->_uid UUID:self->_UUID entry:self->_entry layoutQueue:self->_queue renderMode:self->_renderMode];

    id v12 = v38;
    id v11 = v39;
    [(TUIRenderContext *)v23 setManager:self->_manager];
    [(TUIRenderContext *)v23 setTransactionGroup:v38];
    long long v24 = [(TUILayoutController *)self renderModelOfKind:7 context:v23];
    long long v25 = self->_cachedRenderModel;
    self->_cachedRenderModel = v24;

    if ([(NSMutableArray *)self->_errors count])
    {
      long long v26 = [(TUIRenderModelSection *)self->_cachedRenderModel copyWithErrors:self->_errors];
      long long v27 = self->_cachedRenderModel;
      self->_cachedRenderModel = v26;
    }
    [(TUILayoutController *)self _updateEmbedded];

    cachedRenderModel = self->_cachedRenderModel;
  }
  long long v28 = -[TUIRenderModelSection copyWithSection:offset:uuid:](cachedRenderModel, "copyWithSection:offset:uuid:", a3, v11, x, y);
  uint64_t v29 = self->_cachedRenderModel;
  self->_cachedRenderModel = v28;

  long long v30 = [(TUIBox *)self->_rootBox animationGroups];
  long long v31 = v30;
  if (v30)
  {
    long long v32 = [v30 generateAllGroupRenderModelsFromSource:self->_cachedRenderModel];
    [(TUIRenderModelSection *)self->_cachedRenderModel setAnimationRenderModels:v32];
  }
  if ((v15 & 1) == 0)
  {
    unint64_t v33 = *(void *)(v14 + 27864);
    uint64_t v34 = mach_absolute_time();
    uint64_t v35 = v34 - v33;
    if (v33 >= v34) {
      uint64_t v35 = v33 - v34;
    }
    *(void *)(v14 + 27832) += v35;
  }
  long long v36 = self->_cachedRenderModel;

  return v36;
}

- (void)_updateEmbedded
{
  id v14 = (id)objc_opt_new();
  double v3 = objc_opt_new();
  id v4 = objc_opt_new();
  id v5 = [(TUILayoutController *)self rootBox];
  id v6 = [v5 contentModel];
  uint64_t v7 = [(TUILayoutController *)self layoutForModel:v6];

  [v7 appendEmbeddedIdentifierMaps:v14 updateControllers:v3 UUIDs:v4];
  uint64_t v8 = (NSDictionary *)[v14 copy];
  embeddedIdentifierMaps = self->_embeddedIdentifierMaps;
  self->_embeddedIdentifierMaps = v8;

  long long v10 = (NSDictionary *)[v3 copy];
  embeddedUpdateControllers = self->_embeddedUpdateControllers;
  self->_embeddedUpdateControllers = v10;

  id v12 = (NSDictionary *)[v4 copy];
  embeddedUUIDs = self->_embeddedUUIDs;
  self->_embeddedUUIDs = v12;
}

- (id)renderModelAuxiliary:(id)a3
{
  id v4 = a3;
  cachedAuxRenderModel = self->_cachedAuxRenderModel;
  if (!cachedAuxRenderModel)
  {
    id v6 = [TUIRenderContext alloc];
    uint64_t v7 = [(TUIIdentifierMap *)self->_identifierMap renderModelIdentifierMap];
    uint64_t v8 = [(TUIInstantiateContext *)self->_instantiateContext environment];
    long long v9 = [(TUIRenderContext *)v6 initWithIdentifierMap:v7 embeddedIdentifierMaps:0 embeddedUpdateControllerMap:0 embeddedUUIDMap:0 environment:v8 uid:self->_uid UUID:self->_UUID entry:self->_entry layoutQueue:self->_queue renderMode:self->_renderMode];

    [(TUIRenderContext *)v9 setManager:self->_manager];
    [(TUIRenderContext *)v9 setTransactionGroup:v4];
    long long v10 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = [(TUILayoutController *)self rootBox];
    id v12 = [v11 navBarModels];

    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v24;
      do
      {
        char v15 = 0;
        do
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v12);
          }
          double v16 = [(TUILayoutController *)self layoutForModel:*(void *)(*((void *)&v23 + 1) + 8 * (void)v15)];
          uint64_t v17 = [(TUIRenderContext *)v9 renderModelForLayout:v16 kind:5];
          if (v17) {
            [v10 addObject:v17];
          }

          char v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    long long v18 = [[TUIRenderModelAuxiliary alloc] initWithNavigationItems:v10];
    long long v20 = self->_cachedAuxRenderModel;
    p_cachedAuxRenderModel = &self->_cachedAuxRenderModel;
    *p_cachedAuxRenderModel = v18;

    cachedAuxRenderModel = *p_cachedAuxRenderModel;
  }
  long long v21 = cachedAuxRenderModel;

  return v21;
}

- (id)renderModelLayer:(id)a3
{
  id v4 = a3;
  cachedLayerRenderModel = self->_cachedLayerRenderModel;
  if (!cachedLayerRenderModel)
  {
    id v6 = [TUIRenderContext alloc];
    uint64_t v7 = [(TUIIdentifierMap *)self->_identifierMap renderModelIdentifierMap];
    uint64_t v8 = [(TUIInstantiateContext *)self->_instantiateContext environment];
    long long v9 = [(TUIRenderContext *)v6 initWithIdentifierMap:v7 embeddedIdentifierMaps:0 embeddedUpdateControllerMap:0 embeddedUUIDMap:0 environment:v8 uid:self->_uid UUID:self->_UUID entry:self->_entry layoutQueue:self->_queue renderMode:self->_renderMode];

    [(TUIRenderContext *)v9 setManager:self->_manager];
    [(TUIRenderContext *)v9 setTransactionGroup:v4];
    long long v10 = [(TUILayoutController *)self renderModelOfKind:3 context:v9];
    id v11 = self->_cachedLayerRenderModel;
    self->_cachedLayerRenderModel = v10;

    cachedLayerRenderModel = self->_cachedLayerRenderModel;
  }
  id v12 = cachedLayerRenderModel;

  return v12;
}

- (id)renderModelOfKind:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(TUILayoutController *)self rootBox];
  uint64_t v8 = [v7 contentModel];
  long long v9 = [(TUILayoutController *)self layoutForModel:v8];

  long long v10 = [v6 renderModelForLayout:v9 kind:a3];

  return v10;
}

- (id)renderModelOfKind:(unint64_t)a3 transactionGroup:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [TUIRenderContext alloc];
  uint64_t v8 = [(TUIIdentifierMap *)self->_identifierMap renderModelIdentifierMap];
  long long v9 = [(TUIInstantiateContext *)self->_instantiateContext environment];
  long long v10 = [(TUIRenderContext *)v7 initWithIdentifierMap:v8 embeddedIdentifierMaps:0 embeddedUpdateControllerMap:0 embeddedUUIDMap:0 environment:v9 uid:self->_uid UUID:self->_UUID entry:self->_entry layoutQueue:self->_queue renderMode:self->_renderMode];

  [(TUIRenderContext *)v10 setManager:self->_manager];
  [(TUIRenderContext *)v10 setTransactionGroup:v6];
  id v11 = [(TUILayoutController *)self renderModelOfKind:a3 context:v10];

  return v11;
}

- (id)loadResourceWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = sub_E3BB4;
  uint64_t v29 = sub_E3BC4;
  id v30 = 0;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_E3BB4;
  long long v23 = sub_E3BC4;
  id v24 = 0;
  uint64_t v7 = [(TUILayoutController *)self manager];
  uint64_t v8 = [v7 resourceLoader];

  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    long long v10 = [(TUILayoutController *)self manager];
    id v11 = [v10 resourceLoader];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_E3BCC;
    v15[3] = &unk_2553C8;
    uint64_t v17 = &v25;
    long long v18 = &v19;
    id v12 = v9;
    double v16 = v12;
    [v11 loadResourceWithURL:v6 completion:v15];

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v13 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v13;
}

- (void)invalidateCachedRenderModelForLayout:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    [(NSHashTable *)self->_invalidRenderModels addObject:v4];
  }
  else
  {
    cachedRenderModel = self->_cachedRenderModel;
    self->_cachedRenderModel = 0;

    cachedAuxRenderModel = self->_cachedAuxRenderModel;
    self->_cachedAuxRenderModel = 0;

    cachedLayerRenderModel = self->_cachedLayerRenderModel;
    self->_cachedLayerRenderModel = 0;
  }
}

- (void)cachedRenderModelValidatedForLayout:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(NSHashTable *)self->_invalidRenderModels removeObject:v4];
  }
}

- (void)validateRenderModelsWithTransactionGroup:(id)a3
{
  id v4 = a3;
  id v5 = [TUIRenderContext alloc];
  id v6 = [(TUIIdentifierMap *)self->_identifierMap renderModelIdentifierMap];
  embeddedIdentifierMaps = self->_embeddedIdentifierMaps;
  embeddedUpdateControllers = self->_embeddedUpdateControllers;
  embeddedUUIDs = self->_embeddedUUIDs;
  long long v10 = [(TUIInstantiateContext *)self->_instantiateContext environment];
  id v11 = [(TUIRenderContext *)v5 initWithIdentifierMap:v6 embeddedIdentifierMaps:embeddedIdentifierMaps embeddedUpdateControllerMap:embeddedUpdateControllers embeddedUUIDMap:embeddedUUIDs environment:v10 uid:self->_uid UUID:self->_UUID entry:self->_entry layoutQueue:self->_queue renderMode:self->_renderMode];

  [(TUIRenderContext *)v11 setManager:self->_manager];
  [(TUIRenderContext *)v11 setTransactionGroup:v4];
  id v12 = [(NSHashTable *)self->_invalidRenderModels allObjects];
  [(NSHashTable *)self->_invalidRenderModels removeAllObjects];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      double v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v16) validateRenderModelWithContext:v11 transactionGroup:v4];
        double v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (id)axModelTree
{
  double v3 = [(TUILayoutController *)self rootBox];
  id v4 = [v3 contentModel];
  id v5 = [(TUILayoutController *)self layoutForModel:v4];

  id v6 = [v5 axModelTreeWithCustomActionsCollector:0 scrollAncestorLayout:0 scrollAncestorTranslation:0 liveTransformAncestorLayout:CGPointZero.x CGPointZero.y];

  return v6;
}

- (void)addError:(id)a3
{
}

- (void)addErrors:(id)a3
{
}

- (id)imageResourceForKind:(id)a3 naturalSize:(CGSize)a4 contentsScale:(double)a5 instance:(id)a6 options:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  double v16 = [(TUIManager *)self->_manager resourceRegistry];
  long long v17 = [v16 imageProviderForKind:v13];

  long long v18 = [v17 imageResourceForNaturalSize:v14 contentsScale:v15 instance:width height:height options:a5];
  long long v19 = [(TUIInstantiateContext *)self->_instantiateContext capture];

  if (v19 && v18)
  {
    long long v20 = [(TUIInstantiateContext *)self->_instantiateContext capture];
    [v20 captureImageResource:v18 forKind:v13 naturalSize:v14 contentsScale:v15 instance:width height:height options:a5];
  }

  return v18;
}

- (id)intrinsicImageResourceForKind:(id)a3 instance:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(TUIManager *)self->_manager resourceRegistry];
  id v12 = [v11 imageProviderForKind:v8];

  id v13 = [v12 intrinsicImageResourceForInstance:v9 options:v10];
  id v14 = [(TUIInstantiateContext *)self->_instantiateContext capture];

  if (v14 && v13)
  {
    id v15 = [(TUIInstantiateContext *)self->_instantiateContext capture];
    [v15 captureIntrinsicImageResource:v13 forKind:v8 instance:v9 options:v10];
  }

  return v13;
}

- (void)resetInstantiationStats:(BOOL)a3
{
}

- (void)registerHostingLayout:(id)a3 forIdentifier:(id)a4
{
}

- (BOOL)applyHostingGeometryMapUpdate:(id)a3
{
  id v31 = a3;
  id v4 = [v31 to];
  hostingGeometryMap = self->_hostingGeometryMap;
  self->_hostingGeometryMap = v4;

  id v6 = [v31 toReuseMap];
  hostingGeometryReuseMap = self->_hostingGeometryReuseMap;
  self->_hostingGeometryReuseMap = v6;

  if ([(NSMapTable *)self->_hostingLayouts count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v8 = [v31 differences];
    id v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v9)
    {
      char v32 = 0;
      uint64_t v10 = *(void *)v38;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          id v13 = [(NSMapTable *)self->_hostingLayouts objectForKey:v12];
          id v14 = v13;
          if (v13)
          {
            id v15 = [v13 hostingGeometry];
            double v16 = [(TUIHostingGeometryMap *)self->_hostingGeometryMap geometryForIdentifier:v12];
            if (!v16)
            {
              long long v17 = self->_hostingGeometryReuseMap;
              [v14 hostingRequestedSize];
              double v16 = -[_TUIHostingGeometryReuseMap geometryForIdentifier:requestedSize:](v17, "geometryForIdentifier:requestedSize:", v12);
            }
            if (v15 != v16 && ([v15 isEqualToGeometry:v16] & 1) == 0)
            {
              [v14 invalidateLayout];
              char v32 = 1;
            }
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v9);
    }
    else
    {
      char v32 = 0;
    }

    char v18 = v32 & 1;
  }
  else
  {
    char v18 = 0;
  }
  if ([(NSMapTable *)self->_hostingLayouts count])
  {
    long long v19 = self->_hostingGeometryReuseMap;
    if (v19)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v20 = [(_TUIHostingGeometryReuseMap *)v19 reuseIdentifiers];
      id v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v34;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
            uint64_t v25 = [(NSMapTable *)self->_hostingLayouts objectForKey:v24];
            long long v26 = v25;
            if (v25)
            {
              uint64_t v27 = [v25 hostingGeometry];
              long long v28 = self->_hostingGeometryReuseMap;
              [v26 hostingRequestedSize];
              uint64_t v29 = -[_TUIHostingGeometryReuseMap geometryForIdentifier:requestedSize:](v28, "geometryForIdentifier:requestedSize:", v24);
              if (v27 != v29 && ([v27 isEqualToGeometry:v29] & 1) == 0)
              {
                [v26 invalidateLayout];
                char v18 = 1;
              }
            }
          }
          id v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v21);
      }
    }
  }

  return v18 & 1;
}

- (id)hostingGeometryForIdentifier:(id)a3 requestedSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if (v7 && (hostingGeometryMap = self->_hostingGeometryMap) != 0)
  {
    id v9 = [(TUIHostingGeometryMap *)hostingGeometryMap geometryForIdentifier:v7];
    if (v9)
    {
      uint64_t v10 = TUIHostingLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
        v29.double width = width;
        v29.double height = height;
        uint64_t v12 = NSStringFromCGSize(v29);
        int v20 = 134218754;
        unint64_t v21 = uniqueIdentifier;
        __int16 v22 = 2112;
        id v23 = v7;
        __int16 v24 = 2112;
        uint64_t v25 = v12;
        __int16 v26 = 2112;
        uint64_t v27 = v9;
        _os_log_debug_impl(&def_141F14, v10, OS_LOG_TYPE_DEBUG, "[fid:%lu] hostingGeometryForIdentifer:%@ requestedSize:%@ => %@", (uint8_t *)&v20, 0x2Au);
      }
    }
    else
    {
      id v13 = [(TUIManager *)self->_manager viewRegistry];
      uint64_t v10 = [v13 hostedViewFactoryTypesWithGeometryReuse];

      id v14 = [v7 type];
      unsigned int v15 = [v10 containsObject:v14];

      if (v15)
      {
        id v9 = -[_TUIHostingGeometryReuseMap geometryForIdentifier:requestedSize:](self->_hostingGeometryReuseMap, "geometryForIdentifier:requestedSize:", v7, width, height);
        if (v9)
        {
          double v16 = TUIHostingLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v18 = self->_feedId.uniqueIdentifier;
            v30.double width = width;
            v30.double height = height;
            long long v19 = NSStringFromCGSize(v30);
            int v20 = 134218754;
            unint64_t v21 = v18;
            __int16 v22 = 2112;
            id v23 = v7;
            __int16 v24 = 2112;
            uint64_t v25 = v19;
            __int16 v26 = 2112;
            uint64_t v27 = v9;
            _os_log_debug_impl(&def_141F14, v16, OS_LOG_TYPE_DEBUG, "[fid:%lu] hostingGeometryForIdentifer:%@ requestedSize:%@ => %@ (reused)", (uint8_t *)&v20, 0x2Au);
          }
        }
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (TUIIdentifierMap)identifierMap
{
  return self->_identifierMap;
}

- (TUIRootBox)rootBox
{
  return self->_rootBox;
}

- (TUILayout)rootLayout
{
  return self->_rootLayout;
}

- (TUIInstantiateContext)instantiateContext
{
  return self->_instantiateContext;
}

- (TUIManager)manager
{
  return self->_manager;
}

- (TUITransactionCoordinating)transactionCoordinator
{
  return self->_transactionCoordinator;
}

- (TUIFeedEntry)entry
{
  return self->_entry;
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (BOOL)shouldRootLayoutInheritWidthWhenAuto
{
  return self->_shouldRootLayoutInheritWidthWhenAuto;
}

- (void)setShouldRootLayoutInheritWidthWhenAuto:(BOOL)a3
{
  self->_shouldRootLayoutInheritWidthWhenAuto = a3;
}

- (BOOL)shouldRootLayoutInheritHeightWhenAuto
{
  return self->_shouldRootLayoutInheritHeightWhenAuto;
}

- (void)setShouldRootLayoutInheritHeightWhenAuto:(BOOL)a3
{
  self->_shouldRootLayoutInheritHeightWhenAuto = a3;
}

- (NSDictionary)embeddedIdentifierMaps
{
  return self->_embeddedIdentifierMaps;
}

- (NSDictionary)embeddedUpdateControllers
{
  return self->_embeddedUpdateControllers;
}

- (NSDictionary)embeddedUUIDs
{
  return self->_embeddedUUIDs;
}

- (NSMapTable)hostingLayouts
{
  return self->_hostingLayouts;
}

- (BOOL)reportErrors
{
  return self->_reportErrors;
}

- (void)setReportErrors:(BOOL)a3
{
  self->_reportErrors = a3;
}

- (_TUIHostingGeometryReuseMap)hostingGeometryReuseMap
{
  return self->_hostingGeometryReuseMap;
}

- (NSMapTable)layouts
{
  return self->_layouts;
}

- (TUIStatsEventCollector)statsCollector
{
  return self->_statsCollector;
}

- (void)setStatsCollector:(id)a3
{
}

- (TUIHostingGeometryMap)hostingGeometryMap
{
  return self->_hostingGeometryMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingGeometryMap, 0);
  objc_storeStrong((id *)&self->_statsCollector, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_hostingGeometryReuseMap, 0);
  objc_storeStrong((id *)&self->_hostingLayouts, 0);
  objc_storeStrong((id *)&self->_embeddedUUIDs, 0);
  objc_storeStrong((id *)&self->_embeddedUpdateControllers, 0);
  objc_storeStrong((id *)&self->_embeddedIdentifierMaps, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_transactionCoordinator, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_instantiateContext, 0);
  objc_storeStrong((id *)&self->_rootLayout, 0);
  objc_storeStrong((id *)&self->_rootBox, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_storeStrong((id *)&self->_cachedLayerRenderModel, 0);
  objc_storeStrong((id *)&self->_cachedAuxRenderModel, 0);
  objc_storeStrong((id *)&self->_cachedRenderModel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_invalidEnvironmentContainers, 0);
  objc_storeStrong((id *)&self->_invalidRenderModels, 0);
  objc_storeStrong((id *)&self->_invalidInstantiators, 0);
  objc_storeStrong((id *)&self->_invalidLayouts, 0);
  objc_storeStrong((id *)&self->_invalidChildren, 0);
  objc_storeStrong((id *)&self->_orphanLayouts, 0);

  objc_storeStrong((id *)&self->_package, 0);
}

@end