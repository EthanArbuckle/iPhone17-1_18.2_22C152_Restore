@interface SUMediaItemCellContext
- (BOOL)itemsHaveArtwork;
- (SUMediaItemCellContext)init;
- (double)artworkWidth;
- (int64_t)hiddenMediaIconTypes;
- (void)setArtworkWidth:(double)a3;
- (void)setHiddenMediaIconTypes:(int64_t)a3;
- (void)setItemsHaveArtwork:(BOOL)a3;
@end

@implementation SUMediaItemCellContext

- (SUMediaItemCellContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUMediaItemCellContext;
  result = [(SUItemCellContext *)&v3 init];
  if (result)
  {
    result->_artworkWidth = -1.0;
    result->_itemsHaveArtwork = 1;
  }
  return result;
}

- (double)artworkWidth
{
  return self->_artworkWidth;
}

- (void)setArtworkWidth:(double)a3
{
  self->_artworkWidth = a3;
}

- (int64_t)hiddenMediaIconTypes
{
  return self->_hiddenMediaIconTypes;
}

- (void)setHiddenMediaIconTypes:(int64_t)a3
{
  self->_hiddenMediaIconTypes = a3;
}

- (BOOL)itemsHaveArtwork
{
  return self->_itemsHaveArtwork;
}

- (void)setItemsHaveArtwork:(BOOL)a3
{
  self->_itemsHaveArtwork = a3;
}

@end