@interface PersonalizedItemSource
+ (id)clientFeatureIDFromAdornment:(id)a3 mapItem:(id)a4;
- (NSArray)allItems;
- (PersonalizedItemSource)initWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4;
- (id)_observers;
- (int64_t)sourceSubtype;
- (int64_t)sourceType;
- (void)_notifyObserversItemsDidChange;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation PersonalizedItemSource

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PersonalizedItemSource *)self _observers];
  [v5 removeObject:v4];
}

- (void)_notifyObserversItemsDidChange
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSHashTable *)self->_observers copy];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) personalizedItemSourceDidChangeItems:self];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PersonalizedItemSource *)self _observers];
  [v5 addObject:v4];
}

- (id)_observers
{
  observers = self->_observers;
  if (!observers)
  {
    id v4 = +[NSHashTable weakObjectsHashTable];
    id v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

+ (id)clientFeatureIDFromAdornment:(id)a3 mapItem:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 styleAttributes];
  uint64_t v7 = (int)[v6 poiType];
  [v5 _coordinate];
  double v9 = -v8;
  if (v8 >= 0.0) {
    double v9 = v8;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  double v12 = fmod(v10, 1.84467441e19);
  unint64_t v13 = 2654435761u * (unint64_t)v12;
  unint64_t v14 = v13 + (unint64_t)v11;
  if (v11 <= 0.0) {
    unint64_t v14 = 2654435761u * (unint64_t)v12;
  }
  unint64_t v15 = v13 - (unint64_t)fabs(v11);
  if (v11 >= 0.0) {
    unint64_t v15 = v14;
  }
  unint64_t v16 = v15 ^ v7;
  [v5 _coordinate];
  if (v17 < 0.0) {
    double v17 = -v17;
  }
  long double v18 = floor(v17 + 0.5);
  double v19 = (v17 - v18) * 1.84467441e19;
  double v20 = fmod(v18, 1.84467441e19);
  unint64_t v21 = 2654435761u * (unint64_t)v20;
  unint64_t v22 = v21 + (unint64_t)v19;
  if (v19 <= 0.0) {
    unint64_t v22 = 2654435761u * (unint64_t)v20;
  }
  unint64_t v23 = v21 - (unint64_t)fabs(v19);
  if (v19 >= 0.0) {
    unint64_t v23 = v22;
  }
  unint64_t v24 = v16 ^ v23;

  v25 = [v5 _geoMapItem];
  v26 = [v25 name];

  if (v26)
  {
    v27 = [v5 _geoMapItem];
    v28 = [v27 name];
    v24 ^= (unint64_t)[v28 hash];
  }
  v29 = +[PersonalizedItemClientFeatureIDAdornment adornmentWithClientFeatureID:v24];

  return v29;
}

- (PersonalizedItemSource)initWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PersonalizedItemSource;
  result = [(PersonalizedItemSource *)&v7 init];
  if (result)
  {
    result->_sourceType = a3;
    result->_sourceSubtype = a4;
  }
  return result;
}

- (void).cxx_destruct
{
}

- (NSArray)allItems
{
  return 0;
}

- (int64_t)sourceSubtype
{
  return self->_sourceSubtype;
}

@end