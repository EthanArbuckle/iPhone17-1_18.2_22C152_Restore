@interface UIImageReader
+ (UIImageReader)defaultReader;
+ (UIImageReader)readerWithConfiguration:(UIImageReaderConfiguration *)configuration;
- (UIImage)imageWithContentsOfFileURL:(NSURL *)url;
- (UIImage)imageWithData:(NSData *)data;
- (UIImageReader)init;
- (UIImageReader)initWithConfiguration:(id)a3;
- (UIImageReaderConfiguration)configuration;
- (void)imageWithContentsOfFileURL:(NSURL *)url completion:(void *)completion;
- (void)imageWithData:(NSData *)data completion:(void *)completion;
@end

@implementation UIImageReader

+ (UIImageReader)defaultReader
{
  if (qword_1EB263008 != -1) {
    dispatch_once(&qword_1EB263008, &__block_literal_global_52_2);
  }
  v2 = (void *)qword_1EB263000;
  return (UIImageReader *)v2;
}

void __30__UIImageReader_defaultReader__block_invoke()
{
  v0 = objc_alloc_init(UIImageReader);
  v1 = (void *)qword_1EB263000;
  qword_1EB263000 = (uint64_t)v0;
}

- (UIImageReader)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIImageReader;
  id v5 = [(UIImageReader *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    uint64_t v8 = -[UIImageReaderConfiguration _imageOptions](*((double **)v5 + 1));
    v9 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v8;
  }
  return (UIImageReader *)v5;
}

- (UIImageReader)init
{
  v3 = objc_opt_new();
  id v4 = [(UIImageReader *)self initWithConfiguration:v3];

  return v4;
}

+ (UIImageReader)readerWithConfiguration:(UIImageReaderConfiguration *)configuration
{
  id v5 = configuration;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"UIImageReader.m" lineNumber:263 description:@"Client Error: configuration==nil"];
  }
  uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v5];

  return (UIImageReader *)v6;
}

- (UIImageReaderConfiguration)configuration
{
  v2 = (void *)[(UIImageReaderConfiguration *)self->_configuration copy];
  return (UIImageReaderConfiguration *)v2;
}

- (UIImage)imageWithContentsOfFileURL:(NSURL *)url
{
  configuration = self->_configuration;
  id v5 = url;
  -[UIImageReaderConfiguration _checkIsFileURL:]((uint64_t)configuration, v5);
  uint64_t v6 = -[UIImageReaderConfiguration _imageFromURL:orData:imageRequestOptions:]((double *)self->_configuration, v5, 0, self->_imageOptions);

  return (UIImage *)v6;
}

- (UIImage)imageWithData:(NSData *)data
{
  return (UIImage *)-[UIImageReaderConfiguration _imageFromURL:orData:imageRequestOptions:]((double *)self->_configuration, 0, data, self->_imageOptions);
}

- (void)imageWithContentsOfFileURL:(NSURL *)url completion:(void *)completion
{
  configuration = self->_configuration;
  v7 = completion;
  uint64_t v8 = url;
  -[UIImageReaderConfiguration _checkIsFileURL:]((uint64_t)configuration, v8);
  -[UIImageReaderConfiguration _asyncImageFromURL:orData:imageRequestOptions:completion:]((uint64_t)self->_configuration, v8, 0, self->_imageOptions, v7);
}

- (void)imageWithData:(NSData *)data completion:(void *)completion
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageOptions, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end