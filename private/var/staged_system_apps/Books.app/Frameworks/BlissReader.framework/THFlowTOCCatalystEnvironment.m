@interface THFlowTOCCatalystEnvironment
- (CGRect)im_frameEnvironmentBounds;
- (CGRect)im_frameEnvironmentFrame;
- (THFlowTOCCatalystEnvironment)initWithContext:(id)a3;
- (UIEdgeInsets)im_frameEnvironmentSafeAreaInsets;
- (UITraitCollection)traitCollection;
- (UIViewController)context;
- (void)setContext:(id)a3;
@end

@implementation THFlowTOCCatalystEnvironment

- (THFlowTOCCatalystEnvironment)initWithContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)THFlowTOCCatalystEnvironment;
  v5 = [(THFlowTOCCatalystEnvironment *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_context, v4);
  }

  return v6;
}

- (CGRect)im_frameEnvironmentBounds
{
  p_context = &self->_context;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if ([WeakRetained isViewLoaded])
  {
    id v4 = objc_loadWeakRetained((id *)p_context);
    v5 = [v4 view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    id v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }

  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)im_frameEnvironmentFrame
{
  p_context = &self->_context;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if ([WeakRetained isViewLoaded])
  {
    id v4 = objc_loadWeakRetained((id *)p_context);
    v5 = [v4 view];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    id v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }

  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UIEdgeInsets)im_frameEnvironmentSafeAreaInsets
{
  p_context = &self->_context;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if ([WeakRetained isViewLoaded])
  {
    id v4 = objc_loadWeakRetained((id *)p_context);
    v5 = [v4 view];
    [v5 safeAreaInsets];
    CGFloat top = v6;
    CGFloat left = v8;
    CGFloat bottom = v10;
    CGFloat right = v12;
  }
  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }

  double v14 = top;
  double v15 = left;
  double v16 = bottom;
  double v17 = right;
  result.CGFloat right = v17;
  result.CGFloat bottom = v16;
  result.CGFloat left = v15;
  result.CGFloat top = v14;
  return result;
}

- (UITraitCollection)traitCollection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v3 = [WeakRetained traitCollection];
  id v4 = [v3 traitCollectionByModifyingTraits:&stru_459078];

  return (UITraitCollection *)v4;
}

- (UIViewController)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (UIViewController *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end