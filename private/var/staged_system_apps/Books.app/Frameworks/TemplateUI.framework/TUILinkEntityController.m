@interface TUILinkEntityController
- (TUILinkEntityActionHandling)actionHandler;
- (TUILinkEntityController)initWithFeedId:(id)a3 queue:(id)a4 viewResolver:(id)a5;
- (void)addLinkEntityObserver:(id)a3;
- (void)attachToTracker:(id)a3;
- (void)detachFromTracker;
- (void)invokeAction:(id)a3 forLinkEntityReference:(id)a4 withParameters:(id)a5 completion:(id)a6;
- (void)removeLinkEntityObserver:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)visibleContentsChanged:(id)a3;
- (void)visibleLinkEntityReferencesWithFilter:(id)a3 completion:(id)a4;
@end

@implementation TUILinkEntityController

- (TUILinkEntityController)initWithFeedId:(id)a3 queue:(id)a4 viewResolver:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TUILinkEntityController;
  v11 = [(TUILinkEntityController *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_feedId.uniqueIdentifier = a3.var0;
    objc_storeStrong((id *)&v11->_queue, a4);
    objc_storeWeak((id *)&v12->_viewResolver, v10);
    uint64_t v13 = +[NSHashTable hashTableWithOptions:517];
    q_observers = v12->_q_observers;
    v12->_q_observers = (NSHashTable *)v13;
  }
  return v12;
}

- (void)attachToTracker:(id)a3
{
  objc_storeStrong((id *)&self->_tracker, a3);
  id v5 = a3;
  [v5 addVisibilityObserver:self];
}

- (void)detachFromTracker
{
  [(TUIVisibilityTracker *)self->_tracker removeVisibilityObserver:self];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B575C;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_async(queue, block);
  tracker = self->_tracker;
  self->_tracker = 0;
}

- (void)visibleContentsChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 rootNode];
  q_visibleNode = self->_q_visibleNode;
  self->_q_visibleNode = v5;

  v7 = objc_opt_new();
  v8 = objc_opt_new();
  v17 = v4;
  id v9 = [v4 rootNode];
  sub_B5CF8(v7, v8, v9, 0);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = self->_q_observers;
  id v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_super v16 = TUILinkEntityObserverLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          v23 = self;
          __int16 v24 = 2112;
          v25 = v7;
          __int16 v26 = 2112;
          v27 = v8;
          _os_log_impl(&def_141F14, v16, OS_LOG_TYPE_INFO, "visible-content-changed observer[%p]: added=%@ removed=%@", buf, 0x20u);
        }

        [v15 linkEntityController:self visibleEntityReferencesWithAdded:v7 removed:v8];
      }
      id v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v12);
  }
}

- (void)addLinkEntityObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_B6068;
  v7[3] = &unk_251828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeLinkEntityObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_B63F0;
  v7[3] = &unk_251828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)visibleLinkEntityReferencesWithFilter:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_B65BC;
    block[3] = &unk_2549A8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

