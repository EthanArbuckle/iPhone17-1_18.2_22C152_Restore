@interface STSImageDetailViewController
- (void)setContentURL:(id)a3;
- (void)viewDidLoad;
@end

@implementation STSImageDetailViewController

- (void)viewDidLoad
{
}

- (void)setContentURL:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)STSImageDetailViewController;
  id v5 = [(STSResultDetailViewController *)&v30 contentURL];

  if (v5 != v4)
  {
    v29.receiver = self;
    v29.super_class = (Class)STSImageDetailViewController;
    [(STSResultDetailViewController *)&v29 setContentURL:v4];
    objc_initWeak(&location, self);
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__0;
    v26[4] = __Block_byref_object_dispose__0;
    id v27 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    v24.receiver = self;
    v24.super_class = (Class)STSImageDetailViewController;
    v6 = [(STSResultDetailViewController *)&v24 contentURL];
    v23.receiver = self;
    v23.super_class = (Class)STSImageDetailViewController;
    v7 = [(STSResultDetailViewController *)&v23 queryString];
    v8 = +[STSImageCache sharedCache];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __46__STSImageDetailViewController_setContentURL___block_invoke;
    v17[3] = &unk_264A05840;
    id v18 = v6;
    v21 = v26;
    id v9 = v7;
    id v19 = v9;
    v20 = self;
    v22 = v25;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__STSImageDetailViewController_setContentURL___block_invoke_8;
    v11[3] = &unk_264A05890;
    v14 = v25;
    id v10 = v18;
    id v12 = v10;
    v15 = v26;
    objc_copyWeak(&v16, &location);
    v13 = self;
    [v8 fetchImageWithURL:v10 priority:4 isSource:1 begin:v17 progress:0 completion:v11];

    objc_destroyWeak(&v16);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v26, 8);

    objc_destroyWeak(&location);
  }
}

void __46__STSImageDetailViewController_setContentURL___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v2;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Begin fetching image at URL: %@", (uint8_t *)&v10, 0xCu);
  }
  v3 = +[STSFeedbackReporter sharedInstance];
  if (*(void *)(a1 + 40)) {
    id v4 = *(__CFString **)(a1 + 40);
  }
  else {
    id v4 = &stru_26E2ACAA8;
  }
  uint64_t v5 = objc_msgSend(v3, "didStartNetworkRequest:query:queryId:", *(void *)(a1 + 32), v4, objc_msgSend(*(id *)(a1 + 48), "queryId"));
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v8 = [MEMORY[0x263F08AB0] processInfo];
  [v8 systemUptime];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v9;
}

void __46__STSImageDetailViewController_setContentURL___block_invoke_8(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x263F08AB0] processInfo];
  [v11 systemUptime];
  double v13 = v12;
  double v14 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v10 objectForKeyedSubscript:@"STSImageDownloadOperationStatusCode"];
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = [NSNumber numberWithDouble:(v13 - v14) * 1000.0];
    *(_DWORD *)buf = 138412802;
    objc_super v29 = v15;
    __int16 v30 = 2112;
    uint64_t v31 = v16;
    __int16 v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Detail view source image downloaded status_code %@ %@ (duration %@)", buf, 0x20u);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v18 = +[STSFeedbackReporter sharedInstance];
    [v18 didEndNetworkRequest:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) infoDict:v10];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __46__STSImageDetailViewController_setContentURL___block_invoke_10;
  v23[3] = &unk_264A05868;
  id v24 = WeakRetained;
  id v25 = v8;
  uint64_t v26 = *(void *)(a1 + 40);
  id v27 = v9;
  id v20 = v9;
  id v21 = v8;
  id v22 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], v23);
}

void __46__STSImageDetailViewController_setContentURL___block_invoke_10(uint64_t a1)
{
  [*(id *)(a1 + 32) contentSize];
  if (*MEMORY[0x263F001B0] == v3 && *(double *)(MEMORY[0x263F001B0] + 8) == v2)
  {
    uint64_t v5 = [*(id *)(a1 + 32) view];
    [*(id *)(a1 + 40) size];
    objc_msgSend(v5, "setContentSize:");
  }
  if (*(void *)(*(void *)(a1 + 48) + 1064))
  {
    id obj = 0;
    uint64_t v6 = *(void **)(a1 + 56);
    v7 = v6;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = *(void **)(a1 + 40);
    id obj = v6;
  }
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9 && (objc_storeStrong((id *)(v9 + 1056), obj), (uint64_t v10 = *(void *)(a1 + 32)) != 0))
  {
    objc_storeStrong((id *)(v10 + 1064), v7);
    uint64_t v11 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v11 = 0;
  }
  [v11 updateWithThumbnail:obj orThumbnailInfo:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageInfo, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end