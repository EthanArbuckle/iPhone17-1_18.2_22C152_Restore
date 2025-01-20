@interface WBSUISafariSandboxBrokerConnection
- (void)getLinkMetadataForMessageWithGUID:(id)a3 completionHandler:(id)a4;
- (void)loadLinkPresentationMetdataForMessageWithGUID:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSUISafariSandboxBrokerConnection

- (void)loadLinkPresentationMetdataForMessageWithGUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __102__WBSUISafariSandboxBrokerConnection_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke;
  v10[3] = &unk_1E5E45F50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(WBSSafariSandboxBrokerConnection *)self _connectionWithCompletionHandler:v10];
}

void __102__WBSUISafariSandboxBrokerConnection_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __102__WBSUISafariSandboxBrokerConnection_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_2;
    v7[3] = &unk_1E5E43538;
    id v8 = *(id *)(a1 + 40);
    v5 = [a2 remoteObjectProxyWithErrorHandler:v7];
    [v5 loadLinkPresentationMetdataForMessageWithGUID:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
}

uint64_t __102__WBSUISafariSandboxBrokerConnection_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getLinkMetadataForMessageWithGUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__WBSUISafariSandboxBrokerConnection_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke;
  v10[3] = &unk_1E5E45F50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(WBSSafariSandboxBrokerConnection *)self _connectionWithCompletionHandler:v10];
}

void __90__WBSUISafariSandboxBrokerConnection_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90__WBSUISafariSandboxBrokerConnection_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke_2;
    v7[3] = &unk_1E5E43538;
    id v8 = *(id *)(a1 + 40);
    v5 = [a2 remoteObjectProxyWithErrorHandler:v7];
    [v5 getLinkMetadataForMessageWithGUID:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
}

uint64_t __90__WBSUISafariSandboxBrokerConnection_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end