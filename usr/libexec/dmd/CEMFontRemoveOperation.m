@interface CEMFontRemoveOperation
- (CEMFontAssetInstallMetadata)installMetadata;
- (CEMFontDeclaration)fontDeclaration;
- (CEMFontRemoveOperation)initWithFontDeclaration:(id)a3 installMetadata:(id)a4;
- (void)main;
- (void)setFontDeclaration:(id)a3;
- (void)setInstallMetadata:(id)a3;
@end

@implementation CEMFontRemoveOperation

- (CEMFontRemoveOperation)initWithFontDeclaration:(id)a3 installMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CEMFontRemoveOperation;
  v9 = [(CEMFontRemoveOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fontDeclaration, a3);
    objc_storeStrong((id *)&v10->_installMetadata, a4);
  }

  return v10;
}

- (void)main
{
  v3 = [(CEMFontRemoveOperation *)self installMetadata];
  v4 = [v3 fontURL];

  v5 = +[NSFileManager defaultManager];
  v6 = [v4 path];
  unsigned int v7 = [v5 fileExistsAtPath:v6];

  if (!v7)
  {
    id v9 = 0;
    goto LABEL_5;
  }
  id v10 = 0;
  unsigned __int8 v8 = [v5 removeItemAtURL:v4 error:&v10];
  id v9 = v10;
  if (v8)
  {
LABEL_5:
    [(CEMFontRemoveOperation *)self endOperationWithResultObject:0];
    goto LABEL_6;
  }
  [(CEMFontRemoveOperation *)self endOperationWithError:v9];
LABEL_6:
}

- (CEMFontDeclaration)fontDeclaration
{
  return self->_fontDeclaration;
}

- (void)setFontDeclaration:(id)a3
{
}

- (CEMFontAssetInstallMetadata)installMetadata
{
  return self->_installMetadata;
}

- (void)setInstallMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installMetadata, 0);

  objc_storeStrong((id *)&self->_fontDeclaration, 0);
}

@end