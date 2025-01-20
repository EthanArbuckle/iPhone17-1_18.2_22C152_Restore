@interface PUOneUpTilingLayoutInvalidationContext
- (BOOL)invalidatedAccessoryTile;
- (BOOL)invalidatedCommentsTile;
- (BOOL)invalidatedContentInsets;
- (BOOL)invalidatedContentOffset;
- (BOOL)invalidatedVideoPlaceholderTile;
- (unint64_t)options;
- (void)_setInvalidatedAccessoryTile:(BOOL)a3;
- (void)_setInvalidatedContentInsets:(BOOL)a3;
- (void)_setInvalidatedContentOffset:(BOOL)a3;
- (void)_setInvalidatedVideoPlaceholderTile:(BOOL)a3;
- (void)_setOptions:(unint64_t)a3;
@end

@implementation PUOneUpTilingLayoutInvalidationContext

- (void)_setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)_setInvalidatedVideoPlaceholderTile:(BOOL)a3
{
  self->_invalidatedVideoPlaceholderTile = a3;
}

- (BOOL)invalidatedVideoPlaceholderTile
{
  return self->_invalidatedVideoPlaceholderTile;
}

- (void)_setInvalidatedContentOffset:(BOOL)a3
{
  self->_invalidatedContentOffset = a3;
}

- (BOOL)invalidatedContentOffset
{
  return self->_invalidatedContentOffset;
}

- (void)_setInvalidatedAccessoryTile:(BOOL)a3
{
  self->_invalidatedAccessoryTile = a3;
}

- (BOOL)invalidatedAccessoryTile
{
  return self->_invalidatedAccessoryTile;
}

- (BOOL)invalidatedCommentsTile
{
  return self->_invalidatedCommentsTile;
}

- (BOOL)invalidatedContentInsets
{
  return self->_invalidatedContentInsets;
}

- (void)_setInvalidatedContentInsets:(BOOL)a3
{
  if (self->_invalidatedContentInsets != a3)
  {
    self->_invalidatedContentInsets = a3;
    if (a3) {
      [(PUTilingLayoutInvalidationContext *)self setInvalidatedAnyTile:1];
    }
  }
}

@end