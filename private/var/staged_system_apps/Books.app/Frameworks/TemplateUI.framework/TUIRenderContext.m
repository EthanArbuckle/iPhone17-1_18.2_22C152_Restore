@interface TUIRenderContext
- (BOOL)debugVisualLayout;
- (NSDictionary)previousEmbeddedIdentifierMaps;
- (NSDictionary)previousEmbeddedUUIDMap;
- (NSDictionary)previousEmbeddedUpdateControllerMap;
- (NSString)uid;
- (NSUUID)UUID;
- (OS_dispatch_queue)layoutQueue;
- (TUIEnvironment)environment;
- (TUIFeedEntry)entry;
- (TUILiveTransform)currentLiveTransform;
- (TUIManager)manager;
- (TUIPointer)currentPointer;
- (TUIRenderContext)init;
- (TUIRenderContext)initWithIdentifierMap:(id)a3 embeddedIdentifierMaps:(id)a4 embeddedUpdateControllerMap:(id)a5 embeddedUUIDMap:(id)a6 environment:(id)a7 uid:(id)a8 UUID:(id)a9 entry:(id)a10 layoutQueue:(id)a11 renderMode:(unint64_t)a12;
- (TUIRenderModelIdentifierMap)identifierMap;
- (TUITransactionGroup)transactionGroup;
- (double)contentsScale;
- (double)width;
- (id)_convertDrawModel:(id)a3 toKind:(unint64_t)a4;
- (id)_convertLayerModel:(id)a3 toKind:(unint64_t)a4;
- (id)_convertModel:(id)a3 toKind:(unint64_t)a4;
- (id)embeddedIdentifierMapForIdentifier:(id)a3;
- (id)embeddedUUIDForIdentifier:(id)a3;
- (id)embeddedUpdateControllerForIdentifier:(id)a3 renderModel:(id)a4;
- (id)renderModelConvertModels:(id)a3 toKind:(unint64_t)a4;
- (id)renderModelForContainerLayout:(id)a3 kind:(unint64_t)a4;
- (id)renderModelForLayout:(id)a3 kind:(unint64_t)a4;
- (id)renderModelForLayout:(id)a3 submodels:(id)a4 kind:(unint64_t)a5;
- (unint64_t)_renderModelChildKind:(unint64_t)a3;
- (unint64_t)layoutDirection;
- (unint64_t)renderMode;
- (void)evaluateWithIdentifierMap:(id)a3 block:(id)a4;
- (void)evaluateWithLiveTransform:(id)a3 block:(id)a4;
- (void)evaluateWithPointer:(id)a3 block:(id)a4;
- (void)evaluateWithWidth:(double)a3 layoutDirection:(unint64_t)a4 block:(id)a5;
- (void)setCurrentLiveTransform:(id)a3;
- (void)setEntry:(id)a3;
- (void)setManager:(id)a3;
- (void)setTransactionGroup:(id)a3;
@end

@implementation TUIRenderContext

- (TUIRenderContext)init
{
  return [(TUIRenderContext *)self initWithIdentifierMap:0 embeddedIdentifierMaps:0 embeddedUpdateControllerMap:0 embeddedUUIDMap:0 environment:0 uid:0 UUID:0 entry:0 layoutQueue:0 renderMode:0];
}