- (void)invokeAction:(id)a3 forLinkEntityReference:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void))a6;
  v14 = [v11 resolvePath];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewResolver);
  objc_super v16 = [WeakRetained resolveViewWithPath:v14];

  v17 = v16;
  long long v18 = TUILinkEntityActionLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218754;
    unint64_t v57 = uniqueIdentifier;
    __int16 v58 = 2112;
    id v59 = v10;
    __int16 v60 = 2112;
    v61 = v11;
    __int16 v62 = 2112;
    id v63 = v12;
    _os_log_impl(&def_141F14, v18, OS_LOG_TYPE_DEFAULT, "[fid:%lu] performAction:%@ linkEntity:%@ params:%@", buf, 0x2Au);
  }

  if (v17)
  {
    long long v20 = [v17 layoutAttributes];
    long long v21 = [v20 renderModel];
    v22 = TUIProtocolCast(&OBJC_PROTOCOL___TUIRenderModelActionContaining, v21);
    v55 = [v22 actionHandler];

    v23 = [v11 model];
    __int16 v24 = [v23 actionsMap];
    v25 = [v24 objectForKeyedSubscript:v10];

    if (!v25)
    {
      v32 = TUILinkEntityActionLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_191C74((uint64_t)self, (uint64_t)v10, v32);
      }

      if (v13) {
        v13[2](v13, 0);
      }
      v29 = v17;
      goto LABEL_33;
    }
    v52 = v23;
    __int16 v26 = [v25 refId];

    v53 = v14;
    id v54 = v10;
    if (v26)
    {
      v27 = [v25 refId];
      v28 = [v17 descendentViewWithRefId:v27];

      BOOL v51 = v28 == 0;
      if (v28)
      {
        v29 = v28;
        v30 = v17;
      }
      else
      {
        log = TUILinkEntityActionLog();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          unint64_t v44 = self->_feedId.uniqueIdentifier;
          v47 = [v25 refId];
          v49 = [v17 layoutAttributes];
          v48 = [v49 renderModel];
          v46 = [v48 identifier];
          v45 = [v46 tui_identifierToString];
          *(_DWORD *)buf = 134218754;
          unint64_t v57 = v44;
          __int16 v58 = 2112;
          id v59 = v47;
          __int16 v60 = 2112;
          v61 = v17;
          __int16 v62 = 2112;
          id v63 = v45;
          _os_log_error_impl(&def_141F14, log, OS_LOG_TYPE_ERROR, "[fid:%lu] failed to lookup refId:%@ descendentOfView:%@ (%@); falling back on view",
            buf,
            0x2Au);

          v30 = log;
          v29 = v17;
        }
        else
        {
          v29 = v17;
          v30 = log;
        }
      }
    }
    else
    {
      BOOL v51 = 1;
      v29 = v17;
    }
    if (v12) {
      v33 = v12;
    }
    else {
      v33 = &__NSDictionary0__struct;
    }
    id v34 = [v33 mutableCopy];
    v35 = +[TUIElementActionTriggerHandler argumentsForView:v29];
    [v34 addEntriesFromDictionary:v35];

    id v36 = [v34 copy];
    uint64_t v37 = [v25 trigger];
    if (v37
      && (v38 = (void *)v37,
          [v25 trigger],
          v39 = objc_claimAutoreleasedReturnValue(),
          unsigned int v40 = [v55 hasActionForTrigger:v39],
          v39,
          v38,
          v40))
    {
      v41 = [v25 trigger];
      [v55 invoke:v41 view:v29 allowRefId:v51 arguments:v36];

      if (v13) {
        v13[2](v13, 1);
      }
    }
    else
    {
      id v42 = objc_loadWeakRetained((id *)&self->_actionHandler);

      if (v42)
      {
        id v43 = objc_loadWeakRetained((id *)&self->_actionHandler);
        [v43 handleAction:v54 forLinkEntity:v11 withParameters:v36 sourceView:v29 completion:v13];

        id v10 = v54;
        id v12 = v36;
LABEL_32:
        v23 = v52;
        v14 = v53;
LABEL_33:

        goto LABEL_34;
      }
      v13[2](v13, 0);
    }
    id v12 = v36;
    id v10 = v54;
    goto LABEL_32;
  }
  v31 = TUILinkEntityActionLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_191BB8((uint64_t)self, v14, v31);
  }

  if (v13) {
    v13[2](v13, 0);
  }
LABEL_34:
}

- (TUILinkEntityActionHandling)actionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  return (TUILinkEntityActionHandling *)WeakRetained;
}

- (void)setActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_storeStrong((id *)&self->_q_observers, 0);
  objc_storeStrong((id *)&self->_q_visibleNode, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tracker, 0);

  objc_destroyWeak((id *)&self->_viewResolver);
}

@end