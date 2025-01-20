@interface ICQAsyncImageView
- (ICQAsyncImageView)initWithURL:(id)a3;
- (NSURL)currentImageURL;
- (void)loadImageFromURL:(id)a3;
- (void)setCurrentImageURL:(id)a3;
- (void)updateToImageFromURL:(id)a3;
@end

@implementation ICQAsyncImageView

- (ICQAsyncImageView)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICQAsyncImageView;
  v5 = [(ICQAsyncImageView *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICQAsyncImageView *)v5 updateToImageFromURL:v4];
  }

  return v6;
}

- (void)updateToImageFromURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    v5 = [v4 absoluteString];
    v6 = [(ICQAsyncImageView *)self currentImageURL];
    v7 = [v6 absoluteString];
    char v8 = [v5 isEqualToString:v7];

    id v4 = v9;
    if ((v8 & 1) == 0)
    {
      [(ICQAsyncImageView *)self loadImageFromURL:v9];
      [(ICQAsyncImageView *)self setCurrentImageURL:v9];
      id v4 = v9;
    }
  }
}

- (void)loadImageFromURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 absoluteString];
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving image at url: %@", buf, 0xCu);
  }
  v7 = [MEMORY[0x263F08BD8] requestWithURL:v4 cachePolicy:1 timeoutInterval:30.0];
  char v8 = [MEMORY[0x263F08BF8] sharedSession];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__ICQAsyncImageView_loadImageFromURL___block_invoke;
  v10[3] = &unk_264921C00;
  v10[4] = self;
  id v9 = [v8 dataTaskWithRequest:v7 completionHandler:v10];

  [v9 resume];
}

void __38__ICQAsyncImageView_loadImageFromURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v9 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Error retrieving image from url: %@", buf, 0xCu);
    }
  }
  if (v7)
  {
    v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "Successfully retrieved image for async image view", buf, 2u);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __38__ICQAsyncImageView_loadImageFromURL___block_invoke_2;
    v13[3] = &unk_264921B68;
    v13[4] = *(void *)(a1 + 32);
    id v14 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v13);
  }
}

void __38__ICQAsyncImageView_loadImageFromURL___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F827E8] imageWithData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setImage:v2];
}

- (NSURL)currentImageURL
{
  return self->_currentImageURL;
}

- (void)setCurrentImageURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end