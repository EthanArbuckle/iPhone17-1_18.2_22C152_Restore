@interface TUILiveFloatingLayoutController
- (CGPoint)currentContentOffset;
- (NSMapTable)entryMap;
- (TUIRenderModelCollection)renderModel;
- (id)liveAttributesForRenderModel:(id)a3;
- (void)didUpdateContentOffset:(CGPoint)a3 withInvalidationContext:(id)a4;
- (void)setCurrentContentOffset:(CGPoint)a3;
- (void)setEntryMap:(id)a3;
- (void)setRenderModel:(id)a3;
- (void)setRenderModel:(id)a3 withInvalidationContext:(id)a4;
@end

@implementation TUILiveFloatingLayoutController

- (void)setRenderModel:(id)a3 withInvalidationContext:(id)a4
{
  v7 = (TUIRenderModelCollection *)a3;
  id v8 = a4;
  if (self->_renderModel != v7)
  {
    v38 = v7;
    objc_storeStrong((id *)&self->_renderModel, a3);
    v9 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:512];
    entryMap = self->_entryMap;
    self->_entryMap = v9;

    id v11 = objc_alloc_init((Class)NSMutableArray);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = [(TUIRenderModelCollection *)self->_renderModel sections];
    id v41 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v41)
    {
      uint64_t v40 = *(void *)v48;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v48 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v42 = v12;
          v13 = *(void **)(*((void *)&v47 + 1) + 8 * v12);
          v14 = [v13 liveTransformsForKind:objc_opt_class()];
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v15 = [v14 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v44;
            do
            {
              for (i = 0; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v44 != v17) {
                  objc_enumerationMutation(v14);
                }
                id v19 = *(id *)(*((void *)&v43 + 1) + 8 * i);
                v20 = objc_alloc_init(_TUIFloatingEntry);
                [(_TUIFloatingEntry *)v20 setFloatingLiveTransform:v19];
                [v13 offset];
                -[_TUIFloatingEntry setSectionOffset:](v20, "setSectionOffset:");
                [v13 offset];
                double v22 = v21;
                [v13 size];
                [(_TUIFloatingEntry *)v20 setSectionBottomY:v22 + v23];
                [v13 offset];
                double v25 = v24;
                [v19 center];
                double v27 = v25 + v26;
                [v19 size];
                double v29 = v27 - v28 * 0.5;
                [v13 offset];
                double v31 = v30;
                [v19 center];
                double v33 = v31 + v32;
                [v19 size];
                double v35 = v33 - v34 * 0.5;
                -[_TUIFloatingEntry setCurrentOffset:](v20, "setCurrentOffset:", v29, v35);
                -[_TUIFloatingEntry setDefaultPosition:](v20, "setDefaultPosition:", v29, v35);
                [(NSMapTable *)self->_entryMap setObject:v20 forKey:v19];

                [v11 addObject:v20];
              }
              id v16 = [v14 countByEnumeratingWithState:&v43 objects:v51 count:16];
            }
            while (v16);
          }

          uint64_t v12 = v42 + 1;
        }
        while ((id)(v42 + 1) != v41);
        id v41 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v41);
    }

    [v11 sortUsingComparator:&stru_256280];
    v36 = (NSArray *)[v11 copy];
    entries = self->_entries;
    self->_entries = v36;

    -[TUILiveFloatingLayoutController didUpdateContentOffset:withInvalidationContext:](self, "didUpdateContentOffset:withInvalidationContext:", v8, self->_currentContentOffset.x, self->_currentContentOffset.y);
    v7 = v38;
  }
}

- (void)didUpdateContentOffset:(CGPoint)a3 withInvalidationContext:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  self->_currentContentOffset.CGFloat x = x;
  self->_currentContentOffset.CGFloat y = y;
  NSUInteger v8 = [(NSArray *)self->_entries count];
  entries = self->_entries;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_13CFB0;
  v11[3] = &unk_2562A8;
  id v12 = v7;
  NSUInteger v13 = v8;
  v11[4] = self;
  id v10 = v7;
  [(NSArray *)entries enumerateObjectsUsingBlock:v11];
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
  id v19 = objc_alloc_init(TUILayoutAttributes);
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