@interface CRLInteractiveCanvasRepContentUpdater
- (BOOL)isChildWrapperLayer:(id)a3;
- (BOOL)isClonedParentRepLayer:(id)a3;
- (BOOL)isRepContainerLayer:(id)a3;
- (BOOL)isRepContentLayer:(id)a3;
- (CALayerDelegate)layerDelegate;
- (CRLCanvas)canvas;
- (CRLInteractiveCanvasRepContentUpdater)initWithCanvas:(id)a3 layerDelegate:(id)a4;
- (NSArray)repContentPiles;
- (NSOrderedSet)allReps;
- (id)containerRenderablesForRep:(id)a3;
- (id)i_descriptionOfLayerTreeRootedAt:(id)a3;
- (id)i_firstDifferenceBetweenLayerTreeDescription:(id)a3 andDescription:(id)a4;
- (id)i_stringFromLayerDescription:(id)a3;
- (id)p_layerDescriptionFromString:(id)a3;
- (id)renderableForRep:(id)a3;
- (id)repForLayer:(id)a3;
- (void)p_accumulateNonRenderableBackedRepAndDescendants:(id)a3 into:(id)a4;
- (void)p_discardRenderable:(id)a3 forRep:(id)a4;
- (void)p_recursivelyUpdateRenderableForRep:(id)a3 accumulatingRepContentPiles:(id)a4 andReps:(id)a5 suppressLayers:(BOOL)a6 hidingLayersForReps:(id)a7 forcingUpdateOfValidLayers:(BOOL)a8;
- (void)p_updateChildWrapperLayer:(id)a3 forRep:(id)a4 withLayer:(id)a5;
- (void)p_visitLayer:(id)a3 atLevel:(unint64_t)a4 appendTo:(id)a5;
- (void)teardown;
- (void)updateLayerFramesOnlyForReps:(id)a3;
- (void)updateRepContent;
- (void)updateRepContentForcingUpdateOfValidLayers:(BOOL)a3;
@end

@implementation CRLInteractiveCanvasRepContentUpdater

- (CRLInteractiveCanvasRepContentUpdater)initWithCanvas:(id)a3 layerDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CRLInteractiveCanvasRepContentUpdater;
  v9 = [(CRLInteractiveCanvasRepContentUpdater *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_canvas, a3);
    objc_storeWeak((id *)&v10->_layerDelegate, v8);
    v11 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    repRenderablesByRep = v10->_repRenderablesByRep;
    v10->_repRenderablesByRep = v11;

    v13 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:512 capacity:0];
    repsByRepRenderables = v10->_repsByRepRenderables;
    v10->_repsByRepRenderables = v13;

    v15 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:0];
    containerLayersByRep = v10->_containerLayersByRep;
    v10->_containerLayersByRep = v15;

    v17 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:0];
    repsByContainerLayer = v10->_repsByContainerLayer;
    v10->_repsByContainerLayer = v17;

    v19 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:0];
    childWrapperLayersByRep = v10->_childWrapperLayersByRep;
    v10->_childWrapperLayersByRep = v19;

    v21 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:0];
    repsByChildWrapperLayer = v10->_repsByChildWrapperLayer;
    v10->_repsByChildWrapperLayer = v21;

    repContentPiles = v10->_repContentPiles;
    v10->_repContentPiles = (NSArray *)&__NSArray0__struct;

    v24 = (NSOrderedSet *)objc_alloc_init((Class)NSOrderedSet);
    allReps = v10->_allReps;
    v10->_allReps = v24;
  }
  return v10;
}

- (void)teardown
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_repsByRepRenderables;
  id v3 = [(NSMapTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) setDelegate:0 v7];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMapTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)updateRepContent
{
}

- (void)updateRepContentForcingUpdateOfValidLayers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  v6 = (NSOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
  long long v7 = [(NSMapTable *)self->_repRenderablesByRep keyEnumerator];
  long long v8 = [v7 allObjects];

  v34 = [(CRLCanvas *)self->_canvas canvasController];
  uint64_t v9 = [v34 repsToHide];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v10 = [(CRLCanvas *)self->_canvas topLevelReps];
  id v11 = [v10 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v49;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(v10);
        }
        [(CRLInteractiveCanvasRepContentUpdater *)self p_recursivelyUpdateRenderableForRep:*(void *)(*((void *)&v48 + 1) + 8 * i) accumulatingRepContentPiles:v5 andReps:v6 suppressLayers:0 hidingLayersForReps:v9 forcingUpdateOfValidLayers:v3];
      }
      id v12 = [v10 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v12);
  }
  v33 = (void *)v9;
  v36 = v5;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v8;
  id v15 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v45;
    uint64_t v37 = *(void *)v45;
    do
    {
      v18 = 0;
      id v38 = v16;
      do
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v44 + 1) + 8 * (void)v18);
        if (![(NSOrderedSet *)v6 containsObject:v19])
        {
          v20 = v6;
          v21 = [(NSMapTable *)self->_repRenderablesByRep objectForKey:v19];
          v22 = [(NSMapTable *)self->_containerLayersByRep objectForKey:v19];
          v23 = [(NSMapTable *)self->_childWrapperLayersByRep objectForKey:v19];
          [(CRLInteractiveCanvasRepContentUpdater *)self p_discardRenderable:v21 forRep:v19];
          [(NSMapTable *)self->_containerLayersByRep removeObjectForKey:v19];
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v24 = v22;
          id v25 = [v24 countByEnumeratingWithState:&v40 objects:v52 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v41;
            do
            {
              for (j = 0; j != v26; j = (char *)j + 1)
              {
                if (*(void *)v41 != v27) {
                  objc_enumerationMutation(v24);
                }
                [(NSMapTable *)self->_repsByContainerLayer removeObjectForKey:*(void *)(*((void *)&v40 + 1) + 8 * (void)j)];
              }
              id v26 = [v24 countByEnumeratingWithState:&v40 objects:v52 count:16];
            }
            while (v26);
          }

          [(NSMapTable *)self->_childWrapperLayersByRep removeObjectForKey:v19];
          [(NSMapTable *)self->_repsByChildWrapperLayer removeObjectForKey:v23];

          v6 = v20;
          uint64_t v17 = v37;
          id v16 = v38;
        }
        v18 = (char *)v18 + 1;
      }
      while (v18 != v16);
      id v16 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v16);
  }

  if (![(NSArray *)v36 count])
  {
    v29 = objc_alloc_init(CRLInteractiveCanvasRepLayerPile);
    [(NSArray *)v36 addObject:v29];
  }
  repContentPiles = self->_repContentPiles;
  self->_repContentPiles = v36;
  v31 = v36;

  allReps = self->_allReps;
  self->_allReps = v6;
}

