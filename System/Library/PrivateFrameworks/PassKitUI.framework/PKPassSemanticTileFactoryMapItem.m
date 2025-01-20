@interface PKPassSemanticTileFactoryMapItem
- (BOOL)beginContentAccess;
- (BOOL)isContentDiscarded;
- (MKMapItem)mapItem;
- (PKPassSemanticTileFactoryMapItem)initWithMapItem:(id)a3 icon:(id)a4;
- (UIImage)icon;
- (void)discardContentIfPossible;
- (void)endContentAccess;
@end

@implementation PKPassSemanticTileFactoryMapItem

- (PKPassSemanticTileFactoryMapItem)initWithMapItem:(id)a3 icon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)PKPassSemanticTileFactoryMapItem;
    v9 = [(PKPassSemanticTileFactoryMapItem *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_mapItem, a3);
      objc_storeStrong(p_isa + 3, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)beginContentAccess
{
  BOOL v2 = self->_mapItem != 0;
  self->_contentBeingAcccessed = v2;
  return v2;
}

- (void)discardContentIfPossible
{
  mapItem = self->_mapItem;
  self->_mapItem = 0;

  icon = self->_icon;
  self->_icon = 0;
}

- (void)endContentAccess
{
  self->_contentBeingAcccessed = 0;
}

- (BOOL)isContentDiscarded
{
  return !self->_mapItem || self->_icon == 0;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end