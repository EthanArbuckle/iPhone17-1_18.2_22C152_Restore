@interface MRNowPlayingArtworkImage
- (BOOL)hasArtworkData;
- (BOOL)isEqual:(id)a3;
- (MRNowPlayingArtworkImage)initWithImageData:(id)a3 mimeType:(id)a4;
- (NSData)imageData;
- (NSString)mimeType;
- (id)copyImageData;
- (id)description;
- (unsigned)type;
@end

@implementation MRNowPlayingArtworkImage

- (MRNowPlayingArtworkImage)initWithImageData:(id)a3 mimeType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRNowPlayingArtworkImage;
  v8 = [(MRNowPlayingArtworkImage *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    imageData = v8->_imageData;
    v8->_imageData = (NSData *)v9;

    uint64_t v11 = [v7 copy];
    mimeType = v8->_mimeType;
    v8->_mimeType = (NSString *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    imageData = self->_imageData;
    id v6 = [v4 imageData];
    BOOL v7 = [(NSData *)imageData isEqualToData:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unsigned)type
{
  return 1;
}

- (BOOL)hasArtworkData
{
  return [(NSData *)self->_imageData length] != 0;
}

- (id)copyImageData
{
  return (id)[(NSData *)self->_imageData copy];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = objc_opt_class();
  StringRepresentation = (void *)MRDataCreateStringRepresentation(self->_imageData);
  id v6 = (void *)[v3 initWithFormat:@"%@:%p %@\n", v4, self, StringRepresentation];

  BOOL v7 = +[MRUserSettings currentSettings];
  if ([v7 shouldLogArtwork])
  {
    v8 = (__CFString *)MRCreateASCIIRepresentationFromImageData((const __CFData *)self->_imageData);
    [v6 appendFormat:@"%@\n", v8];
  }

  return v6;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimeType, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

@end