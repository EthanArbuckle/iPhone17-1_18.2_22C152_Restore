@interface WebFilterEvaluator
+ (BOOL)isManagedSession;
+ (BOOL)supportsSecureCoding;
+ (id)createWithResponse:(id)a3;
+ (id)sharedBloomFilter;
- ($115C4C562B26FF47E01F9F4EA65B5887)browserAuditToken;
- (BOOL)wasBlocked;
- (WFRemotePINEntryViewController)remoteViewController;
- (WebFilterEvaluator)initWithCoder:(id)a3;
- (WebFilterEvaluator)initWithResponse:(id)a3;
- (id)addData:(id)a3;
- (id)blockPageForPageWithTitle:(id)a3 origURL:(id)a4;
- (id)dataComplete;
- (id)debugPageForPageWithData:(id)a3 forURL:(id)a4 debugString:(id)a5;
- (int)filterState;
- (void)attemptUnblockWithCompletion:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)filterState;
- (void)setBrowserAuditToken:(id *)a3;
- (void)setRemoteViewController:(id)a3;
- (void)unblockWithCompletion:(id)a3;
- (void)userDidCancel;
- (void)userEnteredCorrectPIN;
@end

@implementation WebFilterEvaluator

+ (id)sharedBloomFilter
{
  if (sharedBloomFilter_once != -1) {
    dispatch_once(&sharedBloomFilter_once, &__block_literal_global_0);
  }
  return (id)sharedBloomFilter__bloomFilter;
}

void __39__WebFilterEvaluator_sharedBloomFilter__block_invoke()
{
  sharedBloomFilter__bloomFilter = objc_opt_new();
  v0 = __WFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __39__WebFilterEvaluator_sharedBloomFilter__block_invoke_cold_1();
  }
}

- (id)debugPageForPageWithData:(id)a3 forURL:(id)a4 debugString:(id)a5
{
  uint64_t v7 = [a4 absoluteString];
  return (id)ComposeDebugPageSimple(a3, v7, a5);
}

- (id)blockPageForPageWithTitle:(id)a3 origURL:(id)a4
{
  uint64_t v7 = NSUserName();
  v8 = [[WFUserSettings alloc] initWithUserName:v7];
  v9 = __WFDefaultLog();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[WebFilterEvaluator blockPageForPageWithTitle:origURL:].cold.4((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);
    }
    v17 = [[WFBlockPage alloc] initWithUsername:v7 overridesAllowded:[(WFUserSettings *)v8 overridesAllowed]];

    [(WFBlockPage *)v17 setFormActionURLString:@"x-apple-content-filter://unblock"];
    -[WFBlockPage setUserVisibleURLString:](v17, "setUserVisibleURLString:", [a4 absoluteString]);
    v18 = [(WFBlockPage *)v17 page];

    if (!v18) {
      v18 = @"<html> <head><title>Error composing block page</title></head> <body>Error composing block page</body> </html>";
    }
    if (![(WebFilterEvaluator *)self remoteViewController])
    {
      v19 = objc_opt_class();
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke;
      v29[3] = &unk_26429C778;
      v29[4] = self;
      [v19 requestViewController:@"WFServicePINEntryNavigationController" fromServiceWithBundleIdentifier:@"com.apple.WebContentFilter.remoteUI.WebContentAnalysisUI" connectionHandler:v29];
      v20 = __WFDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[WebFilterEvaluator blockPageForPageWithTitle:origURL:](self, v20);
      }
    }
    v21 = __WFDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[WebFilterEvaluator blockPageForPageWithTitle:origURL:]((uint64_t)v18, v21, v22, v23, v24, v25, v26, v27);
    }
    return (id)[(__CFString *)v18 dataUsingEncoding:4];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WebFilterEvaluator blockPageForPageWithTitle:origURL:]((uint64_t)a3, (uint64_t)a4, v10);
    }
    return 0;
  }
}

uint64_t __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = __WFDefaultLog();
  if (!a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_3();
      if (!a3) {
        goto LABEL_13;
      }
      goto LABEL_7;
    }
LABEL_6:
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_7;
  }
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_6;
  }
  __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_4();
  if (!a3)
  {
LABEL_13:
    uint64_t result = [*(id *)(a1 + 32) remoteViewController];
    if (!result) {
      return [*(id *)(a1 + 32) setRemoteViewController:a2];
    }
    return result;
  }
LABEL_7:
  uint64_t v7 = __WFDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_2();
  }
  v8 = __WFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

+ (BOOL)isManagedSession
{
  return _WebFilterIsActive();
}

