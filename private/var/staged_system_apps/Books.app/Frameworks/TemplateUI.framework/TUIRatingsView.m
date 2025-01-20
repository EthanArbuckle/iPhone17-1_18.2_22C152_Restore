@interface TUIRatingsView
+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 identifier:(id)a6 name:(id)a7 rating:(double)a8 enabled:(BOOL)a9 direction:(unint64_t)a10 color:(id)a11 startColor:(id)a12 backgroundColor:(id)a13 backgroundImageName:(id)a14 foregroundImageName:(id)a15 starWidth:(double)a16 starPadding:(double)a17;
+ (id)tuiReuseIdentifier;
- (TUIMutableDynamicValue)dynamicViewState;
- (_TUIRatingsViewState)viewStateToRestore;
- (id)viewStateSave;
- (void)_ratingControlChanged:(id)a3;
- (void)_ratingControlTouchDown:(id)a3;
- (void)_ratingControlTouchUp:(id)a3;
- (void)_updateDynamicViewState;
- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4;
- (void)loadControlWithValue:(double)a3 enabled:(BOOL)a4 direction:(unint64_t)a5 color:(id)a6 startColor:(id)a7 backgroundColor:(id)a8 backgroundImageName:(id)a9 foregroundImageName:(id)a10 starWidth:(double)a11 starPadding:(double)a12;
- (void)setDynamicViewState:(id)a3;
- (void)setViewStateToRestore:(id)a3;
- (void)updateControlWithValue:(double)a3 enabled:(BOOL)a4 direction:(unint64_t)a5 color:(id)a6 startColor:(id)a7 backgroundColor:(id)a8 backgroundImageName:(id)a9 foregroundImageName:(id)a10 starWidth:(double)a11 starPadding:(double)a12;
- (void)viewStateRestore:(id)a3;
@end

@implementation TUIRatingsView

+ (id)tuiReuseIdentifier
{
  return @"TUIReuseIdentifierRatingsView";
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    v11 = [(TUIInteractiveBaseView *)self renderModel];
    v12 = TUIDynamicCast(v10, v11);

    uint64_t v13 = objc_opt_class();
    v14 = TUIDynamicCast(v13, v9);
    [v14 rating];
    double v16 = v15;
    v36 = v12;
    if ([v12 isEqualToRenderModel:v14])
    {
      v17 = [(TUIInteractiveBaseView *)self control];

      if (v17)
      {
        v18 = [(TUIInteractiveBaseView *)self control];
        [v18 value];
        double v16 = v19;
      }
    }
    viewStateToRestore = self->_viewStateToRestore;
    if (viewStateToRestore)
    {
      [(_TUIRatingsViewState *)viewStateToRestore value];
      double v16 = v21;
      v22 = self->_viewStateToRestore;
      self->_viewStateToRestore = 0;
    }
    v23 = [v9 viewState];
    dynamicViewState = self->_dynamicViewState;
    self->_dynamicViewState = v23;

    v37.receiver = self;
    v37.super_class = (Class)TUIRatingsView;
    -[TUIInteractiveBaseView configureWithModel:outsets:](&v37, "configureWithModel:outsets:", v9, top, left, bottom, right);
    v25 = [(TUIInteractiveBaseView *)self control];

    unsigned int v35 = [v14 enabled];
    id v26 = [v14 direction];
    v27 = [v14 color];
    v28 = [v14 startColor];
    v29 = [v14 backgroundColor];
    v30 = [v14 backgroundImageName];
    v31 = [v14 foregroundImageName];
    [v14 starWidth];
    double v33 = v32;
    [v14 starPadding];
    if (v25) {
      [(TUIRatingsView *)self updateControlWithValue:v35 enabled:v26 direction:v27 color:v28 startColor:v29 backgroundColor:v30 backgroundImageName:v16 foregroundImageName:v33 starWidth:v34 starPadding:v31];
    }
    else {
      [(TUIRatingsView *)self loadControlWithValue:v35 enabled:v26 direction:v27 color:v28 startColor:v29 backgroundColor:v30 backgroundImageName:v16 foregroundImageName:v33 starWidth:v34 starPadding:v31];
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
      CFStringRef v8 = @"value";
      v5 = [(TUIInteractiveBaseView *)self control];
      [v5 value];
      v6 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      id v9 = v6;
      v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
      [(TUIMutableDynamicValue *)dynamicViewState updateWithValueIfChanged:v7];
    }
  }
}

- (void)updateControlWithValue:(double)a3 enabled:(BOOL)a4 direction:(unint64_t)a5 color:(id)a6 startColor:(id)a7 backgroundColor:(id)a8 backgroundImageName:(id)a9 foregroundImageName:(id)a10 starWidth:(double)a11 starPadding:(double)a12
{
  BOOL v18 = a4;
  id v21 = a10;
  id v22 = a9;
  id v23 = a8;
  id v24 = a7;
  id v25 = a6;
  id v27 = [(TUIInteractiveBaseView *)self control];
  [v27 _updateImagesIfNeededWithForegroundImageName:v21 backgroundImageName:v22 starWidth:a11 starPadding:a12];

  [v27 setForegroundColor:v25];
  [v27 setStartColor:v24];

  [v27 setBackgroundColor:v23];
  *(float *)&double v26 = a3;
  [v27 setValue:v26];
  [v27 setEnabled:v18];
}

