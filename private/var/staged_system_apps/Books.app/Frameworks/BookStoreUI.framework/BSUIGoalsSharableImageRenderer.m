@interface BSUIGoalsSharableImageRenderer
- (BOOL)useDarkStyle;
- (BSUIDynamicValue)currentStackName;
- (BSUIGoalsSharableImageRenderer)initWithOptions:(id)a3 completion:(id)a4 traitCollection:(id)a5;
- (CGSize)viewSize;
- (JSAFeedController)jsFeedController;
- (TUIFeedRenderer)feedRenderer;
- (UITraitCollection)traitCollection;
- (double)scale;
- (id)feedEntry:(id)a3 requestDataWithPriority:(float)a4 block:(id)a5;
- (int64_t)feedContentLoadingState;
- (void)_renderContent:(id)a3 completion:(id)a4;
- (void)renderSharableImage:(id)a3;
- (void)setCurrentStackName:(id)a3;
- (void)setFeedContentLoadingState:(int64_t)a3;
- (void)setFeedRenderer:(id)a3;
- (void)setJsFeedController:(id)a3;
- (void)setScale:(double)a3;
- (void)setTraitCollection:(id)a3;
- (void)setUseDarkStyle:(BOOL)a3;
- (void)setViewSize:(CGSize)a3;
@end

@implementation BSUIGoalsSharableImageRenderer

- (BSUIGoalsSharableImageRenderer)initWithOptions:(id)a3 completion:(id)a4 traitCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)BSUIGoalsSharableImageRenderer;
  v11 = [(BSUIGoalsSharableImageRenderer *)&v35 init];
  v12 = v11;
  if (!v8 || !v11) {
    goto LABEL_10;
  }
  v13 = [BSUIDynamicValue alloc];
  v14 = [(BSUIDynamicValue *)v13 initWithValue:TUIFeedContentDefaultStackName options:v8];
  currentStackName = v12->_currentStackName;
  v12->_currentStackName = v14;

  v16 = (JSAFeedController *)[objc_alloc((Class)JSAFeedController) initWithOptions:v8 completion:v9];
  jsFeedController = v12->_jsFeedController;
  v12->_jsFeedController = v16;

  objc_storeStrong((id *)&v12->_traitCollection, a5);
  objc_opt_class();
  v18 = [v8 objectForKey:@"shareableImageWidth"];
  v19 = BUDynamicCast();

  objc_opt_class();
  v20 = [v8 objectForKey:@"shareableImageHeight"];
  v21 = BUDynamicCast();

  if (v19)
  {
    if (v21) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  objc_opt_class();
  v34 = [v8 objectForKey:@"width"];
  v19 = BUDynamicCast();

  if (!v21)
  {
LABEL_5:
    objc_opt_class();
    v22 = [v8 objectForKey:@"height"];
    v21 = BUDynamicCast();
  }
LABEL_6:
  [v19 doubleValue];
  CGFloat v24 = v23;
  [v21 doubleValue];
  CGFloat v26 = v25;
  v27 = [v8 objectForKeyedSubscript:@"style"];
  v12->_useDarkStyle = [v27 isEqualToString:@"dark"];

  v12->_viewSize.width = v24;
  v12->_viewSize.height = v26;
  objc_opt_class();
  v28 = [v8 objectForKey:@"shareableImageScale"];
  v29 = BUDynamicCast();

  if (v29
    || (objc_opt_class(),
        [v8 objectForKey:@"scale"],
        v30 = objc_claimAutoreleasedReturnValue(),
        BUDynamicCast(),
        v29 = objc_claimAutoreleasedReturnValue(),
        v30,
        v29))
  {
    [v29 doubleValue];
    double v32 = v31;
  }
  else
  {
    double v32 = 1.0;
  }
  v12->_scale = v32;

LABEL_10:
  return v12;
}

- (void)renderSharableImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BSUIGoalsSharableImageRenderer *)self jsFeedController];
  if (v5)
  {
    v6 = (void *)v5;
    int64_t v7 = [(BSUIGoalsSharableImageRenderer *)self feedContentLoadingState];

    if (!v7)
    {
      objc_initWeak(&location, self);
      [(BSUIGoalsSharableImageRenderer *)self setFeedContentLoadingState:1];
      id v8 = [(BSUIGoalsSharableImageRenderer *)self jsFeedController];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_7790;
      v9[3] = &unk_38E108;
      objc_copyWeak(&v11, &location);
      v9[4] = self;
      id v10 = v4;
      [v8 requestEntriesWithCompletion:v9];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

- (id)feedEntry:(id)a3 requestDataWithPriority:(float)a4 block:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    id v9 = [(BSUIGoalsSharableImageRenderer *)self jsFeedController];

    if (v9)
    {
      id v10 = [(BSUIGoalsSharableImageRenderer *)self jsFeedController];
      id v11 = [v7 uid];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_7AF8;
      v13[3] = &unk_38E130;
      id v14 = v8;
      [v10 requestCompleteDataForEntry:v11 completion:v13];
    }
    else
    {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }

  return 0;
}

- (void)_renderContent:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)TUIEnvironment) initWithViewSize:self->_traitCollection traitCollection:self->_viewSize.width self->_viewSize.height];
  if ([(BSUIGoalsSharableImageRenderer *)self useDarkStyle]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  [v8 setStyle:v9];
  [v8 contentsScale];
  [v8 setContentsScale:v10 * self->_scale];
  id v11 = [objc_alloc((Class)TUIFeedRendererOptions) initWithResourceTimeout:0.3];
  id v12 = objc_alloc((Class)TUIFeedRenderer);
  v13 = +[BSUITemplate factory];
  id v14 = +[BSUITemplate manager];
  v15 = (TUIFeedRenderer *)[v12 initWithContent:v7 environment:v8 factory:v13 manager:v14 options:v11];

  feedRenderer = self->_feedRenderer;
  self->_feedRenderer = v15;

  v17 = self->_feedRenderer;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_7D08;
  v19[3] = &unk_38E158;
  id v20 = v6;
  id v18 = v6;
  [(TUIFeedRenderer *)v17 capture:v19];
}

- (BSUIDynamicValue)currentStackName
{
  return self->_currentStackName;
}

- (void)setCurrentStackName:(id)a3
{
}

- (int64_t)feedContentLoadingState
{
  return self->_feedContentLoadingState;
}

- (void)setFeedContentLoadingState:(int64_t)a3
{
  self->_feedContentLoadingState = a3;
}

- (TUIFeedRenderer)feedRenderer
{
  return self->_feedRenderer;
}

- (void)setFeedRenderer:(id)a3
{
}

- (JSAFeedController)jsFeedController
{
  return self->_jsFeedController;
}

- (void)setJsFeedController:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (BOOL)useDarkStyle
{
  return self->_useDarkStyle;
}

- (void)setUseDarkStyle:(BOOL)a3
{
  self->_useDarkStyle = a3;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_jsFeedController, 0);
  objc_storeStrong((id *)&self->_feedRenderer, 0);

  objc_storeStrong((id *)&self->_currentStackName, 0);
}

@end