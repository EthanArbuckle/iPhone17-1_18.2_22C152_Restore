@interface MSVArtworkServiceResizeRequestDestination
+ (BOOL)supportsSecureCoding;
+ (id)destinationWithFormat:(int64_t)a3 size:(CGSize)a4 url:(id)a5;
+ (id)jpegDestinationWithSize:(CGSize)a3 compressionQuality:(double)a4 url:(id)a5;
- (CGSize)size;
- (MSVArtworkServiceResizeRequestDestination)initWithCoder:(id)a3;
- (MSVArtworkServiceResizeRequestDestination)initWithFormat:(int64_t)a3 size:(CGSize)a4 compressionQuality:(double)a5 destinationURL:(id)a6;
- (NSURL)destinationURL;
- (double)compressionQuality;
- (id)description;
- (int64_t)format;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSVArtworkServiceResizeRequestDestination

- (void).cxx_destruct
{
}

- (double)compressionQuality
{
  return self->_compressionQuality;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)format
{
  return self->_format;
}

- (id)description
{
  int64_t v4 = [(MSVArtworkServiceResizeRequestDestination *)self format];
  switch(v4)
  {
    case 2:
      v14 = NSString;
      [(MSVArtworkServiceResizeRequestDestination *)self size];
      uint64_t v16 = v15;
      [(MSVArtworkServiceResizeRequestDestination *)self size];
      uint64_t v18 = v17;
      v12 = [(MSVArtworkServiceResizeRequestDestination *)self destinationURL];
      v13 = [v12 absoluteString];
      [v14 stringWithFormat:@"<size={%g, %g} format=ASTC -- %@>", v16, v18, v13, v26];
      goto LABEL_7;
    case 1:
      v19 = NSString;
      [(MSVArtworkServiceResizeRequestDestination *)self size];
      uint64_t v21 = v20;
      [(MSVArtworkServiceResizeRequestDestination *)self size];
      uint64_t v23 = v22;
      v12 = [(MSVArtworkServiceResizeRequestDestination *)self destinationURL];
      v13 = [v12 absoluteString];
      [v19 stringWithFormat:@"<size={%g, %g} format=PNG -- %@>", v21, v23, v13, v26];
      goto LABEL_7;
    case 0:
      v5 = NSString;
      [(MSVArtworkServiceResizeRequestDestination *)self size];
      uint64_t v7 = v6;
      [(MSVArtworkServiceResizeRequestDestination *)self size];
      uint64_t v9 = v8;
      [(MSVArtworkServiceResizeRequestDestination *)self compressionQuality];
      uint64_t v11 = v10;
      v12 = [(MSVArtworkServiceResizeRequestDestination *)self destinationURL];
      v13 = [v12 absoluteString];
      [v5 stringWithFormat:@"<size={%g, %g} quality=%g format=JPEG -- %@>", v7, v9, v11, v13];
      v24 = LABEL_7:;

      goto LABEL_9;
  }
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2 object:self file:@"MSVArtworkServiceResizeRequest.m" lineNumber:88 description:@"Unknown MSVImageFormat"];
  v24 = 0;
LABEL_9:

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  [(MSVArtworkServiceResizeRequestDestination *)self size];
  *(float *)&double v4 = v4;
  [v9 encodeFloat:@"MSVArtworkServiceResizeRequestDestinationSizeWidth" forKey:v4];
  [(MSVArtworkServiceResizeRequestDestination *)self size];
  *(float *)&double v6 = v5;
  [v9 encodeFloat:@"MSVArtworkServiceResizeRequestDestinationSizeHeight" forKey:v6];
  [(MSVArtworkServiceResizeRequestDestination *)self compressionQuality];
  *(float *)&double v7 = v7;
  [v9 encodeFloat:@"MSVArtworkServiceResizeRequestDestinationCompressionQuality" forKey:v7];
  uint64_t v8 = [(MSVArtworkServiceResizeRequestDestination *)self destinationURL];
  [v9 encodeObject:v8 forKey:@"MSVArtworkServiceResizeRequestDestinationURL"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[MSVArtworkServiceResizeRequestDestination format](self, "format"), @"MSVArtworkServiceResizeRequestDestinationFormat");
}

- (MSVArtworkServiceResizeRequestDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSVArtworkServiceResizeRequestDestination;
  double v5 = [(MSVArtworkServiceResizeRequestDestination *)&v13 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"MSVArtworkServiceResizeRequestDestinationSizeWidth"];
    CGFloat v7 = v6;
    [v4 decodeFloatForKey:@"MSVArtworkServiceResizeRequestDestinationSizeHeight"];
    v5->_size.double width = v7;
    v5->_size.double height = v8;
    [v4 decodeFloatForKey:@"MSVArtworkServiceResizeRequestDestinationCompressionQuality"];
    v5->_compressionQuality = v9;
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSVArtworkServiceResizeRequestDestinationURL"];
    destinationURL = v5->_destinationURL;
    v5->_destinationURL = (NSURL *)v10;

    v5->_format = [v4 decodeIntegerForKey:@"MSVArtworkServiceResizeRequestDestinationFormat"];
  }

  return v5;
}

- (MSVArtworkServiceResizeRequestDestination)initWithFormat:(int64_t)a3 size:(CGSize)a4 compressionQuality:(double)a5 destinationURL:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MSVArtworkServiceResizeRequestDestination;
  objc_super v13 = [(MSVArtworkServiceResizeRequestDestination *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_size.CGFloat width = width;
    v13->_size.CGFloat height = height;
    v13->_compressionQuality = a5;
    objc_storeStrong((id *)&v13->_destinationURL, a6);
    v14->_format = a3;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)jpegDestinationWithSize:(CGSize)a3 compressionQuality:(double)a4 url:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a5;
  float v9 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFormat:size:compressionQuality:destinationURL:", 0, v8, width, height, a4);

  return v9;
}

+ (id)destinationWithFormat:(int64_t)a3 size:(CGSize)a4 url:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a5;
  float v9 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFormat:size:compressionQuality:destinationURL:", a3, v8, width, height, 0.0);

  return v9;
}

@end