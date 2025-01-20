@interface CRLCanvasConnectionKnobConnectionActionTemplate
- (CRLCanvasConnectionKnobConnectionActionTemplate)initWithRepForConnecting:(id)a3 andRepsForDragging:(id)a4;
- (CRLCanvasRepAccessibility)repAXForConnecting;
- (NSMutableDictionary)occludingRepAccessibilitiesByUUID;
- (NSMutableSet)repAccessibilitiesForDragging;
- (void)setOccludingRepAccessibilitiesByUUID:(id)a3;
- (void)setRepAXForConnecting:(id)a3;
- (void)setRepAccessibilitiesForDragging:(id)a3;
@end

@implementation CRLCanvasConnectionKnobConnectionActionTemplate

- (CRLCanvasConnectionKnobConnectionActionTemplate)initWithRepForConnecting:(id)a3 andRepsForDragging:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CRLCanvasConnectionKnobConnectionActionTemplate;
  v9 = [(CRLCanvasConnectionKnobConnectionActionTemplate *)&v31 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_repAXForConnecting, a3);
    id v25 = v8;
    id v26 = v7;
    if (v8)
    {
      v11 = (NSMutableSet *)v8;
    }
    else
    {
      v11 = +[NSMutableSet set];
    }
    repAccessibilitiesForDragging = v10->_repAccessibilitiesForDragging;
    v10->_repAccessibilitiesForDragging = v11;

    uint64_t v13 = +[NSMutableDictionary dictionaryWithCapacity:[(NSMutableSet *)v10->_repAccessibilitiesForDragging count]];
    occludingRepAccessibilitiesByUUID = v10->_occludingRepAccessibilitiesByUUID;
    v10->_occludingRepAccessibilitiesByUUID = (NSMutableDictionary *)v13;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v15 = v10->_repAccessibilitiesForDragging;
    id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v27 + 1) + 8 * i) crlaxTarget:v25 v26:v27];
          v21 = [v20 layout];
          v22 = +[CRLCanvasRepAccessibility crlaxBoardItemIDForLayout:v21];

          if (v22)
          {
            v23 = +[NSMutableSet set];
            [(NSMutableDictionary *)v10->_occludingRepAccessibilitiesByUUID setObject:v23 forKeyedSubscript:v22];
          }
        }
        id v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v17);
    }

    id v8 = v25;
    id v7 = v26;
  }

  return v10;
}

- (CRLCanvasRepAccessibility)repAXForConnecting
{
  return self->_repAXForConnecting;
}

- (void)setRepAXForConnecting:(id)a3
{
}

- (NSMutableSet)repAccessibilitiesForDragging
{
  return self->_repAccessibilitiesForDragging;
}

- (void)setRepAccessibilitiesForDragging:(id)a3
{
}

- (NSMutableDictionary)occludingRepAccessibilitiesByUUID
{
  return self->_occludingRepAccessibilitiesByUUID;
}

- (void)setOccludingRepAccessibilitiesByUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occludingRepAccessibilitiesByUUID, 0);
  objc_storeStrong((id *)&self->_repAccessibilitiesForDragging, 0);

  objc_storeStrong((id *)&self->_repAXForConnecting, 0);
}

@end