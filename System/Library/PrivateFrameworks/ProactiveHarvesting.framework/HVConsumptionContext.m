@interface HVConsumptionContext
- (BMIdentifiableContentEvent)content;
- (BOOL)shouldContinue;
- (HVConsumptionContext)initWithContent:(id)a3 contentProtection:(id)a4 scheduledTaskShouldContinueBlock:(id)a5;
- (HVHtmlParser)htmlParser;
- (NSString)contentProtection;
- (id)_parseHtmlContentIfAvailable;
- (id)description;
@end

@implementation HVConsumptionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_cachedParser, 0);

  objc_storeStrong(&self->_scheduledTaskShouldContinueBlock, 0);
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (BMIdentifiableContentEvent)content
{
  return self->_content;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(BMIdentifiableContentEvent *)self->_content uniqueId];
  v6 = (void *)[v3 initWithFormat:@"<HVConsumptionContext c:%@ u:%@ p:%@>", v4, v5, self->_contentProtection];

  return v6;
}

- (HVHtmlParser)htmlParser
{
  return (HVHtmlParser *)[(_PASLazyResult *)self->_cachedParser result];
}

- (id)_parseHtmlContentIfAvailable
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = self->_content;
    uint64_t v4 = [(BMIdentifiableContentEvent *)v3 htmlContent];
    if (v4)
    {
      v5 = [[HVHtmlParser alloc] initWithData:v4 encoding:4];
    }
    else
    {
      v7 = hv_default_log_handle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVConsumptionContext<BMMailContentEvent>: unable to fetch HTML content, will parse plaintext converted to HTML", v11, 2u);
      }

      v8 = [(BMIdentifiableContentEvent *)v3 textContent];
      v9 = v8;
      if (!v8) {
        v8 = &stru_26DAC8728;
      }
      v10 = (void *)[(__CFString *)v8 mutableCopy];

      objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
        2,
        0,
        [v10 length]);
      objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
        2,
        0,
        [v10 length]);
      objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"<br>", 2, 0, objc_msgSend(v10, "length"));
      v5 = [[HVHtmlParser alloc] initWithString:v10];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldContinue
{
  scheduledTaskShouldContinueBlock = (uint64_t (**)(id, SEL))self->_scheduledTaskShouldContinueBlock;
  if (!scheduledTaskShouldContinueBlock
    || (scheduledTaskShouldContinueBlock[2](scheduledTaskShouldContinueBlock, a2) & 1) != 0)
  {
    return 1;
  }
  uint64_t v4 = hv_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_226C41000, v4, OS_LOG_TYPE_DEFAULT, "HVConsumptionContext: _scheduledTaskShouldContinueBlock returned NO", v5, 2u);
  }

  return 0;
}

- (HVConsumptionContext)initWithContent:(id)a3 contentProtection:(id)a4 scheduledTaskShouldContinueBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HVConsumptionContext;
  v12 = [(HVConsumptionContext *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_content, a3);
    objc_storeStrong((id *)&v13->_contentProtection, a4);
    uint64_t v14 = MEMORY[0x22A6669E0](v11);
    id scheduledTaskShouldContinueBlock = v13->_scheduledTaskShouldContinueBlock;
    v13->_id scheduledTaskShouldContinueBlock = (id)v14;

    id location = 0;
    objc_initWeak(&location, v13);
    id v16 = objc_alloc(MEMORY[0x263F61E68]);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __91__HVConsumptionContext_initWithContent_contentProtection_scheduledTaskShouldContinueBlock___block_invoke;
    v20[3] = &unk_2647D50B8;
    objc_copyWeak(&v21, &location);
    uint64_t v17 = [v16 initWithBlock:v20];
    cachedParser = v13->_cachedParser;
    v13->_cachedParser = (_PASLazyResult *)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v13;
}

id __91__HVConsumptionContext_initWithContent_contentProtection_scheduledTaskShouldContinueBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    __assert_rtn("-[HVConsumptionContext initWithContent:contentProtection:scheduledTaskShouldContinueBlock:]_block_invoke", "HVConsumptionContext.m", 32, "strongSelf");
  }
  v2 = WeakRetained;
  id v3 = [WeakRetained _parseHtmlContentIfAvailable];

  return v3;
}

@end