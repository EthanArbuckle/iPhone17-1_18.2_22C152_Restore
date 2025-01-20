@interface ICSynapseLinkPreviewLoadingOperation
- (ICSynapseLinkPreviewLoadingOperation)initWithSynapseItem:(id)a3;
- (void)linkPreviewDidFinishLoading:(id)a3;
- (void)loadPreviewWithCompletionBlock:(id)a3;
@end

@implementation ICSynapseLinkPreviewLoadingOperation

- (ICSynapseLinkPreviewLoadingOperation)initWithSynapseItem:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSynapseLinkPreviewLoadingOperation;
  v5 = [(ICSynapseLinkPreviewLoadingOperation *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    synapseItem = v5->_synapseItem;
    v5->_synapseItem = (SYContentItem *)v6;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v5 selector:sel_linkPreviewDidFinishLoading_ name:*MEMORY[0x1E4FA9280] object:v5->_synapseItem];
  }
  return v5;
}

- (void)loadPreviewWithCompletionBlock:(id)a3
{
  id v4 = (void *)[a3 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v4;

  synapseItem = self->_synapseItem;
  [(SYContentItem *)synapseItem loadFullPreviewIfNeeded];
}

- (void)linkPreviewDidFinishLoading:(id)a3
{
  id v6 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICSynapseLinkPreviewLoadingOperation linkPreviewDidFinishLoading:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if (self->_completionBlock)
  {
    synapseItem = self->_synapseItem;
    v5 = [v6 object];

    if (synapseItem == v5) {
      (*((void (**)(void))self->_completionBlock + 2))();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_synapseItem, 0);
}

@end