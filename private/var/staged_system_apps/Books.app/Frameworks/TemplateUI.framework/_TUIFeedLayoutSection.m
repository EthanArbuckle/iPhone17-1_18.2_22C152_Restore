@interface _TUIFeedLayoutSection
- (BOOL)environmentNeedsUpdate;
- (BOOL)lq_updateAuxiliaryLayoutWithTransactionGroup:(id)a3;
- (BOOL)lq_updateHostingGeometryMap:(id)a3;
- (BOOL)lq_updateLayerLayoutWithTransactionGroup:(id)a3;
- (BOOL)lq_updateLayoutWithTransactionGroup:(id)a3;
- (BOOL)needsInstantiation;
- (TUIBindings)bindings;
- (TUIFeedCaptureController)captureController;
- (TUIFeedEntry)entry;
- (TUIFeedLayoutController)feedLayoutController;
- (TUIInstantiateContextState)instantiateState;
- (TUILayoutController)layoutController;
- (TUIRenderModelAuxiliary)auxRenderModel;
- (TUIRenderModelLayer)layerRenderModel;
- (TUIRenderModelSection)renderModel;
- (TUIStatsEventCollector)eventCollector;
- (TUIStatsTimingCollector)timingCollector;
- (TUITemplate)template;
- (TUIWorkQueueContext)queueContext;
- (_TUIFeedLayoutSection)initWithFeedId:(id)a3 section:(unint64_t)a4 controller:(id)a5 entry:(id)a6;
- (id)UUID;
- (id)axModelTree;
- (id)loadingRenderModelWithSize:(CGSize)a3 center:(CGPoint)a4 environment:(id)a5;
- (unint64_t)section;
- (unint64_t)statsMode;
- (void)_instantiateTemplateWithTransactionGroup:(id)a3;
- (void)_setupController;
- (void)_teardownController;
- (void)debugDumpEnvironmentContainerStructure;
- (void)lq_appendAnchorsToSet:(id)a3;
- (void)lq_captureWithController:(id)a3;
- (void)lq_createEmptyRenderModelWithSize:(CGSize)a3;
- (void)lq_instantiateWithController:(id)a3 transactionGroup:(id)a4;
- (void)lq_loadOrUpdateEntry:(id)a3 data:(id)a4 controller:(id)a5 transactionGroup:(id)a6;
- (void)lq_updateEnvironment:(id)a3 withTransactionGroup:(id)a4;
- (void)resumeAndRebuildWithTransactionGroup:(id)a3;
- (void)setEnvironmentNeedsUpdate:(BOOL)a3;
- (void)setFeedLayoutController:(id)a3;
- (void)setStatsMode:(unint64_t)a3;
- (void)suspendAndTeardownWithTransactionGroup:(id)a3;
@end

@implementation _TUIFeedLayoutSection

- (_TUIFeedLayoutSection)initWithFeedId:(id)a3 section:(unint64_t)a4 controller:(id)a5 entry:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_TUIFeedLayoutSection;
  v12 = [(_TUIFeedLayoutSection *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_feedId.uniqueIdentifier = a3.var0;
    v12->_section = a4;
    uint64_t v14 = [v10 queueContext];
    queueContext = v13->_queueContext;
    v13->_queueContext = (TUIWorkQueueContext *)v14;

    objc_storeStrong((id *)&v13->_entry, a6);
    objc_storeWeak((id *)&v13->_feedLayoutController, v10);
    [(_TUIFeedLayoutSection *)v13 _setupController];
  }

  return v13;
}