- (void)updateLayerFramesOnlyForReps:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v8);
        long long v10 = [(CRLInteractiveCanvasRepContentUpdater *)self renderableForRep:v9];
        if (!v10)
        {
          unsigned int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D81B8);
          }
          id v12 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v25 = v11;
            __int16 v26 = 2082;
            uint64_t v27 = "-[CRLInteractiveCanvasRepContentUpdater updateLayerFramesOnlyForReps:]";
            __int16 v28 = 2082;
            v29 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m";
            __int16 v30 = 1024;
            int v31 = 131;
            __int16 v32 = 2082;
            v33 = "renderable";
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D81D8);
          }
          uint64_t v13 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v18 = v13;
            uint64_t v19 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v25 = v11;
            __int16 v26 = 2114;
            uint64_t v27 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater updateLayerFramesOnlyForReps:]");
          id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 131, 0, "invalid nil value for '%{public}s'", "renderable");
        }
        [v9 willUpdateRenderable:v10];
        [v9 updateRenderableGeometryFromLayout:v10];
        id v16 = [(NSMapTable *)self->_childWrapperLayersByRep objectForKeyedSubscript:v9];
        if (v16)
        {
          uint64_t v17 = [v10 layer];
          [(CRLInteractiveCanvasRepContentUpdater *)self p_updateChildWrapperLayer:v16 forRep:v9 withLayer:v17];
        }
        [v9 didUpdateRenderable:v10];

        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v34 count:16];
    }
    while (v6);
  }
}

- (void)p_recursivelyUpdateRenderableForRep:(id)a3 accumulatingRepContentPiles:(id)a4 andReps:(id)a5 suppressLayers:(BOOL)a6 hidingLayersForReps:(id)a7 forcingUpdateOfValidLayers:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  id v14 = a3;
  id v161 = a4;
  id v154 = a5;
  id v15 = a7;
  BOOL v165 = v8;
  if (v8) {
    unsigned int v159 = 1;
  }
  else {
    unsigned int v159 = [(CRLCanvas *)self->_canvas i_areContentLayersInvalidForRep:v14];
  }
  v173 = self;
  [(CRLCanvas *)self->_canvas contentsScale];
  double v17 = v16;
  uint64_t v217 = 0;
  v218 = &v217;
  uint64_t v219 = 0x3032000000;
  v220 = sub_10012D5C4;
  v221 = sub_10012D5D4;
  v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = [v161 lastObject];
  sub_10024715C(v18, v19);
  id v222 = (id)objc_claimAutoreleasedReturnValue();

  if (!v218[5])
  {
    long long v20 = objc_alloc_init(CRLInteractiveCanvasRepLayerPile);
    long long v21 = (void *)v218[5];
    v218[5] = (uint64_t)v20;

    [v161 addObject:v218[5]];
  }
  long long v22 = [(NSMapTable *)self->_containerLayersByRep objectForKey:v14];
  id v23 = [v22 mutableCopy];

  id v24 = objc_alloc_init((Class)NSMutableArray);
  v209[0] = _NSConcreteStackBlock;
  v209[1] = 3221225472;
  v209[2] = sub_10012D5DC;
  v209[3] = &unk_1014D8200;
  id v151 = v23;
  id v210 = v151;
  v211 = self;
  id v167 = v14;
  id v212 = v167;
  v215 = &v217;
  id v152 = v15;
  id v213 = v152;
  char v216 = v159;
  id v153 = v24;
  id v214 = v153;
  v155 = objc_retainBlock(v209);
  v158 = ((void (*)(void))v155[2])();
  unsigned int v25 = v167;
  v160 = [(CRLInteractiveCanvasRepContentUpdater *)self renderableForRep:v167];
  id v162 = [v160 layer];
  if (v159)
  {
    __int16 v26 = (objc_class *)[v167 layerClass];
    if (v162)
    {
      if ([v162 isMemberOfClass:v26] && !v10) {
        goto LABEL_20;
      }
      [(CRLInteractiveCanvasRepContentUpdater *)self p_discardRenderable:v160 forRep:v167];

      v160 = 0;
      unsigned int v25 = v167;
    }
    if (v10)
    {
      id v162 = 0;
    }
    else
    {
      id v162 = objc_alloc_init(v26);
      uint64_t v27 = +[CRLCanvasRenderable renderableFromLayer:v162];

      [(NSMapTable *)self->_repRenderablesByRep setObject:v27 forKey:v167];
      [(NSMapTable *)self->_repsByRepRenderables setObject:v167 forKey:v27];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_layerDelegate);
      [v162 setDelegate:WeakRetained];

      if (([v167 directlyManagesLayerContent] & 1) == 0) {
        [v162 setNeedsDisplay];
      }
      uint64_t v29 = objc_opt_class();
      __int16 v30 = sub_1002469D0(v29, v162);
      if (v30) {
        [v30 setTilingMode:[v167 tilingMode]];
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v162 setContentsScale:v17];
      }

      v160 = (void *)v27;
      unsigned int v25 = v167;
    }
  }
