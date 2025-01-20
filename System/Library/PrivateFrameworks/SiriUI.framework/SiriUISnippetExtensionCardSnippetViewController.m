@interface SiriUISnippetExtensionCardSnippetViewController
+ (void)initialize;
- (NSExtension)extension;
- (SiriUISnippetExtensionCardSnippetViewController)initWithSnippet:(id)a3 extension:(id)a4;
- (id)sashItem;
- (id)snippet;
- (void)setExtension:(id)a3;
- (void)setSnippet:(id)a3;
@end

@implementation SiriUISnippetExtensionCardSnippetViewController

+ (void)initialize
{
}

- (SiriUISnippetExtensionCardSnippetViewController)initWithSnippet:(id)a3 extension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SiriUISnippetExtensionCardSnippetViewController;
  v8 = [(SiriUICardSnippetViewController *)&v11 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    [(SiriUISnippetExtensionCardSnippetViewController *)v8 setExtension:v7];
    [(SiriUISnippetExtensionCardSnippetViewController *)v9 setSnippet:v6];
  }

  return v9;
}

- (void)setSnippet:(id)a3
{
  objc_super v11 = (SAUISnippet *)a3;
  if (self->_snippet != v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&self->_snippet, a3);
      id v5 = objc_alloc(MEMORY[0x263F0FBD8]);
      id v6 = objc_alloc_init(MEMORY[0x263F0FBB0]);
      id v7 = (void *)[v5 initWithIntent:v6 response:0];

      [v7 _setSnippet:v11];
      id v8 = objc_alloc_init(MEMORY[0x263F31648]);
      v9 = [MEMORY[0x263EFFA08] setWithObject:v7];
      [v8 setInteractions:v9];

      v10 = (void *)[objc_alloc(MEMORY[0x263F31600]) initWithCard:v8 delegate:self];
      [(SiriUICardSnippetViewController *)self _setCardViewController:v10];
    }
  }
}

- (id)sashItem
{
  sashItem = self->_sashItem;
  if (!sashItem)
  {
    v9.receiver = self;
    v9.super_class = (Class)SiriUISnippetExtensionCardSnippetViewController;
    v4 = [(SiriUIBaseSnippetViewController *)&v9 sashItem];
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = [[SiriUISashItem alloc] initWithExtension:self->_extension];
    }
    id v7 = self->_sashItem;
    self->_sashItem = v6;

    sashItem = self->_sashItem;
  }
  return sashItem;
}

- (id)snippet
{
  return self->_snippet;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_sashItem, 0);
  objc_storeStrong((id *)&self->_snippet, 0);
}

@end