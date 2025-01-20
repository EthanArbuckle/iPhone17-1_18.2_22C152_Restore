@interface PKFilesystemProvider
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6;
- (BOOL)writeToURL:(id)a3 withData:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (PKNSBundleProxy)mainBundle;
- (id)bundleWithURL:(id)a3;
- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)dataWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
@end

@implementation PKFilesystemProvider

- (PKNSBundleProxy)mainBundle
{
  v2 = [PKNSBundleProxy alloc];
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [(PKNSBundleProxy *)v2 initWithNSBundle:v3];

  return v4;
}

- (id)bundleWithURL:(id)a3
{
  id v3 = a3;
  v4 = [PKNSBundleProxy alloc];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithURL:v3];

  v6 = [(PKNSBundleProxy *)v4 initWithNSBundle:v5];
  return v6;
}

- (id)dataWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v8 = a3;
  v9 = (void *)[[v7 alloc] initWithContentsOfURL:v8 options:a4 error:a5];

  return v9;
}

- (BOOL)writeToURL:(id)a3 withData:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  return MEMORY[0x1F4181798](a4, sel_writeToURL_options_error_);
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  v9 = (void *)MEMORY[0x1E4F28CB8];
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 defaultManager];
  LOBYTE(a6) = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:v7 attributes:v10 error:a6];

  return (char)a6;
}

- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  v9 = (void *)MEMORY[0x1E4F28CB8];
  id v10 = a4;
  id v11 = a3;
  v12 = [v9 defaultManager];
  v13 = [v12 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:v10 options:a5 error:a6];

  return v13;
}

@end