+ (id)createWithResponse:(id)a3
{
  if (!_WebFilterIsActive()) {
    return 0;
  }
  if ((_gWebFilterActivated & 1) == 0) {
    _gWebFilterActivated = 1;
  }
  v4 = [[WebFilterEvaluator alloc] initWithResponse:a3];
  return v4;
}

- (WebFilterEvaluator)initWithResponse:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WebFilterEvaluator;
  v4 = [(WebFilterEvaluator *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_filterState = 2;
    v4->_buffer = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    v5->_url = (NSURL *)(id)[a3 URL];
    v5->_completion = &__block_literal_global_32;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebFilterEvaluator;
  [(WebFilterEvaluator *)&v3 dealloc];
}

- (id)addData:(id)a3
{
  if (!a3
    || (-[NSMutableData appendData:](self->_buffer, "appendData:"),
        [(NSMutableData *)self->_buffer length] >> 15))
  {
    NSUInteger v6 = [(NSMutableData *)self->_buffer length];
    if (v6)
    {
      unint64_t v7 = v6;
      v8 = [[WFUserSettings alloc] initWithUserName:NSUserName()];
      self->_filterState = 3;
      if (v7 <= 0x8000) {
        buffer = self->_buffer;
      }
      else {
        buffer = (NSMutableData *)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", -[NSMutableData bytes](self->_buffer, "bytes"), 0x8000, 0);
      }
      p_url = &self->_url;
      uint64_t v11 = [(NSString *)[(NSURL *)self->_url scheme] lowercaseString];
      int v12 = [(NSString *)v11 isEqualToString:@"https"]
         || [(NSString *)v11 isEqualToString:@"http"];
      uint64_t v13 = [(NSURL *)*p_url absoluteString];
      id v14 = +[WFWebPageDecorator webPageWithData:buffer URLString:v13];
      uint64_t v15 = (NSString *)[v14 pageTitle];
      if (!v15)
      {
        uint64_t v16 = __WFDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[WebFilterEvaluator addData:]3();
        }
        uint64_t v15 = [(NSURL *)*p_url host];
      }
      self->_pageTitle = (NSString *)[(NSString *)v15 copy];
      if (!_WebFilterIsActive())
      {
        self->_filterState = 0;
        v21 = __WFDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[WebFilterEvaluator addData:]((uint64_t)v15, v21);
        }
        return self->_buffer;
      }
      if ([(NSString *)v11 isEqualToString:@"https"]
        && [(WFUserSettings *)v8 alwaysAllowHTTPS])
      {
        self->_filterState = 0;
        v17 = __WFDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[WebFilterEvaluator addData:]();
        }
        return self->_buffer;
      }
      if (v12)
      {
        if ([(WFUserSettings *)v8 contentFilterOverriddenBlackListContainsURL:v13])
        {
          int v18 = WFDebugLevel();
          v19 = *p_url;
          if (v18 == 1) {
            id v20 = [(WebFilterEvaluator *)self debugPageForPageWithData:self->_buffer forURL:v19 debugString:@"URL was on content filter blacklist"];
          }
          else {
            id v20 = [(WebFilterEvaluator *)self blockPageForPageWithTitle:self->_pageTitle origURL:v19];
          }
          uint64_t v23 = v20;
          [(NSMutableData *)self->_buffer setLength:0];
          self->_filterState = 1;
          uint64_t v24 = __WFDefaultLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            -[WebFilterEvaluator addData:]();
          }
          return v23;
        }
        if ([(WFUserSettings *)v8 contentFilterEnabled])
        {
          if ([(WFUserSettings *)v8 autoWhitelistContainsURL:*p_url])
          {
            uint64_t v22 = __WFDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              -[WebFilterEvaluator addData:].cold.7();
            }
          }
          else if (-[WFUserSettings contentFilterOverriddenWhiteListContainsURL:withAppleAllowList:](v8, "contentFilterOverriddenWhiteListContainsURL:withAppleAllowList:", v13, objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "sharedBloomFilter"), "appleAllowList")))
          {
            uint64_t v25 = __WFDefaultLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
              -[WebFilterEvaluator addData:].cold.8();
            }
          }
          else if (v14)
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "sharedBloomFilter"), "shouldBlock:", self->_url))
            {
              if (WFDebugLevel() == 1)
              {
                id v26 = [(WebFilterEvaluator *)self debugPageForPageWithData:self->_buffer forURL:self->_url debugString:@"URL is explicit"];
              }
              else
              {
                v35 = __WFDefaultLog();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
                  -[WebFilterEvaluator addData:]1();
                }
                id v26 = [(WebFilterEvaluator *)self blockPageForPageWithTitle:self->_pageTitle origURL:self->_url];
              }
              uint64_t v23 = v26;
              [(NSMutableData *)self->_buffer setLength:0];
              self->_filterState = 1;
              v36 = __WFDefaultLog();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
                -[WebFilterEvaluator addData:]0();
              }
              return v23;
            }
            v28 = __WFDefaultLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
              -[WebFilterEvaluator addData:]2();
            }
          }
          else
          {
            uint64_t v27 = __WFDefaultLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              -[WebFilterEvaluator addData:].cold.9();
            }
          }
        }
        if ([(WFUserSettings *)v8 whiteListEnabled])
        {
          if (![(WFUserSettings *)v8 whiteListContainsURL:v13]
            && ![(WFUserSettings *)v8 autoWhitelistContainsURL:*p_url])
          {
            int v31 = WFDebugLevel();
            v32 = *p_url;
            if (v31 == 1) {
              id v33 = [(WebFilterEvaluator *)self debugPageForPageWithData:self->_buffer forURL:v32 debugString:@"URL was on content filter blacklist"];
            }
            else {
              id v33 = [(WebFilterEvaluator *)self blockPageForPageWithTitle:self->_pageTitle origURL:v32];
            }
            uint64_t v23 = v33;
            [(NSMutableData *)self->_buffer setLength:0];
            self->_filterState = 1;
            v34 = __WFDefaultLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
              -[WebFilterEvaluator addData:].cold.6();
            }
            return v23;
          }
          v29 = __WFDefaultLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[WebFilterEvaluator addData:].cold.5();
          }
        }
      }
      v30 = __WFDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[WebFilterEvaluator addData:].cold.4();
      }
    }
    self->_filterState = 0;
    return self->_buffer;
  }
  v4 = (void *)MEMORY[0x263EFF8F8];
  return (id)[v4 data];
}

