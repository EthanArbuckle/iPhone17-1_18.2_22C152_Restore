@interface _UINSItemProviderImageLoader
- (BOOL)_really_cancel;
- (NSProgress)_progress;
- (_UINSItemProviderImageLoader)initWithItemProvider:(id)a3 typeIdentifier:(id)a4;
- (void)_really_loadImage:(id)a3;
- (void)_setProgress:(id)a3;
@end

@implementation _UINSItemProviderImageLoader

- (_UINSItemProviderImageLoader)initWithItemProvider:(id)a3 typeIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UINSItemProviderImageLoader;
  v9 = [(_UIImageLoader *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemProvider, a3);
    if (v8)
    {
      v11 = (void *)[v8 copy];
    }
    else
    {
      v11 = [(id)*MEMORY[0x1E4F44400] identifier];
    }
    v12 = v11;
    objc_storeStrong((id *)&v10->_typeIdentifier, v11);
  }
  return v10;
}

- (void)_really_loadImage:(id)a3
{
  id v4 = a3;
  itemProvider = self->_itemProvider;
  typeIdentifier = self->_typeIdentifier;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __50___UINSItemProviderImageLoader__really_loadImage___block_invoke;
  v12 = &unk_1E52EC188;
  v13 = self;
  id v14 = v4;
  id v7 = v4;
  id v8 = [(NSItemProvider *)itemProvider loadDataRepresentationForTypeIdentifier:typeIdentifier completionHandler:&v9];
  -[_UINSItemProviderImageLoader _setProgress:](self, "_setProgress:", v8, v9, v10, v11, v12, v13);
}

- (BOOL)_really_cancel
{
  v2 = [(_UINSItemProviderImageLoader *)self _progress];
  [v2 cancel];

  return 1;
}

- (NSProgress)_progress
{
  return (NSProgress *)objc_getProperty(self, a2, 64, 1);
}

- (void)_setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__progress, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end