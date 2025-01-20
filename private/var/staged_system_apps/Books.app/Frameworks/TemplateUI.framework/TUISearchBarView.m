@interface TUISearchBarView
+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 name:(id)a7 identifier:(id)a8 editingInsets:(UIEdgeInsets)a9 placeholderText:(id)a10 style:(id)a11 text:(id)a12 returnKeyType:(id)a13 keyboardAppearance:(unint64_t)a14 cancelText:(id)a15 showCancel:(BOOL)a16;
+ (id)tuiReuseIdentifier;
- (TUIMutableDynamicValue)dynamicViewState;
- (_TUISearchBarViewState)viewStateToRestore;
- (id)_textForControlUsingRenderModel:(id)a3;
- (id)currentState;
- (id)viewStateSave;
- (void)_callActionHandlerForTrigger:(id)a3 arguments:(id)a4;
- (void)_searchBarDidSubmitSearch:(id)a3;
- (void)_updateDynamicViewState;
- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4;
- (void)dealloc;
- (void)loadControlIfNeeded;
- (void)prepareForReuse;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarBookmarkButtonClicked:(id)a3;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)setDynamicViewState:(id)a3;
- (void)setViewStateToRestore:(id)a3;
- (void)viewStateRestore:(id)a3;
@end

@implementation TUISearchBarView

+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 name:(id)a7 identifier:(id)a8 editingInsets:(UIEdgeInsets)a9 placeholderText:(id)a10 style:(id)a11 text:(id)a12 returnKeyType:(id)a13 keyboardAppearance:(unint64_t)a14 cancelText:(id)a15 showCancel:(BOOL)a16
{
  BOOL v40 = a6;
  double right = a9.right;
  double bottom = a9.bottom;
  double left = a9.left;
  double top = a9.top;
  id v37 = a15;
  id v23 = a13;
  id v34 = a12;
  id v33 = a11;
  id v24 = a10;
  id v35 = a8;
  id v31 = a7;
  id v32 = a5;
  id v25 = a4;
  id v26 = a3;
  v27 = [TUIRenderModelInteractiveText alloc];
  v28 = [a1 tuiReuseIdentifier];
  LOBYTE(v30) = a16;
  v41 = -[TUIRenderModelInteractiveText initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:cancelText:showCancel:](v27, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:cancelText:showCancel:", v28, v35, v26, v25, v32, v40, top, left, bottom, right, v31, v33, v24, v34, v23, a14,
          v37,
          v30);

  return v41;
}

- (void)dealloc
{
  v3 = [(TUIInteractiveBaseView *)self control];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)TUISearchBarView;
  [(TUISearchBarView *)&v4 dealloc];
}

+ (id)tuiReuseIdentifier
{
  return @"TUIReuseIdentifierSearchBarView";
}

- (id)currentState
{
  v3 = @"default";
  objc_super v4 = [(TUIInteractiveBaseView *)self control];
  unsigned int v5 = [v4 isFocused];
  v6 = [v4 text];
  id v7 = [v6 length];

  if (v7)
  {
    v8 = @"hasValue";

    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    v9 = TUIElementStateEditingHasValue;
    goto LABEL_6;
  }
  if (v5)
  {
    v9 = TUIElementStateEditing;
    v8 = v3;
LABEL_6:
    v3 = *v9;
  }
  v8 = v3;
LABEL_8:

  return v8;
}

