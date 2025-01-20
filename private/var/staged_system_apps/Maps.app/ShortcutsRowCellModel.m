@interface ShortcutsRowCellModel
- (BOOL)vibrantBackground;
- (GEOObserverHashTable)observers;
- (NSString)_maps_diffableDataSourceIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (UIColor)subtitleColor;
- (UIImage)image;
- (int64_t)contentMode;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation ShortcutsRowCellModel

- (int64_t)contentMode
{
  return 2;
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___ShortcutsRowCellModelObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ShortcutsRowCellModel *)self observers];
  [v5 registerObserver:v4];
}

- (NSString)subtitle
{
  return 0;
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (UIImage)image
{
  return 0;
}

- (BOOL)vibrantBackground
{
  return 0;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ShortcutsRowCellModel *)self observers];
  [v5 unregisterObserver:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleColor, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end