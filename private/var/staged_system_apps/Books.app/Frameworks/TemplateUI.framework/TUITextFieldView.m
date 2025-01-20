@interface TUITextFieldView
+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 name:(id)a7 identifier:(id)a8 editingInsets:(UIEdgeInsets)a9 style:(id)a10 placeholderText:(id)a11 text:(id)a12 returnKeyType:(id)a13 keyboardAppearance:(unint64_t)a14;
+ (id)tuiReuseIdentifier;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)textInitialized;
- (TUIMutableDynamicValue)dynamicViewState;
- (_TUITextFieldViewState)viewStateToRestore;
- (id)_textForControlUsingRenderModel:(id)a3;
- (id)accessibilityLabel;
- (id)currentState;
- (id)viewStateSave;
- (void)_callActionHandlerForTrigger:(id)a3 arguments:(id)a4;
- (void)_textFieldContentChanged;
- (void)_updateDynamicViewState;
- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4;
- (void)dealloc;
- (void)loadControlIfNeeded;
- (void)prepareForReuse;
- (void)setDynamicViewState:(id)a3;
- (void)setTextInitialized:(BOOL)a3;
- (void)setViewStateToRestore:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewStateRestore:(id)a3;
@end

@implementation TUITextFieldView

+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 name:(id)a7 identifier:(id)a8 editingInsets:(UIEdgeInsets)a9 style:(id)a10 placeholderText:(id)a11 text:(id)a12 returnKeyType:(id)a13 keyboardAppearance:(unint64_t)a14
{
  BOOL v36 = a6;
  double right = a9.right;
  double bottom = a9.bottom;
  double left = a9.left;
  double top = a9.top;
  id v34 = a13;
  id v32 = a12;
  id v31 = a11;
  id v23 = a10;
  id v33 = a8;
  id v24 = a7;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  v28 = [TUIRenderModelInteractiveText alloc];
  v29 = [a1 tuiReuseIdentifier];
  v37 = -[TUIRenderModelInteractiveText initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:](v28, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:", v29, v33, v27, v26, v25, v36, top, left, bottom, right, v24, v23, v31, v32, v34, a14);

  return v37;
}

- (void)dealloc
{
  v3 = [(TUIInteractiveBaseView *)self control];
  [v3 setDelegate:0];
  [v3 removeTarget:self action:"_textFieldContentChanged" forControlEvents:0x20000];

  v4.receiver = self;
  v4.super_class = (Class)TUITextFieldView;
  [(TUITextFieldView *)&v4 dealloc];
}

+ (id)tuiReuseIdentifier
{
  return @"TUIReuseIdentifierTextFieldView";
}

- (id)currentState
{
  v3 = @"default";
  objc_super v4 = [(TUIInteractiveBaseView *)self control];
  unsigned int v5 = [v4 isEditing];
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
    objc_super v4 = [TUIUIKitTextField alloc];
    [(TUITextFieldView *)self bounds];
    unsigned int v5 = -[TUIUIKitTextField initWithFrame:](v4, "initWithFrame:");
    [(TUIUIKitTextField *)v5 setDelegate:self];
    [(TUIUIKitTextField *)v5 setEnabled:1];
    [(TUIUIKitTextField *)v5 setText:0];
    [(TUIUIKitTextField *)v5 setAutoresizingMask:18];
    [(TUIUIKitTextField *)v5 addTarget:self action:"_textFieldContentChanged" forControlEvents:0x20000];
    [(TUITextFieldView *)self addSubview:v5];
    [(TUIInteractiveBaseView *)self setControl:v5];
    [(TUITextFieldView *)self setTextInitialized:0];
    v3 = v5;
  }
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  v38.receiver = self;
  v38.super_class = (Class)TUITextFieldView;
  -[TUIInteractiveBaseView configureWithModel:outsets:](&v38, "configureWithModel:outsets:", v9, top, left, bottom, right);
  id v10 = v9;
  v11 = v10;
  if (v10)
  {
    v12 = [v10 viewState];
    dynamicViewState = self->_dynamicViewState;
    self->_dynamicViewState = v12;

    [v11 editingInsets];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v22 = [(TUIInteractiveBaseView *)self control];
    [v22 setEditingInsets:v15, v17, v19, v21];

    id v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    id v34 = sub_189AE0;
    v35 = &unk_251828;
    BOOL v36 = self;
    id v23 = v11;
    id v37 = v23;
    +[UIView performWithoutAnimation:&v32];
    -[TUITextFieldView setTextInitialized:](self, "setTextInitialized:", 1, v32, v33, v34, v35, v36);
    id v24 = [v23 enabled];
    id v25 = [(TUIInteractiveBaseView *)self control];
    [v25 setEnabled:v24];

    [(TUIInteractiveBaseView *)self updateFromState];
    if ([v23 returnKeyType])
    {
      id v26 = [(TUIInteractiveBaseView *)self control];
      [v26 setReturnKeyType:[v23 returnKeyType]];
    }
    BOOL v27 = TUIPlatformKeyboardAppearanceFromKeyboardAppearance((BOOL)[v23 keyboardAppearance]);
    v28 = [(TUIInteractiveBaseView *)self control];
    id v29 = [v28 keyboardAppearance];

    if ((id)v27 != v29)
    {
      v30 = [(TUIInteractiveBaseView *)self control];
      [v30 setKeyboardAppearance:v27];

      id v31 = [(TUIInteractiveBaseView *)self control];
      [v31 reloadInputViewsWithoutReset];
    }
  }
  [(TUITextFieldView *)self setViewStateToRestore:0];
}

