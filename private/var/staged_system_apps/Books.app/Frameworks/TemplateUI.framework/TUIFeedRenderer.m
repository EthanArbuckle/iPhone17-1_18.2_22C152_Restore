@interface TUIFeedRenderer
- ($61A80719B04F7407D3E47539F1B23CAA)feedId;
- (BCULayerRenderer)layerRenderer;
- (BCUOperation)renderOperation;
- (TUIFeedContent)content;
- (TUIFeedLayoutController)layoutController;
- (TUIFeedRenderer)initWithContent:(id)a3 environment:(id)a4 factory:(id)a5 manager:(id)a6 options:(id)a7;
- (TUIFeedRendererImageResourceObserver)resourceObserver;
- (TUIFeedRendererOptions)options;
- (TUIFeedSuspendLayoutLayerUpdateCondition)layoutCondition;
- (id)_buildRootLayerFromRenderModel:(id)a3;
- (id)completion;
- (void)applyLayerModelUpdate:(id)a3 hasInvalidLayouts:(BOOL)a4;
- (void)capture:(id)a3;
- (void)dealloc;
- (void)setCompletion:(id)a3;
- (void)setLayerRenderer:(id)a3;
- (void)setLayoutCondition:(id)a3;
- (void)setRenderOperation:(id)a3;
- (void)setResourceObserver:(id)a3;
@end

@implementation TUIFeedRenderer

- (TUIFeedRenderer)initWithContent:(id)a3 environment:(id)a4 factory:(id)a5 manager:(id)a6 options:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)TUIFeedRenderer;
  v18 = [(TUIFeedRenderer *)&v27 init];
  if (v18)
  {
    v18->_feedId.unint64_t uniqueIdentifier = TUIFeedIdentifierGenerate();
    v19 = TUIDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      unint64_t uniqueIdentifier = v18->_feedId.uniqueIdentifier;
      *(_DWORD *)buf = 134218242;
      unint64_t v29 = uniqueIdentifier;
      __int16 v30 = 2112;
      v31 = v18;
      _os_log_impl(&def_141F14, v19, OS_LOG_TYPE_INFO, "[fid:%lu] created feed renderer: %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v18->_content, a3);
    [v14 contentsScale];
    v18->_contentScale = v21;
    objc_storeStrong((id *)&v18->_options, a7);
    v22 = [[TUIFeedLayoutController alloc] initWithFeedId:v18->_feedId.uniqueIdentifier environment:v14 factory:v15 manager:v16 renderMode:1];
    layoutController = v18->_layoutController;
    v18->_layoutController = v22;

    v24 = [(TUIFeedLayoutController *)v18->_layoutController layerUpdateController];
    id v25 = [v24 registerDelegate:v18];
  }
  return v18;
}

- (void)dealloc
{
  v3 = [(TUIFeedLayoutController *)self->_layoutController layerUpdateController];
  [v3 unregisterDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)TUIFeedRenderer;
  [(TUIFeedRenderer *)&v4 dealloc];
}

- (void)capture:(id)a3
{
  content = self->_content;
  layoutController = self->_layoutController;
  id v6 = a3;
  [(TUIFeedLayoutController *)layoutController updateWithContent:content transaction:0];
  v7 = [TUIFeedSuspendLayoutLayerUpdateCondition alloc];
  v8 = [(TUIFeedContent *)self->_content entries];
  v9 = -[TUIFeedSuspendLayoutLayerUpdateCondition initWithSectionCount:completion:](v7, "initWithSectionCount:completion:", [v8 count], 0);
  layoutCondition = self->_layoutCondition;
  self->_layoutCondition = v9;

  [(TUIFeedLayoutController *)self->_layoutController suspendUpdatesUntilMeetingLayoutCondition:self->_layoutCondition];
  id v11 = objc_retainBlock(v6);

  id completion = self->_completion;
  self->_id completion = v11;
}

- (void)applyLayerModelUpdate:(id)a3 hasInvalidLayouts:(BOOL)a4
{
  id v6 = a3;
  options = self->_options;
  if (options)
  {
    [(TUIFeedRendererOptions *)options timeout];
    double v9 = v8;
  }
  else
  {
    double v9 = 3.0;
  }
  v10 = [[TUIFeedRendererImageResourceObserver alloc] initWithRenderModel:v6 timeout:v9];
  resourceObserver = self->_resourceObserver;
  self->_resourceObserver = v10;

  v12 = self->_resourceObserver;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_167B78;
  v14[3] = &unk_256DE8;
  v14[4] = self;
  id v15 = v6;
  BOOL v16 = a4;
  id v13 = v6;
  [(TUIFeedRendererImageResourceObserver *)v12 waitForImageResources:v14];
}

- (id)_buildRootLayerFromRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_168004;
  BOOL v16 = sub_168014;
  id v17 = objc_alloc_init((Class)CALayer);
  [v13[5] setAnchorPoint:0.5, 0.5];
  [v4 size];
  double v6 = v5;
  [v4 size];
  [v13[5] setFrame:0.0, 0.0, v6, v7];
  [(id)v13[5] setContentsScale:self->_contentScale];
  [(id)v13[5] setRasterizationScale:self->_contentScale];
  [(id)v13[5] setShouldRasterize:1];
  double v8 = [v4 submodels];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_16801C;
  v11[3] = &unk_256E10;
  v11[4] = &v12;
  [v8 enumerateObjectsUsingBlock:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (TUIFeedContent)content
{
  return self->_content;
}

- (TUIFeedLayoutController)layoutController
{
  return self->_layoutController;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (TUIFeedRendererOptions)options
{
  return self->_options;
}

- (BCUOperation)renderOperation
{
  return self->_renderOperation;
}

- (void)setRenderOperation:(id)a3
{
}

- (BCULayerRenderer)layerRenderer
{
  return self->_layerRenderer;
}

- (void)setLayerRenderer:(id)a3
{
}

- (TUIFeedRendererImageResourceObserver)resourceObserver
{
  return self->_resourceObserver;
}

- (void)setResourceObserver:(id)a3
{
}

- (TUIFeedSuspendLayoutLayerUpdateCondition)layoutCondition
{
  return self->_layoutCondition;
}

- (void)setLayoutCondition:(id)a3
{
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutCondition, 0);
  objc_storeStrong((id *)&self->_resourceObserver, 0);
  objc_storeStrong((id *)&self->_layerRenderer, 0);
  objc_storeStrong((id *)&self->_renderOperation, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end