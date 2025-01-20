@interface TUIRenderUpdateCollectionController
- (NSMutableDictionary)sectionTrackers;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)layoutQueue;
- (TUIHostingMap)currentHostingMap;
- (TUIRenderModelCollection)currentModel;
- (TUIRenderModelCollection)model;
- (TUIRenderUpdateCollectionController)initWithLayoutQueue:(id)a3 renderModel:(id)a4;
- (TUIRenderUpdateCollectionControllerDelegate)delegate;
- (id)registerDelegate:(id)a3;
- (id)renderModel;
- (id)renderModelAndHostingMap;
- (void)_updateWithHostingMap:(id)a3 transactionGroup:(id)a4;
- (void)_updateWithRenderModel:(id)a3 viewState:(id)a4 flags:(unint64_t)a5 transactionGroup:(id)a6;
- (void)applyInitialUpdate;
- (void)unregisterDelegate:(id)a3;
- (void)updateWithHostingMap:(id)a3 transactionGroup:(id)a4;
- (void)updateWithRenderModel:(id)a3 viewState:(id)a4 flags:(unint64_t)a5 transactionGroup:(id)a6;
@end

@implementation TUIRenderUpdateCollectionController

- (TUIRenderUpdateCollectionController)initWithLayoutQueue:(id)a3 renderModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TUIRenderUpdateCollectionController;
  v9 = [(TUIRenderUpdateCollectionController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutQueue, a3);
    objc_storeStrong((id *)&v10->_currentModel, a4);
    dispatch_queue_t v11 = dispatch_queue_create("TUIRenderUpdateCollectionController.accessQueue", 0);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_opt_new();
    sectionTrackers = v10->_sectionTrackers;
    v10->_sectionTrackers = (NSMutableDictionary *)v13;

    v10->_isInitial = 1;
  }

  return v10;
}

- (id)registerDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_987BC;
  objc_super v16 = sub_987CC;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_987D4;
  block[3] = &unk_251800;
  block[4] = self;
  id v10 = v4;
  dispatch_queue_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)renderModel
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_987BC;
  id v10 = sub_987CC;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_98BE8;
  v5[3] = &unk_252B50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)renderModelAndHostingMap
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_987BC;
  id v10 = sub_987CC;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_98CEC;
  v5[3] = &unk_252B50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)applyInitialUpdate
{
  initialUpdateBlock = (void (**)(id, SEL))self->_initialUpdateBlock;
  if (initialUpdateBlock)
  {
    initialUpdateBlock[2](initialUpdateBlock, a2);
    id v4 = self->_initialUpdateBlock;
    self->_initialUpdateBlock = 0;
  }
}

- (void)unregisterDelegate:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_98E38;
  v7[3] = &unk_251828;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)updateWithHostingMap:(id)a3 transactionGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_98F7C;
    v8[3] = &unk_252320;
    v8[4] = self;
    id v9 = v6;
    id v10 = v7;
    [v10 computeUpdatesWithBlock:v8];
  }
  else
  {
    [(TUIRenderUpdateCollectionController *)self _updateWithHostingMap:v6 transactionGroup:0];
  }
}

- (void)_updateWithHostingMap:(id)a3 transactionGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_987BC;
  v17[4] = sub_987CC;
  id v18 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_99130;
  block[3] = &unk_2528A0;
  objc_super v16 = v17;
  block[4] = self;
  id v9 = v6;
  id v15 = v9;
  dispatch_sync(accessQueue, block);
  if (objc_opt_respondsToSelector())
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_991BC;
    v10[3] = &unk_2543C8;
    uint64_t v13 = v17;
    id v11 = v9;
    uint64_t v12 = self;
    [v7 appendUpdateBlock:v10];
  }
  _Block_object_dispose(v17, 8);
}

- (void)updateWithRenderModel:(id)a3 viewState:(id)a4 flags:(unint64_t)a5 transactionGroup:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_992E0;
    v13[3] = &unk_2543F0;
    v13[4] = self;
    id v14 = v10;
    id v15 = v11;
    unint64_t v17 = a5;
    id v16 = v12;
    [v16 computeUpdatesWithBlock:v13];
  }
  else
  {
    [(TUIRenderUpdateCollectionController *)self _updateWithRenderModel:v10 viewState:v11 flags:a5 transactionGroup:0];
  }
}

- (void)_updateWithRenderModel:(id)a3 viewState:(id)a4 flags:(unint64_t)a5 transactionGroup:(id)a6
{
  id v75 = a3;
  id v73 = a4;
  id v71 = a6;
  v83 = self;
  model = self->_model;
  location = (id *)&self->_model;
  if (model)
  {
    id v10 = [(TUIRenderModelCollection *)model sections];
    v81 = [v10 valueForKey:@"UUID"];
  }
  else
  {
    v81 = &__NSArray0__struct;
  }
  v76 = objc_opt_new();
  v74 = self->_currentModel;
  v82 = objc_alloc_init(TUIRenderUpdateChanges);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id obj = [v75 sections];
  id v11 = [obj countByEnumeratingWithState:&v108 objects:v113 count:16];
  if (!v11)
  {
    v79 = 0;
    id v77 = 0;
    goto LABEL_26;
  }
  id v77 = 0;
  v79 = 0;
  uint64_t v80 = *(void *)v109;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v109 != v80) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(*((void *)&v108 + 1) + 8 * i);
      id v14 = [v13 UUID];
      id v15 = [v81 indexOfObject:v14];

      if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v16 = 0;