- (void)_setupController
{
  p_feedLayoutController = &self->_feedLayoutController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedLayoutController);
  if (self->_template)
  {
    v22 = [TUILayoutController alloc];
    v4 = [(TUITemplate *)self->_template package];
    v21 = [WeakRetained manager];
    v5 = [WeakRetained transactionCoordinator];
    instantiateState = self->_instantiateState;
    v6 = [(TUIFeedEntry *)self->_entry identifierMap];
    entry = self->_entry;
    v8 = [WeakRetained environment];
    v9 = [WeakRetained actionHandlerDelegate];
    id v10 = [WeakRetained queueContext];
    id v11 = [v10 workQueue];
    id v12 = objc_loadWeakRetained((id *)p_feedLayoutController);
    v13 = -[TUILayoutController initWithPackage:feedId:manager:transactionCoordinator:state:identifierMap:entry:environment:instantiateDelegate:actionDelegate:queue:renderMode:](v22, "initWithPackage:feedId:manager:transactionCoordinator:state:identifierMap:entry:environment:instantiateDelegate:actionDelegate:queue:renderMode:", v4, self->_feedId.uniqueIdentifier, v21, v5, instantiateState, v6, entry, v8, WeakRetained, v9, v11, [v12 renderModelMode]);
    layoutController = self->_layoutController;
    self->_layoutController = v13;

    v15 = [(TUIFeedEntry *)self->_entry uid];
    [(TUILayoutController *)self->_layoutController setUid:v15];

    v16 = [(TUIFeedEntry *)self->_entry uuid];
    [(TUILayoutController *)self->_layoutController setUUID:v16];

    [(TUILayoutController *)self->_layoutController setStatsCollector:self->_eventCollector];
    eventCollector = self->_eventCollector;
    v18 = [(TUILayoutController *)self->_layoutController instantiateContext];
    [v18 setStatsCollector:eventCollector];
  }
  v19 = self->_instantiateState;
  self->_instantiateState = 0;
}

- (void)_teardownController
{
  v3 = [(TUILayoutController *)self->_layoutController instantiateContext];
  v4 = [v3 saveState];
  instantiateState = self->_instantiateState;
  self->_instantiateState = v4;

  layoutController = self->_layoutController;
  self->_layoutController = 0;
}

- (void)suspendAndTeardownWithTransactionGroup:(id)a3
{
  [(_TUIFeedLayoutSection *)self _teardownController];
  renderModel = self->_renderModel;
  self->_renderModel = 0;

  auxRenderModel = self->_auxRenderModel;
  self->_auxRenderModel = 0;

  layerRenderModel = self->_layerRenderModel;
  self->_layerRenderModel = 0;
}

- (void)resumeAndRebuildWithTransactionGroup:(id)a3
{
  self->_needsInstantiation = 1;
}

- (void)setStatsMode:(unint64_t)a3
{
  if (self->_statsMode != a3)
  {
    self->_unint64_t statsMode = a3;
    eventCollector = self->_eventCollector;
    self->_eventCollector = 0;

    timingCollector = self->_timingCollector;
    self->_timingCollector = 0;

    unint64_t statsMode = self->_statsMode;
    if ((statsMode & 8) != 0)
    {
      v7 = objc_alloc_init(TUIStatsEventCollector);
      v8 = self->_eventCollector;
      self->_eventCollector = v7;

      unint64_t statsMode = self->_statsMode;
    }
    if ((statsMode & 4) != 0)
    {
      v9 = [[TUIStatsTimingCollector alloc] initWithMode:self->_statsMode];
      id v10 = self->_timingCollector;
      self->_timingCollector = v9;
    }
    [(TUILayoutController *)self->_layoutController setStatsCollector:self->_eventCollector];
    id v11 = self->_eventCollector;
    id v12 = [(TUILayoutController *)self->_layoutController instantiateContext];
    [v12 setStatsCollector:v11];
  }
}

- (void)lq_loadOrUpdateEntry:(id)a3 data:(id)a4 controller:(id)a5 transactionGroup:(id)a6
{
  v8 = (TUIFeedEntry *)a3;
  id v12 = [a4 dictionary];
  if (v12)
  {
    v9 = [[TUIBindings alloc] initWithData:v12];
    bindings = self->_bindings;
    self->_bindings = v9;
  }
  else
  {
    bindings = self->_bindings;
    self->_bindings = 0;
  }

  self->_needsInstantiation = 1;
  entry = self->_entry;
  self->_entry = v8;
}

- (void)lq_captureWithController:(id)a3
{
  self->_needsInstantiation = 1;
  objc_storeStrong((id *)&self->_captureController, a3);
}