- (id)dataComplete
{
  return [(WebFilterEvaluator *)self addData:0];
}

- (int)filterState
{
  objc_super v3 = __WFDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(WebFilterEvaluator *)(uint64_t)self filterState];
  }
  return self->_filterState;
}

- (BOOL)wasBlocked
{
  return self->_filterState == 1;
}

- (void)attemptUnblockWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__WebFilterEvaluator_attemptUnblockWithCompletion___block_invoke;
  v3[3] = &unk_26429C7C0;
  v3[4] = a3;
  [(WebFilterEvaluator *)self unblockWithCompletion:v3];
}

uint64_t __51__WebFilterEvaluator_attemptUnblockWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = __WFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__WebFilterEvaluator_attemptUnblockWithCompletion___block_invoke_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unblockWithCompletion:(id)a3
{
  if (a3) {
    self->_completion = (id)[a3 copy];
  }
  if ([(WebFilterEvaluator *)self wasBlocked])
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "keyWindow"), "rootViewController");
    uint64_t v5 = objc_opt_class();
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__WebFilterEvaluator_unblockWithCompletion___block_invoke;
    v7[3] = &unk_26429C838;
    v7[4] = self;
    v7[5] = v4;
    [v5 requestViewController:@"WFServicePINEntryNavigationController" fromServiceWithBundleIdentifier:@"com.apple.WebContentFilter.remoteUI.WebContentAnalysisUI" connectionHandler:v7];
  }
  else
  {
    uint64_t v6 = __WFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[WebFilterEvaluator unblockWithCompletion:]();
    }
    (*((void (**)(void))self->_completion + 2))();
  }
}

uint64_t __44__WebFilterEvaluator_unblockWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __WFDefaultLog();
  if (!a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_3();
      if (a3) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
LABEL_6:
    if (a3) {
      goto LABEL_7;
    }
LABEL_13:
    [*(id *)(a1 + 32) setRemoteViewController:a2];
    [a2 setDelegate:*(void *)(a1 + 32)];
    [a2 setURL:*(void *)(*(void *)(a1 + 32) + 16)];
    [a2 setPageTitle:*(void *)(*(void *)(a1 + 32) + 24)];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_50;
    v10[3] = &unk_26429C810;
    long long v11 = *(_OWORD *)(a1 + 32);
    int v12 = a2;
    return [a2 getIsPINPresentWithCompletion:v10];
  }
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_6;
  }
  __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_4();
  if (!a3) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = __WFDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_2();
  }
  uint64_t v8 = __WFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

