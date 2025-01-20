@interface _UIDocumentActivityDownloadOperation
- (_UIDocumentActivityDownloadOperation)initWithURL:(id)a3 scene:(id)a4;
- (void)main;
@end

@implementation _UIDocumentActivityDownloadOperation

- (_UIDocumentActivityDownloadOperation)initWithURL:(id)a3 scene:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIDocumentActivityDownloadOperation;
  v9 = [(_UIDocumentActivityDownloadOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeWeak((id *)&v10->_weakScene, v8);
  }

  return v10;
}

- (void)main
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __44___UIDocumentActivityDownloadOperation_main__block_invoke;
  id v8 = &unk_1E52D9F98;
  v9 = self;
  id v10 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], &v5);
  objc_msgSend(v4, "coordinateReadingItemAtURL:options:error:byAccessor:", self->_url, 0, 0, &__block_literal_global_162, v5, v6, v7, v8, v9);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakScene);
  objc_storeStrong((id *)&self->_url, 0);
}

@end