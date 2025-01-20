@interface FCSubmitNewsletterPersonalizationVectorCommand
+ (BOOL)supportsSecureCoding;
- (FCSubmitNewsletterPersonalizationVectorCommand)initWithCoder:(id)a3;
- (FCSubmitNewsletterPersonalizationVectorCommand)initWithPersonalizationVector:(id)a3;
- (NSString)personalizationVector;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5;
- (void)setPersonalizationVector:(id)a3;
@end

@implementation FCSubmitNewsletterPersonalizationVectorCommand

- (FCSubmitNewsletterPersonalizationVectorCommand)initWithPersonalizationVector:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCSubmitNewsletterPersonalizationVectorCommand;
  v6 = [(FCSubmitNewsletterPersonalizationVectorCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_personalizationVector, a3);
  }

  return v7;
}

- (FCSubmitNewsletterPersonalizationVectorCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPersonalizationVectorKey"];

  v6 = [(FCSubmitNewsletterPersonalizationVectorCommand *)self initWithPersonalizationVector:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FCSubmitNewsletterPersonalizationVectorCommand *)self personalizationVector];
  [v4 encodeObject:v5 forKey:@"kPersonalizationVectorKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [v7 newsletterEndpointConnection];
  personalizationVector = self->_personalizationVector;
  v11 = dispatch_get_global_queue(-2, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__FCSubmitNewsletterPersonalizationVectorCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v14[3] = &unk_1E5B51B68;
  id v15 = v8;
  v16 = self;
  id v17 = v7;
  id v12 = v7;
  id v13 = v8;
  [v9 submitPersonalizationVector:personalizationVector withCallbackQueue:v11 completion:v14];
}

void __95__FCSubmitNewsletterPersonalizationVectorCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v20 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (a2)
  {
    [*(id *)(a1 + 32) command:*(void *)(a1 + 40) didFinishWithStatus:0];
    id v15 = [*(id *)(a1 + 48) newsletterManager];
    [v15 updateCacheWithNewsletterString:v20 includeArray:v11 newsletters:v12];
  }
  else
  {
    if (objc_msgSend(v13, "fc_isNetworkUnavailableError"))
    {
      v16 = *(void **)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = 1;
    }
    else
    {
      int v19 = objc_msgSend(v14, "fc_shouldRetry");
      v16 = *(void **)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      if (v19) {
        uint64_t v18 = 2;
      }
      else {
        uint64_t v18 = 3;
      }
    }
    [v16 command:v17 didFinishWithStatus:v18];
  }
}

- (NSString)personalizationVector
{
  return self->_personalizationVector;
}

- (void)setPersonalizationVector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end