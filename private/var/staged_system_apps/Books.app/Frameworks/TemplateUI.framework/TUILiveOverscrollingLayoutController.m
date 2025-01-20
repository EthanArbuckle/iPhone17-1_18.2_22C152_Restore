@interface TUILiveOverscrollingLayoutController
- (CGPoint)currentContentOffset;
- (NSMapTable)entryMap;
- (TUILiveOverscrollingLayoutController)init;
- (TUIRenderModelCollection)renderModel;
- (id)liveAttributesForRenderModel:(id)a3;
- (void)setCurrentContentOffset:(CGPoint)a3;
- (void)setEntryMap:(id)a3;
- (void)setRenderModel:(id)a3;
- (void)setRenderModel:(id)a3 withInvalidationContext:(id)a4;
- (void)updateOverscrollingTransformsWithContentOffset:(CGPoint)a3 invalidationContext:(id)a4;
@end

@implementation TUILiveOverscrollingLayoutController

- (TUILiveOverscrollingLayoutController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUILiveOverscrollingLayoutController;
  v2 = [(TUILiveOverscrollingLayoutController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentContentOffset = CGPointZero;
    entryMap = v2->_entryMap;
    v2->_entryMap = 0;
  }
  return v3;
}

- (void)setRenderModel:(id)a3 withInvalidationContext:(id)a4
{
  v7 = (TUIRenderModelCollection *)a3;
  id v8 = a4;
  if (self->_renderModel != v7)
  {
    id v38 = v8;
    objc_storeStrong((id *)&self->_renderModel, a3);
    v9 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:512];
    entryMap = self->_entryMap;
    self->_entryMap = v9;

    id v11 = objc_alloc_init((Class)NSMutableArray);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = [(TUIRenderModelCollection *)self->_renderModel sections];
    id v41 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v41)
    {
      uint64_t v40 = *(void *)v50;
      do
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v50 != v40) {
            objc_enumerationMutation(obj);
          }
          v13 = [*(id *)(*((void *)&v49 + 1) + 8 * i) liveTransformsForKind:objc_opt_class()];
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v14 = [v13 countByEnumeratingWithState:&v45 objects:v53 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v46;
            do
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v46 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(id *)(*((void *)&v45 + 1) + 8 * (void)j);
                v19 = objc_alloc_init(_TUIOverscrollingEntry);
                [(_TUIOverscrollingEntry *)v19 setOverscrollingLiveTransform:v18];
                [v18 size];
                double v21 = v20;
                [v18 size];
                double v23 = v22;
                if (v18)
                {
                  [v18 transform];
                  double v24 = *((double *)&v42 + 1);
                  double v25 = *(double *)&v42;
                  double v26 = *((double *)&v43 + 1);
                  double v27 = *(double *)&v43;
                  double v28 = *((double *)&v44 + 1);
                  double v29 = *(double *)&v44;
                }
                else
                {
                  long long v43 = 0u;
                  long long v44 = 0u;
                  double v28 = 0.0;
                  double v26 = 0.0;
                  double v24 = 0.0;
                  double v29 = 0.0;
                  long long v42 = 0u;
                  double v27 = 0.0;
                  double v25 = 0.0;
                }
                double v30 = v21 * -0.5;
                double v31 = v29 + v23 * -0.5 * v27 + v25 * (v21 * -0.5);
                double v32 = v28 + v23 * -0.5 * v26 + v24 * v30;
                [v18 center];
                double v34 = v31 + v33;
                [v18 center];
                -[_TUIOverscrollingEntry setDefaultOrigin:](v19, "setDefaultOrigin:", v34, v32 + v35);
                [v18 size];
                -[_TUIOverscrollingEntry setDefaultSize:](v19, "setDefaultSize:");
                [(_TUIOverscrollingEntry *)v19 setDefaultScale:1.0];
                [(_TUIOverscrollingEntry *)v19 setCurrentScale:1.0];
                [(NSMapTable *)self->_entryMap setObject:v19 forKey:v18];
                [v11 addObject:v19];
              }
              id v15 = [v13 countByEnumeratingWithState:&v45 objects:v53 count:16];
            }
            while (v15);
          }
        }
        id v41 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v41);
    }

    v36 = (NSArray *)[v11 copy];
    entries = self->_entries;
    self->_entries = v36;

    id v8 = v38;
    -[TUILiveOverscrollingLayoutController updateOverscrollingTransformsWithContentOffset:invalidationContext:](self, "updateOverscrollingTransformsWithContentOffset:invalidationContext:", v38, self->_currentContentOffset.x, self->_currentContentOffset.y);
  }
}