- (void)lq_instantiateWithController:(id)a3 transactionGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_needsInstantiation = 0;
  if (self->_updated) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 8;
  }
  [(TUIStatsTimingCollector *)self->_timingCollector recordReason:v8];
  [(TUIStatsTimingCollector *)self->_timingCollector startPhase:0];
  v9 = [(TUITemplate *)self->_template url];
  id v10 = [(TUIFeedEntry *)self->_entry templateURL];
  unsigned __int8 v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    [(TUIStatsTimingCollector *)self->_timingCollector startPhase:1];
    id v12 = [v6 templateFactory];
    v13 = [(TUIFeedEntry *)self->_entry templateURL];
    uint64_t v14 = [v12 templateFromURL:v13];
    v15 = self->_template;
    self->_template = v14;

    [(TUIStatsTimingCollector *)self->_timingCollector endPhase:1];
    v16 = [(TUILayoutController *)self->_layoutController package];
    objc_super v17 = [(TUITemplate *)self->_template package];

    if (v16 != v17) {
      [(_TUIFeedLayoutSection *)self _setupController];
    }
  }
  layoutController = self->_layoutController;
  v19 = [v6 environment];
  [(TUILayoutController *)layoutController updateEnvironment:v19];

  unint64_t updated = self->_updated;
  v21 = TUILayoutLog();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if (updated)
  {
    if (!v22) {
      goto LABEL_13;
    }
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    unint64_t v24 = self->_updated;
    unint64_t section = self->_section;
    entry = self->_entry;
    *(_DWORD *)v41 = 134218754;
    *(void *)&v41[4] = uniqueIdentifier;
    *(_WORD *)&v41[12] = 2048;
    *(void *)&v41[14] = v24;
    *(_WORD *)&v41[22] = 1024;
    *(_DWORD *)&v41[24] = section;
    *(_WORD *)&v41[28] = 2112;
    *(void *)&v41[30] = entry;
    v27 = "[fid:%lu] feed data update #%lu at section %d: %@";
    v28 = v21;
    uint32_t v29 = 38;
  }
  else
  {
    if (!v22) {
      goto LABEL_13;
    }
    unint64_t v30 = self->_feedId.uniqueIdentifier;
    unint64_t v31 = self->_section;
    v32 = self->_entry;
    *(_DWORD *)v41 = 134218498;
    *(void *)&v41[4] = v30;
    *(_WORD *)&v41[12] = 1024;
    *(_DWORD *)&v41[14] = v31;
    *(_WORD *)&v41[18] = 2112;
    *(void *)&v41[20] = v32;
    v27 = "[fid:%lu] feed data loaded at section %d: %@";
    v28 = v21;
    uint32_t v29 = 28;
  }
  _os_log_impl(&def_141F14, v28, OS_LOG_TYPE_INFO, v27, v41, v29);
LABEL_13:

  ++self->_updated;
  if (!self->_template)
  {
    v33 = TUILayoutLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_192118((uint64_t)self, (id *)&self->_entry, v33);
    }
  }
  captureController = self->_captureController;
  if (captureController)
  {
    [(TUIFeedCaptureController *)captureController captureSectionWithEntry:self->_entry bindings:self->_bindings template:self->_template];
    v35 = [(TUIFeedCaptureController *)self->_captureController instantiateCaptureForEntry:self->_entry];
    v36 = [(TUILayoutController *)self->_layoutController instantiateContext];
    [v36 setCapture:v35];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedLayoutController);
  unsigned __int8 v38 = [WeakRetained suspended];

  if ((v38 & 1) == 0) {
    [(_TUIFeedLayoutSection *)self _instantiateTemplateWithTransactionGroup:v7];
  }
  if (self->_captureController)
  {
    v39 = [(TUILayoutController *)self->_layoutController instantiateContext];
    [v39 setCapture:0];

    v40 = self->_captureController;
    self->_captureController = 0;
  }
  -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 0, *(_OWORD *)v41, *(void *)&v41[16], *(_OWORD *)&v41[24]);
}