uint64_t __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_50(void *a1, int a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = __WFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_2();
    }
    uint64_t v5 = __WFDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_1();
    }
    return (*(uint64_t (**)(void))(*(void *)(a1[4] + 40) + 16))();
  }
  else if (a2)
  {
    uint64_t v7 = (void *)a1[5];
    uint64_t v8 = a1[6];
    return [v7 presentViewController:v8 animated:1 completion:&__block_literal_global_53];
  }
  else
  {
    uint64_t v9 = (void *)a1[6];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_2;
    v10[3] = &unk_26429C7E8;
    void v10[4] = a1[4];
    return [v9 permitURLWithCompletion:v10];
  }
}

uint64_t __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __WFDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_2_cold_2(a2, v4, v5, v6, v7, v8, v9, v10);
    if (!a2) {
      return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
    }
  }
  else if (!a2)
  {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
  }
  long long v11 = __WFDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t filterState = self->_filterState;
  if (filterState <= 3 && filterState != 1)
  {
    NSLog(&cfstr_Webcontentfilt.isa, a2);
    unint64_t filterState = self->_filterState;
  }
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", filterState), @"WebContentFilterStateKey");
  [a3 encodeObject:self->_url forKey:@"WebContentFilterURLKey"];
  pageTitle = self->_pageTitle;
  [a3 encodeObject:pageTitle forKey:@"WebContentFilterPageTitleKey"];
}

- (WebFilterEvaluator)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WebFilterEvaluator;
  uint64_t v4 = [(WebFilterEvaluator *)&v6 init];
  if (v4)
  {
    v4->_unint64_t filterState = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"WebContentFilterStateKey"), "unsignedIntegerValue");
    v4->_url = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"WebContentFilterURLKey"];
    v4->_pageTitle = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"WebContentFilterPageTitleKey"];
  }
  return v4;
}

- (void)userEnteredCorrectPIN
{
  objc_super v3 = [(WebFilterEvaluator *)self remoteViewController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__WebFilterEvaluator_userEnteredCorrectPIN__block_invoke;
  v4[3] = &unk_26429C860;
  v4[4] = self;
  [(WFRemotePINEntryViewController *)v3 dismissViewControllerAnimated:1 completion:v4];
}

uint64_t __43__WebFilterEvaluator_userEnteredCorrectPIN__block_invoke(uint64_t a1)
{
  v2 = __WFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __43__WebFilterEvaluator_userEnteredCorrectPIN__block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

- (void)userDidCancel
{
  objc_super v3 = [(WebFilterEvaluator *)self remoteViewController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__WebFilterEvaluator_userDidCancel__block_invoke;
  v4[3] = &unk_26429C860;
  v4[4] = self;
  [(WFRemotePINEntryViewController *)v3 dismissViewControllerAnimated:1 completion:v4];
}

uint64_t __35__WebFilterEvaluator_userDidCancel__block_invoke(uint64_t a1)
{
  v2 = __WFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __35__WebFilterEvaluator_userDidCancel__block_invoke_cold_2();
  }
  if ([MEMORY[0x263F087E8] errorWithDomain:@"WFPINEntryErrorDomain" code:2 userInfo:0])
  {
    objc_super v3 = __WFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __35__WebFilterEvaluator_userDidCancel__block_invoke_cold_1(v3);
    }
  }
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(*(void *)(a1 + 32) + 40) + 16))(*(void *)(*(void *)(a1 + 32) + 40), 0, [MEMORY[0x263F087E8] errorWithDomain:@"WFPINEntryErrorDomain" code:2 userInfo:0]);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)browserAuditToken
{
  long long v3 = *(_OWORD *)&self[2].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setBrowserAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_browserAuditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_browserAuditToken.val = v3;
}

- (WFRemotePINEntryViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

void __39__WebFilterEvaluator_sharedBloomFilter__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_11(&dword_217734000, v0, v1, "WebFilterEvaluator: WCR starting up", v2, v3, v4, v5, v6);
}

- (void)blockPageForPageWithTitle:(os_log_t)log origURL:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136446723;
  uint64_t v4 = "-[WebFilterEvaluator blockPageForPageWithTitle:origURL:]";
  __int16 v5 = 2113;
  uint64_t v6 = a1;
  __int16 v7 = 2113;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_217734000, log, OS_LOG_TYPE_ERROR, "**** Error %{public}s: nil block page for title %{private}@, URL %{private}@", (uint8_t *)&v3, 0x20u);
}

- (void)blockPageForPageWithTitle:(uint64_t)a3 origURL:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)blockPageForPageWithTitle:(void *)a1 origURL:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [a1 remoteViewController];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_217734000, a2, OS_LOG_TYPE_DEBUG, "WFRemotePINEntryViewController is %s", v3, 0xCu);
}

