@interface CatalogViewControllerState
- (BOOL)fieldIsEmpty;
- (BOOL)isShowingCompletions;
- (BOOL)isShowingUniversalFirstTimeExperience;
- (NSString)queryString;
- (UIViewController)completionDetailViewController;
- (int64_t)favoritesState;
- (void)setCompletionDetailViewController:(id)a3;
- (void)setFavoritesState:(int64_t)a3;
- (void)setFieldIsEmpty:(BOOL)a3;
- (void)setQueryString:(id)a3;
- (void)setShowingCompletions:(BOOL)a3;
- (void)setShowingUniversalFirstTimeExperience:(BOOL)a3;
@end

@implementation CatalogViewControllerState

- (int64_t)favoritesState
{
  return self->_favoritesState;
}

- (void)setFavoritesState:(int64_t)a3
{
  self->_favoritesState = a3;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (BOOL)isShowingCompletions
{
  return self->_showingCompletions;
}

- (void)setShowingCompletions:(BOOL)a3
{
  self->_showingCompletions = a3;
}

- (BOOL)isShowingUniversalFirstTimeExperience
{
  return self->_showingUniversalFirstTimeExperience;
}

- (void)setShowingUniversalFirstTimeExperience:(BOOL)a3
{
  self->_showingUniversalFirstTimeExperience = a3;
}

- (BOOL)fieldIsEmpty
{
  return self->_fieldIsEmpty;
}

- (void)setFieldIsEmpty:(BOOL)a3
{
  self->_fieldIsEmpty = a3;
}

- (UIViewController)completionDetailViewController
{
  return self->_completionDetailViewController;
}

- (void)setCompletionDetailViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionDetailViewController, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

@end