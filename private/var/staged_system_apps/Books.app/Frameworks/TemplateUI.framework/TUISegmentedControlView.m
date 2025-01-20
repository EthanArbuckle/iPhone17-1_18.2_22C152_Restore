@interface TUISegmentedControlView
+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 identifier:(id)a7 name:(id)a8 selectIndex:(int64_t)a9 segments:(id)a10 tintColor:(id)a11;
+ (id)tuiReuseIdentifier;
- (BOOL)isAccessibilityElement;
- (TUIMutableDynamicValue)dynamicViewState;
- (_TUISegmentedControlViewState)viewState;
- (id)accessibilityElements;
- (id)viewStateSave;
- (void)_segmentedControlValueChanged:(id)a3;
- (void)_updateDynamicViewState;
- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4;
- (void)loadControlIfNeeded;
- (void)setDynamicViewState:(id)a3;
- (void)setViewState:(id)a3;
- (void)updateControlWithSelectIndex:(int64_t)a3 segments:(id)a4 tintColor:(id)a5;
- (void)viewStateRestore:(id)a3;
@end

@implementation TUISegmentedControlView

+ (id)tuiReuseIdentifier
{
  return @"TUIReuseIdentifierSegmentedControlView";
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  if (a3)
  {
    double right = a4.right;
    double bottom = a4.bottom;
    double left = a4.left;
    double top = a4.top;
    id v9 = a3;
    uint64_t v10 = objc_opt_class();
    v11 = [(TUIInteractiveBaseView *)self renderModel];
    v12 = TUIDynamicCast(v10, v11);

    uint64_t v13 = objc_opt_class();
    v14 = TUIDynamicCast(v13, v9);
    v21.receiver = self;
    v21.super_class = (Class)TUISegmentedControlView;
    -[TUIInteractiveBaseView configureWithModel:outsets:](&v21, "configureWithModel:outsets:", v9, top, left, bottom, right);

    if (v12 != v14 && ([v12 isEqualToRenderModel:v14] & 1) == 0)
    {
      v15 = [v14 viewState];
      [(TUISegmentedControlView *)self setDynamicViewState:v15];

      v16 = [(TUISegmentedControlView *)self viewState];
      if (v16)
      {
        v17 = [(TUISegmentedControlView *)self viewState];
      }
      else
      {
        v17 = v14;
      }
      id v18 = [v17 selectIndex];
      v19 = [v14 segments];
      v20 = [v14 tintColor];
      [(TUISegmentedControlView *)self updateControlWithSelectIndex:v18 segments:v19 tintColor:v20];

      if (v16) {
    }
      }
  }
}

- (void)_updateDynamicViewState
{
  v3 = [(TUIInteractiveBaseView *)self control];
  if (v3)
  {
    dynamicViewState = self->_dynamicViewState;

    if (dynamicViewState)
    {
      v5 = self->_dynamicViewState;
      CFStringRef v9 = @"index";
      v6 = [(TUIInteractiveBaseView *)self control];
      v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 selectedSegmentIndex]);
      uint64_t v10 = v7;
      v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      [(TUIMutableDynamicValue *)v5 updateWithValueIfChanged:v8];
    }
  }
}

- (void)updateControlWithSelectIndex:(int64_t)a3 segments:(id)a4 tintColor:(id)a5
{
  id v17 = a4;
  id v8 = a5;
  CFStringRef v9 = [(TUIInteractiveBaseView *)self control];
  uint64_t v10 = (char *)[v9 numberOfSegments];
  v11 = (char *)[v17 count];
  v12 = v11;
  if ((uint64_t)v10 >= (uint64_t)v11) {
    uint64_t v13 = (uint64_t)v11;
  }
  else {
    uint64_t v13 = (uint64_t)v10;
  }
  if (v13 >= 1)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      v15 = [v17 objectAtIndexedSubscript:i];
      [v9 setTitle:v15 forSegmentAtIndex:i];
    }
  }
  if ((uint64_t)v10 >= (uint64_t)v12)
  {
    while ((uint64_t)v10 > (uint64_t)v12)
      [v9 removeSegmentAtIndex:--v10 animated:1];
  }
  else
  {
    do
    {
      v16 = [v17 objectAtIndexedSubscript:v10];
      [v9 insertSegmentWithTitle:v16 atIndex:v10 animated:1];

      ++v10;
    }
    while (v12 != v10);
  }
  [v9 setSelectedSegmentIndex:a3];
  if (v8) {
    [v9 setTintColor:v8];
  }
  [(TUISegmentedControlView *)self bounds];
  [v9 setFrame:];
}