- (TUIRenderContext)initWithIdentifierMap:(id)a3 embeddedIdentifierMaps:(id)a4 embeddedUpdateControllerMap:(id)a5 embeddedUUIDMap:(id)a6 environment:(id)a7 uid:(id)a8 UUID:(id)a9 entry:(id)a10 layoutQueue:(id)a11 renderMode:(unint64_t)a12
{
  id v48 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v47 = a7;
  id v22 = a8;
  id v23 = a9;
  id v46 = a10;
  id v45 = a11;
  v49.receiver = self;
  v49.super_class = (Class)TUIRenderContext;
  v24 = [(TUIRenderContext *)&v49 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_identifierMap, a3);
    v26 = (NSDictionary *)[v19 copy];
    previousEmbeddedIdentifierMaps = v25->_previousEmbeddedIdentifierMaps;
    v25->_previousEmbeddedIdentifierMaps = v26;

    v28 = (NSDictionary *)[v20 copy];
    previousEmbeddedUpdateControllerMap = v25->_previousEmbeddedUpdateControllerMap;
    v25->_previousEmbeddedUpdateControllerMap = v28;

    v30 = (NSDictionary *)[v21 copy];
    previousEmbeddedUUIDMap = v25->_previousEmbeddedUUIDMap;
    v25->_previousEmbeddedUUIDMap = v30;

    objc_storeStrong((id *)&v25->_layoutQueue, a11);
    objc_storeStrong((id *)&v25->_environment, a7);
    environment = v25->_environment;
    if (environment)
    {
      [(TUIEnvironment *)environment contentsScale];
      v33 = v25->_environment;
      v25->_contentsScale = v34;
      if (v33)
      {
        [(TUIEnvironment *)v33 viewSize];
        v35 = v25->_environment;
        v25->_width = v36;
        if (v35)
        {
          unint64_t v37 = [(TUIEnvironment *)v35 layoutDirection];
LABEL_9:
          v25->_layoutDirection = v37;
          currentLiveTransform = v25->_currentLiveTransform;
          v25->_currentLiveTransform = 0;

          v39 = (NSString *)[v22 copy];
          uid = v25->_uid;
          v25->_uid = v39;

          v41 = (NSUUID *)[v23 copy];
          UUID = v25->_UUID;
          v25->_UUID = v41;

          objc_storeStrong((id *)&v25->_entry, a10);
          v25->_renderMode = a12;
          v43 = +[NSUserDefaults standardUserDefaults];
          v25->_debugVisualLayout = [v43 BOOLForKey:@"TUIDebugVisualLayout"];

          goto LABEL_10;
        }
LABEL_8:
        unint64_t v37 = 1;
        goto LABEL_9;
      }
    }
    else
    {
      v25->_contentsScale = 2.0;
    }
    v25->_width = 0.0;
    goto LABEL_8;
  }
LABEL_10:

  return v25;
}

- (unint64_t)_renderModelChildKind:(unint64_t)a3
{
  unint64_t v3 = a3 - 2;
  if (a3 - 2 < 8 && ((0xB1u >> v3) & 1) != 0) {
    return qword_243BB0[v3];
  }
  if (a3 == 5) {
    return 6;
  }
  return a3;
}

- (id)renderModelForLayout:(id)a3 kind:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(TUIRenderContext *)self _renderModelChildKind:a4];
  v8 = objc_opt_new();
  [v6 computedNaturalSize];
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, v9 * 0.5, v10 * 0.5);
  CGAffineTransform v13 = v14;
  [v6 appendRenderModelCompatibleWithKind:v7 context:self transform:&v13 toModels:v8];
  v11 = [(TUIRenderContext *)self renderModelForLayout:v6 submodels:v8 kind:a4];

  return v11;
}

- (id)renderModelForContainerLayout:(id)a3 kind:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(TUIRenderContext *)self _renderModelChildKind:a4];
  v8 = objc_opt_new();
  [v6 computedNaturalSize];
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, v9 * 0.5, v10 * 0.5);
  CGAffineTransform v13 = v14;
  [v6 appendChildRenderModelCompatibleWithKind:v7 context:self transform:&v13 toModels:v8];
  v11 = [(TUIRenderContext *)self renderModelForLayout:v6 submodels:v8 kind:a4];

  return v11;
}

- (id)renderModelConvertModels:(id)a3 toKind:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        CGAffineTransform v13 = -[TUIRenderContext _convertModel:toKind:](self, "_convertModel:toKind:", *(void *)(*((void *)&v15 + 1) + 8 * i), a4, (void)v15);
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)renderModelForLayout:(id)a3 submodels:(id)a4 kind:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(TUIRenderContext *)self renderModelConvertModels:v9 toKind:[(TUIRenderContext *)self _renderModelChildKind:a5]];

  uint64_t v11 = 0;
  switch(a5)
  {
    case 2uLL:
      v12 = TUIRenderModelImage;
      goto LABEL_6;
    case 3uLL:
      CGAffineTransform v13 = -[TUIContainerLayerConfig initWithSize:]([TUIContainerLayerConfig alloc], "initWithSize:", CGSizeZero.width, CGSizeZero.height);
      uint64_t v11 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", v10, v13, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
      goto LABEL_8;
    case 5uLL:
      CGAffineTransform v14 = (TUIRenderModelAuxiliary *)[v8 newRenderModelCompatibleWithKind:5 context:self];
      goto LABEL_10;
    case 6uLL:
      v12 = TUIRenderModelSubviews;
LABEL_6:
      CGAffineTransform v14 = (TUIRenderModelAuxiliary *)[[v12 alloc] initWithSubmodels:v10];
      goto LABEL_10;
    case 7uLL:
      CGAffineTransform v13 = objc_alloc_init(TUILayoutRenderModelCollector);
      [(TUIContainerLayerConfig *)v13 collectWithRoot:v8 options:6 entryUUID:self->_UUID];
      long long v15 = [(TUIContainerLayerConfig *)v13 finalizeImpressions];
      long long v16 = [(TUIContainerLayerConfig *)v13 finalizeLinkEntities];
      long long v17 = objc_opt_new();
      [v8 appendHoverRegions:v17 relativeToLayout:v8];
      memset(&v30[1], 0, 7);
      BOOL v18 = self->_layoutDirection == 2;
      double width = self->_width;
      id v20 = [v8 computeZIndexWithDefault:0];
      id v21 = [TUIRenderModelSection alloc];
      entry = self->_entry;
      identifierMap = self->_identifierMap;
      layoutQueue = self->_layoutQueue;
      v30[0] = v18;
      double v31 = width;
      id v32 = v20;
      uint64_t v11 = [(TUIRenderModelSection *)v21 initWithEntry:entry submodels:v10 config:v30 impressions:v15 linkEntities:v16 hoverRegions:v17 identifierMap:identifierMap layoutQueue:layoutQueue];

LABEL_8:
      break;
    case 9uLL:
      CGAffineTransform v14 = [[TUIRenderModelAuxiliary alloc] initWithNavigationItems:v10];
LABEL_10:
      uint64_t v11 = (TUIRenderModelLayer *)v14;
      break;
    default:
      break;
  }
  [v8 computedTransformedSize];
  [(TUIRenderModelLayer *)v11 setSize:TUISizeRoundedForScale(v25, v26, self->_contentsScale)];
  v27 = [v8 box];
  v28 = [v27 identifier];
  [(TUIRenderModelLayer *)v11 setIdentifier:v28];

  return v11;
}

