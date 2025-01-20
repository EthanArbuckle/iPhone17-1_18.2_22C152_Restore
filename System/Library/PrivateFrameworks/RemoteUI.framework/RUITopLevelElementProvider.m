@interface RUITopLevelElementProvider
- (BOOL)hasChoiceView;
- (BOOL)hasMultiChoiceView;
- (BOOL)hasPasscodeView;
- (BOOL)hasSpinnerView;
- (BOOL)hasTableView;
- (BOOL)hasWebView;
- (BOOL)isPrimaryElementNilOrKindOf:(Class)a3;
- (RUIElement)parentElement;
- (RUIObjectModel)objectModel;
- (RUIPageElement)pageElement;
- (RUIPasscodeView)passcodeViewOM;
- (RUISpinnerView)spinnerViewOM;
- (RUITableView)tableViewOM;
- (RUITopLevelElementProvider)initWithParentElement:(id)a3;
- (RUITopLevelElementProviderDelegate)delegate;
- (RUITopLevelPageElement)primaryElement;
- (RUIWebView)webViewOM;
- (id)makePasscodeViewOM;
- (id)makeSpinnerViewOM;
- (id)makeTableViewOM;
- (id)makeWebViewOM;
- (void)setDelegate:(id)a3;
- (void)setParentElement:(id)a3;
- (void)setPrimaryElement:(id)a3;
@end

@implementation RUITopLevelElementProvider

- (RUITopLevelElementProvider)initWithParentElement:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RUITopLevelElementProvider;
  v5 = [(RUITopLevelElementProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_parentElement, v4);
  }

  return v6;
}

- (RUIObjectModel)objectModel
{
  v2 = [(RUITopLevelElementProvider *)self pageElement];
  v3 = [v2 page];
  id v4 = [v3 objectModel];

  return (RUIObjectModel *)v4;
}

- (RUIPageElement)pageElement
{
  v2 = [(RUITopLevelElementProvider *)self parentElement];
  v3 = [v2 pageElement];

  return (RUIPageElement *)v3;
}

- (id)makeWebViewOM
{
  if (!self->_webViewOM)
  {
    v3 = [RUIWebView alloc];
    id v4 = [(RUITopLevelElementProvider *)self pageElement];
    v5 = [(RUIElement *)v3 initWithAttributes:0 parent:v4];
    webViewOM = self->_webViewOM;
    self->_webViewOM = v5;

    v7 = self->_webViewOM;
    uint64_t v8 = [(RUITopLevelElementProvider *)self objectModel];
    [(RUIWebView *)v7 setDelegate:v8];

    v9 = [(RUITopLevelElementProvider *)self delegate];
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if (v8)
    {
      v10 = [(RUITopLevelElementProvider *)self delegate];
      [v10 topLevelElementProvider:self didCreateWebView:self->_webViewOM];
    }
  }
  v11 = self->_webViewOM;
  return v11;
}

- (BOOL)hasWebView
{
  return self->_webViewOM != 0;
}

- (id)makeTableViewOM
{
  if (!self->_tableViewOM)
  {
    v3 = [RUITableView alloc];
    id v4 = [(RUITopLevelElementProvider *)self pageElement];
    v5 = [(RUITableView *)v3 initWithAttributes:0 parent:v4];
    tableViewOM = self->_tableViewOM;
    self->_tableViewOM = v5;

    v7 = self->_tableViewOM;
    uint64_t v8 = [(RUITopLevelElementProvider *)self objectModel];
    [(RUITableView *)v7 setObjectModel:v8];

    v9 = self->_tableViewOM;
    uint64_t v10 = [(RUITopLevelElementProvider *)self pageElement];
    v11 = [(id)v10 page];
    [(RUITableView *)v9 setPage:v11];

    v12 = [(RUITopLevelElementProvider *)self delegate];
    LOBYTE(v10) = objc_opt_respondsToSelector();

    if (v10)
    {
      v13 = [(RUITopLevelElementProvider *)self delegate];
      [v13 topLevelElementProvider:self didCreateTableView:self->_tableViewOM];
    }
  }
  v14 = self->_tableViewOM;
  return v14;
}

