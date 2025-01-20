@interface CRLCanvasLayoutControllerTemporaryCanvasDelegate
- (CRLCanvasLayoutControllerTemporaryCanvasDelegate)initWithInfos:(id)a3;
- (id)getBoardItemForUUID:(id)a3;
@end

@implementation CRLCanvasLayoutControllerTemporaryCanvasDelegate

- (CRLCanvasLayoutControllerTemporaryCanvasDelegate)initWithInfos:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CRLCanvasLayoutControllerTemporaryCanvasDelegate;
  v5 = [(CRLCanvasLayoutControllerTemporaryCanvasDelegate *)&v38 init];
  v6 = v5;
  if (v5)
  {
    v26 = v5;
    v7 = +[NSMutableDictionary dictionary];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v27 = v4;
    id obj = v4;
    id v8 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v12 = objc_opt_class();
          v13 = sub_1002469D0(v12, v11);
          v14 = v13;
          if (v13)
          {
            v15 = [v13 id];
            [v7 setObject:v14 forKey:v15];

            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            v16 = [v14 additionalBoardItemsForUUIDBookkeepingForTemporaryCanvases];
            id v17 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v31;
              do
              {
                for (j = 0; j != v18; j = (char *)j + 1)
                {
                  if (*(void *)v31 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  v21 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
                  v22 = [v21 id];
                  [v7 setObject:v21 forKey:v22];
                }
                id v18 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
              }
              while (v18);
            }
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v9);
    }

    v23 = (NSDictionary *)[v7 copy];
    v6 = v26;
    UUIDsToBoardItems = v26->_UUIDsToBoardItems;
    v26->_UUIDsToBoardItems = v23;

    id v4 = v27;
  }

  return v6;
}

- (id)getBoardItemForUUID:(id)a3
{
  return [(NSDictionary *)self->_UUIDsToBoardItems objectForKeyedSubscript:a3];
}

- (void).cxx_destruct
{
}

@end