- (id)_convertDrawModel:(id)a3 toKind:(unint64_t)a4
{
  id v6 = (TUIRenderModelImage *)a3;
  unint64_t v7 = v6;
  if (a4 == 2)
  {
    id v8 = [TUIRenderModelImage alloc];
    BOOL v18 = v7;
    id v9 = +[NSArray arrayWithObjects:&v18 count:1];
    id v10 = [(TUIRenderModelImage *)v8 initWithSubmodels:v9];
  }
  else
  {
    uint64_t v11 = v6;
    if (a4 < 3) {
      goto LABEL_7;
    }
    v12 = [_TUIDrawLayerConfig alloc];
    CGAffineTransform v13 = [(TUIRenderModelImage *)v7 draw];
    id v9 = [(_TUIDrawLayerConfig *)v12 initWithDraw:v13 contentsScale:self->_renderMode renderMode:self->_contentsScale];

    CGAffineTransform v14 = [TUIRenderModelLayer alloc];
    [(TUIRenderModelImage *)v7 eraseableInsets];
    id v10 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:](v14, "initWithSubmodels:config:erasableInsets:", 0, v9);
  }
  long long v15 = v10;

  uint64_t v11 = v7;
  if (v15 != v7)
  {
    [(TUIRenderModelImage *)v7 size];
    -[TUIRenderModelImage setSize:](v15, "setSize:");
    long long v16 = [(TUIRenderModelImage *)v7 identifier];
    [(TUIRenderModelImage *)v15 setIdentifier:v16];

    uint64_t v11 = v15;
  }
LABEL_7:

  return v11;
}

- (id)_convertLayerModel:(id)a3 toKind:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  unint64_t v7 = v5;
  if (a4 >= 4)
  {
    id v8 = [v5 identifier];
    id v9 = +[TUILayerContainerView renderModelWithLayerModel:v6 identifier:v8];

    unint64_t v7 = v6;
    if (v9 != v6)
    {
      [v6 size];
      [v9 setSize:];
      unint64_t v7 = v9;
    }
  }

  return v7;
}

- (id)_convertModel:(id)a3 toKind:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if ((unint64_t)[v6 kind] < a4)
  {
    unint64_t v7 = v6;
    if ([v6 kind] == (char *)&def_141F14 + 1)
    {
      unint64_t v7 = [(TUIRenderContext *)self _convertDrawModel:v6 toKind:a4];
    }
  }
  if ((unint64_t)[v7 kind] < a4 && objc_msgSend(v7, "kind") == (char *)&def_141F14 + 3)
  {
    uint64_t v8 = [(TUIRenderContext *)self _convertLayerModel:v7 toKind:a4];

    unint64_t v7 = (void *)v8;
  }

  return v7;
}

- (void)evaluateWithIdentifierMap:(id)a3 block:(id)a4
{
  id v7 = a3;
  if (v7 && a4)
  {
    identifierMap = self->_identifierMap;
    p_identifierMap = &self->_identifierMap;
    id v13 = v7;
    id v10 = identifierMap;
    objc_storeStrong((id *)p_identifierMap, a3);
    uint64_t v11 = (void (**)(void))a4;
    v11[2]();

    v12 = *p_identifierMap;
    *p_identifierMap = v10;

    id v7 = v13;
  }
}