- (void)loadControlWithValue:(double)a3 enabled:(BOOL)a4 direction:(unint64_t)a5 color:(id)a6 startColor:(id)a7 backgroundColor:(id)a8 backgroundImageName:(id)a9 foregroundImageName:(id)a10 starWidth:(double)a11 starPadding:(double)a12
{
  BOOL v19 = a4;
  id v22 = a10;
  id v23 = a9;
  id v24 = a8;
  id v25 = a7;
  id v26 = a6;
  id v27 = [[TUIStarRatingControl alloc] initWithRating:v23 backgroundImageName:v22 foregroundImageName:a5 direction:v26 color:v25 startColor:v24 backgroundColor:a3 starWidth:a11 starPadding:a12];

  -[TUIStarRatingControl setHitPadding:](v27, "setHitPadding:", CGSizeZero.width, CGSizeZero.height);
  [(TUIRatingsView *)self bounds];
  -[TUIStarRatingControl setFrame:](v27, "setFrame:");
  [(TUIStarRatingControl *)v27 setEnabled:v19];
  [(TUIStarRatingControl *)v27 addTarget:self action:"_ratingControlChanged:" forControlEvents:4096];
  [(TUIStarRatingControl *)v27 addTarget:self action:"_ratingControlTouchDown:" forControlEvents:1];
  [(TUIStarRatingControl *)v27 addTarget:self action:"_ratingControlTouchUp:" forControlEvents:64];
  [(TUIStarRatingControl *)v27 addTarget:self action:"_ratingControlTouchUp:" forControlEvents:128];
  [(TUIStarRatingControl *)v27 setAutoresizingMask:18];
  [(TUIRatingsView *)self addSubview:v27];
  [(TUIInteractiveBaseView *)self setControl:v27];
}

- (void)_ratingControlChanged:(id)a3
{
  v4 = [(TUIInteractiveBaseView *)self renderModel];
  v5 = [v4 actionHandler];
  CFStringRef v11 = @"value";
  uint64_t v6 = objc_opt_class();
  v7 = [(TUIInteractiveBaseView *)self control];
  CFStringRef v8 = TUIDynamicCast(v6, v7);
  [v8 value];
  id v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v12 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v5 invoke:@"changedInput" arguments:v10];

  [(TUIRatingsView *)self _updateDynamicViewState];
}

- (void)_ratingControlTouchDown:(id)a3
{
  v4 = [(TUIInteractiveBaseView *)self renderModel];
  v5 = [v4 actionHandler];
  CFStringRef v11 = @"value";
  uint64_t v6 = objc_opt_class();
  v7 = [(TUIInteractiveBaseView *)self control];
  CFStringRef v8 = TUIDynamicCast(v6, v7);
  [v8 value];
  id v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v12 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v5 invoke:@"beginInput" arguments:v10];
}

- (void)_ratingControlTouchUp:(id)a3
{
  v4 = [(TUIInteractiveBaseView *)self renderModel];
  v5 = [v4 actionHandler];
  CFStringRef v11 = @"value";
  uint64_t v6 = objc_opt_class();
  v7 = [(TUIInteractiveBaseView *)self control];
  CFStringRef v8 = TUIDynamicCast(v6, v7);
  [v8 value];
  id v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v12 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v5 invoke:@"endInput" arguments:v10];
}

+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 identifier:(id)a6 name:(id)a7 rating:(double)a8 enabled:(BOOL)a9 direction:(unint64_t)a10 color:(id)a11 startColor:(id)a12 backgroundColor:(id)a13 backgroundImageName:(id)a14 foregroundImageName:(id)a15 starWidth:(double)a16 starPadding:(double)a17
{
  BOOL v39 = a9;
  id v35 = a15;
  id v22 = a14;
  id v31 = a13;
  id v23 = a12;
  id v24 = a11;
  id v25 = a7;
  id v30 = a6;
  id v33 = a5;
  id v26 = a4;
  id v37 = a3;
  id v27 = [TUIRenderModelRatings alloc];
  v28 = [a1 tuiReuseIdentifier];
  v40 = [(TUIRenderModelRatings *)v27 initWithReuseIdentifier:v28 identifier:v30 elementStates:v37 actionHandler:v26 viewState:v33 enabled:v39 name:a8 rating:a16 direction:a17 color:v25 startColor:a10 backgroundColor:v24 backgroundImageName:v23 foregroundImageName:v31 starWidth:v22 starPadding:v35];

  return v40;
}

- (id)viewStateSave
{
  v3 = [(TUIInteractiveBaseView *)self control];
  if ([v3 isEnabled])
  {
    v4 = [_TUIRatingsViewState alloc];
    v5 = [(TUIInteractiveBaseView *)self control];
    [v5 value];
    v7 = [(_TUIRatingsViewState *)v4 initWithValue:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)viewStateRestore:(id)a3
{
  id v8 = a3;
  v4 = [(TUIInteractiveBaseView *)self control];

  if (v8 && v4)
  {
    [v8 value];
    double v6 = v5;

    id v8 = [(TUIInteractiveBaseView *)self control];
    *(float *)&double v6 = v6;
    LODWORD(v7) = LODWORD(v6);
    [v8 setValue:v7];
  }
  else
  {
    [(TUIRatingsView *)self setViewStateToRestore:v8];
  }
}

- (_TUIRatingsViewState)viewStateToRestore
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