- (void)_instantiateTemplateWithTransactionGroup:(id)a3
{
  id v22 = a3;
  if (!self->_layoutController)
  {
    -[_TUIFeedLayoutSection lq_createEmptyRenderModelWithSize:](self, "lq_createEmptyRenderModelWithSize:", CGSizeZero.width, CGSizeZero.height);
    goto LABEL_9;
  }
  [(TUIStatsTimingCollector *)self->_timingCollector startPhase:2];
  v5 = [(TUILayoutController *)self->_layoutController instantiateContext];
  id v6 = [v5 instantiateTemplate:self->_template bindings:self->_bindings actionObject:self->_entry];

  layoutController = self->_layoutController;
  uint64_t v8 = [(TUILayoutController *)layoutController instantiateContext];
  v9 = [v8 evaluationErrors];
  [(TUILayoutController *)layoutController addErrors:v9];

  [(TUIStatsTimingCollector *)self->_timingCollector endPhase:2];
  [(TUIStatsTimingCollector *)self->_timingCollector startPhase:3];
  [(TUILayoutController *)self->_layoutController setRootBox:v6];
  [(TUILayoutController *)self->_layoutController validateLayouts];
  [(TUIStatsTimingCollector *)self->_timingCollector endPhase:3];
  [(TUIStatsTimingCollector *)self->_timingCollector startPhase:4];
  id v12 = [(_TUIFeedLayoutSection *)self feedLayoutController];
  v13 = (char *)[v12 renderModelMode];

  if (v13 == (unsigned char *)&def_141F14 + 1)
  {
    v21 = [(TUILayoutController *)self->_layoutController renderModelLayer:v22];
    layerRenderModel = self->_layerRenderModel;
    self->_layerRenderModel = v21;
    goto LABEL_7;
  }
  if (!v13)
  {
    uint64_t v14 = [(TUILayoutController *)self->_layoutController renderModelAuxiliary:v22];
    auxRenderModel = self->_auxRenderModel;
    self->_auxRenderModel = v14;

    v16 = self->_layoutController;
    unint64_t section = self->_section;
    layerRenderModel = [(_TUIFeedLayoutSection *)self UUID];
    -[TUILayoutController renderModelSection:offset:uuid:transactionGroup:](v16, "renderModelSection:offset:uuid:transactionGroup:", section, layerRenderModel, v22, CGPointZero.x, CGPointZero.y);
    v19 = (TUIRenderModelSection *)objc_claimAutoreleasedReturnValue();
    renderModel = self->_renderModel;
    self->_renderModel = v19;

LABEL_7:
  }
  [(TUIStatsTimingCollector *)self->_timingCollector endPhase:4];

LABEL_9:
}

- (id)UUID
{
  v2 = [(TUIFeedEntry *)self->_entry identifierMap];
  v3 = [v2 UUID];

  return v3;
}

- (void)lq_updateEnvironment:(id)a3 withTransactionGroup:(id)a4
{
  layoutController = self->_layoutController;
  if (layoutController) {
    -[TUILayoutController updateEnvironment:](layoutController, "updateEnvironment:", a3, a4);
  }
  self->_environmentNeedsUpdate = 0;
}

- (BOOL)lq_updateHostingGeometryMap:(id)a3
{
  return [(TUILayoutController *)self->_layoutController applyHostingGeometryMapUpdate:a3];
}

