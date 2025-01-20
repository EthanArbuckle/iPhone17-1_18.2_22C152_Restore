@interface TUITextView
+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 name:(id)a7 identifier:(id)a8 editingInsets:(UIEdgeInsets)a9 style:(id)a10 placeholderText:(id)a11 text:(id)a12 returnKeyType:(id)a13 keyboardAppearance:(unint64_t)a14;
+ (id)tuiReuseIdentifier;
- (BOOL)textInitialized;
- (TUIMutableDynamicValue)dynamicViewState;
- (TUITextView)initWithFrame:(CGRect)a3;
- (_TUITextViewState)viewStateToRestore;
- (id)_textForControlUsingRenderModel:(id)a3;
- (id)accessibilityLabel;
- (id)currentState;
- (id)viewStateSave;
- (void)_callActionHandlerForTrigger:(id)a3 arguments:(id)a4;
- (void)_textViewContentChanged;
- (void)_textViewDidBeginEditing;
- (void)_textViewEndBeginEditing;
- (void)_updateDynamicViewState;
- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4;
- (void)dealloc;
- (void)loadControlIfNeeded;
- (void)prepareForReuse;
- (void)setDynamicViewState:(id)a3;
- (void)setTextInitialized:(BOOL)a3;
- (void)setViewStateToRestore:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)viewStateRestore:(id)a3;
@end

@implementation TUITextView

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

- (TUITextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUITextView;
  v3 = -[TUITextView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(TUITextView *)v3 setClipsToBounds:1];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(TUIInteractiveBaseView *)self control];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)TUITextView;
  [(TUITextView *)&v4 dealloc];
}

+ (id)tuiReuseIdentifier
{
  return @"TUIReuseIdentifierTextView";
}

- (id)currentState
{
  v3 = @"default";
  objc_super v4 = [(TUIInteractiveBaseView *)self control];
  unsigned int v5 = [v4 isEditing];
  objc_super v6 = [v4 text];
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
    objc_super v4 = [TUIUIKitTextView alloc];
    [(TUITextView *)self bounds];
    objc_super v6 = -[TUIUIKitTextView initWithFrame:](v4, "initWithFrame:");
    unsigned int v5 = +[UIColor clearColor];
    [(TUIUIKitTextView *)v6 setBackgroundColor:v5];

    [(TUIUIKitTextView *)v6 setDelegate:self];
    [(TUIUIKitTextView *)v6 setAutoresizingMask:18];
    [(TUITextView *)self addSubview:v6];
    [(TUIInteractiveBaseView *)self setControl:v6];
    [(TUITextView *)self setViewStateToRestore:0];
    [(TUITextView *)self setTextInitialized:0];
    v3 = v6;
  }
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TUITextView;
  -[TUIInteractiveBaseView configureWithModel:outsets:](&v26, "configureWithModel:outsets:", v9, top, left, bottom, right);
  id v10 = v9;
  v11 = v10;
  if (v10)
  {
    v12 = [v10 viewState];
    dynamicViewState = self->_dynamicViewState;
    self->_dynamicViewState = v12;

    v14 = [v11 placeholderText];
    v15 = [(TUIInteractiveBaseView *)self control];
    [v15 setAttributedPlaceholder:v14];

    if ([v11 returnKeyType])
    {
      v16 = [(TUIInteractiveBaseView *)self control];
      [v16 setReturnKeyType:[v11 returnKeyType]];
    }
    BOOL v17 = TUIPlatformKeyboardAppearanceFromKeyboardAppearance((BOOL)[v11 keyboardAppearance]);
    v18 = [(TUIInteractiveBaseView *)self control];
    id v19 = [v18 keyboardAppearance];

    if ((id)v17 != v19)
    {
      v20 = [(TUIInteractiveBaseView *)self control];
      [v20 setKeyboardAppearance:v17];

      v21 = [(TUIInteractiveBaseView *)self control];
      [v21 reloadInputViewsWithoutReset];
    }
    v22 = [(TUIInteractiveBaseView *)self control];
    id v23 = [(TUITextView *)self _textForControlUsingRenderModel:v11];
    [v22 setText:v23];

    [(TUITextView *)self setTextInitialized:1];
    id v24 = [v11 enabled];
    id v25 = [(TUIInteractiveBaseView *)self control];
    [v25 setEnabled:v24];

    [(TUIInteractiveBaseView *)self updateFromState];
  }
  [(TUITextView *)self setViewStateToRestore:0];
}

- (id)_textForControlUsingRenderModel:(id)a3
{
  id v4 = a3;
  if (!self->_textInitialized
    || ([(TUIInteractiveBaseView *)self control],
        unsigned int v5 = objc_claimAutoreleasedReturnValue(),
        [v5 text],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    objc_super v6 = [(_TUITextViewState *)self->_viewStateToRestore text];
    if (!v6)
    {
      objc_super v6 = [v4 text];
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
      objc_super v6 = [v5 text];
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

- (void)_textViewDidBeginEditing
{
  [(TUIInteractiveBaseView *)self updateFromState];
  CFStringRef v6 = @"value";
  v3 = [(TUIInteractiveBaseView *)self control];
  id v4 = [v3 text];
  id v7 = v4;
  unsigned int v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(TUITextView *)self _callActionHandlerForTrigger:@"beginInput" arguments:v5];
}

- (void)_textViewEndBeginEditing
{
  [(TUIInteractiveBaseView *)self updateFromState];
  CFStringRef v6 = @"value";
  v3 = [(TUIInteractiveBaseView *)self control];
  id v4 = [v3 text];
  id v7 = v4;
  unsigned int v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(TUITextView *)self _callActionHandlerForTrigger:@"endInput" arguments:v5];
}

- (void)_textViewContentChanged
{
  [(TUIInteractiveBaseView *)self updateFromState];
  CFStringRef v6 = @"value";
  v3 = [(TUIInteractiveBaseView *)self control];
  id v4 = [v3 text];
  id v7 = v4;
  unsigned int v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(TUITextView *)self _callActionHandlerForTrigger:@"changedInput" arguments:v5];

  [(TUITextView *)self _updateDynamicViewState];
}

- (void)textViewDidBeginEditing:(id)a3
{
}

- (void)textViewDidEndEditing:(id)a3
{
}

- (void)textViewDidChange:(id)a3
{
}

- (id)viewStateSave
{
  v2 = [(TUIInteractiveBaseView *)self control];
  if (v2)
  {
    v3 = [_TUITextViewState alloc];
    id v4 = [v2 text];
    unsigned int v5 = [(_TUITextViewState *)v3 initWithText:v4];
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
    [(TUITextView *)self setViewStateToRestore:v7];
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)TUITextView;
  [(TUIInteractiveBaseView *)&v4 prepareForReuse];
  [(TUITextView *)self setViewStateToRestore:0];
  v3 = [(TUIInteractiveBaseView *)self control];
  [v3 setText:0];

  [(TUITextView *)self setTextInitialized:0];
}

- (id)accessibilityLabel
{
  v3 = [(TUIInteractiveBaseView *)self control];
  objc_super v4 = [v3 text];
  id v5 = [v4 length];
  CFStringRef v6 = [(TUIInteractiveBaseView *)self control];
  id v7 = v6;
  if (v5)
  {
    CFStringRef v8 = [v6 text];
  }
  else
  {
    id v9 = [v6 attributedPlaceholder];
    CFStringRef v8 = [v9 string];
  }

  return v8;
}

- (_TUITextViewState)viewStateToRestore
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