@interface TSDCanvasSubviewsController
- (NSSet)repChildViews;
- (TSDCanvasSubviewsController)initWithLayerAndSubviewHost:(id)a3;
- (id)p_topLevelReps;
- (id)updateAlternateLayersForViews;
- (void)addSubviews:(id)a3;
- (void)dealloc;
- (void)p_recursivelyFindAlternateLayersForRep:(id)a3 accumulatingLayers:(id)a4 repsByChildLayer:(id)a5;
- (void)p_recursivelyFindChildViewsForRep:(id)a3 accumulatingViews:(id)a4 accumulatingRepsByChildView:(id)a5;
- (void)p_recursivelyFindHostingRepsForRep:(id)a3 accumulatingHostingReps:(id)a4;
- (void)p_sortLayers:(id)a3;
- (void)p_sortSubviews:(id)a3;
- (void)removeSubviews:(id)a3;
- (void)setNeedsLayout;
- (void)syncPerformBlock:(id)a3;
- (void)teardown;
- (void)updateTopLevelLayersForTiling:(id)a3;
- (void)updateViewsFromReps;
@end

@implementation TSDCanvasSubviewsController

- (TSDCanvasSubviewsController)initWithLayerAndSubviewHost:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)TSDCanvasSubviewsController;
  v4 = [(TSDCanvasSubviewsController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_host = (TSDLayerAndSubviewHosting *)a3;
    v4->_subviewLayers = (NSMutableArray *)objc_opt_new();
    v8.__sig = 0;
    *(void *)v8.__opaque = 0;
    pthread_mutexattr_init(&v8);
    pthread_mutexattr_settype(&v8, 2);
    pthread_mutex_init(&v5->_mutex, &v8);
    pthread_mutexattr_destroy(&v8);
  }
  return v5;
}

- (void)dealloc
{
  if (!self->_hasBeenTornDown)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDCanvasSubviewsController dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasSubviewsController.m"), 80, @"Canvas Subviews Controller should have been torn down before dealloc");
  }

  self->_repChildViews = 0;
  self->_repsByChildView = 0;

  self->_alternateLayersForViews = 0;
  self->_repViewControllersByChildView = 0;

  self->_subviewLayers = 0;
  pthread_mutex_destroy(&self->_mutex);
  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasSubviewsController;
  [(TSDCanvasSubviewsController *)&v5 dealloc];
}

- (void)teardown
{
  self->_hasBeenTornDown = 1;
  [(TSDCanvasSubviewsController *)self updateViewsFromReps];
}

- (id)p_topLevelReps
{
  if (self->_hasBeenTornDown) {
    return 0;
  }
  else {
    return (id)[(TSDLayerAndSubviewHosting *)self->_host topLevelReps];
  }
}

- (void)setNeedsLayout
{
  self->_needsLayout = 1;
}

- (void)p_recursivelyFindAlternateLayersForRep:(id)a3 accumulatingLayers:(id)a4 repsByChildLayer:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  objc_opt_class();
  v20 = &unk_26D78AB80;
  uint64_t v8 = TSUClassAndProtocolCast();
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    if (objc_opt_respondsToSelector())
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      objc_msgSend(v9, "addAlternateLayersForChildViewsToArray:", v10, &unk_26D78AB80);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            [a5 setObject:v9 forUncopiedKey:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v12);
      }
      [a4 addObjectsFromArray:v10];
    }
    if (!TSUProtocolCast())
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v15 = (void *)[v9 childReps];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v15);
            }
            -[TSDCanvasSubviewsController p_recursivelyFindAlternateLayersForRep:accumulatingLayers:repsByChildLayer:](self, "p_recursivelyFindAlternateLayersForRep:accumulatingLayers:repsByChildLayer:", *(void *)(*((void *)&v21 + 1) + 8 * j), a4, a5, v20);
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v17);
      }
    }
  }
}

- (id)updateAlternateLayersForViews
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = (void *)[MEMORY[0x263EFF980] array];
  id v4 = objc_alloc_init(MEMORY[0x263F7C8C8]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [(TSDCanvasSubviewsController *)self p_topLevelReps];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        [(TSDCanvasSubviewsController *)self p_recursivelyFindAlternateLayersForRep:*(void *)(*((void *)&v24 + 1) + 8 * i) accumulatingLayers:v3 repsByChildLayer:v4];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v3);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        v15 = (void *)[v4 objectForKey:v14];
        char v16 = objc_opt_respondsToSelector();
        double v17 = 1.0;
        if (v16)
        {
          int v18 = objc_msgSend(v15, "positionForChildViewAlternateLayer:", v14, 1.0);
          double v17 = 2.0;
          switch(v18)
          {
            case 0:
              goto LABEL_18;
            case 1:
              double v17 = 0.0;
              goto LABEL_18;
            case 2:
              double v17 = 1.0;
              goto LABEL_18;
            case 3:
              double v17 = -1.0;
              goto LABEL_18;
            default:
              continue;
          }
        }
        else
        {
LABEL_18:
          [v14 setZPosition:v17];
        }
      }
      uint64_t v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16, v17);
    }
    while (v11);
  }
  [(TSDCanvasSubviewsController *)self p_sortLayers:v3];

  self->_alternateLayersForViews = (NSArray *)v3;
  return v3;
}