- (void)loadControlIfNeeded
{
  v3 = [(TUIInteractiveBaseView *)self control];
  if (!v3)
  {
    objc_super v4 = [TUIUIKitSearchBar alloc];
    [(TUISearchBarView *)self bounds];
    id v7 = -[TUIUIKitSearchBar initWithFrame:](v4, "initWithFrame:");
    unsigned int v5 = [(TUISearchBarView *)self viewStateToRestore];
    v6 = [v5 text];
    [(TUIUIKitSearchBar *)v7 setText:v6];

    [(TUIUIKitSearchBar *)v7 setDelegate:self];
    [(TUIUIKitSearchBar *)v7 setSearchBarStyle:2];
    [(TUIUIKitSearchBar *)v7 _setAutoDisableCancelButton:0];
    [(TUISearchBarView *)self addSubview:v7];
    [(TUIInteractiveBaseView *)self setControl:v7];
    [(TUISearchBarView *)self setViewStateToRestore:0];
    v3 = v7;
  }
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  v32.receiver = self;
  v32.super_class = (Class)TUISearchBarView;
  -[TUIInteractiveBaseView configureWithModel:outsets:](&v32, "configureWithModel:outsets:", v9, top, left, bottom, right);
  [(TUISearchBarView *)self setViewStateToRestore:0];
  id v10 = v9;
  v11 = v10;
  if (v10)
  {
    v12 = [v10 viewState];
    dynamicViewState = self->_dynamicViewState;
    self->_dynamicViewState = v12;

    v14 = [(TUIInteractiveBaseView *)self control];
    v15 = [(TUISearchBarView *)self _textForControlUsingRenderModel:v11];
    [v14 setText:v15];

    if ([v11 returnKeyType])
    {
      v16 = [(TUIInteractiveBaseView *)self control];
      [v16 setReturnKeyType:[v11 returnKeyType]];
    }
    v17 = [v11 cancelText];

    if (v17)
    {
      v18 = [(TUIInteractiveBaseView *)self control];
      v19 = [v11 cancelText];
      [v18 setCancelText:v19];
    }
    id v20 = [v11 enabled];
    v21 = [(TUIInteractiveBaseView *)self control];
    [v21 setEnabled:v20];

    v22 = [(TUIInteractiveBaseView *)self control];
    [v22 setShouldShowCancelButton:[v11 showCancel]];

    id v23 = [v11 placeholderText];

    if (v23)
    {
      id v24 = [(TUIInteractiveBaseView *)self control];
      id v25 = [v24 searchField];
      id v26 = [v11 placeholderText];
      [v25 setAttributedPlaceholder:v26];
    }
    BOOL v27 = TUIPlatformKeyboardAppearanceFromKeyboardAppearance((BOOL)[v11 keyboardAppearance]);
    v28 = [(TUIInteractiveBaseView *)self control];
    id v29 = [v28 keyboardAppearance];

    if ((id)v27 != v29)
    {
      uint64_t v30 = [(TUIInteractiveBaseView *)self control];
      [v30 setKeyboardAppearance:v27];

      id v31 = [(TUIInteractiveBaseView *)self control];
      [v31 reloadInputViewsWithoutReset];
    }
  }
}

- (void)_updateDynamicViewState
{
  if (self->_dynamicViewState)
  {
    v3 = [(TUIInteractiveBaseView *)self control];

    if (v3)
    {
      dynamicViewState = self->_dynamicViewState;
      CFStringRef v9 = @"value";
      unsigned int v5 = [(TUIInteractiveBaseView *)self control];
      v6 = [v5 searchField];
      id v7 = [v6 text];
      id v10 = v7;
      v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      [(TUIMutableDynamicValue *)dynamicViewState updateWithValueIfChanged:v8];
    }
  }
}

- (id)viewStateSave
{
  v2 = [(TUIInteractiveBaseView *)self control];
  if (v2)
  {
    v3 = [_TUISearchBarViewState alloc];
    objc_super v4 = [v2 text];
    unsigned int v5 = [(_TUISearchBarViewState *)v3 initWithText:v4];
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (void)viewStateRestore:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(TUIInteractiveBaseView *)self control];

  if (v7 && v4)
  {
    unsigned int v5 = [v7 text];

    v6 = [(TUIInteractiveBaseView *)self control];
    [v6 setText:v5];

    [(TUIInteractiveBaseView *)self updateFromState];
  }
  else
  {
    [(TUISearchBarView *)self setViewStateToRestore:v7];
  }
}

