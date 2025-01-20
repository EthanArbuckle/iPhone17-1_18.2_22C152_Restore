@interface WLQRCodeProvider
- (BOOL)useGooglePlayStore;
- (WLQRCodeProviderDelegate)delegate;
- (void)complete;
- (void)drainQueue;
- (void)request;
- (void)requestDidFinish:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setUseGooglePlayStore:(BOOL)a3;
@end

@implementation WLQRCodeProvider

- (void)request
{
  v18[1] = *MEMORY[0x263EF8340];
  if (self->_useGooglePlayStore)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = [WLQRCode alloc];
    v5 = WLLocalizedString();
    v6 = WLLocalizedString();
    v7 = [(WLQRCode *)v4 initWithName:v5 title:v6 URL:@"https://support.apple.com/HT201196" code:@"apple_support"];
    v18[0] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    [WeakRetained providerDidProvide:v8];
  }
  else
  {
    v9 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", @"https://a.app.qq.com/o/simple.jsp?pkgname=com.apple.movetoios", @"https://url.cloud.huawei.com/gKwTbAcORy", @"https://h5coml.vivo.com.cn/h5coml/appdetail_h5/browser_v2/index.html?appId=415331", 0);
    urls = self->_urls;
    self->_urls = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    codes = self->_codes;
    self->_codes = v11;

    v13 = self->_codes;
    v14 = [WLQRCode alloc];
    v15 = WLLocalizedString();
    v16 = WLLocalizedString();
    v17 = [(WLQRCode *)v14 initWithName:v15 title:v16 URL:@"https://play.google.com/store/apps/details?id=com.apple.movetoios" code:@"google_play"];
    [(NSMutableArray *)v13 addObject:v17];

    [(WLQRCodeProvider *)self drainQueue];
  }
}

- (void)drainQueue
{
  if ([(NSMutableArray *)self->_urls count])
  {
    id v5 = [(NSMutableArray *)self->_urls firstObject];
    v3 = objc_alloc_init(WLRequest);
    request = self->_request;
    self->_request = v3;

    [(WLRequest *)self->_request setDelegate:self];
    [(WLRequest *)self->_request request:v5 redirect:0];
  }
  else
  {
    [(WLQRCodeProvider *)self complete];
  }
}

- (void)requestDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [(NSMutableArray *)self->_urls firstObject];
  [(NSMutableArray *)self->_urls removeObjectAtIndex:0];
  if (v3)
  {
    id v5 = (WLQRCode *)v12;
    if ([(WLQRCode *)v5 isEqualToString:@"https://a.app.qq.com/o/simple.jsp?pkgname=com.apple.movetoios"])
    {
      v6 = [WLQRCode alloc];
      v7 = WLLocalizedString();
      v8 = WLLocalizedString();
      v9 = @"https://a.app.qq.com/o/simple.jsp?pkgname=com.apple.movetoios";
      v10 = @"tencent_store";
    }
    else if ([(WLQRCode *)v5 isEqualToString:@"https://url.cloud.huawei.com/gKwTbAcORy"])
    {
      v6 = [WLQRCode alloc];
      v7 = WLLocalizedString();
      v8 = WLLocalizedString();
      v9 = @"https://url.cloud.huawei.com/gKwTbAcORy";
      v10 = @"huawei_store";
    }
    else if ([(WLQRCode *)v5 isEqualToString:@"https://h5coml.vivo.com.cn/h5coml/appdetail_h5/browser_v2/index.html?appId=415331"])
    {
      v6 = [WLQRCode alloc];
      v7 = WLLocalizedString();
      v8 = WLLocalizedString();
      v9 = @"https://h5coml.vivo.com.cn/h5coml/appdetail_h5/browser_v2/index.html?appId=415331";
      v10 = @"vivo_store";
    }
    else
    {
      if (![(WLQRCode *)v5 isEqualToString:@"https://mobile.baidu.com/item?pid=1538161"])
      {
        v11 = v5;
LABEL_12:

        goto LABEL_13;
      }
      v6 = [WLQRCode alloc];
      v7 = WLLocalizedString();
      v8 = WLLocalizedString();
      v9 = @"https://mobile.baidu.com/item?pid=1538161";
      v10 = @"baidu_store";
    }
    v11 = [(WLQRCode *)v6 initWithName:v7 title:v8 URL:v9 code:v10];

    if (!v11) {
      goto LABEL_13;
    }
    [(NSMutableArray *)self->_codes addObject:v11];
    goto LABEL_12;
  }
LABEL_13:
  [(WLQRCodeProvider *)self drainQueue];
}

- (void)complete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained providerDidProvide:self->_codes];

  request = self->_request;
  self->_request = 0;

  urls = self->_urls;
  self->_urls = 0;

  codes = self->_codes;
  self->_codes = 0;
}

- (WLQRCodeProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WLQRCodeProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useGooglePlayStore
{
  return self->_useGooglePlayStore;
}

- (void)setUseGooglePlayStore:(BOOL)a3
{
  self->_useGooglePlayStore = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_codes, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end