- (void)p_recursivelyFindChildViewsForRep:(id)a3 accumulatingViews:(id)a4 accumulatingRepsByChildView:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  objc_opt_class();
  long long v23 = &unk_26D78AB80;
  uint64_t v8 = TSUClassAndProtocolCast();
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    if (objc_opt_respondsToSelector())
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      objc_msgSend(v9, "addChildViewsToArray:", v10, &unk_26D78AB80);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v10);
            }
            [a5 setObject:v9 forUncopiedKey:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v12);
      }
      [a4 addObjectsFromArray:v10];
    }
    v15 = (void *)TSUProtocolCast();
    if (v15)
    {
      id v16 = (id)[v15 layerAndSubviewHost];
      id v17 = (id)[v16 subviewsController];
      objc_msgSend((id)objc_msgSend(v16, "subviewsController"), "updateViewsFromReps");
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      int v18 = (void *)[v9 childReps];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v25 != v21) {
              objc_enumerationMutation(v18);
            }
            -[TSDCanvasSubviewsController p_recursivelyFindChildViewsForRep:accumulatingViews:accumulatingRepsByChildView:](self, "p_recursivelyFindChildViewsForRep:accumulatingViews:accumulatingRepsByChildView:", *(void *)(*((void *)&v24 + 1) + 8 * j), a4, a5, v23);
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v20);
      }
    }
  }
}

- (void)p_recursivelyFindHostingRepsForRep:(id)a3 accumulatingHostingReps:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_opt_class();
  uint64_t v7 = TSUClassAndProtocolCast();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    if ((objc_msgSend(a3, "hasBeenRemoved", &unk_26D78AB80) & 1) == 0)
    {
      uint64_t v9 = TSUProtocolCast();
      if (v9)
      {
        [a4 addObject:v9];
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v10 = (void *)[v8 childReps];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [(TSDCanvasSubviewsController *)self p_recursivelyFindHostingRepsForRep:*(void *)(*((void *)&v15 + 1) + 8 * i) accumulatingHostingReps:a4];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v12);
        }
      }
    }
  }
}

- (void)p_sortLayers:(id)a3
{
}

uint64_t __44__TSDCanvasSubviewsController_p_sortLayers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  [a2 zPosition];
  double v6 = v5;
  [a3 zPosition];
  if (v6 > v7) {
    return 1;
  }
  [a2 zPosition];
  double v10 = v9;
  [a3 zPosition];
  if (v10 >= v11) {
    return 0;
  }
  else {
    return -1;
  }
}

- (void)p_sortSubviews:(id)a3
{
}

uint64_t __46__TSDCanvasSubviewsController_p_sortSubviews___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_msgSend((id)objc_msgSend(a2, "layer"), "zPosition");
  double v6 = v5;
  objc_msgSend((id)objc_msgSend(a3, "layer"), "zPosition");
  if (v6 > v7) {
    return 1;
  }
  objc_msgSend((id)objc_msgSend(a2, "layer"), "zPosition");
  double v10 = v9;
  objc_msgSend((id)objc_msgSend(a3, "layer"), "zPosition");
  if (v10 >= v11) {
    return 0;
  }
  else {
    return -1;
  }
}

