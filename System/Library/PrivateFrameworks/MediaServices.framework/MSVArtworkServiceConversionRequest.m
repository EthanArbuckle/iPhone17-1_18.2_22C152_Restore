@interface MSVArtworkServiceConversionRequest
+ (BOOL)supportsSecureCoding;
- (Class)operationClass;
- (MSVArtworkServiceConversionRequest)initWithCoder:(id)a3;
- (MSVArtworkServiceConversionRequest)initWithSourceURL:(id)a3 destinationURL:(id)a4 destinationFormat:(int64_t)a5;
- (NSURL)destinationURL;
- (NSURL)sourceURL;
- (double)destinationCompressionQuality;
- (id)debugDescription;
- (int64_t)destinationFormat;
- (int64_t)operationPriority;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationCompressionQuality:(double)a3;
- (void)setDestinationFormat:(int64_t)a3;
- (void)setDestinationURL:(id)a3;
- (void)setSourceURL:(id)a3;
@end

@implementation MSVArtworkServiceConversionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (void)setDestinationCompressionQuality:(double)a3
{
  self->_destinationCompressionQuality = a3;
}

- (double)destinationCompressionQuality
{
  return self->_destinationCompressionQuality;
}

- (void)setDestinationFormat:(int64_t)a3
{
  self->_destinationFormat = a3;
}

- (int64_t)destinationFormat
{
  return self->_destinationFormat;
}

- (void)setDestinationURL:(id)a3
{
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
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
  int64_t v4 = [(MSVArtworkServiceConversionRequest *)self destinationFormat];
  switch(v4)
  {
    case 2:
      v10 = NSString;
      uint64_t v11 = objc_opt_class();
      v7 = [(MSVArtworkServiceConversionRequest *)self sourceURL];
      v8 = [(MSVArtworkServiceConversionRequest *)self destinationURL];
      [v10 stringWithFormat:@"<%@: %p>\nsourceURL: %@\ndestinationURL: %@\ndestinationFormat: ASTC", v11, self, v7, v8, v16];
      goto LABEL_7;
    case 1:
      v12 = NSString;
      uint64_t v13 = objc_opt_class();
      v7 = [(MSVArtworkServiceConversionRequest *)self sourceURL];
      v8 = [(MSVArtworkServiceConversionRequest *)self destinationURL];
      [v12 stringWithFormat:@"<%@: %p>\nsourceURL: %@\ndestinationURL: %@\ndestinationFormat: PNG", v13, self, v7, v8, v16];
      goto LABEL_7;
    case 0:
      v5 = NSString;
      uint64_t v6 = objc_opt_class();
      v7 = [(MSVArtworkServiceConversionRequest *)self sourceURL];
      v8 = [(MSVArtworkServiceConversionRequest *)self destinationURL];
      [(MSVArtworkServiceConversionRequest *)self destinationCompressionQuality];
      [v5 stringWithFormat:@"<%@: %p>\nsourceURL: %@\ndestinationURL: %@\ndestinationCompressionQuality: %g\ndestinationFormat: JPEG", v6, self, v7, v8, v9];
      v14 = LABEL_7:;

      goto LABEL_9;
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"MSVArtworkServiceConversionRequest.m" lineNumber:83 description:@"Unknown MSVImageFormat"];
  v14 = 0;
LABEL_9:

  return v14;
}

- (int64_t)operationPriority
{
  return 4;
}

- (Class)operationClass
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MSVArtworkServiceConversionRequest;
  id v4 = a3;
  [(MSVArtworkServiceRequest *)&v8 encodeWithCoder:v4];
  v5 = [(MSVArtworkServiceConversionRequest *)self sourceURL];
  [v4 encodeObject:v5 forKey:@"MSVArtworkServiceConversionRequestSourceURL"];

  uint64_t v6 = [(MSVArtworkServiceConversionRequest *)self destinationURL];
  [v4 encodeObject:v6 forKey:@"MSVArtworkServiceConversionRequestDestinationURL"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MSVArtworkServiceConversionRequest destinationFormat](self, "destinationFormat"), @"MSVArtworkServiceConversionRequestDestinationFormat");
  [(MSVArtworkServiceConversionRequest *)self destinationCompressionQuality];
  *(float *)&double v7 = v7;
  [v4 encodeFloat:@"MSVArtworkServiceConversionRequestDestinationCompressionQuality" forKey:v7];
}

- (MSVArtworkServiceConversionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSVArtworkServiceConversionRequest;
  v5 = [(MSVArtworkServiceRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSVArtworkServiceConversionRequestSourceURL"];
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSVArtworkServiceConversionRequestDestinationURL"];
    destinationURL = v5->_destinationURL;
    v5->_destinationURL = (NSURL *)v8;

    v5->_destinationFormat = [v4 decodeIntegerForKey:@"MSVArtworkServiceConversionRequestDestinationFormat"];
    [v4 decodeFloatForKey:@"MSVArtworkServiceConversionRequestDestinationCompressionQuality"];
    v5->_destinationCompressionQuality = v10;
  }

  return v5;
}

- (MSVArtworkServiceConversionRequest)initWithSourceURL:(id)a3 destinationURL:(id)a4 destinationFormat:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MSVArtworkServiceConversionRequest;
  float v10 = [(MSVArtworkServiceRequest *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    sourceURL = v10->_sourceURL;
    v10->_sourceURL = (NSURL *)v11;

    uint64_t v13 = [v9 copy];
    destinationURL = v10->_destinationURL;
    v10->_destinationURL = (NSURL *)v13;

    v10->_destinationFormat = a5;
    [(MSVArtworkServiceRequest *)v10 addSandboxExtensionIfNeededForURL:v10->_sourceURL];
    v15 = [(NSURL *)v10->_destinationURL URLByDeletingLastPathComponent];
    [(MSVArtworkServiceRequest *)v10 addSandboxExtensionIfNeededForURL:v15];
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end