- (id)_textForControlUsingRenderModel:(id)a3
{
  id v4 = a3;
  if (!self->_textInitialized
    || ([(TUIInteractiveBaseView *)self control],
        unsigned int v5 = objc_claimAutoreleasedReturnValue(),
        [v5 text],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    v6 = [(_TUITextFieldViewState *)self->_viewStateToRestore text];
    if (!v6)
    {
      v6 = [v4 text];
    }
  }

  return v6;
}

- (void)_updateDynamicViewState
{
  if (self->_dynamicViewState)
  {
    v3 = [(TUIInteractiveBaseView *)self control];

    if (v3)
    {
      dynamicViewState = self->_dynamicViewState;
      CFStringRef v8 = @"value";
      unsigned int v5 = [(TUIInteractiveBaseView *)self control];
      v6 = [v5 text];
      id v9 = v6;
      id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
      [(TUIMutableDynamicValue *)dynamicViewState updateWithValueIfChanged:v7];
    }
  }
}

- (void)_callActionHandlerForTrigger:(id)a3 arguments:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUIInteractiveBaseView *)self renderModel];
  CFStringRef v8 = [v9 actionHandler];
  [v8 invoke:v7 arguments:v6];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  [(TUIInteractiveBaseView *)self updateFromState];
  CFStringRef v7 = @"value";
  id v4 = [(TUIInteractiveBaseView *)self control];
  unsigned int v5 = [v4 text];
  CFStringRef v8 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [(TUITextFieldView *)self _callActionHandlerForTrigger:@"beginInput" arguments:v6];

  [(TUITextFieldView *)self _updateDynamicViewState];
}

- (void)textFieldDidEndEditing:(id)a3
{
  [(TUIInteractiveBaseView *)self updateFromState];
  CFStringRef v7 = @"value";
  id v4 = [(TUIInteractiveBaseView *)self control];
  unsigned int v5 = [v4 text];
  CFStringRef v8 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [(TUITextFieldView *)self _callActionHandlerForTrigger:@"endInput" arguments:v6];

  [(TUITextFieldView *)self _updateDynamicViewState];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  CFStringRef v9 = @"value";
  id v4 = a3;
  unsigned int v5 = [(TUIInteractiveBaseView *)self control];
  id v6 = [v5 text];
  id v10 = v6;
  CFStringRef v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [(TUITextFieldView *)self _callActionHandlerForTrigger:@"returnPressed" arguments:v7];

  [v4 resignFirstResponder];
  return 0;
}

- (void)_textFieldContentChanged
{
  [(TUIInteractiveBaseView *)self updateFromState];
  CFStringRef v6 = @"value";
  v3 = [(TUIInteractiveBaseView *)self control];
  id v4 = [v3 text];
  CFStringRef v7 = v4;
  unsigned int v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(TUITextFieldView *)self _callActionHandlerForTrigger:@"changedInput" arguments:v5];

  [(TUITextFieldView *)self _updateDynamicViewState];
}

- (id)viewStateSave
{
  v2 = [(TUIInteractiveBaseView *)self control];
  if (v2)
  {
    v3 = [_TUITextFieldViewState alloc];
    id v4 = [v2 text];
    unsigned int v5 = [(_TUITextFieldViewState *)v3 initWithText:v4];
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
  id v4 = [(TUIInteractiveBaseView *)self control];

  if (v7 && v4)
  {
    unsigned int v5 = [v7 text];

    CFStringRef v6 = [(TUIInteractiveBaseView *)self control];
    [v6 setText:v5];

    [(TUIInteractiveBaseView *)self updateFromState];
  }
  else
  {
    [(TUITextFieldView *)self setViewStateToRestore:v7];
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)TUITextFieldView;
  [(TUIInteractiveBaseView *)&v4 prepareForReuse];
  [(TUITextFieldView *)self setViewStateToRestore:0];
  v3 = [(TUIInteractiveBaseView *)self control];
  [v3 setText:0];

  [(TUITextFieldView *)self setTextInitialized:0];
}

- (id)accessibilityLabel
{
  v3 = [(TUIInteractiveBaseView *)self control];
  objc_super v4 = [v3 text];
  id v5 = [v4 length];
  CFStringRef v6 = [(TUIInteractiveBaseView *)self control];
  id v7 = v6;
  if (v5) {
    [v6 text];
  }
  else {
  CFStringRef v8 = [v6 placeholder];
  }

  return v8;
}

- (_TUITextFieldViewState)viewStateToRestore
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

- (BOOL)textInitialized
{
  return self->_textInitialized;
}

- (void)setTextInitialized:(BOOL)a3
{
  self->_textInitialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicViewState, 0);

  objc_storeStrong((id *)&self->_viewStateToRestore, 0);
}

@end