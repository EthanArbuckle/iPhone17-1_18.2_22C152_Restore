@interface FCNewsletterSubscribeCommand
+ (BOOL)supportsSecureCoding;
- (FCNewsletterSubscribeCommand)initWithCoder:(id)a3;
- (FCNewsletterSubscribeCommand)initWithNewsletter:(id)a3 includeArray:(id)a4;
- (NSArray)includeArray;
- (NSString)newsletter;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5;
- (void)setIncludeArray:(id)a3;
- (void)setNewsletter:(id)a3;
@end

@implementation FCNewsletterSubscribeCommand

- (FCNewsletterSubscribeCommand)initWithNewsletter:(id)a3 includeArray:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCNewsletterSubscribeCommand;
  v9 = [(FCNewsletterSubscribeCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_newsletter, a3);
    objc_storeStrong((id *)&v10->_includeArray, a4);
  }

  return v10;
}

- (FCNewsletterSubscribeCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNewsletterKey"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kIncludeKey"];

  v10 = [(FCNewsletterSubscribeCommand *)self initWithNewsletter:v5 includeArray:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FCNewsletterSubscribeCommand *)self newsletter];
  [v4 encodeObject:v5 forKey:@"kNewsletterKey"];

  id v6 = [(FCNewsletterSubscribeCommand *)self includeArray];
  [v4 encodeObject:v6 forKey:@"kIncludeKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 newsletterEndpointConnection];
  newsletter = self->_newsletter;
  includeArray = self->_includeArray;
  objc_super v12 = dispatch_get_global_queue(-2, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__FCNewsletterSubscribeCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v15[3] = &unk_1E5B563A8;
  id v16 = v8;
  v17 = self;
  id v18 = v7;
  id v13 = v7;
  id v14 = v8;
  [v9 newsletterSubscribeTo:newsletter includeArray:includeArray callbackQueue:v12 completion:v15];
}

void __77__FCNewsletterSubscribeCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v14)
  {
    [*(id *)(a1 + 32) command:*(void *)(a1 + 40) didFinishWithStatus:0];
    objc_super v12 = [*(id *)(a1 + 48) newsletterManager];
    [v12 updateCacheWithNewsletterString:v14 includeArray:v9 newsletters:v10];
  }
  else
  {
    if (objc_msgSend(v11, "fc_isNetworkUnavailableError"))
    {
      uint64_t v13 = 1;
    }
    else if (objc_msgSend(v11, "fc_shouldRetry"))
    {
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v13 = 3;
    }
    [*(id *)(a1 + 32) command:*(void *)(a1 + 40) didFinishWithStatus:v13];
  }
}

- (NSString)newsletter
{
  return self->_newsletter;
}

- (void)setNewsletter:(id)a3
{
}

- (NSArray)includeArray
{
  return self->_includeArray;
}

- (void)setIncludeArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includeArray, 0);
  objc_storeStrong((id *)&self->_newsletter, 0);
}

@end