- (void)updateViewsFromReps
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x263F7C8C8]);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v5 = [(TSDCanvasSubviewsController *)self p_topLevelReps];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v68 != v8) {
          objc_enumerationMutation(v5);
        }
        [(TSDCanvasSubviewsController *)self p_recursivelyFindChildViewsForRep:*(void *)(*((void *)&v67 + 1) + 8 * i) accumulatingViews:v3 accumulatingRepsByChildView:v4];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v67 objects:v75 count:16];
    }
    while (v7);
  }
  if (![(NSDictionary *)v4 count])
  {

    id v4 = 0;
  }
  if ([v3 count]) {
    double v10 = (NSSet *)[objc_alloc(MEMORY[0x263F7C8D0]) initWithArray:v3];
  }
  else {
    double v10 = 0;
  }
  v49 = (void *)[(TSDLayerAndSubviewHosting *)self->_host containerView];
  v48 = (void *)[(TSDLayerAndSubviewHosting *)self->_host containerViewController];
  v50 = v10;
  BOOL v11 = [(NSSet *)v10 isSubsetOfSet:self->_repChildViews];
  BOOL needsLayout = self->_needsLayout;
  self->_BOOL needsLayout = 0;
  obuint64_t j = v3;
  if (!v11 || needsLayout)
  {
    id v47 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v13 = [v3 countByEnumeratingWithState:&v63 objects:v74 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v46 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v64 != v46) {
            objc_enumerationMutation(obj);
          }
          long long v16 = *(void **)(*((void *)&v63 + 1) + 8 * j);
          id v17 = -[NSDictionary objectForKey:](v4, "objectForKey:", v16, obj);
          if (objc_opt_respondsToSelector()) {
            [v17 willAddChildView:v16 toView:v49];
          }
          if (objc_opt_respondsToSelector()) {
            char v18 = [v17 containerManagesChildView];
          }
          else {
            char v18 = 0;
          }
          double v19 = 1.0;
          if (objc_opt_respondsToSelector())
          {
            double v19 = 2.0;
            switch([v17 positionForChildView:v16])
            {
              case 0u:
                goto LABEL_30;
              case 1u:
                double v19 = 0.0;
                goto LABEL_30;
              case 2u:
                double v19 = 1.0;
                goto LABEL_30;
              case 3u:
                double v19 = -1.0;
                goto LABEL_30;
              default:
                break;
            }
          }
          else
          {
LABEL_30:
            objc_msgSend((id)objc_msgSend(v16, "layer"), "setZPosition:", v19);
          }
          if ((v18 & 1) == 0) {
            [v47 addObject:v16];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v63 objects:v74 count:16];
      }
      while (v14);
    }
    -[TSDCanvasSubviewsController p_sortSubviews:](self, "p_sortSubviews:", v47, obj);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v20 = [v47 countByEnumeratingWithState:&v59 objects:v73 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v60;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v60 != v22) {
            objc_enumerationMutation(v47);
          }
          uint64_t v24 = *(void *)(*((void *)&v59 + 1) + 8 * k);
          if (v48)
          {
            id v25 = [(NSDictionary *)v4 objectForKey:*(void *)(*((void *)&v59 + 1) + 8 * k)];
            if (objc_opt_respondsToSelector())
            {
              uint64_t v26 = [v25 viewControllerForView:v24];
              if (v26 && v26 != (void)v48)
              {
                uint64_t v28 = v26;
                [v48 addChildViewController:v26];
                repViewControllersByChildView = self->_repViewControllersByChildView;
                if (!repViewControllersByChildView)
                {
                  repViewControllersByChildView = (TSURetainedPointerKeyDictionary *)objc_alloc_init(MEMORY[0x263F7C8C8]);
                  self->_repViewControllersByChildView = repViewControllersByChildView;
                }
                [(TSURetainedPointerKeyDictionary *)repViewControllersByChildView setObject:v28 forUncopiedKey:v24];
              }
            }
          }
          [v49 addSubview:v24];
        }
        uint64_t v21 = [v47 countByEnumeratingWithState:&v59 objects:v73 count:16];
      }
      while (v21);
    }
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  repChildViews = self->_repChildViews;
  uint64_t v31 = -[NSSet countByEnumeratingWithState:objects:count:](repChildViews, "countByEnumeratingWithState:objects:count:", &v55, v72, 16, obj);
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v56;
    do
    {
      for (uint64_t m = 0; m != v32; ++m)
      {
        if (*(void *)v56 != v33) {
          objc_enumerationMutation(repChildViews);
        }
        v35 = *(void **)(*((void *)&v55 + 1) + 8 * m);
        if (![(NSSet *)v50 containsObject:v35])
        {
          id v36 = [(NSDictionary *)self->_repsByChildView objectForKey:v35];
          if (objc_opt_respondsToSelector()) {
            [v36 willRemoveChildView:v35];
          }
          if ((objc_opt_respondsToSelector() & 1) == 0 || ([v36 containerManagesChildView] & 1) == 0)
          {
            v37 = (void *)[(TSURetainedPointerKeyDictionary *)self->_repViewControllersByChildView objectForKey:v35];
            if (v37)
            {
              [v37 removeFromParentViewController];
              [(TSURetainedPointerKeyDictionary *)self->_repViewControllersByChildView removeObjectForKey:v35];
            }
            [v35 removeFromSuperview];
          }
        }
      }
      uint64_t v32 = [(NSSet *)repChildViews countByEnumeratingWithState:&v55 objects:v72 count:16];
    }
    while (v32);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v38 = [(NSSet *)v50 countByEnumeratingWithState:&v51 objects:v71 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v52;
    do
    {
      for (uint64_t n = 0; n != v39; ++n)
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(v50);
        }
        uint64_t v42 = *(void *)(*((void *)&v51 + 1) + 8 * n);
        if (![(NSSet *)self->_repChildViews containsObject:v42])
        {
          id v43 = [(NSDictionary *)v4 objectForKey:v42];
          if (objc_opt_respondsToSelector()) {
            [v43 didAddChildView:v42];
          }
        }
      }
      uint64_t v39 = [(NSSet *)v50 countByEnumeratingWithState:&v51 objects:v71 count:16];
    }
    while (v39);
  }

  self->_repChildViews = v50;
  self->_repsByChildView = v4;
}

