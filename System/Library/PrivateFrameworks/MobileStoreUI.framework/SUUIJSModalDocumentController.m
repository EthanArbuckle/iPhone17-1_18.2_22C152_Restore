@interface SUUIJSModalDocumentController
- (NSArray)documents;
- (SUUIJSModalDocumentController)initWithAppContext:(id)a3 modalDocumentController:(id)a4;
- (SUUIModalDocumentController)modalDocumentController;
- (id)_adjustedOptionsWithOptions:(id)a3;
- (void)popDocument;
- (void)pushDocument:(id)a3 :(id)a4;
- (void)replaceDocument:(id)a3 :(id)a4 :(id)a5;
@end

@implementation SUUIJSModalDocumentController

- (SUUIJSModalDocumentController)initWithAppContext:(id)a3 modalDocumentController:(id)a4
{
  id v6 = a3;
  objc_initWeak(&location, a4);
  v10.receiver = self;
  v10.super_class = (Class)SUUIJSModalDocumentController;
  v7 = [(IKJSObject *)&v10 initWithAppContext:v6];
  if (v7)
  {
    id v8 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_modalDocumentController, v8);
  }
  objc_destroyWeak(&location);

  return v7;
}

- (SUUIModalDocumentController)modalDocumentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalDocumentController);
  return (SUUIModalDocumentController *)WeakRetained;
}

- (NSArray)documents
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__102;
  v11 = __Block_byref_object_dispose__102;
  id v12 = 0;
  v3 = [(IKJSObject *)self appContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SUUIJSModalDocumentController_documents__block_invoke;
  v6[3] = &unk_265406408;
  v6[4] = self;
  v6[5] = &v7;
  [v3 evaluateDelegateBlockSync:v6];

  v4 = [(id)v8[5] valueForKey:@"jsDocument"];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __42__SUUIJSModalDocumentController_documents__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = [WeakRetained documents];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)popDocument
{
  uint64_t v3 = [(IKJSObject *)self appContext];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SUUIJSModalDocumentController_popDocument__block_invoke;
  v4[3] = &unk_265405558;
  v4[4] = self;
  [v3 evaluateDelegateBlockSync:v4];
}

void __44__SUUIJSModalDocumentController_popDocument__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained popDocument];
}

- (void)pushDocument:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IKJSObject *)self appContext];
  if (v6
    && [MEMORY[0x263F4B3D8] instancesRespondToSelector:sel_initWithAppContext_document_owner_])
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F4B3D8]) initWithAppContext:v8 document:v6 owner:self];
  }
  else
  {
    uint64_t v9 = 0;
  }
  objc_super v10 = [(SUUIJSModalDocumentController *)self _adjustedOptionsWithOptions:v7];

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__102;
  v23 = __Block_byref_object_dispose__102;
  id v24 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__SUUIJSModalDocumentController_pushDocument::__block_invoke;
  v14[3] = &unk_265408C88;
  v14[4] = self;
  id v11 = v9;
  id v15 = v11;
  id v12 = v10;
  id v16 = v12;
  v18 = &v19;
  id v13 = v8;
  id v17 = v13;
  [v13 evaluateDelegateBlockSync:v14];
  [v6 setNavigationDocument:v20[5]];

  _Block_object_dispose(&v19, 8);
}

void __47__SUUIJSModalDocumentController_pushDocument::__block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  [WeakRetained pushDocument:a1[5] options:a1[6]];

  id v3 = objc_loadWeakRetained((id *)(a1[4] + 24));
  id v7 = [v3 navigationDocumentForDocument:a1[5]];

  if (v7)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F4B460]) initWithAppContext:a1[7] navigationController:v7];
    uint64_t v5 = *(void *)(a1[8] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (void)replaceDocument:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IKJSObject *)self appContext];
  if (v8
    && [MEMORY[0x263F4B3D8] instancesRespondToSelector:sel_initWithAppContext_document_owner_])
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x263F4B3D8]) initWithAppContext:v11 document:v8 owner:self];
  }
  else
  {
    id v12 = 0;
  }
  id v13 = [(SUUIJSModalDocumentController *)self _adjustedOptionsWithOptions:v10];

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__102;
  v35 = __Block_byref_object_dispose__102;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__102;
  v29 = __Block_byref_object_dispose__102;
  id v30 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __51__SUUIJSModalDocumentController_replaceDocument_::__block_invoke;
  v18[3] = &unk_265408CB0;
  v18[4] = self;
  id v14 = v9;
  id v19 = v14;
  v23 = &v31;
  id v15 = v12;
  id v20 = v15;
  id v16 = v13;
  id v21 = v16;
  id v24 = &v25;
  id v17 = v11;
  id v22 = v17;
  [v17 evaluateDelegateBlockSync:v18];
  if (v32[5]) {
    objc_msgSend(v17, "setException:withErrorMessage:", 0);
  }
  else {
    [v8 setNavigationDocument:v26[5]];
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

void __51__SUUIJSModalDocumentController_replaceDocument_::__block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  id v3 = [WeakRetained documents];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v21 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
      id v10 = objc_msgSend(v9, "valueForKey:", @"jsDocument", (void)v20);
      char v11 = [v10 isEqual:a1[5]];

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v9;

    if (!v12) {
      goto LABEL_14;
    }
    id v13 = objc_loadWeakRetained((id *)(a1[4] + 24));
    [v13 replaceDocument:v12 withDocument:a1[6] options:a1[7]];

    id v14 = objc_loadWeakRetained((id *)(a1[4] + 24));
    id v15 = [v14 navigationDocumentForDocument:a1[6]];

    if (v15)
    {
      uint64_t v16 = [objc_alloc(MEMORY[0x263F4B460]) initWithAppContext:a1[8] navigationController:v15];
      uint64_t v17 = *(void *)(a1[10] + 8);
      v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
  else
  {
LABEL_9:

LABEL_14:
    uint64_t v19 = *(void *)(a1[9] + 8);
    id v12 = *(id *)(v19 + 40);
    *(void *)(v19 + 40) = @"Old document not found";
  }
}

- (id)_adjustedOptionsWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = [v3 objectForKey:@"sourceElement"];

  if (v5)
  {
    uint64_t v6 = [v5 getAttribute:@"itmlID"];
    if ([v6 length]) {
      [v4 setObject:v6 forKey:@"sourceElement"];
    }
    else {
      [v4 removeObjectForKey:@"sourceElement"];
    }
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end