- (void)blockPageForPageWithTitle:(uint64_t)a3 origURL:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6(&dword_217734000, v0, v1, "%{public}s completion: error: %@", v2, v3, v4, v5, 2u);
}

void __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_217734000, v0, v1, "%{public}s completion: unblocked==%s", v2, v3, v4, v5, 2u);
}

void __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217734000, v0, v1, "WFRemotePINEntryViewController is nil", v2, v3, v4, v5, v6);
}

void __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_11(&dword_217734000, v0, v1, "WFRemotePINEntryViewController created", v2, v3, v4, v5, v6);
}

- (void)addData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217734000, a2, OS_LOG_TYPE_ERROR, "WebFilterEvaluator:addData: '%@' is not blocked: Web Filter is disabled", (uint8_t *)&v2, 0xCu);
}

- (void)addData:.cold.2()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_217734000, v0, v1, "WebFilterEvaluator:addData: %{private}@ is not blocked: always allow HTTPS", v2, v3, v4, v5, v6);
}

- (void)addData:.cold.3()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_217734000, v0, v1, "WebFilterEvaluator:addData: %{private}@ is restricted: blacklisted", v2, v3, v4, v5, v6);
}

- (void)addData:.cold.4()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_217734000, v0, (uint64_t)v0, "WebFilterEvaluator:addData: '%{private}@' at %{private}@ is not blocked", v1);
}

- (void)addData:.cold.5()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_217734000, v0, v1, "WebFilterEvaluator:addData: %{private}@ is not blocked: On pure whitelist", v2, v3, v4, v5, v6);
}

- (void)addData:.cold.6()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_217734000, v0, v1, "WebFilterEvaluator:addData: %{private}@ is blocked: Not on pure whitelist", v2, v3, v4, v5, v6);
}

- (void)addData:.cold.7()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_217734000, v0, v1, "WebFilterEvaluator:addData: %{private}@ is not blocked: auto-whitelisted", v2, v3, v4, v5, v6);
}

- (void)addData:.cold.8()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_217734000, v0, v1, "WebFilterEvaluator:addData: %{private}@ is not blocked: whitelisted", v2, v3, v4, v5, v6);
}

- (void)addData:.cold.9()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_217734000, v0, OS_LOG_TYPE_ERROR, "WebFilterEvaluator:addData: %{private}@ skipped content filter: nil webpageContentString and/or webpage", v1, 0xCu);
}

- (void)addData:.cold.10()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_217734000, v0, (uint64_t)v0, "WebFilterEvaluator:addData: %{private}@ is blocked: '%{private}@' is explicit", v1);
}

- (void)addData:.cold.11()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_217734000, v0, (uint64_t)v0, "WebFilterEvaluator:addData: Getting block page for %{private}@ with title %{private}@", v1);
}

- (void)addData:.cold.12()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_217734000, v0, (uint64_t)v0, "WebFilterEvaluator:addData: %{private}@ is not blocked: '%{private}@' is not explicit", v1);
}

- (void)addData:.cold.13()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217734000, v0, v1, "WebFilterEvaluator:addData: Could not find webpage title", v2, v3, v4, v5, v6);
}

- (void)filterState
{
}

void __51__WebFilterEvaluator_attemptUnblockWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6(&dword_217734000, v0, v1, "%{public}s error: %@", v2, v3, v4, v5, 2u);
}

- (void)unblockWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_217734000, v0, v1, "%{public}s completion: unblocked==%s", v2, v3, v4, v5, 2u);
}

void __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6(&dword_217734000, v0, v1, "%{public}s completion: error: %@", v2, v3, v4, v5, 2u);
}

void __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_217734000, v0, v1, "%{public}s completion: unblocked==%s", v2, v3, v4, v5, 2u);
}

void __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_217734000, a2, a3, "%{public}s completion: unblocked==%s", a5, a6, a7, a8, 2u);
}

void __43__WebFilterEvaluator_userEnteredCorrectPIN__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_217734000, v0, v1, "%{public}s completion: unblocked==%s", v2, v3, v4, v5, 2u);
}

void __35__WebFilterEvaluator_userDidCancel__block_invoke_cold_1(NSObject *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F087E8] errorWithDomain:@"WFPINEntryErrorDomain" code:2 userInfo:0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_217734000, a1, OS_LOG_TYPE_ERROR, "%{public}s completion: error: %@", (uint8_t *)v2, 0x16u);
}

void __35__WebFilterEvaluator_userDidCancel__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_217734000, v0, v1, "%{public}s completion: unblocked==%s", v2, v3, v4, v5, 2u);
}

@end