- (void)syncPerformBlock:(id)a3
{
  if (a3)
  {
    p_mutex = &self->_mutex;
    pthread_mutex_lock(&self->_mutex);
    (*((void (**)(id))a3 + 2))(a3);
    pthread_mutex_unlock(p_mutex);
  }
}

- (void)updateTopLevelLayersForTiling:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = [(TSDCanvasSubviewsController *)self p_topLevelReps];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        [(TSDCanvasSubviewsController *)self p_recursivelyFindHostingRepsForRep:*(void *)(*((void *)&v30 + 1) + 8 * v10++) accumulatingHostingReps:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v8);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v5);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * v14) layerAndSubviewHost];
        if (v15) {
          objc_msgSend(a3, "addObject:", objc_msgSend(v15, "topLevelTilingLayer"));
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v12);
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __61__TSDCanvasSubviewsController_updateTopLevelLayersForTiling___block_invoke;
  v25[3] = &unk_2646B0750;
  v25[4] = self;
  v25[5] = a3;
  [(TSDCanvasSubviewsController *)self syncPerformBlock:v25];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  alternateLayersForViews = self->_alternateLayersForViews;
  uint64_t v17 = [(NSArray *)alternateLayersForViews countByEnumeratingWithState:&v21 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(alternateLayersForViews);
        }
        [a3 removeObject:*(void *)(*((void *)&v21 + 1) + 8 * v20++)];
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)alternateLayersForViews countByEnumeratingWithState:&v21 objects:v34 count:16];
    }
    while (v18);
  }
}

uint64_t __61__TSDCanvasSubviewsController_updateTopLevelLayersForTiling___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) removeObject:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)addSubviews:(id)a3
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDCanvasSubviewsController addSubviews:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasSubviewsController.m"), 498, @"This operation must only be performed on the main thread.");
  }
  uint64_t v7 = [(TSDLayerAndSubviewHosting *)self->_host containerView];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__TSDCanvasSubviewsController_addSubviews___block_invoke;
  v8[3] = &unk_2646B0C38;
  v8[4] = v7;
  v8[5] = a3;
  v8[6] = self;
  [(TSDCanvasSubviewsController *)self syncPerformBlock:v8];
}

void __43__TSDCanvasSubviewsController_addSubviews___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "subviews"), "mutableCopy");
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v2, "tsu_containsObjectIdenticalTo:", v8) & 1) == 0) {
          [v2 addObject:v8];
        }
        uint64_t v9 = [v8 layer];
        if (v9)
        {
          uint64_t v10 = v9;
          if ((objc_msgSend(*(id *)(*(void *)(a1 + 48) + 48), "tsu_containsObjectIdenticalTo:", v9) & 1) == 0) {
            [*(id *)(*(void *)(a1 + 48) + 48) addObject:v10];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 48), "p_sortSubviews:", v2);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v11 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 32) addSubview:*(void *)(*((void *)&v15 + 1) + 8 * j)];
      }
      uint64_t v12 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)removeSubviews:(id)a3
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDCanvasSubviewsController removeSubviews:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasSubviewsController.m"), 533, @"This operation must only be performed on the main thread.");
  }
  uint64_t v7 = [(TSDLayerAndSubviewHosting *)self->_host containerView];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__TSDCanvasSubviewsController_removeSubviews___block_invoke;
  v8[3] = &unk_2646B0C38;
  v8[4] = a3;
  v8[5] = v7;
  v8[6] = self;
  [(TSDCanvasSubviewsController *)self syncPerformBlock:v8];
}

uint64_t __46__TSDCanvasSubviewsController_removeSubviews___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = (void *)a1[4];
  uint64_t result = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        if ([v7 superview] && objc_msgSend(v7, "superview") != a1[5])
        {
          long long v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v9 = [NSString stringWithUTF8String:"-[TSDCanvasSubviewsController removeSubviews:]_block_invoke"];
          objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasSubviewsController.m"), 538, @"removing view %@ from %@; but superview is %@",
            v7,
            a1[5],
            [v7 superview]);
        }
        [v7 removeFromSuperview];
        uint64_t v10 = [v7 layer];
        if (v10) {
          [*(id *)(a1[6] + 48) removeObject:v10];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (NSSet)repChildViews
{
  return self->_repChildViews;
}

@end