@interface ASKImageRequest
+ (NSArray)searchBundles;
+ (void)setSearchBundles:(id)a3;
- (ASKImageDataConsumer)dataConsumer;
- (ASKImageRequest)init;
- (ASKImageRequest)initWithURLRequest:(id)a3 dataConsumer:(id)a4 delegate:(id)a5;
- (ASKImageRequestDelegate)delegate;
- (BOOL)isMonogramRequest;
- (BOOL)isResourceRequest;
- (NSURLRequest)urlRequest;
- (id)description;
- (id)makeLoadOperation;
- (unint64_t)cacheOptions;
- (void)didLoadResource:(id)a3 error:(id)a4;
@end

@implementation ASKImageRequest

- (ASKImageRequest)initWithURLRequest:(id)a3 dataConsumer:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASKImageRequest;
  v11 = [(ASKResourceRequest *)&v15 init];
  if (v11)
  {
    v12 = (NSURLRequest *)[v8 copy];
    urlRequest = v11->_urlRequest;
    v11->_urlRequest = v12;

    objc_storeStrong((id *)&v11->_dataConsumer, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
  }

  return v11;
}

- (ASKImageRequest)init
{
  return 0;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(ASKImageRequest *)self urlRequest];
  v6 = [(ASKImageRequest *)self dataConsumer];
  v7 = +[NSString stringWithFormat:@"<%@:%p urlRequest = %@, dataConsumer = %@>", v4, self, v5, v6];

  return v7;
}

- (BOOL)isResourceRequest
{
  v3 = +[PUIArtworkURLScheme resource];
  v4 = [(ASKImageRequest *)self urlRequest];
  v5 = [v4 URL];
  v6 = [v5 scheme];
  unsigned __int8 v7 = [v3 isEqual:v6];

  return v7;
}

- (BOOL)isMonogramRequest
{
  v3 = +[PUIArtworkURLScheme monogram];
  v4 = [(ASKImageRequest *)self urlRequest];
  v5 = [v4 URL];
  v6 = [v5 scheme];
  unsigned __int8 v7 = [v3 isEqual:v6];

  return v7;
}

- (unint64_t)cacheOptions
{
  if ([(ASKImageRequest *)self isResourceRequest]) {
    return 6;
  }
  else {
    return 2;
  }
}

+ (void)setSearchBundles:(id)a3
{
  _searchBundles = (uint64_t)[a3 copy];

  _objc_release_x1();
}

+ (NSArray)searchBundles
{
  if (_searchBundles)
  {
    id v2 = [(id)_searchBundles copy];
  }
  else
  {
    v3 = +[NSBundle mainBundle];
    v6[0] = v3;
    v4 = +[NSBundle bundleWithIdentifier:@"com.apple.ShelfKit"];
    v6[1] = v4;
    id v2 = +[NSArray arrayWithObjects:v6 count:2];
  }

  return (NSArray *)v2;
}

- (id)makeLoadOperation
{
  if ([(ASKImageRequest *)self isResourceRequest])
  {
    v3 = [ASKLoadBundleResourceOperation alloc];
    v4 = [(ASKImageRequest *)self urlRequest];
    v5 = [v4 URL];
    v6 = [v5 host];
    unsigned __int8 v7 = [(id)objc_opt_class() searchBundles];
    id v8 = [(ASKLoadBundleResourceOperation *)v3 initWithResourceName:v6 searchBundles:v7];

LABEL_5:
    goto LABEL_7;
  }
  if ([(ASKImageRequest *)self isMonogramRequest])
  {
    id v9 = [ASKLoadMonogramResourceOperation alloc];
    v4 = [(ASKImageRequest *)self urlRequest];
    v5 = [v4 URL];
    v6 = [(ASKImageRequest *)self dataConsumer];
    [v6 size];
    id v8 = -[ASKLoadMonogramResourceOperation initWithMonogramResourceURL:size:](v9, "initWithMonogramResourceURL:size:", v5);
    goto LABEL_5;
  }
  id v10 = [ASKLoadImageResourceOperation alloc];
  v4 = [(ASKImageRequest *)self urlRequest];
  v5 = [(ASKImageRequest *)self dataConsumer];
  id v8 = [(ASKLoadImageResourceOperation *)v10 initWithURLRequest:v4 dataConsumer:v5];
LABEL_7:

  return v8;
}

- (void)didLoadResource:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  unsigned __int8 v7 = [(ASKImageRequest *)self delegate];
  id v8 = v7;
  if (v6) {
    [v7 imageRequest:self didFailWithError:v6];
  }
  else {
    [v7 imageRequest:self didLoadImage:v9];
  }
}

- (ASKImageDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (ASKImageRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASKImageRequestDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_urlRequest, 0);

  objc_storeStrong((id *)&self->_dataConsumer, 0);
}

@end