LABEL_20:
  [v154 addObject:v25];
  if (v162)
  {
    v150 = [v25 childReps];
    if ([v150 count]) {
      unsigned int v31 = 1;
    }
    else {
      unsigned int v31 = [v25 wantsChildRepLayerUpdatingCallsEvenWithNoChildren];
    }
    if (v159)
    {
      [v25 willUpdateRenderable:v160];
      [v25 updateRenderableGeometryFromLayout:v160];
      [v162 setMasksToBounds:[v25 masksToBounds]];
      [v162 setOpaque:[v25 isOpaque]];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v162 setContentsScale:v17];
      }
    }
    id v34 = objc_alloc_init((Class)NSMutableArray);
    unsigned int v169 = v31;
    [v25 additionalRenderablesUnderRenderable];
    long long v207 = 0u;
    long long v208 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v35 = [obj countByEnumeratingWithState:&v205 objects:v240 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v206;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v206 != v36) {
            objc_enumerationMutation(obj);
          }
          id v38 = [*(id *)(*((void *)&v205 + 1) + 8 * i) layer];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v38 setContentsScale:v17];
          }
          [v34 addObject:v38];
        }
        id v35 = [obj countByEnumeratingWithState:&v205 objects:v240 count:16];
      }
      while (v35);
    }

    if ([v167 directlyManagesAdditionalPlatformViewUnderRenderable])
    {
      v39 = [[CRLInteractiveCanvasRepContentPlatformViewPile alloc] initWithRep:v167 kind:0];
      [v161 addObject:v39];
      [v158 setSublayers:v34];
      id v40 = objc_alloc_init((Class)NSMutableArray);

      long long v41 = (void *)v218[5];
      if (!v41)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D8220);
        }
        long long v42 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR)) {
          sub_10107C418();
        }

        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D8240);
        }
        long long v43 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
        {
          long long v44 = +[CRLAssertionHandler packedBacktraceString];
          sub_10107C04C(v44);
        }

        long long v45 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]");
        long long v46 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v45, v46, 295, 0, "invalid nil value for '%{public}s'", "topRepLayerPile");

        long long v41 = (void *)v218[5];
      }
      id v204 = 0;
      id v47 = [v41 newRepLayerPileByTransferringAndCloningParentLayers:&v204];
      id v48 = v204;
      long long v49 = (void *)v218[5];
      v218[5] = (uint64_t)v47;

      [v161 addObject:v218[5]];
      if ([v48 count])
      {
        if (!self->_clonedParentRepLayers)
        {
          long long v50 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:0];
          clonedParentRepLayers = self->_clonedParentRepLayers;
          self->_clonedParentRepLayers = v50;
        }
        long long v202 = 0u;
        long long v203 = 0u;
        long long v200 = 0u;
        long long v201 = 0u;
        id v52 = v48;
        id v53 = [v52 countByEnumeratingWithState:&v200 objects:v239 count:16];
        if (v53)
        {
          uint64_t v54 = *(void *)v201;
          do
          {
            for (j = 0; j != v53; j = (char *)j + 1)
            {
              if (*(void *)v201 != v54) {
                objc_enumerationMutation(v52);
              }
              [(NSHashTable *)self->_clonedParentRepLayers addObject:*(void *)(*((void *)&v200 + 1) + 8 * (void)j)];
            }
            id v53 = [v52 countByEnumeratingWithState:&v200 objects:v239 count:16];
          }
          while (v53);
        }
      }
      uint64_t v56 = ((void (*)(void))v155[2])();

      id v34 = v40;
      v158 = (void *)v56;
    }
    [v34 addObject:v162];
    [(NSMapTable *)self->_containerLayersByRep setObject:v153 forKey:v167];
    uint64_t v57 = [(NSMapTable *)self->_childWrapperLayersByRep objectForKeyedSubscript:v167];
    v157 = (CRLNoDefaultImplicitActionLayer *)v57;
    if (v57) {
      unsigned int v58 = 0;
    }
    else {
      unsigned int v58 = v169;
    }
    if (v58 == 1)
    {
      v157 = objc_alloc_init(CRLNoDefaultImplicitActionLayer);
      [(NSMapTable *)self->_childWrapperLayersByRep setObject:v157 forKey:v167];
      [(NSMapTable *)self->_repsByChildWrapperLayer setObject:v167 forKey:v157];
    }
    else
    {
      if (v57) {
        char v59 = v169;
      }
      else {
        char v59 = 1;
      }
      if ((v59 & 1) == 0)
      {
        [(NSMapTable *)self->_childWrapperLayersByRep removeObjectForKey:v167];
        [(NSMapTable *)self->_repsByChildWrapperLayer removeObjectForKey:v157];
      }
    }
    if (v169)
    {
      if (!v157)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D8260);
        }
        v60 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR)) {
          sub_10107C384();
        }

        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D8280);
        }
        v61 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
        {
          v62 = +[CRLAssertionHandler packedBacktraceString];
          sub_10107C04C(v62);
        }

        v63 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]");
        v64 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v63, v64, 341, 0, "invalid nil value for '%{public}s'", "childWrapperLayer");
      }
      -[CRLInteractiveCanvasRepContentUpdater p_updateChildWrapperLayer:forRep:withLayer:](self, "p_updateChildWrapperLayer:forRep:withLayer:");
      [v34 addObject:v157];
    }
    [v167 i_additionalRenderablesOverRenderableIncludingKnobs];
    long long v198 = 0u;
    long long v199 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    id v171 = (id)objc_claimAutoreleasedReturnValue();
    id v65 = [v171 countByEnumeratingWithState:&v196 objects:v238 count:16];
    if (v65)
    {
      uint64_t v66 = *(void *)v197;
      do
      {
        for (k = 0; k != v65; k = (char *)k + 1)
        {
          if (*(void *)v197 != v66) {
            objc_enumerationMutation(v171);
          }
          v68 = [*(id *)(*((void *)&v196 + 1) + 8 * (void)k) layer];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v68 setContentsScale:v17];
          }
          [v34 addObject:v68];
        }
        id v65 = [v171 countByEnumeratingWithState:&v196 objects:v238 count:16];
      }
      while (v65);
    }

    v69 = [v158 sublayers];
    unsigned __int8 v70 = [v69 isEqualToArray:v34];

    if ((v70 & 1) == 0) {
      [v158 setSublayers:v34];
    }
    unsigned int v71 = [v167 directlyManagesContentPlatformView];
    unsigned int v72 = [v167 directlyManagesAdditionalPlatformViewOverRenderable];
    v73 = v160;
    unsigned int v74 = v72;
    if ((v71 | v72) == 1)
    {
      if (v169)
      {
        if (!v157)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D82A0);
          }
          v75 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_ERROR)) {
            sub_10107C2F0();
          }

          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D82C0);
          }
          v76 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v76, OS_LOG_TYPE_ERROR))
          {
            v77 = +[CRLAssertionHandler packedBacktraceString];
            sub_10107C04C(v77);
          }

          v78 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]");
          v79 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v78, v79, 370, 0, "invalid nil value for '%{public}s'", "childWrapperLayer");
        }
        [v218[5] pushParentLayer:];
      }
      if (v71)
      {
        v80 = [[CRLInteractiveCanvasRepContentPlatformViewPile alloc] initWithRep:v167 kind:1];
        [v161 addObject:v80];
      }
      if (v74)
      {
        v81 = [[CRLInteractiveCanvasRepContentPlatformViewPile alloc] initWithRep:v167 kind:2];
        [v161 addObject:v81];
      }
      v82 = (void *)v218[5];
      if (!v82)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D82E0);
        }
        v83 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_ERROR)) {
          sub_10107C25C();
        }

        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D8300);
        }
        v84 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v84, OS_LOG_TYPE_ERROR))
        {
          v85 = +[CRLAssertionHandler packedBacktraceString];
          sub_10107C04C(v85);
        }

        v86 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]");
        v87 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v86, v87, 392, 0, "invalid nil value for '%{public}s'", "topRepLayerPile");

        v82 = (void *)v218[5];
      }
      id v195 = 0;
      id v88 = [v82 newRepLayerPileByTransferringAndCloningParentLayers:&v195];
      id v89 = v195;
      v90 = (void *)v218[5];
      v218[5] = (uint64_t)v88;

      [v161 addObject:v218[5]];
      if ([v89 count])
      {
        if (!self->_clonedParentRepLayers)
        {
          v91 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:0];
          v92 = self->_clonedParentRepLayers;
          self->_clonedParentRepLayers = v91;
        }
        long long v193 = 0u;
        long long v194 = 0u;
        long long v191 = 0u;
        long long v192 = 0u;
        id v93 = v89;
        id v94 = [v93 countByEnumeratingWithState:&v191 objects:v237 count:16];
        if (v94)
        {
          uint64_t v95 = *(void *)v192;
          do
          {
            for (m = 0; m != v94; m = (char *)m + 1)
            {
              if (*(void *)v192 != v95) {
                objc_enumerationMutation(v93);
              }
              [(NSHashTable *)self->_clonedParentRepLayers addObject:*(void *)(*((void *)&v191 + 1) + 8 * (void)m)];
            }
            id v94 = [v93 countByEnumeratingWithState:&v191 objects:v237 count:16];
          }
          while (v94);
        }
      }
      v73 = v160;
    }
    if (v169)
    {
      [v167 willUpdateChildLayers:v73];
      v97 = +[NSSet set];
      if ([v167 drawsDescendantsIntoLayer])
      {
        v98 = +[NSSet setWithArray:v150];

        v99 = [v167 childrenToExcludeWhenDrawingDescendantsIntoLayer];
        v97 = [v98 crl_setBySubtractingSet:v99];
      }
      v156 = +[NSMutableOrderedSet orderedSetWithArray:v150];
      v184[0] = _NSConcreteStackBlock;
      v184[1] = 3221225472;
      v184[2] = sub_10012D8E0;
      v184[3] = &unk_1014D8328;
      id v170 = v97;
      id v185 = v170;
      v186 = self;
      id v168 = v154;
      id v187 = v168;
      id v164 = v161;
      id v188 = v164;
      id v163 = v152;
      id v189 = v163;
      BOOL v190 = v165;
      v149 = objc_retainBlock(v184);
      if (([v167 directlyManagesContentPlatformView] & 1) == 0)
      {
        [(id)v218[5] pushParentLayer:v162];
        long long v182 = 0u;
        long long v183 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        id v100 = v150;
        id v101 = [v100 countByEnumeratingWithState:&v180 objects:v236 count:16];
        if (v101)
        {
          uint64_t v102 = *(void *)v181;
LABEL_140:
          uint64_t v103 = 0;
          while (1)
          {
            if (*(void *)v181 != v102) {
              objc_enumerationMutation(v100);
            }
            v104 = *(void **)(*((void *)&v180 + 1) + 8 * v103);
            if (![v104 wantsRenderableToBeDescendedFromParentRepRenderable]) {
              break;
            }
            [v156 removeObject:v104];
            ((void (*)(void *, void *))v149[2])(v149, v104);
            if (v101 == (id)++v103)
            {
              id v101 = [v100 countByEnumeratingWithState:&v180 objects:v236 count:16];
              if (v101) {
                goto LABEL_140;
              }
              break;
            }
          }
        }

        v105 = (objc_class *)objc_opt_class();
        v106 = [v164 lastObject];
        uint64_t v107 = sub_10024715C(v105, v106);
        v108 = (void *)v218[5];
        v218[5] = v107;

        v109 = (void *)v218[5];
        if (!v109)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D8348);
          }
          v110 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v110, OS_LOG_TYPE_ERROR)) {
            sub_10107C1C8();
          }

          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D8368);
          }
          v111 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v111, OS_LOG_TYPE_ERROR))
          {
            v112 = +[CRLAssertionHandler packedBacktraceString];
            sub_10107C04C(v112);
          }

          v113 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]");
          v114 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v113, v114, 471, 0, "invalid nil value for '%{public}s'", "topRepLayerPile");

          v109 = (void *)v218[5];
        }
        [v109 popParentLayer];
        if (!v157)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D8388);
          }
          v115 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v115, OS_LOG_TYPE_ERROR)) {
            sub_10107C134();
          }

          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D83A8);
          }
          v116 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v116, OS_LOG_TYPE_ERROR))
          {
            v117 = +[CRLAssertionHandler packedBacktraceString];
            sub_10107C04C(v117);
          }

          v118 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]");
          v119 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v118, v119, 476, 0, "invalid nil value for '%{public}s'", "childWrapperLayer");
        }
        [v218[5] pushParentLayer:];
      }
      if ([v156 count])
      {
        long long v178 = 0u;
        long long v179 = 0u;
        long long v176 = 0u;
        long long v177 = 0u;
        id v166 = v156;
        id v120 = [v166 countByEnumeratingWithState:&v176 objects:v235 count:16];
        if (v120)
        {
          uint64_t v121 = *(void *)v177;
          do
          {
            v122 = 0;
            do
            {
              if (*(void *)v177 != v121) {
                objc_enumerationMutation(v166);
              }
              v123 = *(void **)(*((void *)&v176 + 1) + 8 * (void)v122);
              if ([v123 wantsRenderableToBeDescendedFromParentRepRenderable])
              {
                unsigned int v124 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014D83C8);
                }
                v125 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)v125, OS_LOG_TYPE_ERROR))
                {
                  v133 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v133);
                  id v134 = (id)objc_claimAutoreleasedReturnValue();
                  v135 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v135);
                  id v136 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 67110402;
                  unsigned int v224 = v124;
                  __int16 v225 = 2082;
                  v226 = "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepCont"
                         "entPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]";
                  __int16 v227 = 2082;
                  v228 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m";
                  __int16 v229 = 1024;
                  int v230 = 489;
                  __int16 v231 = 2114;
                  id v232 = v134;
                  __int16 v233 = 2114;
                  id v234 = v136;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v125, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Cannot make this layer descend from parent %{public}@ rep's layer, but the rep %{public}@ is asking to", buf, 0x36u);
                }
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014D83E8);
                }
                v126 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)v126, OS_LOG_TYPE_ERROR))
                {
                  v137 = +[CRLAssertionHandler packedBacktraceString];
                  *(_DWORD *)buf = 67109378;
                  unsigned int v224 = v124;
                  __int16 v225 = 2114;
                  v226 = v137;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v126, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                }
                v127 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]");
                v128 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"];
                v129 = (objc_class *)objc_opt_class();
                v130 = NSStringFromClass(v129);
                v131 = (objc_class *)objc_opt_class();
                v132 = NSStringFromClass(v131);
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v127, v128, 489, 0, "Cannot make this layer descend from parent %{public}@ rep's layer, but the rep %{public}@ is asking to", v130, v132);
              }
              if ([v170 containsObject:v123]) {
                [(CRLInteractiveCanvasRepContentUpdater *)v173 p_accumulateNonRenderableBackedRepAndDescendants:v123 into:v168];
              }
              else {
                [(CRLInteractiveCanvasRepContentUpdater *)v173 p_recursivelyUpdateRenderableForRep:v123 accumulatingRepContentPiles:v164 andReps:v168 suppressLayers:0 hidingLayersForReps:v163 forcingUpdateOfValidLayers:v165];
              }
              v122 = (char *)v122 + 1;
            }
            while (v120 != v122);
            id v120 = [v166 countByEnumeratingWithState:&v176 objects:v235 count:16];
          }
          while (v120);
        }

        v138 = (objc_class *)objc_opt_class();
        v139 = [v164 lastObject];
        uint64_t v140 = sub_10024715C(v138, v139);
        v141 = (void *)v218[5];
        v218[5] = v140;

        if (!v218[5])
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D8408);
          }
          v142 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v142, OS_LOG_TYPE_ERROR)) {
            sub_10107C0A0();
          }

          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D8428);
          }
          v143 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v143, OS_LOG_TYPE_ERROR))
          {
            v144 = +[CRLAssertionHandler packedBacktraceString];
            sub_10107C04C(v144);
          }

          v145 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]");
          v146 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v145, v146, 509, 0, "invalid nil value for '%{public}s'", "topRepLayerPile");
        }
      }
      v147 = (void *)v218[5];
      v174[0] = _NSConcreteStackBlock;
      v174[1] = 3221225472;
      v174[2] = sub_10012DB88;
      v174[3] = &unk_1014D8450;
      id v148 = v167;
      id v175 = v148;
      [v147 mutateLayersUsingBlock:v174];
      [v148 didUpdateChildLayers];
      [(id)v218[5] popParentLayer];

      v73 = v160;
    }
    if (v159) {
      [v167 didUpdateRenderable:v73];
    }
  }
  else if (v159)
  {
    __int16 v32 = [v158 sublayers];
    BOOL v33 = [v32 count] == 0;

    if (!v33) {
      [v158 setSublayers:&__NSArray0__struct];
    }
  }

  _Block_object_dispose(&v217, 8);
}