- (void)setPrimaryElement:(id)a3
{
  id v9 = a3;
  v5 = self->_primaryElement;
  objc_storeStrong((id *)&self->_primaryElement, a3);
  v6 = [(RUITopLevelElementProvider *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(RUITopLevelElementProvider *)self delegate];
    [v8 topLevelElementProvider:self didSetPrimaryElement:v9 previousElement:v5];
  }
}

- (BOOL)hasTableView
{
  v2 = [(RUITopLevelElementProvider *)self tableViewOM];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isPrimaryElementNilOrKindOf:(Class)a3
{
  id v4 = [(RUITopLevelElementProvider *)self primaryElement];
  if (v4)
  {
    v5 = [(RUITopLevelElementProvider *)self primaryElement];
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

- (id)makePasscodeViewOM
{
  if (!self->_passcodeViewOM)
  {
    BOOL v3 = [RUIPasscodeView alloc];
    id v4 = [(RUITopLevelElementProvider *)self pageElement];
    v5 = [(RUIPasscodeView *)v3 initWithAttributes:0 parent:v4];
    passcodeViewOM = self->_passcodeViewOM;
    self->_passcodeViewOM = v5;

    char v7 = self->_passcodeViewOM;
    uint64_t v8 = [(RUITopLevelElementProvider *)self objectModel];
    [(RUIPasscodeView *)v7 setObjectModel:v8];

    id v9 = self->_passcodeViewOM;
    uint64_t v10 = [(RUITopLevelElementProvider *)self pageElement];
    v11 = [(id)v10 page];
    [(RUIPasscodeView *)v9 setPage:v11];

    v12 = [(RUITopLevelElementProvider *)self delegate];
    LOBYTE(v10) = objc_opt_respondsToSelector();

    if (v10)
    {
      v13 = [(RUITopLevelElementProvider *)self delegate];
      [v13 topLevelElementProvider:self didCreatePasscodeView:self->_passcodeViewOM];
    }
  }
  v14 = self->_passcodeViewOM;
  return v14;
}

- (BOOL)hasPasscodeView
{
  return self->_passcodeViewOM != 0;
}

- (id)makeSpinnerViewOM
{
  if (!self->_spinnerViewOM)
  {
    BOOL v3 = [RUISpinnerView alloc];
    id v4 = [(RUITopLevelElementProvider *)self pageElement];
    v5 = [(RUIElement *)v3 initWithAttributes:0 parent:v4];
    spinnerViewOM = self->_spinnerViewOM;
    self->_spinnerViewOM = v5;

    char v7 = self->_spinnerViewOM;
    uint64_t v8 = [(RUITopLevelElementProvider *)self objectModel];
    [(RUISpinnerView *)v7 setObjectModel:v8];

    id v9 = [(RUITopLevelElementProvider *)self delegate];
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v10 = [(RUITopLevelElementProvider *)self delegate];
      [v10 topLevelElementProvider:self didCreateSpinnerView:self->_spinnerViewOM];
    }
  }
  v11 = self->_spinnerViewOM;
  return v11;
}

- (BOOL)hasSpinnerView
{
  return self->_spinnerViewOM != 0;
}

- (RUITopLevelPageElement)primaryElement
{
  return self->_primaryElement;
}

- (RUITableView)tableViewOM
{
  return self->_tableViewOM;
}

- (RUIWebView)webViewOM
{
  return self->_webViewOM;
}

- (RUIPasscodeView)passcodeViewOM
{
  return self->_passcodeViewOM;
}

- (RUISpinnerView)spinnerViewOM
{
  return self->_spinnerViewOM;
}

- (RUIElement)parentElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentElement);
  return (RUIElement *)WeakRetained;
}

- (void)setParentElement:(id)a3
{
}

- (RUITopLevelElementProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUITopLevelElementProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasChoiceView
{
  return self->_hasChoiceView;
}

- (BOOL)hasMultiChoiceView
{
  return self->_hasMultiChoiceView;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_parentElement);
  objc_storeStrong((id *)&self->_spinnerViewOM, 0);
  objc_storeStrong((id *)&self->_passcodeViewOM, 0);
  objc_storeStrong((id *)&self->_webViewOM, 0);
  objc_storeStrong((id *)&self->_tableViewOM, 0);
  objc_storeStrong((id *)&self->_primaryElement, 0);
}

@end