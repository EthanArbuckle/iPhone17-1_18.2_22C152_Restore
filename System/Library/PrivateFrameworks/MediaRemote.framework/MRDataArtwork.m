@interface MRDataArtwork
- (CGSize)dimensions;
- (MRDataArtwork)initWithImageData:(id)a3;
- (MRDataArtwork)initWithProtobuf:(id)a3;
- (NSData)imageData;
- (id)description;
@end

@implementation MRDataArtwork

- (MRDataArtwork)initWithImageData:(id)a3
{
  if (a3)
  {
    v4 = (void *)[a3 copy];
    id v16 = 0;
    +[MRImageUtilities imageDimensionsForImageData:v4 error:&v16];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    id v9 = v16;
    if (v9)
    {
      v10 = _MRLogForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MRArtwork setImageData:](v10);
      }

      v11 = 0;
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)MRDataArtwork;
      v12 = [(MRDataArtwork *)&v15 init];
      v13 = v12;
      if (v12)
      {
        objc_storeStrong((id *)&v12->_imageData, v4);
        v13->_dimensions.width = v6;
        v13->_dimensions.height = v8;
      }
      self = v13;
      v11 = self;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  double v5 = [(MRDataArtwork *)self imageData];
  [(MRDataArtwork *)self dimensions];
  uint64_t v7 = v6;
  [(MRDataArtwork *)self dimensions];
  id v9 = (void *)[v3 initWithFormat:@"<%@: data=%@, dim={%g,%g}", v4, v5, v7, v8];

  return v9;
}

- (MRDataArtwork)initWithProtobuf:(id)a3
{
  id v4 = a3;
  double v5 = [v4 imageData];

  if (v5)
  {
    uint64_t v6 = [v4 imageData];
    uint64_t v7 = [(MRDataArtwork *)self initWithImageData:v6];

    self = v7;
    double v5 = self;
  }

  return v5;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (CGSize)dimensions
{
  double width = self->_dimensions.width;
  double height = self->_dimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end