- (void)evaluateWithWidth:(double)a3 layoutDirection:(unint64_t)a4 block:(id)a5
{
  if (a5)
  {
    double width = self->_width;
    unint64_t layoutDirection = self->_layoutDirection;
    self->_double width = a3;
    self->_unint64_t layoutDirection = a4;
    (*((void (**)(id, SEL))a5 + 2))(a5, a2);
    self->_double width = width;
    self->_unint64_t layoutDirection = layoutDirection;
  }
}

- (void)evaluateWithLiveTransform:(id)a3 block:(id)a4
{
  id v7 = a3;
  if (v7 && a4)
  {
    currentLiveTransform = self->_currentLiveTransform;
    p_currentLiveTransform = &self->_currentLiveTransform;
    id v13 = v7;
    id v10 = currentLiveTransform;
    objc_storeStrong((id *)p_currentLiveTransform, a3);
    uint64_t v11 = (void (**)(void))a4;
    v11[2]();

    v12 = *p_currentLiveTransform;
    *p_currentLiveTransform = v10;

    id v7 = v13;
  }
}

- (void)evaluateWithPointer:(id)a3 block:(id)a4
{
  id v7 = a3;
  if (a4)
  {
    currentPointer = self->_currentPointer;
    p_currentPointer = &self->_currentPointer;
    id v13 = v7;
    id v10 = currentPointer;
    objc_storeStrong((id *)p_currentPointer, a3);
    uint64_t v11 = (void (**)(void))a4;
    v11[2]();

    v12 = *p_currentPointer;
    *p_currentPointer = v10;

    id v7 = v13;
  }
}

- (id)embeddedIdentifierMapForIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(NSDictionary *)self->_previousEmbeddedIdentifierMaps objectForKeyedSubscript:v4],
        (id v5 = (TUIRenderModelIdentifierMap *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = objc_alloc_init(TUIRenderModelIdentifierMap);
  }

  return v5;
}

- (id)embeddedUUIDForIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(NSDictionary *)self->_previousEmbeddedUUIDMap objectForKeyedSubscript:v4],
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = +[NSUUID UUID];
  }

  return v5;
}

- (id)embeddedUpdateControllerForIdentifier:(id)a3 renderModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && ([(NSDictionary *)self->_previousEmbeddedUpdateControllerMap objectForKeyedSubscript:v6], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = (TUIRenderUpdateCollectionController *)v8;
    if (v7)
    {
      id v10 = [(TUIRenderContext *)self transactionGroup];
      [(TUIRenderUpdateCollectionController *)v9 updateWithRenderModel:v7 viewState:0 flags:0 transactionGroup:v10];
    }
  }
  else
  {
    id v9 = [[TUIRenderUpdateCollectionController alloc] initWithLayoutQueue:self->_layoutQueue renderModel:v7];
  }

  return v9;
}

- (TUIEnvironment)environment
{
  return self->_environment;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (double)width
{
  return self->_width;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (TUIManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (TUIRenderModelIdentifierMap)identifierMap
{
  return self->_identifierMap;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (TUITransactionGroup)transactionGroup
{
  return self->_transactionGroup;
}

- (void)setTransactionGroup:(id)a3
{
}

- (TUILiveTransform)currentLiveTransform
{
  return self->_currentLiveTransform;
}

- (void)setCurrentLiveTransform:(id)a3
{
}

- (TUIPointer)currentPointer
{
  return self->_currentPointer;
}

- (TUIFeedEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
}

- (NSString)uid
{
  return self->_uid;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (BOOL)debugVisualLayout
{
  return self->_debugVisualLayout;
}

- (NSDictionary)previousEmbeddedIdentifierMaps
{
  return self->_previousEmbeddedIdentifierMaps;
}

- (NSDictionary)previousEmbeddedUpdateControllerMap
{
  return self->_previousEmbeddedUpdateControllerMap;
}

- (NSDictionary)previousEmbeddedUUIDMap
{
  return self->_previousEmbeddedUUIDMap;
}

- (unint64_t)renderMode
{
  return self->_renderMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousEmbeddedUUIDMap, 0);
  objc_storeStrong((id *)&self->_previousEmbeddedUpdateControllerMap, 0);
  objc_storeStrong((id *)&self->_previousEmbeddedIdentifierMaps, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_currentPointer, 0);
  objc_storeStrong((id *)&self->_currentLiveTransform, 0);
  objc_storeStrong((id *)&self->_transactionGroup, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end