@interface SKUINavigationPaletteController
- (SKUINavigationPaletteController)initWithPaletteViewElement:(id)a3;
- (id)view;
- (id)viewForElementIdentifier:(id)a3;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)reloadSectionViews;
- (void)willAppearInNavigationBar;
@end

@implementation SKUINavigationPaletteController

- (SKUINavigationPaletteController)initWithPaletteViewElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUINavigationPaletteController initWithPaletteViewElement:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUINavigationPaletteController;
  v6 = [(SKUINavigationPaletteController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewElement, a3);
  }

  return v7;
}

- (void)reloadSectionViews
{
  v3 = [(SKUINavigationBarSectionController *)self context];
  [v3 maximumNavigationBarWidth];
  double v5 = v4;

  paletteView = self->_paletteView;
  viewElement = self->_viewElement;
  v8 = [(SKUINavigationBarSectionController *)self viewLayoutContext];
  [(SKUINavigationPaletteView *)paletteView reloadWithViewElement:viewElement width:v8 context:(double)(uint64_t)v5];

  v9.receiver = self;
  v9.super_class = (Class)SKUINavigationPaletteController;
  [(SKUINavigationBarSectionController *)&v9 reloadSectionViews];
}

- (id)view
{
  paletteView = self->_paletteView;
  if (!paletteView)
  {
    double v4 = [(SKUINavigationBarSectionController *)self context];
    double v5 = [v4 clientContext];
    uint64_t v6 = SKUIUserInterfaceIdiom(v5);

    [v4 maximumNavigationBarWidth];
    double v8 = v7;
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    viewElement = self->_viewElement;
    v12 = [(SKUINavigationBarSectionController *)self viewLayoutContext];
    +[SKUINavigationPaletteView sizeThatFitsWidth:viewElement viewElement:v12 context:v8];
    double v14 = v13;
    double v16 = v15;

    double v17 = v16 + 14.0;
    if (v16 + 14.0 < 36.0) {
      double v17 = 36.0;
    }
    if (v6 == 1) {
      double v18 = v17;
    }
    else {
      double v18 = v16 + 9.0;
    }
    v19 = -[SKUINavigationPaletteView initWithFrame:]([SKUINavigationPaletteView alloc], "initWithFrame:", v9, v10, v14, v18);
    v20 = self->_paletteView;
    self->_paletteView = v19;

    [(SKUINavigationPaletteView *)self->_paletteView setAutoresizingMask:2];
    v21 = self->_paletteView;
    v22 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIViewReuseView *)v21 setBackgroundColor:v22];

    -[SKUINavigationPaletteView setContentInset:](self->_paletteView, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
    if (v6 == 1) {
      [(SKUINavigationPaletteView *)self->_paletteView setVerticalAlignment:1];
    }
    v23 = self->_paletteView;
    v24 = self->_viewElement;
    v25 = [(SKUINavigationBarSectionController *)self viewLayoutContext];
    [(SKUINavigationPaletteView *)v23 reloadWithViewElement:v24 width:v25 context:v8];

    paletteView = self->_paletteView;
  }

  return paletteView;
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SKUINavigationPaletteView *)self->_paletteView viewForElementIdentifier:a3];
}

- (void)willAppearInNavigationBar
{
  v3 = [(SKUINavigationBarSectionController *)self viewLayoutContext];
  double v4 = [(SKUINavigationBarSectionController *)self context];
  [v4 maximumNavigationBarWidth];
  double v6 = v5;

  +[SKUINavigationPaletteView requestLayoutForViewElement:self->_viewElement width:v3 context:(double)(uint64_t)v6];
  +[SKUINavigationPaletteView prefetchResourcesForViewElement:self->_viewElement reason:0 context:v3];
  v7.receiver = self;
  v7.super_class = (Class)SKUINavigationPaletteController;
  [(SKUINavigationBarSectionController *)&v7 willAppearInNavigationBar];
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  paletteView = self->_paletteView;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(SKUINavigationBarSectionController *)self viewLayoutContext];
  [(SKUINavigationPaletteView *)paletteView setImage:v7 forArtworkRequest:v8 context:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewLayoutContext, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);

  objc_storeStrong((id *)&self->_navigationBarContext, 0);
}

- (void)initWithPaletteViewElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUINavigationPaletteController initWithPaletteViewElement:]";
}

@end