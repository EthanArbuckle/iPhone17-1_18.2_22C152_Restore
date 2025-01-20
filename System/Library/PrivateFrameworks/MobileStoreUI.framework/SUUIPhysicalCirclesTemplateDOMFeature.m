@interface SUUIPhysicalCirclesTemplateDOMFeature
+ (id)featureName;
+ (id)makeFeatureJSObjectForFeature:(id)a3;
- (IKAppContext)appContext;
- (NSString)featureName;
- (SUUIPhysicalCirclesTemplateDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4;
- (SUUIPhysicalCirclesTemplateDelegate)delegate;
- (id)popPendingAnimationRequests;
- (void)_addDOMUpdateBlock:(id)a3;
- (void)_requestAnimation:(id)a3;
- (void)finishDOMUpdates;
- (void)setDelegate:(id)a3;
@end

@implementation SUUIPhysicalCirclesTemplateDOMFeature

- (SUUIPhysicalCirclesTemplateDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIPhysicalCirclesTemplateDOMFeature;
  v8 = [(SUUIPhysicalCirclesTemplateDOMFeature *)&v13 init];
  if (v8)
  {
    v9 = [v6 appContext];
    objc_storeWeak((id *)&v8->_appContext, v9);

    uint64_t v10 = [v7 copy];
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v10;
  }
  return v8;
}

- (void)finishDOMUpdates
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = (void *)[(NSMutableArray *)self->_domUpdateBlocks copy];
  domUpdateBlocks = self->_domUpdateBlocks;
  self->_domUpdateBlocks = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)popPendingAnimationRequests
{
  v3 = (void *)[(NSMutableArray *)self->_pendingAnimationRequests copy];
  pendingAnimationRequests = self->_pendingAnimationRequests;
  self->_pendingAnimationRequests = 0;

  return v3;
}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3 = a3;
  v4 = [SUUIJSPhysicalCirclesTemplate alloc];
  id v5 = [v3 appContext];
  uint64_t v6 = [(SUUIJSPhysicalCirclesTemplate *)v4 initWithAppContext:v5 DOMFeature:v3];

  return v6;
}

+ (id)featureName
{
  return @"CirclesContainer";
}

- (void)_addDOMUpdateBlock:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (!self->_domUpdateBlocks)
  {
    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    domUpdateBlocks = self->_domUpdateBlocks;
    self->_domUpdateBlocks = v5;

    id v4 = v10;
  }
  uint64_t v7 = (void *)[v4 copy];
  uint64_t v8 = self->_domUpdateBlocks;
  uint64_t v9 = _Block_copy(v7);
  [(NSMutableArray *)v8 addObject:v9];
}

- (void)_requestAnimation:(id)a3
{
  id v8 = a3;
  id v4 = [(SUUIPhysicalCirclesTemplateDOMFeature *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v4 physicalCirclesDOMFeature:self didRequestAnimation:v8];
  }
  else
  {
    pendingAnimationRequests = self->_pendingAnimationRequests;
    if (!pendingAnimationRequests)
    {
      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v7 = self->_pendingAnimationRequests;
      self->_pendingAnimationRequests = v6;

      pendingAnimationRequests = self->_pendingAnimationRequests;
    }
    [(NSMutableArray *)pendingAnimationRequests addObject:v8];
  }
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (SUUIPhysicalCirclesTemplateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIPhysicalCirclesTemplateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAnimationRequests, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_domUpdateBlocks, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appContext);
}

@end