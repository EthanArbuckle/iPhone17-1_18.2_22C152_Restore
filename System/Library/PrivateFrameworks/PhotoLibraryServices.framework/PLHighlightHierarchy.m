@interface PLHighlightHierarchy
- (NSMutableSet)dayGroupHighlights;
- (NSMutableSet)dayHighlights;
- (NSMutableSet)moments;
- (PLHighlightHierarchy)init;
- (void)_addDayHighlight:(id)a3;
- (void)_addMoment:(id)a3;
- (void)addDayGroupHighlight:(id)a3;
- (void)addDayHighlight:(id)a3;
- (void)addMoment:(id)a3;
@end

@implementation PLHighlightHierarchy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayGroupHighlights, 0);
  objc_storeStrong((id *)&self->_dayHighlights, 0);
  objc_storeStrong((id *)&self->_moments, 0);
}

- (NSMutableSet)dayGroupHighlights
{
  return self->_dayGroupHighlights;
}

- (NSMutableSet)dayHighlights
{
  return self->_dayHighlights;
}

- (NSMutableSet)moments
{
  return self->_moments;
}

- (void)addDayGroupHighlight:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSMutableSet *)self->_dayGroupHighlights containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_dayGroupHighlights addObject:v4];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = objc_msgSend(v4, "childDayGroupPhotosHighlights", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(PLHighlightHierarchy *)self _addDayHighlight:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_addDayHighlight:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSMutableSet *)self->_dayHighlights containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_dayHighlights addObject:v4];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = objc_msgSend(v4, "moments", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(PLHighlightHierarchy *)self _addMoment:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)addDayHighlight:(id)a3
{
  id v5 = a3;
  id v4 = [v5 parentDayGroupPhotosHighlight];
  if (v4) {
    [(PLHighlightHierarchy *)self addDayGroupHighlight:v4];
  }
  else {
    [(PLHighlightHierarchy *)self _addDayHighlight:v5];
  }
}

- (void)_addMoment:(id)a3
{
  id v4 = a3;
  if (([v4 isDeleted] & 1) == 0
    && ([(NSMutableSet *)self->_moments containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_moments addObject:v4];
  }
}

- (void)addMoment:(id)a3
{
  id v5 = a3;
  id v4 = [v5 highlight];
  if (v4) {
    [(PLHighlightHierarchy *)self addDayHighlight:v4];
  }
  else {
    [(PLHighlightHierarchy *)self _addMoment:v5];
  }
}

- (PLHighlightHierarchy)init
{
  v10.receiver = self;
  v10.super_class = (Class)PLHighlightHierarchy;
  v2 = [(PLHighlightHierarchy *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    moments = v2->_moments;
    v2->_moments = v3;

    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    dayHighlights = v2->_dayHighlights;
    v2->_dayHighlights = v5;

    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    dayGroupHighlights = v2->_dayGroupHighlights;
    v2->_dayGroupHighlights = v7;
  }
  return v2;
}

@end