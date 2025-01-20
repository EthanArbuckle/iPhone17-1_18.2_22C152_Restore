@interface OpenFavoritesAction
- (BOOL)isCompatibleWithRestorationTask;
- (OpenFavoritesAction)initWithFavoriteType:(int64_t)a3;
- (int64_t)favoritesType;
- (void)setFavoritesType:(int64_t)a3;
@end

@implementation OpenFavoritesAction

- (OpenFavoritesAction)initWithFavoriteType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OpenFavoritesAction;
  result = [(OpenFavoritesAction *)&v5 init];
  if (result) {
    result->_favoritesType = a3;
  }
  return result;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int64_t)favoritesType
{
  return self->_favoritesType;
}

- (void)setFavoritesType:(int64_t)a3
{
  self->_favoritesType = a3;
}

@end