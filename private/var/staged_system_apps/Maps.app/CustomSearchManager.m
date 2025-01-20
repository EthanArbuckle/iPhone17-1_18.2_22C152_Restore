@interface CustomSearchManager
+ (id)sharedManager;
- (BOOL)isCustomSearchResult:(id)a3;
- (CustomSearchManager)init;
- (SearchResult)customSearchResult;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setCustomSearchResult:(id)a3 animated:(BOOL)a4 shouldSelectOnMap:(id)a5;
- (void)setCustomSearchResult:(id)a3 animated:(BOOL)a4 shouldSelectOnMap:(id)a5 context:(id)a6;
@end

@implementation CustomSearchManager

- (CustomSearchManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CustomSearchManager;
  v2 = [(CustomSearchManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;
  }
  return v2;
}

- (void)setCustomSearchResult:(id)a3 animated:(BOOL)a4 shouldSelectOnMap:(id)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  p_customSearchResult = &self->_customSearchResult;
  if (![self->_customSearchResult isEqualToSearchResult:v11 forPurpose:5])
  {
    if (*p_customSearchResult)
    {
      [*p_customSearchResult removeObserver:self forKeyPath:kAnnotationCoordinateKey];
      [self->_customSearchResult removeObserver:self forKeyPath:@"reverseGeocoded"];
    }
    objc_storeStrong((id *)&self->_customSearchResult, a3);
    if (*p_customSearchResult)
    {
      [*p_customSearchResult addObserver:self forKeyPath:kAnnotationCoordinateKey options:0 context:0];
      [self->_customSearchResult addObserver:self forKeyPath:@"reverseGeocoded" options:0 context:0];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v15 = [(NSHashTable *)self->_observers allObjects];
    id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * i) customSearchManager:self didReplaceCustomSearchResult:v11 animated:v8 shouldSelectOnMap:v12 context:v13];
        }
        id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v17);
    }
  }
}

+ (id)sharedManager
{
  if (qword_10160EAE8 != -1) {
    dispatch_once(&qword_10160EAE8, &stru_1012E8218);
  }
  v2 = (void *)qword_10160EAE0;

  return v2;
}

- (SearchResult)customSearchResult
{
  return self->_customSearchResult;
}

- (void)addObserver:(id)a3
{
}

- (void)dealloc
{
  [self->_customSearchResult removeObserver:self forKeyPath:kAnnotationCoordinateKey];
  [self->_customSearchResult removeObserver:self forKeyPath:@"reverseGeocoded"];
  v3.receiver = self;
  v3.super_class = (Class)CustomSearchManager;
  [(CustomSearchManager *)&v3 dealloc];
}

- (void)setCustomSearchResult:(id)a3 animated:(BOOL)a4 shouldSelectOnMap:(id)a5
{
}

- (BOOL)isCustomSearchResult:(id)a3
{
  return a3 && self->_customSearchResult == a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  v9 = v8;
  if (self->_customSearchResult == a4)
  {
    uint64_t v10 = kAnnotationCoordinateKey;
    if (([v8 isEqualToString:kAnnotationCoordinateKey] & 1) != 0
      || [v9 isEqualToString:@"reverseGeocoded"])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v11 = [(NSHashTable *)self->_observers allObjects];
      id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) customSearchManager:self didModifyCustomSearchResult:self->_customSearchResult coordinateChanged:[v9 isEqualToString:v10]];
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v13);
      }
    }
  }
}

- (void)removeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSearchResult, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end