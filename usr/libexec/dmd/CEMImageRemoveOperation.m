@interface CEMImageRemoveOperation
- (CEMImageAssetInstallMetadata)installMetadata;
- (CEMImageDeclaration)imageDeclaration;
- (CEMImageRemoveOperation)initWithImageDeclaration:(id)a3 installMetadata:(id)a4;
- (void)main;
- (void)setImageDeclaration:(id)a3;
- (void)setInstallMetadata:(id)a3;
@end

@implementation CEMImageRemoveOperation

- (CEMImageRemoveOperation)initWithImageDeclaration:(id)a3 installMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CEMImageRemoveOperation;
  v9 = [(CEMImageRemoveOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageDeclaration, a3);
    objc_storeStrong((id *)&v10->_installMetadata, a4);
  }

  return v10;
}

- (void)main
{
  v3 = [(CEMImageRemoveOperation *)self installMetadata];
  v4 = [v3 imageURL];

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
    [(CEMImageRemoveOperation *)self endOperationWithResultObject:0];
    goto LABEL_6;
  }
  [(CEMImageRemoveOperation *)self endOperationWithError:v9];
LABEL_6:
}

- (CEMImageDeclaration)imageDeclaration
{
  return self->_imageDeclaration;
}

- (void)setImageDeclaration:(id)a3
{
}

- (CEMImageAssetInstallMetadata)installMetadata
{
  return self->_installMetadata;
}

- (void)setInstallMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installMetadata, 0);

  objc_storeStrong((id *)&self->_imageDeclaration, 0);
}

@end