- (BOOL)lq_updateLayoutWithTransactionGroup:(id)a3
{
  id v4 = a3;
  if (self->_layoutController)
  {
    [(TUIStatsTimingCollector *)self->_timingCollector recordReason:1];
    [(TUIStatsTimingCollector *)self->_timingCollector startPhase:0];
    v5 = [(TUIWorkQueueContext *)self->_queueContext workQueue];
    dispatch_assert_queue_V2(v5);

    [(TUIStatsTimingCollector *)self->_timingCollector startPhase:2];
    [(TUILayoutController *)self->_layoutController validateInstantiationWithTransactionGroup:v4];
    [(TUIStatsTimingCollector *)self->_timingCollector endPhase:2];
    [(TUIStatsTimingCollector *)self->_timingCollector startPhase:3];
    [(TUILayoutController *)self->_layoutController validateLayouts];
    [(TUIStatsTimingCollector *)self->_timingCollector endPhase:3];
    [(TUIStatsTimingCollector *)self->_timingCollector startPhase:4];
    [(TUILayoutController *)self->_layoutController validateRenderModelsWithTransactionGroup:v4];
    id v6 = [(_TUIFeedLayoutSection *)self feedLayoutController];
    id v7 = [v6 renderModelMode];

    uint64_t v8 = 0;
    if (!v7)
    {
      layoutController = self->_layoutController;
      unint64_t section = self->_section;
      unsigned __int8 v11 = [(_TUIFeedLayoutSection *)self UUID];
      -[TUILayoutController renderModelSection:offset:uuid:transactionGroup:](layoutController, "renderModelSection:offset:uuid:transactionGroup:", section, v11, v4, CGPointZero.x, CGPointZero.y);
      uint64_t v8 = (TUIRenderModelSection *)objc_claimAutoreleasedReturnValue();
    }
    [(TUIStatsTimingCollector *)self->_timingCollector endPhase:4];
    renderModel = self->_renderModel;
    BOOL v13 = v8 != renderModel;
    if (v8 != renderModel) {
      objc_storeStrong((id *)&self->_renderModel, v8);
    }
    [(TUIStatsTimingCollector *)self->_timingCollector endPhase:0];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)lq_createEmptyRenderModelWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(_TUIFeedLayoutSection *)self feedLayoutController];
  id v7 = [v6 renderModelMode];

  if (!v7)
  {
    uint64_t v8 = [TUIRenderModelSection alloc];
    entry = self->_entry;
    id v10 = [(TUIWorkQueueContext *)self->_queueContext workQueue];
    memset(v16, 0, sizeof(v16));
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    unsigned __int8 v11 = [(TUIRenderModelSection *)v8 initWithEntry:entry submodels:0 config:v16 impressions:0 linkEntities:0 hoverRegions:0 identifierMap:0 layoutQueue:v10];
    unint64_t section = self->_section;
    BOOL v13 = [(_TUIFeedLayoutSection *)self UUID];
    uint64_t v14 = -[TUIRenderModelSection copyWithSection:offset:uuid:](v11, "copyWithSection:offset:uuid:", section, v13, CGPointZero.x, CGPointZero.y);
    renderModel = self->_renderModel;
    self->_renderModel = v14;

    -[TUIRenderModelSection setSize:](self->_renderModel, "setSize:", width, height);
  }
}

- (BOOL)lq_updateAuxiliaryLayoutWithTransactionGroup:(id)a3
{
  timingCollector = self->_timingCollector;
  id v5 = a3;
  [(TUIStatsTimingCollector *)timingCollector startPhase:4];
  id v6 = [(TUILayoutController *)self->_layoutController renderModelAuxiliary:v5];

  [(TUIStatsTimingCollector *)self->_timingCollector endPhase:4];
  auxRenderModel = self->_auxRenderModel;
  p_auxRenderModel = &self->_auxRenderModel;
  uint64_t v8 = auxRenderModel;
  if (v6 != auxRenderModel) {
    objc_storeStrong((id *)p_auxRenderModel, v6);
  }

  return v6 != v8;
}

- (BOOL)lq_updateLayerLayoutWithTransactionGroup:(id)a3
{
  timingCollector = self->_timingCollector;
  id v5 = a3;
  [(TUIStatsTimingCollector *)timingCollector startPhase:4];
  id v6 = [(TUILayoutController *)self->_layoutController renderModelLayer:v5];

  [(TUIStatsTimingCollector *)self->_timingCollector endPhase:4];
  layerRenderModel = self->_layerRenderModel;
  p_layerRenderModel = &self->_layerRenderModel;
  uint64_t v8 = layerRenderModel;
  if (v6 != layerRenderModel) {
    objc_storeStrong((id *)p_layerRenderModel, v6);
  }

  return v6 != v8;
}

- (void)lq_appendAnchorsToSet:(id)a3
{
  id v8 = a3;
  id v4 = [(TUILayoutController *)self->_layoutController rootBox];

  if (v4)
  {
    layoutController = self->_layoutController;
    id v6 = [(TUILayoutController *)layoutController rootBox];
    id v7 = [(TUILayoutController *)layoutController layoutForModel:v6];

    [v7 appendAnchorsToSet:v8 inRoot:v7];
  }
}

