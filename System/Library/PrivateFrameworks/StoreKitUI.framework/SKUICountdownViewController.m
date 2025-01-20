@interface SKUICountdownViewController
- (SKUIClientContext)clientContext;
- (SKUICountdownComponent)countdownComponent;
- (SKUICountdownViewController)initWithCountdownComponent:(id)a3 artworkLoader:(id)a4;
- (SKUIResourceLoader)artworkLoader;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)loadView;
- (void)setClientContext:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SKUICountdownViewController

- (SKUICountdownViewController)initWithCountdownComponent:(id)a3 artworkLoader:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICountdownViewController initWithCountdownComponent:artworkLoader:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUICountdownViewController;
  v9 = [(SKUICountdownViewController *)&v12 initWithNibName:0 bundle:0];
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
  v11.super_class = (Class)SKUICountdownViewController;
  [(SKUICountdownViewController *)&v11 viewWillAppear:a3];
  v4 = [(SKUICountdownComponent *)self->_countdownComponent countdown];
  v5 = [v4 artworkProvider];

  if (v5)
  {
    v6 = objc_alloc_init(SKUIArtworkRequest);
    [(SKUIArtworkRequest *)v6 setDelegate:self];
    id v7 = +[SSVURLDataConsumer consumer];
    [(SKUIArtworkRequest *)v6 setDataConsumer:v7];

    id v8 = [v5 largestArtwork];
    v9 = [v8 URL];
    [(SKUIArtworkRequest *)v6 setURL:v9];

    [(SKUIResourceLoader *)self->_artworkLoader loadResourceWithRequest:v6 reason:1];
  }
  v10 = [(SKUICountdownViewController *)self view];
  [v10 start];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUICountdownViewController;
  [(SKUICountdownViewController *)&v5 viewDidDisappear:a3];
  v4 = [(SKUICountdownViewController *)self view];
  [v4 stop];
}

- (void)loadView
{
  v3 = [SKUICountdownView alloc];
  v4 = [(SKUICountdownComponent *)self->_countdownComponent countdown];
  objc_super v5 = [(SKUICountdownView *)v3 initWithCountdown:v4 clientContext:self->_clientContext];

  [(SKUICountdownViewController *)self setView:v5];
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v5 = a4;
  id v6 = [(SKUICountdownViewController *)self view];
  [v6 setBackgroundImage:v5];
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUIResourceLoader)artworkLoader
{
  return self->_artworkLoader;
}

- (SKUICountdownComponent)countdownComponent
{
  return self->_countdownComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_countdownComponent, 0);

  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

- (void)initWithCountdownComponent:artworkLoader:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICountdownViewController initWithCountdownComponent:artworkLoader:]";
}

@end