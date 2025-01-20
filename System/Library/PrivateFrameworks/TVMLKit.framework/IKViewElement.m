@interface IKViewElement
@end

@implementation IKViewElement

void __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = [*(id *)(a1 + 32) jsContext];
    v8 = [*(id *)(a1 + 40) retrieveJSElementForViewElement:*(void *)(a1 + 48) jsContext:v7];
    v9 = (void *)[objc_alloc(MEMORY[0x263F4B3D8]) initWithAppContext:*(void *)(a1 + 32) document:v5 owner:v8];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_2;
    block[3] = &unk_264BA7B28;
    id v17 = *(id *)(a1 + 56);
    id v15 = v9;
    id v16 = v6;
    id v10 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_3;
    v11[3] = &unk_264BA7B50;
    id v13 = *(id *)(a1 + 56);
    id v12 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v11);

    v7 = v13;
  }
}

uint64_t __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_4(uint64_t a1, int a2, int a3)
{
  if (!a2 || a3)
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_5;
    block[3] = &unk_264BA68A0;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end