- (void)p_updateChildWrapperLayer:(id)a3 forRep:(id)a4 withLayer:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 setMasksToBounds:[v9 masksToBounds]];
  id v10 = [v9 isOpaque];

  [v7 setOpaque:v10];
  [v8 layerFrameInScaledCanvasRelativeToParent];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  if (v8) {
    [v8 i_layerTransform];
  }
  v38[0] = v39;
  v38[1] = v40;
  v38[2] = v41;
  [v7 crl_setIfDifferentFrame:v38 orTransform:v12, v14, v16, v18];
  [v8 rectToClipChildRepRenderables];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  v42.origin.double x = CGRectNull.origin.x;
  v42.origin.double y = CGRectNull.origin.y;
  v42.size.double width = CGRectNull.size.width;
  v42.size.double height = CGRectNull.size.height;
  v46.origin.double x = v20;
  v46.origin.double y = v22;
  v46.size.double width = v24;
  v46.size.double height = v26;
  if (CGRectEqualToRect(v42, v46))
  {
    [v7 setMask:0];
  }
  else
  {
    if (v8) {
      [v8 transformToConvertNaturalToLayerRelative];
    }
    else {
      memset(&v37, 0, sizeof(v37));
    }
    v43.origin.double x = v20;
    v43.origin.double y = v22;
    v43.size.double width = v24;
    v43.size.double height = v26;
    CGRect v44 = CGRectApplyAffineTransform(v43, &v37);
    double x = v44.origin.x;
    double y = v44.origin.y;
    double width = v44.size.width;
    double height = v44.size.height;
    unsigned int v31 = [v7 mask];
    if (!v31)
    {
      unsigned int v31 = +[CRLNoDefaultImplicitActionLayer layer];
      __int16 v32 = +[CRLColor blackColor];
      objc_msgSend(v31, "setBackgroundColor:", objc_msgSend(v32, "CGColor"));

      [v7 setMask:v31];
    }
    [v31 frame:*(_OWORD *)&v37.a, *(_OWORD *)&v37.c, *(_OWORD *)&v37.tx];
    v47.origin.double x = v33;
    v47.origin.double y = v34;
    v47.size.double width = v35;
    v47.size.double height = v36;
    v45.origin.double x = x;
    v45.origin.double y = y;
    v45.size.double width = width;
    v45.size.double height = height;
    if (!CGRectEqualToRect(v45, v47)) {
      [v31 setFrame:CGRectMake(x, y, width, height)];
    }
  }
}