- (id)loadingRenderModelWithSize:(CGSize)a3 center:(CGPoint)a4 environment:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.height;
  double width = a3.width;
  entrdouble y = self->_entry;
  id v11 = a5;
  id v12 = [(TUIFeedEntry *)entry identifierMap];
  BOOL v13 = [v12 loadingIdentifier];
  uint64_t v14 = +[TUISpinnerView renderModelWithIdentifier:v13];

  v15 = [[TUIRenderModelTransform alloc] initWithSubmodel:v14];
  -[TUIRenderModelTransform setSize:](v15, "setSize:", width, height);
  -[TUIRenderModelTransform setCenter:](v15, "setCenter:", x, y);
  BOOL v16 = [v11 layoutDirection] == (char *)&def_141F14 + 2;
  [v11 viewSize];
  uint64_t v18 = v17;

  v19 = [TUIRenderModelSection alloc];
  v20 = self->_entry;
  v33 = v15;
  v21 = +[NSArray arrayWithObjects:&v33 count:1];
  id v22 = [(TUIFeedEntry *)self->_entry identifierMap];
  v23 = [v22 renderModelIdentifierMap];
  unint64_t v24 = [(TUIWorkQueueContext *)self->_queueContext workQueue];
  v30[0] = v16;
  memset(&v30[1], 0, 7);
  uint64_t v31 = v18;
  uint64_t v32 = 0;
  v25 = [(TUIRenderModelSection *)v19 initWithEntry:v20 submodels:v21 config:v30 impressions:0 linkEntities:0 hoverRegions:0 identifierMap:v23 layoutQueue:v24];

  [(TUIRenderModelTransform *)v15 size];
  -[TUIRenderModelSection setSize:](v25, "setSize:");
  unint64_t section = self->_section;
  v27 = [(_TUIFeedLayoutSection *)self UUID];
  id v28 = -[TUIRenderModelSection copyWithSection:offset:uuid:](v25, "copyWithSection:offset:uuid:", section, v27, CGPointZero.x, CGPointZero.y);

  return v28;
}

- (id)axModelTree
{
  return [(TUILayoutController *)self->_layoutController axModelTree];
}

- (void)debugDumpEnvironmentContainerStructure
{
  id v4 = [(TUIFeedEntry *)self->_entry templateURL];
  v3 = [(TUILayoutController *)self->_layoutController debugDumpEnvironmentContainerStructure];
  NSLog(@"\nEntry: %@\n\n%@", v4, v3);
}

- (unint64_t)section
{
  return self->_section;
}

- (TUIBindings)bindings
{
  return self->_bindings;
}

- (TUIRenderModelSection)renderModel
{
  return self->_renderModel;
}

- (TUIRenderModelAuxiliary)auxRenderModel
{
  return self->_auxRenderModel;
}

- (TUIRenderModelLayer)layerRenderModel
{
  return self->_layerRenderModel;
}

- (unint64_t)statsMode
{
  return self->_statsMode;
}

- (TUIStatsTimingCollector)timingCollector
{
  return self->_timingCollector;
}

- (TUIFeedEntry)entry
{
  return self->_entry;
}

- (TUITemplate)template
{
  return self->_template;
}

- (TUILayoutController)layoutController
{
  return self->_layoutController;
}

- (TUIStatsEventCollector)eventCollector
{
  return self->_eventCollector;
}

- (TUIWorkQueueContext)queueContext
{
  return self->_queueContext;
}

- (BOOL)environmentNeedsUpdate
{
  return self->_environmentNeedsUpdate;
}

- (void)setEnvironmentNeedsUpdate:(BOOL)a3
{
  self->_environmentNeedsUpdate = a3;
}

- (BOOL)needsInstantiation
{
  return self->_needsInstantiation;
}

- (TUIFeedLayoutController)feedLayoutController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedLayoutController);

  return (TUIFeedLayoutController *)WeakRetained;
}

- (void)setFeedLayoutController:(id)a3
{
}

- (TUIInstantiateContextState)instantiateState
{
  return self->_instantiateState;
}

- (TUIFeedCaptureController)captureController
{
  return self->_captureController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureController, 0);
  objc_storeStrong((id *)&self->_instantiateState, 0);
  objc_destroyWeak((id *)&self->_feedLayoutController);
  objc_storeStrong((id *)&self->_queueContext, 0);
  objc_storeStrong((id *)&self->_eventCollector, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_timingCollector, 0);
  objc_storeStrong((id *)&self->_layerRenderModel, 0);
  objc_storeStrong((id *)&self->_auxRenderModel, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);

  objc_storeStrong((id *)&self->_bindings, 0);
}

@end