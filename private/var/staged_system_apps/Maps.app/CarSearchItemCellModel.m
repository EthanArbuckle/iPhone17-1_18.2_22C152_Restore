@interface CarSearchItemCellModel
+ (id)modelWithUpdateBlock:(id)a3;
- (BOOL)isRecent;
- (BOOL)isShowingStops;
- (BOOL)shouldShowChargerlabel;
- (MKMapItem)mapItem;
- (NSNumber)rating;
- (NSSet)observedKeyPaths;
- (NSString)chargerNumberString;
- (NSString)debugSubtitle;
- (NSString)firstLine;
- (NSString)secondLine;
- (id)evChargerLabelText;
- (id)observedObject;
- (id)updateBlock;
- (void)dealloc;
- (void)markAsUpdated;
- (void)observeObject:(id)a3 forKeyPaths:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setChargerNumberString:(id)a3;
- (void)setDebugSubtitle:(id)a3;
- (void)setFirstLine:(id)a3;
- (void)setIsRecent:(BOOL)a3;
- (void)setIsShowingStops:(BOOL)a3;
- (void)setMapItem:(id)a3;
- (void)setObservedKeyPaths:(id)a3;
- (void)setObservedObject:(id)a3;
- (void)setRating:(id)a3;
- (void)setSecondLine:(id)a3;
- (void)setUpdateBlock:(id)a3;
@end

@implementation CarSearchItemCellModel

+ (id)modelWithUpdateBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setUpdateBlock:v4];

  return v5;
}

- (void)dealloc
{
  [(CarSearchItemCellModel *)self observeObject:0 forKeyPaths:0];
  v3.receiver = self;
  v3.super_class = (Class)CarSearchItemCellModel;
  [(CarSearchItemCellModel *)&v3 dealloc];
}

- (void)observeObject:(id)a3 forKeyPaths:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_observedObject)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v9 = self->_observedKeyPaths;
    id v10 = [(NSSet *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          [self->_observedObject removeObserver:self forKeyPath:*(void *)(*((void *)&v27 + 1) + 8 * (void)v13)];
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSSet *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }

    id observedObject = self->_observedObject;
    self->_id observedObject = 0;

    observedKeyPaths = self->_observedKeyPaths;
    self->_observedKeyPaths = 0;
  }
  if (v7 && [v8 count])
  {
    objc_storeStrong(&self->_observedObject, a3);
    v16 = (NSSet *)[v8 copy];
    v17 = self->_observedKeyPaths;
    self->_observedKeyPaths = v16;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v8;
    id v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v18);
          }
          [v7 addObserver:self forKeyPath:*(void *)(*((void *)&v23 + 1) + 8 * (void)v22) options:0 context:(void)v23];
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v20);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  id v8 = [(CarSearchItemCellModel *)self observedKeyPaths];
  unsigned int v9 = [v8 containsObject:v7];

  if (v9)
  {
    [(CarSearchItemCellModel *)self markAsUpdated];
  }
}

- (void)markAsUpdated
{
  objc_super v3 = [(CarSearchItemCellModel *)self updateBlock];
  if (v3)
  {
    markedAsUpdatedOperation = self->_markedAsUpdatedOperation;

    if (!markedAsUpdatedOperation)
    {
      objc_initWeak(&location, self);
      id v8 = _NSConcreteStackBlock;
      uint64_t v9 = 3221225472;
      id v10 = sub_1005E115C;
      id v11 = &unk_1012E6708;
      objc_copyWeak(&v12, &location);
      id v5 = +[NSBlockOperation blockOperationWithBlock:&v8];
      v6 = self->_markedAsUpdatedOperation;
      self->_markedAsUpdatedOperation = v5;

      id v7 = +[NSOperationQueue mainQueue];
      [v7 addOperation:self->_markedAsUpdatedOperation];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)shouldShowChargerlabel
{
  objc_super v3 = [(CarSearchItemCellModel *)self mapItem];
  id v4 = [v3 _geoMapItem];
  if ([v4 _hasEVCharger])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(CarSearchItemCellModel *)self chargerNumberString];
    BOOL v5 = [v6 length] != 0;
  }
  return v5;
}

- (id)evChargerLabelText
{
  if (MapsFeature_IsEnabled_RealTimeEVCharger()
    && ([(CarSearchItemCellModel *)self mapItem],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        [v3 _geoMapItem],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 _hasEVCharger],
        v4,
        v3,
        v5))
  {
    v6 = [(CarSearchItemCellModel *)self mapItem];
    id v7 = [v6 _realTimeAvailableEVCharger];

    id v8 = +[EVChargerUtility realTimeEVChargerDisplayStringWithEvCharger:v7 mapDisplay:0];
  }
  else
  {
    id v8 = &stru_101324E70;
  }

  return v8;
}

- (NSString)firstLine
{
  return self->_firstLine;
}

- (void)setFirstLine:(id)a3
{
}

- (NSString)secondLine
{
  return self->_secondLine;
}

- (void)setSecondLine:(id)a3
{
}

- (NSNumber)rating
{
  return self->_rating;
}

- (void)setRating:(id)a3
{
}

- (NSString)chargerNumberString
{
  return self->_chargerNumberString;
}

- (void)setChargerNumberString:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (BOOL)isRecent
{
  return self->_isRecent;
}

- (void)setIsRecent:(BOOL)a3
{
  self->_isRecent = a3;
}

- (BOOL)isShowingStops
{
  return self->_isShowingStops;
}

- (void)setIsShowingStops:(BOOL)a3
{
  self->_isShowingStops = a3;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (NSSet)observedKeyPaths
{
  return self->_observedKeyPaths;
}

- (void)setObservedKeyPaths:(id)a3
{
}

- (id)observedObject
{
  return self->_observedObject;
}

- (void)setObservedObject:(id)a3
{
}

- (NSString)debugSubtitle
{
  return self->_debugSubtitle;
}

- (void)setDebugSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugSubtitle, 0);
  objc_storeStrong(&self->_observedObject, 0);
  objc_storeStrong((id *)&self->_observedKeyPaths, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_chargerNumberString, 0);
  objc_storeStrong((id *)&self->_rating, 0);
  objc_storeStrong((id *)&self->_secondLine, 0);
  objc_storeStrong((id *)&self->_firstLine, 0);

  objc_storeStrong((id *)&self->_markedAsUpdatedOperation, 0);
}

@end