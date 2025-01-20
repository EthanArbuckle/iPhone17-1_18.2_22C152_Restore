@interface SiriUIErrorSnippetViewController
- (SiriUIErrorSnippetViewController)initWithError:(id)a3;
- (id)snippet;
- (void)loadView;
@end

@implementation SiriUIErrorSnippetViewController

- (SiriUIErrorSnippetViewController)initWithError:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriUIErrorSnippetViewController;
  v6 = [(SiriUISnippetViewController *)&v11 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v9 = [v8 siriUILocalizedStringForKey:@"ERROR_SNIPPET_TITLE_GENERIC"];
    [(SiriUIErrorSnippetViewController *)v7 setTitle:v9];
  }
  return v7;
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [(SiriUIErrorSnippetViewController *)self setView:v3];
}

- (id)snippet
{
  return 0;
}

- (void).cxx_destruct
{
}

@end