- (id)_textForControlUsingRenderModel:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(TUIInteractiveBaseView *)self control];
  v6 = [v5 text];

  if (!v6)
  {
    v6 = [(_TUISearchBarViewState *)self->_viewStateToRestore text];
    if (!v6)
    {
      v6 = [v4 text];
    }
  }

  return v6;
}

- (void)_callActionHandlerForTrigger:(id)a3 arguments:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUIInteractiveBaseView *)self renderModel];
  v8 = [v9 actionHandler];
  [v8 invoke:v7 arguments:v6];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  [(TUIInteractiveBaseView *)self updateFromState];
  CFStringRef v9 = @"value";
  unsigned int v5 = [(TUIInteractiveBaseView *)self control];
  id v6 = [v5 text];
  id v10 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [(TUISearchBarView *)self _callActionHandlerForTrigger:@"beginInput" arguments:v7];

  v8 = [(TUIInteractiveBaseView *)self control];
  LODWORD(v5) = [v8 shouldShowCancelButton];

  if (v5)
  {
    [v4 setShowsCancelButton:1 animated:1];
    [v4 becomeFirstResponder];
  }
  [(TUISearchBarView *)self _updateDynamicViewState];
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  [(TUIInteractiveBaseView *)self updateFromState];
  CFStringRef v11 = @"value";
  unsigned int v5 = [(TUIInteractiveBaseView *)self control];
  id v6 = [v5 text];
  v12 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [(TUISearchBarView *)self _callActionHandlerForTrigger:@"endInput" arguments:v7];

  v8 = [(TUIInteractiveBaseView *)self control];
  CFStringRef v9 = [v8 text];
  id v10 = [v9 length];

  if (!v10) {
    [v4 setShowsCancelButton:0 animated:1];
  }
  [(TUISearchBarView *)self _updateDynamicViewState];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  [(TUIInteractiveBaseView *)self updateFromState];
  CFStringRef v8 = @"value";
  unsigned int v5 = [(TUIInteractiveBaseView *)self control];
  id v6 = [v5 text];
  CFStringRef v9 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [(TUISearchBarView *)self _callActionHandlerForTrigger:@"changedInput" arguments:v7];

  [(TUISearchBarView *)self _updateDynamicViewState];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)searchBarBookmarkButtonClicked:(id)a3
{
}

- (void)_searchBarDidSubmitSearch:(id)a3
{
  id v4 = a3;
  CFStringRef v10 = @"value";
  unsigned int v5 = [(TUIInteractiveBaseView *)self control];
  id v6 = [v5 text];
  CFStringRef v11 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [(TUISearchBarView *)self _callActionHandlerForTrigger:@"returnPressed" arguments:v7];

  CFStringRef v8 = [(TUIInteractiveBaseView *)self control];
  unsigned int v9 = [v8 shouldShowCancelButton];

  if (v9) {
    [v4 resignFirstResponder];
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(TUIInteractiveBaseView *)self control];
  [v5 setText:&stru_257BF0];

  CFStringRef v9 = @"value";
  id v6 = [(TUIInteractiveBaseView *)self control];
  id v7 = [v6 text];
  CFStringRef v10 = v7;
  CFStringRef v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [(TUISearchBarView *)self _callActionHandlerForTrigger:@"cancelPressed" arguments:v8];

  [v4 setShowsCancelButton:0 animated:1];
  [v4 resignFirstResponder];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)TUISearchBarView;
  [(TUIInteractiveBaseView *)&v4 prepareForReuse];
  [(TUISearchBarView *)self setViewStateToRestore:0];
  v3 = [(TUIInteractiveBaseView *)self control];
  [v3 setText:0];
}

- (_TUISearchBarViewState)viewStateToRestore
{
  return self->_viewStateToRestore;
}

- (void)setViewStateToRestore:(id)a3
{
}

- (TUIMutableDynamicValue)dynamicViewState
{
  return self->_dynamicViewState;
}

- (void)setDynamicViewState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicViewState, 0);

  objc_storeStrong((id *)&self->_viewStateToRestore, 0);
}

@end