@interface DCDocument
+ (id)documentWithURL:(id)a3;
+ (id)documentWithURL:(id)a3 annotation:(id)a4;
- (DCDocument)initWithURL:(id)a3 annotation:(id)a4;
- (NSURL)fileURL;
- (id)annotation;
- (void)openInDefaultAppWithCompletionHandler:(id)a3;
- (void)openWithAppBundleIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation DCDocument

- (void).cxx_destruct
{
  objc_storeStrong(&self->_annotation, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (id)annotation
{
  return self->_annotation;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)openInDefaultAppWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__DCDocument_openInDefaultAppWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E65572A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __52__DCDocument_openInDefaultAppWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__28584;
  v16 = __Block_byref_object_dispose__28585;
  id v17 = 0;
  v2 = [*(id *)(a1 + 32) fileURL];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __52__DCDocument_openInDefaultAppWithCompletionHandler___block_invoke_2;
  v9 = &unk_1E6551558;
  v11 = &v12;
  id v10 = *(id *)(a1 + 40);
  uint64_t v3 = WFCreateDocumentInteractionController(v2, &v6);
  id v4 = (void *)v13[5];
  v13[5] = v3;

  id v5 = objc_msgSend(*(id *)(a1 + 32), "annotation", v6, v7, v8, v9);
  [(id)v13[5] setAnnotation:v5];

  [(id)v13[5] openDocumentWithDefaultApplication];
  _Block_object_dispose(&v12, 8);
}

uint64_t __52__DCDocument_openInDefaultAppWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)openWithAppBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__DCDocument_openWithAppBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E6557D28;
  id v11 = v6;
  id v12 = v7;
  block[4] = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__DCDocument_openWithAppBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__28584;
  v18 = __Block_byref_object_dispose__28585;
  id v19 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) fileURL];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __60__DCDocument_openWithAppBundleIdentifier_completionHandler___block_invoke_8;
  id v11 = &unk_1E6551558;
  v13 = &v14;
  id v12 = *(id *)(a1 + 48);
  uint64_t v3 = WFCreateDocumentInteractionController(v2, &v8);
  id v4 = (void *)v15[5];
  v15[5] = v3;

  id v5 = objc_msgSend(*(id *)(a1 + 32), "annotation", v8, v9, v10, v11);
  [(id)v15[5] setAnnotation:v5];

  id v6 = (void *)v15[5];
  id v7 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:*(void *)(a1 + 40)];
  [v6 _openDocumentWithApplication:v7];

  _Block_object_dispose(&v14, 8);
}

uint64_t __60__DCDocument_openWithAppBundleIdentifier_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (DCDocument)initWithURL:(id)a3 annotation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"DCDocument.m", 88, @"Invalid parameter not satisfying: %@", @"fileURL" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)DCDocument;
  uint64_t v9 = [(DCDocument *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    fileURL = v9->_fileURL;
    v9->_fileURL = (NSURL *)v10;

    objc_storeStrong(&v9->_annotation, a4);
    id v12 = v9;
  }

  return v9;
}

+ (id)documentWithURL:(id)a3 annotation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[DCDocument alloc] initWithURL:v6 annotation:v5];

  return v7;
}

+ (id)documentWithURL:(id)a3
{
  id v3 = a3;
  id v4 = [[DCDocument alloc] initWithURL:v3 annotation:0];

  return v4;
}

@end