LABEL_21:
        id v18 = [v13 identifierToContainedSubmodelMap];
        v22 = [v18 allKeys];
        [(TUIRenderUpdateChanges *)v82 unionInserts:v22];
        goto LABEL_22;
      }
      unint64_t v17 = [(TUIRenderModelCollection *)v83->_model sections];
      id v18 = [v17 objectAtIndexedSubscript:v15];

      v19 = [(TUIRenderModelCollection *)v83->_currentModel sections];
      id v16 = [v19 objectAtIndexedSubscript:v15];

      if (!v18) {
        goto LABEL_21;
      }
      sectionTrackers = v83->_sectionTrackers;
      v21 = [v13 UUID];
      v22 = [(NSMutableDictionary *)sectionTrackers objectForKeyedSubscript:v21];

      v23 = [v13 computeContainerUpdateCurrent:v16 from:v18 tracker:v22 flags:0];
      if (!v79) {
        v79 = objc_opt_new();
      }
      v24 = [v13 UUID];
      [v79 setObject:v23 forKeyedSubscript:v24];

      v25 = [v23 tracker];
      BOOL v26 = v25 == v22;

      if (!v26)
      {
        v27 = [v23 tracker];
        v28 = v83->_sectionTrackers;
        v29 = [v13 UUID];
        [(NSMutableDictionary *)v28 setObject:v27 forKeyedSubscript:v29];
      }
      id v107 = 0;
      id v30 = [v23 newToContainerPlusDeletedWithInterests:v76 changes:&v107];
      id v31 = v107;
      if (v30 != v13)
      {
        if (!v77)
        {
          v32 = [v75 sections];
          id v77 = [v32 mutableCopy];
        }
        [v77 replaceObjectAtIndex:[v13 section] withObject:v30];
      }
      [(TUIRenderUpdateChanges *)v82 unionChanges:v31];

LABEL_22:
    }
    id v11 = [obj countByEnumeratingWithState:&v108 objects:v113 count:16];
  }
  while (v11);
LABEL_26:

  objc_storeStrong(location, a3);
  if (v77)
  {
    v33 = [TUIRenderModelCollection alloc];
    v34 = [v75 content];
    [v75 size];
    double v36 = v35;
    double v38 = v37;
    [v75 insets];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    v47 = [v75 visibleBoundsObservers];
    v48 = [v75 info];
    v49 = [v75 anchorSet];
    id v50 = [*location layoutDirection];
    v51 = [v75 matchingSectionUUID];
    v52 = [v75 matchingSectionUID];
    v53 = -[TUIRenderModelCollection initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:](v33, "initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:", v34, v77, v47, v48, v49, v50, v36, v38, v40, v42, v44, v46, v51, v52);
  }
  else
  {
    v53 = (TUIRenderModelCollection *)v75;
  }
  v54 = [[TUIRenderUpdateCollection alloc] initWithFrom:v74 to:v53 viewState:v73 updates:v79 changes:v82 layoutQueue:v83->_layoutQueue flags:a5];
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x3032000000;
  v104 = sub_987BC;
  v105 = sub_987CC;
  id v106 = 0;
  accessQueue = v83->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_99B50;
  block[3] = &unk_254418;
  v100 = &v101;
  block[4] = v83;
  id v56 = v75;
  id v96 = v56;
  v57 = v53;
  v97 = v57;
  v58 = v54;
  v98 = v58;
  id v59 = v76;
  id v99 = v59;
  dispatch_sync(accessQueue, block);
  if (v102[5])
  {
    v60 = +[TUIResourceCollector createImageResourceCollectorForLoaded];
    long long v61 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v94[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v94[1] = v61;
    v94[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(TUIRenderModelCollection *)v57 appendResourcesToCollector:v60 transform:v94];
    v62 = [v60 imageResources];
    v63 = [v62 setRepresentation];

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v64 = v63;
    id v65 = [v64 countByEnumeratingWithState:&v90 objects:v112 count:16];
    if (v65)
    {
      uint64_t v66 = *(void *)v91;
      do
      {
        for (j = 0; j != v65; j = (char *)j + 1)
        {
          if (*(void *)v91 != v66) {
            objc_enumerationMutation(v64);
          }
          [*(id *)(*((void *)&v90 + 1) + 8 * (void)j) pauseUnload];
        }
        id v65 = [v64 countByEnumeratingWithState:&v90 objects:v112 count:16];
      }
      while (v65);
    }

    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_99C20;
    v84[3] = &unk_254440;
    v89 = &v101;
    v85 = v58;
    v86 = v83;
    id v87 = v59;
    id v68 = v64;
    id v88 = v68;
    [v71 appendUpdateBlock:v84];
  }
  _Block_object_dispose(&v101, 8);
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (TUIRenderUpdateCollectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUIRenderUpdateCollectionControllerDelegate *)WeakRetained;
}

- (TUIRenderModelCollection)currentModel
{
  return self->_currentModel;
}

- (TUIRenderModelCollection)model
{
  return self->_model;
}

- (TUIHostingMap)currentHostingMap
{
  return self->_currentHostingMap;
}

- (NSMutableDictionary)sectionTrackers
{
  return self->_sectionTrackers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTrackers, 0);
  objc_storeStrong((id *)&self->_currentHostingMap, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_currentModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_initialHostingMap, 0);
  objc_storeStrong(&self->_initialUpdateBlock, 0);
  objc_storeStrong((id *)&self->_initialUpdate, 0);

  objc_storeStrong((id *)&self->_initialInterests, 0);
}

@end