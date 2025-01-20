@interface ActionPanelActivityItemProvider
- (ActionPanelActivityItemProvider)initWithPlaceholderItem:(id)a3 URL:(id)a4 pageTitle:(id)a5 webView:(id)a6;
- (ActionPanelActivityItemProvider)initWithPlaceholderItem:(id)a3 tabDocument:(id)a4;
- (ActionPanelActivityItemProvider)initWithTabDocument:(id)a3;
- (TabDocument)tabDocument;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
@end

@implementation ActionPanelActivityItemProvider

- (ActionPanelActivityItemProvider)initWithPlaceholderItem:(id)a3 tabDocument:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 cachedCanonicalURLOrURLForSharing];
  v9 = [v6 titleForSharing];
  v10 = [v6 webView];
  v14.receiver = self;
  v14.super_class = (Class)ActionPanelActivityItemProvider;
  v11 = [(_SFLinkWithPreviewActivityItemProvider *)&v14 initWithPlaceholderItem:v7 URL:v8 pageTitle:v9 webView:v10];

  if (v11)
  {
    objc_storeWeak((id *)&v11->_tabDocument, v6);
    v12 = v11;
  }

  return v11;
}

- (ActionPanelActivityItemProvider)initWithTabDocument:(id)a3
{
  id v4 = a3;
  v5 = [v4 cachedCanonicalURLOrURLForSharing];
  id v6 = [(ActionPanelActivityItemProvider *)self initWithPlaceholderItem:v5 tabDocument:v4];

  return v6;
}

- (ActionPanelActivityItemProvider)initWithPlaceholderItem:(id)a3 URL:(id)a4 pageTitle:(id)a5 webView:(id)a6
{
  return 0;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a4;
  if ([v8 isEqualToString:*MEMORY[0x1E4F9F348]])
  {
    v9 = [(_SFActivityItemProvider *)self thumbnailHandler];
    if (v9)
    {
      v10 = [(_SFActivityItemProvider *)self thumbnailHandler];
      v11 = ((void (**)(void, id, double, double))v10)[2](v10, v8, width, height);
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (TabDocument)tabDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabDocument);
  return (TabDocument *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end