- (void)p_discardRenderable:(id)a3 forRep:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [v8 layer];
  [v7 setDelegate:0];
  if (v8)
  {
    [v7 setContents:0];
    [(NSMapTable *)self->_repsByRepRenderables removeObjectForKey:v8];
    [v7 crl_cancelLayoutForTilingLayers];
  }
  if (v6) {
    [(NSMapTable *)self->_repRenderablesByRep removeObjectForKey:v6];
  }
}

- (void)p_accumulateNonRenderableBackedRepAndDescendants:(id)a3 into:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 addObject:v6];
  id v8 = [(CRLInteractiveCanvasRepContentUpdater *)self renderableForRep:v6];
  if (v8) {
    [(CRLInteractiveCanvasRepContentUpdater *)self p_discardRenderable:v8 forRep:v6];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [v6 childReps];
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      double v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(CRLInteractiveCanvasRepContentUpdater *)self p_accumulateNonRenderableBackedRepAndDescendants:*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) into:v7];
        double v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (id)renderableForRep:(id)a3
{
  return [(NSMapTable *)self->_repRenderablesByRep objectForKey:a3];
}

- (id)repForLayer:(id)a3
{
  repsByRepRenderables = self->_repsByRepRenderables;
  id v4 = +[CRLCanvasRenderable renderableFromLayer:a3];
  id v5 = [(NSMapTable *)repsByRepRenderables objectForKey:v4];

  return v5;
}

