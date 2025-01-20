@interface CRLInteractiveCanvasRepLayerPile
- (BOOL)isContentEqualToContentOfRepContentPile:(id)a3;
- (CRLInteractiveCanvasRepLayerPile)init;
- (NSArray)contentLayers;
- (NSString)description;
- (id)newRepLayerPileByTransferringAndCloningParentLayers:(id *)a3;
- (void)addLayer:(id)a3;
- (void)mutateLayersUsingBlock:(id)a3;
- (void)popParentLayer;
- (void)pushParentLayer:(id)a3;
@end

@implementation CRLInteractiveCanvasRepLayerPile

- (CRLInteractiveCanvasRepLayerPile)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLInteractiveCanvasRepLayerPile;
  v2 = [(CRLInteractiveCanvasRepLayerPile *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    topLevelLayers = v2->_topLevelLayers;
    v2->_topLevelLayers = v3;
  }
  return v2;
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendString:@"(\n"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_parentLayerAndChildLayersStack;
  id v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v6 = objc_alloc_init((Class)NSMutableArray);
        id v7 = [v5 first];
        v21 = v5;
        if (v7)
        {
          do
          {
            [v6 insertObject:v7 atIndex:0];
            if ([(NSMutableOrderedSet *)self->_topLevelLayers containsObject:v7]) {
              break;
            }
            uint64_t v8 = [v7 superlayer];

            id v7 = (id)v8;
          }
          while (v8);
        }
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v9 = v6;
        id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v23;
          do
          {
            v13 = 0;
            v14 = v7;
            do
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              id v7 = *(id *)(*((void *)&v22 + 1) + 8 * (void)v13);

              [v3 appendFormat:@"%@/", v7];
              v13 = (char *)v13 + 1;
              v14 = v7;
            }
            while (v11 != v13);
            id v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v11);
        }

        v15 = [v21 second];
        [v3 appendFormat:@" -> %@\n", v15];
      }
      id v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }

  [v3 appendString:@""]);
  v16 = +[NSString stringWithFormat:@"<%@ %p\n_topLevelLayers=%@\n_parentLayerAndChildLayersStack=%@>", objc_opt_class(), self, self->_topLevelLayers, v3];

  return (NSString *)v16;
}

- (void)addLayer:(id)a3
{
  id v7 = a3;
  v4 = [(NSMutableArray *)self->_parentLayerAndChildLayersStack lastObject];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 second];
    [v6 addObject:v7];
  }
  else
  {
    [(NSMutableOrderedSet *)self->_topLevelLayers addObject:v7];
  }
}

- (void)mutateLayersUsingBlock:(id)a3
{
  parentLayerAndChildLayersStack = self->_parentLayerAndChildLayersStack;
  v5 = (void (**)(id, id))a3;
  id v6 = [(NSMutableArray *)parentLayerAndChildLayersStack lastObject];
  id v9 = v6;
  if (v6)
  {
    id v7 = [v6 second];
    v5[2](v5, v7);
  }
  else
  {
    uint64_t v8 = [(NSMutableOrderedSet *)self->_topLevelLayers array];
    id v7 = [v8 mutableCopy];

    v5[2](v5, v7);
    [(NSMutableOrderedSet *)self->_topLevelLayers removeAllObjects];
    [(NSMutableOrderedSet *)self->_topLevelLayers addObjectsFromArray:v7];
  }
}

- (void)pushParentLayer:(id)a3
{
  id v10 = a3;
  parentLayerAndChildLayersStack = self->_parentLayerAndChildLayersStack;
  if (!parentLayerAndChildLayersStack)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v6 = self->_parentLayerAndChildLayersStack;
    self->_parentLayerAndChildLayersStack = v5;

    parentLayerAndChildLayersStack = self->_parentLayerAndChildLayersStack;
  }
  id v7 = [CRLPair alloc];
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = [(CRLPair *)v7 initWithFirst:v10 second:v8];
  [(NSMutableArray *)parentLayerAndChildLayersStack addObject:v9];
}

