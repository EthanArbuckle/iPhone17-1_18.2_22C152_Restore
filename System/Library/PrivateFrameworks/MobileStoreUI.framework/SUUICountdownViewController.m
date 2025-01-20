@interface SUUICountdownViewController
- (SUUIClientContext)clientContext;
- (SUUICountdownComponent)countdownComponent;
- (SUUICountdownViewController)initWithCountdownComponent:(id)a3 artworkLoader:(id)a4;
- (SUUIResourceLoader)artworkLoader;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)loadView;
- (void)setClientContext:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUICountdownViewController

- (SUUICountdownViewController)initWithCountdownComponent:(id)a3 artworkLoader:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUICountdownViewController;
  v9 = [(SUUICountdownViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_countdownComponent, a3);
    objc_storeStrong((id *)&v10->_artworkLoader, a4);
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SUUICountdownViewController;
  [(SUUICountdownViewController *)&v11 viewWillAppear:a3];
  v4 = [(SUUICountdownComponent *)self->_countdownComponent countdown];
  v5 = [v4 artworkProvider];

  if (v5)
  {
    v6 = objc_alloc_init(SUUIArtworkRequest);
    [(SUUIArtworkRequest *)v6 setDelegate:self];
    id v7 = +[SSVURLDataConsumer consumer];
    [(SUUIArtworkRequest *)v6 setDataConsumer:v7];

    id v8 = [v5 largestArtwork];
    v9 = [v8 URL];
    [(SUUIArtworkRequest *)v6 setURL:v9];

    [(SUUIResourceLoader *)self->_artworkLoader loadResourceWithRequest:v6 reason:1];
  }
  v10 = [(SUUICountdownViewController *)self view];
  [v10 start];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUICountdownViewController;
  [(SUUICountdownViewController *)&v5 viewDidDisappear:a3];
  v4 = [(SUUICountdownViewController *)self view];
  [v4 stop];
}

- (void)loadView
{
  v3 = [SUUICountdownView alloc];
  v4 = [(SUUICountdownComponent *)self->_countdownComponent countdown];
  objc_super v5 = [(SUUICountdownView *)v3 initWithCountdown:v4 clientContext:self->_clientContext];

  [(SUUICountdownViewController *)self setView:v5];
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v5 = a4;
  id v6 = [(SUUICountdownViewController *)self view];
  [v6 setBackgroundImage:v5];
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUIResourceLoader)artworkLoader
{
  return self->_artworkLoader;
}

- (SUUICountdownComponent)countdownComponent
{
  return self->_countdownComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_countdownComponent, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end