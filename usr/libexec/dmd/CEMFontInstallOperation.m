@interface CEMFontInstallOperation
- (BOOL)isAsynchronous;
- (CEMAssetBaseDescriptor)assetDescriptor;
- (CEMAssetBaseReference)assetReference;
- (CEMFontDeclaration)fontDeclaration;
- (CEMFontInstallOperation)initWithFontDeclaration:(id)a3 resolver:(id)a4;
- (DMDRemoteAssetResolver)resolver;
- (NSString)assetIdentifier;
- (void)assetResolutionDidSucceedWithAssetURL:(id)a3;
- (void)assetResolutionFailedWithError:(id)a3;
- (void)main;
- (void)setFontDeclaration:(id)a3;
- (void)setResolver:(id)a3;
@end

@implementation CEMFontInstallOperation

- (CEMFontInstallOperation)initWithFontDeclaration:(id)a3 resolver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CEMFontInstallOperation;
  v9 = [(CEMFontInstallOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fontDeclaration, a3);
    objc_storeStrong((id *)&v10->_resolver, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  id v3 = [(CEMFontInstallOperation *)self resolver];
  [v3 resolveAssetWithContext:self];
}

- (NSString)assetIdentifier
{
  id v3 = [(CEMFontInstallOperation *)self fontDeclaration];
  v4 = [v3 declarationIdentifier];
  v5 = [(CEMFontInstallOperation *)self fontDeclaration];
  v6 = [v5 declarationServerHash];
  id v7 = +[NSString stringWithFormat:@"%@-%@", v4, v6];

  return (NSString *)v7;
}

- (CEMAssetBaseDescriptor)assetDescriptor
{
  v2 = [(CEMFontInstallOperation *)self fontDeclaration];
  id v3 = [v2 payloadDescriptor];

  return (CEMAssetBaseDescriptor *)v3;
}

- (CEMAssetBaseReference)assetReference
{
  v2 = [(CEMFontInstallOperation *)self fontDeclaration];
  id v3 = [v2 payloadReference];

  return (CEMAssetBaseReference *)v3;
}

- (void)assetResolutionDidSucceedWithAssetURL:(id)a3
{
  id v4 = a3;
  if ([(CEMFontInstallOperation *)self isExecuting])
  {
    if (v4)
    {
      v5 = +[NSFileManager dmd_userFontDatabaseDirectoryURL];
      v6 = +[NSFileManager defaultManager];
      id v18 = 0;
      unsigned __int8 v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v18];
      id v8 = v18;

      if (v7)
      {
        v9 = [(CEMFontInstallOperation *)self assetIdentifier];
        v10 = +[NSUUID UUID];
        uint64_t v11 = +[NSString stringWithFormat:@"%@-%@", v9, v10];
        objc_super v12 = [v5 URLByAppendingPathComponent:v11];

        v13 = +[NSFileManager defaultManager];
        id v17 = v8;
        LOBYTE(v11) = [v13 copyItemAtURL:v4 toURL:v12 error:&v17];
        id v14 = v17;

        if (v11)
        {
          v15 = objc_opt_new();
          [v15 setFontURL:v12];
          [(CEMFontInstallOperation *)self endOperationWithResultObject:v15];
        }
        else
        {
          [(CEMFontInstallOperation *)self endOperationWithError:v14];
        }
      }
      else
      {
        [(CEMFontInstallOperation *)self endOperationWithError:v8];
        id v14 = v8;
      }
    }
    else
    {
      v16 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10007E874(v16);
      }

      DMFErrorWithCodeAndUserInfo();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      [(CEMFontInstallOperation *)self endOperationWithError:v14];
    }
  }
}

- (void)assetResolutionFailedWithError:(id)a3
{
  id v4 = a3;
  if ([(CEMFontInstallOperation *)self isExecuting]) {
    [(CEMFontInstallOperation *)self endOperationWithError:v4];
  }
}

- (CEMFontDeclaration)fontDeclaration
{
  return self->_fontDeclaration;
}

- (void)setFontDeclaration:(id)a3
{
}

- (DMDRemoteAssetResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);

  objc_storeStrong((id *)&self->_fontDeclaration, 0);
}

@end