- (void)loadControlIfNeeded
{
  v3 = [(TUIInteractiveBaseView *)self control];
  if (!v3)
  {
    uint64_t v4 = objc_opt_class();
    v5 = [(TUIInteractiveBaseView *)self renderModel];
    v6 = TUIDynamicCast(v4, v5);

    id v7 = objc_alloc((Class)UISegmentedControl);
    id v8 = [v6 segments];
    id v9 = [v7 initWithItems:v8];

    [(TUISegmentedControlView *)self bounds];
    [v9 setFrame:];
    [v9 addTarget:self action:"_segmentedControlValueChanged:" forControlEvents:4096];
    [v9 setAutoresizingMask:18];
    [(TUISegmentedControlView *)self addSubview:v9];
    [(TUIInteractiveBaseView *)self setControl:v9];

    v3 = v9;
  }
}

- (void)_segmentedControlValueChanged:(id)a3
{
  uint64_t v4 = [(TUIInteractiveBaseView *)self renderModel];
  v5 = [v4 actionHandler];

  if (v5)
  {
    v6 = [(TUIInteractiveBaseView *)self renderModel];
    id v7 = [v6 actionHandler];
    CFStringRef v13 = @"value";
    uint64_t v8 = objc_opt_class();
    id v9 = [(TUIInteractiveBaseView *)self control];
    uint64_t v10 = TUIDynamicCast(v8, v9);
    v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 selectedSegmentIndex]);
    v14 = v11;
    v12 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v7 invoke:@"valueChanged" arguments:v12];
  }
  [(TUISegmentedControlView *)self _updateDynamicViewState];
}

+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 identifier:(id)a7 name:(id)a8 selectIndex:(int64_t)a9 segments:(id)a10 tintColor:(id)a11
{
  BOOL v28 = a6;
  id v17 = a11;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [TUIRenderModelSegmentedControl alloc];
  v25 = [a1 tuiReuseIdentifier];
  v26 = [(TUIRenderModelSegmentedControl *)v24 initWithReuseIdentifier:v25 identifier:v20 elementStates:v23 actionHandler:v22 viewState:v21 enabled:v28 name:v19 selectIndex:a9 segments:v18 tintColor:v17];

  return v26;
}

- (id)viewStateSave
{
  v3 = [(TUIInteractiveBaseView *)self control];
  if (v3)
  {
    [(TUISegmentedControlView *)self setViewState:0];
    uint64_t v4 = -[_TUISegmentedControlViewState initWithSelectIndex:]([_TUISegmentedControlViewState alloc], "initWithSelectIndex:", [v3 selectedSegmentIndex]);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)viewStateRestore:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  [(TUISegmentedControlView *)self setViewState:v6];
  id v7 = [(TUIInteractiveBaseView *)self control];
  if (v4 && v7)
  {
    id v9 = v7;
    uint64_t v8 = [(TUISegmentedControlView *)self viewState];
    [v9 setSelectedSegmentIndex:[v8 selectIndex]];

    id v7 = v9;
  }
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  v3 = [(TUIInteractiveBaseView *)self control];
  if (v3)
  {
    id v4 = [(TUIInteractiveBaseView *)self control];
    id v7 = v4;
    uint64_t v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (_TUISegmentedControlViewState)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
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

  objc_storeStrong((id *)&self->_viewState, 0);
}

@end