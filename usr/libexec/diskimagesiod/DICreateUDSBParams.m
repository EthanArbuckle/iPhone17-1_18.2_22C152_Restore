@interface DICreateUDSBParams
+ (BOOL)checkExistingFileWithURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5;
- (DICreateUDSBParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5;
- (unint64_t)sparseBundleBandSize;
- (void)createDiskImageParamsXPC;
- (void)setSparseBundleBandSize:(unint64_t)a3;
@end

@implementation DICreateUDSBParams

- (DICreateUDSBParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5
{
  v6.receiver = self;
  v6.super_class = (Class)DICreateUDSBParams;
  result = [(DICreateParams *)&v6 initWithURL:a3 numBlocks:a4 error:a5];
  if (result) {
    result->_sparseBundleBandSize = 0x4000000;
  }
  return result;
}

- (void)createDiskImageParamsXPC
{
  v3 = [SparseBundleBackendXPC alloc];
  v4 = [(DIBaseParams *)self inputURL];
  objc_super v6 = [(SparseBundleBackendXPC *)v3 initWithURL:v4 fileOpenFlags:514 bandSize:[(DICreateUDSBParams *)self sparseBundleBandSize]];

  v5 = [(DiskImageParamsXPC *)[DiskImageParamsSparseBundle_XPC alloc] initWithBackendXPC:v6];
  [(DIBaseParams *)self setDiskImageParamsXPC:v5];
}

+ (BOOL)checkExistingFileWithURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  if (a4)
  {
    v8 = +[NSURL fileURLWithPath:@"Info.plist" relativeToURL:v7];
    v9 = +[NSURL fileURLWithPath:@"token" relativeToURL:v7];
    id v10 = v8;
    if (access((const char *)[v10 fileSystemRepresentation], 0)
      || access((const char *)[v9 fileSystemRepresentation], 0))
    {
      BOOL v11 = +[DIError failWithPOSIXCode:17 verboseInfo:@"The requested URL is an existing non-sparsebundle folder" error:a5];
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = +[DIError failWithPOSIXCode:20 verboseInfo:@"The requested URL is an existing regular file" error:a5];
  }

  return v11;
}

- (unint64_t)sparseBundleBandSize
{
  return self->_sparseBundleBandSize;
}

- (void)setSparseBundleBandSize:(unint64_t)a3
{
  self->_sparseBundleBandSize = a3;
}

@end