- (id)containerRenderablesForRep:(id)a3
{
  BOOL v3 = [(NSMapTable *)self->_containerLayersByRep objectForKey:a3];
  id v4 = [v3 crl_arrayByMappingObjectsUsingBlock:&stru_1014D8490];

  return v4;
}

- (BOOL)isRepContentLayer:(id)a3
{
  repsByRepRenderables = self->_repsByRepRenderables;
  id v4 = +[CRLCanvasRenderable renderableFromLayer:a3];
  id v5 = [(NSMapTable *)repsByRepRenderables objectForKey:v4];
  LOBYTE(repsByRepRenderables) = v5 != 0;

  return (char)repsByRepRenderables;
}

- (BOOL)isRepContainerLayer:(id)a3
{
  BOOL v3 = [(NSMapTable *)self->_repsByContainerLayer objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isChildWrapperLayer:(id)a3
{
  BOOL v3 = [(NSMapTable *)self->_repsByChildWrapperLayer objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isClonedParentRepLayer:(id)a3
{
  return [(NSHashTable *)self->_clonedParentRepLayers containsObject:a3];
}

- (CRLCanvas)canvas
{
  return self->_canvas;
}

- (CALayerDelegate)layerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerDelegate);

  return (CALayerDelegate *)WeakRetained;
}

- (NSArray)repContentPiles
{
  return self->_repContentPiles;
}

- (NSOrderedSet)allReps
{
  return self->_allReps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allReps, 0);
  objc_storeStrong((id *)&self->_repContentPiles, 0);
  objc_destroyWeak((id *)&self->_layerDelegate);
  objc_storeStrong((id *)&self->_canvas, 0);
  objc_storeStrong((id *)&self->_clonedParentRepLayers, 0);
  objc_storeStrong((id *)&self->_repsByChildWrapperLayer, 0);
  objc_storeStrong((id *)&self->_childWrapperLayersByRep, 0);
  objc_storeStrong((id *)&self->_repsByContainerLayer, 0);
  objc_storeStrong((id *)&self->_containerLayersByRep, 0);
  objc_storeStrong((id *)&self->_repsByRepRenderables, 0);

  objc_storeStrong((id *)&self->_repRenderablesByRep, 0);
}

- (id)i_stringFromLayerDescription:(id)a3
{
  id v3 = a3;
  BOOL v4 = [&stru_101538650 stringByPaddingToLength:4 * [v3 levelInTree] withString:@" " startingAtIndex:0];
  id v5 = [v3 layerClass];
  id v6 = [v3 layerPointer];
  id v7 = [v3 layerPurpose];
  id v8 = [v3 repClass];
  id v9 = [v3 repPointer];
  id v10 = [v3 layerPosition];
  id v11 = [v3 layerBounds];

  uint64_t v12 = +[NSString stringWithFormat:@"%@%@ %@ %@ %@ %@ %@ %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)p_layerDescriptionFromString:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(_CRLLayerDescription);
  unint64_t v5 = 0;
  if ([v3 length])
  {
    do
    {
      if ([v3 characterAtIndex:v5] != 32) {
        break;
      }
      ++v5;
    }
    while (v5 < (unint64_t)[v3 length]);
  }
  [(_CRLLayerDescription *)v4 setLevelInTree:v5 >> 2];
  id v6 = [v3 substringFromIndex:v5];
  id v7 = [v6 componentsSeparatedByString:@" "];
  if ([v7 count])
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = [v7 objectAtIndexedSubscript:v8];
      switch(v8)
      {
        case 0uLL:
          [(_CRLLayerDescription *)v4 setLayerClass:v9];
          break;
        case 2uLL:
          [(_CRLLayerDescription *)v4 setLayerPurpose:v9];
          break;
        case 3uLL:
          [(_CRLLayerDescription *)v4 setRepClass:v9];
          break;
        case 5uLL:
          [(_CRLLayerDescription *)v4 setLayerPosition:v9];
          break;
        case 6uLL:
          [(_CRLLayerDescription *)v4 setLayerBounds:v9];
          break;
        default:
          break;
      }

      ++v8;
    }
    while (v8 < (unint64_t)[v7 count]);
  }

  return v4;
}

