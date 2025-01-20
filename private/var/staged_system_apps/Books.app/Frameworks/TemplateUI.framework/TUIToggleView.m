@interface TUIToggleView
+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 identifier:(id)a7 name:(id)a8 title:(id)a9 isOn:(BOOL)a10;
+ (id)tuiReuseIdentifier;
- (BOOL)controlIsOn;
- (BOOL)isAccessibilityElement;
- (TUIMutableDynamicValue)dynamicViewState;
- (_TUIToggleViewState)viewStateToRestore;
- (id)accessibilityElements;
- (id)viewStateSave;
- (void)_toggleValueChanged:(id)a3;
- (void)_updateDynamicViewState;
- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4;
- (void)loadControlIfNeeded;
- (void)prepareForReuse;
- (void)setControlIsOn:(BOOL)a3 animated:(BOOL)a4;
- (void)setDynamicViewState:(id)a3;
- (void)setViewStateToRestore:(id)a3;
- (void)updateControlWithIsOn:(BOOL)a3 title:(id)a4 enabled:(BOOL)a5 animated:(BOOL)a6;
- (void)viewStateRestore:(id)a3;
@end

@implementation TUIToggleView

+ (id)tuiReuseIdentifier
{
  return @"TUIReuseIdentifierToggleView";
}

+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 identifier:(id)a7 name:(id)a8 title:(id)a9 isOn:(BOOL)a10
{
  BOOL v12 = a6;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = [TUIRenderModelToggle alloc];
  v24 = [a1 tuiReuseIdentifier];
  LOBYTE(v27) = a10;
  v25 = [(TUIRenderModelToggle *)v23 initWithReuseIdentifier:v24 identifier:v19 elementStates:v22 actionHandler:v21 viewState:v20 enabled:v12 name:v18 title:v17 isOn:v27];

  return v25;
}

- (void)loadControlIfNeeded
{
  v3 = [(TUIInteractiveBaseView *)self control];
  if (!v3)
  {
    id v4 = objc_alloc((Class)UISwitch);
    [(TUIToggleView *)self bounds];
    id v5 = [v4 initWithFrame:];
    [v5 addTarget:self action:"_toggleValueChanged:" forControlEvents:4096];
    [v5 setAutoresizingMask:18];
    [(TUIToggleView *)self addSubview:v5];
    [(TUIInteractiveBaseView *)self setControl:v5];
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
  uint64_t v10 = objc_opt_class();
  v11 = TUIDynamicCast(v10, v9);
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    v13 = [(TUIInteractiveBaseView *)self renderModel];
    v14 = TUIDynamicCast(v12, v13);

    id v15 = [v11 isOn];
    if ([v11 isEqualToRenderModel:v14]) {
      id v15 = (id)[(TUIToggleView *)self controlIsOn];
    }
    v16 = [(TUIToggleView *)self viewStateToRestore];

    if (v16)
    {
      id v17 = [(TUIToggleView *)self viewStateToRestore];
      id v15 = [v17 isOn];

      [(TUIToggleView *)self setViewStateToRestore:0];
    }
    id v18 = [v11 viewState];
    [(TUIToggleView *)self setDynamicViewState:v18];

    v20.receiver = self;
    v20.super_class = (Class)TUIToggleView;
    -[TUIInteractiveBaseView configureWithModel:outsets:](&v20, "configureWithModel:outsets:", v9, top, left, bottom, right);
    id v19 = [v11 title];
    -[TUIToggleView updateControlWithIsOn:title:enabled:animated:](self, "updateControlWithIsOn:title:enabled:animated:", v15, v19, [v11 enabled], v14 != 0);
  }
}

- (void)setControlIsOn:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(TUIInteractiveBaseView *)self control];
  [v6 setOn:v5 animated:v4];
}

- (BOOL)controlIsOn
{
  v2 = [(TUIInteractiveBaseView *)self control];
  unsigned __int8 v3 = [v2 isOn];

  return v3;
}

- (void)updateControlWithIsOn:(BOOL)a3 title:(id)a4 enabled:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a3;
  id v14 = a4;
  [(TUIToggleView *)self setControlIsOn:v8 animated:v6];
  uint64_t v10 = [(TUIInteractiveBaseView *)self control];
  id v11 = [v10 title];
  if (v11 == v14)
  {
  }
  else
  {
    uint64_t v12 = [v10 title];
    unsigned __int8 v13 = [v12 isEqualToString:v14];

    if ((v13 & 1) == 0) {
      [v10 setTitle:v14];
    }
  }
  [v10 setEnabled:v7];
  [(TUIToggleView *)self bounds];
  [v10 setFrame:];
}

- (void)_toggleValueChanged:(id)a3
{
  BOOL v4 = [(TUIInteractiveBaseView *)self renderModel];
  BOOL v5 = [v4 actionHandler];

  if (v5)
  {
    BOOL v6 = [(TUIInteractiveBaseView *)self renderModel];
    BOOL v7 = [v6 actionHandler];
    CFStringRef v10 = @"isOn";
    BOOL v8 = +[NSNumber numberWithBool:[(TUIToggleView *)self controlIsOn]];
    id v11 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [v7 invoke:@"valueChanged" arguments:v9];
  }
  [(TUIToggleView *)self _updateDynamicViewState];
}

- (void)_updateDynamicViewState
{
  unsigned __int8 v3 = [(TUIInteractiveBaseView *)self control];
  if (v3)
  {
    dynamicViewState = self->_dynamicViewState;

    if (dynamicViewState)
    {
      BOOL v5 = self->_dynamicViewState;
      CFStringRef v8 = @"isOn";
      BOOL v6 = +[NSNumber numberWithBool:[(TUIToggleView *)self controlIsOn]];
      id v9 = v6;
      BOOL v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
      [(TUIMutableDynamicValue *)v5 updateWithValueIfChanged:v7];
    }
  }
}

- (id)viewStateSave
{
  unsigned __int8 v3 = [(TUIInteractiveBaseView *)self control];
  if (v3) {
    BOOL v4 = [[_TUIToggleViewState alloc] initWithIsOn:[(TUIToggleView *)self controlIsOn]];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)viewStateRestore:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(TUIInteractiveBaseView *)self control];

  if (v6 && v4)
  {
    id v5 = [v6 isOn];

    [(TUIToggleView *)self setControlIsOn:v5 animated:1];
  }
  else
  {
    [(TUIToggleView *)self setViewStateToRestore:v6];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)TUIToggleView;
  [(TUIInteractiveBaseView *)&v3 prepareForReuse];
  [(TUIToggleView *)self setViewStateToRestore:0];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  objc_super v3 = [(TUIInteractiveBaseView *)self control];
  if (v3)
  {
    BOOL v4 = [(TUIInteractiveBaseView *)self control];
    BOOL v7 = v4;
    id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (_TUIToggleViewState)viewStateToRestore
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