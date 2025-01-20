@interface _UISearchTextFieldPasteItem
- (UISearchToken)_searchTokenResult;
- (void)setSearchTokenResult:(id)a3;
@end

@implementation _UISearchTextFieldPasteItem

- (void)setSearchTokenResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchTokenResult, a3);
  id v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UISearchTextFieldPasteItem;
  [(UITextPasteItem *)&v6 setNoResult];
}

- (UISearchToken)_searchTokenResult
{
  return self->_searchTokenResult;
}

- (void).cxx_destruct
{
}

@end