@interface _UIFindInteraction
- (BOOL)isFindNavigatorVisible;
- (NSString)replacementText;
- (NSString)searchText;
- (UIFindInteraction)wrappedFindInteraction;
- (UIView)view;
- (_UIFindInteraction)init;
- (_UITextSearching)searchableObject;
- (id)findInteraction:(id)a3 sessionForView:(id)a4;
- (void)didMoveToView:(id)a3;
- (void)dismissFindNavigator;
- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4;
- (void)findInteraction:(id)a3 didEndFindSession:(id)a4;
- (void)findNext;
- (void)findPrevious;
- (void)presentFindNavigatorShowingReplace:(BOOL)a3;
- (void)setReplacementText:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setSearchableObject:(id)a3;
- (void)setWrappedFindInteraction:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIFindInteraction

- (void)willMoveToView:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setSearchableObject:(id)a3
{
}

- (void)didMoveToView:(id)a3
{
  id v7 = a3;
  objc_storeWeak((id *)&self->_view, v7);
  wrappedFindInteraction = self->_wrappedFindInteraction;
  if (!wrappedFindInteraction)
  {
    v5 = [[UIFindInteraction alloc] initWithSessionDelegate:self];
    v6 = self->_wrappedFindInteraction;
    self->_wrappedFindInteraction = v5;

    wrappedFindInteraction = self->_wrappedFindInteraction;
  }
  [(UIFindInteraction *)wrappedFindInteraction didMoveToView:v7];
}

- (_UIFindInteraction)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFindInteraction;
  return [(_UIFindInteraction *)&v3 init];
}

- (void)presentFindNavigatorShowingReplace:(BOOL)a3
{
}

- (void)dismissFindNavigator
{
}

- (void)findNext
{
}

- (void)findPrevious
{
}

- (BOOL)isFindNavigatorVisible
{
  return [(UIFindInteraction *)self->_wrappedFindInteraction isFindNavigatorVisible];
}

- (NSString)searchText
{
  return [(UIFindInteraction *)self->_wrappedFindInteraction searchText];
}

- (void)setSearchText:(id)a3
{
}

- (NSString)replacementText
{
  return [(UIFindInteraction *)self->_wrappedFindInteraction replacementText];
}

- (void)setReplacementText:(id)a3
{
}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  v5 = [UITextSearchingFindSession alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  id v7 = [(UITextSearchingFindSession *)v5 initWithSearchableObject:WeakRetained];

  return v7;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  p_searchableObject = &self->_searchableObject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_searchableObject);
    [v7 didBeginTextSearchOperation];
  }
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  p_searchableObject = &self->_searchableObject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_searchableObject);
    [v7 didEndTextSearchOperation];
  }
}

- (_UITextSearching)searchableObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  return (_UITextSearching *)WeakRetained;
}

- (UIFindInteraction)wrappedFindInteraction
{
  return self->_wrappedFindInteraction;
}

- (void)setWrappedFindInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedFindInteraction, 0);
  objc_destroyWeak((id *)&self->_searchableObject);
  objc_destroyWeak((id *)&self->_view);
}

@end