- (void)updateOverscrollingTransformsWithContentOffset:(CGPoint)a3 invalidationContext:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  self->_currentContentOffset.CGFloat x = x;
  self->_currentContentOffset.CGFloat y = y;
  entries = self->_entries;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_121D40;
  v10[3] = &unk_255B60;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [(NSArray *)entries enumerateObjectsUsingBlock:v10];
}

- (id)liveAttributesForRenderModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 liveTransform];
  objc_super v6 = [(NSMapTable *)self->_entryMap objectForKey:v5];
  [v4 center];
  double v8 = v7;
  [v4 center];
  double v10 = v9;
  [v6 defaultOrigin];
  double v12 = v8 + v11;
  [v6 defaultOrigin];
  double v14 = v10 + v13;
  id v15 = objc_alloc_init(TUILayoutAttributes);
  -[TUILayoutAttributes setCenter:](v15, "setCenter:", v12, v14);
  [v4 size];
  -[TUILayoutAttributes setSize:](v15, "setSize:");
  memset(&v46, 0, sizeof(v46));
  [v6 currentScale];
  CGFloat v17 = v16;
  [v6 currentScale];
  CGAffineTransformMakeScale(&v46, v17, v18);
  [v4 center];
  double v20 = v19;
  [v6 defaultSize];
  double v22 = v21;
  [v4 center];
  double v24 = v23;
  [v6 defaultSize];
  double v26 = v25;
  long long v27 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v28 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v45.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v45.c = v28;
  long long v29 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&v45.tCGFloat x = v29;
  if (v5)
  {
    long long v34 = v28;
    long long v35 = v27;
    long long v33 = v29;
    [v5 transform];
    long long v29 = v33;
    long long v28 = v34;
    long long v27 = v35;
  }
  else
  {
    memset(&t2, 0, sizeof(t2));
  }
  *(_OWORD *)&t1.a = v27;
  *(_OWORD *)&t1.c = v28;
  *(_OWORD *)&t1.tCGFloat x = v29;
  CGAffineTransformConcat(&v45, &t1, &t2);
  if (v4) {
    [v4 transform];
  }
  else {
    memset(&v42, 0, sizeof(v42));
  }
  CGAffineTransform v41 = v45;
  CGAffineTransformConcat(&t1, &v41, &v42);
  CGAffineTransform v45 = t1;
  [v6 currentScale];
  if (v30 != 1.0)
  {
    CGFloat v31 = v20 - v22 * 0.5;
    CGAffineTransformMakeTranslation(&v40, v31, v24 - v26 * 0.5);
    CGAffineTransform v41 = v45;
    CGAffineTransformConcat(&t1, &v41, &v40);
    CGAffineTransform v45 = t1;
    CGAffineTransform v41 = t1;
    CGAffineTransform v39 = v46;
    CGAffineTransformConcat(&t1, &v41, &v39);
    CGAffineTransform v45 = t1;
    CGAffineTransformMakeTranslation(&v38, -v31, -(v24 - v26 * 0.5));
    CGAffineTransform v41 = v45;
    CGAffineTransformConcat(&t1, &v41, &v38);
    CGAffineTransform v45 = t1;
    CGAffineTransformMakeTranslation(&v37, 0.0, self->_currentContentOffset.y * 0.5);
    CGAffineTransform v41 = v45;
    CGAffineTransformConcat(&t1, &v41, &v37);
    CGAffineTransform v45 = t1;
  }
  CGAffineTransform v36 = v45;
  [(TUILayoutAttributes *)v15 setTransform:&v36];

  return v15;
}

- (TUIRenderModelCollection)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (CGPoint)currentContentOffset
{
  double x = self->_currentContentOffset.x;
  double y = self->_currentContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentContentOffset:(CGPoint)a3
{
  self->_currentContentOffset = a3;
}

- (NSMapTable)entryMap
{
  return self->_entryMap;
}

- (void)setEntryMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryMap, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);

  objc_storeStrong((id *)&self->_entries, 0);
}

@end