- (void)p_visitLayer:(id)a3 atLevel:(unint64_t)a4 appendTo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(_CRLLayerDescription);
  id v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  [(_CRLLayerDescription *)v10 setLayerClass:v12];

  double v13 = +[NSString stringWithFormat:@"%p", v8];
  [(_CRLLayerDescription *)v10 setLayerPointer:v13];

  [(_CRLLayerDescription *)v10 setLevelInTree:a4];
  [v8 bounds];
  long long v14 = NSStringFromCGRect(v40);
  long long v15 = [v14 stringByReplacingOccurrencesOfString:@" " withString:&stru_101538650];
  [(_CRLLayerDescription *)v10 setLayerBounds:v15];

  [v8 position];
  long long v16 = NSStringFromCGPoint(v39);
  long long v17 = [v16 stringByReplacingOccurrencesOfString:@" " withString:&stru_101538650];
  [(_CRLLayerDescription *)v10 setLayerPosition:v17];

  repsByRepRenderables = self->_repsByRepRenderables;
  double v19 = +[CRLCanvasRenderable renderableFromLayer:v8];
  CGFloat v20 = [(NSMapTable *)repsByRepRenderables objectForKey:v19];

  if (v20)
  {
    CFStringRef v21 = @"RepContent";
LABEL_7:
    [(_CRLLayerDescription *)v10 setLayerPurpose:v21];
    CGFloat v24 = +[NSString stringWithFormat:@"%p", v20];
    [(_CRLLayerDescription *)v10 setRepPointer:v24];

    double v25 = (objc_class *)objc_opt_class();
    CGFloat v26 = NSStringFromClass(v25);
    [(_CRLLayerDescription *)v10 setRepClass:v26];

    goto LABEL_8;
  }
  uint64_t v22 = [(NSMapTable *)self->_repsByContainerLayer objectForKey:v8];
  if (v22)
  {
    CGFloat v20 = (void *)v22;
    CFStringRef v21 = @"RepContainer";
    goto LABEL_7;
  }
  uint64_t v23 = [(NSMapTable *)self->_repsByChildWrapperLayer objectForKey:v8];
  if (v23)
  {
    CGFloat v20 = (void *)v23;
    CFStringRef v21 = @"ChildWrapper";
    goto LABEL_7;
  }
  [(_CRLLayerDescription *)v10 setLayerPurpose:@"-"];
  [(_CRLLayerDescription *)v10 setRepPointer:@"-"];
  [(_CRLLayerDescription *)v10 setRepClass:@"-"];
