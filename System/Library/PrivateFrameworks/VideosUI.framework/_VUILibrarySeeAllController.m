@interface _VUILibrarySeeAllController
- (VUILibraryGridCollectionViewController)gridViewController;
- (int64_t)shelfType;
- (void)setGridViewController:(id)a3;
- (void)setShelfType:(int64_t)a3;
@end

@implementation _VUILibrarySeeAllController

- (VUILibraryGridCollectionViewController)gridViewController
{
  return self->_gridViewController;
}

- (void)setGridViewController:(id)a3
{
}

- (int64_t)shelfType
{
  return self->_shelfType;
}

- (void)setShelfType:(int64_t)a3
{
  self->_shelfType = a3;
}

- (void).cxx_destruct
{
}

@end