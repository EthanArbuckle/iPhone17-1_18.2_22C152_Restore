@interface MSVArtworkServiceResizeRequest
+ (BOOL)supportsSecureCoding;
- (Class)operationClass;
- (MSVArtworkServiceResizeRequest)initWithCoder:(id)a3;
- (MSVArtworkServiceResizeRequest)initWithSourceURL:(id)a3;
- (NSMutableArray)resizeDestinations;
- (NSURL)sourceURL;
- (id)debugDescription;
- (void)addDestinationWithFormat:(int64_t)a3 size:(CGSize)a4 url:(id)a5;
- (void)addJPEGDestinationWithSize:(CGSize)a3 compressionQuality:(double)a4 url:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateDestinationsUsingBlock:(id)a3;
- (void)setResizeDestinations:(id)a3;
- (void)setSourceURL:(id)a3;
@end

@implementation MSVArtworkServiceResizeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizeDestinations, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (void)setResizeDestinations:(id)a3
{
}

- (NSMutableArray)resizeDestinations
{
  return self->_resizeDestinations;
}

- (void)setSourceURL:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MSVArtworkServiceResizeRequest *)self sourceURL];
  v6 = [(MSVArtworkServiceResizeRequest *)self resizeDestinations];
  v7 = [v3 stringWithFormat:@"<%@: %p>\nsourceURL: %@\ndestinations: %@", v4, self, v5, v6];

  return v7;
}

- (Class)operationClass
{
  return (Class)objc_opt_class();
}

- (void)enumerateDestinationsUsingBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSVArtworkServiceResizeRequest.m" lineNumber:152 description:@"Cannot enumerate destinations without a block"];
  }
  v6 = [(MSVArtworkServiceResizeRequest *)self resizeDestinations];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__MSVArtworkServiceResizeRequest_enumerateDestinationsUsingBlock___block_invoke;
  v9[3] = &unk_1E5ADA9E0;
  id v10 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v9];
}

uint64_t __66__MSVArtworkServiceResizeRequest_enumerateDestinationsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addJPEGDestinationWithSize:(CGSize)a3 compressionQuality:(double)a4 url:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  resizeDestinations = self->_resizeDestinations;
  id v10 = a5;
  v11 = +[MSVArtworkServiceResizeRequestDestination jpegDestinationWithSize:compressionQuality:url:](MSVArtworkServiceResizeRequestDestination, "jpegDestinationWithSize:compressionQuality:url:", v10, width, height, a4);
  [(NSMutableArray *)resizeDestinations addObject:v11];

  id v12 = [v10 URLByDeletingLastPathComponent];

  [(MSVArtworkServiceRequest *)self addSandboxExtensionIfNeededForURL:v12];
}

- (void)addDestinationWithFormat:(int64_t)a3 size:(CGSize)a4 url:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  resizeDestinations = self->_resizeDestinations;
  id v10 = a5;
  v11 = +[MSVArtworkServiceResizeRequestDestination destinationWithFormat:size:url:](MSVArtworkServiceResizeRequestDestination, "destinationWithFormat:size:url:", a3, v10, width, height);
  [(NSMutableArray *)resizeDestinations addObject:v11];

  id v12 = [v10 URLByDeletingLastPathComponent];

  [(MSVArtworkServiceRequest *)self addSandboxExtensionIfNeededForURL:v12];
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSVArtworkServiceResizeRequest;
  id v4 = a3;
  [(MSVArtworkServiceRequest *)&v7 encodeWithCoder:v4];
  id v5 = [(MSVArtworkServiceResizeRequest *)self sourceURL];
  [v4 encodeObject:v5 forKey:@"MSVArtworkServiceResizeRequestSourceURL"];

  v6 = [(MSVArtworkServiceResizeRequest *)self resizeDestinations];
  [v4 encodeObject:v6 forKey:@"MSVArtworkServiceResizeRequestDestinations"];
}

- (MSVArtworkServiceResizeRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSVArtworkServiceResizeRequest;
  id v5 = [(MSVArtworkServiceRequest *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSVArtworkServiceResizeRequestSourceURL"];
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"MSVArtworkServiceResizeRequestDestinations"];
    resizeDestinations = v5->_resizeDestinations;
    v5->_resizeDestinations = (NSMutableArray *)v11;
  }
  return v5;
}

- (MSVArtworkServiceResizeRequest)initWithSourceURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSVArtworkServiceResizeRequest;
  uint64_t v6 = [(MSVArtworkServiceRequest *)&v11 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceURL, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    resizeDestinations = v7->_resizeDestinations;
    v7->_resizeDestinations = (NSMutableArray *)v8;

    [(MSVArtworkServiceRequest *)v7 addSandboxExtensionIfNeededForURL:v7->_sourceURL];
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end