- (void)popParentLayer
{
  id v3 = [(NSMutableArray *)self->_parentLayerAndChildLayersStack lastObject];
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7DD0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B00BC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7DF0);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile popParentLayer]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:96 isFatal:0 description:"popParentLayer called without matching pushParentLayer:"];
  }
  id v7 = [v3 first];
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7E10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B000C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7E30);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile popParentLayer]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 99, 0, "invalid nil value for '%{public}s'", "parentLayer");
  }
  id v11 = [v3 second];
  if (!v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7E50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AFF5C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7E70);
    }
    uint64_t v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile popParentLayer]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 101, 0, "invalid nil value for '%{public}s'", "childLayers");
  }
  [v7 crl_tilingSafeSetSublayers:v11];
  [(NSMutableArray *)self->_parentLayerAndChildLayersStack removeLastObject];
}

- (id)newRepLayerPileByTransferringAndCloningParentLayers:(id *)a3
{
  v66 = objc_alloc_init(CRLInteractiveCanvasRepLayerPile);
  id v5 = [objc_alloc((Class)NSMutableSet) initWithCapacity:0];
  if ([(NSMutableArray *)self->_parentLayerAndChildLayersStack count])
  {
    v62 = a3;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_10040601C;
    v74[3] = &unk_1014F7E98;
    id v60 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:0];
    id v61 = v5;
    v74[4] = v60;
    v74[5] = v5;
    id v6 = objc_retainBlock(v74);
    id v7 = [(NSMutableOrderedSet *)self->_topLevelLayers lastObject];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v59 = self;
    obj = self->_parentLayerAndChildLayersStack;
    id v65 = [(NSMutableArray *)obj countByEnumeratingWithState:&v70 objects:v86 count:16];
    if (v65)
    {
      uint64_t v64 = *(void *)v71;
      id v8 = &off_1014C1000;
      do
      {
        uint64_t v9 = 0;
        id v10 = v7;
        do
        {
          if (*(void *)v71 != v64) {
            objc_enumerationMutation(obj);
          }
          uint64_t v68 = v9;
          id v11 = *(void **)(*((void *)&v70 + 1) + 8 * v9);
          if (v10)
          {
            uint64_t v12 = ((void (*)(void *, id))v6[2])(v6, v10);
            [(CRLInteractiveCanvasRepLayerPile *)v66 addLayer:v12];
          }
          else
          {
            unsigned int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F7EB8);
            }
            v14 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v77 = v13;
              __int16 v78 = 2082;
              v79 = "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]";
              __int16 v80 = 2082;
              v81 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m";
              __int16 v82 = 1024;
              int v83 = 154;
              __int16 v84 = 2082;
              v85 = "pushedParentLayer";
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F7ED8);
            }
            v15 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v47 = v15;
              v48 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v77 = v13;
              __int16 v78 = 2114;
              v79 = v48;
              _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]");
            v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v16, 154, 0, "invalid nil value for '%{public}s'", "pushedParentLayer");
          }
          v17 = [v11 first];
          if (!v17)
          {
            unsigned int v18 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F7EF8);
            }
            uint64_t v19 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v77 = v18;
              __int16 v78 = 2082;
              v79 = "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]";
              __int16 v80 = 2082;
              v81 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m";
              __int16 v82 = 1024;
              int v83 = 160;
              __int16 v84 = 2082;
              v85 = "parentLayer";
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F7F18);
            }
            id v20 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v49 = v20;
              v50 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v77 = v18;
              __int16 v78 = 2114;
              v79 = v50;
              _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]");
            long long v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 160, 0, "invalid nil value for '%{public}s'", "parentLayer");
          }
          v67 = [v11 second];
          if (!v67)
          {
            unsigned int v23 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F7F38);
            }
            long long v24 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v77 = v23;
              __int16 v78 = 2082;
              v79 = "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]";
              __int16 v80 = 2082;
              v81 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m";
              __int16 v82 = 1024;
              int v83 = 162;
              __int16 v84 = 2082;
              v85 = "childLayers";
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F7F58);
            }
            long long v25 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v51 = v25;
              v52 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v77 = v23;
              __int16 v78 = 2114;
              v79 = v52;
              _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            long long v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]");
            long long v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 162, 0, "invalid nil value for '%{public}s'", "childLayers");
          }
          id v69 = v17;
          if (v69 != v10)
          {
            long long v28 = v69;
            do
            {
              long long v29 = ((void (*)(void *, void *))v6[2])(v6, v28);
              uint64_t v30 = [v28 superlayer];
              if (!v30)
              {
                v31 = v8;
                unsigned int v32 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014F7F78);
                }
                v33 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109890;
                  unsigned int v77 = v32;
                  __int16 v78 = 2082;
                  v79 = "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]";
                  __int16 v80 = 2082;
                  v81 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m";
                  __int16 v82 = 1024;
                  int v83 = 173;
                  _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Each pushed parent layer should be a descendant of the last pushed parent layer (or top level layer if no other parent layers are pushed).", buf, 0x22u);
                }
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014F7F98);
                }
                v34 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                {
                  v39 = v34;
                  v40 = +[CRLAssertionHandler packedBacktraceString];
                  *(_DWORD *)buf = 67109378;
                  unsigned int v77 = v32;
                  __int16 v78 = 2114;
                  v79 = v40;
                  _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                }
                v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]");
                v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"];
                +[CRLAssertionHandler handleFailureInFunction:v35 file:v36 lineNumber:173 isFatal:0 description:"Each pushed parent layer should be a descendant of the last pushed parent layer (or top level layer if no other parent layers are pushed)."];

                id v8 = v31;
              }
              v37 = ((void (*)(void *, uint64_t))v6[2])(v6, v30);
              v75 = v29;
              v38 = [(__objc2_class *)v8[35] arrayWithObjects:&v75 count:1];
              [v37 setSublayers:v38];

              long long v28 = (void *)v30;
            }
            while ((id)v30 != v10);
          }
          if (!v10)
          {
            unsigned int v41 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F7FB8);
            }
            v42 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              unsigned int v77 = v41;
              __int16 v78 = 2082;
              v79 = "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]";
              __int16 v80 = 2082;
              v81 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m";
              __int16 v82 = 1024;
              int v83 = 180;
              _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Cloned rep layer pile contained a pushed parent layer that was not descendent of a top level layer.", buf, 0x22u);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F7FD8);
            }
            v43 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v53 = v43;
              v54 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v77 = v41;
              __int16 v78 = 2114;
              v79 = v54;
              _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]");
            v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"];
            +[CRLAssertionHandler handleFailureInFunction:v44 file:v45 lineNumber:180 isFatal:0 description:"Cloned rep layer pile contained a pushed parent layer that was not descendent of a top level layer."];
          }
          v46 = ((void (*)(void *, id))v6[2])(v6, v69);
          [(CRLInteractiveCanvasRepLayerPile *)v66 pushParentLayer:v46];

          id v7 = [v67 lastObject];

          uint64_t v9 = v68 + 1;
          id v10 = v7;
        }
        while ((id)(v68 + 1) != v65);
        id v65 = [(NSMutableArray *)obj countByEnumeratingWithState:&v70 objects:v86 count:16];
      }
      while (v65);
    }

    while ([(NSMutableArray *)v59->_parentLayerAndChildLayersStack count])
      [(CRLInteractiveCanvasRepLayerPile *)v59 popParentLayer];
    if ([(NSMutableOrderedSet *)v66->_topLevelLayers count] != (id)1)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F7FF8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B0144();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F8018);
      }
      v55 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v55);
      }
      v56 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]");
      v57 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"];
      +[CRLAssertionHandler handleFailureInFunction:v56 file:v57 lineNumber:191 isFatal:0 description:"A cloned parent layer hierarchy should contain only one top level layer."];
    }
    id v5 = v61;
    a3 = v62;
  }
  if (a3) {
    *a3 = v5;
  }

  return v66;
}

- (BOOL)isContentEqualToContentOfRepContentPile:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = sub_1002469D0(v5, v4);

  if (v6) {
    unsigned __int8 v7 = [(NSMutableOrderedSet *)self->_topLevelLayers isEqualToOrderedSet:v6[1]];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSArray)contentLayers
{
  if ([(NSMutableArray *)self->_parentLayerAndChildLayersStack count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8038);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B01CC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8058);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile contentLayers]");
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 215, 0, "Should not attempt to access content layers when some parent layers are still pushed, since the returned layers may not represent a complete layer hierarchy.");
  }
  id v6 = [(NSMutableOrderedSet *)self->_topLevelLayers array];

  return (NSArray *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentLayerAndChildLayersStack, 0);

  objc_storeStrong((id *)&self->_topLevelLayers, 0);
}

@end