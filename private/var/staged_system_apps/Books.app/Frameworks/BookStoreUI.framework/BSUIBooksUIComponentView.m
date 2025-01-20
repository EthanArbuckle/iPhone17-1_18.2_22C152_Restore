@interface BSUIBooksUIComponentView
+ (id)renderModelWithIdentifier:(id)a3 rawComponentModel:(id)a4;
- (BSUIBooksUIComponentHostingController)hostingViewController;
- (void)_configureHostingControllerWithRawComponentModel:(id)a3 size:(CGSize)a4;
- (void)_configureWithModel:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setHostingViewController:(id)a3;
@end

@implementation BSUIBooksUIComponentView

+ (id)renderModelWithIdentifier:(id)a3 rawComponentModel:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_BSUIRenderModelBooksUIComponent alloc] initWithRawComponentModel:v5 identifier:v6];

  id v8 = [objc_alloc((Class)TUIRenderModelView) initWithReuseIdentifier:@"BSUIReuseIdentifierBooksUIComponentView" identifier:v6 submodel:v7];

  return v8;
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BSUIBooksUIComponentView;
  id v4 = a3;
  [(BSUIBooksUIComponentView *)&v7 applyLayoutAttributes:v4];
  id v5 = [v4 renderModel];

  id v6 = [v5 submodel];
  [(BSUIBooksUIComponentView *)self _configureWithModel:v6];
}

- (void)_configureWithModel:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToRenderModel:self->_renderModel] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_renderModel, a3);
    id v5 = [v6 rawComponentModel];
    [v6 size];
    -[BSUIBooksUIComponentView _configureHostingControllerWithRawComponentModel:size:](self, "_configureHostingControllerWithRawComponentModel:size:", v5);
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)BSUIBooksUIComponentView;
  [(BSUIBooksUIComponentView *)&v13 layoutSubviews];
  [(BSUIBooksUIComponentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(BSUIBooksUIComponentView *)self hostingViewController];
  v12 = [v11 view];
  [v12 setFrame:v4, v6, v8, v10];
}

- (void)_configureHostingControllerWithRawComponentModel:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!self->_hostingViewController)
  {
    double v8 = +[BSUIBooksUIComponentHostingControllerFactory create];
    [(BSUIBooksUIComponentView *)self setHostingViewController:v8];

    double v9 = [(BSUIBooksUIComponentView *)self feedControllerHost];
    [v9 addChildViewController:self->_hostingViewController];

    double v10 = [(BSUIBooksUIComponentView *)self hostingViewController];
    v11 = [v10 view];
    [(BSUIBooksUIComponentView *)self addSubview:v11];

    v12 = [(BSUIBooksUIComponentView *)self feedControllerHost];
    [v12 didAddChildViewController:self->_hostingViewController];
  }
  id v14 = [(BSUIBooksUIComponentView *)self hostingViewController];
  objc_super v13 = [(BSUIBooksUIComponentView *)self feedControllerHost];
  [v14 updateWithRawComponentModel:v7 size:v13 feedControllerHost:width, height];
}

- (BSUIBooksUIComponentHostingController)hostingViewController
{
  return self->_hostingViewController;
}

- (void)setHostingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingViewController, 0);

  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end