LABEL_8:
  uint64_t v27 = [(CRLInteractiveCanvasRepContentUpdater *)self i_stringFromLayerDescription:v10];
  [v9 appendFormat:@"%@\n", v27];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  __int16 v28 = [v8 sublayers];
  id v29 = [v28 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v35;
    unint64_t v32 = a4 + 1;
    do
    {
      CGFloat v33 = 0;
      do
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(v28);
        }
        [(CRLInteractiveCanvasRepContentUpdater *)self p_visitLayer:*(void *)(*((void *)&v34 + 1) + 8 * (void)v33) atLevel:v32 appendTo:v9];
        CGFloat v33 = (char *)v33 + 1;
      }
      while (v30 != v33);
      id v30 = [v28 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v30);
  }
}

- (id)i_descriptionOfLayerTreeRootedAt:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[NSMutableString string];
  [(CRLInteractiveCanvasRepContentUpdater *)self p_visitLayer:v4 atLevel:0 appendTo:v5];

  return v5;
}

- (id)i_firstDifferenceBetweenLayerTreeDescription:(id)a3 andDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  long long v37 = v6;
  id v9 = [v6 componentsSeparatedByString:@"\n"];
  long long v36 = v7;
  id v10 = [v7 componentsSeparatedByString:@"\n"];
  id v11 = [v9 count];
  CGPoint v39 = v10;
  id v38 = v8;
  if (v11 == [v10 count])
  {
    if ([v9 count] != (id)1)
    {
      uint64_t v12 = 0;
      while (1)
      {
        double v13 = [v9 objectAtIndexedSubscript:v12];
        long long v14 = [v39 objectAtIndexedSubscript:v12];
        long long v15 = [(CRLInteractiveCanvasRepContentUpdater *)self p_layerDescriptionFromString:v13];
        long long v16 = [(CRLInteractiveCanvasRepContentUpdater *)self p_layerDescriptionFromString:v14];
        id v17 = [v15 levelInTree];
        if (v17 != [v16 levelInTree]
          || ([v15 layerClass],
              double v18 = objc_claimAutoreleasedReturnValue(),
              [v16 layerClass],
              double v19 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v20 = [v18 isEqualToString:v19],
              v19,
              v18,
              (v20 & 1) == 0))
        {
          CFStringRef v21 = [v15 layerPurpose];
          uint64_t v22 = [v16 layerPurpose];
          unsigned __int8 v23 = [v21 isEqualToString:v22];

          if (v23) {
            goto LABEL_21;
          }
        }
        CGFloat v24 = [v15 repClass];
        double v25 = [v16 repClass];
        unsigned __int8 v26 = [v24 isEqualToString:v25];

        if ((v26 & 1) == 0)
        {
LABEL_21:
          uint64_t v27 = [v15 layerBounds];
          __int16 v28 = [v16 layerBounds];
          unsigned __int8 v29 = [v27 isEqualToString:v28];

          if (v29) {
            goto LABEL_20;
          }
        }
        id v30 = [v15 layerPosition];
        uint64_t v31 = [v16 layerPosition];
        unsigned __int8 v32 = [v30 isEqualToString:v31];

        if ((v32 & 1) == 0)
        {
LABEL_20:
          id v33 = [v15 levelInTree];
          if (v33 == [v16 levelInTree]) {
            break;
          }
        }

        if ((char *)++v12 >= (char *)[v9 count] - 1) {
          goto LABEL_14;
        }
      }
      v40[0] = v13;
      v40[1] = v14;
      long long v35 = +[NSArray arrayWithObjects:v40 count:2];
      [v38 addObjectsFromArray:v35];
    }
  }
  else
  {
    [v8 addObject:@"Count of layers"];
  }
LABEL_14:

  return v38;
}

@end