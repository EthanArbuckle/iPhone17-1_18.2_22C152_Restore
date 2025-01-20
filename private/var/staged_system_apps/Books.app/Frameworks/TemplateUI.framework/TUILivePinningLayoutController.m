@interface TUILivePinningLayoutController
- (BOOL)hasTabBar;
- (CGRect)currentAdjustedViewBounds;
- (CGRect)currentViewBounds;
- (NSMapTable)entryMap;
- (TUILivePinningLayoutController)init;
- (TUIRenderModelCollection)renderModel;
- (id)liveAttributesForRenderModel:(id)a3;
- (void)setCurrentAdjustedViewBounds:(CGRect)a3;
- (void)setCurrentViewBounds:(CGRect)a3;
- (void)setEntryMap:(id)a3;
- (void)setHasTabBar:(BOOL)a3;
- (void)setRenderModel:(id)a3;
- (void)setRenderModel:(id)a3 withInvalidationContext:(id)a4;
- (void)updatePinningTransformsWithViewBounds:(CGRect)a3 adjustedViewBounds:(CGRect)a4 invalidationContext:(id)a5 hasTabBar:(BOOL)a6;
@end

@implementation TUILivePinningLayoutController

- (TUILivePinningLayoutController)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUILivePinningLayoutController;
  v2 = [(TUILivePinningLayoutController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    CGPoint origin = CGRectZero.origin;
    CGSize size = CGRectZero.size;
    v2->_currentViewBounds.CGPoint origin = CGRectZero.origin;
    v2->_currentViewBounds.CGSize size = size;
    v2->_currentAdjustedViewBounds.CGPoint origin = origin;
    v2->_currentAdjustedViewBounds.CGSize size = size;
    entryMap = v2->_entryMap;
    v2->_entryMap = 0;

    v3->_hasTabBar = 0;
  }
  return v3;
}

- (void)setRenderModel:(id)a3 withInvalidationContext:(id)a4
{
  v7 = (TUIRenderModelCollection *)a3;
  id v8 = a4;
  if (self->_renderModel != v7)
  {
    id v24 = v8;
    v25 = v7;
    objc_storeStrong((id *)&self->_renderModel, a3);
    v9 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:512];
    entryMap = self->_entryMap;
    self->_entryMap = v9;

    id v11 = objc_alloc_init((Class)NSMutableArray);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [(TUIRenderModelCollection *)self->_renderModel sections];
    id v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v35;
      double y = CGPointZero.y;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = v13;
          v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
          v15 = [v14 liveTransformsForKind:objc_opt_class()];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v31;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v31 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(id *)(*((void *)&v30 + 1) + 8 * i);
                v21 = objc_alloc_init(_TUIPinningEntry);
                [(_TUIPinningEntry *)v21 setPinningLiveTransform:v20];
                -[_TUIPinningEntry setCurrentOffset:](v21, "setCurrentOffset:", CGPointZero.x, y);
                -[_TUIPinningEntry setDefaultPosition:](v21, "setDefaultPosition:", CGPointZero.x, y);
                [v14 offset];
                -[_TUIPinningEntry setSectionOffset:](v21, "setSectionOffset:");
                [(NSMapTable *)self->_entryMap setObject:v21 forKey:v20];

                [v11 addObject:v21];
              }
              id v17 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v17);
          }

          uint64_t v13 = v29 + 1;
        }
        while ((id)(v29 + 1) != v28);
        id v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v28);
    }

    v22 = (NSArray *)[v11 copy];
    entries = self->_entries;
    self->_entries = v22;

    id v8 = v24;
    -[TUILivePinningLayoutController updatePinningTransformsWithViewBounds:adjustedViewBounds:invalidationContext:hasTabBar:](self, "updatePinningTransformsWithViewBounds:adjustedViewBounds:invalidationContext:hasTabBar:", v24, self->_hasTabBar, self->_currentViewBounds.origin.x, self->_currentViewBounds.origin.y, self->_currentViewBounds.size.width, self->_currentViewBounds.size.height, self->_currentAdjustedViewBounds.origin.x, self->_currentAdjustedViewBounds.origin.y, self->_currentAdjustedViewBounds.size.width, self->_currentAdjustedViewBounds.size.height);

    v7 = v25;
  }
}

- (void)updatePinningTransformsWithViewBounds:(CGRect)a3 adjustedViewBounds:(CGRect)a4 invalidationContext:(id)a5 hasTabBar:(BOOL)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v11 = a3.size.height;
  CGFloat v12 = a3.size.width;
  CGFloat v13 = a3.origin.y;
  CGFloat v14 = a3.origin.x;
  id v16 = a5;
  self->_currentViewBounds.origin.CGFloat x = v14;
  self->_currentViewBounds.origin.CGFloat y = v13;
  self->_currentViewBounds.size.CGFloat width = v12;
  self->_currentViewBounds.size.CGFloat height = v11;
  self->_currentAdjustedViewBounds.origin.CGFloat x = x;
  self->_currentAdjustedViewBounds.origin.CGFloat y = y;
  self->_currentAdjustedViewBounds.size.CGFloat width = width;
  self->_currentAdjustedViewBounds.size.CGFloat height = height;
  self->_hasTabBar = a6;
  entries = self->_entries;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1650EC;
  v19[3] = &unk_256D18;
  CGFloat v21 = v14;
  CGFloat v22 = v13;
  CGFloat v23 = v12;
  CGFloat v24 = v11;
  CGFloat v25 = x;
  CGFloat v26 = y;
  CGFloat v27 = width;
  CGFloat v28 = height;
  BOOL v29 = a6;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [(NSArray *)entries enumerateObjectsUsingBlock:v19];
}

- (id)liveAttributesForRenderModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 liveTransform];
  v6 = [(NSMapTable *)self->_entryMap objectForKey:v5];
  [v4 center];
  double v8 = v7;
  [v4 center];
  double v10 = v9;
  [v6 currentOffset];
  double v12 = v8 + v11;
  double v14 = v10 + v13;
  [v6 sectionOffset];
  double v16 = v12 - v15;
  [v6 sectionOffset];
  double v18 = v14 - v17;
  v19 = objc_alloc_init(TUILayoutAttributes);
  -[TUILayoutAttributes setCenter:](v19, "setCenter:", v16, v18);
  [v4 size];
  -[TUILayoutAttributes setSize:](v19, "setSize:");
  if (v4)
  {
    [v4 transform];
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
  }
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  [(TUILayoutAttributes *)v19 setTransform:v21];

  return v19;
}

- (TUIRenderModelCollection)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (CGRect)currentViewBounds
{
  double x = self->_currentViewBounds.origin.x;
  double y = self->_currentViewBounds.origin.y;
  double width = self->_currentViewBounds.size.width;
  double height = self->_currentViewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentViewBounds:(CGRect)a3
{
  self->_currentViewBounds = a3;
}

- (CGRect)currentAdjustedViewBounds
{
  double x = self->_currentAdjustedViewBounds.origin.x;
  double y = self->_currentAdjustedViewBounds.origin.y;
  double width = self->_currentAdjustedViewBounds.size.width;
  double height = self->_currentAdjustedViewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentAdjustedViewBounds:(CGRect)a3
{
  self->_currentAdjustedViewBounds = a3;
}

- (NSMapTable)entryMap
{
  return self->_entryMap;
}

- (void)setEntryMap:(id)a3
{
}

- (BOOL)hasTabBar
{
  return self->_hasTabBar;
}

- (void)setHasTabBar:(BOOL)a3
{
  self->_hasTabBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryMap, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);

  objc_storeStrong((id *)&self->_entries, 0);
}

@end