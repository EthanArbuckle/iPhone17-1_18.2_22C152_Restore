@interface SXQuickLookRenderer
- (SXQuickLookRenderer)initWithStyler:(id)a3;
- (SXQuickLookStyler)styler;
- (void)render:(id)a3 attributes:(id)a4;
- (void)renderErrorMessage:(id)a3 view:(id)a4;
- (void)renderThumbnailImage:(id)a3 view:(id)a4;
@end

@implementation SXQuickLookRenderer

- (SXQuickLookRenderer)initWithStyler:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXQuickLookRenderer;
  v6 = [(SXQuickLookRenderer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_styler, a3);
  }

  return v7;
}

- (void)render:(id)a3 attributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 thumbnailControl];
  [v6 thumbnailFrame];
  objc_msgSend(v8, "setFrame:");

  objc_super v9 = [v7 thumbnailImageView];
  [v6 thumbnailFrame];
  objc_msgSend(v9, "setFrame:");

  v10 = [v7 errorLabel];
  [v6 errorLabelFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v10, "setFrame:", v12, v14, v16, v18);
  id v19 = [(SXQuickLookRenderer *)self styler];
  [v19 styleViewController:v7];
}

- (void)renderThumbnailImage:(id)a3 view:(id)a4
{
  id v5 = a4;
  [v5 setImage:a3 forState:0];
  [v5 setContentMode:1];
}

- (void)renderErrorMessage:(id)a3 view:(id)a4
{
}

- (SXQuickLookStyler)styler
{
  return self->_styler;
}

- (void).cxx_destruct
{
}

@end